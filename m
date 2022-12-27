Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B38C6567C7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 08:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA4Gf-0004mc-Tp; Tue, 27 Dec 2022 02:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pA4GN-0004hu-Om
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 02:20:41 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pA4GJ-000792-Tr
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 02:20:39 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Nh5YS5TSjzJpW6;
 Tue, 27 Dec 2022 15:16:28 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 27 Dec 2022 15:20:19 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <philmd@linaro.org>
CC: <cohuck@redhat.com>, <sgarzare@redhat.com>, <pbonzini@redhat.com>,
 <arei.gonglei@huawei.com>, <yechuan@huawei.com>, <huangzhichao@huawei.com>,
 <qemu-devel@nongnu.org>, Longpeng <longpeng2@huawei.com>
Subject: [PATCH v3 1/3] vhost: simplify vhost_dev_enable_notifiers
Date: Tue, 27 Dec 2022 15:20:13 +0800
Message-ID: <20221227072015.3134-2-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20221227072015.3134-1-longpeng2@huawei.com>
References: <20221227072015.3134-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
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

Simplify the error path in vhost_dev_enable_notifiers by using
vhost_dev_disable_notifiers directly.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vhost.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index fdcd1a8fdf..5994559da8 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1551,7 +1551,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
-    int i, r, e;
+    int i, r;
 
     /* We will pass the notifiers to the kernel, make sure that QEMU
      * doesn't interfere.
@@ -1559,7 +1559,7 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     r = virtio_device_grab_ioeventfd(vdev);
     if (r < 0) {
         error_report("binding does not support host notifiers");
-        goto fail;
+        return r;
     }
 
     for (i = 0; i < hdev->nvqs; ++i) {
@@ -1567,24 +1567,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
                                          true);
         if (r < 0) {
             error_report("vhost VQ %d notifier binding failed: %d", i, -r);
-            goto fail_vq;
+            vhost_dev_disable_notifiers(hdev, vdev);
+            return r;
         }
     }
 
     return 0;
-fail_vq:
-    while (--i >= 0) {
-        e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
-                                         false);
-        if (e < 0) {
-            error_report("vhost VQ %d notifier cleanup error: %d", i, -r);
-        }
-        assert (e >= 0);
-        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
-    }
-    virtio_device_release_ioeventfd(vdev);
-fail:
-    return r;
 }
 
 /* Stop processing guest IO notifications in vhost.
-- 
2.23.0


