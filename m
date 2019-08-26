Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926359D4D6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 19:22:52 +0200 (CEST)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Ihf-00034g-3A
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 13:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i2Ifd-0001sC-99
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 13:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i2Ifc-0002tM-5p
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 13:20:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:36862)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i2Ifc-0002se-0O
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 13:20:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i2Ifb-0000nx-2K
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 17:20:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 007962E80CC
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 17:20:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Aug 2019 17:09:29 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc ajbennee rth
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <156683160080.31851.8159878323909291412.malonedeb@soybean.canonical.com>
Message-Id: <156683936980.3485.7001675352238859641.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19031";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: fe77f86e085c9caefeb7c920f962d03cad3f649f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1841442] Re: floating point emulation can fail to
 set FE_INEXACT
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
Reply-To: Bug 1841442 <1841442@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch for ppc:
https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05532.html

Fixing x86_64 is significantly harder, as support for fp exceptions
is completely lacking in the code currently.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1841442

Title:
  floating point emulation can fail to set FE_INEXACT

Status in QEMU:
  Confirmed

Bug description:
  Floating point emulation can fail to set FE_INEXACT in some
  circumstances. This shows up quite often in glibc's "math" tests.  A
  similar test is attached.

  On ppc64le native:
  --
  $ gcc nextafter.c -o nextafter -lm
  $ ./nextafter $(./nextafter)
  0x0000000000000001 0.000000
  0x0

  0xa000000
  FE_INEXACT FE_UNDERFLOW
  0x0000000000000000 0.000000
  --

  On x86_64:
  --
  $ gcc nextafter.c -o nextafter -lm
  $ ./nextafter $(./nextafter)
  0x0000000000000001 0.000000
  0x0

  0x30
  FE_INEXACT FE_UNDERFLOW =

  0x0000000000000000 0.000000
  --

  Using qemu-system-ppc64
  --
  $ ./nextafter $(./nextafter)
  0x0000000000000001 0.000000
  0x0

  0x8000000
  FE_UNDERFLOW =

  0x0000000000000000 0.000000
  --

  Using qemu-x86_64:
  --
  $ ./nextafter $(./nextafter)
  0x0000000000000001 0.000000
  0x0

  0x0

  0x0000000000000000 0.000000
  --

  QEMU versions vary, but not too much, and are pretty close to git HEAD:
  - 586f3dced9 (HEAD -> master, origin/master, origin/HEAD) Merge remote-tr=
acking branch 'remotes/cohuck/tags/s390x-20190822' into staging
  - 864ab31 Update version for v4.1.0-rc4 release

  Since the issue happens nearly identically on different targets, I
  suspect the issue lies somewhere in fpu/softfloat.c.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1841442/+subscriptions

