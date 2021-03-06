Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E97832FD81
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:31:55 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeWc-0005xL-G2
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lIeVb-0005RV-Jg
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:30:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:53498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lIeVX-0002HT-GL
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:30:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lIeVV-0007rR-HV
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 21:30:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 78CFC2E815C
 for <qemu-devel@nongnu.org>; Sat,  6 Mar 2021 21:30:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Mar 2021 21:24:57 -0000
From: Ryan Macnak <1918026@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rmacnak
X-Launchpad-Bug-Reporter: Ryan Macnak (rmacnak)
X-Launchpad-Bug-Modifier: Ryan Macnak (rmacnak)
Message-Id: <161506589796.3423.13383022797399751590.malonedeb@soybean.canonical.com>
Subject: [Bug 1918026] [NEW] RISCV64 32-bit AMOs incorrectly simulated
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fc09074b06b3b9178bd28175bdab646b3b5abfce"; Instance="production"
X-Launchpad-Hash: 4b54843f01726b8b73020720c26627e8aac856c7
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
Reply-To: Bug 1918026 <1918026@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Version: qemu-riscv64 version 4.2.1 (Debian 1:4.2-3ubuntu6.14)

test:
  amomaxu.w a0, a1, (a0)
  ret

int32_t* value =3D -7;
EXPECT_EQ(-7, test(&value, -11));
EXPECT_EQ(-7, value);  // FAIL, saw -11
EXPECT_EQ(-7, test(&value, -7));
EXPECT_EQ(-7, value);  // FAIL, raw -11
EXPECT_EQ(-7, test(&value, -4));
EXPECT_EQ(-4, value);

test:
  amomax.w a0, a1, (a0)
  ret

int32_t* value =3D -7;
EXPECT_EQ(-7, test(&value, -11));
EXPECT_EQ(-7, value);
EXPECT_EQ(-7, test(&value, -7));
EXPECT_EQ(-7, value);
EXPECT_EQ(-7, test(&value, -4));
EXPECT_EQ(-4, value);  // FAIL, saw -7

I suspect that trans_amo<op>_w should be using
tcg_gen_atomic_fetch_<op>_i32 instead of tcg_gen_atomic_fetch_<op>_tl.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918026

Title:
  RISCV64 32-bit AMOs incorrectly simulated

Status in QEMU:
  New

Bug description:
  Version: qemu-riscv64 version 4.2.1 (Debian 1:4.2-3ubuntu6.14)

  test:
    amomaxu.w a0, a1, (a0)
    ret

  int32_t* value =3D -7;
  EXPECT_EQ(-7, test(&value, -11));
  EXPECT_EQ(-7, value);  // FAIL, saw -11
  EXPECT_EQ(-7, test(&value, -7));
  EXPECT_EQ(-7, value);  // FAIL, raw -11
  EXPECT_EQ(-7, test(&value, -4));
  EXPECT_EQ(-4, value);

  test:
    amomax.w a0, a1, (a0)
    ret

  int32_t* value =3D -7;
  EXPECT_EQ(-7, test(&value, -11));
  EXPECT_EQ(-7, value);
  EXPECT_EQ(-7, test(&value, -7));
  EXPECT_EQ(-7, value);
  EXPECT_EQ(-7, test(&value, -4));
  EXPECT_EQ(-4, value);  // FAIL, saw -7

  I suspect that trans_amo<op>_w should be using
  tcg_gen_atomic_fetch_<op>_i32 instead of tcg_gen_atomic_fetch_<op>_tl.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918026/+subscriptions

