Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0DA6E6959
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:23:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5X-0006nD-R3; Tue, 18 Apr 2023 12:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5V-0006mv-TB
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5T-0001Bh-9D
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f16b99b936so15376115e9.3
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834906; x=1684426906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTkEU0oqDGeWEiEFn49DE5kPkeQF20sGslhQri+i2Js=;
 b=Qx4KdgdPZjW3qENTPMJcMl8Ulf9v7o9rH1J8gU/pwRgUKgk7FciB6j07A4w9Y4PmeP
 eSx8DfuLJc262S8OMkXsepujdQ8PVmihiXGn15NkgfJPxKWJKjvto91EBAzWQ8TUSf6C
 7piiG2N2DugFTjQx+FykbO5SaBYW5NF7FoqsWPRNSdwmsYM/dIleNZrGqNUrDXlyB4fl
 k7MHLz4Sy0SiCgqS3rYa1p7sGh0MLaIOxO1jYjPr7CeFO1e8bFbxTgyteR2J6jOPfNlX
 cfPUGK++kx3ZVxJexecLX/54ut58loJbBsBqibRW2YaEIZfirKgnfmdrHMYAYNjnels6
 pxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834906; x=1684426906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTkEU0oqDGeWEiEFn49DE5kPkeQF20sGslhQri+i2Js=;
 b=lS5QfEWY18q2Xs3UYpE9JiM3i9I7bXPG7q7JQBBVxtTeiDCtzcHzYcyKY/UTxBeszR
 HvzYZiKyYUVpp3K2gVMqUh1unvjSYjAHXikomsZj74SMrxxgxUmmDD9gA5gjmgu0PQhj
 pTAOUlv1nwLYBsu2mGl5Ige1mMzsulSKYoZNBt/FBs8ym3YCbQZvELQ6vNM1QIv/UOLO
 lnoDm/07VRuxVaSeeU2X+rtfghj2lnSp0wtN7hdrkLGtBFhFDletbh5KgeQJp55gKDXC
 o/93yRIU98ahTF7xUa3JjOj88459A/9OtjqvjiTJtd9Nf1+3HTm1vtPBNaP7+G5bXBaj
 wW9g==
X-Gm-Message-State: AAQBX9diFb+u3/Ox1jWAlt6ge97asrG2cCOnGSP9G9Vt9/LXWeNSydvr
 3vUn8y5kNVPO636XlQjZ+Vx6dw==
X-Google-Smtp-Source: AKy350bIir60SeU7Ft6Xz35nCUgfgJsSOyRInz5vr4Q61YC0UkSWJW3F4VpZAAbLUaM6JKjTKslsjA==
X-Received: by 2002:adf:f8d0:0:b0:2c5:3cd2:b8e with SMTP id
 f16-20020adff8d0000000b002c53cd20b8emr2406488wrq.1.1681834905766; 
 Tue, 18 Apr 2023 09:21:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056000108b00b002f013fb708fsm13560795wrw.4.2023.04.18.09.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C4391FFB7;
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
Subject: [PATCH v2 10/13] hw/virtio: add config support to vhost-user-device
Date: Tue, 18 Apr 2023 17:21:37 +0100
Message-Id: <20230418162140.373219-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

To use the generic device the user will need to provide the config
region size via the command line. We also add a notifier so the guest
can be pinged if the remote daemon updates the config.

With these changes:

  -device vhost-user-device-pci,virtio-id=41,num_vqs=2,config_size=8

is equivalent to:

  -device vhost-user-gpio-pci

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/vhost-user-device.h |  1 +
 hw/virtio/vhost-user-device.c         | 58 ++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost-user-device.h b/include/hw/virtio/vhost-user-device.h
index 9105011e25..3ddf88a146 100644
--- a/include/hw/virtio/vhost-user-device.h
+++ b/include/hw/virtio/vhost-user-device.h
@@ -22,6 +22,7 @@ struct VHostUserBase {
     CharBackend chardev;
     uint16_t virtio_id;
     uint32_t num_vqs;
+    uint32_t config_size;
     /* State tracking */
     VhostUserState vhost_user;
     struct vhost_virtqueue *vhost_vq;
diff --git a/hw/virtio/vhost-user-device.c b/hw/virtio/vhost-user-device.c
index b0239fa033..2b028cae08 100644
--- a/hw/virtio/vhost-user-device.c
+++ b/hw/virtio/vhost-user-device.c
@@ -117,6 +117,42 @@ static uint64_t vub_get_features(VirtIODevice *vdev,
     return vub->vhost_dev.features & ~(1ULL << VHOST_USER_F_PROTOCOL_FEATURES);
 }
 
+/*
+ * To handle VirtIO config we need to know the size of the config
+ * space. We don't cache the config but re-fetch it from the guest
+ * every time in case something has changed.
+ */
+static void vub_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VHostUserBase *vub = VHOST_USER_BASE(vdev);
+    Error *local_err = NULL;
+
+    /*
+     * There will have been a warning during vhost_dev_init, but lets
+     * assert here as nothing will go right now.
+     */
+    g_assert(vub->config_size && vub->vhost_user.supports_config == true);
+
+    if (vhost_dev_get_config(&vub->vhost_dev, config,
+                             vub->config_size, &local_err)) {
+        error_report_err(local_err);
+    }
+}
+
+/*
+ * When the daemon signals an update to the config we just need to
+ * signal the guest as we re-read the config on demand above.
+ */
+static int vub_config_notifier(struct vhost_dev *dev)
+{
+    virtio_notify_config(dev->vdev);
+    return 0;
+}
+
+const VhostDevConfigOps vub_config_ops = {
+    .vhost_dev_config_notifier = vub_config_notifier,
+};
+
 static void vub_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     /*
@@ -141,12 +177,21 @@ static int vub_connect(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBase *vub = VHOST_USER_BASE(vdev);
+    struct vhost_dev *vhost_dev = &vub->vhost_dev;
 
     if (vub->connected) {
         return 0;
     }
     vub->connected = true;
 
+    /*
+     * If we support VHOST_USER_GET_CONFIG we must enable the notifier
+     * so we can ping the guest when it updates.
+     */
+    if (vub->vhost_user.supports_config) {
+        vhost_dev_set_config_notifier(vhost_dev, &vub_config_ops);
+    }
+
     /* restore vhost state */
     if (virtio_device_started(vdev, vdev->status)) {
         vub_start(vdev);
@@ -214,11 +259,20 @@ static void vub_device_realize(DeviceState *dev, Error **errp)
         vub->num_vqs = 1; /* reasonable default? */
     }
 
+    /*
+     * We can't handle config requests unless we know the size of the
+     * config region, specialisations of the vhost-user-device will be
+     * able to set this.
+     */
+    if (vub->config_size) {
+        vub->vhost_user.supports_config = true;
+    }
+
     if (!vhost_user_init(&vub->vhost_user, &vub->chardev, errp)) {
         return;
     }
 
-    virtio_init(vdev, vub->virtio_id, 0);
+    virtio_init(vdev, vub->virtio_id, vub->config_size);
 
     /*
      * Disable guest notifiers, by default all notifications will be via the
@@ -268,6 +322,7 @@ static void vub_class_init(ObjectClass *klass, void *data)
     vdc->realize = vub_device_realize;
     vdc->unrealize = vub_device_unrealize;
     vdc->get_features = vub_get_features;
+    vdc->get_config = vub_get_config;
     vdc->set_status = vub_set_status;
 }
 
@@ -295,6 +350,7 @@ static Property vud_properties[] = {
     DEFINE_PROP_CHR("chardev", VHostUserBase, chardev),
     DEFINE_PROP_UINT16("virtio-id", VHostUserBase, virtio_id, 0),
     DEFINE_PROP_UINT32("num_vqs", VHostUserBase, num_vqs, 1),
+    DEFINE_PROP_UINT32("config_size", VHostUserBase, config_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.39.2


