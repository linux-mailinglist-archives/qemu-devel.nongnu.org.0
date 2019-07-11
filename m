Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531E16495A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 17:08:37 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlECx-0003jz-IR
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 11:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34348)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mprivozn@redhat.com>) id 1hlE9J-0002v1-3n
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 11:04:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mprivozn@redhat.com>) id 1hlE9I-0007Xq-0q
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 11:04:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58674)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mprivozn@redhat.com>)
 id 1hlE9F-0007UO-Cy; Wed, 10 Jul 2019 11:04:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 096E68E223;
 Wed, 10 Jul 2019 14:58:03 +0000 (UTC)
Received: from moe.brq.redhat.com (unknown [10.43.2.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C956660600;
 Wed, 10 Jul 2019 14:58:01 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 10 Jul 2019 16:57:44 +0200
Message-Id: <927aae40b617ba7d4b6c7ffe74e6d7a2595f8e86.1562770546.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 10 Jul 2019 14:58:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] nvme: Set number of queues later in nvme_init()
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When creating the admin queue in nvme_init() the variable that
holds the number of queues created is modified before actual
queue creation. This is a problem because if creating the queue
fails then the variable is left in inconsistent state. This was
actually observed when I tried to hotplug a nvme disk. The
control got to nvme_file_open() which called nvme_init() which
failed and thus nvme_close() was called which in turn called
nvme_free_queue_pair() with queue being NULL. This lead to an
instant crash:

  #0  0x000055d9507ec211 in nvme_free_queue_pair (bs=3D0x55d952ddb880, q=3D=
0x0) at block/nvme.c:164
  #1  0x000055d9507ee180 in nvme_close (bs=3D0x55d952ddb880) at block/nvm=
e.c:729
  #2  0x000055d9507ee3d5 in nvme_file_open (bs=3D0x55d952ddb880, options=3D=
0x55d952bb1410, flags=3D147456, errp=3D0x7ffd8e19e200) at block/nvme.c:78=
1
  #3  0x000055d9507629f3 in bdrv_open_driver (bs=3D0x55d952ddb880, drv=3D=
0x55d95109c1e0 <bdrv_nvme>, node_name=3D0x0, options=3D0x55d952bb1410, op=
en_flags=3D147456, errp=3D0x7ffd8e19e310) at block.c:1291
  #4  0x000055d9507633d6 in bdrv_open_common (bs=3D0x55d952ddb880, file=3D=
0x0, options=3D0x55d952bb1410, errp=3D0x7ffd8e19e310) at block.c:1551
  #5  0x000055d950766881 in bdrv_open_inherit (filename=3D0x0, reference=3D=
0x0, options=3D0x55d952bb1410, flags=3D32768, parent=3D0x55d9538ce420, ch=
ild_role=3D0x55d950eaade0 <child_file>, errp=3D0x7ffd8e19e510) at block.c=
:3063
  #6  0x000055d950765ae4 in bdrv_open_child_bs (filename=3D0x0, options=3D=
0x55d9541cdff0, bdref_key=3D0x55d950af33aa "file", parent=3D0x55d9538ce42=
0, child_role=3D0x55d950eaade0 <child_file>, allow_none=3Dtrue, errp=3D0x=
7ffd8e19e510) at block.c:2712
  #7  0x000055d950766633 in bdrv_open_inherit (filename=3D0x0, reference=3D=
0x0, options=3D0x55d9541cdff0, flags=3D0, parent=3D0x0, child_role=3D0x0,=
 errp=3D0x7ffd8e19e908) at block.c:3011
  #8  0x000055d950766dba in bdrv_open (filename=3D0x0, reference=3D0x0, o=
ptions=3D0x55d953d00390, flags=3D0, errp=3D0x7ffd8e19e908) at block.c:315=
6
  #9  0x000055d9507cb635 in blk_new_open (filename=3D0x0, reference=3D0x0=
, options=3D0x55d953d00390, flags=3D0, errp=3D0x7ffd8e19e908) at block/bl=
ock-backend.c:389
  #10 0x000055d950465ec5 in blockdev_init (file=3D0x0, bs_opts=3D0x55d953=
d00390, errp=3D0x7ffd8e19e908) at blockdev.c:602

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 73ed5fa75f..9896b7f7c6 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -613,12 +613,12 @@ static int nvme_init(BlockDriverState *bs, const ch=
ar *device, int namespace,
=20
     /* Set up admin queue. */
     s->queues =3D g_new(NVMeQueuePair *, 1);
-    s->nr_queues =3D 1;
     s->queues[0] =3D nvme_create_queue_pair(bs, 0, NVME_QUEUE_SIZE, errp=
);
     if (!s->queues[0]) {
         ret =3D -EINVAL;
         goto out;
     }
+    s->nr_queues =3D 1;
     QEMU_BUILD_BUG_ON(NVME_QUEUE_SIZE & 0xF000);
     s->regs->aqa =3D cpu_to_le32((NVME_QUEUE_SIZE << 16) | NVME_QUEUE_SI=
ZE);
     s->regs->asq =3D cpu_to_le64(s->queues[0]->sq.iova);
--=20
2.21.0


