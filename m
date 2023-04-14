Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E26E280F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:08:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvI-0007M8-1F; Fri, 14 Apr 2023 12:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuk-0006S2-NB
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuh-0007z1-NN
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id q5so10625592wmo.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488277; x=1684080277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVJ8qhMaIj4CRymWVGCYn/io0gCtL6so6/34qr3Q4IM=;
 b=bds7EcdwVG3YzeinJ+j7Szh+sqm53B0ml1f/OflSsJMdq9zOhhRTZJsNTjzOBEtJdI
 0wsKOP0OVooCTu07qsCjhk4qSqxCDvtPql2byUWGmX2NVwfnQZwAzKgIJX1ocqag5itW
 zKtlM9IR/rTFBue/1y3T9oPWTFr5NE3tsJ273gZPaiziwmsOpKX2K6O4vABTRFiMP0JA
 HfhBfyDsC97varWdJgcBymzSK6E99l8ouHZasn5jn7Y/UmB0GJ00i5QFOpQPv7a3JS38
 tlSfeEzBMEtWep/AeEzXWiEAUJSrfXs1vAC2GyTiFyZ3cjKAfPfybVXPaCQmkbliLdX/
 KMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488277; x=1684080277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVJ8qhMaIj4CRymWVGCYn/io0gCtL6so6/34qr3Q4IM=;
 b=X02/0v7SMQ3K1vZIZv3/Ajs+KOcLll5vMlJOocf2fItUci7i1LFMzfsDR67fZsgj9v
 LCQ614PcifAUfq7Kvw1hH3qEQ5taOL4pB8Rh+Kuh6e68zPB/hXgeMjqre6QiZhRB52iC
 d6KqlrOIVyJZAMjFFM3Tf7/zNJNRREa+ghPiosBmoSeIW+vMCLhXmg5PvsHyLtqg9/hF
 O78/tQLNsfVBZ2CxqKbdH/6q9AjCh73QilmYvh7vDOkd++NqxU4fwva9NofJbTVgalDU
 Y48mRmxIkWqvNWc/+L4y3XENNyoucpV4YToWYiVn+Ew9tpX1Ha98y/MhI0wxGjzm/TsA
 zerQ==
X-Gm-Message-State: AAQBX9fc1q+Ejj69jFBm2iujLzL0LCyQLD427XXKFfUHjDwmxMc97QQ+
 qkaBGJo/mh+S3FFeBlWU2oSRuA==
X-Google-Smtp-Source: AKy350Z76Xd2kQCC3JlZ6YdwaaiRJVfVglkcuAeqoYjWudeBfTh8bNhTDhRqTvDtQ8eiMZSmFpcfmA==
X-Received: by 2002:a1c:e903:0:b0:3f0:a023:2614 with SMTP id
 q3-20020a1ce903000000b003f0a0232614mr4592475wmc.6.1681488277344; 
 Fri, 14 Apr 2023 09:04:37 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b003f09e294d5esm8088548wmb.6.2023.04.14.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 628E21FFBD;
 Fri, 14 Apr 2023 17:04:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 05/12] virtio: add generic vhost-user-device
Date: Fri, 14 Apr 2023 17:04:26 +0100
Message-Id: <20230414160433.2096866-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In theory we shouldn't need to repeat so much boilerplate to support
vhost-user backends. This provides a generic vhost-user-device for
which the user needs to provide the few bits of information that
aren't currently provided by the vhost-user protocol. This should
provide a baseline implementation from which the other vhost-user stub
can specialise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/vhost-user-device.h |  32 +++
 hw/virtio/vhost-user-device.c         | 303 ++++++++++++++++++++++++++
 hw/virtio/meson.build                 |   2 +
 3 files changed, 337 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-device.h
 create mode 100644 hw/virtio/vhost-user-device.c

diff --git a/include/hw/virtio/vhost-user-device.h b/include/hw/virtio/vhost-user-device.h
new file mode 100644
index 0000000000..8d77f06721
--- /dev/null
+++ b/include/hw/virtio/vhost-user-device.h
@@ -0,0 +1,32 @@
+/*
+ * Vhost-user generic virtio device
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_VHOST_USER_DEVICE_H
+#define QEMU_VHOST_USER_DEVICE_H
+
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-user.h"
+
+#define TYPE_VHOST_USER_DEVICE "vhost-user-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserDevice, VHOST_USER_DEVICE)
+
+struct VHostUserDevice {
+    VirtIODevice parent;
+    /* Properties */
+    CharBackend chardev;
+    uint16_t virtio_id;
+    uint32_t num_vqs;
+    /* State tracking */
+    VhostUserState vhost_user;
+    struct vhost_virtqueue *vhost_vq;
+    struct vhost_dev vhost_dev;
+    GPtrArray *vqs;
+    bool connected;
+};
+
+#endif /* QEMU_VHOST_USER_DEVICE_H */
diff --git a/hw/virtio/vhost-user-device.c b/hw/virtio/vhost-user-device.c
new file mode 100644
index 0000000000..bfbf3b29cb
--- /dev/null
+++ b/hw/virtio/vhost-user-device.c
@@ -0,0 +1,303 @@
+/*
+ * Generic vhost-user stub. This can be used to connect to any
+ * vhost-user backend. All configuration details must be handled by
+ * the vhost-user daemon itself
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ * Author: Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/vhost-user-device.h"
+#include "qemu/error-report.h"
+
+static void vud_start(VirtIODevice *vdev)
+{
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+    int ret, i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return;
+    }
+
+    ret = vhost_dev_enable_notifiers(&vud->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", -ret);
+        return;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, vud->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", -ret);
+        goto err_host_notifiers;
+    }
+
+    vud->vhost_dev.acked_features = vdev->guest_features;
+
+    ret = vhost_dev_start(&vud->vhost_dev, vdev, true);
+    if (ret < 0) {
+        error_report("Error starting vhost-user-device: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
+    /*
+     * guest_notifier_mask/pending not used yet, so just unmask
+     * everything here. virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < vud->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&vud->vhost_dev, vdev, i, false);
+    }
+
+    return;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, vud->vhost_dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&vud->vhost_dev, vdev);
+}
+
+static void vud_stop(VirtIODevice *vdev)
+{
+    VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&vud->vhost_dev, vdev, true);
+
+    ret = k->set_guest_notifiers(qbus->parent, vud->vhost_dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&vud->vhost_dev, vdev);
+}
+
+static void vud_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+    bool should_start = virtio_device_should_start(vdev, status);
+
+    if (vhost_dev_is_started(&vud->vhost_dev) == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        vud_start(vdev);
+    } else {
+        vud_stop(vdev);
+    }
+}
+
+/*
+ * For an implementation where everything is delegated to the backend
+ * we don't do anything other than return the full feature set offered
+ * by the daemon (module the reserved feature bit).
+ */
+static uint64_t vud_get_features(VirtIODevice *vdev,
+                                 uint64_t requested_features, Error **errp)
+{
+    VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+    /* This should be set when the vhost connection initialises */
+    g_assert(vud->vhost_dev.features);
+    return vud->vhost_dev.features & ~(1ULL << VHOST_USER_F_PROTOCOL_FEATURES);
+}
+
+static void vud_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserDevice *vud)
+{
+    vhost_user_cleanup(&vud->vhost_user);
+
+    for (int i = 0; i < vud->num_vqs; i++) {
+        VirtQueue *vq = g_ptr_array_index(vud->vqs, i);
+        virtio_delete_queue(vq);
+    }
+
+    virtio_cleanup(vdev);
+}
+
+static int vud_connect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+
+    if (vud->connected) {
+        return 0;
+    }
+    vud->connected = true;
+
+    /* restore vhost state */
+    if (virtio_device_started(vdev, vdev->status)) {
+        vud_start(vdev);
+    }
+
+    return 0;
+}
+
+static void vud_disconnect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+
+    if (!vud->connected) {
+        return;
+    }
+    vud->connected = false;
+
+    if (vhost_dev_is_started(&vud->vhost_dev)) {
+        vud_stop(vdev);
+    }
+}
+
+static void vud_event(void *opaque, QEMUChrEvent event)
+{
+    DeviceState *dev = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vud_connect(dev) < 0) {
+            qemu_chr_fe_disconnect(&vud->chardev);
+            return;
+        }
+        break;
+    case CHR_EVENT_CLOSED:
+        vud_disconnect(dev);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void vud_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserDevice *vud = VHOST_USER_DEVICE(dev);
+    int ret;
+
+    if (!vud->chardev.chr) {
+        error_setg(errp, "vhost-user-device: missing chardev");
+        return;
+    }
+
+    if (!vud->virtio_id) {
+        error_setg(errp, "vhost-user-device: need to define device id");
+        return;
+    }
+
+    if (!vud->num_vqs) {
+        vud->num_vqs = 1; /* reasonable default? */
+    }
+
+    if (!vhost_user_init(&vud->vhost_user, &vud->chardev, errp)) {
+        return;
+    }
+
+    virtio_init(vdev, vud->virtio_id, 0);
+
+    /*
+     * Disable guest notifiers, by default all notifications will be via the
+     * asynchronous vhost-user socket.
+     */
+    vdev->use_guest_notifier_mask = false;
+
+    /* Allocate queues */
+    vud->vqs = g_ptr_array_sized_new(vud->num_vqs);
+    for (int i = 0; i < vud->num_vqs; i++) {
+        g_ptr_array_add(vud->vqs,
+                        virtio_add_queue(vdev, 4, vud_handle_output));
+    }
+
+    vud->vhost_dev.nvqs = vud->num_vqs;
+    vud->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vud->vhost_dev.nvqs);
+
+    /* connect to backend */
+    fprintf(stderr, "%s: doing vhost_dev_init()\n", __func__);
+    ret = vhost_dev_init(&vud->vhost_dev, &vud->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
+
+    if (ret < 0) {
+        do_vhost_user_cleanup(vdev, vud);
+    }
+
+    qemu_chr_fe_set_handlers(&vud->chardev, NULL, NULL, vud_event, NULL,
+                             dev, NULL, true);
+}
+
+static void vud_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserDevice *vud = VHOST_USER_DEVICE(dev);
+    struct vhost_virtqueue *vhost_vqs = vud->vhost_dev.vqs;
+
+    /* This will stop vhost backend if appropriate. */
+    vud_set_status(vdev, 0);
+    vhost_dev_cleanup(&vud->vhost_dev);
+    g_free(vhost_vqs);
+    do_vhost_user_cleanup(vdev, vud);
+}
+
+static const VMStateDescription vud_vmstate = {
+    .name = "vhost-user-device",
+    .unmigratable = 1,
+};
+
+static Property vud_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
+    DEFINE_PROP_UINT16("virtio-id", VHostUserDevice, virtio_id, 0),
+    DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vud_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vud_properties);
+    dc->vmsd = &vud_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    vdc->realize = vud_device_realize;
+    vdc->unrealize = vud_device_unrealize;
+    vdc->get_features = vud_get_features;
+    vdc->set_status = vud_set_status;
+}
+
+static const TypeInfo vud_info = {
+    .name = TYPE_VHOST_USER_DEVICE,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostUserDevice),
+    .class_init = vud_class_init,
+};
+
+static void vud_register_types(void)
+{
+    type_register_static(&vud_info);
+}
+
+type_init(vud_register_types)
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index bdec78bfc6..43e5fa3f7d 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -10,7 +10,9 @@ specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
 if have_vhost
   specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
   if have_vhost_user
+    # fixme - this really should be generic
     specific_virtio_ss.add(files('vhost-user.c'))
+    softmmu_virtio_ss.add(files('vhost-user-device.c'))
   endif
   if have_vhost_vdpa
     specific_virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
-- 
2.39.2


