Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B17A861
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 14:27:35 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsRE6-0006S0-2q
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 08:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35195)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hsRCa-0005sc-S6
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hsRCZ-00026H-KY
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:26:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:60710)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hsRCZ-00025K-Ef
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:25:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hsRCU-0006Dg-Lx
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 12:25:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8DFCB2E819A
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 12:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jul 2019 12:17:58 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: elouan-appere pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Elouan_App=C3=A9r=C3=A9_=28elouan-apper?=
 =?utf-8?q?e=29?=
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156441235921.17753.6613889826588806043.malonedeb@gac.canonical.com>
Message-Id: <156448907819.23109.744088068823366380.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: fa638bf410bdf09f7fdb5d3982dfab8bbce93944
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838277] Re: qemu-system-aarch64: regression: TCG
 sometimes using wrong values for VBAR_EL2 despite it being correctly
 reported to GDB
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
Reply-To: Bug 1838277 <1838277@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Your example_x20_mov_sp_x8 binary performs an illegal-exception-return
because it does an eret from EL2 to EL1 without having set HCR_EL2.RW to
1. That means that the CPU will continue execution from the exception-
return "link address" in ELR_EL2 (and remain in EL2). That is 0, because
we just loaded it from address +0x1938 in the binary, which is all-
zeroes. Attempting to execute from 0x0 in EL2 triggers a prefetch abort
which is taken to EL2 at entry point 0x60001200 (which is where we
expect to enter given that VBAR_EL2 is 0x60001000 and this is a
synchronous exception to the current EL). The earlier "mov sp, x8" seems
to have executed as expected and the SP at the 'eret' is 0x60002ff0.

This seems to me to be correct execution of a buggy guest binary.

Note that if you are trying to debug this via the gdbstub you may be
being misled by a bug in our handling of "single step" -- if you single
step an instruction and it causes an exception (eg it is a load from a
bad address) then instead of stopping execution at the exception-entry-
point, we will execute one instruction at the exception-entry-point and
then stop after that. So you get back control in gdb one instruction
later than you expect.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838277

Title:
  qemu-system-aarch64: regression: TCG sometimes using wrong values for
  VBAR_EL2 despite it being correctly reported to GDB

Status in QEMU:
  New

Bug description:
  Affects 3.1.0 (latest stable release) and latest commit
  (893dc8300c80e3dc32f31e968cf7aa0904da50c3) but did *not* affect 2.11
  (qemu from bionic ubuntu LTS).

  With the following code and shell commands:

  test.s:

  .text
  mov x0, #0x60000000
  msr vbar_el2, x0
  dsb sy
  isb sy

  $ aarch64-none-elf-as test.s -o test.o
  $ aarch64-none-elf-objcopy -S -O binary test.o test.bin
  $ qemu-system-aarch64 -nographic -machine virt,virtualization=3Don -cpu c=
ortex-a57 -kernel test.bin -s -S

  vbar_el2 is still 0 after the code, instead of being the expected
  0x60000000. (see screenshot).

  This regression doesn't seem to happen for vbar_el1 &
  virtualization=3Doff.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838277/+subscriptions

