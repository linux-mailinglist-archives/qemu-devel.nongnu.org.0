Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B258655E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 08:48:50 +0200 (CEST)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIPEP-00053d-Ch
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 02:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1oIP7N-0002Hv-10
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 02:41:35 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:49838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1oIP7L-0001jb-Cc
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 02:41:32 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 837373F57A
 for <qemu-devel@nongnu.org>; Mon,  1 Aug 2022 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1659336081;
 bh=uXQFwFr+SoK9qS7YTLjF4KN8cXusX8mTuiUmuT4KY4k=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=lyQTlLNoOkSzlRAZf2J3Tv3Nw4qrqlRRTmcjDVdXgxmtGVXDCA5IYzZq95vKrdWUC
 UFa4HmK3gCyI0mxOqouItG28U0oeVTvZSVwGuKgxDAJOYw601LB65gnWHY+bDOiJAV
 W4wQcXAApEivntsw10Rj2Ucv6QzznKnq9C4IA6BPHPBIn1hN8sl9O5HDNTZOkWzilv
 6XI4Nu69XVllSpVq//awTbYyh5VUYKTh0tnDEde+xI6FcGtZ+ERECQ4fHux7u82bQm
 HG5rF3sANy2kOwbIT3s7BKJT949PIEDeQYgqZuOKLAaXeDeyCYbmnDmb/xPEyK7hD/
 rmUZnBx1N4N5g==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D982C2E8309
 for <qemu-devel@nongnu.org>; Mon,  1 Aug 2022 06:41:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Aug 2022 06:30:37 -0000
From: Yonggang Luo <1180923@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anthony-codemonkey janitor luoyonggang
 me-davidglover oubattler panie pmaydell stefanha th-huth
X-Launchpad-Bug-Reporter: TC1988 (panie)
X-Launchpad-Bug-Modifier: Yonggang Luo (luoyonggang)
References: <20130516173422.20571.91890.malonedeb@gac.canonical.com>
Message-Id: <165933543748.9334.13063457647486080218.launchpad@loganberry.canonical.com>
Subject: [Bug 1180923] Re: unused memory filled with 0x00 instead of 0xFF
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d8a8b6effe4eae83e8bb5babdb93ddb4ac4f09e0"; Instance="production"
X-Launchpad-Hash: faf4fdfe541ebb7f7c5e48768d8b1ab6b6232f35
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

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #1133
   https://gitlab.com/qemu-project/qemu/-/issues/1133

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


