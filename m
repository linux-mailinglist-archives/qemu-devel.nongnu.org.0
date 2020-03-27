Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284AA194FC6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 04:43:35 +0100 (CET)
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHfuA-0007iD-7Y
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 23:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHfsN-0005N1-2a
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHfsM-0005gY-2F
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:41:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3728 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHfsJ-0005Pb-Hk; Thu, 26 Mar 2020 23:41:39 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E9AFFA31DB8261C75DB5;
 Fri, 27 Mar 2020 11:41:31 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 11:41:24 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] virtio-blk: delete vqs on the error path in realize()
Date: Fri, 27 Mar 2020 11:56:49 +0800
Message-ID: <20200327035650.2085-2-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200327035650.2085-1-pannengyuan@huawei.com>
References: <20200327035650.2085-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
---
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
---
 hw/block/virtio-blk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 142863a3b2..a6682c2ced 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1204,8 +1204,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     virtio_blk_data_plane_create(vdev, conf, &s->dataplane, &err);
     if (err != NULL) {
         error_propagate(errp, err);
-        virtio_cleanup(vdev);
-        return;
+        goto fail;
     }
 
     s->change = qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s);
@@ -1218,6 +1217,11 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
                          conf->conf.lcyls,
                          conf->conf.lheads,
                          conf->conf.lsecs);
+fail:
+    for (i = 0; i < conf->num_queues; i++) {
+        virtio_del_queue(vdev, i);
+    }
+    virtio_cleanup(vdev);
 }
 
 static void virtio_blk_device_unrealize(DeviceState *dev, Error **errp)
-- 
2.18.2


