Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694EB581A8A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:52:08 +0200 (CEST)
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQb9-0003aG-FI
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQGE-0006c2-R6
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQG9-0003dD-3o
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:30 -0400
Received: by mail-wm1-x332.google.com with SMTP id n185so9334059wmn.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoZeVp7JoBfeQWpKR+aNPS0/48Z7oPUNFcWapzaHubk=;
 b=dsp73vam66eaXFJ+r3FrurH/C1Tfz9DUUk0szSTEr1Blw8xAIdRRsfDh8Kvn6uVR9+
 VN4Zq8xxQ0EHWresOD60bOYH7aSpW2veNZI0hg2z96ESbVz+m06BuYSfugb+dhUAQjWn
 37Nv7LD0DsKiGeuDIcYLUqtKtAU4KUwk5eOpMpxg63gufxWJ3J3WnxfiqTkJygw/92+4
 uQdiJ0OrfEAM7VYaFilQLsoESQa2e+4GFlxKV2yyk/BYhtXW05pNE9P2PW2PDsiVuBYL
 4fQ6rDtpPZYW5XIj69IFBukR5qdrtA2OFnhJBmm/VqJ+elwyeEKUahQvKlUnhm3jk27a
 9Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoZeVp7JoBfeQWpKR+aNPS0/48Z7oPUNFcWapzaHubk=;
 b=FUgt9rYrMf8kEeZzRpNIPQUdQLgnTF1KWuS5utOIjsq1xlASpPTOWVE9m7sU2Ayltk
 Z1lwVbv+jzC8UuCc2uyggX07TYI3aBRYbyDbVNXBIsGo7u1gAYBV9DNvNJvIVHE8o3KP
 33TQf6OwY9asdjtCu4DzFGwrL3UNClRF2G110CAqC5+mPlr5K15RbmfXJCaBbj9CmLvP
 w91qTLZwnJXGY/LjKe5vx+WrA55coSmafiYyLrIKqqC8Kygq2I9pcUDRNpjr16q4xJus
 janTs/11J3GlSgWWO1DRDZIro3tp4GicVPMRSxoDxyAMfb4okDLxlyQisddFdKoWoEwf
 65ZQ==
X-Gm-Message-State: AJIora8D0S5vBzc0hJL3E/HXEMeMcodXI7A+qCmRx3LjsTg32QJsR1KO
 DLXM9FoKqsGffsLVtUBp/0d/ag==
X-Google-Smtp-Source: AGRyM1srpKxUESxKR2ya6h6NxDX4Y4AgPfqlMO15QdVySmJnw0LROsOwhuOf+18iFbdobyZE+ajFMA==
X-Received: by 2002:a05:600c:19c9:b0:3a3:469f:c1e7 with SMTP id
 u9-20020a05600c19c900b003a3469fc1e7mr450379wmq.141.1658863821384; 
 Tue, 26 Jul 2022 12:30:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d548a000000b0021e6c52c921sm12383680wrv.54.2022.07.26.12.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 488711FFC3;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH v3 11/21] hw/virtio: add boilerplate for vhost-user-gpio device
Date: Tue, 26 Jul 2022 20:21:40 +0100
Message-Id: <20220726192150.2435175-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

This creates the QEMU side of the vhost-user-gpio device which connects
to the remote daemon. It is based of vhost-user-i2c code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
[AJB: fixes for qtest, tweaks to feature bits]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Vincent Whitchurch <vincent.whitchurch@axis.com>

---
v2
  - set VIRTIO_F_VERSION_1
  - set VHOST_USER_F_PROTOCOL_FEATURES
  - terminate feature_bits with VHOST_INVALID_FEATURE_BIT
  - ensure vdev->backend_features set
  - ensure vhost_dev.acked_features set
v3
  - break out vhost_dev structure for code flow reasons
  - use the vhost-user-blk connection lifecycle code
  - follow ->parent_obj style for VHostUserGPIO object
  - add all feature bits supported by the rust-vmm backend
  - clean-up errp propagation to avoid local_err and use ERRP_GAURD
  - s/vhost_dev->features/vdev->guest_features/ when calling vhost_ack_features
  - drop VHOST_USER_F_PROTOCOL_FEATURES definition (pushed to vhost-user)
  - explicitly call vhost_set_vring_enable due to properly negotiated VHOST_USER_F_PROTOCOL_FEATURES
---
 include/hw/virtio/vhost-user-gpio.h |  35 +++
 hw/virtio/vhost-user-gpio.c         | 414 ++++++++++++++++++++++++++++
 hw/virtio/Kconfig                   |   5 +
 hw/virtio/meson.build               |   1 +
 hw/virtio/trace-events              |   5 +
 5 files changed, 460 insertions(+)
 create mode 100644 include/hw/virtio/vhost-user-gpio.h
 create mode 100644 hw/virtio/vhost-user-gpio.c

diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
new file mode 100644
index 0000000000..4fe9aeecc0
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
+    VirtIODevice parent_obj;
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
index 0000000000..d487966c7e
--- /dev/null
+++ b/hw/virtio/vhost-user-gpio.c
@@ -0,0 +1,414 @@
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
+#include "trace.h"
+
+#define REALIZE_CONNECTION_RETRIES 3
+
+/* Features required from VirtIO */
+static const int feature_bits[] = {
+    VIRTIO_F_VERSION_1,
+    VIRTIO_F_NOTIFY_ON_EMPTY,
+    VIRTIO_RING_F_INDIRECT_DESC,
+    VIRTIO_RING_F_EVENT_IDX,
+    VIRTIO_GPIO_F_IRQ,
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
+    struct vhost_dev *vhost_dev = &gpio->vhost_dev;
+    int ret, i;
+
+    if (!k->set_guest_notifiers) {
+        error_report("binding does not support guest notifiers");
+        return -ENOSYS;
+    }
+
+    ret = vhost_dev_enable_notifiers(vhost_dev, vdev);
+    if (ret < 0) {
+        error_report("Error enabling host notifiers: %d", ret);
+        return ret;
+    }
+
+    ret = k->set_guest_notifiers(qbus->parent, vhost_dev->nvqs, true);
+    if (ret < 0) {
+        error_report("Error binding guest notifier: %d", ret);
+        goto err_host_notifiers;
+    }
+
+    /*
+     * Before we start up we need to ensure we have the final feature
+     * set needed for the vhost configuration. The backend may also
+     * apply backend_features when the feature set is sent.
+     */
+    vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->guest_features);
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
+    /*
+     * As we must have VHOST_USER_F_PROTOCOL_FEATURES (because
+     * VHOST_USER_GET_CONFIG requires it) we need to explicitly enable
+     * the vrings.
+     */
+    g_assert(vhost_dev->vhost_ops && vhost_dev->vhost_ops->vhost_set_vring_enable);
+    ret = vhost_dev->vhost_ops->vhost_set_vring_enable(vhost_dev, true);
+    if (ret == 0) {
+        return 0;
+    }
+
+    error_report("Failed to start vrings for vhost-user-gpio: %d", ret);
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
+    struct vhost_dev *vhost_dev = &gpio->vhost_dev;
+    int ret;
+
+    if (!k->set_guest_notifiers) {
+        return;
+    }
+
+    /*
+     * We can call vu_gpio_stop multiple times, for example from
+     * vm_state_notify and the final object finalisation. Check we
+     * aren't already stopped before doing so.
+     */
+    if (!vhost_dev->started) {
+        return;
+    }
+
+    vhost_dev_stop(vhost_dev, vdev);
+
+    ret = k->set_guest_notifiers(qbus->parent, vhost_dev->nvqs, false);
+    if (ret < 0) {
+        error_report("vhost guest notifier cleanup failed: %d", ret);
+        return;
+    }
+
+    vhost_dev_disable_notifiers(vhost_dev, vdev);
+}
+
+static void vu_gpio_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    bool should_start = status & VIRTIO_CONFIG_S_DRIVER_OK;
+
+    trace_virtio_gpio_set_status(status);
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
+    return vhost_get_features(&gpio->vhost_dev, feature_bits, features);
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
+static int vu_gpio_connect(DeviceState *dev, Error **errp)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
+    struct vhost_dev *vhost_dev = &gpio->vhost_dev;
+    int ret;
+
+    if (gpio->connected) {
+        return 0;
+    }
+    gpio->connected = true;
+
+    vhost_dev_set_config_notifier(vhost_dev, &gpio_ops);
+    gpio->vhost_user.supports_config = true;
+
+    ret = vhost_dev_init(vhost_dev, &gpio->vhost_user,
+                         VHOST_BACKEND_TYPE_USER, 0, errp);
+    if (ret < 0) {
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
+    Error *local_err = NULL;
+
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        if (vu_gpio_connect(dev, &local_err) < 0) {
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
+static int vu_gpio_realize_connect(VHostUserGPIO *gpio, Error **errp)
+{
+    VirtIODevice *vdev = &gpio->parent_obj;
+    DeviceState *dev = &vdev->parent_obj;
+    struct vhost_dev *vhost_dev = &gpio->vhost_dev;
+    int ret;
+
+    ret = qemu_chr_fe_wait_connected(&gpio->chardev, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /*
+     * vu_gpio_connect() may have already connected (via the event
+     * callback) in which case it will just report success.
+     */
+    ret = vu_gpio_connect(dev, errp);
+    if (ret < 0) {
+        qemu_chr_fe_disconnect(&gpio->chardev);
+        return ret;
+    }
+    g_assert(gpio->connected);
+
+    ret = vhost_dev_get_config(vhost_dev, (uint8_t *)&gpio->config,
+                               sizeof(gpio->config), errp);
+
+    if (ret < 0) {
+        error_report("vhost-user-gpio: get config failed");
+
+        qemu_chr_fe_disconnect(&gpio->chardev);
+        vhost_dev_cleanup(vhost_dev);
+        return ret;
+    }
+
+    return 0;
+}
+
+static void vu_gpio_device_realize(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserGPIO *gpio = VHOST_USER_GPIO(dev);
+    int retries, ret;
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
+    retries = REALIZE_CONNECTION_RETRIES;
+    g_assert(!*errp);
+    do {
+        if (*errp) {
+            error_prepend(errp, "Reconnecting after error: ");
+            error_report_err(*errp);
+            *errp = NULL;
+        }
+        ret = vu_gpio_realize_connect(gpio, errp);
+    } while (ret < 0 && retries--);
+
+    if (ret < 0) {
+        do_vhost_user_cleanup(vdev, gpio);
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
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 887ca7afa8..820dadc26c 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -144,3 +144,8 @@ virtio_mem_state_response(uint16_t state) "state=%" PRIu16
 virtio_pmem_flush_request(void) "flush request"
 virtio_pmem_response(void) "flush response"
 virtio_pmem_flush_done(int type) "fsync return=%d"
+
+# virtio-gpio.c
+virtio_gpio_start(void) "start"
+virtio_gpio_stop(void) "stop"
+virtio_gpio_set_status(uint8_t status) "0x%x"
-- 
2.30.2


