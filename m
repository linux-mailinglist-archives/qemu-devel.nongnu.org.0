Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E09532EE4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:27:02 +0200 (CEST)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXN6-0001Br-Hc
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWeo-0004Ds-2o
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWek-0005My-8l
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t6so26286691wra.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0eZjoHrxexxNL+fKaMsZMS+KyvjWLWtAv8XDuWHLS4w=;
 b=Wx00BlMxgOAU6pvzZmY8zh/cFzwftNqeM+HANCvKRhHBqB92dBrn0a6ejeqQeIWkAo
 VLYlI/GGa8u9tx011Hym+mWgWtiW5rg/+8Bqkn/5m85U1qWLc7yu5ZuIB6Z/nXIeifae
 7olGSc/QiBEpTPjMgx16cdYP7uY43lMbM+eKYRyCvk6txigwZqJMMycNOq0EnIyzAM40
 pkx7uTt3TrUx8UXmES2eCB4iChRXLBOUbMHOvilav9x9BJjwokJWhj9xcM7PmKN5OwH/
 NIkOC0TZSAdxR1DdNzB6jr3pmnKJu55AHQjLXSMXxTsgDliMxgoy39EH4vNQCcaWpobE
 vqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0eZjoHrxexxNL+fKaMsZMS+KyvjWLWtAv8XDuWHLS4w=;
 b=1WhdDZ0VeR58CA/oYyVkkDxUz41ezySBKUaV5aPCzkFpBcLNmwC6Eg92HOZ5GZnGfv
 +kWxofEQJs8pD69AM5AUxq5obeXUvqlQ26DAZfDJ5RbZ4KYX7qhXyGih7y90z9esRddx
 SAee4hKq7FrgN5jOTnara5pJPqZsRnnJEbRvR/hV7+QM7xiDgZvCCT752Fg0IA8Q+4qt
 MoyfywURHr+wo3WetxAr1trcOzFsWNIfhIhoJwLonT26q67AwpXkaH+lODSGp8ztTz7N
 3qmqzPbQyT561QQHZSo3oyypEIgCHbNpUGOjmLZHJEcfDCQiV3t9Zw4dC/jDCf8uQB0y
 jegw==
X-Gm-Message-State: AOAM530rw6xSJFiFU7Mo9M0eYN3OMeiE9iip24kK8tNIrXMpX/oh8sDz
 ddh4a+WywqnxeOnJL/W7xy/XJg==
X-Google-Smtp-Source: ABdhPJxrK+80eZYZog5nQS/FKgP4QRFwv3FuBmoK5s2jk6rUwzqWTwgJTAqQNClYY0WRo4Sfwq8RMA==
X-Received: by 2002:a05:6000:34b:b0:20f:fb31:872d with SMTP id
 e11-20020a056000034b00b0020ffb31872dmr691660wre.449.1653406867791; 
 Tue, 24 May 2022 08:41:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a7bc315000000b003942a244edfsm2655202wmj.36.2022.05.24.08.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D32E41FFBD;
 Tue, 24 May 2022 16:40:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 05/15] hw/virtio: add boilerplate for vhost-user-gpio device
Date: Tue, 24 May 2022 16:40:46 +0100
Message-Id: <20220524154056.2896913-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

This creates the QEMU side of the vhost-user-gpio device which connects
to the remote daemon. It is based of vhost-user-i2c code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
[AJB: fixes for qtest]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - set VIRTIO_F_VERSION_1
  - set VHOST_USER_F_PROTOCOL_FEATURES
  - terminate feature_bits with VHOST_INVALID_FEATURE_BIT
  - ensure vdev->backend_features set
  - ensure vhost_dev.acked_features set
---
 include/hw/virtio/vhost-user-gpio.h |  35 +++
 hw/virtio/vhost-user-gpio.c         | 357 ++++++++++++++++++++++++++++
 hw/virtio/Kconfig                   |   5 +
 hw/virtio/meson.build               |   1 +
 4 files changed, 398 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-gpio.h
 create mode 100644 hw/virtio/vhost-user-gpio.c

diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
new file mode 100644
index 0000000000..afeb56f53e
--- /dev/null
+++ b/include/hw/virtio/vhost-user-gpio.h
@@ -0,0 +1,35 @@
+/*
+ * Vhost-user GPIO virtio device
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _QEMU_VHOST_USER_GPIO_H
+#define _QEMU_VHOST_USER_GPIO_H
+
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-user.h"
+#include "standard-headers/linux/virtio_gpio.h"
+#include "chardev/char-fe.h"
+
+#define TYPE_VHOST_USER_GPIO "vhost-user-gpio-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VHostUserGPIO, VHOST_USER_GPIO);
+
+struct VHostUserGPIO {
+    /*< private >*/
+    VirtIODevice parent;
+    CharBackend chardev;
+    struct virtio_gpio_config config;
+    struct vhost_virtqueue *vhost_vq;
+    struct vhost_dev vhost_dev;
+    VhostUserState vhost_user;
+    VirtQueue *command_vq;
+    VirtQueue *interrupt_vq;
+    bool connected;
+    /*< public >*/
+};
+
+#endif /* _QEMU_VHOST_USER_GPIO_H */
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
new file mode 100644
index 0000000000..87e3976880
--- /dev/null
+++ b/hw/virtio/vhost-user-gpio.c
@@ -0,0 +1,357 @@
+/*
+ * Vhost-user GPIO virtio device
+ *
+ * Copyright (c) 2022 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio-bus.h"
+#include "hw/virtio/vhost-user-gpio.h"
+#include "qemu/error-report.h"
+#include "standard-headers/linux/virtio_ids.h"
+
+/* do no other vhost-user daemons need this? */
+#define VHOST_USER_F_PROTOCOL_FEATURES 30
+
+static const int feature_bits[] = {
+    VIRTIO_F_VERSION_1,
+    VIRTIO_GPIO_F_IRQ,
+    VHOST_USER_F_PROTOCOL_FEATURES,
+    VHOST_INVALID_FEATURE_BIT
+};
+
+static void vu_gpio_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    memcpy(config, &gpio->config, sizeof(gpio->config));
+}
+
+static int vu_gpio_config_notifier(struct vhost_dev *dev)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(dev->vdev);
+
+    memcpy(dev->vdev->config, &gpio->config, sizeof(gpio->config));
+    virtio_notify_config(dev->vdev);
+
+    return 0;
+}
+
+const VhostDevConfigOps gpio_ops = {
+    .vhost_dev_config_notifier = vu_gpio_config_notifier,
+};
+
+static int vu_gpio_start(VirtIODevice *vdev)
+{
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    int ret, i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return -ENOSYS;
+    }
+
+    ret = vhost_dev_enable_notifiers(&gpio->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", ret);
+        return ret;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, gpio->vhost_dev.nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", ret);
+        goto err_host_notifiers;
+    }
+
+    /*
+     * Before we start up we need to ensure we have the final feature
+     * set needed for the vhost configuration.
+     */
+    vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->backend_features);
+
+    ret = vhost_dev_start(&gpio->vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error starting vhost-user-gpio: %d", ret);
+        goto err_guest_notifiers;
+    }
+
+    /*
+     * guest_notifier_mask/pending not used yet, so just unmask
+     * everything here. virtio-pci will do the right thing by
+     * enabling/disabling irqfd.
+     */
+    for (i = 0; i < gpio->vhost_dev.nvqs; i++) {
+        vhost_virtqueue_mask(&gpio->vhost_dev, vdev, i, false);
+    }
+
+    return 0;
+
+err_guest_notifiers:
+    k->set_guest_notifiers(qbus->parent, gpio->vhost_dev.nvqs, false);
+err_host_notifiers:
+    vhost_dev_disable_notifiers(&gpio->vhost_dev, vdev);
+
+    return ret;
+}
+
+static void vu_gpio_stop(VirtIODevice *vdev)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
+    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    vhost_dev_stop(&gpio->vhost_dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, gpio->vhost_dev.nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(&gpio->vhost_dev, vdev);
+}
+
+static void vu_gpio_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+
+    if (!vdev->vm_running) {
+        should_start = false;
+    }
+
+    if (!gpio->connected) {
+        return;
+    }
+
+    if (gpio->vhost_dev.started == should_start) {
+        return;
+    }
+
+    if (should_start) {
+        if (vu_gpio_start(vdev)) {
+            qemu_chr_fe_disconnect(&gpio->chardev);
+        }
+    } else {
+        vu_gpio_stop(vdev);
+    }
+}
+
+static uint64_t vu_gpio_get_features(VirtIODevice *vdev, uint64_t features,
+                                     Error **errp)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    virtio_add_feature(&features, VIRTIO_GPIO_F_IRQ);
+    virtio_add_feature(&features, VIRTIO_F_VERSION_1);
+
+    vdev->backend_features = vhost_get_features(&gpio->vhost_dev, feature_bits,
+                                                features);
+    return vdev->backend_features;
+}
+
+static void vu_gpio_handle_output(VirtIODevice *vdev, VirtQueue *vq)
+{
+    /*
+     * Not normally called; it's the daemon that handles the queue;
+     * however virtio's cleanup path can call this.
+     */
+}
+
+static void vu_gpio_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    vhost_virtqueue_mask(&gpio->vhost_dev, vdev, idx, mask);
+}
+
+static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserGPIO *gpio)
+{
+    virtio_delete_queue(gpio->command_vq);
+    virtio_delete_queue(gpio->interrupt_vq);
+    g_free(gpio->vhost_dev.vqs);
+    gpio->vhost_dev.vqs = NULL;
+    virtio_cleanup(vdev);
+    vhost_user_cleanup(&gpio->vhost_user);
+}
+
+static int vu_gpio_connect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    Error *local_err = NULL;
+    int ret;
+
+    if (gpio->connected) {
+        return 0;
+    }
+    gpio->connected = true;
+
+    vhost_dev_set_config_notifier(&gpio->vhost_dev, &gpio_ops);
+
+    ret = vhost_dev_init(&gpio->vhost_dev, &gpio->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, &local_err);
+    if (ret < 0) {
+        error_report("vhost-user-gpio: vhost initialization failed: %s",
+                     strerror(-ret));
+        return ret;
+    }
+
+    /* restore vhost state */
+    if (virtio_device_started(vdev, vdev->status)) {
+        vu_gpio_start(vdev);
+    }
+
+    return 0;
+}
+
+static void vu_gpio_disconnect(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    if (!gpio->connected) {
+        return;
+    }
+    gpio->connected = false;
+
+    vu_gpio_stop(vdev);
+    vhost_dev_cleanup(&gpio->vhost_dev);
+}
+
+static void vu_gpio_event(void *opaque, QEMUChrEvent event)
+{
+    DeviceState *dev = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vu_gpio_connect(dev) < 0) {
+            qemu_chr_fe_disconnect(&gpio->chardev);
+            return;
+        }
+        break;
+    case CHR_EVENT_CLOSED:
+        vu_gpio_disconnect(dev);
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void vu_gpio_device_realize(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(dev);
+    Error *err = NULL;
+    int ret;
+
+    if (!gpio->chardev.chr) {
+        error_setg(errp, "vhost-user-gpio: chardev is mandatory");
+        return;
+    }
+
+    if (!vhost_user_init(&gpio->vhost_user, &gpio->chardev, errp)) {
+        return;
+    }
+
+    virtio_init(vdev, VIRTIO_ID_GPIO, sizeof(gpio->config));
+
+    gpio->vhost_dev.nvqs = 2;
+    gpio->command_vq = virtio_add_queue(vdev, 256, vu_gpio_handle_output);
+    gpio->interrupt_vq = virtio_add_queue(vdev, 256, vu_gpio_handle_output);
+    gpio->vhost_dev.vqs = g_new0(struct vhost_virtqueue, gpio->vhost_dev.nvqs);
+
+    gpio->connected = false;
+
+    qemu_chr_fe_set_handlers(&gpio->chardev, NULL, NULL, vu_gpio_event, NULL,
+                             dev, NULL, true);
+
+reconnect:
+    if (qemu_chr_fe_wait_connected(&gpio->chardev, &err) < 0) {
+        error_report_err(err);
+        do_vhost_user_cleanup(vdev, gpio);
+        return;
+    }
+
+    /* check whether vhost_user_gpio_connect() failed or not */
+    if (!gpio->connected) {
+        goto reconnect;
+    }
+
+    ret = vhost_dev_get_config(&gpio->vhost_dev, (uint8_t *)&gpio->config,
+                               sizeof(gpio->config), errp);
+    if (ret < 0) {
+        error_report("vhost-user-gpio: get config failed");
+        goto reconnect;
+    }
+
+    return;
+}
+
+static void vu_gpio_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(dev);
+
+    vu_gpio_set_status(vdev, 0);
+    qemu_chr_fe_set_handlers(&gpio->chardev, NULL, NULL, NULL, NULL, NULL, NULL,
+                             false);
+    vhost_dev_cleanup(&gpio->vhost_dev);
+    do_vhost_user_cleanup(vdev, gpio);
+}
+
+static const VMStateDescription vu_gpio_vmstate = {
+    .name = "vhost-user-gpio",
+    .unmigratable = 1,
+};
+
+static Property vu_gpio_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserGPIO, chardev),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vu_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vu_gpio_properties);
+    dc->vmsd = &vu_gpio_vmstate;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    vdc->realize = vu_gpio_device_realize;
+    vdc->unrealize = vu_gpio_device_unrealize;
+    vdc->get_features = vu_gpio_get_features;
+    vdc->get_config = vu_gpio_get_config;
+    vdc->set_status = vu_gpio_set_status;
+    vdc->guest_notifier_mask = vu_gpio_guest_notifier_mask;
+}
+
+static const TypeInfo vu_gpio_info = {
+    .name = TYPE_VHOST_USER_GPIO,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VHostUserGPIO),
+    .class_init = vu_gpio_class_init,
+};
+
+static void vu_gpio_register_types(void)
+{
+    type_register_static(&vu_gpio_info);
+}
+
+type_init(vu_gpio_register_types)
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index e9ecae1f50..cbfd8c7173 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -80,3 +80,8 @@ config VHOST_USER_FS
     bool
     default y
     depends on VIRTIO && VHOST_USER
+
+config VHOST_USER_GPIO
+    bool
+    default y
+    depends on VIRTIO && VHOST_USER
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 7e8877fd64..33c8e71fab 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -29,6 +29,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
-- 
2.30.2


