Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92EB416D3C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:57:50 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTg5d-0003Rh-TB
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfnY-0002f7-SJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:39:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50256
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfnT-0004Df-Uz
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:39:08 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfnJ-0002uw-Ff; Fri, 24 Sep 2021 08:38:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Fri, 24 Sep 2021 08:37:59 +0100
Message-Id: <20210924073808.1041-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
References: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v6 11/20] nubus-device: add romfile property for loading
 declaration ROMs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The declaration ROM is located at the top-most address of the standard slot
space.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/nubus-device.c  | 44 +++++++++++++++++++++++++++++++++++++++-
 include/hw/nubus/nubus.h |  6 ++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index d4932d64a2..280f40e88a 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -9,16 +9,21 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/datadir.h"
+#include "hw/loader.h"
 #include "hw/nubus/nubus.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 
 
 static void nubus_device_realize(DeviceState *dev, Error **errp)
 {
     NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
     NubusDevice *nd = NUBUS_DEVICE(dev);
-    char *name;
+    char *name, *path;
     hwaddr slot_offset;
+    int64_t size;
+    int ret;
 
     /* Super */
     slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
@@ -38,10 +43,47 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&nubus->slot_io, slot_offset,
                                 &nd->slot_mem);
     g_free(name);
+
+    /* Declaration ROM */
+    if (nd->romfile != NULL) {
+        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, nd->romfile);
+        if (path == NULL) {
+            path = g_strdup(nd->romfile);
+        }
+
+        size = get_image_size(path);
+        if (size < 0) {
+            error_setg(errp, "failed to find romfile \"%s\"", nd->romfile);
+            g_free(path);
+            return;
+        } else if (size == 0) {
+            error_setg(errp, "romfile \"%s\" is empty", nd->romfile);
+            g_free(path);
+            return;
+        } else if (size > NUBUS_DECL_ROM_MAX_SIZE) {
+            error_setg(errp, "romfile \"%s\" too large (maximum size 128K)",
+                       nd->romfile);
+            g_free(path);
+            return;
+        }
+
+        name = g_strdup_printf("nubus-slot-%x-declaration-rom", nd->slot);
+        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size,
+                               &error_abort);
+        ret = load_image_mr(path, &nd->decl_rom);
+        g_free(path);
+        if (ret < 0) {
+            error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
+            return;
+        }
+        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - size,
+                                    &nd->decl_rom);
+    }
 }
 
 static Property nubus_device_properties[] = {
     DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
+    DEFINE_PROP_STRING("romfile", NubusDevice, romfile),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 187ecc00a5..343be95841 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -12,6 +12,7 @@
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
+#include "qemu/units.h"
 
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
 #define NUBUS_SUPER_SLOT_NB   0xe
@@ -38,12 +39,17 @@ struct NubusBus {
     uint16_t slot_available_mask;
 };
 
+#define NUBUS_DECL_ROM_MAX_SIZE    (128 * KiB)
+
 struct NubusDevice {
     DeviceState qdev;
 
     int32_t slot;
     MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
+
+    char *romfile;
+    MemoryRegion decl_rom;
 };
 
 #endif
-- 
2.20.1


