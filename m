Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1758D2C1D3D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 06:12:00 +0100 (CET)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khQcQ-0002VV-Jj
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 00:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khQbI-00024y-O5
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 00:10:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:35972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khQbF-0007kJ-CX
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 00:10:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khQbC-0007hg-Ry
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:10:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D0C0D2E813C
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:10:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 05:05:03 -0000
From: JIANG Muhui <1905356@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: JIANG Muhui (muhui)
Message-Id: <160619430337.31223.17547021210606740630.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1905356] [NEW] No check for unaligned data access in ARM32
 instructions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: e3a1e4b3a720d6b6b0e6eee153702dd843de8828
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1905356 <1905356@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

hi

According to the ARM documentation, there are alignment requirements of
load/store instructions.  Alignment fault should be raised if the
alignment check is failed. However, it seems that QEMU doesn't implement
this, which is against the documentation of ARM. For example, the
instruction LDRD/STRD/LDREX/STREX must check the address is word
alignment no matter what value the SCTLR.A is.

I attached a testcase, which contains an instruction at VA 0x10240: ldrd
r0,[pc.#1] in the main function. QEMU can successfully load the data in
the unaligned address. The test is done in QEMU 5.1.0. I can provide
more testcases for the other instructions if you need. Many thanks.

To patch this, we need a check while we translate the instruction to
tcg. If the address is unaligned, a signal number (i.e., SIGBUS) should
be raised.

Regards
Muhui

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "case_ldrd_arm"
   https://bugs.launchpad.net/bugs/1905356/+attachment/5437364/+files/case_=
ldrd_arm

** Description changed:

  hi
  =

  According to the ARM documentation, there are alignment requirements of
  load/store instructions.  Alignment fault should be raised if the
  alignment check is failed. However, it seems that QEMU doesn't implement
  this, which is against the documentation of ARM. For example, the
  instruction LDRD/STRD/LDREX/STREX must check the address is word
  alignment no matter what value the SCTLR.A is.
  =

- I attached a testcase, which contains a instruction at VA 0x10240: ldrd
+ I attached a testcase, which contains an instruction at VA 0x10240: ldrd
  r0,[pc.#1] in the main function. QEMU can successfully load the data in
  the unaligned address. The test is done in QEMU 5.1.0. I can provide
  more testcases for the other instructions if you need. Many thanks.
  =

  To patch this, we need a check while we translate the instruction to
  tcg. If the address is unaligned, a signal number (i.e., SIGBUS) should
  be raised.
  =

  Regards
  Muhui

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905356

Title:
  No check for unaligned data access in ARM32 instructions

Status in QEMU:
  New

Bug description:
  hi

  According to the ARM documentation, there are alignment requirements
  of load/store instructions.  Alignment fault should be raised if the
  alignment check is failed. However, it seems that QEMU doesn't
  implement this, which is against the documentation of ARM. For
  example, the instruction LDRD/STRD/LDREX/STREX must check the address
  is word alignment no matter what value the SCTLR.A is.

  I attached a testcase, which contains an instruction at VA 0x10240:
  ldrd r0,[pc.#1] in the main function. QEMU can successfully load the
  data in the unaligned address. The test is done in QEMU 5.1.0. I can
  provide more testcases for the other instructions if you need. Many
  thanks.

  To patch this, we need a check while we translate the instruction to
  tcg. If the address is unaligned, a signal number (i.e., SIGBUS)
  should be raised.

  Regards
  Muhui

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1905356/+subscriptions

