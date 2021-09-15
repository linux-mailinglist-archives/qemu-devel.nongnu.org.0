Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B226340C399
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:28:59 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQS9y-0001eg-Ob
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsv-0003Y3-Ly
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39064
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsu-0002zb-0J
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:21 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsm-00059W-63; Wed, 15 Sep 2021 11:11:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 15 Sep 2021 11:10:17 +0100
Message-Id: <20210915101026.25174-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 11/20] nubus-device: add romfile property for loading
 declaration ROMs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 hw/nubus/nubus-device.c  | 43 +++++++++++++++++++++++++++++++++++++++-
 include/hw/nubus/nubus.h |  6 ++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 9c1992ceb0..dbb3bb7efd 100644
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
     slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
@@ -38,10 +43,46 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
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
+                               &error_fatal);
+        ret = load_image_mr(path, &nd->decl_rom);
+        g_free(path);
+        if (ret < 0) {
+            warn_report("nubus-device: could not load prom '%s'", nd->romfile);
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
index 87a97516c7..0c9f50c32e 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -12,6 +12,7 @@
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
+#include "qemu/units.h"
 
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
 #define NUBUS_SUPER_SLOT_NB   0x9
@@ -39,12 +40,17 @@ struct NubusBus {
     uint32_t slot_available_mask;
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


