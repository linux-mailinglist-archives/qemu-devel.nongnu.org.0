Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCCF35DA3F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:43:40 +0200 (CEST)
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEe4-0000bx-0X
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWEbo-0007aj-UC
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:41:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:39136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWEbc-0001UB-I3
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:41:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWEbY-0000wq-TR
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 08:41:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DA3AE2E8163
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 08:41:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Apr 2021 08:30:11 -0000
From: meeho yuen <1923583@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: meeho
X-Launchpad-Bug-Reporter: meeho yuen (meeho)
X-Launchpad-Bug-Modifier: meeho yuen (meeho)
Message-Id: <161830261172.29345.7866671962411605196.malonedeb@wampee.canonical.com>
Subject: [Bug 1923583] [NEW] colo: pvm flush failed after svm killed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f3c8a1aed7c0b9bc4f5601dbf2698b30e1ab66f1"; Instance="production"
X-Launchpad-Hash: 6affeb2b921db333f73eef6136f99aeaecb914ef
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Public bug reported:

Hi,
   Primary vm flush failed after killing svm, which leads primary vm guest =
filesystem unavailable.

qemu versoin: 5.2.0
host/guest os: CentOS Linux release 7.6.1810 (Core)

Reproduce steps:
1. create colo vm following https://github.com/qemu/qemu/blob/master/docs/C=
OLO-FT.txt
2. kill secondary vm (don't remove nbd child from quorum on primary vm)and =
wait for a minute. the interval depends on guest os.
result: primary vm file system shutdown because of flush cache error.

After serveral tests, I found that qemu-5.0.0 worked well, and it's the
commit
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D883833e29cb800b4d92b5d473=
6252f4004885191(block:
Flush all children in generic code) leads this change, and both virtio-
blk and ide turned out to be bad.

I think it's nbd(replication) flush failed leads bdrv_co_flush(quorum_bs) f=
ailed, here is the call stack.
#0  bdrv_co_flush (bs=3D0x56242b3cc0b0=3Dnbd_bs) at ../block/io.c:2856
#1  0x0000562428b0f399 in bdrv_co_flush (bs=3D0x56242b3c7e00=3Dreplication_=
bs) at ../block/io.c:2920
#2  0x0000562428b0f399 in bdrv_co_flush (bs=3D0x56242a4ad800=3Dquorum_bs) a=
t ../block/io.c:2920
#3  0x0000562428b70d56 in blk_do_flush (blk=3D0x56242a4ad4a0) at ../block/b=
lock-backend.c:1672
#4  0x0000562428b70d87 in blk_aio_flush_entry (opaque=3D0x7fd0980073f0) at =
../block/block-backend.c:1680
#5  0x0000562428c5f9a7 in coroutine_trampoline (i0=3D-1409269904, i1=3D3272=
1) at ../util/coroutine-ucontext.c:173

While i am not sure whether i use colo inproperly? Can we assume that
nbd child of quorum immediately removed right after svm crashed? Or it's
really a bug? Does the following patch fix? Help is needed! Thanks a
lot=EF=BC=81

diff --git a/block/quorum.c b/block/quorum.c
index cfc1436..f2c0805 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1279,7 +1279,7 @@ static BlockDriver bdrv_quorum =3D {
     .bdrv_dirname                       =3D quorum_dirname,
     .bdrv_co_block_status               =3D quorum_co_block_status,
 =

-    .bdrv_co_flush_to_disk              =3D quorum_co_flush,
+    .bdrv_co_flush                      =3D quorum_co_flush,
 =

     .bdrv_getlength                     =3D quorum_getlength,

** Affects: qemu
     Importance: Undecided
         Status: New

** Patch added: "primary guest kernel message"
   https://bugs.launchpad.net/bugs/1923583/+attachment/5487235/+files/prima=
ry_guest_dmesg.log

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923583

Title:
  colo: pvm flush failed after svm killed

Status in QEMU:
  New

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
   =

  -    .bdrv_co_flush_to_disk              =3D quorum_co_flush,
  +    .bdrv_co_flush                      =3D quorum_co_flush,
   =

       .bdrv_getlength                     =3D quorum_getlength,

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923583/+subscriptions

