Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F63F7071
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:33:57 +0200 (CEST)
Received: from localhost ([::1]:48028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInQ4-0004a0-Tz
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInID-0006gY-AU
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:49 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:39790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInIB-0004Fg-Lm
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:49 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 330FB3F77D
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876346;
 bh=Xt0S8+qN2tgfgERurECT/pbH/A7vb0S1qq+DZJlVYbI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=qRWY5sw30LwhDzQy0G7u8kY+He9ajmes7agUOKTs9wMu/Lqfw1WKniuQzOsTPhPoY
 yhBZYOC3tn4Uu/v2bSd5K/2DZ+13ZmT6m2tXJR8aSutaXH7cOoqNzbFuNHaJCVL5v2
 RJstIbAOl/29lqyr0jZWH9HSakm2oxJxyv6j2L+RMlnQ+WioCmNbAcSJgA48pi2fpn
 PQBCi3VRU+/Av+a9NadZUStYlcnOCP5ArnGsh/EOpYwvW04q1zTMjsvTWix9zY2RJD
 YG0u1J9uTqEtQaenwwrXPSA9G/eExySXAqpfk5aRIh16CDimyHRIP3cGNPIAIc2z83
 Gsb+YNRuN7itw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 23A1E2E817A
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:16:26 -0000
From: Thomas Huth <1880763@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn janitor rth th-huth
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159052842235.20182.6565477896254015468.malonedeb@soybean.canonical.com>
Message-Id: <162987578712.15591.17778736912123386417.launchpad@gac.canonical.com>
Subject: [Bug 1880763] Re: Missing page crossing check in use_goto_tb() for rx
 target
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 67cfe34e30a02a7a05b67c8b82074d04d7396d50
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

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880763

Title:
  Missing page crossing check in use_goto_tb() for rx target

Status in QEMU:
  Fix Released

Bug description:
  Currently the rx target doesn't have the page crossing check in its=20
  use_goto_tb() function.=20
  This is a required feature for stable system mode emulations that all=20
  other targets implement.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880763/+subscriptions


