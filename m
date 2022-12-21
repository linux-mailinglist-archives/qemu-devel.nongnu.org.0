Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A261653146
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymQ-0004il-Ck; Wed, 21 Dec 2022 08:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymN-0004b8-FO
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymK-0003zK-VC
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJkseNNqjl7TXubstwwYI7kVc9LwcGqtGW6dtHCnMfg=;
 b=DCyVTR18YIddPk50F31JIYIa+Nbt1MKzfZ5WTG0u2xSRe98dsO4UVyr67ge+xXyEFTRMKC
 /Y8b+zlyHQnWnDsVqAc+eWts3TTQVhGrzR24jFE+VuJW7BVvKRK4I/83EpV8xE4tpIgz00
 rfiItB1DYPV8MvJXUWMDzpIy7OpcDkg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-2drD3KohNj-DN2g542K5AA-1; Wed, 21 Dec 2022 08:04:59 -0500
X-MC-Unique: 2drD3KohNj-DN2g542K5AA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l9-20020a7bc349000000b003d35aa4ed8eso681975wmj.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJkseNNqjl7TXubstwwYI7kVc9LwcGqtGW6dtHCnMfg=;
 b=4TrFJLRrCPHez6x6ruMOmcUEmEYxZOa6XRaDHx4Oc1mMZB9y+gRXnfodUSJk2073O8
 ih7zmtNqm+FuAyJI5NZtSTweryiCFFv5EEK7/ljQ1JfJgywH6pABZMBeO2BUdmyFS/RB
 0OfwsPE0tvAzCYySTwYA829dJPQbK7l1uQQJLeZqeGN9LWk5JJja7wa81avkFeV/pBC1
 oaLYDBbJzDjxM9Ae7R/0zPnpbIUc/UFIOuLY3hKb0w2/9Z7kCKZ51mOqWtbDAhOLfctr
 1jENnGvS3m1eyyTbuhQIwrQXwaIKQbMSgrgirs9Hwnv25j2E+fVfQ+N1EJrqw7E+l5DJ
 Z19w==
X-Gm-Message-State: AFqh2kr32HtyGO28XGSsUPeUX61YKzpjIpR86l3VBTVpRraAK6O5GX6P
 PnLasxhGkHj83oSv8ayTRUFh5Ac+gghzfw0vuQQua4Oonx1fTFARgAuTzk3gs9bmx96GhZVpcv0
 VA8vbeqgt5LxgWF07H2GQwMEKWvX7gHqo/CKpfFHbb4hCtoDZADHzJahQRIrF
X-Received: by 2002:adf:e10d:0:b0:242:29d5:f1d4 with SMTP id
 t13-20020adfe10d000000b0024229d5f1d4mr1145523wrz.48.1671627896254; 
 Wed, 21 Dec 2022 05:04:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmXvGgVgdj3rRJDdyuxXK94ksas+L028esjFXfLEvjMC5J25VXkRk+KF4L5dfBYdQdcWs0SA==
X-Received: by 2002:adf:e10d:0:b0:242:29d5:f1d4 with SMTP id
 t13-20020adfe10d000000b0024229d5f1d4mr1145501wrz.48.1671627895912; 
 Wed, 21 Dec 2022 05:04:55 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5242000000b0024287d9d4a8sm15296643wrc.74.2022.12.21.05.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:54 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Longpeng <longpeng2@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 09/41] vdpa: add vdpa-dev support
Message-ID: <20221221130339.1234592-10-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

Supports vdpa-dev, we can use the deivce directly:

-M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221215134944.2809-3-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vdpa-dev.h |  43 ++++
 hw/virtio/vdpa-dev.c         | 376 +++++++++++++++++++++++++++++++++++
 hw/virtio/Kconfig            |   5 +
 hw/virtio/meson.build        |   1 +
 4 files changed, 425 insertions(+)
 create mode 100644 include/hw/virtio/vdpa-dev.h
 create mode 100644 hw/virtio/vdpa-dev.c

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
-- 
MST


