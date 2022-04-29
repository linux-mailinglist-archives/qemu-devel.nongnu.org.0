Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43437514390
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:59:56 +0200 (CEST)
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkLXe-0002FQ-R2
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nkLTs-00017K-N9
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:56:00 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:60594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nkLTq-0007R7-Rf
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:56:00 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 9343F3F502
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1651218949;
 bh=iX36LswPM4pneHKdbs1Ym3AsPrryfsmLImpSRJTXuqU=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=MnVzrf+H9EfqAhSpy96rSLAajBOcBrIVgpdpWXyr2NOADIweb8CSBfaW0Gzr8e0hf
 M3nIqAfBiKFXNMqRBcuR1549Iwz64F5AAZ5Q0T3WtHUVJxpP30/1U9qKXDYrV/1TZS
 98xgQCZemEcVQHcUTtOlatodnyarPTPx7tD/zqw1mn62976NnRIGP9VN+Mu7w+eF8F
 +q65dAxlZ37XwXY2bt8IOQ/JKRv2ifFHjo44WByQj7USMUhHbAY8ttqYn8tweVi0HD
 vnJERBSHVJQzbNsth6btxQOdP5VFsfj+ATecON4GcyMoWOCRKqDs6oKj9n2W9xvpJF
 ueT1Y9KVdxRjQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 001202E824D
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:55:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Apr 2022 07:46:38 -0000
From: Paride Legovini <1970563@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Triaged; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: clipboard deadlock server-todo vnc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paride xiongpeng
X-Launchpad-Bug-Reporter: xp (xiongpeng)
X-Launchpad-Bug-Modifier: Paride Legovini (paride)
References: <165104817794.25511.15416062191158888957.malonedeb@angus.canonical.com>
Message-Id: <165121839851.27940.4857166225907489798.malone@gac.canonical.com>
Subject: [Bug 1970563] Re: Qemu 1:6.2+dfsg-2ubuntu6 deadlock bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3e6ca301c25bad9ef395a0234df16d711b3dff61"; Instance="production"
X-Launchpad-Hash: 7d596034acc1d4b1c3a69b1fcac3eaa5f7ac7172
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Bug 1970563 <1970563@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, that report also has nice steps to reproduce. I updated the bug
tags/status accordingly.

** Summary changed:

- Qemu Debian 1:6.2+dfsg-2ubuntu6 deadlock bug
+ Qemu 1:6.2+dfsg-2ubuntu6 deadlock bug

** Also affects: qemu
   Importance: Undecided
       Status: New

** No longer affects: qemu

** Changed in: qemu (Ubuntu)
       Status: New =3D> Triaged

** Tags added: server-todo

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1970563

Title:
  Qemu 1:6.2+dfsg-2ubuntu6 deadlock bug

Status in qemu package in Ubuntu:
  Triaged

Bug description:
  There is a known bug that will cause VM deadlock, the patch should be
  merged and released:

  https://gitlab.com/qemu-
  project/qemu/-/commit/1dbbe6f172810026c51dc84ed927a3cc23017949#841723aa93=
098d8ab3b5068795e10ae7cf2a3179

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1970563/+subscriptions


