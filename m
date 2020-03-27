Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF293195447
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 10:42:59 +0100 (CET)
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHlVy-00077K-RN
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 05:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHlUX-0005Vh-VG
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHlUW-0000hj-SH
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:41:29 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:48222 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHlUT-00008O-PU; Fri, 27 Mar 2020 05:41:26 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7E3A3FB9F4D53A6B2C22;
 Fri, 27 Mar 2020 17:41:22 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 17:41:15 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/2] virtio-blk: delete vqs on the error path in realize()
Date: Fri, 27 Mar 2020 17:56:41 +0800
Message-ID: <20200327095642.18424-2-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200327095642.18424-1-pannengyuan@huawei.com>
References: <20200327095642.18424-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, mst@redhat.com, Pan Nengyuan <pannengyuan@huawei.com>,
 Max Reitz <mreitz@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio_vqs forgot to free on the error path in realize(). Fix that.

The asan stack:
Direct leak of 14336 byte(s) in 1 object(s) allocated from:
    #0 0x7f58b93fd970 in __interceptor_calloc (/lib64/libasan.so.5+0xef970)
    #1 0x7f58b858249d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
    #2 0x5562cc627f49 in virtio_add_queue /mnt/sdb/qemu/hw/virtio/virtio.c:2413
    #3 0x5562cc4b524a in virtio_blk_device_realize /mnt/sdb/qemu/hw/block/virtio-blk.c:1202
    #4 0x5562cc613050 in virtio_device_realize /mnt/sdb/qemu/hw/virtio/virtio.c:3615
    #5 0x5562ccb7a568 in device_set_realized /mnt/sdb/qemu/hw/core/qdev.c:891
    #6 0x5562cd39cd45 in property_set_bool /mnt/sdb/qemu/qom/object.c:2238

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2->v1:
- Fix incorrect free in v1, it will cause a uaf.
---
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
---
 hw/block/virtio-blk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 142863a3b2..97ba8a2187 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1204,6 +1204,9 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
     if (err != NULL) {
         error_propagate(errp, err);
+        for (i = 0; i < conf->num_queues; i++) {
+            virtio_del_queue(vdev, i);
+        }
         virtio_cleanup(vdev);
         return;
     }
-- 
2.18.2

