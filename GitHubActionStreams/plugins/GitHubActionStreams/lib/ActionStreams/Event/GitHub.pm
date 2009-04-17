package ActionStreams::Event::GitHub;

use strict;
use base qw( ActionStreams::Event );

__PACKAGE__->install_properties({
    	class_type => 'github_actions',
});

sub encode_field_for_html 
{
    return shift->modify_title_field(@_);
}

sub modify_title_field
{
    my $event = shift;
    my ($field) = @_;
    my $value = ActionStreams::Event::encode_field_for_html($event, @_);
    return $field eq 'title' ? $event->drop_username($value) : $value;
}

sub drop_username
{
	my $self = shift;
    my ($text) = @_;
    return q{} unless defined $text;

	$text =~ s/^[^\s]+//;

	return $text;
}




1;

