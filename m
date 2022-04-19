Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059DA5070DF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 16:44:35 +0200 (CEST)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngp5m-0004gP-2a
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 10:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1ngp2S-0002W9-Bn
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 10:41:08 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:33282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1ngp2N-00064S-8p
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 10:41:07 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id A92493FAF7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1650379258;
 bh=gyUC+utIMoP3+i1mY+uqgW4CUqC+DxNC7sRWTqSDIbU=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=b2vbCZ1q5S7SqOdv4EECsZHhCowLk9kGEfPizCQL82Z9aW9Soab2pJyNagk8InurC
 VuLwPVo0hlXcxAj8hax4vWKehfQYscGftG12BQHFZMMyAnwDHquhfpWrdk1uFPcjkj
 gfARf9mtmgGG9T0bFuFhxxR+mqp00jATvRlKBJvxVbOIK4hPzB9ObqJFNKly67VVWi
 yluAlPvxlS17apbRdh14smY2eSEhA2jZA7+OwTrYO9bCRDR7q98jdoGd8Ek9caaDcB
 PQzk+d5iwBPbttryyBrPCo8fYFtASC2mQIf28iTrUQFCmZZRDyUQPCSkFc73DK3lUr
 FXm0WZIHcJYCQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 836972E8235
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 14:40:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Apr 2022 14:35:07 -0000
From: Kaitlyn Lew <1721788@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange eblake helixo152 jheidbrink lyanux
 th-huth xanclic
X-Launchpad-Bug-Reporter: Jan Heidbrink (jheidbrink)
X-Launchpad-Bug-Modifier: Kaitlyn Lew (helixo152)
References: <150729895903.22243.5921581973131047310.malonedeb@gac.canonical.com>
Message-Id: <165037890849.28731.7649612280456305082.malone@angus.canonical.com>
Subject: [Bug 1721788] Re: Failed to get shared "write" lock with 'qemu-img
 info'
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5cc3bd61c85a328825183f316ddd801c0f7d7ef2"; Instance="production"
X-Launchpad-Hash: 94d574498c47fe4c3da5e0d5a0726794c0c38cfe
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1721788 <1721788@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have the same problem

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1721788

Title:
  Failed to get shared "write" lock with 'qemu-img info'

Status in QEMU:
  Fix Released

Bug description:
  When running 'qemu-img info test.qcow2' while test.qcow2 is currently
  used by a Qemu process, I get the error

  qemu-img: Could not open 'test.qcow2': Failed to get shared "write"
  lock.

  Why does displaying information about a disk image need a write lock
  for the file?

  Steps to reproduce:

  qemu-img create -f qcow2 test.qcow2 10M
  qemu-system-x86_64 -nographic -drive file=3Dtest.qcow2
  qemu-img info test.qcow2

  The above was tested with Qemu version 2.10.0.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1721788/+subscriptions


