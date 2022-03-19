Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809DE4DE6C3
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 08:32:18 +0100 (CET)
Received: from localhost ([::1]:44514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVTZR-0001j4-BR
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 03:32:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nVTO8-0002Gi-2o
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 03:20:36 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nVTO4-0005EA-41
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 03:20:35 -0400
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KLC0p2k5PzfYp8;
 Sat, 19 Mar 2022 15:18:50 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 15:20:20 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 15:20:19 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <cohuck@redhat.com>,
 <sgarzare@redhat.com>
CC: <pbonzini@redhat.com>, <arei.gonglei@huawei.com>, <yechuan@huawei.com>,
 <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>, Longpeng
 <longpeng2@huawei.com>
Subject: [PATCH v3 05/10] vdpa-dev: implement the realize interface
Date: Sat, 19 Mar 2022 15:20:07 +0800
Message-ID: <20220319072012.525-6-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220319072012.525-1-longpeng2@huawei.com>
References: <20220319072012.525-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Implements the .realize interface.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vdpa-dev-pci.c     |  18 ++++-
 hw/virtio/vdpa-dev.c         | 132 +++++++++++++++++++++++++++++++++++
 include/hw/virtio/vdpa-dev.h |  10 +++
 3 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
index 9eb590ce8c..31bd17353a 100644
--- a/hw/virtio/vdpa-dev-pci.c
+++ b/hw/virtio/vdpa-dev-pci.c
@@ -51,10 +51,26 @@ static Property vhost_vdpa_device_pci_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static int vhost_vdpa_device_pci_post_init(VhostVdpaDevice *v, Error **errp)
+{
+    VhostVdpaDevicePCI *dev = container_of(v, VhostVdpaDevicePCI, vdev);
+    VirtIOPCIProxy *vpci_dev = &dev->parent_obj;
+
+    vpci_dev->class_code = virtio_pci_get_class_id(v->vdev_id);
+    vpci_dev->trans_devid = virtio_pci_get_trans_devid(v->vdev_id);
+    /* one for config vector */
+    vpci_dev->nvectors = v->num_queues + 1;
+
+    return 0;
+}
+
 static void
 vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
-    return;
+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
+
+    dev->vdev.post_init = vhost_vdpa_device_pci_post_init;
+    qdev_realize(DEVICE(&dev->vdev), BUS(&vpci_dev->bus), errp);
 }
 
 static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index 993cbc7d11..4defe6c33d 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -29,9 +29,140 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 
+static void
+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /* Nothing to do */
+}
+
+static uint32_t
+vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
+{
+    uint32_t val = (uint32_t)-1;
+
+    if (ioctl(fd, cmd, &val) < 0) {
+        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
+                   cmd, strerror(errno));
+    }
+
+    return val;
+}
+
 static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
 {
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VhostVdpaDevice *v = VHOST_VDPA_DEVICE(vdev);
+    uint32_t max_queue_size;
+    struct vhost_virtqueue *vqs;
+    int i, ret;
+
+    if (!v->vdpa_dev || v->vdpa_dev_fd == -1) {
+        error_setg(errp, "both vpda-dev and vpda-dev-fd are missing");
+        return;
+    }
+
+    if (v->vdpa_dev && v->vdpa_dev_fd != -1) {
+        error_setg(errp, "both vpda-dev and vpda-dev-fd are set");
+        return;
+    }
+
+    if (v->vdpa_dev_fd == -1) {
+        v->vdpa_dev_fd = qemu_open(v->vdpa_dev, O_RDWR, errp);
+        if (*errp) {
+            return;
+        }
+    }
+    v->vdpa.device_fd = v->vdpa_dev_fd;
+
+    v->vdev_id = vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
+                                           VHOST_VDPA_GET_DEVICE_ID, errp);
+    if (*errp) {
+        goto out;
+    }
+
+    max_queue_size = vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
+                                               VHOST_VDPA_GET_VRING_NUM, errp);
+    if (*errp) {
+        goto out;
+    }
+
+    if (v->queue_size > max_queue_size) {
+        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %u (max:%u)",
+                   v->queue_size, max_queue_size);
+        goto out;
+    } else if (!v->queue_size) {
+        v->queue_size = max_queue_size;
+    }
+
+    v->num_queues = vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
+                                              VHOST_VDPA_GET_VQS_COUNT, errp);
+    if (*errp) {
+        goto out;
+    }
+
+    if (!v->num_queues || v->num_queues > VIRTIO_QUEUE_MAX) {
+        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
+                   v->num_queues, VIRTIO_QUEUE_MAX);
+        goto out;
+    }
+
+    v->dev.nvqs = v->num_queues;
+    vqs = g_new0(struct vhost_virtqueue, v->dev.nvqs);
+    v->dev.vqs = vqs;
+    v->dev.vq_index = 0;
+    v->dev.vq_index_end = v->dev.nvqs;
+    v->dev.backend_features = 0;
+    v->started = false;
+
+    ret = vhost_dev_init(&v->dev, &v->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
+                   strerror(-ret));
+        goto free_vqs;
+    }
+
+    v->config_size = vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
+                                               VHOST_VDPA_GET_CONFIG_SIZE, errp);
+    if (*errp) {
+        goto vhost_cleanup;
+    }
+    v->config = g_malloc0(v->config_size);
+
+    ret = vhost_dev_get_config(&v->dev, v->config, v->config_size, NULL);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: get config failed");
+        goto free_config;
+    }
+
+    virtio_init(vdev, "vhost-vdpa", v->vdev_id, v->config_size);
+
+    v->virtqs = g_new0(VirtQueue *, v->dev.nvqs);
+    for (i = 0; i < v->dev.nvqs; i++) {
+        v->virtqs[i] = virtio_add_queue(vdev, v->queue_size,
+                                        vhost_vdpa_device_dummy_handle_output);
+    }
+
+    if (v->post_init && v->post_init(v, errp) < 0) {
+        goto free_virtio;
+    }
+
     return;
+
+free_virtio:
+    for (i = 0; i < v->num_queues; i++) {
+        virtio_delete_queue(v->virtqs[i]);
+    }
+    g_free(v->virtqs);
+    virtio_cleanup(vdev);
+free_config:
+    g_free(v->config);
+vhost_cleanup:
+    vhost_dev_cleanup(&v->dev);
+free_vqs:
+    g_free(vqs);
+out:
+    qemu_close(v->vdpa_dev_fd);
+    v->vdpa_dev_fd = -1;
 }
 
 static void vhost_vdpa_device_unrealize(DeviceState *dev)
@@ -66,6 +197,7 @@ static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
 static Property vhost_vdpa_device_properties[] = {
     DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
     DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd, -1),
+    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
index 476bda0873..cf11abd0f7 100644
--- a/include/hw/virtio/vdpa-dev.h
+++ b/include/hw/virtio/vdpa-dev.h
@@ -28,6 +28,16 @@ struct VhostVdpaDevice {
     char *vdpa_dev;
     int vdpa_dev_fd;
     int32_t bootindex;
+    uint32_t vdev_id;
+    uint32_t num_queues;
+    struct vhost_dev dev;
+    struct vhost_vdpa vdpa;
+    VirtQueue **virtqs;
+    uint8_t *config;
+    int config_size;
+    uint16_t queue_size;
+    bool started;
+    int (*post_init)(VhostVdpaDevice *v, Error **errp);
 };
 
 #endif
-- 
2.23.0


