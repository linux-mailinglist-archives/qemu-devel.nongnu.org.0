Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B98643E60
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 09:20:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2TAs-0007Ta-MG; Tue, 06 Dec 2022 03:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p2TAk-0007Ob-Jw
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:19:27 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p2TAg-0005Dt-Va
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:19:26 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NRCwh1KwPzmWPw;
 Tue,  6 Dec 2022 16:18:28 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Dec 2022 16:18:44 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [PATCH v2 1/2] vhost: configure all host notifiers in a single MR
 transaction
Date: Tue, 6 Dec 2022 16:18:40 +0800
Message-ID: <20221206081841.2458-2-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20221206081841.2458-1-longpeng2@huawei.com>
References: <20221206081841.2458-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

This allows the vhost device to batch the setup of all its host notifiers.
This significantly reduces the device starting time, e.g. the time spend
on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
and 3 vhost-vDPA generic devices[1] (64vq per device)

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vhost.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7fb008bc9e..16f8391d86 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1507,7 +1507,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
-    int i, r, e;
+    int i, n, r, e;
 
     /* We will pass the notifiers to the kernel, make sure that QEMU
      * doesn't interfere.
@@ -1518,6 +1518,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
         goto fail;
     }
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
+    memory_region_transaction_begin();
+
     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          true);
@@ -1527,8 +1533,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
         }
     }
 
+    memory_region_transaction_commit();
+
     return 0;
 fail_vq:
+    /* save i for a second iteration after transaction is committed. */
+    n = i;
     while (--i >= 0) {
         e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          false);
@@ -1536,8 +1546,18 @@ fail_vq:
             error_report("vhost VQ %d notifier cleanup error: %d", i, -r);
         }
         assert (e >= 0);
-        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
     }
+
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
+    memory_region_transaction_commit();
+
+    while (--n >= 0) {
+        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + n);
+    }
+
     virtio_device_release_ioeventfd(vdev);
 fail:
     return r;
@@ -1553,6 +1573,12 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, r;
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
+    memory_region_transaction_begin();
+
     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          false);
@@ -1560,8 +1586,18 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
             error_report("vhost VQ %d notifier cleanup failed: %d", i, -r);
         }
         assert (r >= 0);
+    }
+
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
+    memory_region_transaction_commit();
+
+    for (i = 0; i < hdev->nvqs; ++i) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
     }
+
     virtio_device_release_ioeventfd(vdev);
 }
 
-- 
2.23.0


