Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987794909A6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:40:51 +0100 (CET)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9SFe-0006TA-8C
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:40:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n9RMa-00063s-Bb
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:43:56 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n9RMU-00024b-I8
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:43:56 -0500
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Jcs2g1P2Vz8wPX;
 Mon, 17 Jan 2022 20:40:59 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 20:43:38 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 20:43:37 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <pbonzini@redhat.com>, <arei.gonglei@huawei.com>, <yechuan@huawei.com>,
 <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>, Longpeng
 <longpeng2@huawei.com>
Subject: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Date: Mon, 17 Jan 2022 20:43:26 +0800
Message-ID: <20220117124331.1642-6-longpeng2@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
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

Implements the .realize interface.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vdpa-dev.c         | 101 +++++++++++++++++++++++++++++++++++
 include/hw/virtio/vdpa-dev.h |   8 +++
 2 files changed, 109 insertions(+)

diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index b103768f33..bd28cf7a15 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -27,9 +27,109 @@ uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
     return val;
 }
 
+static void
+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /* Nothing to do */
+}
+
 static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
 {
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    uint32_t vdev_id, max_queue_size;
+    struct vhost_virtqueue *vqs;
+    int i, ret;
+
+    if (s->vdpa_dev_fd == -1) {
+        s->vdpa_dev_fd = qemu_open(s->vdpa_dev, O_RDWR, errp);
+        if (*errp) {
+            return;
+        }
+    }
+    s->vdpa.device_fd = s->vdpa_dev_fd;
+
+    max_queue_size = vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
+                                               VHOST_VDPA_GET_VRING_NUM, errp);
+    if (*errp) {
+        goto out;
+    }
+
+    if (s->queue_size > max_queue_size) {
+        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %d (max:%d)",
+                   s->queue_size, max_queue_size);
+        goto out;
+    } else if (!s->queue_size) {
+        s->queue_size = max_queue_size;
+    }
+
+    s->num_queues = vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
+                                              VHOST_VDPA_GET_VQS_NUM, errp);
+    if (*errp) {
+        goto out;
+    }
+
+    if (!s->num_queues || s->num_queues > VIRTIO_QUEUE_MAX) {
+        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
+                   s->num_queues, VIRTIO_QUEUE_MAX);
+        goto out;
+    }
+
+    s->dev.nvqs = s->num_queues;
+    vqs = g_new0(struct vhost_virtqueue, s->dev.nvqs);
+    s->dev.vqs = vqs;
+    s->dev.vq_index = 0;
+    s->dev.vq_index_end = s->dev.nvqs;
+    s->dev.backend_features = 0;
+    s->started = false;
+
+    ret = vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
+                   strerror(-ret));
+        goto free_vqs;
+    }
+
+    vdev_id = vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
+                                        VHOST_VDPA_GET_DEVICE_ID, errp);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: vhost get device id failed: %s",
+                   strerror(-ret));
+        goto vhost_cleanup;
+    }
+
+    s->config_size = vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
+                                               VHOST_VDPA_GET_CONFIG_SIZE, errp);
+    if (*errp) {
+        goto vhost_cleanup;
+    }
+    s->config = g_malloc0(s->config_size);
+
+    ret = vhost_dev_get_config(&s->dev, s->config, s->config_size, NULL);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: get config failed");
+        goto free_config;
+    }
+
+    virtio_init(vdev, "vhost-vdpa", vdev_id, s->config_size);
+
+    s->virtqs = g_new0(VirtQueue *, s->dev.nvqs);
+    for (i = 0; i < s->dev.nvqs; i++) {
+        s->virtqs[i] = virtio_add_queue(vdev, s->queue_size,
+                                        vhost_vdpa_device_dummy_handle_output);
+    }
+
     return;
+
+free_config:
+    g_free(s->config);
+vhost_cleanup:
+    vhost_dev_cleanup(&s->dev);
+free_vqs:
+    g_free(vqs);
+out:
+    qemu_close(s->vdpa_dev_fd);
+    s->vdpa_dev_fd = -1;
 }
 
 static void vhost_vdpa_device_unrealize(DeviceState *dev)
@@ -64,6 +164,7 @@ static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
 static Property vhost_vdpa_device_properties[] = {
     DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
     DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd, -1),
+    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
index e7ad349113..e0482035cf 100644
--- a/include/hw/virtio/vdpa-dev.h
+++ b/include/hw/virtio/vdpa-dev.h
@@ -14,6 +14,14 @@ struct VhostVdpaDevice {
     char *vdpa_dev;
     int vdpa_dev_fd;
     int32_t bootindex;
+    struct vhost_dev dev;
+    struct vhost_vdpa vdpa;
+    VirtQueue **virtqs;
+    uint8_t *config;
+    int config_size;
+    uint32_t num_queues;
+    uint16_t queue_size;
+    bool started;
 };
 
 uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp);
-- 
2.23.0


