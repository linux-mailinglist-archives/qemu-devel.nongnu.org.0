Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B662D81850
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 13:42:05 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hubNM-0003gK-Vn
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 07:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33765)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hubMD-00032i-8s
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 07:40:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hubM9-00019z-B4
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 07:40:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:42716)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hubM8-00017Q-V4
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 07:40:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hubM6-0005eR-3o
 for <qemu-devel@nongnu.org>; Mon, 05 Aug 2019 11:40:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E66C62E8041
 for <qemu-devel@nongnu.org>; Mon,  5 Aug 2019 11:40:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Aug 2019 11:31:38 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: elouan-appere pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Elouan_App=C3=A9r=C3=A9_=28elouan-apper?=
 =?utf-8?q?e=29?=
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156496429682.24531.17468125820972523019.malonedeb@soybean.canonical.com>
Message-Id: <156500469847.24414.6704023892808259887.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19014";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 6e1ee511ee371282d1ad660b58af8bcd89082524
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838913] Re: Single-step exceptions incorrectly
 routed to EL1 when ELD is EL2 (TDE = 1) (qemu version 3.1)
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
Reply-To: Bug 1838913 <1838913@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes, we're directing single-step exceptions to the wrong EL. (I think
this is probably a hangover from the fact that we implemented singlestep
at about the same time or before we properly implemented EL2 support, so
we haven't shaken out all the "assumes debug EL is EL1" assumptions
still.)


** Changed in: qemu
       Status: New =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838913

Title:
  Single-step exceptions incorrectly routed to EL1 when ELD is EL2 (TDE
  =3D 1) (qemu version 3.1)

Status in QEMU:
  In Progress

Bug description:
  Hi,

  I've been encountering issues with QEMU 3.1 when trying to single-step
  EL1 code, with ELD =3D EL2 (MDCR_EL2.TDE =3D 1). I could test with latest
  commit in a few hours, if you want.

  EL1 is Aarch64.

  This happens as soon as MDSCR_EL1.SS is set to 1 and ERET is executed:

  - Single-step exceptions are routed to EL1

  Exception return from AArch64 EL2 to AArch64 EL1 PC 0x4000005c
  Taking exception 1 [Undefined Instruction]
  ...from EL1 to EL1
  ...with ESR 0x32/0xca000022
  ...with ELR 0x4000005c
  ...to EL1 PC 0x200 PSTATE 0x3c5

  EC 0x32 (0b110010) is Exception_SoftwareStepLowerEl.

  You can find enclosed minimal code (and resulting .elf) for
  reproduction.

  qemu-system-aarch64 -nographic -machine virt,virtualization=3Don -d
  unimp,int -cpu cortex-a57 -kernel test_hyp.elf

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838913/+subscriptions

