Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53499318F32
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:57:00 +0100 (CET)
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEKx-00057O-6Z
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lAEJk-0004f3-Ai
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:55:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:36242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lAEJi-0001aH-5S
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:55:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lAEJf-0007Ro-Rv
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:55:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D09B12E8072
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:55:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Feb 2021 15:49:47 -0000
From: Chris Pinnock <1914117@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrispinnock th-huth
X-Launchpad-Bug-Reporter: Chris Pinnock (chrispinnock)
X-Launchpad-Bug-Modifier: Chris Pinnock (chrispinnock)
References: <161221293549.4659.2173832767419505412.malonedeb@chaenomeles.canonical.com>
Message-Id: <161305858736.3400.15732871139813179407.malone@chaenomeles.canonical.com>
Subject: [Bug 1914117] Re: Short files returned via FTP on Qemu with various
 architectures and OSes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: e8045c0fe4755f69d3d461233abcb9b669f56e40
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
Reply-To: Bug 1914117 <1914117@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Writeup as promised.

Symptom: =

--------
Qemu on Mac OS X - both Catalina and Big Sur.
The issue occurs in both 5.2 and 4.2* branches of Qemu.

Applications such as ftp that read large amounts of data from the network =

may ignore valid data due to the Urgent flag being set on packets in the =

stream.

- Install a Unix VM (e.g. NetBSD, OpenBSD, etc) on Qemu using Mac OS X.
- Try to FTP a large file, such as =

		ftp://ftp.isc.org/isc/bind9/9.16.11/bind-9.16.11.tar.xz
  and you will be one byte short (not just this file, it's just an ex).

Synopsis: =

---------
- On inspection, the urgent flag is being set on the last packet of data
- As a result data is missing and is not received by the client app
  because it is considered out of band.
- poll() on Mac OS X has different behaviour to other Unices.
- towards the end of a stream, PRI and HUP are sent (whereas on FreeBSD
  and others it is not)
- as a result of PRI, the slirp library used in Qemu for the user =

  network interface adds an urgent bit to the relevant  packets

To see the different behaviour, we setup a server to serve a large file
and wrote a client to receive it, using poll() and dumping information abou=
t the flags.

Here is FreeBSD - the IN flag is set throughout.

ec2-user@freebsd:~/polltest $ ./a.out -w -P lXXX.net
Resolving lXXX.net: trying XXX.XXX.XXX.XXX... OK
FD 3 ready: POLLIN
Read 1024 byte(s)
FD 3 ready: POLLIN
Read 1024 total byte(s)
[snipped]

FD 3 ready: POLLIN
Read 102400 total byte(s)
ec2-user@freebsd:~/polltest $

Here is Mac OS X (Big Sur). You can see at the end of the stream,
both PRI & HUP are set.

Resolving lXXX.net: trying XXX.XXX.XXX.XXX .. OK
FD 5 ready: POLLIN =

Read 1024 byte(s)
[Snipped]

FD 5 ready: POLLIN =

Read 416 byte(s)
FD 5 ready: POLLIN POLLPRI POLLHUP =

Hangup on FD 5
Read 160 byte(s)
FD 5 ready: POLLIN POLLPRI POLLHUP =

Hangup on FD 5
Read 102400 total byte(s)

Towards a fix:
--------------
The following patch removes the symptom simply by ignoring these flags.
This is not necessarily the final answer, but we have run with this patch
for a couple of days and haven't seen any negative behaviour.

diff -ru qemu-5.2.0/slirp/src/slirp.c qemu-5.2.0-wrk/slirp/src/slirp.c
--- qemu-5.2.0/slirp/src/slirp.c	2021-02-10 11:02:07.000000000 +0000
+++ qemu-5.2.0-wrk/slirp/src/slirp.c	2021-02-10 13:07:17.000000000 +0000
@@ -23,7 +23,7 @@
  * THE SOFTWARE.
  */
 #include "slirp.h"
-
+#define IGNOREPOLLPRI
 =

 #ifndef _WIN32
 #include <net/if.h>
@@ -621,6 +621,8 @@
              * This will soread as well, so no need to
              * test for SLIRP_POLL_IN below if this succeeds
              */
+
+#ifndef IGNOREPOLLPRI
             if (revents & SLIRP_POLL_PRI) {
                ret =3D sorecvoob(so);
                if (ret < 0) {
@@ -633,6 +635,9 @@
              * Check sockets for reading
              */
             else if (revents & =

+#else
+            if (revents & =

+#endif
                      (SLIRP_POLL_IN | SLIRP_POLL_HUP | SLIRP_POLL_ERR)) {
                 /*
                  * Check for incoming connections


Adam Chappell figured most of this out (because a. he is (mostly) cleverer =
than me, b. he didn't sell his copy of Stevens UNIX Network Programming lik=
e I did in the 00s).

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914117

Title:
  Short files returned via FTP on Qemu with various architectures and
  OSes

Status in QEMU:
  New

Bug description:
  =

  Qemu 5.2 on Mac OS X Big Sur.

  I originally thought that it might be caused by the home-brew version of =
Qemu, but this evening I have removed the brew edition and compiled from sc=
ratch (using Ninja & Xcode compiler). =

  Still getting the same problem,.

  On the following architectures: =

  arm64, amd64 and sometimes i386 running NetBSD host OS; =

  i386 running OpenBSD host OS:

  I have seen a consistent problem with FTP returning short files. The
  file will be a couple of bytes too short. I do not believe this is a
  problem with the OS. Downloading the perl source code from CPAN does
  not work properly, nor does downloading bind from isc. I've tried this
  on different architectures as above.

  (Qemu 4.2 on Ubuntu/x86_64 with NetBSD/i386 seems to function fine. My
  gut feel is there is something not right on the Mac OS version of Qemu
  or a bug in 5.2 - obviously in the network layer somewhere. If you
  have anything you want me to try, please let me know - happy to help
  get a resolution.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914117/+subscriptions

