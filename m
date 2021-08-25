Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7243F7066
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:30:52 +0200 (CEST)
Received: from localhost ([::1]:40532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInN5-0007dd-Vp
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInIA-0006T7-19
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:46 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:44284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInI6-00049q-VT
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:25:45 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 4A2713F796
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876341;
 bh=DHis87y0S5y7Uy8b1KzBes8dPC5qvT3YlcYL5YiskSE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=uo1AT0I/Bdhzw3NqY1XvbJ6yjA70xEoyD2wA1mdz9SiJ3KppTOHZU9FgUeDX4j3Rm
 Y8kGghDE6l+e6SlxDWFDnjzv5JIW5IPV8wQP4bYtj+f9yEZN8YHeJ2aG3vwakgMnE3
 keiTSxxFcwCmbsNc8e4AZIE2U1PigJgPqLWR4d6AiFnkMoY8qZtYdO639vUDoRMFQq
 eZIAnVHSRKOennd3vc+GFxA4EIGZYTWrrxcMiFhoNsMSWtd36wuysVUE9+BGpomnJY
 knZXSbo/ogV6pLHSW4oQXEPX4PRIrq388xbm0sRnWob8gzQ/tslNRjDVgHGBOcRYM1
 fHOOGan6QVONw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 391842E816D
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:18:18 -0000
From: Thomas Huth <1923583@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: meeho th-huth
X-Launchpad-Bug-Reporter: meeho yuen (meeho)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161830261172.29345.7866671962411605196.malonedeb@wampee.canonical.com>
Message-Id: <162987590027.22426.1652294790091282985.launchpad@soybean.canonical.com>
Subject: [Bug 1923583] Re: colo: pvm flush failed after svm killed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 23962dacb9d6bdbb4eeffa6348d0927bf90dfe61
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
Reply-To: Bug 1923583 <1923583@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923583

Title:
  colo: pvm flush failed after svm killed

Status in QEMU:
  Fix Released

Bug description:
  Hi,
     Primary vm flush failed after killing svm, which leads primary vm gues=
t filesystem unavailable.

  qemu versoin: 5.2.0
  host/guest os: CentOS Linux release 7.6.1810 (Core)

  Reproduce steps:
  1. create colo vm following https://github.com/qemu/qemu/blob/master/docs=
/COLO-FT.txt
  2. kill secondary vm (don't remove nbd child from quorum on primary vm)an=
d wait for a minute. the interval depends on guest os.
  result: primary vm file system shutdown because of flush cache error.

  After serveral tests, I found that qemu-5.0.0 worked well, and it's
  the commit
  https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D883833e29cb800b4d92b5d4=
736252f4004885191(block:
  Flush all children in generic code) leads this change, and both
  virtio-blk and ide turned out to be bad.

  I think it's nbd(replication) flush failed leads bdrv_co_flush(quorum_bs)=
 failed, here is the call stack.
  #0  bdrv_co_flush (bs=3D0x56242b3cc0b0=3Dnbd_bs) at ../block/io.c:2856
  #1  0x0000562428b0f399 in bdrv_co_flush (bs=3D0x56242b3c7e00=3Dreplicatio=
n_bs) at ../block/io.c:2920
  #2  0x0000562428b0f399 in bdrv_co_flush (bs=3D0x56242a4ad800=3Dquorum_bs)=
 at ../block/io.c:2920
  #3  0x0000562428b70d56 in blk_do_flush (blk=3D0x56242a4ad4a0) at ../block=
/block-backend.c:1672
  #4  0x0000562428b70d87 in blk_aio_flush_entry (opaque=3D0x7fd0980073f0) a=
t ../block/block-backend.c:1680
  #5  0x0000562428c5f9a7 in coroutine_trampoline (i0=3D-1409269904, i1=3D32=
721) at ../util/coroutine-ucontext.c:173

  While i am not sure whether i use colo inproperly? Can we assume that
  nbd child of quorum immediately removed right after svm crashed? Or
  it's really a bug? Does the following patch fix? Help is needed!
  Thanks a lot=EF=BC=81

  diff --git a/block/quorum.c b/block/quorum.c
  index cfc1436..f2c0805 100644
  --- a/block/quorum.c
  +++ b/block/quorum.c
  @@ -1279,7 +1279,7 @@ static BlockDriver bdrv_quorum =3D {
       .bdrv_dirname                       =3D quorum_dirname,
       .bdrv_co_block_status               =3D quorum_co_block_status,
  =20
  -    .bdrv_co_flush_to_disk              =3D quorum_co_flush,
  +    .bdrv_co_flush                      =3D quorum_co_flush,
  =20
       .bdrv_getlength                     =3D quorum_getlength,

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923583/+subscriptions


