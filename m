Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0034909DE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:58:57 +0100 (CET)
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9SXA-0003lM-1Q
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n9RMQ-0005wC-Ip
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:43:48 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n9RMM-00023P-Fw
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:43:45 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Jcs1T1Tm2zZfCp;
 Mon, 17 Jan 2022 20:39:57 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 20:43:40 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 20:43:39 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <pbonzini@redhat.com>, <arei.gonglei@huawei.com>, <yechuan@huawei.com>,
 <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>, Longpeng
 <longpeng2@huawei.com>
Subject: [PATCH v2 09/10] vdpa-dev: implement the set_status interface
Date: Mon, 17 Jan 2022 20:43:30 +0800
Message-ID: <20220117124331.1642-10-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220117124331.1642-1-longpeng2@huawei.com>
References: <20220117124331.1642-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

Implements the .set_status interface.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vdpa-dev.c | 100 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index 7bf07fef9b..99722c88a1 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -195,9 +195,107 @@ static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
     return backend_features;
 }
 
+static int vhost_vdpa_device_start(VirtIODevice *vdev, Error **errp)
+{
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int i, ret;
+
+    if (!k->set_guest_notifiers) {
+        error_setg(errp, "binding does not support guest notifiers");
+        return -ENOSYS;
+    }
+
+    ret = vhost_dev_enable_notifiers(&s->dev, vdev);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Error enabling host notifiers");
+        return ret;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Error binding guest notifier");
+        goto err_host_notifiers;
+    }
+
+    s->dev.acked_features = vdev->guest_features;
+
+    ret = vhost_dev_start(&s->dev, vdev);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Error starting vhost");
+        goto err_guest_notifiers;
+    }
+    s->started = true;
+
+    /*
+     * guest_notifier_mask/pending not used yet, so just unmask
+     * everything here. virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < s->dev.nvqs; i++) {
+        vhost_virtqueue_mask(&s->dev, vdev, i, false);
+    }
+
+    return ret;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&s->dev, vdev);
+    return ret;
+}
+
+static void vhost_vdpa_device_stop(VirtIODevice *vdev)
+{
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!s->started) {
+        return;
+    }
+    s->started = false;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&s->dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&s->dev, vdev);
+}
+
 static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
 {
-    return;
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    bool should_start = virtio_device_started(vdev, status);
+    Error *local_err = NULL;
+    int ret;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (s->started == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        ret = vhost_vdpa_device_start(vdev, &local_err);
+        if (ret < 0) {
+            error_reportf_err(local_err, "vhost-vdpa-device: start failed: ");
+        }
+    } else {
+        vhost_vdpa_device_stop(vdev);
+    }
 }
 
 static Property vhost_vdpa_device_properties[] = {
-- 
2.23.0


