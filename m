Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493B33C5E8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:41:52 +0100 (CET)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsA3-0007CP-3J
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYf-0002Hl-RU
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYY-0000bJ-8A
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFNN6nJDXlEXvj7jL1UN7ZbkzKmEIDhAe1pdk9+/giU=;
 b=XORoXKT5jK6T2z0p5Cs+uI1rLpZUzLxO6fHTebpsZInKiIkWCI03YC9xY9mmNxUWAr2wcU
 cghyYa5A2ESUDiDkhXPJPRrm2T3Rb32vIo4jMACQd/7STqM9aVv7a4TqeGzjdys4DYlM7I
 td4+yLLlIzXV8twdC+JgfsXEgwAJfro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-uhWyStL6MKe4BrtrJEWKiA-1; Mon, 15 Mar 2021 14:03:00 -0400
X-MC-Unique: uhWyStL6MKe4BrtrJEWKiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A869363B3;
 Mon, 15 Mar 2021 18:02:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9DC9610AF;
 Mon, 15 Mar 2021 18:02:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 98A981800841; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] usb/storage move usb-storage device to separate source
 file
Date: Mon, 15 Mar 2021 19:02:38 +0100
Message-Id: <20210315180240.1597240-12-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
References: <20210315180240.1597240-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pure code motion, no functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210312090425.772900-4-kraxel@redhat.com>
---
 hw/usb/dev-storage-classic.c | 156 +++++++++++++++++++++++++++++++++++
 hw/usb/dev-storage.c         | 135 ------------------------------
 hw/usb/meson.build           |   1 +
 3 files changed, 157 insertions(+), 135 deletions(-)
 create mode 100644 hw/usb/dev-storage-classic.c

diff --git a/hw/usb/dev-storage-classic.c b/hw/usb/dev-storage-classic.c
new file mode 100644
index 000000000000..00cb34b22f02
--- /dev/null
+++ b/hw/usb/dev-storage-classic.c
@@ -0,0 +1,156 @@
+/*
+ * USB Mass Storage Device emulation
+ *
+ * Copyright (c) 2006 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the LGPL.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/typedefs.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "hw/usb.h"
+#include "hw/usb/desc.h"
+#include "hw/usb/msd.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
+
+static const struct SCSIBusInfo usb_msd_scsi_info_storage = {
+    .tcq = false,
+    .max_target = 0,
+    .max_lun = 0,
+
+    .transfer_data = usb_msd_transfer_data,
+    .complete = usb_msd_command_complete,
+    .cancel = usb_msd_request_cancelled,
+    .load_request = usb_msd_load_request,
+};
+
+static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
+{
+    MSDState *s = USB_STORAGE_DEV(dev);
+    BlockBackend *blk = s->conf.blk;
+    SCSIDevice *scsi_dev;
+
+    if (!blk) {
+        error_setg(errp, "drive property not set");
+        return;
+    }
+
+    if (!blkconf_blocksizes(&s->conf, errp)) {
+        return;
+    }
+
+    if (!blkconf_apply_backend_options(&s->conf, !blk_supports_write_perm(blk),
+                                       true, errp)) {
+        return;
+    }
+
+    /*
+     * Hack alert: this pretends to be a block device, but it's really
+     * a SCSI bus that can serve only a single device, which it
+     * creates automatically.  But first it needs to detach from its
+     * blockdev, or else scsi_bus_legacy_add_drive() dies when it
+     * attaches again. We also need to take another reference so that
+     * blk_detach_dev() doesn't free blk while we still need it.
+     *
+     * The hack is probably a bad idea.
+     */
+    blk_ref(blk);
+    blk_detach_dev(blk, DEVICE(s));
+    s->conf.blk = NULL;
+
+    usb_desc_create_serial(dev);
+    usb_desc_init(dev);
+    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
+                 &usb_msd_scsi_info_storage, NULL);
+    scsi_dev = scsi_bus_legacy_add_drive(&s->bus, blk, 0, !!s->removable,
+                                         s->conf.bootindex, s->conf.share_rw,
+                                         s->conf.rerror, s->conf.werror,
+                                         dev->serial,
+                                         errp);
+    blk_unref(blk);
+    if (!scsi_dev) {
+        return;
+    }
+    usb_msd_handle_reset(dev);
+    s->scsi_dev = scsi_dev;
+}
+
+static Property msd_properties[] = {
+    DEFINE_BLOCK_PROPERTIES(MSDState, conf),
+    DEFINE_BLOCK_ERROR_PROPERTIES(MSDState, conf),
+    DEFINE_PROP_BOOL("removable", MSDState, removable, false),
+    DEFINE_PROP_BOOL("commandlog", MSDState, commandlog, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void usb_msd_class_storage_initfn(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
+
+    uc->realize = usb_msd_storage_realize;
+    device_class_set_props(dc, msd_properties);
+}
+
+static void usb_msd_get_bootindex(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    USBDevice *dev = USB_DEVICE(obj);
+    MSDState *s = USB_STORAGE_DEV(dev);
+
+    visit_type_int32(v, name, &s->conf.bootindex, errp);
+}
+
+static void usb_msd_set_bootindex(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    USBDevice *dev = USB_DEVICE(obj);
+    MSDState *s = USB_STORAGE_DEV(dev);
+    int32_t boot_index;
+    Error *local_err = NULL;
+
+    if (!visit_type_int32(v, name, &boot_index, errp)) {
+        return;
+    }
+    /* check whether bootindex is present in fw_boot_order list  */
+    check_boot_index(boot_index, &local_err);
+    if (local_err) {
+        goto out;
+    }
+    /* change bootindex to a new one */
+    s->conf.bootindex = boot_index;
+
+    if (s->scsi_dev) {
+        object_property_set_int(OBJECT(s->scsi_dev), "bootindex", boot_index,
+                                &error_abort);
+    }
+
+out:
+    error_propagate(errp, local_err);
+}
+
+static void usb_msd_instance_init(Object *obj)
+{
+    object_property_add(obj, "bootindex", "int32",
+                        usb_msd_get_bootindex,
+                        usb_msd_set_bootindex, NULL, NULL);
+    object_property_set_int(obj, "bootindex", -1, NULL);
+}
+
+static const TypeInfo msd_info = {
+    .name          = "usb-storage",
+    .parent        = TYPE_USB_STORAGE,
+    .class_init    = usb_msd_class_storage_initfn,
+    .instance_init = usb_msd_instance_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&msd_info);
+}
+
+type_init(register_types)
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 3e613ecc886b..7b587ad051ff 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -19,9 +19,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
 #include "migration/vmstate.h"
-#include "sysemu/sysemu.h"
-#include "sysemu/block-backend.h"
-#include "qapi/visitor.h"
 #include "qemu/cutils.h"
 #include "qom/object.h"
 #include "trace.h"
@@ -540,68 +537,6 @@ void *usb_msd_load_request(QEMUFile *f, SCSIRequest *req)
     return NULL;
 }
 
-static const struct SCSIBusInfo usb_msd_scsi_info_storage = {
-    .tcq = false,
-    .max_target = 0,
-    .max_lun = 0,
-
-    .transfer_data = usb_msd_transfer_data,
-    .complete = usb_msd_command_complete,
-    .cancel = usb_msd_request_cancelled,
-    .load_request = usb_msd_load_request,
-};
-
-static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
-{
-    MSDState *s = USB_STORAGE_DEV(dev);
-    BlockBackend *blk = s->conf.blk;
-    SCSIDevice *scsi_dev;
-
-    if (!blk) {
-        error_setg(errp, "drive property not set");
-        return;
-    }
-
-    if (!blkconf_blocksizes(&s->conf, errp)) {
-        return;
-    }
-
-    if (!blkconf_apply_backend_options(&s->conf, !blk_supports_write_perm(blk),
-                                       true, errp)) {
-        return;
-    }
-
-    /*
-     * Hack alert: this pretends to be a block device, but it's really
-     * a SCSI bus that can serve only a single device, which it
-     * creates automatically.  But first it needs to detach from its
-     * blockdev, or else scsi_bus_legacy_add_drive() dies when it
-     * attaches again. We also need to take another reference so that
-     * blk_detach_dev() doesn't free blk while we still need it.
-     *
-     * The hack is probably a bad idea.
-     */
-    blk_ref(blk);
-    blk_detach_dev(blk, DEVICE(s));
-    s->conf.blk = NULL;
-
-    usb_desc_create_serial(dev);
-    usb_desc_init(dev);
-    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
-                 &usb_msd_scsi_info_storage, NULL);
-    scsi_dev = scsi_bus_legacy_add_drive(&s->bus, blk, 0, !!s->removable,
-                                         s->conf.bootindex, s->conf.share_rw,
-                                         s->conf.rerror, s->conf.werror,
-                                         dev->serial,
-                                         errp);
-    blk_unref(blk);
-    if (!scsi_dev) {
-        return;
-    }
-    usb_msd_handle_reset(dev);
-    s->scsi_dev = scsi_dev;
-}
-
 static const VMStateDescription vmstate_usb_msd = {
     .name = "usb-storage",
     .version_id = 1,
@@ -620,14 +555,6 @@ static const VMStateDescription vmstate_usb_msd = {
     }
 };
 
-static Property msd_properties[] = {
-    DEFINE_BLOCK_PROPERTIES(MSDState, conf),
-    DEFINE_BLOCK_ERROR_PROPERTIES(MSDState, conf),
-    DEFINE_PROP_BOOL("removable", MSDState, removable, false),
-    DEFINE_PROP_BOOL("commandlog", MSDState, commandlog, false),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void usb_msd_class_initfn_common(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -645,52 +572,6 @@ static void usb_msd_class_initfn_common(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_usb_msd;
 }
 
-static void usb_msd_class_storage_initfn(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
-
-    uc->realize = usb_msd_storage_realize;
-    device_class_set_props(dc, msd_properties);
-}
-
-static void usb_msd_get_bootindex(Object *obj, Visitor *v, const char *name,
-                                  void *opaque, Error **errp)
-{
-    USBDevice *dev = USB_DEVICE(obj);
-    MSDState *s = USB_STORAGE_DEV(dev);
-
-    visit_type_int32(v, name, &s->conf.bootindex, errp);
-}
-
-static void usb_msd_set_bootindex(Object *obj, Visitor *v, const char *name,
-                                  void *opaque, Error **errp)
-{
-    USBDevice *dev = USB_DEVICE(obj);
-    MSDState *s = USB_STORAGE_DEV(dev);
-    int32_t boot_index;
-    Error *local_err = NULL;
-
-    if (!visit_type_int32(v, name, &boot_index, errp)) {
-        return;
-    }
-    /* check whether bootindex is present in fw_boot_order list  */
-    check_boot_index(boot_index, &local_err);
-    if (local_err) {
-        goto out;
-    }
-    /* change bootindex to a new one */
-    s->conf.bootindex = boot_index;
-
-    if (s->scsi_dev) {
-        object_property_set_int(OBJECT(s->scsi_dev), "bootindex", boot_index,
-                                &error_abort);
-    }
-
-out:
-    error_propagate(errp, local_err);
-}
-
 static const TypeInfo usb_storage_dev_type_info = {
     .name = TYPE_USB_STORAGE,
     .parent = TYPE_USB_DEVICE,
@@ -699,25 +580,9 @@ static const TypeInfo usb_storage_dev_type_info = {
     .class_init = usb_msd_class_initfn_common,
 };
 
-static void usb_msd_instance_init(Object *obj)
-{
-    object_property_add(obj, "bootindex", "int32",
-                        usb_msd_get_bootindex,
-                        usb_msd_set_bootindex, NULL, NULL);
-    object_property_set_int(obj, "bootindex", -1, NULL);
-}
-
-static const TypeInfo msd_info = {
-    .name          = "usb-storage",
-    .parent        = TYPE_USB_STORAGE,
-    .class_init    = usb_msd_class_storage_initfn,
-    .instance_init = usb_msd_instance_init,
-};
-
 static void usb_msd_register_types(void)
 {
     type_register_static(&usb_storage_dev_type_info);
-    type_register_static(&msd_info);
 }
 
 type_init(usb_msd_register_types)
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 518cd1fbbbea..9e4da68e3b6c 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -42,6 +42,7 @@ softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hid.c'))
 softmmu_ss.add(when: 'CONFIG_USB_TABLET_WACOM', if_true: files('dev-wacom.c'))
 softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage.c'))
 softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage-bot.c'))
+softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage-classic.c'))
 softmmu_ss.add(when: 'CONFIG_USB_STORAGE_UAS', if_true: files('dev-uas.c'))
 softmmu_ss.add(when: 'CONFIG_USB_AUDIO', if_true: files('dev-audio.c'))
 softmmu_ss.add(when: 'CONFIG_USB_SERIAL', if_true: files('dev-serial.c'))
-- 
2.29.2


