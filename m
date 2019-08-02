Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B07FEDA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 18:46:10 +0200 (CEST)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htagz-0004Ji-F5
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 12:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41551)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1htagT-0003oY-Rn
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 12:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1htagS-0006IF-Gu
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 12:45:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:58696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1htagS-0006H9-AY
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 12:45:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1htagR-0007Au-4N
 for <qemu-devel@nongnu.org>; Fri, 02 Aug 2019 16:45:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1FAC42E80C7
 for <qemu-devel@nongnu.org>; Fri,  2 Aug 2019 16:45:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Aug 2019 16:38:53 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm mprofile tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: buckfobb pmaydell
X-Launchpad-Bug-Reporter: KD (buckfobb)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156452233283.15483.3370838341008169030.malonedeb@wampee.canonical.com>
Message-Id: <156476393401.25402.11459506417891552986.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19014";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 908c4537eab72cd82ebc229701a2151e3ada7d7d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838475] Re: qemu-system-arm exits when cortex-m4
 floating point used and irq occurs
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
Reply-To: Bug 1838475 <1838475@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now fixed in git master; will be in the imminent 4.1 release.


** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838475

Title:
  qemu-system-arm exits when cortex-m4 floating point used and irq
  occurs

Status in QEMU:
  Fix Committed

Bug description:
  qemu-system-arm exits with

  "...Secure UsageFault with CFSR.NOCP because NSACR.CP10 prevents stacking=
 FP regs
  ...taking pending nonsecure exception 3
  Taking exception 7 [Breakpoint]
  qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)" =


  when emulating Cortex-m4, executing at least 1 floating point
  instruction, and then an irq (e.g. sys tick) occurring.

  CPACR.CP10 and CPACR.CP11 are set to 0x3 respectively prior to
  executing the fp instructions.

  NOTE: NSACR does not appear to be a cortex m4 register.

  Attached is a simplified elf to repro the issue.

  The qemu command line is: "qemu-system-arm --gdb tcp::1234 -cpu
  cortex-m4 -machine lm3s6965evb -nographic -semihosting-config
  enable=3Don,target=3Dnative -kernel QemuExitWhenUsingFPAndIRQOccurs.elf -d
  int"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838475/+subscriptions

