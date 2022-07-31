Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8FE586184
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jul 2022 23:07:29 +0200 (CEST)
Received: from localhost ([::1]:56692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIG9o-00062n-Iy
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 17:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1oIG8F-0004f6-Pp
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 17:05:51 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:50010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1oIG8D-0004UT-D7
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 17:05:51 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 8B1583F19A
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1659301540;
 bh=W6fuHzt8tfaLPbyNHCjsn7vPqX8ZUnyT89eDugLjl8k=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=cCWqcXIbi3FDqFcNOHuCWL1RRv84VzJz4GcmyLrHpen2mVG0r6SP1Tfrec9yIK0LM
 IGmHC19Mxm1Q4G5nTvc0ijP5Bnm2ncIHN0DGKDSI5NmpJVe9vfN0Jh3yE8rzu9Xl33
 iPBkoGXVEqDhOIJ0/Rgs2RYVFwu0u1loDkIfqBKF4JN23ibC/7xO4knTIXSWMiqr9s
 GGERnSjJ3u1GmPm9FWNB7UmDVOEKgx1eyay45aWHLQzpyl32UYnL7PdGy7xSWD+hd9
 DlSGvrIRKuSvhX+28ZzsvOFjwvLuT2f4lL/DHMiLCz1XE4U/v/OLnbqsfvtTm5mGi9
 bKpfg2FJROyWQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 654BE2E82AD
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 21:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jul 2022 20:59:26 -0000
From: David Glover <1180923@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anthony-codemonkey janitor me-davidglover
 oubattler panie pmaydell stefanha th-huth
X-Launchpad-Bug-Reporter: TC1988 (panie)
X-Launchpad-Bug-Modifier: David Glover (me-davidglover)
References: <20130516173422.20571.91890.malonedeb@gac.canonical.com>
Message-Id: <165930116695.48062.10370149944063594891.malone@dale.canonical.com>
Subject: [Bug 1180923] Re: unused memory filled with 0x00 instead of 0xFF
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d8a8b6effe4eae83e8bb5babdb93ddb4ac4f09e0"; Instance="production"
X-Launchpad-Hash: dcb5078b5375c0889645fc47546165f1f19298a5
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1180923 <1180923@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I know this is expired but it's still a problem in qemu 7.0.0. For
example, when running MS-DOS 6.22, "mem" reports 0K of upper memory, and
memmaker fails to run, complaining that it could not allocate any. I'd
love to know if there's a workaround.

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1180923

Title:
  unused memory filled with 0x00 instead of 0xFF

Status in QEMU:
  Expired

Bug description:
  Qemu, ever since it was made (so, since 2003), has this problem in DOS
  (either PC-DOS or MS-DOS and partly Windows 9x) not recognizing the
  memory available when the memory is filled with 0x00 but when it is
  filled with 0xFF it gets recognized properly, where should I patch
  qemu to solve this memory problem?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1180923/+subscriptions


