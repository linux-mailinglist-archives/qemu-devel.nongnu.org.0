Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE33F0913
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:27:20 +0200 (CEST)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOPO-00012m-Ea
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mGONp-0000IQ-HA
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:25:43 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:49948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mGONm-0004N9-Qf
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:25:41 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 13D213F65D
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629303935;
 bh=+sd8qbIs1KZ3g7z8dJduZvq/EOUKRlyhD/wnZu1K0XM=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=rtpEaYp8kCdOrV9DgRYDDr96MUVpTzfgXNbyAKPDOWpSn2v2MjF9By9kIZZ/jeWU2
 Jflp3By+j0JJK1s4Aj4pmESeWntRgsbu7/cRnywzynBjBy/zWeqBeuXNjDGpmdJT+g
 4oZtwTo5GRBMLwX0zfkxD1hP7qZaQZSDJnkMtfBLq8pb5mA3HkLxG2hhhyY+sQ7ZEV
 CjSE3z/JpjKHQ9cIek0+K5ktzgrfFkCrR+JtV+CQ1uSVdLhsowuekcjzuCVKT4rLoQ
 v3xDZqLwwDIXaRewU6VqHKoEsSbNS6QoSCaKpQB/1eRMW1xaN3zCjUbpwCArXPNNMW
 b/QNkpHeJFuGg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D69802E8180
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 16:25:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Aug 2021 16:18:44 -0000
From: Richard Henderson <1880763@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn janitor rth th-huth
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <159052842235.20182.6565477896254015468.malonedeb@soybean.canonical.com>
Message-Id: <162930352462.8781.15586793922811437285.malone@wampee.canonical.com>
Subject: [Bug 1880763] Re: Missing page crossing check in use_goto_tb() for rx
 target
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b08a7ac7ee9dae6cca70a44dbdbee2a2b52e9053"; Instance="production"
X-Launchpad-Hash: 057515c49bc3a3a6f2f3b6d5b570b953d743b251
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1880763 <1880763@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the record, this was fixed for 6.1 in

commit f3f713cc151086ca39d4f97270594fd8c43e17e5
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Sun Jun 20 16:37:12 2021 -0700

    target/rx: Use translator_use_goto_tb
   =20
    Just use translator_use_goto_tb directly at the one call site,
    rather than maintaining a local wrapper.
   =20
    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


** Changed in: qemu
       Status: Expired =3D> Fix Committed

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880763

Title:
  Missing page crossing check in use_goto_tb() for rx target

Status in QEMU:
  Fix Committed

Bug description:
  Currently the rx target doesn't have the page crossing check in its=20
  use_goto_tb() function.=20
  This is a required feature for stable system mode emulations that all=20
  other targets implement.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880763/+subscriptions


