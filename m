Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8625E605
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 09:51:33 +0200 (CEST)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kESyy-0004Bq-32
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 03:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kESy9-0003l2-EI
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 03:50:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:40430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kESy7-0003w5-6I
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 03:50:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kESy4-0005tR-9p
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 07:50:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 451BF2E80AD
 for <qemu-devel@nongnu.org>; Sat,  5 Sep 2020 07:50:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2020 07:43:04 -0000
From: Serge Belyshev <1894361@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: belyshev
X-Launchpad-Bug-Reporter: Serge Belyshev (belyshev)
X-Launchpad-Bug-Modifier: Serge Belyshev (belyshev)
Message-Id: <159929178448.19565.970547378217785267.malonedeb@gac.canonical.com>
Subject: [Bug 1894361] [NEW] linux-user: syscall.c lacks pselect6_time64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="90a5703803d95539bdb5c0b289b1675630569e1e"; Instance="production"
X-Launchpad-Hash: ed9df888f79f862372c4840e36088e85aeddd09a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/05 03:50:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1894361 <1894361@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

in commit 50efc69586388a975c1ebd90cb8cc8e4a7328bc4 ("linux-user/riscv:
Update the syscall_nr's to the 5.5 kernel") legacy pselect6 definition
for riscv32 was removed in favour of pselect6_time64, but
pselect6_time64 is not available in syscall.c, thus leaving riscv32
without pselect syscall.

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

- in commit 50efc69586388a975c1ebd90cb8cc8e4a7328bc4 legacy pselect6 defini=
tion
- for riscv32 was removed in favour of pselect6_time64, but pselect6_time64=
 is
- not available in syscall.c, thus leaving riscv32 without pselect syscall.
+ in commit 50efc69586388a975c1ebd90cb8cc8e4a7328bc4 legacy pselect6
+ definition for riscv32 was removed in favour of pselect6_time64, but
+ pselect6_time64 is not available in syscall.c, thus leaving riscv32
+ without pselect syscall.

** Description changed:

- in commit 50efc69586388a975c1ebd90cb8cc8e4a7328bc4 legacy pselect6
- definition for riscv32 was removed in favour of pselect6_time64, but
+ in commit 50efc69586388a975c1ebd90cb8cc8e4a7328bc4 ("linux-user/riscv:
+ Update the syscall_nr's to the 5.5 kernel") legacy pselect6 definition
+ for riscv32 was removed in favour of pselect6_time64, but
  pselect6_time64 is not available in syscall.c, thus leaving riscv32
  without pselect syscall.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894361

Title:
  linux-user: syscall.c lacks pselect6_time64

Status in QEMU:
  New

Bug description:
  in commit 50efc69586388a975c1ebd90cb8cc8e4a7328bc4 ("linux-user/riscv:
  Update the syscall_nr's to the 5.5 kernel") legacy pselect6 definition
  for riscv32 was removed in favour of pselect6_time64, but
  pselect6_time64 is not available in syscall.c, thus leaving riscv32
  without pselect syscall.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894361/+subscriptions

