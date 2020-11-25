Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E632C37B4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 04:41:57 +0100 (CET)
Received: from localhost ([::1]:38698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khlgp-0000MQ-HB
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 22:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khlfn-0008OA-PK
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 22:40:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:43428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khlfl-0004P9-Op
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 22:40:51 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khlfj-0001gR-Io
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 03:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8D6512E813B
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 03:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2020 03:35:14 -0000
From: JIANG Muhui <1905356@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui rth
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: JIANG Muhui (muhui)
References: <160619430337.31223.17547021210606740630.malonedeb@chaenomeles.canonical.com>
Message-Id: <160627531411.8423.11269209663426726849.malone@gac.canonical.com>
Subject: [Bug 1905356] Re: No check for unaligned data access in ARM32
 instructions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 952947f5a8e122718e4e3217621901b4d0269718
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

Thanks for confirmation.

Btw: I was wondering why the fix will only apply to system mode rather
than user-only mode. Unaligned data access is not permitted in user
level programs, either.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905356

Title:
  No check for unaligned data access in ARM32 instructions

Status in QEMU:
  Confirmed

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

