Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E829E9B7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 15:42:32 +0200 (CEST)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2bk0-0004WO-2b
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 09:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i2biO-0003Wi-Dw
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:40:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i2biN-0007mN-9V
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:40:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:46212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i2biN-0007ly-34
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:40:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i2biM-0000Kv-Bl
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 13:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 57C4B2E80C7
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 13:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Aug 2019 13:26:40 -0000
From: Paul Clarke <pc@us.ibm.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: Paul Clarke (7-pc)
References: <156691209320.18814.746226319480624520.malonedeb@soybean.canonical.com>
Message-Id: <156691240007.5168.326712007969197233.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19034";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 14db4dc359edb0fad579e2bad29532ccfdfd3c67
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1841592] Re: ppc: softfloat float implementation
 issues
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
Reply-To: Bug 1841592 <1841592@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-- ppc64le native:
$ gcc -c -O2 ffma.c
$ gcc -O2 test-ffma.c ffma.o -lm -o test-ffma
$ ./test-ffma $(./test-ffma)
ffma(0x1p-149, 0x1p-149, 0x1p-149)
0x0

0xa000000
FE_INEXACT FE_UNDERFLOW =

0x1p-149

-- qemu-system-ppc64:
$ ./test-ffma $(./test-ffma)
ffma(0x1p-149, 0x1p-149, 0x1p-149)
0x0

0x2000000
FE_INEXACT =

0x1p-149


** Attachment added: "2nd file of float test case"
   https://bugs.launchpad.net/qemu/+bug/1841592/+attachment/5284931/+files/=
ffma.c

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1841592

Title:
  ppc: softfloat float implementation issues

Status in QEMU:
  New

Bug description:
  Per bug #1841491, Richard Henderson (rth) said:
  > The float test failure is part of a larger problem for target/powerpc
  > in which all float routines are implemented incorrectly. They are all
  > implemented as double operations with rounding to float as a second
  > step. Which not only produces incorrect exceptions, as in this case,
  > but incorrect numerical results from the double rounding.
  >
  > This should probably be split to a separate bug...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1841592/+subscriptions

