Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B836F7EC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:28:25 +0200 (CEST)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPRh-0001le-2U
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPBv-0004iO-Sy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:12:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:35014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPBs-0003pu-7H
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:12:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcPBg-000283-TO
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:11:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DD7852E8030
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:11:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:56:55 -0000
From: Thomas Huth <1748296@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgreenaway doug16k th-huth
X-Launchpad-Bug-Reporter: Doug Gale (doug16k)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151812332204.10331.17425660234309724521.malonedeb@wampee.canonical.com>
Message-Id: <161977301574.10894.2042703295817365848.malone@gac.canonical.com>
Subject: [Bug 1748296] Re: TCG throws Invalid Opcode when executing x86 BMI
 shlx instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: faa1a06d2e53f4835705d9585ae0b1767b8f4c99
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
Reply-To: Bug 1748296 <1748296@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been included here:
https://gitlab.com/qemu-project/qemu/-/commit/51909241d26fe6fe18a

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1748296

Title:
  TCG throws Invalid Opcode when executing x86 BMI shlx instruction

Status in QEMU:
  Fix Released

Bug description:
  I am unable to use BMI in my project when running under TCG. I
  narrowed the problem down to incorrect instruction decoding for BMI
  instructions (which have a 2 byte VEX prefix). The gen_sse function in
  translate.c reaches the goto label do_0f_38_fx, but b does not equal
  0x1f7, 0x2f7, or 0x3f7, so the switch takes the default path and
  raises an invalid opcode exception.

  The code executes correctly and passes the test under KVM.

  I have created a complete repro here: https://github.com/doug65536
  /qemu-bmibug

  The makefile has the following utility targets:

  debug-kvm: Build and run the VM using KVM and wait for gdbstub attach

  run: Run the test case with TCG, make fails if the test fails. (It
  will fail)

  run-kvm: Run the test case with KVM, make fails if the test fails. (It
  will succeed)

  debug: Build and run the VM with TCG and wait for GDB attach

  attach-gdb: Run GDB and attach to QEMU gdbstub

  The VM runs with -cpu max. CPUID reports support for BMI, BMI2, and
  ABM.

  You can quickly verify the issue by executing `make run-kvm` to
  confirm that KVM passes, then `make run` to confirm that TCG fails.

  I believe the bug affects other BMI, BMI2, and ABM instructions, but I
  have only completely verified incorrect execution of SHLX.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1748296/+subscriptions

