Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8651436E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 09:49:09 +0200 (CEST)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkLND-0006Hy-Vm
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 03:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nkLKd-0005Ps-Pb
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:46:28 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:38770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nkLKb-000641-KY
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:46:27 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id CE1BB438A2
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1651218355;
 bh=cYbm9ym7EHD/HQMPCVJrkpilRwARjz9HlyKYPXGR4J8=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ja8WRr8XGxm3FC3NFXHuJouPcuhh/ut3J/i8sGwvsLGy29mmqiuAV7Ps8aeD90TzF
 H+Evw+27fE7vYYx8p5OnwfYFkEoFNtVQI8w6yGg2JGXJHyCIT9ek93KaJOXWgaUiUU
 yiexowFwpXgLe7+cnHYCu4dhflFh6U77momSjoCLsoRIQ96YhDOoepha3lXRQ2ytyJ
 fKHyOfpBYRx/3HHsXSk56TjEzMue+VeCqcncEoHo/QEd+PXc2kmTgJ4DIbKsUIVTs8
 y5bEXiUNVfhgn7xK/JlMy7rAEnM80Sjm2ZvMsx3LHAFk20CAHqdyg1fXamXzwVCfbE
 Men9fCq3HP/hg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E83042E8254
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:45:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Apr 2022 07:35:54 -0000
From: Paride Legovini <1970563@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: clipboard deadlock vnc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paride xiongpeng
X-Launchpad-Bug-Reporter: xp (xiongpeng)
X-Launchpad-Bug-Modifier: Paride Legovini (paride)
References: <165104817794.25511.15416062191158888957.malonedeb@angus.canonical.com>
Message-Id: <165121775478.47156.13080301216728748759.launchpad@dale.canonical.com>
Subject: [Bug 1970563] Re: Qemu Debian 1:6.2+dfsg-2ubuntu6 deadlock bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3e6ca301c25bad9ef395a0234df16d711b3dff61"; Instance="production"
X-Launchpad-Hash: 704854d44af7afd3c62898001f3dc91b8e2585cf
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
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

** Also affects: qemu
   Importance: Undecided
       Status: New

** No longer affects: qemu

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1970563

Title:
  Qemu 1:6.2+dfsg-2ubuntu6 deadlock bug

Status in qemu package in Ubuntu:
  New

Bug description:
  There is a known bug that will cause VM deadlock, the patch should be
  merged and released:

  https://gitlab.com/qemu-
  project/qemu/-/commit/1dbbe6f172810026c51dc84ed927a3cc23017949#841723aa93=
098d8ab3b5068795e10ae7cf2a3179

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1970563/+subscriptions


