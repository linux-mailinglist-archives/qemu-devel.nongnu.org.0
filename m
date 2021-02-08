Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A62314182
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:18:43 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Dve-000698-9Q
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l98GM-0005dw-QX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:15:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:52514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l98GG-0007kS-9x
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:15:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l98GD-0001EB-DR
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 15:15:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6028A2E8137
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 15:15:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Feb 2021 15:09:00 -0000
From: superleaf1995 <1915027@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: superleaf1995
X-Launchpad-Bug-Reporter: superleaf1995 (superleaf1995)
X-Launchpad-Bug-Modifier: superleaf1995 (superleaf1995)
Message-Id: <161279694044.12775.4779161531525908683.malonedeb@soybean.canonical.com>
Subject: [Bug 1915027] [NEW] RISC-V 64, CPUs do ilegal 0x00 write with SMP
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 9e71f2ee34af5d05d96472feae1dbb942b0e1519
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
Reply-To: Bug 1915027 <1915027@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When QEMU is runt like this:

qemu-system-riscv64 -d unimp,guest_errors -smp 8

Other harts will do a illegal write on address 0x00.

This could be mostly (i think) because the initial assembly code is only
loaded on the first hart and the others do a mess because there is no
code to execute.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915027

Title:
  RISC-V 64, CPUs do ilegal 0x00 write with SMP

Status in QEMU:
  New

Bug description:
  When QEMU is runt like this:

  qemu-system-riscv64 -d unimp,guest_errors -smp 8

  Other harts will do a illegal write on address 0x00.

  This could be mostly (i think) because the initial assembly code is
  only loaded on the first hart and the others do a mess because there
  is no code to execute.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915027/+subscriptions

