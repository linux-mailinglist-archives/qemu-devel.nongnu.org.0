Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7E41C1B9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:38:35 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVW2s-0005Sr-Fg
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0001sd-On
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtS-0005kw-FP
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N4Qbu-1mvXVA1vT4-011S4b; Wed, 29
 Sep 2021 11:28:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] nubus: use bitmap to manage available slots
Date: Wed, 29 Sep 2021 11:28:27 +0200
Message-Id: <20210929092843.2686234-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UuuSvtallTPnWp5RbL6B0Yga0rt7rMFvzHQrIV6tmPmNhcrCAwJ
 oT+HD/f88i5+ekXjgUAI78usBf7zbO9hLBwY5MyoaCEXXtpDVJNrhjS1tAQExYLbjtKiKyk
 ISE7kp+m3WPvgnvnaVTkkB032rLL7L4Os2LOFHikYWOc6PxfIsKsvcxLfL//cX3s5w7awJk
 ELH9ox0KYCrwu9PqXjb3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v6T+02Ltjbw=:j3aTcpstWF6BIVKQ2Sha72
 9bCkrkSL40Y+ctBer2VGdlgwBxSJN4mTKUhkAvte4ZYDFMgOnx+aBvLS99uK2uM9xyRKeaSD2
 QUrhgpLrUvQD0Vd/5Qy0bGqnTcyznf4zAyblYI7v1oHZrEdWNWhmuebhWDFd2CZHtE+rXXDRo
 9rc0NsaAZ+5pTyz7oATIT3gz1WFH+fibMB4+wSL9cu8tvx/N5iT3q1yyrkrLLQpilQ6LF9yRr
 QePG6QoQxGXfKWTgkmrU2OrzpSvDyrti5vegEXNM9G9RZ9eYFpn3hWhb5xhzCp+RT7MmRTi2U
 UcVGDLdMulnaI/iEzMkqGLzFP9AbnmWw69bdcRzDHLyb+LR0uTzY0udZHK/Z7ZxG3hpcwD21Y
 4QAAkYOLX0ZxuU9N0+f1ZdhIwkZm6JcMYJV43mHuAfYMtSUlMOjjIhLtOXFZMaonWrgIN3mNx
 68Bdpjy4mAS2kWIm8//yDcjOqg/rwa19Nh8mKXTWGWhkF8XOyht0arRGGJhO1KXkJr3c+u484
 bOE9tnw5pihOtPaN6caXvJWPRaZNl8v4yKFAPrP8IDi/aNtP/jeCHUKZtPLmk4yedlEhDk4HT
 sI4p3KYqm1rk9xq4ZkO555IM59R+iIIkTKWzx1IHO1t3JOQreUo1QTAJtTC1GcfE7HvtChNWI
 4kX6Fjmf01yaZxUoo8FBagoNxtyzBiOifEVK0IDf09CvYXebPv7NTLlF8+x/VpDewAW8dG6FL
 A1BrrNfRomJIdBrWDLPR5TXegrjIHY5T3JoUBQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Convert nubus_device_realize() to use a bitmap to manage available slots to allow
for future Nubus devices to be plugged into arbitrary slots from the command line
using a new qdev "slot" parameter for nubus devices.

Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on Macintosh machines
as documented in "Designing Cards and Drivers for the Macintosh Family".

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210924073808.1041-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/mac-nubus-bridge.h |  4 ++++
 include/hw/nubus/nubus.h            | 13 ++++++-------
 hw/nubus/mac-nubus-bridge.c         |  4 ++++
 hw/nubus/nubus-bus.c                |  5 +++--
 hw/nubus/nubus-device.c             | 29 ++++++++++++++++++++++++-----
 5 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 36aa098dd4bf..118d67267dd5 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -12,6 +12,10 @@
 #include "hw/nubus/nubus.h"
 #include "qom/object.h"
 
+#define MAC_NUBUS_FIRST_SLOT 0x9
+#define MAC_NUBUS_LAST_SLOT  0xe
+#define MAC_NUBUS_SLOT_NB    (MAC_NUBUS_LAST_SLOT - MAC_NUBUS_FIRST_SLOT + 1)
+
 #define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
 OBJECT_DECLARE_SIMPLE_TYPE(MacNubusState, MAC_NUBUS_BRIDGE)
 
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 89b0976aaa3d..3eea2952d553 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -14,13 +14,12 @@
 #include "qom/object.h"
 
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
-#define NUBUS_SUPER_SLOT_NB   0x9
+#define NUBUS_SUPER_SLOT_NB   0xe
 
 #define NUBUS_SLOT_SIZE       0x01000000
-#define NUBUS_SLOT_NB         0xF
-
-#define NUBUS_FIRST_SLOT      0x9
-#define NUBUS_LAST_SLOT       0xF
+#define NUBUS_FIRST_SLOT      0x0
+#define NUBUS_LAST_SLOT       0xf
+#define NUBUS_SLOT_NB         (NUBUS_LAST_SLOT - NUBUS_FIRST_SLOT + 1)
 
 #define TYPE_NUBUS_DEVICE "nubus-device"
 OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
@@ -36,13 +35,13 @@ struct NubusBus {
     MemoryRegion super_slot_io;
     MemoryRegion slot_io;
 
-    int current_slot;
+    uint16_t slot_available_mask;
 };
 
 struct NubusDevice {
     DeviceState qdev;
 
-    int slot;
+    int32_t slot;
     MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 7c329300b82c..3f075789e9b3 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -18,6 +18,10 @@ static void mac_nubus_bridge_init(Object *obj)
 
     s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
 
+    /* Macintosh only has slots 0x9 to 0xe available */
+    s->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
+                                                  MAC_NUBUS_SLOT_NB);
+
     sysbus_init_mmio(sbd, &s->bus->super_slot_io);
     sysbus_init_mmio(sbd, &s->bus->slot_io);
 }
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index f4410803fffe..3cd75348646b 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -86,13 +86,14 @@ static void nubus_init(Object *obj)
 
     memory_region_init_io(&nubus->super_slot_io, obj, &nubus_super_slot_ops,
                           nubus, "nubus-super-slots",
-                          NUBUS_SUPER_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
+                          (NUBUS_SUPER_SLOT_NB + 1) * NUBUS_SUPER_SLOT_SIZE);
 
     memory_region_init_io(&nubus->slot_io, obj, &nubus_slot_ops,
                           nubus, "nubus-slots",
                           NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
 
-    nubus->current_slot = NUBUS_FIRST_SLOT;
+    nubus->slot_available_mask = MAKE_64BIT_MASK(NUBUS_FIRST_SLOT,
+                                                 NUBUS_SLOT_NB);
 }
 
 static void nubus_class_init(ObjectClass *oc, void *data)
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 4e23df1280f9..2e96d6b4fc39 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -161,13 +161,26 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     char *name;
     hwaddr slot_offset;
 
-    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
-            nubus->current_slot > NUBUS_LAST_SLOT) {
-        error_setg(errp, "Cannot register nubus card, not enough slots");
-        return;
+    if (nd->slot == -1) {
+        /* No slot specified, find first available free slot */
+        int s = ctz32(nubus->slot_available_mask);
+        if (s != 32) {
+            nd->slot = s;
+        } else {
+            error_setg(errp, "Cannot register nubus card, no free slot "
+                             "available");
+            return;
+        }
+    } else {
+        /* Slot specified, make sure the slot is available */
+        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
+            error_setg(errp, "Cannot register nubus card, slot %d is "
+                             "unavailable or already occupied", nd->slot);
+            return;
+        }
     }
 
-    nd->slot = nubus->current_slot++;
+    nubus->slot_available_mask &= ~BIT(nd->slot);
 
     /* Super */
     slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
@@ -191,12 +204,18 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     nubus_register_format_block(nd);
 }
 
+static Property nubus_device_properties[] = {
+    DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void nubus_device_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = nubus_device_realize;
     dc->bus_type = TYPE_NUBUS_BUS;
+    device_class_set_props(dc, nubus_device_properties);
 }
 
 static const TypeInfo nubus_device_type_info = {
-- 
2.31.1


