Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A6C2E7528
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 00:14:48 +0100 (CET)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuOCV-0005aS-9q
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 18:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuO7u-0008Sy-Ax
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 18:10:02 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:48958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuO7n-0006bi-8l
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 18:10:01 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2AE667470EE;
 Wed, 30 Dec 2020 00:09:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9D4837470E6; Wed, 30 Dec 2020 00:09:51 +0100 (CET)
Message-Id: <bcbf0b8fe18a7db051ad852247901e7b5412c434.1609282253.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609282253.git.balaton@eik.bme.hu>
References: <cover.1609282253.git.balaton@eik.bme.hu>
Subject: [PATCH 3/7] vt82c686: Move superio memory region to SuperIOConfig
 struct
Date: Tue, 29 Dec 2020 23:50:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

The superio memory region holds the io space index/data registers used
to access the superio config registers that are implemented in struct
SuperIOConfig. To keep these related things together move the memory
region to SuperIOConfig and rename it accordingly.
Also remove the unused data member of SuperIOConfig which is not
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


