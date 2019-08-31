Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E8A45AC
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Aug 2019 20:02:55 +0200 (CEST)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i47iA-0000hx-D0
	for lists+qemu-devel@lfdr.de; Sat, 31 Aug 2019 14:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i47gK-0000DG-AC
 for qemu-devel@nongnu.org; Sat, 31 Aug 2019 14:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i47gH-0004J0-Nw
 for qemu-devel@nongnu.org; Sat, 31 Aug 2019 14:01:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:51412)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i47gH-0004HP-FD
 for qemu-devel@nongnu.org; Sat, 31 Aug 2019 14:00:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i47gB-0001o9-Gn
 for <qemu-devel@nongnu.org>; Sat, 31 Aug 2019 18:00:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7283F2E80CB
 for <qemu-devel@nongnu.org>; Sat, 31 Aug 2019 18:00:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Aug 2019 17:52:31 -0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc64 testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc mark-cave-ayland philmd
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: Mark Cave-Ayland (mark-cave-ayland)
References: <156711057074.6835.13599471410604217618.malonedeb@soybean.canonical.com>
Message-Id: <156727395193.5951.16083459989291632447.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19044";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: aeffffe3aa4ebdae7d17836c55f37dce831f8034
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1841990] Re: instruction 'denbcdq' misbehaving
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
Reply-To: Bug 1841990 <1841990@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the report Paul (and also the investigation work Philippe).

So yes it seems the DFP code is another fallout from the conversion of
the floating point registers over to host-endian/VSR format. I've had a
quick look at this and it seems that the simple fix to compensate for
the FP registers not being contiguous anymore still won't work on
ppc64le.

In order to fix this properly I think the best solution is to use an
approach similar to that used in my last set of VSX patches, i.e. using
macros to avoid having separate code paths for big and little endian
hosts.

I can certainly come up with some patches for this, however I don't have
any ppc64le hardware to test it myself. If I were to do a trial
conversion of denbcdq would you be able to test it for me?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1841990

Title:
  instruction 'denbcdq' misbehaving

Status in QEMU:
  New

Bug description:
  Instruction 'denbcdq' appears to have no effect.  Test case attached.

  On ppc64le native:
  --
  gcc -g -O -mcpu=3Dpower9 bcdcfsq.c test-denbcdq.c -o test-denbcdq
  $ ./test-denbcdq
  0x00000000000000000000000000000000
  0x0000000000000000000000000000000c
  0x22080000000000000000000000000000
  $ ./test-denbcdq 1
  0x00000000000000000000000000000001
  0x0000000000000000000000000000001c
  0x22080000000000000000000000000001
  $ ./test-denbcdq $(seq 0 99)
  0x00000000000000000000000000000064
  0x0000000000000000000000000000100c
  0x22080000000000000000000000000080
  --

  With "qemu-ppc64le -cpu power9"
  --
  $ qemu-ppc64le -cpu power9 -L [...] ./test-denbcdq
  0x00000000000000000000000000000000
  0x0000000000000000000000000000000c
  0x0000000000000000000000000000000c
  $ qemu-ppc64le -cpu power9 -L [...] ./test-denbcdq 1
  0x00000000000000000000000000000001
  0x0000000000000000000000000000001c
  0x0000000000000000000000000000001c
  $ qemu-ppc64le -cpu power9 -L [...] ./test-denbcdq $(seq 100)
  0x00000000000000000000000000000064
  0x0000000000000000000000000000100c
  0x0000000000000000000000000000100c
  --

  I started looking at the code, but I got confused rather quickly.
  Could be related to endianness? I think denbcdq arrived on the scene
  before little-endian was a big deal.  Maybe something to do with
  utilizing implicit floating-point register pairs...  I don't think the
  right data is getting to helper_denbcdq, which would point back to the
  gen_fprp_ptr uses in dfp-impl.inc.c (GEN_DFP_T_FPR_I32_Rc).  (Maybe?)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1841990/+subscriptions

