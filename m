Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A8F4856F4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 17:59:30 +0100 (CET)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n59dI-0000NW-Vx
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 11:59:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1n59aP-0007C1-Jp
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:56:31 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:57530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1n59a4-0007Dz-6H
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:56:11 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 261DE40422
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1641401765;
 bh=sqymr3mBXyjBX+KyDH0vxoHBtpPpYIJLiFBN9u7SFug=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=bC6HspDM8vD+TEnPkyxZ8Ot02M1SqBptoXfg9/ncW83kMCUqA7o33DUJiEjbYvcTU
 B5UUHPuDOHcDxMuMYB6a2aq5axVh/L7FqTuZxL1+DfkkMaMlcvcr+30PLjRVIi9jjF
 ml1q1chgKo3YTJ6JouIWjhSqE9JEQ9Sm3cyDqPHfFzNN/kfOKJheJ7rc3bGH8Vy8vD
 emq8jUjNpt2Hk94re0biuz1ooHZlDTQwUoxdh6IZXm023AJhncz+yMIETuMAZwOQeD
 80J7BMnpcOUUzcJLXitah8fy0gjbGo8Sa4xyhpbmicg/zYeEXrO1wKvb7ZShjVJmFn
 udkRn6vBSMhjA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E2DA32E82B4
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 16:55:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Jan 2022 16:49:42 -0000
From: Thomas Huth <1862619@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ascott1 imapotato2 laurent-vivier pmaydell
 tebounet th-huth
X-Launchpad-Bug-Reporter: Thierry Briot (tebounet)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158133547000.19789.14380673630783179726.malonedeb@wampee.canonical.com>
Message-Id: <164140138215.13667.7062924685387559441.malone@wampee.canonical.com>
Subject: [Bug 1862619] Re: "-serial telnet::xxxx,
 server" causes "Device 'serial0' is in use"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="adb364d6a74a28e7b95d51cd30446ec16160de6c"; Instance="production"
X-Launchpad-Hash: 80f74707d31415a748ccf2d6e717e2ca79f5b569
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1862619 <1862619@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Andrew! The QEMU project does not use this bug tracker anymore -
could you please open a new issue here: https://gitlab.com/qemu-
project/qemu/-/issues - Thanks!

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1862619

Title:
  "-serial telnet::xxxx,server" causes "Device 'serial0' is in use"

Status in QEMU:
  Fix Released

Bug description:
  I start qemu version 4.2.50 in a first terminal :

  $ sudo ./qemu-system-hppa -boot d -serial telnet::4441,server -drive
  if=3Dscsi,bus=3D0,index=3D6,file=3D./hpux.img,format=3Draw -serial mon:st=
dio -D
  /tmp/foo -nographic -m 512 -d nochain -cdrom
  ./HPUX_9.05_Installation_Disc_S700.iso -D /tmp/foo -net
  nic,model=3Dtulip  -net tap

  qemu-system-hppa: -serial telnet::4441,server: info: QEMU waiting for
  connection on: disconnected:telnet:0.0.0.0:4441,server

  In another terminal, I launch "telnet localhost 4441"

  And in the qemu window I have the following error:

  Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:220:
  qemu-system-hppa: Device 'serial0' is in use

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1862619/+subscriptions


