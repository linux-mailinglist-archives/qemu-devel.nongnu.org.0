Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3053F7040
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:17:20 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIn9z-0002Rf-Ie
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8a-00083f-7M
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:52 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:37066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8X-00043F-Ct
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:51 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id C363B3F6EE
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629875745;
 bh=oO6JV0WMxWal85TgpZpNiM2zx4NRQXH1Lf5xHgSIPZE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=SkqZEY3FfiGmoU6WZEK1OQuSW7zr8e2w8ydgvGQNocVXeZCWeZcoyUtigpLHLysqj
 kOlxSRmxRL8cOlaOTb96CkEfjvmZmhFvSCdAaGDovNOJ4BVhHcJIytLkn5gXm/qzhm
 bDZrpCN8I71EBTC0l/WIzEjGFhDbBfQacBTpsfCh6S7Pc9NAHxmwTWmrUogcih3kvl
 KlAAwoVeDHyd3NElYDIj8oiWZprZcVWvwAfHZWpEWqT+vWLESqEXP7kJKHmYkqG2rQ
 KvzYaCVa/xMqbdwA/YzcNzIE7urqgkNAvVEkh4ZOhl38PadXg00X4mHarG3P4uer8j
 wh4H2e1rlsGSw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 521442E8189
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:06:30 -0000
From: Thomas Huth <1926995@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=High;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314 th-huth
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <162006770303.13621.18026521974059309297.malonedeb@wampee.canonical.com>
Message-Id: <162987519134.15880.9606658429663544168.launchpad@gac.canonical.com>
Subject: [Bug 1926995] Re: hw/remote/mpqemu-link.c:221: bad error checking ?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 1bae6e0d6d2e9bb0c31be82c92897597bbbaf928
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1926995 <1926995@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926995

Title:
  hw/remote/mpqemu-link.c:221: bad error checking ?

Status in QEMU:
  Fix Released

Bug description:
  hw/remote/mpqemu-link.c:221:36: warning: logical =E2=80=98and=E2=80=99 of=
 mutually
  exclusive tests is always false [-Wlogical-op]

  Source code is

     if (msg->cmd >=3D MPQEMU_CMD_MAX && msg->cmd < 0) {
          return false;
      }

  Maybe better code:

     if (msg->cmd >=3D MPQEMU_CMD_MAX || msg->cmd < 0) {
          return false;
      }

  It might be useful to switch on gcc compiler flag -Wlogical-op
  to see these warnings.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926995/+subscriptions


