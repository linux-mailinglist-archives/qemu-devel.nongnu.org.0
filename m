Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222096E6955
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:22:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5Y-0006nQ-7D; Tue, 18 Apr 2023 12:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5V-0006mt-P1
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:49 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5S-00019l-O1
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 a8-20020a05600c348800b003f17ddb04e3so78316wmq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834906; x=1684426906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x87bue2xLVWQrfVBSyRRYhA/dy43njxINkH3kP9vb3k=;
 b=EHRQv7Ju6LENPKauwKEtqNkE2betd0pLn4ZbmX+uOKT0XmzMfyuK0xuf6q4uvaGaK4
 YXj0rT8dWBkUUyO8KAgEktHYo2iAeQsqAmDgY8xsC1LbPTYwNA7AYCcjzJQbMKZPQyMh
 CRGHIQY22jpFqROaBjWVzmt6hBYVikpGQ4K7DO+i7WcyK7C/J7a1alSViAn3Y9DpAoU4
 5mvNPW0I2BmAjh/IlO6nrcF8fuYD94TpYrWCDwvSaLe5tL7GVq/mu/p72K32I5+SXQO3
 vxQbc36zjkpYBJYoxvInbLzcak00sf3qRwXyiURyR97COHHFf9Ti/dpfJl4BmFCtrwPb
 Wp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834906; x=1684426906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x87bue2xLVWQrfVBSyRRYhA/dy43njxINkH3kP9vb3k=;
 b=XqvCx/bYNbgnoGnTSrgtXl4hNYxMFtnERdf4M2g1LUlKT++Y39/uyK37mDx6J7kYWG
 PVG547tE+Q7uz5v6gwXejAQn40bfpCrb2M4L/wAB1KTJDLK0KcVEcAIuo83u2eq8pN2x
 Zr9u24lrg5hlgjjlpVEOlQw8cetRE3Kw2IUyagHzUqoKc5oPBhgBG37V0FJQyMmFChHb
 n9DgRcrlTTWdfe4XDhfBYHg3QkqafUao/Xj2l/WBNHWzy4GN6Vu/kuc7EmrfUEPWW3qS
 084mlSXf9WE3aDm/H4pRasVqMQpckNlAKBOoOv1hYzGs+9DS9IdHkzmDXMYQkhcBsDFe
 dJBw==
X-Gm-Message-State: AAQBX9c+QRoe2cM+BmM4E2TDs7Iinx9Wwd7KlNlLuOmL7cW/oihsJMtQ
 /OiOtlVzMe3idUjymXsh7H292Q==
X-Google-Smtp-Source: AKy350YwiQpNucZPLFmYH31nXKCEmFnTPwJ530gji2rhw14K8Gja6BcKS2eDLrg0WTH99+06Q0AYfg==
X-Received: by 2002:a05:600c:22c7:b0:3f0:3ab2:a7e5 with SMTP id
 7-20020a05600c22c700b003f03ab2a7e5mr14988699wmg.34.1681834905967; 
 Tue, 18 Apr 2023 09:21:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c4e9000b003f0a6a1f969sm15864549wmq.46.2023.04.18.09.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C7AB1FFC2;
 Tue, 18 Apr 2023 17:21:41 +0100 (BST)
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
Subject: [PATCH v2 12/13] hw/virtio: derive vhost-user-i2c from vhost-user-base
Date: Tue, 18 Apr 2023 17:21:39 +0100
Message-Id: <20230418162140.373219-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

Now we can take advantage of the new base class and make
vhost-user-i2c a much simpler boilerplate wrapper. Also as this
doesn't require any target specific hacks we only need to build the
stubs once.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update to new inheritance scheme
  - move build to common code
---
 include/hw/virtio/vhost-user-i2c.h |  18 +-
 hw/virtio/vhost-user-i2c.c         | 255 ++---------------------------
 hw/virtio/meson.build              |   5 +-
 3 files changed, 26 insertions(+), 252 deletions(-)

diff --git a/include/hw/virtio/vhost-user-i2c.h b/include/hw/virtio/vhost-user-i2c.h
index 0f7acd40e3..47153782d1 100644
--- a/include/hw/virtio/vhost-user-i2c.h
+++ b/include/hw/virtio/vhost-user-i2c.h
@@ -12,20 +12,18 @@
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user.h"
 
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
+#include "hw/virtio/vhost-user.h"
+#include "hw/virtio/vhost-user-device.h"
+
 #define TYPE_VHOST_USER_I2C "vhost-user-i2c-device"
 OBJECT_DECLARE_SIMPLE_TYPE(VHostUserI2C, VHOST_USER_I2C)
 
 struct VHostUserI2C {
-    VirtIODevice parent;
-    CharBackend chardev;
-    struct vhost_virtqueue *vhost_vq;
-    struct vhost_dev vhost_dev;
-    VhostUserState vhost_user;
-    VirtQueue *vq;
-    bool connected;
+    /*< private >*/
+    VHostUserBase parent;
+    /*< public >*/
 };
 
-/* Virtio Feature bits */
-#define VIRTIO_I2C_F_ZERO_LENGTH_REQUEST		0
-
 #endif /* QEMU_VHOST_USER_I2C_H */
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 60eaf0d95b..4a1f644a87 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -14,237 +14,21 @@
 #include "qemu/error-report.h"
 #include "standard-headers/linux/virtio_ids.h"
 
-static const int feature_bits[] = {
-    VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
-    VIRTIO_F_RING_RESET,
-    VHOST_INVALID_FEATURE_BIT
+static Property vi2c_properties[] = {
+    DEFINE_PROP_CHR("chardev", VHostUserBase, chardev),
+    DEFINE_PROP_END_OF_LIST(),
 };
 
-static void vu_i2c_start(VirtIODevice *vdev)
-{
-    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
-    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-    int ret, i;
-
-    if (!k->set_guest_notifiers) {
-        error_report("binding does not support guest notifiers");
-        return;
-    }
-
-    ret = vhost_dev_enable_notifiers(&i2c->vhost_dev, vdev);
-    if (ret < 0) {
-        error_report("Error enabling host notifiers: %d", -ret);
-        return;
-    }
-
-    ret = k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, true);
-    if (ret < 0) {
-        error_report("Error binding guest notifier: %d", -ret);
-        goto err_host_notifiers;
-    }
-
-    i2c->vhost_dev.acked_features = vdev->guest_features;
-
-    ret = vhost_dev_start(&i2c->vhost_dev, vdev, true);
-    if (ret < 0) {
-        error_report("Error starting vhost-user-i2c: %d", -ret);
-        goto err_guest_notifiers;
-    }
-
-    /*
-     * guest_notifier_mask/pending not used yet, so just unmask
-     * everything here. virtio-pci will do the right thing by
-     * enabling/disabling irqfd.
-     */
-    for (i = 0; i < i2c->vhost_dev.nvqs; i++) {
-        vhost_virtqueue_mask(&i2c->vhost_dev, vdev, i, false);
-    }
-
-    return;
-
-err_guest_notifiers:
-    k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, false);
-err_host_notifiers:
-    vhost_dev_disable_notifiers(&i2c->vhost_dev, vdev);
-}
-
-static void vu_i2c_stop(VirtIODevice *vdev)
-{
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
-    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
-    int ret;
-
-    if (!k->set_guest_notifiers) {
-        return;
-    }
-
-    vhost_dev_stop(&i2c->vhost_dev, vdev, true);
-
-    ret = k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, false);
-    if (ret < 0) {
-        error_report("vhost guest notifier cleanup failed: %d", ret);
-        return;
-    }
-
-    vhost_dev_disable_notifiers(&i2c->vhost_dev, vdev);
-}
-
-static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
-{
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-    bool should_start = virtio_device_should_start(vdev, status);
-
-    if (vhost_dev_is_started(&i2c->vhost_dev) == should_start) {
-        return;
-    }
-
-    if (should_start) {
-        vu_i2c_start(vdev);
-    } else {
-        vu_i2c_stop(vdev);
-    }
-}
-
-static uint64_t vu_i2c_get_features(VirtIODevice *vdev,
-                                    uint64_t requested_features, Error **errp)
-{
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-
-    virtio_add_feature(&requested_features, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST);
-    return vhost_get_features(&i2c->vhost_dev, feature_bits, requested_features);
-}
-
-static void vu_i2c_handle_output(VirtIODevice *vdev, VirtQueue *vq)
-{
-    /*
-     * Not normally called; it's the daemon that handles the queue;
-     * however virtio's cleanup path can call this.
-     */
-}
-
-static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
-{
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-
-    vhost_virtqueue_mask(&i2c->vhost_dev, vdev, idx, mask);
-}
-
-static bool vu_i2c_guest_notifier_pending(VirtIODevice *vdev, int idx)
-{
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-
-    return vhost_virtqueue_pending(&i2c->vhost_dev, idx);
-}
-
-static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserI2C *i2c)
-{
-    vhost_user_cleanup(&i2c->vhost_user);
-    virtio_delete_queue(i2c->vq);
-    virtio_cleanup(vdev);
-}
-
-static int vu_i2c_connect(DeviceState *dev)
-{
-    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-
-    if (i2c->connected) {
-        return 0;
-    }
-    i2c->connected = true;
-
-    /* restore vhost state */
-    if (virtio_device_started(vdev, vdev->status)) {
-        vu_i2c_start(vdev);
-    }
-
-    return 0;
-}
-
-static void vu_i2c_disconnect(DeviceState *dev)
-{
-    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-
-    if (!i2c->connected) {
-        return;
-    }
-    i2c->connected = false;
-
-    if (vhost_dev_is_started(&i2c->vhost_dev)) {
-        vu_i2c_stop(vdev);
-    }
-}
-
-static void vu_i2c_event(void *opaque, QEMUChrEvent event)
+static void vi2c_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = opaque;
-    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
-    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
-
-    switch (event) {
-    case CHR_EVENT_OPENED:
-        if (vu_i2c_connect(dev) < 0) {
-            qemu_chr_fe_disconnect(&i2c->chardev);
-            return;
-        }
-        break;
-    case CHR_EVENT_CLOSED:
-        vu_i2c_disconnect(dev);
-        break;
-    case CHR_EVENT_BREAK:
-    case CHR_EVENT_MUX_IN:
-    case CHR_EVENT_MUX_OUT:
-        /* Ignore */
-        break;
-    }
-}
-
-static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
-{
-    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
-    VHostUserI2C *i2c = VHOST_USER_I2C(dev);
-    int ret;
-
-    if (!i2c->chardev.chr) {
-        error_setg(errp, "vhost-user-i2c: missing chardev");
-        return;
-    }
-
-    if (!vhost_user_init(&i2c->vhost_user, &i2c->chardev, errp)) {
-        return;
-    }
-
-    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
+    VHostUserBase *vub = VHOST_USER_BASE(dev);
+    VHostUserBaseClass *vubc = VHOST_USER_BASE_GET_CLASS(dev);
 
-    i2c->vhost_dev.nvqs = 1;
-    i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
-    i2c->vhost_dev.vqs = g_new0(struct vhost_virtqueue, i2c->vhost_dev.nvqs);
+    /* Fixed for I2C */
+    vub->virtio_id = VIRTIO_ID_I2C_ADAPTER;
+    vub->num_vqs = 1;
 
-    ret = vhost_dev_init(&i2c->vhost_dev, &i2c->vhost_user,
-                         VHOST_BACKEND_TYPE_USER, 0, errp);
-    if (ret < 0) {
-        g_free(i2c->vhost_dev.vqs);
-        do_vhost_user_cleanup(vdev, i2c);
-    }
-
-    qemu_chr_fe_set_handlers(&i2c->chardev, NULL, NULL, vu_i2c_event, NULL,
-                             dev, NULL, true);
-}
-
-static void vu_i2c_device_unrealize(DeviceState *dev)
-{
-    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
-    VHostUserI2C *i2c = VHOST_USER_I2C(dev);
-    struct vhost_virtqueue *vhost_vqs = i2c->vhost_dev.vqs;
-
-    /* This will stop vhost backend if appropriate. */
-    vu_i2c_set_status(vdev, 0);
-    vhost_dev_cleanup(&i2c->vhost_dev);
-    g_free(vhost_vqs);
-    do_vhost_user_cleanup(vdev, i2c);
+    vubc->parent_realize(dev, errp);
 }
 
 static const VMStateDescription vu_i2c_vmstate = {
@@ -252,30 +36,21 @@ static const VMStateDescription vu_i2c_vmstate = {
     .unmigratable = 1,
 };
 
-static Property vu_i2c_properties[] = {
-    DEFINE_PROP_CHR("chardev", VHostUserI2C, chardev),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void vu_i2c_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+    VHostUserBaseClass *vubc = VHOST_USER_BASE_CLASS(klass);
 
-    device_class_set_props(dc, vu_i2c_properties);
     dc->vmsd = &vu_i2c_vmstate;
+    device_class_set_props(dc, vi2c_properties);
+    device_class_set_parent_realize(dc, vi2c_realize,
+                                    &vubc->parent_realize);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
-    vdc->realize = vu_i2c_device_realize;
-    vdc->unrealize = vu_i2c_device_unrealize;
-    vdc->get_features = vu_i2c_get_features;
-    vdc->set_status = vu_i2c_set_status;
-    vdc->guest_notifier_mask = vu_i2c_guest_notifier_mask;
-    vdc->guest_notifier_pending = vu_i2c_guest_notifier_pending;
 }
 
 static const TypeInfo vu_i2c_info = {
     .name = TYPE_VHOST_USER_I2C,
-    .parent = TYPE_VIRTIO_DEVICE,
+    .parent = TYPE_VHOST_USER_BASE,
     .instance_size = sizeof(VHostUserI2C),
     .class_init = vu_i2c_class_init,
 };
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 8c6cb2143d..31c0406f05 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -10,6 +10,9 @@ softmmu_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_RNG'],
 softmmu_virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
 softmmu_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'],
                       if_true: files('vhost-user-gpio-pci.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
+softmmu_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'],
+                       if_true: files('vhost-user-i2c-pci.c'))
 
 specific_virtio_ss = ss.source_set()
 specific_virtio_ss.add(files('virtio.c'))
@@ -39,14 +42,12 @@ specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-us
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
 specific_virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk-pci.c'))
-virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
-- 
2.39.2


