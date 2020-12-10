Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74C2D5786
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:50:11 +0100 (CET)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIaQ-0005pz-Lx
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knIIA-0006A7-BZ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:18 -0500
Received: from indium.canonical.com ([91.189.90.7]:37944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knII6-000245-6b
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:18 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knII3-0000Od-Rv
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:11 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CA82C2E8138
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:23:52 -0000
From: Thomas Huth <1894361@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: belyshev laurent-vivier th-huth
X-Launchpad-Bug-Reporter: Serge Belyshev (belyshev)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159929178448.19565.970547378217785267.malonedeb@gac.canonical.com>
Message-Id: <160759223278.11845.6555542156659126423.malone@wampee.canonical.com>
Subject: [Bug 1894361] Re: linux-user: syscall.c lacks pselect6_time64
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: cd7bbd8311b9affb1975f01b867a017c17b455f1
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
Reply-To: Bug 1894361 <1894361@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894361

Title:
  linux-user: syscall.c lacks pselect6_time64

Status in QEMU:
  Fix Released

Bug description:
  in commit 50efc69586388a975c1ebd90cb8cc8e4a7328bc4 ("linux-user/riscv:
  Update the syscall_nr's to the 5.5 kernel") legacy pselect6 definition
  for riscv32 was removed in favour of pselect6_time64, but
  pselect6_time64 is not available in syscall.c, thus leaving riscv32
  without pselect syscall.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894361/+subscriptions

