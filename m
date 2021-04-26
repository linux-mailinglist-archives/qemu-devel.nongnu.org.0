Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE30036BA8D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 22:08:55 +0200 (CEST)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb7XK-0008Uh-Le
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 16:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lb7UO-0006yn-Od
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:05:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:42550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lb7UK-0001Ck-SO
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 16:05:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lb7UI-0002HI-DU
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 20:05:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5A6D62E8060
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 20:05:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Apr 2021 19:52:33 -0000
From: Aaron Simmons <1926202@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paleozogt
X-Launchpad-Bug-Reporter: Aaron Simmons (paleozogt)
X-Launchpad-Bug-Modifier: Aaron Simmons (paleozogt)
References: <161946668777.4160.5631099934527280207.malonedeb@gac.canonical.com>
Message-Id: <161946675320.10489.2543153289765319690.malone@soybean.canonical.com>
Subject: [Bug 1926202] Re: qemu-user can't run some ppc binaries
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: a5c30cbf547549509251fd54499cfe3e67b41f36
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
Reply-To: Bug 1926202 <1926202@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Attachment added: "ppc binary that crashes qemu-user"
   https://bugs.launchpad.net/qemu/+bug/1926202/+attachment/5492563/+files/=
helloworld-centos.static.ppc

** Description changed:

  qemu-user v6.0.0-rc5, built in static mode, will crash for certain ppc
  binaries.  It seems to have something to do with glibc for some Centos
  versions.  The problem is easiest to see with statically-linked
  binaries.
  =

  The attached Dockerfile shows how to produce a ppc binary that will
  crash qemu-user.  Here is how to reproduce the problem:
  =

  $ uname -m
  x86_64
  $ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
  $ docker build -t qemu-bug:centos -f Dockerfile.centos .
  $ docker run --rm -it -v$PWD:$PWD -w$PWD qemu-bug:centos cp /helloworld-c=
entos.static.ppc .
  $ qemu-ppc version 5.2.95 (v6.0.0-rc5)
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
  $ qemu-ppc-static ./helloworld-centos.static.ppc
  emu: uncaught target signal 4 (Illegal instruction) - core dumped
  [1]    16678 illegal hardware instruction (core dumped)  qemu-ppc-static =
./helloworld-centos.static.ppc
- =

- I can also provide the binary if necessary.

** Description changed:

  qemu-user v6.0.0-rc5, built in static mode, will crash for certain ppc
  binaries.  It seems to have something to do with glibc for some Centos
  versions.  The problem is easiest to see with statically-linked
  binaries.
  =

  The attached Dockerfile shows how to produce a ppc binary that will
  crash qemu-user.  Here is how to reproduce the problem:
  =

  $ uname -m
  x86_64
  $ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
  $ docker build -t qemu-bug:centos -f Dockerfile.centos .
  $ docker run --rm -it -v$PWD:$PWD -w$PWD qemu-bug:centos cp /helloworld-c=
entos.static.ppc .
- $ qemu-ppc version 5.2.95 (v6.0.0-rc5)
+ $ qemu-qemu-ppc-static --version
+ qemu-ppc version 5.2.95 (v6.0.0-rc5)
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
  $ qemu-ppc-static ./helloworld-centos.static.ppc
  emu: uncaught target signal 4 (Illegal instruction) - core dumped
  [1]    16678 illegal hardware instruction (core dumped)  qemu-ppc-static =
./helloworld-centos.static.ppc

** Description changed:

  qemu-user v6.0.0-rc5, built in static mode, will crash for certain ppc
  binaries.  It seems to have something to do with glibc for some Centos
  versions.  The problem is easiest to see with statically-linked
  binaries.
  =

  The attached Dockerfile shows how to produce a ppc binary that will
  crash qemu-user.  Here is how to reproduce the problem:
  =

  $ uname -m
  x86_64
+ =

  $ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
+ =

  $ docker build -t qemu-bug:centos -f Dockerfile.centos .
- $ docker run --rm -it -v$PWD:$PWD -w$PWD qemu-bug:centos cp /helloworld-c=
entos.static.ppc .
+ =

+ $ docker run --rm -it -v$PWD:$PWD -w$PWD qemu-bug:centos cp /helloworld-
+ centos.static.ppc .
+ =

  $ qemu-qemu-ppc-static --version
  qemu-ppc version 5.2.95 (v6.0.0-rc5)
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
+ =

  $ qemu-ppc-static ./helloworld-centos.static.ppc
  emu: uncaught target signal 4 (Illegal instruction) - core dumped
  [1]    16678 illegal hardware instruction (core dumped)  qemu-ppc-static =
./helloworld-centos.static.ppc

** Description changed:

  qemu-user v6.0.0-rc5, built in static mode, will crash for certain ppc
  binaries.  It seems to have something to do with glibc for some Centos
  versions.  The problem is easiest to see with statically-linked
  binaries.
  =

  The attached Dockerfile shows how to produce a ppc binary that will
  crash qemu-user.  Here is how to reproduce the problem:
  =

  $ uname -m
  x86_64
  =

  $ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
  =

  $ docker build -t qemu-bug:centos -f Dockerfile.centos .
  =

  $ docker run --rm -it -v$PWD:$PWD -w$PWD qemu-bug:centos cp /helloworld-
  centos.static.ppc .
  =

- $ qemu-qemu-ppc-static --version
+ $ qemu-ppc-static --version
  qemu-ppc version 5.2.95 (v6.0.0-rc5)
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
  =

  $ qemu-ppc-static ./helloworld-centos.static.ppc
  emu: uncaught target signal 4 (Illegal instruction) - core dumped
  [1]    16678 illegal hardware instruction (core dumped)  qemu-ppc-static =
./helloworld-centos.static.ppc

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926202

Title:
  qemu-user can't run some ppc binaries

Status in QEMU:
  New

Bug description:
  qemu-user v6.0.0-rc5, built in static mode, will crash for certain ppc
  binaries.  It seems to have something to do with glibc for some Centos
  versions.  The problem is easiest to see with statically-linked
  binaries.

  The attached Dockerfile shows how to produce a ppc binary that will
  crash qemu-user.  Here is how to reproduce the problem:

  $ uname -m
  x86_64

  $ docker run --rm --privileged multiarch/qemu-user-static --reset -p
  yes

  $ docker build -t qemu-bug:centos -f Dockerfile.centos .

  $ docker run --rm -it -v$PWD:$PWD -w$PWD qemu-bug:centos cp
  /helloworld-centos.static.ppc .

  $ qemu-ppc-static --version
  qemu-ppc version 5.2.95 (v6.0.0-rc5)
  Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

  $ qemu-ppc-static ./helloworld-centos.static.ppc
  emu: uncaught target signal 4 (Illegal instruction) - core dumped
  [1]    16678 illegal hardware instruction (core dumped)  qemu-ppc-static =
./helloworld-centos.static.ppc

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926202/+subscriptions

