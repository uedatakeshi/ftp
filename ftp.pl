use strict;
use warnings;

use Net::FTP;

my $host = 'ftp.u-aizu.ac.jp';
my $user = 'anonymous';

my $ftp = Net::FTP->new($host)
  or die "Cannot connect to '$host': $!";

$ftp->login($user)
  or die "Cannot login '$host:$user':" . $ftp->message;

$ftp->cwd('/pub/CPAN')
  or die "FTP command fail: " . $ftp->message;

$ftp->get('index.html')
  or die "FTP command fail: " . $ftp->message;

$ftp->quit;
