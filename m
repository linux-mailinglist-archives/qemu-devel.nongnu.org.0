Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FBB2F59F8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 05:36:31 +0100 (CET)
Received: from localhost ([::1]:35242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzuN4-0006Jc-5q
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 23:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzuMG-0005po-DN
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:35:40 -0500
Received: from indium.canonical.com ([91.189.90.7]:46494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzuMD-0007AE-Iv
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 23:35:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzuMA-0006Ax-OG
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 04:35:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9ABD32E808B
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 04:35:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 Jan 2021 04:26:40 -0000
From: David Greenaway <1748296@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgreenaway doug16k
X-Launchpad-Bug-Reporter: Doug Gale (doug16k)
X-Launchpad-Bug-Modifier: David Greenaway (dgreenaway)
References: <151812332204.10331.17425660234309724521.malonedeb@wampee.canonical.com>
Message-Id: <161059840089.5701.2497530781836344176.malone@wampee.canonical.com>
Subject: [Bug 1748296] Re: TCG throws Invalid Opcode when executing x86 BMI
 shlx instruction
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 7a80c67a270464765520cb09b62ec48de5bceb7b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RAZOR2_CF_RANGE_51_100=1.886,
 RAZOR2_CHECK=0.922, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

I hit this today on QEMU head. The problem appears to crop up when:

  1. Decoding a VEX instruction (see [1]) that uses the 0x66 mandatory
     prefix; and

  2. The OSFXSR bit in CR4 is clear (that is, SSE is disabled)

This means that x86_64 instructions such as:

     c4 e2 f9 f7 c0                shlxq   %rax, %rax, %rax

fail. Similar instructions the use a different mandatory prefix
(such as `shrxq`, which uses prefix 0xf2) work fine.

Most operating systems presumably set the OSFXSR bit fairly early on, which=
 I
guess is why this problem isn't likely to be seen except in low-level or ea=
rly
boot code.

The culprit appears to be the block of code in `gen_sse` [2]:

    if (is_xmm
        && !(s->flags & HF_OSFXSR_MASK)
        && ((b !=3D 0x38 && b !=3D 0x3a) || (s->prefix & PREFIX_DATA))) {
        goto unknown_op;
    }

Removing the check `... || (s->prefix & DATA_DATA)` causes QEMU to correctly
translate the instruction, and allows doug16k's test above to pass.

I must confess, I'm not clear what this clause was testing for. My best gue=
ss
is that early code (e.g. 4242b1bd8ac) required it to avoid accessing invalid
opcode tables, but we seem to be handling that more gracefully today (e.g.
[3]), so I suspect it is no longer needed.

[1]: https://wiki.osdev.org/X86-64_Instruction_Encoding#VEX.2FXOP_opcodes
[2]: https://github.com/qemu/qemu/blob/6b63d126121a9535784003924fcb67f574a6=
afc0/target/i386/tcg/translate.c#L3078
[3]: https://github.com/qemu/qemu/blob/6b63d126121a9535784003924fcb67f574a6=
afc0/target/i386/tcg/translate.c#L3696-L3700

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1748296

Title:
  TCG throws Invalid Opcode when executing x86 BMI shlx instruction

Status in QEMU:
  New

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

