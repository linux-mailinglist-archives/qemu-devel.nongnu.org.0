Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D83F703D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:17:17 +0200 (CEST)
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIn9w-0002Ha-FB
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8a-00083e-6W
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:52 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8X-00043O-F7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:51 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id E436E3F7C8
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629875745;
 bh=RkN5K+nS5ft00qL6u91ghTrRbdOoPRU72T1VK2N3Dqc=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=OmDDkADSMC6BbGTaOp9UUcnHVgE5SfZP3gouNB35acVaeEHWmCRNJGkiBUfgvVvNY
 4grv6yM2BdIU4mFpBLT4P1wBXelneImfUt7F/IeoQT0gZ2SmjPD0dDOV7ig1qYBLGd
 Eov9xh8Eh0WL1wsmXhZKgETDVoR7ST8RDedyFS4whJNKc/F8IeKcZQztHMZ3uKqMJP
 bennqkd/lTZjqJVnwmx+yrmDLUhqPbBchxBKIqfzhPobbSbUFF6GQQqG0N1S3AQ+DI
 gGPdplosO0maWJVOL1/SFq88h2930IAPSSn/qL+xaibHBq8o8le03ENUoARrG0kMeq
 YjkhZs97i8Bxg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E64C42E81A2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:06:45 -0000
From: Thomas Huth <1926759@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui pmaydell th-huth
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161978229375.10342.16262082750544447119.malonedeb@gac.canonical.com>
Message-Id: <162987520671.15880.16740500274416093662.launchpad@gac.canonical.com>
Subject: [Bug 1926759] Re: WFI instruction results in unhandled CPU exception
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: d22860e0f07336dd25987db50a15c19ea682aa21
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
Reply-To: Bug 1926759 <1926759@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926759

Title:
  WFI instruction results in unhandled CPU exception

Status in QEMU:
  Fix Released

Bug description:
  Hi

  I refer to the WFI instruction. The bytecode is 0xe320f003. After the
  execution, qemu exit with the following  crash log.

  qemu: unhandled CPU exception 0x10001 - aborting
  R00=3D00000001 R01=3D40800b34 R02=3D40800b3c R03=3D000102ec
  R04=3D00010a28 R05=3D00010158 R06=3D00087460 R07=3D00010158
  R08=3D00000000 R09=3D00000000 R10=3D00085b7c R11=3D408009f4
  R12=3D40800a08 R13=3D408009f0 R14=3D0001057c R15=3D000102f8
  PSR=3D60000010 -ZC- A usr32
  qemu:handle_cpu_signal received signal outside vCPU context @ pc=3D0x7f5c=
21d0fa12

  WFI aims to enter a low-power state and wait for interrupt. The raised
  exception seems not a right behavior. I can provide a testcase if you
  needed. Many thanks.

  Regards
  Muhui

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926759/+subscriptions


