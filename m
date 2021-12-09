Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A96E46EABC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:10:25 +0100 (CET)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvL3w-0005Ig-Lr
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:10:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqj-0002bY-1D
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:45 -0500
Received: from [2a00:1450:4864:20::42b] (port=45656
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqe-0001Xs-Gv
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o13so10098877wrs.12
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yXXniY95IkJujK31ekJh+HWJyF51d5WiUb5hhe8MAk=;
 b=KC1+f1ET47+q9q95fZK/81a2EiGWvHbJx4dasVFpkd+mj+y1cMBR7pRprwYoU+x353
 fLJcA0nU1FTLKtvXArsl0ohiiQrssqvTePNZX+eYiwonNCkzxxm+MfFA7XjyyNtv8ovI
 rHOFtrFVlfjLGjyj2h/i6igipsY6GK/LNde0MEgX76r1EWceNpRcZLwA0V+9vJ1xmA3I
 cM4MjSj/QPQI7xGeocxYP7xGmS9Az2ixa3iOtCpFaBWx/uUaKKFtv2RlPNNcFgIG8Erw
 4RFqPfx0KNYTmtiHJuMsu2y9ZKrbAtqsqCp1R+fMwqzM7mV0I8UJBk+W7I9O0oKyJJ0A
 2liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yXXniY95IkJujK31ekJh+HWJyF51d5WiUb5hhe8MAk=;
 b=42CWIlyVTqHR+lNdoG9dsfekxGQyxmfmIVrYZE46NH0F4CSXC0+KFdeWKiMvRd10Gu
 deXp/+64XlXHqZUKR50NcTy5oo8mPOCODLED9d9qIYp9H/qNTR4S/p5b/bU4Sn1rHdMF
 BR3cfpjMfI9MtmXpZNKy7SPWg+dRbRfM9bLyWjon4lUcwLvQIU6ww4/hto8+E/eZEIIU
 i6axBB7x2hW7fj1o6nsi7FDD3SgS+HUbm/46ouI57vP0rvwYFBlsK3ID1xwzqZKblFrH
 pUTMzGrm78BMsZPSz8zNSzolQGxoivwLttBDNaXhJyYQM533vNe13/LxoXgPoCfq+NWc
 obPQ==
X-Gm-Message-State: AOAM532/bMCMJunVeg8i4+TWe0g8a4awC3ULsGfo3fJR1B7sNlztU6e+
 LweavBL3j2U/HGwKB+3/YhaBdntS7aBAqQ==
X-Google-Smtp-Source: ABdhPJxLWJxAdAQ99pC/en2CxosCg9E2t2EZJdt69Mn4s6NiGoiErVWoF8OyUIw7dE50MAZLAM8BWg==
X-Received: by 2002:adf:e109:: with SMTP id t9mr6801799wrz.387.1639061798715; 
 Thu, 09 Dec 2021 06:56:38 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:38 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 3/8] vhost-user-video: boiler plate code for vhost-user-video
 device
Date: Thu,  9 Dec 2021 14:55:56 +0000
Message-Id: <20211209145601.331477-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.griffin@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Griffin <peter.griffin@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 hw/display/Kconfig                   |   5 +
 hw/display/meson.build               |   3 +
 hw/display/vhost-user-video.c        | 386 +++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-video.h |  41 +++
 4 files changed, 435 insertions(+)
 create mode 100644 hw/display/vhost-user-video.c
 create mode 100644 include/hw/virtio/vhost-user-video.h

diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a2306b67d8..186163b015 100644
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
index 861c43ff98..48284528cf 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -37,6 +37,9 @@ softmmu_ss.add(when: 'CONFIG_MACFB', if_true: files('macfb.c'))
 softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
 
 specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
+specific_ss.add(when: 'CONFIG_VHOST_USER_VIDEO', if_true: files('vhost-user-video.c'))
+specific_ss.add(when: ['CONFIG_VHOST_USER_VIDEO', 'CONFIG_VIRTIO_PCI' ],
+  if_true: files('vhost-user-video-pci.c'))
 
 if config_all_devices.has_key('CONFIG_QXL')
   qxl_ss = ss.source_set()
diff --git a/hw/display/vhost-user-video.c b/hw/display/vhost-user-video.c
new file mode 100644
index 0000000000..506e350365
--- /dev/null
+++ b/hw/display/vhost-user-video.c
@@ -0,0 +1,386 @@
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
+/* currently there is no VIDEO enc/dec defined in Linux virtio_ids.h */
+#define VIRTIO_ID_VIDEO_ENC         30
+#define VIRTIO_ID_VIDEO_DEC         31
+#define MAX_CAPS_LEN 4096
+
+static void vhost_user_video_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
+    struct virtio_video_config *vconfig = (struct virtio_video_config *)config;
+    int ret;
+    Error *local_err = NULL;
+
+    memset(config, 0, sizeof(struct virtio_video_config));
+
+    ret = vhost_dev_get_config(&video->vhost_dev, config,
+                               sizeof(struct virtio_video_config), &local_err);
+    if (ret) {
+        error_report("vhost-user-video: get device config space failed");
+
+        /*TODO vhost_dev_get_config() fails so for now lets just set it here */
+        vconfig = (struct virtio_video_config *)config;
+        vconfig->version = 0;
+        vconfig->max_caps_length = MAX_CAPS_LEN;
+        vconfig->max_resp_length = MAX_CAPS_LEN;
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
+    ret = vhost_dev_start(&video->vhost_dev, vdev);
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
+    vhost_dev_stop(&video->vhost_dev, vdev);
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
+    vhost_virtqueue_mask(&video->vhost_dev, vdev, idx, mask);
+}
+
+static bool vhost_user_video_guest_notifier_pending(VirtIODevice *vdev, int idx)
+{
+    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
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
+    if (!vhost_user_init(&video->vhost_user, &video->conf.chardev, errp)) {
+        return;
+    }
+
+    /* TODO Implement VIDEO_ENC, currently only support VIDEO_DEC */
+    virtio_init(vdev, "vhost-user-video", VIRTIO_ID_VIDEO_DEC,
+                sizeof(struct virtio_video_config));
+
+    /* one command queue and one event queue */
+    video->vhost_dev.nvqs = 2;
+    video->vhost_dev.vqs = g_new0(struct vhost_virtqueue,
+                                  video->vhost_dev.nvqs);
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
index 0000000000..09a4374ca6
--- /dev/null
+++ b/include/hw/virtio/vhost-user-video.h
@@ -0,0 +1,41 @@
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
2.25.1


