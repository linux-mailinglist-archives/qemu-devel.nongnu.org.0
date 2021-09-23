Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9B415B04
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:33:38 +0200 (CEST)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTL6n-0000pP-V0
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKoB-00035l-NM
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:14:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48694
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKo8-000824-Uq
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:14:22 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKny-0003vl-Cc; Thu, 23 Sep 2021 10:14:14 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 23 Sep 2021 10:13:03 +0100
Message-Id: <20210923091308.13832-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v5 15/20] nubus: move NubusBus from mac-nubus-bridge to
 nubus-bridge
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

Now that Nubus has its own address space rather than mapping directly into the
system bus, move the Nubus reference from MacNubusBridge to NubusBridge.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/q800.c                      |  2 +-
 hw/nubus/mac-nubus-bridge.c         | 11 +++++------
 hw/nubus/nubus-bridge.c             |  9 +++++++++
 include/hw/nubus/mac-nubus-bridge.h |  1 -
 include/hw/nubus/nubus.h            |  2 ++
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index a07912b87c..9bdea1a362 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -398,7 +398,7 @@ static void q800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
 
-    nubus = MAC_NUBUS_BRIDGE(dev)->bus;
+    nubus = NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index e241c581b5..db8640eed2 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -16,22 +16,21 @@
 static void mac_nubus_bridge_init(Object *obj)
 {
     MacNubusBridge *s = MAC_NUBUS_BRIDGE(obj);
+    NubusBridge *nb = NUBUS_BRIDGE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
-
     /* Macintosh only has slots 0x9 to 0xe available */
-    s->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
-                                                  MAC_NUBUS_SLOT_NB);
+    nb->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
+                                                   MAC_NUBUS_SLOT_NB);
 
     /* Aliases for slots 0x9 to 0xe */
     memory_region_init_alias(&s->super_slot_alias, obj, "super-slot-alias",
-                             &s->bus->nubus_mr,
+                             &nb->bus->nubus_mr,
                              MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE,
                              MAC_NUBUS_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
 
     memory_region_init_alias(&s->slot_alias, obj, "slot-alias",
-                             &s->bus->nubus_mr,
+                             &nb->bus->nubus_mr,
                              NUBUS_SLOT_BASE +
                              MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE,
                              MAC_NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index 95662568c5..3b68d4435c 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -12,6 +12,14 @@
 #include "hw/sysbus.h"
 #include "hw/nubus/nubus.h"
 
+
+static void nubus_bridge_init(Object *obj)
+{
+    NubusBridge *s = NUBUS_BRIDGE(obj);
+
+    s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
+}
+
 static void nubus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -22,6 +30,7 @@ static void nubus_bridge_class_init(ObjectClass *klass, void *data)
 static const TypeInfo nubus_bridge_info = {
     .name          = TYPE_NUBUS_BRIDGE,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = nubus_bridge_init,
     .instance_size = sizeof(NubusBridge),
     .class_init    = nubus_bridge_class_init,
 };
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index b595e1b7ef..70ab50ab2d 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -22,7 +22,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(MacNubusBridge, MAC_NUBUS_BRIDGE)
 struct MacNubusBridge {
     NubusBridge parent_obj;
 
-    NubusBus *bus;
     MemoryRegion super_slot_alias;
     MemoryRegion slot_alias;
 };
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 43bde7dd69..607cdef968 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -62,6 +62,8 @@ struct NubusDevice {
 
 struct NubusBridge {
     SysBusDevice parent_obj;
+
+    NubusBus *bus;
 };
 
 #endif
-- 
2.20.1


