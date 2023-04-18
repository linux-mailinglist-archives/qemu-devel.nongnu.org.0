Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F36E6962
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:24:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5W-0006n3-Ih; Tue, 18 Apr 2023 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5U-0006ma-IA
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5S-0001Av-8H
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l31-20020a05600c1d1f00b003f1718d89b2so168513wms.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834904; x=1684426904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A+5QxSTbXGCo55UOJ3nazzxUb4+UhfLG866jSa6yr4=;
 b=f1mgtZ69k7Kj4ijAMctLgIExd27VV0GYl8ZoJeqILw5TcDiA6VMDGnpLmzyPnBWUHW
 f56feqkULdz6T5g838ckwfrD2TDGMvol2vfZzqb30tBheX1yBcz5mqU+UU1pYtqxjpvC
 b6aCgaP8/bIZlKUp1kGL3126f9Eu9qH83/sgyndWcMiFT715RhaRoUFUFfpDdYsTV3HC
 5GvfarJtUDIUfvbVa8f1ZQ+NHuhQBMQQaxoXrATs4+8Ez3Eqn8ZhFlh3g0RRPrnqKuMT
 qGOX8UsgyU1ika6PwVKKBJQnOLhPU6jTy36jRWdJm/+lk4AzUhAebndGsrqMGIObcCec
 s6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834904; x=1684426904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A+5QxSTbXGCo55UOJ3nazzxUb4+UhfLG866jSa6yr4=;
 b=D66YBpmodvb57xMrK9215YYO38TeIYMWxjD2XLMbSoawG1OseF+sy5SLOMmYb+Hznb
 OufR1BVDNSsvqNpaqh+IcYUEqblEnwU7kRFKSVpoD1haP+HGPZqE83rCLWgA89ezf551
 tmbuUyhtom036crUg0TjE6nEGNb4h1pME2BpDhxzfn47MiHyI0ZyvGUpA4+YBsZqeBNi
 IlfwEQhkV8g/Jpd6fLlr5xDYMX7Ofy4Qs59W+ed1rsLo1pvWDx5sbT5qXZx6IakPW/fv
 YzZ5oO5a3mBoW2NhPRKKyQEimOhxB4uuw8NiYULhegteNPWq9cWgViTWomgGNvMpc/Jo
 m2NQ==
X-Gm-Message-State: AAQBX9fhu2wnMuqN4KOj3ARqvjm+MC/TGTnyrOOmVhujqlgpqPcfwCB4
 PdHsfQUZm1LBdUs/1SfagxI4cA==
X-Google-Smtp-Source: AKy350YP1fbjOOYXG2WOh2XmVrQZoe2HuR6jQr4P8L9Cve/cadsxyV3oO9MzBdDK1TMAVJalQLnR2A==
X-Received: by 2002:a05:600c:228b:b0:3f1:718d:a21c with SMTP id
 11-20020a05600c228b00b003f1718da21cmr6200468wmf.31.1681834904383; 
 Tue, 18 Apr 2023 09:21:44 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003f173956a82sm6563522wmq.21.2023.04.18.09.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E41061FFBF;
 Tue, 18 Apr 2023 17:21:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, virtio-fs@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 07/13] virtio: add vhost-user-base and a generic
 vhost-user-device
Date: Tue, 18 Apr 2023 17:21:34 +0100
Message-Id: <20230418162140.373219-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
vhost-user backends. This provides a generic vhost-user-base QOM
object and a derived vhost-user-device for which the user needs to
provide the few bits of information that aren't currently provided by
the vhost-user protocol. This should provide a baseline implementation
from which the other vhost-user stub can specialise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - split into vub and vud
---
 include/hw/virtio/vhost-user-device.h |  45 ++++
 hw/virtio/vhost-user-device.c         | 324 ++++++++++++++++++++++++++
 hw/virtio/meson.build                 |   2 +
 3 files changed, 371 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-device.h
 create mode 100644 hw/virtio/vhost-user-device.c

diff --git a/include/hw/virtio/vhost-user-device.h b/include/hw/virtio/vhost-user-device.h
new file mode 100644
index 0000000000..9105011e25
--- /dev/null
+++ b/include/hw/virtio/vhost-user-device.h
@@ -0,0 +1,45 @@
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
+#define TYPE_VHOST_USER_BASE "vhost-user-base"
+
+OBJECT_DECLARE_TYPE(VHostUserBase, VHostUserBaseClass, VHOST_USER_BASE)
+
+struct VHostUserBase {
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
+    /* needed so we can use the base realize after specialisation
+       tweaks */
+struct VHostUserBaseClass {
+    /*< private >*/
+    VirtioDeviceClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+};
+
+/* shared for the benefit of the derived pci class */
+#define TYPE_VHOST_USER_DEVICE "vhost-user-device"
+
+#endif /* QEMU_VHOST_USER_DEVICE_H */
diff --git a/hw/virtio/vhost-user-device.c b/hw/virtio/vhost-user-device.c
new file mode 100644
index 0000000000..b0239fa033
--- /dev/null
+++ b/hw/virtio/vhost-user-device.c
@@ -0,0 +1,324 @@
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
+static void vub_start(VirtIODevice *vdev)
+{
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    VHostUserBase *vub = VHOST_USER_BASE(vdev);
+    int ret, i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return;
+    }
+
+    ret = vhost_dev_enable_notifiers(&vub->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", -ret);
+        return;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, vub->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", -ret);
+        goto err_host_notifiers;
+    }
+
+    vub->vhost_dev.acked_features = vdev->guest_features;
+
+    ret = vhost_dev_start(&vub->vhost_dev, vdev, true);
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
+    for (i = 0; i < vub->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&vub->vhost_dev, vdev, i, false);
+    }
+
+    return;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, vub->vhost_dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&vub->vhost_dev, vdev);
+}
+
+static void vub_stop(VirtIODevice *vdev)
+{
+    VHostUserBase *vub = VHOST_USER_BASE(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&vub->vhost_dev, vdev, true);
+
+    ret = k->set_guest_notifiers(qbus->parent, vub->vhost_dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&vub->vhost_dev, vdev);
+}
+
+static void vub_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserBase *vub = VHOST_USER_BASE(vdev);
+    bool should_start = virtio_device_should_start(vdev, status);
+
+    if (vhost_dev_is_started(&vub->vhost_dev) == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        vub_start(vdev);
+    } else {
+        vub_stop(vdev);
+    }
+}
+
+/*
+ * For an implementation where everything is delegated to the backend
+ * we don't do anything other than return the full feature set offered
+ * by the daemon (module the reserved feature bit).
+ */
+static uint64_t vub_get_features(VirtIODevice *vdev,
+                                 uint64_t requested_features, Error **errp)
+{
+    VHostUserBase *vub = VHOST_USER_BASE(vdev);
+    /* This should be set when the vhost connection initialises */
+    g_assert(vub->vhost_dev.features);
+    return vub->vhost_dev.features & ~(1ULL << VHOST_USER_F_PROTOCOL_FEATURES);
+}
+
+static void vub_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserBase *vub)
+{
+    vhost_user_cleanup(&vub->vhost_user);
+
+    for (int i = 0; i < vub->num_vqs; i++) {
+        VirtQueue *vq = g_ptr_array_index(vub->vqs, i);
+        virtio_delete_queue(vq);
+    }
+
+    virtio_cleanup(vdev);
+}
+
+static int vub_connect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserBase *vub = VHOST_USER_BASE(vdev);
+
+    if (vub->connected) {
+        return 0;
+    }
+    vub->connected = true;
+
+    /* restore vhost state */
+    if (virtio_device_started(vdev, vdev->status)) {
+        vub_start(vdev);
+    }
+
+    return 0;
+}
+
+static void vub_disconnect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserBase *vub = VHOST_USER_BASE(vdev);
+
+    if (!vub->connected) {
+        return;
+    }
+    vub->connected = false;
+
+    if (vhost_dev_is_started(&vub->vhost_dev)) {
+        vub_stop(vdev);
+    }
+}
+
+static void vub_event(void *opaque, QEMUChrEvent event)
+{
+    DeviceState *dev = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserBase *vub = VHOST_USER_BASE(vdev);
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vub_connect(dev) < 0) {
+            qemu_chr_fe_disconnect(&vub->chardev);
+            return;
+        }
+        break;
+    case CHR_EVENT_CLOSED:
+        vub_disconnect(dev);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void vub_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserBase *vub = VHOST_USER_BASE(dev);
+    int ret;
+
+    if (!vub->chardev.chr) {
+        error_setg(errp, "vhost-user-device: missing chardev");
+        return;
+    }
+
+    if (!vub->virtio_id) {
+        error_setg(errp, "vhost-user-device: need to define device id");
+        return;
+    }
+
+    if (!vub->num_vqs) {
+        vub->num_vqs = 1; /* reasonable default? */
+    }
+
+    if (!vhost_user_init(&vub->vhost_user, &vub->chardev, errp)) {
+        return;
+    }
+
+    virtio_init(vdev, vub->virtio_id, 0);
+
+    /*
+     * Disable guest notifiers, by default all notifications will be via the
+     * asynchronous vhost-user socket.
+     */
+    vdev->use_guest_notifier_mask = false;
+
+    /* Allocate queues */
+    vub->vqs = g_ptr_array_sized_new(vub->num_vqs);
+    for (int i = 0; i < vub->num_vqs; i++) {
+        g_ptr_array_add(vub->vqs,
+                        virtio_add_queue(vdev, 4, vub_handle_output));
+    }
+
+    vub->vhost_dev.nvqs = vub->num_vqs;
+    vub->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vub->vhost_dev.nvqs);
+
+    /* connect to backend */
+    ret = vhost_dev_init(&vub->vhost_dev, &vub->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
+
+    if (ret < 0) {
+        do_vhost_user_cleanup(vdev, vub);
+    }
+
+    qemu_chr_fe_set_handlers(&vub->chardev, NULL, NULL, vub_event, NULL,
+                             dev, NULL, true);
+}
+
+static void vub_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserBase *vub = VHOST_USER_BASE(dev);
+    struct vhost_virtqueue *vhost_vqs = vub->vhost_dev.vqs;
+
+    /* This will stop vhost backend if appropriate. */
+    vub_set_status(vdev, 0);
+    vhost_dev_cleanup(&vub->vhost_dev);
+    g_free(vhost_vqs);
+    do_vhost_user_cleanup(vdev, vub);
+}
+
+static void vub_class_init(ObjectClass *klass, void *data)
+{
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    vdc->realize = vub_device_realize;
+    vdc->unrealize = vub_device_unrealize;
+    vdc->get_features = vub_get_features;
+    vdc->set_status = vub_set_status;
+}
+
+static const TypeInfo vub_info = {
+    .name = TYPE_VHOST_USER_BASE,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostUserBase),
+    .class_init = vub_class_init,
+    .class_size = sizeof(VHostUserBaseClass),
+    .abstract = true
+};
+
+
+/*
+ * The following is a concrete implementation of the base class which
+ * allows the user to define the key parameters via the command line.
+ */
+
+static const VMStateDescription vud_vmstate = {
+    .name = "vhost-user-device",
+    .unmigratable = 1,
+};
+
+static Property vud_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserBase, chardev),
+    DEFINE_PROP_UINT16("virtio-id", VHostUserBase, virtio_id, 0),
+    DEFINE_PROP_UINT32("num_vqs", VHostUserBase, num_vqs, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vud_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vud_properties);
+    dc->vmsd = &vud_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
+static const TypeInfo vud_info = {
+    .name = TYPE_VHOST_USER_DEVICE,
+    .parent = TYPE_VHOST_USER_BASE,
+    .instance_size = sizeof(VHostUserBase),
+    .class_init = vud_class_init,
+    .class_size = sizeof(VHostUserBaseClass),
+};
+
+static void vu_register_types(void)
+{
+    type_register_static(&vub_info);
+    type_register_static(&vud_info);
+}
+
+type_init(vu_register_types)
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


