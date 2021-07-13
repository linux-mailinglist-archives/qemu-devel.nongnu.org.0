Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C523C799B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:25:27 +0200 (CEST)
Received: from localhost ([::1]:52140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QqE-00058t-UH
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qbr-0006q8-IU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qbp-0007l3-8W
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=31CzBqlNtzKmeLcB0ac8hxCFBRfN/IS/yRARZnMPd0g=;
 b=AVEWBUpAuyr36M58HzwnXb9d5cm5hepA5PQ1UVtX5lxH5Mfe1Tuc8szqxTvhh4/bDsICWm
 VPwRPgu4EFlUl9DpkItrsA940uTP7j71EgOOZ8GE9CEO1ogSHaGENeJD3xgvIQInl5q027
 y4PvWtJGtnIS5cc/+qaWk9Z4e/gdo0U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-t0PmG9lbMNSJvuNdHn8qSA-1; Tue, 13 Jul 2021 18:10:31 -0400
X-MC-Unique: t0PmG9lbMNSJvuNdHn8qSA-1
Received: by mail-wr1-f72.google.com with SMTP id
 g9-20020adff3c90000b0290140a25efc6dso340271wrp.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=31CzBqlNtzKmeLcB0ac8hxCFBRfN/IS/yRARZnMPd0g=;
 b=OUOyHKpgKKizUOlEeKRxDRA5OJTmJGimZu0HBNIB+9D48uu+ocYfFqNGPuk/AzGx1L
 B88Q/VNRaXdU5R/obPITcRtEwZ5+lacxq4afYY3B7i5PiTFCvudnU5fJ0b/kpi1Xvr4t
 ts8ogeMH8etyBWXSpT2EMmd+2aAO/8Yq2XFPkTXHcnhJslCf60IKpPRHo7TotG+IaQKG
 6EEAXbQvCR/IHfxmF1fhiwYpzCRQnS/K/AwTKZeDse+ezeqntUwy0Z6U14UsurcuQWgZ
 nLs40rNBHJ+hSoosr1TAfFv+BnRgbZJifpEdLLUkgi3dOZaO8d9ANSuegQiyqZbG+hf3
 B5Dg==
X-Gm-Message-State: AOAM53138kTYRjj/NKt5nCDIWBxTWSctXTczK37OnaT/i/IsupDAz93f
 444bbgRD2qiT03LFtA0ujWFFYLZhAUanzqGSWGhTqJXV7Yq4t+6sFiXTNHYVfayzua8ChJjWlC2
 6u6A5WgI48qMvTYcK/5Vs1xpB684in6H6ld2NNrtvJaFSe2vfHKJXP1xOjPe8
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr8439636wrq.90.1626214229918; 
 Tue, 13 Jul 2021 15:10:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw28iSNrS22+/tL/A9phnQFLodCSOwW1EejNjMPKEdgp7fOzoWf4rvQayV8EC1g8pRs9EGHFQ==
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr8439611wrq.90.1626214229675; 
 Tue, 13 Jul 2021 15:10:29 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id o11sm262160wmq.1.2021.07.13.15.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:29 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] vhost-user-rng: Add vhost-user-rng implementation
Message-ID: <20210713220946.212562-8-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mathieu Poirier <mathieu.poirier@linaro.org>

Following in the footsteps of what whas done for vhost-user-i2c
and virtiofsd, introduce a random number generator (RNG) backend
that communicates with a vhost-user server to retrieve entropy.
That way another VMM could be using the same vhost-user daemon and
avoid having to write yet another RNG driver.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-Id: <20210710005929.1702431-2-mathieu.poirier@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-rng.h |  33 ++++
 hw/virtio/vhost-user-rng.c         | 294 +++++++++++++++++++++++++++++
 hw/virtio/Kconfig                  |   5 +
 hw/virtio/meson.build              |   1 +
 4 files changed, 333 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-rng.h
 create mode 100644 hw/virtio/vhost-user-rng.c

diff --git a/include/hw/virtio/vhost-user-rng.h b/include/hw/virtio/vhost-user-rng.h
new file mode 100644
index 0000000000..071539996d
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
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
new file mode 100644
index 0000000000..3825266bdf
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
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 0eda25c4e1..69066ab14e 100644
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
index fbff9bc9d4..e386791f2a 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -25,6 +25,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
MST


