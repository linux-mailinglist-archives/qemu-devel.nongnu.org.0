Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8764B484BED
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 02:06:24 +0100 (CET)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ukw-0007JJ-Qk
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 20:06:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue3-0007sB-OC
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:15 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n4ue0-0007vH-69
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:59:15 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JTB194pzLz9s42;
 Wed,  5 Jan 2022 08:58:05 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:07 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 08:59:06 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [RFC 05/10] vdpa-dev: implement the realize interface
Date: Wed, 5 Jan 2022 08:58:55 +0800
Message-ID: <20220105005900.860-6-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220105005900.860-1-longpeng2@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/virtio/vdpa-dev.c         | 114 +++++++++++++++++++++++++++++++++++
 include/hw/virtio/vdpa-dev.h |   8 +++
 2 files changed, 122 insertions(+)

diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index 790117fb3b..2d534d837a 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -15,9 +15,122 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 
+static void
+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /* Nothing to do */
+}
+
+static int vdpa_dev_get_info_by_fd(int fd, uint64_t cmd, Error **errp)
+{
+    int val;
+
+    if (ioctl(fd, cmd, &val) < 0) {
+        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
+                   cmd, strerror(errno));
+        return -1;
+    }
+
+    return val;
+}
+
+static inline int vdpa_dev_get_queue_size(int fd, Error **errp)
+{
+    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VRING_NUM, errp);
+}
+
+static inline int vdpa_dev_get_vqs_num(int fd, Error **errp)
+{
+    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VQS_NUM, errp);
+}
+
+static inline int vdpa_dev_get_config_size(int fd, Error **errp)
+{
+    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_CONFIG_SIZE, errp);
+}
+
 static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
 {
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    uint32_t device_id;
+    int max_queue_size;
+    int fd;
+    int i, ret;
+
+    fd = qemu_open(s->vdpa_dev, O_RDWR, errp);
+    if (fd == -1) {
+        return;
+    }
+    s->vdpa.device_fd = fd;
+
+    max_queue_size = vdpa_dev_get_queue_size(fd, errp);
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
+    ret = vdpa_dev_get_vqs_num(fd, errp);
+    if (*errp) {
+        goto out;
+    }
+
+    s->dev.nvqs = ret;
+    s->dev.vqs = g_new0(struct vhost_virtqueue, s->dev.nvqs);
+    s->dev.vq_index = 0;
+    s->dev.vq_index_end = s->dev.nvqs;
+    s->dev.backend_features = 0;
+    s->started = false;
+
+    ret = vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
+                   strerror(-ret));
+        goto out;
+    }
+
+    ret = s->dev.vhost_ops->vhost_get_device_id(&s->dev, &device_id);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: vhost get device id failed: %s",
+                   strerror(-ret));
+        goto vhost_cleanup;
+    }
+
+    s->config_size = vdpa_dev_get_config_size(fd, errp);
+    if (*errp) {
+        goto vhost_cleanup;
+    }
+
+    s->config = g_malloc0(s->config_size);
+
+    ret = vhost_dev_get_config(&s->dev, s->config, s->config_size, NULL);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: get config failed");
+        goto config_err;
+    }
+
+    virtio_init(vdev, "vhost-vdpa", device_id, s->config_size);
+
+    s->virtqs = g_new0(VirtQueue *, s->dev.nvqs);
+    for (i = 0; i < s->dev.nvqs; i++) {
+        s->virtqs[i] = virtio_add_queue(vdev, s->queue_size,
+                                        vhost_vdpa_device_dummy_handle_output);
+    }
+
     return;
+config_err:
+    g_free(s->config);
+vhost_cleanup:
+    vhost_dev_cleanup(&s->dev);
+out:
+    close(fd);
 }
 
 static void vhost_vdpa_device_unrealize(DeviceState *dev)
@@ -51,6 +164,7 @@ static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
 
 static Property vhost_vdpa_device_properties[] = {
     DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
+    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
index 7a0e6bdcf8..49f8145d61 100644
--- a/include/hw/virtio/vdpa-dev.h
+++ b/include/hw/virtio/vdpa-dev.h
@@ -13,6 +13,14 @@ struct VhostVdpaDevice {
     VirtIODevice parent_obj;
     char *vdpa_dev;
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
 
 #endif
-- 
2.23.0


