Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8284349A1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:03:15 +0200 (CEST)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9NK-0001YC-Tc
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i6-0004nS-82
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hu-0003VO-Bw
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpF7at57/5nWwGoTd9m+XJz9rpHOa+ik4ru0SH8rVvg=;
 b=ghwidI8bqrBoonYYBhUPyk5gP695SqzxOGItUrKtwpodEQF+f1qJ1ijvDl26vdxJljaPVp
 8RIMG/TdsbvJ7QEpCwYyvWv65gkFJqEI/5iux9TofPGsIgYMgx2qub/jkSqIsvhlP07m2y
 CoG7TBxIvKTH154GF41iq+XEb4E/baI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-997ixgnYPY-Fxo3Jco6Gqg-1; Wed, 20 Oct 2021 06:20:19 -0400
X-MC-Unique: 997ixgnYPY-Fxo3Jco6Gqg-1
Received: by mail-ed1-f70.google.com with SMTP id
 e14-20020a056402088e00b003db6ebb9526so20454381edy.22
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EpF7at57/5nWwGoTd9m+XJz9rpHOa+ik4ru0SH8rVvg=;
 b=5Q1uePDAgjVhFNSmUA2+2YLNSCZoH5CfLN8nCa+KtIY5akb7e4b7/r8gfPtR2+mDvA
 p7q16yisMf3TTCNcYeYNeUCn6lRmGMGixLE3IsstrQdCPpxGRIKBysvhK8Z3LM20a6DI
 QcXOWZzr//Yw8odxIPngq5x4tKqPXlD/PHD8dljVPqNUu1L4OfXclf6S/GFdL9gmCY/x
 9oE6tAdKTn0L065qdGYQa6gVIofrwKRLe5IvSMcIgeE9plCUaw16RdSsquoDRsp0L5Tr
 eYw/fJ9aptqDscnf4gWhVskWfOFktyMZuKkA0brSXNY6btrP4SDf/op+0Alc92xrh8Xf
 yxjg==
X-Gm-Message-State: AOAM531eeJcJaDDMx0ma50xaW3BfFxXcwKaXiv2yPGy4HJsgYaeI+i66
 dG5rEGervy57y7D/fR670z9+I0BIqt8DTLci754X4fzzPng7H3I24i0VwBj2EBQiCspAmk7bWoh
 3vy4t/n6Z0UqDvl2eR5gP8sggFnSmM64ZBnM/nxmVx9IU7p960oF2DO6hBT7t
X-Received: by 2002:a17:907:e88:: with SMTP id
 ho8mr10290179ejc.359.1634725217869; 
 Wed, 20 Oct 2021 03:20:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzgNKEjNYHwz07XHE8OIG2yg41D3IEzSyvvUO+f3J+nbaycPhOaUoipjuPTi3xZC8U/zx42Q==
X-Received: by 2002:a17:907:e88:: with SMTP id
 ho8mr10290142ejc.359.1634725217568; 
 Wed, 20 Oct 2021 03:20:17 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id f22sm948933edu.26.2021.10.20.03.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:17 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/44] vhost-user-rng: Add vhost-user-rng implementation
Message-ID: <20211020101844.988480-23-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mathieu Poirier <mathieu.poirier@linaro.org>

Introduce a random number generator (RNG) backend that communicates
with a vhost-user server to retrieve entropy.  That way other VMM
that comply with the vhost user protocl can use the same vhost-user
daemon without having to write yet another RNG driver.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-Id: <20211012205904.4106769-2-mathieu.poirier@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-rng.h |  33 ++++
 hw/virtio/vhost-user-rng.c         | 289 +++++++++++++++++++++++++++++
 hw/virtio/Kconfig                  |   5 +
 hw/virtio/meson.build              |   1 +
 4 files changed, 328 insertions(+)
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
index 0000000000..209ee5bf9a
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
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 35ab45e209..c144d42f9b 100644
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
index bc352a6009..ae6b2cde10 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -27,6 +27,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
MST


