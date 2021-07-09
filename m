Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515713C1EB9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:02:15 +0200 (CEST)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ieU-0000ql-6d
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m1icp-0007jx-W7
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:00:32 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m1icn-0001qe-Fz
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:00:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id h4so8768375pgp.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVtvs09YWfMRM+kpFMalDZexe0JrTinz4HSZFi0y5ik=;
 b=KMlHHD/Lg+lWJcx4Ra9GUWzJqMJLQ6Bn0XyLmu0eoRkzuzVvfo8kLn8Zj5NP8OuB5x
 YP31nzWVAV4m0BGeoWgTSW7aS5QSuJTzM5x9MfkLeMGAAH0l1q63Roz4il+U2M4jl70T
 ESEya2rzlfEXH5UP/6oUYE0V58iFTY2bqgqOiFywWc63edwh74DjwiRxLWKa62Uz82Sk
 pn8JgW+dKxN8SUL1vaX4nEMGM/LgoqF7+MnBtZixLbPRM0+r7nSFV2TCxHu81OoBYuq8
 zr+pZcnGsqvlKZzCGvjFz1KwZGawjqP/+VRXYlSba/wLXBUtDmycKtxaMxg4Z4dO5ExK
 7xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVtvs09YWfMRM+kpFMalDZexe0JrTinz4HSZFi0y5ik=;
 b=W2qaRAmgMPjSnzYloBeMxKNhm/AOc5xIeaiAfS2eCBd3JksKIenCxz7U6xujFcp/kW
 3JZWzXLhBtYSSpGhMTV4MoGikUitmL76MdKVQEmNz/YSx5KMhB3wvqb+5k5KUUIKhste
 E9MGxLkjg5vse3+f5eZTRl21s8YOzmfTFgmO+aUWl9BoV5aBnjEeVs9wKaHB04J2Bojm
 NUVShOY7KbrqCgm3FDU/zQXdoAA4GhohdmFcZJsr54YyH74HowcO8qn6mr+NrxLMYsJ0
 eeEQiWSe7Kbmt2sGR48MFYLrAXujd47DlDNOAlYbsuQq3ho4u1A1V+pVC30mihSum6lC
 tUpg==
X-Gm-Message-State: AOAM531o0YnCoAjoGt1289hJKwxB+Rv8QJJM25pBA6YJ2EkqeHPMrp7J
 cbbbcDUjc+ztn+5qXplbrIEGbgMy4bYAUg==
X-Google-Smtp-Source: ABdhPJx2AK1uup3mTOsvgTmXucJHOiYWck5QqpkgF0gw//unLLtiH4vg1LuXfoWx+bxzmCKCibBxlA==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id
 t15-20020a62ea0f0000b02903198eef5ff1mr33144540pfh.74.1625806827942; 
 Thu, 08 Jul 2021 22:00:27 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id k189sm5658538pgk.14.2021.07.08.22.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 22:00:27 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 1/3] hw/virtio: add boilerplate for vhost-user-i2c device
Date: Fri,  9 Jul 2021 10:30:16 +0530
Message-Id: <e80591b52fea4b51631818bb92a798a3daf90399.1625806763.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1625806763.git.viresh.kumar@linaro.org>
References: <cover.1625806763.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This creates the QEMU side of the vhost-user-i2c device which connects
to the remote daemon. It is based of vhost-user-fs code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 hw/virtio/Kconfig                  |   5 +
 hw/virtio/meson.build              |   1 +
 hw/virtio/vhost-user-i2c.c         | 288 +++++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-i2c.h |  28 +++
 4 files changed, 322 insertions(+)
 create mode 100644 hw/virtio/vhost-user-i2c.c
 create mode 100644 include/hw/virtio/vhost-user-i2c.h

diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 0eda25c4e1bf..35ab45e2095c 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -58,3 +58,8 @@ config VIRTIO_MEM
     depends on LINUX
     depends on VIRTIO_MEM_SUPPORTED
     select MEM_DEVICE
+
+config VHOST_USER_I2C
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc9d4de..1a0d736a0db5 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -25,6 +25,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
new file mode 100644
index 000000000000..d172632bb0cd
--- /dev/null
+++ b/hw/virtio/vhost-user-i2c.c
@@ -0,0 +1,288 @@
+/*
+ * Vhost-user i2c virtio device
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/vhost-user-i2c.h"
+#include "qemu/error-report.h"
+#include "standard-headers/linux/virtio_ids.h"
+
+/* Remove this once the header is updated in Linux kernel */
+#ifndef VIRTIO_ID_I2C_ADAPTER
+#define VIRTIO_ID_I2C_ADAPTER                34
+#endif
+
+static void vu_i2c_start(VirtIODevice *vdev)
+{
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+    int ret, i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return;
+    }
+
+    ret = vhost_dev_enable_notifiers(&i2c->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", -ret);
+        return;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", -ret);
+        goto err_host_notifiers;
+    }
+
+    i2c->vhost_dev.acked_features = vdev->guest_features;
+
+    ret = vhost_dev_start(&i2c->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error starting vhost-user-i2c: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
+    /*
+     * guest_notifier_mask/pending not used yet, so just unmask
+     * everything here. virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < i2c->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&i2c->vhost_dev, vdev, i, false);
+    }
+
+    return;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&i2c->vhost_dev, vdev);
+}
+
+static void vu_i2c_stop(VirtIODevice *vdev)
+{
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&i2c->vhost_dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&i2c->vhost_dev, vdev);
+}
+
+static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (i2c->vhost_dev.started == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        vu_i2c_start(vdev);
+    } else {
+        vu_i2c_stop(vdev);
+    }
+}
+
+static uint64_t vu_i2c_get_features(VirtIODevice *vdev,
+                                    uint64_t requested_features, Error **errp)
+{
+    /* No feature bits used yet */
+    return requested_features;
+}
+
+static void vu_i2c_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
+{
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    vhost_virtqueue_mask(&i2c->vhost_dev, vdev, idx, mask);
+}
+
+static bool vu_i2c_guest_notifier_pending(VirtIODevice *vdev, int idx)
+{
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    return vhost_virtqueue_pending(&i2c->vhost_dev, idx);
+}
+
+static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserI2C *i2c)
+{
+    vhost_user_cleanup(&i2c->vhost_user);
+    virtio_delete_queue(i2c->vq);
+    virtio_cleanup(vdev);
+    g_free(i2c->vhost_dev.vqs);
+    i2c->vhost_dev.vqs = NULL;
+}
+
+static int vu_i2c_connect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    if (i2c->connected) {
+        return 0;
+    }
+    i2c->connected = true;
+
+    /* restore vhost state */
+    if (virtio_device_started(vdev, vdev->status)) {
+        vu_i2c_start(vdev);
+    }
+
+    return 0;
+}
+
+static void vu_i2c_disconnect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    if (!i2c->connected) {
+        return;
+    }
+    i2c->connected = false;
+
+    if (i2c->vhost_dev.started) {
+        vu_i2c_stop(vdev);
+    }
+}
+
+static void vu_i2c_event(void *opaque, QEMUChrEvent event)
+{
+    DeviceState *dev = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vu_i2c_connect(dev) < 0) {
+            qemu_chr_fe_disconnect(&i2c->chardev);
+            return;
+        }
+        break;
+    case CHR_EVENT_CLOSED:
+        vu_i2c_disconnect(dev);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(dev);
+    int ret;
+
+    if (!i2c->chardev.chr) {
+        error_setg(errp, "vhost-user-i2c: missing chardev");
+        return;
+    }
+
+    if (!vhost_user_init(&i2c->vhost_user, &i2c->chardev, errp)) {
+        return;
+    }
+
+    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
+
+    i2c->vhost_dev.nvqs = 1;
+    i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
+    i2c->vhost_dev.vqs = g_new0(struct vhost_virtqueue, i2c->vhost_dev.nvqs);
+
+    ret = vhost_dev_init(&i2c->vhost_dev, &i2c->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
+    if (ret < 0) {
+        do_vhost_user_cleanup(vdev, i2c);
+    }
+
+    qemu_chr_fe_set_handlers(&i2c->chardev, NULL, NULL, vu_i2c_event, NULL,
+                             dev, NULL, true);
+}
+
+static void vu_i2c_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserI2C *i2c = VHOST_USER_I2C(dev);
+
+    /* This will stop vhost backend if appropriate. */
+    vu_i2c_set_status(vdev, 0);
+    vhost_dev_cleanup(&i2c->vhost_dev);
+    do_vhost_user_cleanup(vdev, i2c);
+}
+
+static const VMStateDescription vu_i2c_vmstate = {
+    .name = "vhost-user-i2c",
+    .unmigratable = 1,
+};
+
+static Property vu_i2c_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserI2C, chardev),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vu_i2c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vu_i2c_properties);
+    dc->vmsd = &vu_i2c_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    vdc->realize = vu_i2c_device_realize;
+    vdc->unrealize = vu_i2c_device_unrealize;
+    vdc->get_features = vu_i2c_get_features;
+    vdc->set_status = vu_i2c_set_status;
+    vdc->guest_notifier_mask = vu_i2c_guest_notifier_mask;
+    vdc->guest_notifier_pending = vu_i2c_guest_notifier_pending;
+}
+
+static const TypeInfo vu_i2c_info = {
+    .name = TYPE_VHOST_USER_I2C,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostUserI2C),
+    .class_init = vu_i2c_class_init,
+};
+
+static void vu_i2c_register_types(void)
+{
+    type_register_static(&vu_i2c_info);
+}
+
+type_init(vu_i2c_register_types)
diff --git a/include/hw/virtio/vhost-user-i2c.h b/include/hw/virtio/vhost-user-i2c.h
new file mode 100644
index 000000000000..deae47a76d55
--- /dev/null
+++ b/include/hw/virtio/vhost-user-i2c.h
@@ -0,0 +1,28 @@
+/*
+ * Vhost-user i2c virtio device
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _QEMU_VHOST_USER_I2C_H
+#define _QEMU_VHOST_USER_I2C_H
+
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-user.h"
+
+#define TYPE_VHOST_USER_I2C "vhost-user-i2c-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserI2C, VHOST_USER_I2C)
+
+struct VHostUserI2C {
+    VirtIODevice parent;
+    CharBackend chardev;
+    struct vhost_virtqueue *vhost_vq;
+    struct vhost_dev vhost_dev;
+    VhostUserState vhost_user;
+    VirtQueue *vq;
+    bool connected;
+};
+
+#endif /* _QEMU_VHOST_USER_I2C_H */
-- 
2.31.1.272.g89b43f80a514


