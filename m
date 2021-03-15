Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA633C5BB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:34:29 +0100 (CET)
Received: from localhost ([::1]:42456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs2u-0005BU-G6
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYX-0002Dn-J0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYP-0000Ym-K9
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0ENLpXO9/OCXCt43VuaRTJBJGPkzvUN0C8va0TwKN8=;
 b=dox1Z+3UXDhzioNODzMA8X0XUqbyT+4oYADeRskbfsHvS6kmtMNxSFqON8wegrd8MwW/dh
 N54JA/8/7Q5+JRTgqvcoBfTfzXftZoRJpNJpFaKaWl3O6jFTzAcSbnxooVZ+q7fPGr53nI
 NJIlQfSBA4/DBqR0ubYjzLkUipLJq0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-6WWF4RpJNU-EGxPcYeXekw-1; Mon, 15 Mar 2021 14:02:53 -0400
X-MC-Unique: 6WWF4RpJNU-EGxPcYeXekw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D57D1015C97;
 Mon, 15 Mar 2021 18:02:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBB891C4;
 Mon, 15 Mar 2021 18:02:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 886941800840; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] usb/storage: move usb-bot device to separate source file
Date: Mon, 15 Mar 2021 19:02:37 +0100
Message-Id: <20210315180240.1597240-11-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
References: <20210315180240.1597240-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Message-Id: <20210312090425.772900-3-kraxel@redhat.com>
---
 hw/usb/dev-storage-bot.c | 63 ++++++++++++++++++++++++++++++++++++++++
 hw/usb/dev-storage.c     | 42 ---------------------------
 hw/usb/meson.build       |  1 +
 3 files changed, 64 insertions(+), 42 deletions(-)
 create mode 100644 hw/usb/dev-storage-bot.c

diff --git a/hw/usb/dev-storage-bot.c b/hw/usb/dev-storage-bot.c
new file mode 100644
index 000000000000..6aad026d1133
--- /dev/null
+++ b/hw/usb/dev-storage-bot.c
@@ -0,0 +1,63 @@
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
+#include "hw/usb.h"
+#include "hw/usb/desc.h"
+#include "hw/usb/msd.h"
+
+static const struct SCSIBusInfo usb_msd_scsi_info_bot = {
+    .tcq = false,
+    .max_target = 0,
+    .max_lun = 15,
+
+    .transfer_data = usb_msd_transfer_data,
+    .complete = usb_msd_command_complete,
+    .cancel = usb_msd_request_cancelled,
+    .load_request = usb_msd_load_request,
+};
+
+static void usb_msd_bot_realize(USBDevice *dev, Error **errp)
+{
+    MSDState *s = USB_STORAGE_DEV(dev);
+    DeviceState *d = DEVICE(dev);
+
+    usb_desc_create_serial(dev);
+    usb_desc_init(dev);
+    if (d->hotplugged) {
+        s->dev.auto_attach = 0;
+    }
+
+    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
+                 &usb_msd_scsi_info_bot, NULL);
+    usb_msd_handle_reset(dev);
+}
+
+static void usb_msd_class_bot_initfn(ObjectClass *klass, void *data)
+{
+    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
+
+    uc->realize = usb_msd_bot_realize;
+    uc->attached_settable = true;
+}
+
+static const TypeInfo bot_info = {
+    .name          = "usb-bot",
+    .parent        = TYPE_USB_STORAGE,
+    .class_init    = usb_msd_class_bot_initfn,
+};
+
+static void register_types(void)
+{
+    type_register_static(&bot_info);
+}
+
+type_init(register_types)
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 027e29dda3f5..3e613ecc886b 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -551,17 +551,6 @@ static const struct SCSIBusInfo usb_msd_scsi_info_storage = {
     .load_request = usb_msd_load_request,
 };
 
-static const struct SCSIBusInfo usb_msd_scsi_info_bot = {
-    .tcq = false,
-    .max_target = 0,
-    .max_lun = 15,
-
-    .transfer_data = usb_msd_transfer_data,
-    .complete = usb_msd_command_complete,
-    .cancel = usb_msd_request_cancelled,
-    .load_request = usb_msd_load_request,
-};
-
 static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
 {
     MSDState *s = USB_STORAGE_DEV(dev);
@@ -613,22 +602,6 @@ static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
     s->scsi_dev = scsi_dev;
 }
 
-static void usb_msd_bot_realize(USBDevice *dev, Error **errp)
-{
-    MSDState *s = USB_STORAGE_DEV(dev);
-    DeviceState *d = DEVICE(dev);
-
-    usb_desc_create_serial(dev);
-    usb_desc_init(dev);
-    if (d->hotplugged) {
-        s->dev.auto_attach = 0;
-    }
-
-    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
-                 &usb_msd_scsi_info_bot, NULL);
-    usb_msd_handle_reset(dev);
-}
-
 static const VMStateDescription vmstate_usb_msd = {
     .name = "usb-storage",
     .version_id = 1,
@@ -734,14 +707,6 @@ static void usb_msd_instance_init(Object *obj)
     object_property_set_int(obj, "bootindex", -1, NULL);
 }
 
-static void usb_msd_class_bot_initfn(ObjectClass *klass, void *data)
-{
-    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
-
-    uc->realize = usb_msd_bot_realize;
-    uc->attached_settable = true;
-}
-
 static const TypeInfo msd_info = {
     .name          = "usb-storage",
     .parent        = TYPE_USB_STORAGE,
@@ -749,17 +714,10 @@ static const TypeInfo msd_info = {
     .instance_init = usb_msd_instance_init,
 };
 
-static const TypeInfo bot_info = {
-    .name          = "usb-bot",
-    .parent        = TYPE_USB_STORAGE,
-    .class_init    = usb_msd_class_bot_initfn,
-};
-
 static void usb_msd_register_types(void)
 {
     type_register_static(&usb_storage_dev_type_info);
     type_register_static(&msd_info);
-    type_register_static(&bot_info);
 }
 
 type_init(usb_msd_register_types)
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 6e3159798e93..518cd1fbbbea 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -41,6 +41,7 @@ softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
 softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hid.c'))
 softmmu_ss.add(when: 'CONFIG_USB_TABLET_WACOM', if_true: files('dev-wacom.c'))
 softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage.c'))
+softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage-bot.c'))
 softmmu_ss.add(when: 'CONFIG_USB_STORAGE_UAS', if_true: files('dev-uas.c'))
 softmmu_ss.add(when: 'CONFIG_USB_AUDIO', if_true: files('dev-audio.c'))
 softmmu_ss.add(when: 'CONFIG_USB_SERIAL', if_true: files('dev-serial.c'))
-- 
2.29.2


