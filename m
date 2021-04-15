Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D91360332
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 09:21:59 +0200 (CEST)
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWwK6-0006lB-Ec
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 03:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWwIz-0006GR-Pg
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:20:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:51484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWwIv-0006l6-GP
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 03:20:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWwIp-0006bF-QX
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 07:20:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C39272E8157
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 07:20:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Apr 2021 07:13:06 -0000
From: Yasuhiro Horimoto <1924231@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: qemu-20.04
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: komainu8
X-Launchpad-Bug-Reporter: Yasuhiro Horimoto (komainu8)
X-Launchpad-Bug-Modifier: Yasuhiro Horimoto (komainu8)
Message-Id: <161847078655.9804.17558214593383622441.malonedeb@gac.canonical.com>
Subject: [Bug 1924231] [NEW] Getting "qemu: uncaught target signal 11
 (Segmentation fault)" when the installing "libc-bin" which "wget" depends on.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="929bdb49da44562d032228b8f93c5c598dae8678"; Instance="production"
X-Launchpad-Hash: 6f11e15f556806cb7c1047e5df94bd3de10958d0
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1924231 <1924231@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

the QEMU release version where the bug was found.

apt list --installed | grep qemu
qemu-user-static/focal-updates,focal-security,now 1:4.2-3ubuntu6.14 amd64 [=
installed]


The installing "libc-bin" which "wget" depends on crashes as below when we =
execute docker image of Debian GNU/Linux bullseye for ARM64 on Ubuntu 20.04=
 for AMD64.
This problem also occurs on CI(GitHub Actions)(https://github.com/groonga/g=
roonga/runs/2338497272?check_suite_focus=3Dtrue#step:11:127).
Probably, The cause of this crash is https://bugs.launchpad.net/qemu/+bug/1=
749393.
This bug has already been fixed in qemu-user-static pacakge for Ubuntu 20.1=
0.

However, this fix is not included in qemu-user-static pacakge for Ubuntu 20=
.04.
Currently, GitHub Actions does not support Ubuntu 20.10.
Therefore, this problem is still happening in CI.

Would it be possible for you to backport this fix into Ubuntu 20.04?


How to reproduce:

sudo apt install -y qemu-user-static docker.io
sudo docker run --rm arm64v8/debian:bullseye bash -c 'apt update && apt ins=
tall -y wget'

WARNING: apt does not have a stable CLI interface. Use with caution in
scripts.

Get:1 http://deb.debian.org/debian bullseye InRelease [142 kB]
Get:2 http://security.debian.org/debian-security bullseye-security InReleas=
e [44.1 kB]
Get:3 http://deb.debian.org/debian bullseye-updates InRelease [40.1 kB]
Get:4 http://deb.debian.org/debian bullseye/main arm64 Packages [8084 kB]
Get:5 http://security.debian.org/debian-security bullseye-security/main arm=
64 Packages [808 B]
Fetched 8311 kB in 4s (2001 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
2 packages can be upgraded. Run 'apt list --upgradable' to see them.

WARNING: apt does not have a stable CLI interface. Use with caution in
scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  ca-certificates libpsl5 openssl publicsuffix
The following NEW packages will be installed:
  ca-certificates libpsl5 openssl publicsuffix wget
0 upgraded, 5 newly installed, 0 to remove and 2 not upgraded.
Need to get 2111 kB of archives.
After this operation, 5844 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bullseye/main arm64 openssl arm64 1.1.1k=
-1 [829 kB]
Get:2 http://deb.debian.org/debian bullseye/main arm64 ca-certificates all =
20210119 [158 kB]
Get:3 http://deb.debian.org/debian bullseye/main arm64 libpsl5 arm64 0.21.0=
-1.2 [57.1 kB]
Get:4 http://deb.debian.org/debian bullseye/main arm64 wget arm64 1.21-1 [9=
46 kB]
Get:5 http://deb.debian.org/debian bullseye/main arm64 publicsuffix all 202=
10108.1309-1 [121 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 2111 kB in 0s (12.9 MB/s)
Selecting previously unselected package openssl.
(Reading database ... 6640 files and directories currently installed.)
Preparing to unpack .../openssl_1.1.1k-1_arm64.deb ...
Unpacking openssl (1.1.1k-1) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../ca-certificates_20210119_all.deb ...
Unpacking ca-certificates (20210119) ...
Selecting previously unselected package libpsl5:arm64.
Preparing to unpack .../libpsl5_0.21.0-1.2_arm64.deb ...
Unpacking libpsl5:arm64 (0.21.0-1.2) ...
Selecting previously unselected package wget.
Preparing to unpack .../archives/wget_1.21-1_arm64.deb ...
Unpacking wget (1.21-1) ...
Selecting previously unselected package publicsuffix.
Preparing to unpack .../publicsuffix_20210108.1309-1_all.deb ...
Unpacking publicsuffix (20210108.1309-1) ...
Setting up libpsl5:arm64 (0.21.0-1.2) ...
Setting up wget (1.21-1) ...
Setting up openssl (1.1.1k-1) ...
Setting up publicsuffix (20210108.1309-1) ...
Setting up ca-certificates (20210119) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install th=
e Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/aarch64-l=
inux-gnu/perl/5.32.1 /usr/local/share/perl/5.32.1 /usr/lib/aarch64-linux-gn=
u/perl5/5.32 /usr/share/perl5 /usr/lib/aarch64-linux-gnu/perl-base /usr/lib=
/aarch64-linux-gnu/perl/5.32 /usr/share/perl/5.32 /usr/local/lib/site_perl)=
 at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Updating certificates in /etc/ssl/certs...
129 added, 0 removed; done.
Processing triggers for libc-bin (2.31-11) ...
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault
dpkg: error processing package libc-bin (--configure):
 installed libc-bin package post-installation script subprocess returned er=
ror exit status 139
Processing triggers for ca-certificates (20210119) ...
Updating certificates in /etc/ssl/certs...
0 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
Errors were encountered while processing:
 libc-bin
E: Sub-process /usr/bin/dpkg returned an error code (1)

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: qemu-20.04

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924231

Title:
  Getting "qemu: uncaught target signal 11 (Segmentation fault)" when
  the installing "libc-bin" which "wget" depends on.

Status in QEMU:
  New

Bug description:
  the QEMU release version where the bug was found.

  apt list --installed | grep qemu
  qemu-user-static/focal-updates,focal-security,now 1:4.2-3ubuntu6.14 amd64=
 [installed]

  =

  The installing "libc-bin" which "wget" depends on crashes as below when w=
e execute docker image of Debian GNU/Linux bullseye for ARM64 on Ubuntu 20.=
04 for AMD64.
  This problem also occurs on CI(GitHub Actions)(https://github.com/groonga=
/groonga/runs/2338497272?check_suite_focus=3Dtrue#step:11:127).
  Probably, The cause of this crash is https://bugs.launchpad.net/qemu/+bug=
/1749393.
  This bug has already been fixed in qemu-user-static pacakge for Ubuntu 20=
.10.

  However, this fix is not included in qemu-user-static pacakge for Ubuntu =
20.04.
  Currently, GitHub Actions does not support Ubuntu 20.10.
  Therefore, this problem is still happening in CI.

  Would it be possible for you to backport this fix into Ubuntu 20.04?

  =

  How to reproduce:

  sudo apt install -y qemu-user-static docker.io
  sudo docker run --rm arm64v8/debian:bullseye bash -c 'apt update && apt i=
nstall -y wget'

  WARNING: apt does not have a stable CLI interface. Use with caution in
  scripts.

  Get:1 http://deb.debian.org/debian bullseye InRelease [142 kB]
  Get:2 http://security.debian.org/debian-security bullseye-security InRele=
ase [44.1 kB]
  Get:3 http://deb.debian.org/debian bullseye-updates InRelease [40.1 kB]
  Get:4 http://deb.debian.org/debian bullseye/main arm64 Packages [8084 kB]
  Get:5 http://security.debian.org/debian-security bullseye-security/main a=
rm64 Packages [808 B]
  Fetched 8311 kB in 4s (2001 kB/s)
  Reading package lists...
  Building dependency tree...
  Reading state information...
  2 packages can be upgraded. Run 'apt list --upgradable' to see them.

  WARNING: apt does not have a stable CLI interface. Use with caution in
  scripts.

  Reading package lists...
  Building dependency tree...
  Reading state information...
  The following additional packages will be installed:
    ca-certificates libpsl5 openssl publicsuffix
  The following NEW packages will be installed:
    ca-certificates libpsl5 openssl publicsuffix wget
  0 upgraded, 5 newly installed, 0 to remove and 2 not upgraded.
  Need to get 2111 kB of archives.
  After this operation, 5844 kB of additional disk space will be used.
  Get:1 http://deb.debian.org/debian bullseye/main arm64 openssl arm64 1.1.=
1k-1 [829 kB]
  Get:2 http://deb.debian.org/debian bullseye/main arm64 ca-certificates al=
l 20210119 [158 kB]
  Get:3 http://deb.debian.org/debian bullseye/main arm64 libpsl5 arm64 0.21=
.0-1.2 [57.1 kB]
  Get:4 http://deb.debian.org/debian bullseye/main arm64 wget arm64 1.21-1 =
[946 kB]
  Get:5 http://deb.debian.org/debian bullseye/main arm64 publicsuffix all 2=
0210108.1309-1 [121 kB]
  debconf: delaying package configuration, since apt-utils is not installed
  Fetched 2111 kB in 0s (12.9 MB/s)
  Selecting previously unselected package openssl.
  (Reading database ... 6640 files and directories currently installed.)
  Preparing to unpack .../openssl_1.1.1k-1_arm64.deb ...
  Unpacking openssl (1.1.1k-1) ...
  Selecting previously unselected package ca-certificates.
  Preparing to unpack .../ca-certificates_20210119_all.deb ...
  Unpacking ca-certificates (20210119) ...
  Selecting previously unselected package libpsl5:arm64.
  Preparing to unpack .../libpsl5_0.21.0-1.2_arm64.deb ...
  Unpacking libpsl5:arm64 (0.21.0-1.2) ...
  Selecting previously unselected package wget.
  Preparing to unpack .../archives/wget_1.21-1_arm64.deb ...
  Unpacking wget (1.21-1) ...
  Selecting previously unselected package publicsuffix.
  Preparing to unpack .../publicsuffix_20210108.1309-1_all.deb ...
  Unpacking publicsuffix (20210108.1309-1) ...
  Setting up libpsl5:arm64 (0.21.0-1.2) ...
  Setting up wget (1.21-1) ...
  Setting up openssl (1.1.1k-1) ...
  Setting up publicsuffix (20210108.1309-1) ...
  Setting up ca-certificates (20210119) ...
  debconf: unable to initialize frontend: Dialog
  debconf: (TERM is not set, so the dialog frontend is not usable.)
  debconf: falling back to frontend: Readline
  debconf: unable to initialize frontend: Readline
  debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install =
the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/aarch64=
-linux-gnu/perl/5.32.1 /usr/local/share/perl/5.32.1 /usr/lib/aarch64-linux-=
gnu/perl5/5.32 /usr/share/perl5 /usr/lib/aarch64-linux-gnu/perl-base /usr/l=
ib/aarch64-linux-gnu/perl/5.32 /usr/share/perl/5.32 /usr/local/lib/site_per=
l) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
  debconf: falling back to frontend: Teletype
  Updating certificates in /etc/ssl/certs...
  129 added, 0 removed; done.
  Processing triggers for libc-bin (2.31-11) ...
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault
  dpkg: error processing package libc-bin (--configure):
   installed libc-bin package post-installation script subprocess returned =
error exit status 139
  Processing triggers for ca-certificates (20210119) ...
  Updating certificates in /etc/ssl/certs...
  0 added, 0 removed; done.
  Running hooks in /etc/ca-certificates/update.d...
  done.
  Errors were encountered while processing:
   libc-bin
  E: Sub-process /usr/bin/dpkg returned an error code (1)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924231/+subscriptions

