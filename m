Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F27E0A4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 18:57:59 +0200 (CEST)
Received: from localhost ([::1]:57766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htEOt-00083J-0f
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 12:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58452)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1htEHw-0008Ep-GR
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1htEHu-00025B-Dl
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:50:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:54392)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1htEHs-00020z-DL
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:50:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1htEHp-0006k3-KC
 for <qemu-devel@nongnu.org>; Thu, 01 Aug 2019 16:50:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7D26E2E80CB
 for <qemu-devel@nongnu.org>; Thu,  1 Aug 2019 16:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Aug 2019 16:43:33 -0000
From: KD <buckfobb@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm mprofile tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: buckfobb pmaydell
X-Launchpad-Bug-Reporter: KD (buckfobb)
X-Launchpad-Bug-Modifier: KD (buckfobb)
References: <156452233283.15483.3370838341008169030.malonedeb@wampee.canonical.com>
Message-Id: <156467781310.18204.2163568230788473098.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19012";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 2700ec57e71ef8268cf9db39614d0031c0564093
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

I confirm that this fixes the issue above.

Thank you for your help! It is much appreciated.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838475

Title:
  qemu-system-arm exits when cortex-m4 floating point used and irq
  occurs

Status in QEMU:
  In Progress

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

