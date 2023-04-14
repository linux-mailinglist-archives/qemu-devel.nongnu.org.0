Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57316E2800
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:05:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvP-0007sF-Pe; Fri, 14 Apr 2023 12:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLul-0006SH-K9
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLui-0007zc-Ln
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k27-20020a05600c1c9b00b003f0a9f022beso2257194wms.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488279; x=1684080279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LanDirQaSq5LBuEyiFieoGUbbdGI81Zqz66tepS9FQ=;
 b=U+LgH173VoEnClmk7N0zz0J0Rbd4X7uGJOV6cb1+Vm9EpXFm77MJQJOHdsXWn5tQa6
 RzHZyoSBqWlab3YUwF42OKbMZ/hcISl09QhqYXX8+OOT4TdzQ8y7lFnLeFfU3SXSG07S
 sqxYetcbQknkip75ZkqNrPqtOvFUuhBxn+4PxmAaUOw1nx53VG+QKQN6RfkqLzIHFXDN
 mlRm5NAOoa8fFcM9ttDD0kw2hI/W9+qpw7hNvTM+JCOVjw0iyawvPgAYTqATjS4LvGNB
 x2aJ0o20sJKrycdLO5aMw1PP2PgN+ypmh5D2RAdDudGPHMbBYtvnHBCk0pF3mL4Z0wwB
 8T+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488279; x=1684080279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8LanDirQaSq5LBuEyiFieoGUbbdGI81Zqz66tepS9FQ=;
 b=Kh46m9qiJ/ObR6gOyxN5RjU+YakMRimROd1TL3x/ivmOdegI2wMKPf6TJHT5s/aZXk
 nBxsgez3JEjZEzHylnwxbG6SQXVuPHtdJ8eTQRyBrKsEWqxt1oaEaNuH1ooTMZIFCCFu
 bBGbZNmmPMxhAugF33UH87DO7ide/eCOqY9ld8fNfMgUs+V+mFbs92Yzzd3DnSFsAgHX
 iIc55k+CHay+zXWXfncK8WcC6PGvo3cEYY54AkA1BlRVvfS5z8PJUfRnl0rOlbsEX7pO
 /pO8XzrMNfvChueVxwo3+IzE/JvvBgm2vAfn9pM99derQbRofPfEtWsi0LmXt6eM9aUz
 20mA==
X-Gm-Message-State: AAQBX9cI2iP1JFi2N4Fs7PrXvEZR6YKjjncNNM5NxgY4rQXKA2GqFl5R
 pkWx4C/flC2rjCvwFWyAOpbOUw==
X-Google-Smtp-Source: AKy350YCJF+OxYLnFvtHqPriQ7R3H2JXzXlzuDX7L7ecMBRJMlH1V50tdFIyYs6GlGheU9LpeKi7VQ==
X-Received: by 2002:a1c:4c1a:0:b0:3f0:a9e5:3ae with SMTP id
 z26-20020a1c4c1a000000b003f0a9e503aemr4732344wmf.24.1681488279014; 
 Fri, 14 Apr 2023 09:04:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05600c21c200b003f149715cb6sm1067151wmj.10.2023.04.14.09.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2B881FFB8;
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
Subject: [PATCH 10/12] hw/virtio: add config support to vhost-user-device
Date: Fri, 14 Apr 2023 17:04:31 +0100
Message-Id: <20230414160433.2096866-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
index 8d77f06721..cb98e0dcaa 100644
--- a/include/hw/virtio/vhost-user-device.h
+++ b/include/hw/virtio/vhost-user-device.h
@@ -21,6 +21,7 @@ struct VHostUserDevice {
     CharBackend chardev;
     uint16_t virtio_id;
     uint32_t num_vqs;
+    uint32_t config_size;
     /* State tracking */
     VhostUserState vhost_user;
     struct vhost_virtqueue *vhost_vq;
diff --git a/hw/virtio/vhost-user-device.c b/hw/virtio/vhost-user-device.c
index bfbf3b29cb..977cfed247 100644
--- a/hw/virtio/vhost-user-device.c
+++ b/hw/virtio/vhost-user-device.c
@@ -117,6 +117,42 @@ static uint64_t vud_get_features(VirtIODevice *vdev,
     return vud->vhost_dev.features & ~(1ULL << VHOST_USER_F_PROTOCOL_FEATURES);
 }
 
+/*
+ * To handle VirtIO config we need to know the size of the config
+ * space. We don't cache the config but re-fetch it from the guest
+ * every time in case something has changed.
+ */
+static void vud_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+    Error *local_err = NULL;
+
+    /*
+     * There will have been a warning during vhost_dev_init, but lets
+     * assert here as nothing will go right now.
+     */
+    g_assert(vud->config_size && vud->vhost_user.supports_config == true);
+
+    if (vhost_dev_get_config(&vud->vhost_dev, config,
+                             vud->config_size, &local_err)) {
+        error_report_err(local_err);
+    }
+}
+
+/*
+ * When the daemon signals an update to the config we just need to
+ * signal the guest as we re-read the config on demand above.
+ */
+static int vud_config_notifier(struct vhost_dev *dev)
+{
+    virtio_notify_config(dev->vdev);
+    return 0;
+}
+
+const VhostDevConfigOps vud_config_ops = {
+    .vhost_dev_config_notifier = vud_config_notifier,
+};
+
 static void vud_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     /*
@@ -141,12 +177,21 @@ static int vud_connect(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserDevice *vud = VHOST_USER_DEVICE(vdev);
+    struct vhost_dev *vhost_dev = &vud->vhost_dev;
 
     if (vud->connected) {
         return 0;
     }
     vud->connected = true;
 
+    /*
+     * If we support VHOST_USER_GET_CONFIG we must enable the notifier
+     * so we can ping the guest when it updates.
+     */
+    if (vud->vhost_user.supports_config) {
+        vhost_dev_set_config_notifier(vhost_dev, &vud_config_ops);
+    }
+
     /* restore vhost state */
     if (virtio_device_started(vdev, vdev->status)) {
         vud_start(vdev);
@@ -214,11 +259,20 @@ static void vud_device_realize(DeviceState *dev, Error **errp)
         vud->num_vqs = 1; /* reasonable default? */
     }
 
+    /*
+     * We can't handle config requests unless we know the size of the
+     * config region, specialisations of the vhost-user-device will be
+     * able to set this.
+     */
+    if (vud->config_size) {
+        vud->vhost_user.supports_config = true;
+    }
+
     if (!vhost_user_init(&vud->vhost_user, &vud->chardev, errp)) {
         return;
     }
 
-    virtio_init(vdev, vud->virtio_id, 0);
+    virtio_init(vdev, vud->virtio_id, vud->config_size);
 
     /*
      * Disable guest notifiers, by default all notifications will be via the
@@ -271,6 +325,7 @@ static Property vud_properties[] = {
     DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
     DEFINE_PROP_UINT16("virtio-id", VHostUserDevice, virtio_id, 0),
     DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
+    DEFINE_PROP_UINT32("config_size", VHostUserDevice, config_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -285,6 +340,7 @@ static void vud_class_init(ObjectClass *klass, void *data)
     vdc->realize = vud_device_realize;
     vdc->unrealize = vud_device_unrealize;
     vdc->get_features = vud_get_features;
+    vdc->get_config = vud_get_config;
     vdc->set_status = vud_set_status;
 }
 
-- 
2.39.2


