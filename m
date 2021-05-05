Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EC03734BD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:43:26 +0200 (CEST)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leAJh-0004sM-Gl
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leAHa-0003g2-Ki
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:41:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:36560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leAHV-0001dD-VY
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:41:14 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leAHU-00038Q-1P
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:41:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 096162E8084
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 05:41:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 05:31:53 -0000
From: Thomas Huth <1905356@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui rth th-huth
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160619430337.31223.17547021210606740630.malonedeb@chaenomeles.canonical.com>
Message-Id: <162019271342.14776.8649845838934752210.malone@soybean.canonical.com>
Subject: [Bug 1905356] Re: No check for unaligned data access in ARM32
 instructions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 21d0ee6dedb362cb3cd0010419b55d801d9fda30
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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

Richard's patches have been merged (see
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D4d753eb5fb03ee7bc71ec
and the following ones), so I'm setting the state to "Fix committed"
now.

** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1905356

Title:
  No check for unaligned data access in ARM32 instructions

Status in QEMU:
  Fix Committed

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

