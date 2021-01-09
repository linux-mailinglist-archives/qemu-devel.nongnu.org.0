Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646B52F0373
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 21:33:10 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyKv7-0001rs-0I
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 15:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKsB-0008O9-KO
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:09 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKs5-00078Q-Od
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:07 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D6DD2747611;
 Sat,  9 Jan 2021 21:29:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4CE3F7470FC; Sat,  9 Jan 2021 21:29:57 +0100 (CET)
Message-Id: <dc3c4e7632716ca73c10506bd02ee93b39c28705.1610223397.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1610223396.git.balaton@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 01/13] vt82c686: Move superio memory region to
 SuperIOConfig struct
Date: Sat, 09 Jan 2021 21:16:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The superio memory region holds the io space index/data registers used
to access the superio config registers that are implemented in struct
SuperIOConfig. To keep these related things together move the memory
region to SuperIOConfig and rename it accordingly.
Also remove the unused "data" member of SuperIOConfig which is not
needed as we store actual data values in the regs array.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index a6f5a0843d..30fe02f4c6 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -29,12 +29,11 @@
 typedef struct SuperIOConfig {
     uint8_t regs[0x100];
     uint8_t index;
-    uint8_t data;
+    MemoryRegion io;
 } SuperIOConfig;
 
 struct VT82C686BISAState {
     PCIDevice dev;
-    MemoryRegion superio;
     SuperIOConfig superio_cfg;
 };
 
@@ -128,8 +127,9 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
 
     trace_via_isa_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
-    if (addr == 0x85) {  /* enable or disable super IO configure */
-        memory_region_set_enabled(&s->superio, val & 0x2);
+    if (addr == 0x85) {
+        /* BIT(1): enable or disable superio config io ports */
+        memory_region_set_enabled(&s->superio_cfg.io, val & BIT(1));
     }
 }
 
@@ -311,15 +311,15 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
         }
     }
 
-    memory_region_init_io(&s->superio, OBJECT(d), &superio_cfg_ops,
-                          &s->superio_cfg, "superio", 2);
-    memory_region_set_enabled(&s->superio, false);
+    memory_region_init_io(&s->superio_cfg.io, OBJECT(d), &superio_cfg_ops,
+                          &s->superio_cfg, "superio_cfg", 2);
+    memory_region_set_enabled(&s->superio_cfg.io, false);
     /*
      * The floppy also uses 0x3f0 and 0x3f1.
      * But we do not emulate a floppy, so just set it here.
      */
     memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
-                                &s->superio);
+                                &s->superio_cfg.io);
 }
 
 static void via_class_init(ObjectClass *klass, void *data)
-- 
2.21.3


