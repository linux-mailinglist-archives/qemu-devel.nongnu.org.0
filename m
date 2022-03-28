Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6004E9A26
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:52:50 +0200 (CEST)
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqjh-0000hW-Ia
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:52:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO7-0007BW-6S; Mon, 28 Mar 2022 10:30:31 -0400
Received: from [2a00:1450:4864:20::632] (port=45603
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO5-0000ul-9x; Mon, 28 Mar 2022 10:30:30 -0400
Received: by mail-ej1-x632.google.com with SMTP id qa43so29044710ejc.12;
 Mon, 28 Mar 2022 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GF4UlC66cOwqYvu8g2O4M+mJ+YuQvyIbY5fZCyNHlHg=;
 b=KAyyL/rKY8OcDZj0M0YXyGsBrFX/NneXZC5+GssgkU49+gSQSvvZD6TTjwfoETsWsA
 FwoT4orEkRMSzri9Pp40VpizWq/YPoVdXtdh1b1F+vYCJg8ncyJRh33yVl6iOL7RVZY+
 q9JA3Xzjt00SbhW/fXCboYjTjwNBHRzCUOIFym69W31fT1OYxRXv27rVdIeC+DHGBW3g
 UoDQ+ZEzIBkehHMaIJ+/DMwPSQuCd4rD8xxYAbBe8Bz+J3ahfy3J41nbG7A75AjQyjuy
 /wi8uPGtqDvXiUdKmnynAPZ36AArxc8xZ/BKIS1YHlT8HhK3ZV9bIZFTealA9hBOcUiX
 nRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GF4UlC66cOwqYvu8g2O4M+mJ+YuQvyIbY5fZCyNHlHg=;
 b=xSfpXCLsOmlknNLa59C3RLcDj8L1zSx9pXwYRIRuxb+dwGky1Wr1aSd24JLMumMlr6
 Z46r28vJmgahovqvnfC9w23tXjbe792IH/mMx94xqsxAzOzNKYD7cbHSKvnSpPDO1Qot
 ZYicfil8/CV54k1+Vu7F5FMfcXOB2+pFha3MJY44HHNOU093uiZWMSaSg0ceusKbuiKk
 fhCgSm4loG1SVRy3DeBzBIssSFBPzVzp0yD2RK6DFmeMcB1rcreu6naPX4LJKfujf+qV
 QtDnVKIdRIqMO85Jv7ujv0Yc+07asLOuVakwNu+loqfv6bWWdPDKTTQk3Iw8cFv0QpV7
 LSvg==
X-Gm-Message-State: AOAM533ldn8gFBVA4esGN4quZRe4tAr7A5l1+y0xTGvBI/y3CE4Wjjam
 RbT4GG+zbQJyN6QsqEg9vEm53tX7nVU=
X-Google-Smtp-Source: ABdhPJwNhgzhjzUxX0lKm/3voDJmRM9B7U6qI2y7a+pBSAC4lrfRXBXAT8rAR8cHXwT3LCKrAk+Hag==
X-Received: by 2002:a17:907:7f26:b0:6e0:3ce7:9cdd with SMTP id
 qf38-20020a1709077f2600b006e03ce79cddmr28649803ejc.127.1648477826414; 
 Mon, 28 Mar 2022 07:30:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a1709062b5500b006e10152162asm1982310ejg.222.2022.03.28.07.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:30:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] virtio-ccw: move vhost_ccw_scsi to a separate file
Date: Mon, 28 Mar 2022 16:30:17 +0200
Message-Id: <20220328143019.682245-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328143019.682245-1-pbonzini@redhat.com>
References: <20220328143019.682245-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove unecessary use of #ifdef CONFIG_VHOST_SCSI, instead just use a
separate file and a separate rule in meson.build.

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



