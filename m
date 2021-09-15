Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E0F40C385
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:17:08 +0200 (CEST)
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQRyV-0002ij-PU
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRtR-000499-E9
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39094
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRtO-0003L4-AA
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:53 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRt6-00059W-Jx; Wed, 15 Sep 2021 11:11:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 15 Sep 2021 11:10:22 +0100
Message-Id: <20210915101026.25174-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 16/20] nubus-bridge: embed the NubusBus object directly
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
 hw/nubus/mac-nubus-bridge.c | 7 ++++---
 hw/nubus/nubus-bridge.c     | 3 ++-
 include/hw/nubus/nubus.h    | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 46befe0898..e34df1a829 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -397,7 +397,7 @@ static void q800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                                             9 * NUBUS_SLOT_SIZE);
 
-    nubus = NUBUS_BRIDGE(dev)->bus;
+    nubus = &NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
 
diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 4854e7e546..f764b2f562 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -18,18 +18,19 @@ static void mac_nubus_bridge_init(Object *obj)
     MacNubusBridge *s = MAC_NUBUS_BRIDGE(obj);
     NubusBridge *nb = NUBUS_BRIDGE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    NubusBus *bus = &nb->bus;
 
     /* Macintosh only has slots 0x9 to 0xe available */
-    nb->bus->slot_available_mask = MAKE_64BIT_MASK(9, 6);
+    bus->slot_available_mask = MAKE_64BIT_MASK(9, 6);
 
     /* Aliases for slots 0x9 to 0xe */
     memory_region_init_alias(&s->super_slot_alias, obj, "super-slot-alias",
-                             &nb->bus->nubus_mr,
+                             &bus->nubus_mr,
                              9 * NUBUS_SUPER_SLOT_SIZE,
                              6 * NUBUS_SUPER_SLOT_SIZE);
 
     memory_region_init_alias(&s->slot_alias, obj, "slot-alias",
-                             &nb->bus->nubus_mr,
+                             &bus->nubus_mr,
                              NUBUS_SLOT_BASE + 9 * NUBUS_SLOT_SIZE,
                              6 * NUBUS_SLOT_SIZE);
 
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
index 2c83e7f7b8..cf9a585a91 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -62,7 +62,7 @@ struct NubusDevice {
 struct NubusBridge {
     SysBusDevice parent_obj;
 
-    NubusBus *bus;
+    NubusBus bus;
 };
 
 #endif
-- 
2.20.1


