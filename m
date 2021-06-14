Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01BC3A7073
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:31:31 +0200 (CEST)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lstF4-0004Fl-Og
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCW-0001Z6-VO
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:52 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lstCT-0005gk-TI
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:28:52 -0400
Received: by mail-pf1-x429.google.com with SMTP id y15so11472829pfl.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OhxZvgPrm7ef3poM6zsNJTUnNBRvQVJmMr/OyqsDOyY=;
 b=a52eH9e7NTScTq0N+5+9Fs5pdm6nzjDGhtj5T80tTC4rFWJh5426YsCM/NeCSBd9t2
 5EEFp6siW3hQQ+YPv+eisGABBolRd5IVgeaB5we7AHXa1Jjs9K7NzU3eznKcCbyOtnu1
 OBjcphGFNwBRaBlyVVVf554HOOo1032VEQPqp5JCHIn0bNzivYt13JWdvUDGoZNEQPy/
 zkmnfo1YJSsgSe76h8tUjfzr3+3BdhvezVdCj6hts1icp0340Yp5Mm9Ywd+GcBbxr3U1
 aWTPX/R5q8GbdJ614OzBYHuwmWdtzJQjRWQV4ayV2+PhRHz5R929CbzjTLq/VSDRjRKJ
 a5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhxZvgPrm7ef3poM6zsNJTUnNBRvQVJmMr/OyqsDOyY=;
 b=GftWsgPFVWoLzc5MFMXHak2UmESVDmtdHhWBay5SLVTzfQnBp+DxObfLm2NkpW36BW
 DftCcJZIS1/0XrDM1C53N6bhzhwjuh9qTk0DFNHO9fUhpj74Ww/rUKkwnG/ByEKwgoDf
 ke6bRx/7zaDpERb8Ps9E9FNZkYzdBdPdyPmB08ns04Up7DzdauDJWkS7U5kxk0glk8Us
 jQRLDxRAy8qAc6vB3OT/iP0/w7RgHEHK6TWuETD0APLLGhL4KWKFA6ieKaGQfMbDz4dH
 UeOkBVPL9jIn7/0fzrw2eVjoXY9aC3XXDOC4GX1BdoH/BNBcK2OiS6aO2OsMSHeGZ8oJ
 fLRw==
X-Gm-Message-State: AOAM5317zWHWddTFlRkJ+CvnrXUn38G8dhCzDGqqMC20zGQpQQbEX/57
 FdD33TWRkhWcN7HjY2wpoD1AU0Qdv/MAQA==
X-Google-Smtp-Source: ABdhPJwpy1k4oYhkPhon2qcHWZuHyvLeOJelCY8Dv5VbIJ+TzKVaNQTpXnVcLnDELgIa68TzG5lDGA==
X-Received: by 2002:a63:4f47:: with SMTP id p7mr19114721pgl.52.1623702528587; 
 Mon, 14 Jun 2021 13:28:48 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id fs10sm289029pjb.31.2021.06.14.13.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:28:47 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v2 1/5] vhost-user-rng: Add vhost-user-rng implementation
Date: Mon, 14 Jun 2021 14:28:38 -0600
Message-Id: <20210614202842.581640-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614202842.581640-1-mathieu.poirier@linaro.org>
References: <20210614202842.581640-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: qemu-devel@nongnu.org, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following in the footsteps of what whas done for vhost-user-i2c
and virtiofsd, introduce a random number generator (RNG) backend
that communicates with a vhost-user server to retrieve entropy.
That way another VMM could be using the same vhost-user daemon and
avoid having to write yet another RNG driver.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/virtio/Kconfig                  |   5 +
 hw/virtio/meson.build              |   1 +
 hw/virtio/vhost-user-rng.c         | 294 +++++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-rng.h |  33 ++++
 4 files changed, 333 insertions(+)
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 include/hw/virtio/vhost-user-rng.h

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 0eda25c4e1bf..69066ab14e6d 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -58,3 +58,8 @@ config VIRTIO_MEM
     depends on LINUX
     depends on VIRTIO_MEM_SUPPORTED
     select MEM_DEVICE
+
+config VHOST_USER_RNG
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc9d4de..e386791f2a05 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -25,6 +25,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
new file mode 100644
index 000000000000..78447e8d3791
--- /dev/null
+++ b/hw/virtio/vhost-user-rng.c
@@ -0,0 +1,294 @@
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
+    if (!rng->vhost_dev.vqs) {
+        error_setg_errno(errp, -1, "memory allocation failed");
+        goto vhost_dev_init_failed;
+    }
+
+    ret = vhost_dev_init(&rng->vhost_dev, &rng->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0);
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


