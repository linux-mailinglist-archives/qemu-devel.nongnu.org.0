Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15764DC7F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:51:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5odG-0000B3-VG; Thu, 15 Dec 2022 08:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p5od2-00008j-UB
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:50:29 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1p5ocy-0003Ou-J6
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:50:28 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NXtr52dQ7zRq32;
 Thu, 15 Dec 2022 21:49:09 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 15 Dec 2022 21:50:11 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <sgarzare@redhat.com>
CC: <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 Longpeng <longpeng2@huawei.com>
Subject: [PATCH v11 2/5] vdpa: add vdpa-dev support
Date: Thu, 15 Dec 2022 21:49:41 +0800
Message-ID: <20221215134944.2809-3-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20221215134944.2809-1-longpeng2@huawei.com>
References: <20221215134944.2809-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
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

Supports vdpa-dev, we can use the deivce directly:

-M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/Kconfig            |   5 +
 hw/virtio/meson.build        |   1 +
 hw/virtio/vdpa-dev.c         | 376 +++++++++++++++++++++++++++++++++++
 include/hw/virtio/vdpa-dev.h |  43 ++++
 4 files changed, 425 insertions(+)
 create mode 100644 hw/virtio/vdpa-dev.c
 create mode 100644 include/hw/virtio/vdpa-dev.h

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index cbfd8c7173..89e9e426d8 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -85,3 +85,8 @@ config VHOST_USER_GPIO
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_VDPA_DEV
+    bool
+    default y
+    depends on VIRTIO && VHOST_VDPA && LINUX
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index dfed1e7af5..54d6d29af7 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -31,6 +31,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'], if_true: files('vhost-user-gpio-pci.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
new file mode 100644
index 0000000000..dbc4f8001d
--- /dev/null
+++ b/hw/virtio/vdpa-dev.c
@@ -0,0 +1,376 @@
+/*
+ * Vhost Vdpa Device
+ *
+ * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights Reserved.
+ *
+ * Authors:
+ *   Longpeng <longpeng2@huawei.com>
+ *
+ * Largely based on the "vhost-user-blk-pci.c" and "vhost-user-blk.c"
+ * implemented by:
+ *   Changpeng Liu <changpeng.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <linux/vhost.h>
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/cutils.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/virtio-access.h"
+#include "hw/virtio/vdpa-dev.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
+
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
+static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VhostVdpaDevice *v = VHOST_VDPA_DEVICE(vdev);
+    uint16_t max_queue_size;
+    struct vhost_virtqueue *vqs;
+    int i, ret;
+
+    if (!v->vhostdev) {
+        error_setg(errp, "vhost-vdpa-device: vhostdev are missing");
+        return;
+    }
+
+    v->vhostfd = qemu_open(v->vhostdev, O_RDWR, errp);
+    if (*errp) {
+        return;
+    }
+    v->vdpa.device_fd = v->vhostfd;
+
+    v->vdev_id = vhost_vdpa_device_get_u32(v->vhostfd,
+                                           VHOST_VDPA_GET_DEVICE_ID, errp);
+    if (*errp) {
+        goto out;
+    }
+
+    max_queue_size = vhost_vdpa_device_get_u32(v->vhostfd,
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
+    v->num_queues = vhost_vdpa_device_get_u32(v->vhostfd,
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
+    v->config_size = vhost_vdpa_device_get_u32(v->vhostfd,
+                                               VHOST_VDPA_GET_CONFIG_SIZE,
+                                               errp);
+    if (*errp) {
+        goto vhost_cleanup;
+    }
+
+    /*
+     * Invoke .post_init() to initialize the transport-specific fields
+     * before calling virtio_init().
+     */
+    if (v->post_init && v->post_init(v, errp) < 0) {
+        goto vhost_cleanup;
+    }
+
+    v->config = g_malloc0(v->config_size);
+
+    ret = vhost_dev_get_config(&v->dev, v->config, v->config_size, NULL);
+    if (ret < 0) {
+        error_setg(errp, "vhost-vdpa-device: get config failed");
+        goto free_config;
+    }
+
+    virtio_init(vdev, v->vdev_id, v->config_size);
+
+    v->virtqs = g_new0(VirtQueue *, v->dev.nvqs);
+    for (i = 0; i < v->dev.nvqs; i++) {
+        v->virtqs[i] = virtio_add_queue(vdev, v->queue_size,
+                                        vhost_vdpa_device_dummy_handle_output);
+    }
+
+    return;
+
+free_config:
+    g_free(v->config);
+vhost_cleanup:
+    vhost_dev_cleanup(&v->dev);
+free_vqs:
+    g_free(vqs);
+out:
+    qemu_close(v->vhostfd);
+    v->vhostfd = -1;
+}
+
+static void vhost_vdpa_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    int i;
+
+    virtio_set_status(vdev, 0);
+
+    for (i = 0; i < s->num_queues; i++) {
+        virtio_delete_queue(s->virtqs[i]);
+    }
+    g_free(s->virtqs);
+    virtio_cleanup(vdev);
+
+    g_free(s->config);
+    g_free(s->dev.vqs);
+    vhost_dev_cleanup(&s->dev);
+    qemu_close(s->vhostfd);
+    s->vhostfd = -1;
+}
+
+static void
+vhost_vdpa_device_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+
+    memcpy(config, s->config, s->config_size);
+}
+
+static void
+vhost_vdpa_device_set_config(VirtIODevice *vdev, const uint8_t *config)
+{
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    int ret;
+
+    ret = vhost_dev_set_config(&s->dev, s->config, 0, s->config_size,
+                               VHOST_SET_CONFIG_TYPE_MASTER);
+    if (ret) {
+        error_report("set device config space failed");
+        return;
+    }
+}
+
+static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
+                                               uint64_t features,
+                                               Error **errp)
+{
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
+    uint64_t backend_features = s->dev.features;
+
+    if (!virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM)) {
+        virtio_clear_feature(&backend_features, VIRTIO_F_IOMMU_PLATFORM);
+    }
+
+    return backend_features;
+}
+
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
+    ret = vhost_dev_start(&s->dev, vdev, false);
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
+    vhost_dev_stop(&s->dev, vdev, false);
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
+static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
+{
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
+}
+
+static Property vhost_vdpa_device_properties[] = {
+    DEFINE_PROP_STRING("vhostdev", VhostVdpaDevice, vhostdev),
+    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_vhost_vdpa_device = {
+    .name = "vhost-vdpa-device",
+    .minimum_version_id = 1,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vhost_vdpa_device_properties);
+    dc->desc = "VDPA-based generic device assignment";
+    dc->vmsd = &vmstate_vhost_vdpa_device;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    vdc->realize = vhost_vdpa_device_realize;
+    vdc->unrealize = vhost_vdpa_device_unrealize;
+    vdc->get_config = vhost_vdpa_device_get_config;
+    vdc->set_config = vhost_vdpa_device_set_config;
+    vdc->get_features = vhost_vdpa_device_get_features;
+    vdc->set_status = vhost_vdpa_device_set_status;
+}
+
+static void vhost_vdpa_device_instance_init(Object *obj)
+{
+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(obj);
+
+    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
+                                  NULL, DEVICE(obj));
+}
+
+static const TypeInfo vhost_vdpa_device_info = {
+    .name = TYPE_VHOST_VDPA_DEVICE,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VhostVdpaDevice),
+    .class_init = vhost_vdpa_device_class_init,
+    .instance_init = vhost_vdpa_device_instance_init,
+};
+
+static void register_vhost_vdpa_device_type(void)
+{
+    type_register_static(&vhost_vdpa_device_info);
+}
+
+type_init(register_vhost_vdpa_device_type);
diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
new file mode 100644
index 0000000000..4dbf98195c
--- /dev/null
+++ b/include/hw/virtio/vdpa-dev.h
@@ -0,0 +1,43 @@
+/*
+ * Vhost Vdpa Device
+ *
+ * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights Reserved.
+ *
+ * Authors:
+ *   Longpeng <longpeng2@huawei.com>
+ *
+ * Largely based on the "vhost-user-blk.h" implemented by:
+ *   Changpeng Liu <changpeng.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ */
+#ifndef _VHOST_VDPA_DEVICE_H
+#define _VHOST_VDPA_DEVICE_H
+
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-vdpa.h"
+#include "qom/object.h"
+
+
+#define TYPE_VHOST_VDPA_DEVICE "vhost-vdpa-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VhostVdpaDevice, VHOST_VDPA_DEVICE)
+
+struct VhostVdpaDevice {
+    VirtIODevice parent_obj;
+    char *vhostdev;
+    int vhostfd;
+    int32_t bootindex;
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
+};
+
+#endif
-- 
2.23.0


