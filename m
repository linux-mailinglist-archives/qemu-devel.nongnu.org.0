Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BCE42AE71
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:03:07 +0200 (CEST)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maOvS-0008Ub-93
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maOrh-0005uT-2i
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 16:59:13 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maOrf-0005Rx-0r
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 16:59:12 -0400
Received: by mail-pg1-x52b.google.com with SMTP id g184so264047pgc.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vhj6xazBaJToXUVOSdB9AuUCAs0ejcKbfrLA1IUKsDg=;
 b=z4fxZcRJiDGmmiNlESoVCR5m8tBgBaqPtUySU9QhEvgc8Xkp2MWG7ezPgTexj0CtOE
 8yPrz26yhGUfy/NE3u1p5kwc7r4cfBlBGnOR7D+iA5wUudnGsBHC6t6mASLoNgFEwedl
 6GIFSWbfn215suFT1XXnXdZoqjLrHEz7x3kImqRD+vPW5BZ4SY7rulqM18urz7IemGZQ
 +BwgLXXJnkMUqmsUZu1khFMvzUfSovNowOxWGOINrpeeDAIybU5fNpQ9EXV2nm4k5h7z
 VMKdd7z7lLrBEYnT93dAl3EIJRxsmlyrtWuwodn2kA8WOlVOlo7QwTKhil8c7vrydz/h
 0Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhj6xazBaJToXUVOSdB9AuUCAs0ejcKbfrLA1IUKsDg=;
 b=xUNa7vENx0YJ5Z5m0aRYfKdcUPvFv/OQ+Lbfstuh14ioE8j1KutnvIkZB+APD2ZLG4
 pa+k0MaplH5kJt1/+vc0tzAp/45CHrA2vfr1JUMgnREP7RsaXIu+JtlFXoIvlNRoM4RI
 EPHLvGn9aE9QUky4Ma3JXh9Aw7NUHKhhL3VKirJclWAd2FV664FKFqihDlP0I6xSYsG8
 cWjFVyiqOwlVsLGNEU1T9QnK2s6ZZgcloq6ddi18EEaCeVoXGsqLLQQ30FhmLamKBHZk
 uYpqhllpbOvx6HMPLu5EgLDF23FbBSeNwvjrZ9hipQ1pPXJvOeiyhRhOmFe8U4Fxptud
 rYIg==
X-Gm-Message-State: AOAM531nR4i4BnVnRTJocXmdXTyfpp9nG9uwIHNST3y4nkDMkVQRqQGH
 rsZ4TcnS75UFNpLQmioxhVQdNg==
X-Google-Smtp-Source: ABdhPJwSpoi1jqReB7K8vygGhX++fgvhMOa8AhTYSLhiM5KLZK9FDk53e9SObOr0J6TkpDhm6uuumw==
X-Received: by 2002:a63:fd06:: with SMTP id d6mr24784719pgh.466.1634072349659; 
 Tue, 12 Oct 2021 13:59:09 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id e24sm11695087pfn.8.2021.10.12.13.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 13:59:07 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH v5 1/3] vhost-user-rng: Add vhost-user-rng implementation
Date: Tue, 12 Oct 2021 14:59:02 -0600
Message-Id: <20211012205904.4106769-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012205904.4106769-1-mathieu.poirier@linaro.org>
References: <20211012205904.4106769-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a random number generator (RNG) backend that communicates
with a vhost-user server to retrieve entropy.  That way other VMM
that comply with the vhost user protocl can use the same vhost-user
daemon without having to write yet another RNG driver.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/virtio/Kconfig                  |   5 +
 hw/virtio/meson.build              |   1 +
 hw/virtio/vhost-user-rng.c         | 289 +++++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-rng.h |  33 ++++
 4 files changed, 328 insertions(+)
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 include/hw/virtio/vhost-user-rng.h

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 35ab45e2095c..c144d42f9bd0 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -63,3 +63,8 @@ config VHOST_USER_I2C
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_USER_RNG
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index bc352a600911..ae6b2cde1068 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -27,6 +27,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
new file mode 100644
index 000000000000..209ee5bf9acd
--- /dev/null
+++ b/hw/virtio/vhost-user-rng.c
@@ -0,0 +1,289 @@
+/*
+ * Vhost-user RNG virtio device
+ *
+ * Copyright (c) 2021 Mathieu Poirier <mathieu.poirier@linaro.org>
+ *
+ * Implementation seriously tailored on vhost-user-i2c.c
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/vhost-user-rng.h"
+#include "qemu/error-report.h"
+#include "standard-headers/linux/virtio_ids.h"
+
+static void vu_rng_start(VirtIODevice *vdev)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
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
+    ret = vhost_dev_enable_notifiers(&rng->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", -ret);
+        return;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, rng->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", -ret);
+        goto err_host_notifiers;
+    }
+
+    rng->vhost_dev.acked_features = vdev->guest_features;
+    ret = vhost_dev_start(&rng->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error starting vhost-user-rng: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
+    /*
+     * guest_notifier_mask/pending not used yet, so just unmask
+     * everything here. virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < rng->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&rng->vhost_dev, vdev, i, false);
+    }
+
+    return;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, rng->vhost_dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&rng->vhost_dev, vdev);
+}
+
+static void vu_rng_stop(VirtIODevice *vdev)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&rng->vhost_dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, rng->vhost_dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&rng->vhost_dev, vdev);
+}
+
+static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (rng->vhost_dev.started == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        vu_rng_start(vdev);
+    } else {
+        vu_rng_stop(vdev);
+    }
+}
+
+static uint64_t vu_rng_get_features(VirtIODevice *vdev,
+                                    uint64_t requested_features, Error **errp)
+{
+    /* No feature bits used yet */
+    return requested_features;
+}
+
+static void vu_rng_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void vu_rng_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+
+    vhost_virtqueue_mask(&rng->vhost_dev, vdev, idx, mask);
+}
+
+static bool vu_rng_guest_notifier_pending(VirtIODevice *vdev, int idx)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+
+    return vhost_virtqueue_pending(&rng->vhost_dev, idx);
+}
+
+static void vu_rng_connect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+
+    if (rng->connected) {
+        return;
+    }
+
+    rng->connected = true;
+
+    /* restore vhost state */
+    if (virtio_device_started(vdev, vdev->status)) {
+        vu_rng_start(vdev);
+    }
+}
+
+static void vu_rng_disconnect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+
+    if (!rng->connected) {
+        return;
+    }
+
+    rng->connected = false;
+
+    if (rng->vhost_dev.started) {
+        vu_rng_stop(vdev);
+    }
+}
+
+static void vu_rng_event(void *opaque, QEMUChrEvent event)
+{
+    DeviceState *dev = opaque;
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        vu_rng_connect(dev);
+        break;
+    case CHR_EVENT_CLOSED:
+        vu_rng_disconnect(dev);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void vu_rng_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserRNG *rng = VHOST_USER_RNG(dev);
+    int ret;
+
+    if (!rng->chardev.chr) {
+        error_setg(errp, "missing chardev");
+        return;
+    }
+
+    if (!vhost_user_init(&rng->vhost_user, &rng->chardev, errp)) {
+        return;
+    }
+
+    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
+
+    rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
+    if (!rng->req_vq) {
+        error_setg_errno(errp, -1, "virtio_add_queue() failed");
+        goto virtio_add_queue_failed;
+    }
+
+    rng->vhost_dev.nvqs = 1;
+    rng->vhost_dev.vqs = g_new0(struct vhost_virtqueue, rng->vhost_dev.nvqs);
+    ret = vhost_dev_init(&rng->vhost_dev, &rng->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "vhost_dev_init() failed");
+        goto vhost_dev_init_failed;
+    }
+
+    qemu_chr_fe_set_handlers(&rng->chardev, NULL, NULL, vu_rng_event, NULL,
+                             dev, NULL, true);
+
+    return;
+
+vhost_dev_init_failed:
+    virtio_delete_queue(rng->req_vq);
+virtio_add_queue_failed:
+    virtio_cleanup(vdev);
+    vhost_user_cleanup(&rng->vhost_user);
+}
+
+static void vu_rng_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserRNG *rng = VHOST_USER_RNG(dev);
+
+    vu_rng_set_status(vdev, 0);
+
+    vhost_dev_cleanup(&rng->vhost_dev);
+    g_free(rng->vhost_dev.vqs);
+    rng->vhost_dev.vqs = NULL;
+    virtio_delete_queue(rng->req_vq);
+    virtio_cleanup(vdev);
+    vhost_user_cleanup(&rng->vhost_user);
+}
+
+static const VMStateDescription vu_rng_vmstate = {
+    .name = "vhost-user-rng",
+    .unmigratable = 1,
+};
+
+static Property vu_rng_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserRNG, chardev),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vu_rng_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vu_rng_properties);
+    dc->vmsd = &vu_rng_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+
+    vdc->realize = vu_rng_device_realize;
+    vdc->unrealize = vu_rng_device_unrealize;
+    vdc->get_features = vu_rng_get_features;
+    vdc->set_status = vu_rng_set_status;
+    vdc->guest_notifier_mask = vu_rng_guest_notifier_mask;
+    vdc->guest_notifier_pending = vu_rng_guest_notifier_pending;
+}
+
+static const TypeInfo vu_rng_info = {
+    .name = TYPE_VHOST_USER_RNG,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostUserRNG),
+    .class_init = vu_rng_class_init,
+};
+
+static void vu_rng_register_types(void)
+{
+    type_register_static(&vu_rng_info);
+}
+
+type_init(vu_rng_register_types)
diff --git a/include/hw/virtio/vhost-user-rng.h b/include/hw/virtio/vhost-user-rng.h
new file mode 100644
index 000000000000..071539996d1d
--- /dev/null
+++ b/include/hw/virtio/vhost-user-rng.h
@@ -0,0 +1,33 @@
+/*
+ * Vhost-user RNG virtio device
+ *
+ * Copyright (c) 2021 Mathieu Poirier <mathieu.poirier@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _QEMU_VHOST_USER_RNG_H
+#define _QEMU_VHOST_USER_RNG_H
+
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-user.h"
+#include "chardev/char-fe.h"
+
+#define TYPE_VHOST_USER_RNG "vhost-user-rng"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserRNG, VHOST_USER_RNG)
+
+struct VHostUserRNG {
+    /*< private >*/
+    VirtIODevice parent;
+    CharBackend chardev;
+    struct vhost_virtqueue *vhost_vq;
+    struct vhost_dev vhost_dev;
+    VhostUserState vhost_user;
+    VirtQueue *req_vq;
+    bool connected;
+
+    /*< public >*/
+};
+
+#endif /* _QEMU_VHOST_USER_RNG_H */
-- 
2.25.1


