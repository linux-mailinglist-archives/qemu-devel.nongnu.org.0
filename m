Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0550667B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 10:05:15 +0200 (CEST)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngirK-0004XO-RW
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 04:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmQ-0001Ip-Qa
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmN-0004af-NH
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id e21so20911836wrc.8
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2W5jIL1FBg/6ZA0XImRKz1Nkg1aJ+Tsf3oso25lUHHQ=;
 b=F5l4bDTSwLq8E+Y6IjLZQUYRIcXyNq8RImtQ9PJktdx6fWvhF0XsL6+nVGGPFgiW1K
 /e5J1McFRdkQ9MBhIN4k65OYD4kPqBaj3ZWbS9PLYccrKPz4UiuqL8FM6BNvxjRkKm3y
 DQ6c3z1Fee3rvJLRm2jGfNbZfoczFq8P77TWQaAFfntNL0MUoHE9BZWH/66d4QoUKwsA
 zMNxkj5V2SdLIF89g+cbGyk/8SiQ3WHIeyUBsrHkNGOmrKBYioz1kJNf7eD7318aLJHI
 5sxtdgQ8iFYJJ3M7miVKm8TAmJ8PtLT9qECBupPCmqxnKMr8sX+Gwp3D4yqaD4aEEeVK
 SPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2W5jIL1FBg/6ZA0XImRKz1Nkg1aJ+Tsf3oso25lUHHQ=;
 b=Bt4GJA8RCEujoOT2dIRoP9aitMM97jJiiRRZg8uU/mtL/XpxaebSzW7kFPT3suuw6q
 gagO35mLpAnhzBEJOK5pIjmeMUok97kKImNlVvK95tmUGbn+CQo4vqufhYhLBDR2TKlv
 tamMTsMkWQm4RKYHBwndTRXHM17CaA2uH5D77ZMB3i1pdPNYaMqFuvHAr3HsikUsWi09
 GucZC2a7bXm2y0G9En479OekCVFUvIoxj+bA3/yfz3WR9tVBd4QhQjB5nD3uuo58ZAGG
 wgMsrlGplfHwsoW/16kQuviIIeBLl0fIYnhQnUoRXo80w9xz1EiYOMBGksGekhP2ITB4
 i55g==
X-Gm-Message-State: AOAM531k12Buy1lnJ7tJ2pOd0yiBpVaboaSWtkCkjszK6C6wOv+vFqXH
 QvsomvXuI4qVY9LI2InasAXLzE+NjRETYQ==
X-Google-Smtp-Source: ABdhPJxlgxSo4XCoiqPpTmnxQAOrT04pOiIb+FY5rVTrQkoDs8q8X8IRYqtJA5vJoVoW4bYUGxkyPg==
X-Received: by 2002:a05:6000:1a85:b0:205:a234:d0a5 with SMTP id
 f5-20020a0560001a8500b00205a234d0a5mr10658430wry.126.1650347515478; 
 Mon, 18 Apr 2022 22:51:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 49/53] virtio-ccw: move vhost_ccw_scsi to a separate file
Date: Tue, 19 Apr 2022 07:51:05 +0200
Message-Id: <20220419055109.142788-50-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove unecessary use of #ifdef CONFIG_VHOST_SCSI, instead just use a
separate file and a separate rule in meson.build.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/meson.build       |  1 +
 hw/s390x/vhost-scsi-ccw.c  | 64 ++++++++++++++++++++++++++++++++++++++
 hw/s390x/virtio-ccw-scsi.c | 47 ----------------------------
 3 files changed, 65 insertions(+), 47 deletions(-)
 create mode 100644 hw/s390x/vhost-scsi-ccw.c

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 28484256ec..feefe0717e 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -44,6 +44,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-ccw-serial.c'
 if have_virtfs
   virtio_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-ccw-9p.c'))
 endif
+virtio_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-ccw.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-ccw.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'))
 s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
diff --git a/hw/s390x/vhost-scsi-ccw.c b/hw/s390x/vhost-scsi-ccw.c
new file mode 100644
index 0000000000..b68ddddd1c
--- /dev/null
+++ b/hw/s390x/vhost-scsi-ccw.c
@@ -0,0 +1,64 @@
+/*
+ * vhost ccw scsi implementation
+ *
+ * Copyright 2012, 2015 IBM Corp.
+ * Author(s): Cornelia Huck <cornelia.huck@de.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/virtio.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "virtio-ccw.h"
+
+static void vhost_ccw_scsi_realize(VirtioCcwDevice *ccw_dev, Error **errp)
+{
+    VHostSCSICcw *dev = VHOST_SCSI_CCW(ccw_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
+}
+
+static void vhost_ccw_scsi_instance_init(Object *obj)
+{
+    VHostSCSICcw *dev = VHOST_SCSI_CCW(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_SCSI);
+}
+
+static Property vhost_ccw_scsi_properties[] = {
+    DEFINE_PROP_UINT32("max_revision", VirtioCcwDevice, max_rev,
+                       VIRTIO_CCW_MAX_REV),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vhost_ccw_scsi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtIOCCWDeviceClass *k = VIRTIO_CCW_DEVICE_CLASS(klass);
+
+    k->realize = vhost_ccw_scsi_realize;
+    device_class_set_props(dc, vhost_ccw_scsi_properties);
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+}
+
+static const TypeInfo vhost_ccw_scsi = {
+    .name          = TYPE_VHOST_SCSI_CCW,
+    .parent        = TYPE_VIRTIO_CCW_DEVICE,
+    .instance_size = sizeof(VHostSCSICcw),
+    .instance_init = vhost_ccw_scsi_instance_init,
+    .class_init    = vhost_ccw_scsi_class_init,
+};
+
+static void virtio_ccw_scsi_register(void)
+{
+    type_register_static(&vhost_ccw_scsi);
+}
+
+type_init(virtio_ccw_scsi_register)
diff --git a/hw/s390x/virtio-ccw-scsi.c b/hw/s390x/virtio-ccw-scsi.c
index 6e4beef700..fa706eb550 100644
--- a/hw/s390x/virtio-ccw-scsi.c
+++ b/hw/s390x/virtio-ccw-scsi.c
@@ -70,56 +70,9 @@ static const TypeInfo virtio_ccw_scsi = {
     .class_init    = virtio_ccw_scsi_class_init,
 };
 
-#ifdef CONFIG_VHOST_SCSI
-
-static void vhost_ccw_scsi_realize(VirtioCcwDevice *ccw_dev, Error **errp)
-{
-    VHostSCSICcw *dev = VHOST_SCSI_CCW(ccw_dev);
-    DeviceState *vdev = DEVICE(&dev->vdev);
-
-    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
-}
-
-static void vhost_ccw_scsi_instance_init(Object *obj)
-{
-    VHostSCSICcw *dev = VHOST_SCSI_CCW(obj);
-
-    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
-                                TYPE_VHOST_SCSI);
-}
-
-static Property vhost_ccw_scsi_properties[] = {
-    DEFINE_PROP_UINT32("max_revision", VirtioCcwDevice, max_rev,
-                       VIRTIO_CCW_MAX_REV),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void vhost_ccw_scsi_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    VirtIOCCWDeviceClass *k = VIRTIO_CCW_DEVICE_CLASS(klass);
-
-    k->realize = vhost_ccw_scsi_realize;
-    device_class_set_props(dc, vhost_ccw_scsi_properties);
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-}
-
-static const TypeInfo vhost_ccw_scsi = {
-    .name          = TYPE_VHOST_SCSI_CCW,
-    .parent        = TYPE_VIRTIO_CCW_DEVICE,
-    .instance_size = sizeof(VHostSCSICcw),
-    .instance_init = vhost_ccw_scsi_instance_init,
-    .class_init    = vhost_ccw_scsi_class_init,
-};
-
-#endif
-
 static void virtio_ccw_scsi_register(void)
 {
     type_register_static(&virtio_ccw_scsi);
-#ifdef CONFIG_VHOST_SCSI
-    type_register_static(&vhost_ccw_scsi);
-#endif
 }
 
 type_init(virtio_ccw_scsi_register)
-- 
2.35.1



