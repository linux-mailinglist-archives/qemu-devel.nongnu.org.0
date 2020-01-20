Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C737A142474
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 08:50:08 +0100 (CET)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itRp1-0007mr-DY
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 02:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1itRnL-00076B-Ml
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 02:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1itRnK-0002ad-Ka
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 02:48:23 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:33456 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1itRnC-0002Dm-MG; Mon, 20 Jan 2020 02:48:14 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 34503F5718790668134B;
 Mon, 20 Jan 2020 15:48:04 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Mon, 20 Jan 2020 15:47:53 +0800
From: <pannengyuan@huawei.com>
To: <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH] backup-top: fix a memory leak in bdrv_backup_top_append()
Date: Mon, 20 Jan 2020 15:47:25 +0800
Message-ID: <20200120074725.22948-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Euler Robot <euler.robot@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

top->opaque is aleardy malloced in bdrv_new_open_driver(), and then chang=
e
the pointer but without freeing it. It will cause a memory leak, the leak
stack is as follow:

Direct leak of 24 byte(s) in 1 object(s) allocated from:
  #0 0x7ff6f7be4970 (/lib64/libasan.so.5+0xef970)  ??:?
  #1 0x7ff6f723849d (/lib64/libglib-2.0.so.0+0x5249d)  ??:?
  #2 0x564c0d44caae (./x86_64-softmmu/qemu-system-x86_64+0x3b40aae)  /mnt=
/sdb/qemu/block.c:1289
  #3 0x564c0d44dbaf (./x86_64-softmmu/qemu-system-x86_64+0x3b41baf)  /mnt=
/sdb/qemu/block.c:1359
  #4 0x564c0d71618f (./x86_64-softmmu/qemu-system-x86_64+0x3e0a18f)  /mnt=
/sdb/qemu/block/backup-top.c:190
  #5 0x564c0d7001be (./x86_64-softmmu/qemu-system-x86_64+0x3df41be)  /mnt=
/sdb/qemu/block/backup.c:439
  #6 0x564c0c8ebef8 (./x86_64-softmmu/qemu-system-x86_64+0x2fdfef8)  /mnt=
/sdb/qemu/blockdev.c:3580
  #7 0x564c0c8ed0cb (./x86_64-softmmu/qemu-system-x86_64+0x2fe10cb)  /mnt=
/sdb/qemu/blockdev.c:3690
  #8 0x564c0c8ed177 (./x86_64-softmmu/qemu-system-x86_64+0x2fe1177)  /mnt=
/sdb/qemu/blockdev.c:3704
  #9 0x564c0d316388 (./x86_64-softmmu/qemu-system-x86_64+0x3a0a388)  /mnt=
/sdb/qemu/build/qapi/qapi-commands-block-core.c:439
  #10 0x564c0d7ff7fa (./x86_64-softmmu/qemu-system-x86_64+0x3ef37fa)  /mn=
t/sdb/qemu/qapi/qmp-dispatch.c:132
  #11 0x564c0d7ffcb8 (./x86_64-softmmu/qemu-system-x86_64+0x3ef3cb8)  /mn=
t/sdb/qemu/qapi/qmp-dispatch.c:175 (discriminator 4)
  #12 0x564c0d2704ef (./x86_64-softmmu/qemu-system-x86_64+0x39644ef)  /mn=
t/sdb/qemu/monitor/qmp.c:145
  #13 0x564c0d2712de (./x86_64-softmmu/qemu-system-x86_64+0x39652de)  /mn=
t/sdb/qemu/monitor/qmp.c:234 (discriminator 4)

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 block/backup-top.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/backup-top.c b/block/backup-top.c
index 818d3f26b4..d565f05520 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -196,6 +196,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverS=
tate *source,
     }
=20
     top->total_sectors =3D source->total_sectors;
+    g_free(top->opaque);
     top->opaque =3D state =3D g_new0(BDRVBackupTopState, 1);
=20
     bdrv_ref(target);
--=20
2.21.0.windows.1



