Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B23B0370
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:56:51 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvf1O-0003u2-9a
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvf0S-00038b-Mp
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:55:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:47140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvf0O-0006E1-C0
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:55:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvf0L-0004z9-29
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 11:55:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 279312E8186
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 11:55:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 11:46:55 -0000
From: John Paul Adrian Glaubitz <1836763@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user m68k
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: glaubitz janitor th-huth
X-Launchpad-Bug-Reporter: John Paul Adrian Glaubitz (glaubitz)
X-Launchpad-Bug-Modifier: John Paul Adrian Glaubitz (glaubitz)
References: <156328885828.28617.11205877889338881511.malonedeb@wampee.canonical.com>
Message-Id: <162436241623.7922.16805798420852217152.launchpad@wampee.canonical.com>
Subject: [Bug 1836763] Re: Firebird crashes on qemu-m68k-user with
 pthread_mutex_init error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9dbb463b42239a8426ed781b3086dde814e80a01"; Instance="production"
X-Launchpad-Hash: 9daa8b511aca4896972d3ac309897d6dfeb65e3e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1836763 <1836763@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Expired =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1836763

Title:
  Firebird crashes on qemu-m68k-user with pthread_mutex_init error

Status in QEMU:
  New

Bug description:
  Trying to use the Firebird database on qemu-m68k-user with a Debian
  chroot fails with the database crashing with "ConfigStorage: mutex
  pthread_mutex_init error, status =3D 95":

  (sid-m68k-sbuild)root@epyc:/# apt install firebird3.0-server
  Reading package lists... Done
  Building dependency tree       =

  Reading state information... Done
  The following packages were automatically installed and are no longer req=
uired:
    cpio libip4tc0
  Use 'apt autoremove' to remove them.
  The following additional packages will be installed:
    firebird3.0-common firebird3.0-common-doc firebird3.0-server-core fireb=
ird3.0-utils libfbclient2 libib-util
  Suggested packages:
    firebird3.0-doc
  The following NEW packages will be installed:
    firebird3.0-common firebird3.0-common-doc firebird3.0-server firebird3.=
0-server-core firebird3.0-utils libfbclient2 libib-util
  0 upgraded, 7 newly installed, 0 to remove and 4 not upgraded.
  Need to get 4,051 kB of archives.
  After this operation, 15.9 MB of additional disk space will be used.
  Do you want to continue? [Y/n] =

  Get:1 http://ftp.ports.debian.org/debian-ports unstable/main m68k firebir=
d3.0-common-doc all 3.0.5.33100.ds4-3 [35.3 kB]
  Get:2 http://ftp.ports.debian.org/debian-ports unstable/main m68k firebir=
d3.0-common all 3.0.5.33100.ds4-3 [14.5 kB]
  Get:3 http://ftp.ports.debian.org/debian-ports unstable/main m68k libfbcl=
ient2 m68k 3.0.5.33100.ds4-3 [496 kB]
  Get:4 http://ftp.ports.debian.org/debian-ports unstable/main m68k libib-u=
til m68k 3.0.5.33100.ds4-3 [3,220 B]
  Get:5 http://ftp.ports.debian.org/debian-ports unstable/main m68k firebir=
d3.0-server-core m68k 3.0.5.33100.ds4-3 [2,368 kB]
  Get:6 http://ftp.ports.debian.org/debian-ports unstable/main m68k firebir=
d3.0-utils m68k 3.0.5.33100.ds4-3 [770 kB]
  Get:7 http://ftp.ports.debian.org/debian-ports unstable/main m68k firebir=
d3.0-server m68k 3.0.5.33100.ds4-3 [365 kB]
  Fetched 4,051 kB in 2s (1,803 kB/s)          =

  debconf: delaying package configuration, since apt-utils is not installed
  E: Can not write log (Is /dev/pts mounted?) - posix_openpt (19: No such d=
evice)
  Selecting previously unselected package firebird3.0-common-doc.
  (Reading database ... 33605 files and directories currently installed.)
  Preparing to unpack .../0-firebird3.0-common-doc_3.0.5.33100.ds4-3_all.de=
b ...
  Unpacking firebird3.0-common-doc (3.0.5.33100.ds4-3) ...
  Selecting previously unselected package firebird3.0-common.
  Preparing to unpack .../1-firebird3.0-common_3.0.5.33100.ds4-3_all.deb ...
  Unpacking firebird3.0-common (3.0.5.33100.ds4-3) ...
  Selecting previously unselected package libfbclient2:m68k.
  Preparing to unpack .../2-libfbclient2_3.0.5.33100.ds4-3_m68k.deb ...
  Unpacking libfbclient2:m68k (3.0.5.33100.ds4-3) ...
  Selecting previously unselected package libib-util:m68k.
  Preparing to unpack .../3-libib-util_3.0.5.33100.ds4-3_m68k.deb ...
  Unpacking libib-util:m68k (3.0.5.33100.ds4-3) ...
  Selecting previously unselected package firebird3.0-server-core:m68k.
  Preparing to unpack .../4-firebird3.0-server-core_3.0.5.33100.ds4-3_m68k.=
deb ...
  Unpacking firebird3.0-server-core:m68k (3.0.5.33100.ds4-3) ...
  Selecting previously unselected package firebird3.0-utils.
  Preparing to unpack .../5-firebird3.0-utils_3.0.5.33100.ds4-3_m68k.deb ...
  Unpacking firebird3.0-utils (3.0.5.33100.ds4-3) ...
  Selecting previously unselected package firebird3.0-server.
  Preparing to unpack .../6-firebird3.0-server_3.0.5.33100.ds4-3_m68k.deb .=
..
  Unpacking firebird3.0-server (3.0.5.33100.ds4-3) ...
  Setting up firebird3.0-common-doc (3.0.5.33100.ds4-3) ...
  Setting up firebird3.0-common (3.0.5.33100.ds4-3) ...
  Setting up libib-util:m68k (3.0.5.33100.ds4-3) ...
  Setting up libfbclient2:m68k (3.0.5.33100.ds4-3) ...
  Setting up firebird3.0-utils (3.0.5.33100.ds4-3) ...
  Setting up firebird3.0-server-core:m68k (3.0.5.33100.ds4-3) ...
  Setting up firebird3.0-server (3.0.5.33100.ds4-3) ...
  debconf: unable to initialize frontend: Dialog
  debconf: (No usable dialog-like program is installed, so the dialog based=
 frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm li=
ne 76.)
  debconf: falling back to frontend: Readline
  Password for firebird 3.0
  -------------------------

  Firebird has a special user named SYSDBA, which is the user that has acce=
ss to all databases. SYSDBA can also create new databases and users. Becaus=
e of this, it is
  necessary to secure SYSDBA with a password.

  The password is stored in /etc/firebird/3.0/SYSDBA.password (readable onl=
y by root). You may modify it there (don't forget to update the security da=
tabase too, using the
  gsec utility), or you may use dpkg-reconfigure to update both.

  If you don't enter a password, a random one will be used (and stored
  in SYSDBA.password).

  Password for SYSDBA:

  adduser: Warning: The home directory `/var/lib/firebird' does not belong =
to the user you are currently creating.
  ConfigStorage: mutex pthread_mutex_init error, status =3D 95
  qemu: uncaught target signal 6 (Aborted) - core dumped
  Aborted
  dpkg: error processing package firebird3.0-server (--configure):
   installed firebird3.0-server package post-installation script subprocess=
 returned error exit status 134
  Processing triggers for systemd (241-6+b2) ...
  Processing triggers for man-db (2.8.5-2) ...
  Not building database; man-db/auto-update is not 'true'.
  Processing triggers for libc-bin (2.28-10+qemu) ...
  Errors were encountered while processing:
   firebird3.0-server
  E: Sub-process /usr/bin/dpkg returned an error code (1)
  (sid-m68k-sbuild)root@epyc:/# SEC_SQL=3D/usr/share/firebird/3.0/security.=
sql T=3D/tmp/tmp.2kBDCgAevm T_SEC=3D/tmp/tmp.2kBDCgAevm/security.fdb isql-f=
b -q
  SQL> create database '/tmp/tmp.2kBDCgAevm/security.fdb';
  ConfigStorage: mutex pthread_mutex_init error, status =3D 95
  qemu: uncaught target signal 6 (Aborted) - core dumped
  Aborted
  (sid-m68k-sbuild)root@epyc:/#

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1836763/+subscriptions

