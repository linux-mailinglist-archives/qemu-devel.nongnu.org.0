Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B306BFE4AD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 19:13:38 +0100 (CET)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVg6D-0005a3-KB
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 13:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iVg3T-0003Ao-L8
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:10:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iVg3S-0005Dn-8J
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:10:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:51026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iVg3S-0005DI-1v
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:10:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iVg3Q-0003uB-NA
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 18:10:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A76EF2E80C0
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 18:10:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 Nov 2019 18:00:47 -0000
From: Colin Ian King <1852781@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: colin-king
X-Launchpad-Bug-Reporter: Colin Ian King (colin-king)
X-Launchpad-Bug-Modifier: Colin Ian King (colin-king)
Message-Id: <157384084797.7162.9983011521410421204.malonedeb@gac.canonical.com>
Subject: [Bug 1852781] [NEW] qemu s390x on focal - applications breaking
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a8581d662ee900ac544fccf35130bcca67cc4125
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1852781 <1852781@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Running qemu-system-s390x (1:4.0+dfsg-0ubuntu10) on an x86-64 Focal host
with an upgrade of a Eoan s390x VM to a Focal s390x is triggering random
breakage, for example:

sudo apt-get update && sudo apt-get dist-upgrade

...
...

Unpacking debianutils (4.9) over (4.8.6.3) ...
Setting up debianutils (4.9) ...
Use of uninitialized value $ARGV[0] in string ne at /usr/sbin/update-mime l=
ine 43.
(Reading database ... 83640 files and directories currently installed.)
Preparing to unpack .../bash_5.0-5ubuntu1_s390x.deb ...
Unpacking bash (5.0-5ubuntu1) over (5.0-4ubuntu1) ...
Setting up bash (5.0-5ubuntu1) ...
[12124.788618] User process fault: interruption code 0007 ilc:3 in bash[2aa=
3d780000+149000]
dpkg: error processing package bash (--configure):
 installed bash package post-installation script subprocess was killed by s=
ignal (Floating point exception), core du
mped
Errors were encountered while processing:
 bash
E: Sub-process /usr/bin/dpkg returned an error code (1)

And now bash is completely broken:

cking@eoan-s390x:~$ bash
[12676.204389] User process fault: interruption code 0007 ilc:3 in bash[2aa=
14780000+149000]

Floating point exception (core dumped)

The upgrade works OK on a s390x, so I'm assuming it's something to do
with the qemu emulation.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1852781

Title:
  qemu s390x on focal - applications breaking

Status in QEMU:
  New

Bug description:
  Running qemu-system-s390x (1:4.0+dfsg-0ubuntu10) on an x86-64 Focal
  host with an upgrade of a Eoan s390x VM to a Focal s390x is triggering
  random breakage, for example:

  sudo apt-get update && sudo apt-get dist-upgrade

  ...
  ...

  Unpacking debianutils (4.9) over (4.8.6.3) ...
  Setting up debianutils (4.9) ...
  Use of uninitialized value $ARGV[0] in string ne at /usr/sbin/update-mime=
 line 43.
  (Reading database ... 83640 files and directories currently installed.)
  Preparing to unpack .../bash_5.0-5ubuntu1_s390x.deb ...
  Unpacking bash (5.0-5ubuntu1) over (5.0-4ubuntu1) ...
  Setting up bash (5.0-5ubuntu1) ...
  [12124.788618] User process fault: interruption code 0007 ilc:3 in bash[2=
aa3d780000+149000]
  dpkg: error processing package bash (--configure):
   installed bash package post-installation script subprocess was killed by=
 signal (Floating point exception), core du
  mped
  Errors were encountered while processing:
   bash
  E: Sub-process /usr/bin/dpkg returned an error code (1)

  And now bash is completely broken:

  cking@eoan-s390x:~$ bash
  [12676.204389] User process fault: interruption code 0007 ilc:3 in bash[2=
aa14780000+149000]

  Floating point exception (core dumped)

  The upgrade works OK on a s390x, so I'm assuming it's something to do
  with the qemu emulation.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1852781/+subscriptions

