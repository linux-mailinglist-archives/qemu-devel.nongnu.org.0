Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AC632BA33
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:27:36 +0100 (CET)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHX9j-0005Qj-F7
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lHX7o-0003yo-DR
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:25:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lHX7k-0002Go-Ub
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:25:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lHX7i-0008Ak-TU
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 19:25:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DC7E62E815B
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 19:25:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Mar 2021 19:14:21 -0000
From: BogDan <1917661@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bog-dan-ro
X-Launchpad-Bug-Reporter: BogDan (bog-dan-ro)
X-Launchpad-Bug-Modifier: BogDan (bog-dan-ro)
Message-Id: <161479886143.24350.9355670718334050866.malonedeb@soybean.canonical.com>
Subject: [Bug 1917661] [NEW] qemu gdb wrong registers group for riscv64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="cc773b502c7eaaa848fbc2be1565e01aee62f701"; Instance="production"
X-Launchpad-Hash: 22a7955a0e04ac953e52184286b0d9ee2bc09c8a
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
Reply-To: Bug 1917661 <1917661@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Step to reproduce:
1. run qemu-system-riscv64 in gdb mode
2. attach gdb
3. set a breakpoint and run
4. print register-groups using "maintenance print register-groups" command

...
 sbadaddr   4162 4162   1628       8 long            all,general
 msounteren 4163 4163   1636       8 long            all,general
 mbadaddr   4164 4164   1644       8 long            all,general
 htimedeltah 4165 4165   1652       8 long            all,general

These registers don't belong to general group, instead they belong to
all, system and csr groups.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917661

Title:
  qemu gdb wrong registers group for riscv64

Status in QEMU:
  New

Bug description:
  Step to reproduce:
  1. run qemu-system-riscv64 in gdb mode
  2. attach gdb
  3. set a breakpoint and run
  4. print register-groups using "maintenance print register-groups" command

  ...
   sbadaddr   4162 4162   1628       8 long            all,general
   msounteren 4163 4163   1636       8 long            all,general
   mbadaddr   4164 4164   1644       8 long            all,general
   htimedeltah 4165 4165   1652       8 long            all,general

  These registers don't belong to general group, instead they belong to
  all, system and csr groups.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917661/+subscriptions

