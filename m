Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD1415B06
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:34:04 +0200 (CEST)
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTL7D-0002Fv-HU
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKoO-0003I8-W3
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:14:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48698
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKoM-00084x-Ja
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:14:36 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKo2-0003vl-Jv; Thu, 23 Sep 2021 10:14:18 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 23 Sep 2021 10:13:04 +0100
Message-Id: <20210923091308.13832-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v5 16/20] nubus-bridge: embed the NubusBus object directly
 within nubus-bridge
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

Since nubus-bridge is a container for NubusBus then it should be embedded
directly within the bridge device using qbus_create_inplace().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/q800.c              | 2 +-
 hw/nubus/mac-nubus-bridge.c | 9 +++++----
 hw/nubus/nubus-bridge.c     | 3 ++-
 include/hw/nubus/nubus.h    | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 9bdea1a362..074acf4fdc 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -398,7 +398,7 @@ static void q800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
 
-    nubus = NUBUS_BRIDGE(dev)->bus;
+    nubus = &NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index db8640eed2..a0da5a8b2f 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -18,19 +18,20 @@ static void mac_nubus_bridge_init(Object *obj)
     MacNubusBridge *s = MAC_NUBUS_BRIDGE(obj);
     NubusBridge *nb = NUBUS_BRIDGE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    NubusBus *bus = &nb->bus;
 
     /* Macintosh only has slots 0x9 to 0xe available */
-    nb->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
-                                                   MAC_NUBUS_SLOT_NB);
+    bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
+                                               MAC_NUBUS_SLOT_NB);
 
     /* Aliases for slots 0x9 to 0xe */
     memory_region_init_alias(&s->super_slot_alias, obj, "super-slot-alias",
-                             &nb->bus->nubus_mr,
+                             &bus->nubus_mr,
                              MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE,
                              MAC_NUBUS_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
 
     memory_region_init_alias(&s->slot_alias, obj, "slot-alias",
-                             &nb->bus->nubus_mr,
+                             &bus->nubus_mr,
                              NUBUS_SLOT_BASE +
                              MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE,
                              MAC_NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index 3b68d4435c..1adda7f5a6 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -16,8 +16,9 @@
 static void nubus_bridge_init(Object *obj)
 {
     NubusBridge *s = NUBUS_BRIDGE(obj);
+    NubusBus *bus = &s->bus;
 
-    s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
+    qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
 }
 
 static void nubus_bridge_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 607cdef968..3620247be2 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -63,7 +63,7 @@ struct NubusDevice {
 struct NubusBridge {
     SysBusDevice parent_obj;
 
-    NubusBus *bus;
+    NubusBus bus;
 };
 
 #endif
-- 
2.20.1


