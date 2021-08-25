Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26523F7088
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:38:27 +0200 (CEST)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInUQ-0006Xk-QE
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInRw-0000dS-3w
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:35:52 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInRu-0004n2-74
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:35:51 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id E67F43F784
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876948;
 bh=Z5htvPo9C56L3NGnOGhhWSE97r4tYtuEimfVQmtBF5s=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ew0k4HIHReydHig0UTEVGs6REYPboXWJAQo85723t8uBM0s3ROPrBKTpeAhkNAhQg
 znUAYMgKkkyx6omXtN1aybT4aFgd4SeKguMjUALaY5LsjRRcbPVWIwyO4zw3k6mKm7
 onNLQ3xppNW4d7cBotXKf3J2RS9md3Wk+xhG8oCCbXgiu/bJ53tdO1bbg+zv58alvM
 qKdwQWbFaKLggCwqZyUtIbonER1UGxzBMDrFp4Fj37v42dVNIgJIOrDsI9C4Po7dcs
 PcQvVJ8aYWdFAiGB68WzDU4YDijTPoZ+QGCJ5Ydsu5sGCG152s5y77tij0opu1QpYK
 2HvS+6pUH70ng==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DAF4C2E8138
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:35:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:25:57 -0000
From: Thomas Huth <1585840@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jepler pmaydell th-huth
X-Launchpad-Bug-Reporter: jepler (jepler)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160526014921.26209.46866.malonedeb@chaenomeles.canonical.com>
Message-Id: <162987635884.25887.15171074512074267282.launchpad@soybean.canonical.com>
Subject: [Bug 1585840] Re: multiprocess program gets incorrect results with
 qemu arm-linux-user
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 36f7e04ffdb0b33537149463cab03e9eb02db6ce
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1585840 <1585840@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1585840

Title:
  multiprocess program gets incorrect results with qemu arm-linux-user

Status in QEMU:
  Fix Released

Bug description:
  The attached program can run either in a threaded mode or a
  multiprocess mode.  It defaults to threaded mode, and switches to
  multiprocess mode if the first positional argument is "process".
  "success" of the test is defined as the final count being seen as
  2000000 by both tasks.

  In standard linux x86_64 userspace (i7, 4 cores) and in standard armhf
  userspace (4 cores), the test program consistently completes
  successfully in both modes.  But with qemu arm-linux-user, the test
  consistently succeeds in threaded mode and generally fails in
  multiprocess mode.

  The test reflects an essential aspect of how the Free and Open Source
  project linuxcnc's IPC system works: shared memory regions (created by
  shmat, but mmap would probably behave the same) contain data and
  mutexes.  I observed that our testsuite encounters numerous deadlocks
  and failures when running in an schroot with qemu-user (x86_64 host),
  and I believe the underlying cause is improper support for atomic
  operations in a multiprocess model. (the testsuite consistently passes
  on real hardware)

  I observed the same failure at v1.6.0 and master
  (v2.6.0-424-g287db79), as well as in the outdated Debian version
  1:2.1+dfsg-12+deb8u5a.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1585840/+subscriptions


