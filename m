Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C660161E2C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 01:21:33 +0100 (CET)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3qdn-00020Q-Qr
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 19:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j3qcz-0001IH-8P
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 19:20:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j3qcy-0003it-3I
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 19:20:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:55480)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j3qcx-0003iC-U9
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 19:20:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j3qcw-0001Ub-91
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 00:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3FB422E80C0
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 00:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Feb 2020 00:15:29 -0000
From: Julien Freche <1863685@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jfreche
X-Launchpad-Bug-Reporter: Julien Freche (jfreche)
X-Launchpad-Bug-Modifier: Julien Freche (jfreche)
Message-Id: <158198492915.29307.8701397558481624318.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1863685] [NEW] ARM: HCR.TSW traps are not implemented
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="19413b719a8df7423ab1390528edadce9e0e4aca";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 29622104050d42807433cd875449439ae2db4dc5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1863685 <1863685@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

On 32-bit and 64-bit ARM platforms, setting HCR.TSW is supposed to "Trap
data or unified cache maintenance instructions that operate by Set/Way."
Quoting the ARM manual:

If EL1 is using AArch64 state, accesses to DC ISW, DC CSW, DC CISW are trap=
ped to EL2, reported using EC syndrome value 0x18.
If EL1 is using AArch32 state, accesses to DCISW, DCCSW, DCCISW are trapped=
 to EL2, reported using EC syndrome value 0x03.

However, QEMU does not trap those instructions/registers. This was
tested on the branch master of the git repo.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1863685

Title:
  ARM: HCR.TSW traps are not implemented

Status in QEMU:
  New

Bug description:
  On 32-bit and 64-bit ARM platforms, setting HCR.TSW is supposed to
  "Trap data or unified cache maintenance instructions that operate by
  Set/Way." Quoting the ARM manual:

  If EL1 is using AArch64 state, accesses to DC ISW, DC CSW, DC CISW are tr=
apped to EL2, reported using EC syndrome value 0x18.
  If EL1 is using AArch32 state, accesses to DCISW, DCCSW, DCCISW are trapp=
ed to EL2, reported using EC syndrome value 0x03.

  However, QEMU does not trap those instructions/registers. This was
  tested on the branch master of the git repo.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1863685/+subscriptions

