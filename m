Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66BC647C9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 16:08:49 +0200 (CEST)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlDH5-0007qi-SP
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 10:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hlDED-0006wb-15
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 10:05:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hlDEA-0002dC-3M
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 10:05:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:49718)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hlDE9-0002VL-OA
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 10:05:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hlDE5-0000B2-AD
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 14:05:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 472C82E80CB
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 14:05:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jul 2019 13:59:17 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Tags: arm testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee christophe-lyon
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <156164884976.17804.15592866928864750515.malonedeb@wampee.canonical.com>
Message-Id: <156276715779.20861.9378328188785305528.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 11283471ae857a1c5072fc0e42a8f5b4695b8597
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1834496] Re: Regressions on arm target with some
 GCC tests
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
Reply-To: Bug 1834496 <1834496@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed by:

Subject: [PATCH for-4.1] tcg: Fix constant folding of INDEX_op_extract2_i32
Date: Tue,  9 Jul 2019 14:19:00 +0200
Message-Id: <20190709121900.25644-1-richard.henderson@linaro.org>


** Changed in: qemu
       Status: New =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1834496

Title:
  Regressions on arm target with some GCC tests

Status in QEMU:
  In Progress

Bug description:
  Hi,

  After trying qemu master:
  commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde
  Merge: 68d7ff0 14f5d87
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Fri Jun 21 15:40:50 2019 +0100

  I found several regressions compared to qemu-3.1 when running the GCC tes=
tsuite.
  I'm attaching a tarball containing several GCC tests (binaries), needed s=
hared libs, and a short script to run all the tests.

  All tests used to pass w/o error (one of them is verbose), but with a
  recent qemu, all of them make qemu crash:

  qemu: uncaught target signal 6 (Aborted) - core dumped

  This was noticed with GCC master configured with
  --target arm-none-linux-gnueabi
  --with-mode arm
  --with-cpu cortex-a9

  and calling qemu with --cpu cortex-a9 (the script uses "any", this
  makes no difference).

  I have noticed other failures with arm-v8 code, but this is probably
  the same root cause. Since it's a bit tedious to manually rebuild &
  extract the testcases, I'd prefer to start with this subset, and I can
  extract more if needed later.

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1834496/+subscriptions

