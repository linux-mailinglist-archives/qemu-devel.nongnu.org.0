Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C26C4D7B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezLr-00084S-LY; Wed, 22 Mar 2023 10:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLl-00081b-1J
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLi-0007LD-Nt
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SSUNF/BimE8C399TFeTrg4OO5iVpzjrPmfPv58jwtyI=;
 b=RjoeUSXtLEcDXO1Chtj05lrFYGslquygpaTycZf9rcfEJjNQb/Gq14/GBH5fF7HikjrNXW
 cXwUAwQN5FKTt727BH2UJLyK1dlMr+v60euzruEpVvT9sIRCKS0AuZwXZm34Xmn9HYLshf
 ewPB0jOMhttrFv5QtKIPqxr6ljbSG+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-UumvJf_mPQ2G1sZ5rU8NrQ-1; Wed, 22 Mar 2023 10:21:50 -0400
X-MC-Unique: UumvJf_mPQ2G1sZ5rU8NrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90C2A100DEA9;
 Wed, 22 Mar 2023 14:21:45 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9C2A40C6E68;
 Wed, 22 Mar 2023 14:21:42 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/12] vhost-user-video: boiler plate code for
 vhost-user-video device
Date: Wed, 22 Mar 2023 15:21:23 +0100
Message-Id: <20230322142132.22909-4-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
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

From: Peter Griffin <peter.griffin@linaro.org>

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 hw/display/Kconfig                   |   5 +
 hw/display/meson.build               |   3 +
 hw/display/vhost-user-video.c        | 410 +++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-video.h |  42 +++
 4 files changed, 460 insertions(+)
 create mode 100644 hw/display/vhost-user-video.c
 create mode 100644 include/hw/virtio/vhost-user-video.h

diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 7b3da68d1c..9a9dd3e335 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -118,6 +118,11 @@ config VHOST_USER_VGA
     default y
     depends on VIRTIO_VGA && VHOST_USER_GPU
 
+config VHOST_USER_VIDEO
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
+
 config DPCD
     bool
     select AUX
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 4191694380..5eacf84b1f 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -37,6 +37,9 @@ softmmu_ss.add(when: 'CONFIG_MACFB', if_true: files('macfb.c'))
 softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
 
 specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
+specific_ss.add(when: 'CONFIG_VHOST_USER_VIDEO', if_true: files('vhost-user-video.c'))
+specific_ss.add(when: ['CONFIG_VHOST_USER_VIDEO', 'CONFIG_VIRTIO_PCI' ],
+  if_true: files('vhost-user-video-pci.c'))
 
 if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
     config_all_devices.has_key('CONFIG_VGA_PCI') or
diff --git a/hw/display/vhost-user-video.c b/hw/display/vhost-user-video.c
new file mode 100644
index 0000000000..9cc6a717d5
--- /dev/null
+++ b/hw/display/vhost-user-video.c
@@ -0,0 +1,410 @@
+/*
+ * Vhost-user VIDEO virtio device
+ *
+ * This is the boilerplate for instantiating a vhost-user device
+ * implementing a virtio-video device.
+ *
+ * The virtio video decoder and encoder devices are virtual devices that
+ * support encoding and decoding respectively.
+ *
+ * The actual back-end for this driver is the vhost-user-video daemon.
+ * The code here just connects up the device in QEMU and allows it to
+ * be instantiated.
+ *
+ * Copyright Red Hat, Inc. 2023
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/vhost-user-video.h"
+#include "qemu/error-report.h"
+
+#define MAX_CAPS_LEN 4096
+
+static void
+vhost_user_video_get_config(VirtIODevice *vdev, uint8_t *config_data)
+{
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+    Error *local_err = NULL;
+    int ret;
+
+    memset(config_data, 0, sizeof(struct virtio_video_config));
+
+    ret = vhost_dev_get_config(&video->vhost_dev,
+                               config_data, sizeof(struct virtio_video_config),
+                               &local_err);
+    if (ret) {
+        error_report_err(local_err);
+        return;
+    }
+}
+
+static void vhost_user_video_start(VirtIODevice *vdev)
+{
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+    int i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return;
+    }
+
+    ret = vhost_dev_enable_notifiers(&video->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", -ret);
+        return;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, video->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", -ret);
+        goto err_host_notifiers;
+    }
+
+    video->vhost_dev.acked_features = vdev->guest_features;
+
+    video->vhost_dev.vq_index_end = video->vhost_dev.nvqs;
+    ret = vhost_dev_start(&video->vhost_dev, vdev, true);
+    if (ret < 0) {
+        error_report("Error starting vhost-user-video: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
+    /*
+     * guest_notifier_mask/pending not used yet, so just unmask
+     * everything here.  virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < video->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&video->vhost_dev, vdev, i, false);
+    }
+
+    return;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, video->vhost_dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&video->vhost_dev, vdev);
+}
+
+static void vhost_user_video_stop(VirtIODevice *vdev)
+{
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&video->vhost_dev, vdev, true);
+
+    ret = k->set_guest_notifiers(qbus->parent, video->vhost_dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&video->vhost_dev, vdev);
+}
+
+static void vhost_user_video_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (video->vhost_dev.started == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        vhost_user_video_start(vdev);
+    } else {
+        vhost_user_video_stop(vdev);
+    }
+}
+
+static uint64_t vhost_user_video_get_features(VirtIODevice *vdev,
+                                      uint64_t requested_features,
+                                      Error **errp)
+{
+    /* currently only support guest pages */
+    virtio_add_feature(&requested_features,
+                       VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES);
+
+    return requested_features;
+}
+
+static void vhost_user_video_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void vhost_user_video_guest_notifier_mask(VirtIODevice *vdev, int idx,
+                                            bool mask)
+{
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
+    vhost_virtqueue_mask(&video->vhost_dev, vdev, idx, mask);
+}
+
+static bool vhost_user_video_guest_notifier_pending(VirtIODevice *vdev, int idx)
+{
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+
+    /*
+     * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
+     * as the Marco of configure interrupt's IDX, If this driver does not
+     * support, the function will return
+     */
+
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
+
+    return vhost_virtqueue_pending(&video->vhost_dev, idx);
+}
+
+/*
+ * Chardev connect/disconnect events
+ */
+
+static int vhost_user_video_handle_config_change(struct vhost_dev *dev)
+{
+    int ret;
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(dev->vdev);
+    Error *local_err = NULL;
+
+    ret = vhost_dev_get_config(dev, (uint8_t *)&video->conf.config,
+                               sizeof(struct virtio_video_config), &local_err);
+    if (ret < 0) {
+        error_report("get config space failed");
+        return -1;
+    }
+
+    return 0;
+}
+
+const VhostDevConfigOps video_ops = {
+    .vhost_dev_config_notifier = vhost_user_video_handle_config_change,
+};
+
+static int vhost_user_video_connect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+
+    if (video->connected) {
+        return 0;
+    }
+    video->connected = true;
+
+    /* restore vhost state */
+    if (virtio_device_started(vdev, vdev->status)) {
+        vhost_user_video_start(vdev);
+    }
+
+    return 0;
+}
+
+static void vhost_user_video_disconnect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+
+    if (!video->connected) {
+        return;
+    }
+    video->connected = false;
+
+    if (video->vhost_dev.started) {
+        vhost_user_video_stop(vdev);
+    }
+
+    vhost_dev_cleanup(&video->vhost_dev);
+}
+
+static void vhost_user_video_event(void *opaque, QEMUChrEvent event)
+{
+    DeviceState *dev = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vhost_user_video_connect(dev) < 0) {
+            qemu_chr_fe_disconnect(&video->conf.chardev);
+            return;
+        }
+        break;
+    case CHR_EVENT_CLOSED:
+        vhost_user_video_disconnect(dev);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserVIDEO *video)
+{
+    vhost_user_cleanup(&video->vhost_user);
+    virtio_delete_queue(video->command_vq);
+    virtio_delete_queue(video->event_vq);
+    virtio_cleanup(vdev);
+    g_free(video->vhost_dev.vqs);
+    video->vhost_dev.vqs = NULL;
+}
+
+
+static void vhost_user_video_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(dev);
+    int ret;
+
+    if (!video->conf.chardev.chr) {
+        error_setg(errp, "vhost-user-video: chardev is mandatory");
+        return;
+    }
+
+    if (!vhost_user_init(&video->vhost_user, &video->conf.chardev, errp)) {
+        return;
+    }
+
+    /* TODO Implement VIDEO_ENC, currently only support VIDEO_DEC */
+    virtio_init(vdev, VIRTIO_ID_VIDEO_DECODER, sizeof(struct virtio_video_config));
+
+    /* one command queue and one event queue */
+    video->vhost_dev.nvqs = 2;
+    video->vhost_dev.vqs = g_new0(struct vhost_virtqueue,
+                                  video->vhost_dev.nvqs);
+    video->vhost_dev.vq_index = 0;
+
+    vhost_dev_set_config_notifier(&video->vhost_dev, &video_ops);
+    video->vhost_user.supports_config = true;
+
+    ret = vhost_dev_init(&video->vhost_dev, &video->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
+    if (ret < 0) {
+        error_report("vhost_dev_init failed: %s", strerror(-ret));
+        goto vhost_dev_init_failed;
+    }
+
+    /* One command queue, for sending commands */
+    video->command_vq = virtio_add_queue(vdev, 128,
+                                         vhost_user_video_handle_output);
+
+    if (!video->command_vq) {
+        error_setg_errno(errp, -1, "virtio_add_queue() failed");
+        goto cmd_q_fail;
+    }
+
+    /* One event queue, for sending events */
+    video->event_vq = virtio_add_queue(vdev, 128,
+                                       vhost_user_video_handle_output);
+
+    if (!video->command_vq) {
+        error_setg_errno(errp, -1, "virtio_add_queue() failed");
+        goto event_q_fail;
+    }
+
+    /*
+     * At this point the next event we will get is a connection from
+     * the daemon on the control socket.
+     */
+
+    qemu_chr_fe_set_handlers(&video->conf.chardev,  NULL,
+                             NULL, vhost_user_video_event,
+                             NULL, (void *)dev, NULL, true);
+
+    return;
+
+event_q_fail:
+    virtio_delete_queue(video->event_vq);
+cmd_q_fail:
+    vhost_user_cleanup(&video->vhost_user);
+vhost_dev_init_failed:
+    virtio_cleanup(vdev);
+
+}
+
+static void vhost_user_video_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(dev);
+
+    /* This will stop vhost backend if appropriate. */
+    vhost_user_video_set_status(vdev, 0);
+
+    do_vhost_user_cleanup(vdev, video);
+}
+
+static const VMStateDescription vhost_user_video_vmstate = {
+    .name = "vhost-user-video",
+    .unmigratable = 1,
+};
+
+static Property vhost_user_video_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserVIDEO, conf.chardev),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vhost_user_video_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vhost_user_video_properties);
+    dc->vmsd = &vhost_user_video_vmstate;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    vdc->realize = vhost_user_video_device_realize;
+    vdc->unrealize = vhost_user_video_device_unrealize;
+    vdc->get_features = vhost_user_video_get_features;
+    vdc->get_config = vhost_user_video_get_config;
+    vdc->set_status = vhost_user_video_set_status;
+    vdc->guest_notifier_mask = vhost_user_video_guest_notifier_mask;
+    vdc->guest_notifier_pending = vhost_user_video_guest_notifier_pending;
+}
+
+static const TypeInfo vhost_user_video_info = {
+    .name = TYPE_VHOST_USER_VIDEO,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostUserVIDEO),
+    .class_init = vhost_user_video_class_init,
+};
+
+static void vhost_user_video_register_types(void)
+{
+    type_register_static(&vhost_user_video_info);
+}
+
+type_init(vhost_user_video_register_types)
diff --git a/include/hw/virtio/vhost-user-video.h b/include/hw/virtio/vhost-user-video.h
new file mode 100644
index 0000000000..f8329c3b36
--- /dev/null
+++ b/include/hw/virtio/vhost-user-video.h
@@ -0,0 +1,42 @@
+/*
+ * vhost-user-video virtio device
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _VHOST_USER_VIDEO_H_
+#define _VHOST_USER_VIDEO_H_
+
+#include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/virtio_video.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-user.h"
+#include "chardev/char-fe.h"
+
+#define TYPE_VHOST_USER_VIDEO "vhost-user-video-device"
+#define VHOST_USER_VIDEO(obj) \
+        OBJECT_CHECK(VHostUserVIDEO, (obj), TYPE_VHOST_USER_VIDEO)
+
+typedef struct {
+    CharBackend chardev;
+    struct virtio_video_config config;
+} VHostUserVIDEOConf;
+
+typedef struct {
+    /*< private >*/
+    VirtIODevice parent;
+    VHostUserVIDEOConf conf;
+    struct vhost_virtqueue *vhost_vq;
+    struct vhost_dev vhost_dev;
+    VhostUserState vhost_user;
+    VirtQueue *command_vq;
+    VirtQueue *event_vq;
+    bool connected;
+    /*< public >*/
+} VHostUserVIDEO;
+
+
+#endif /* _VHOST_USER_VIDEO_H_ */
-- 
2.39.2


