Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D682E86FF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 12:20:56 +0100 (CET)
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvexr-00012s-Te
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 06:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqq-0000l2-QG
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:40 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:56504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kveqo-00077P-TM
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 06:13:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1323B747601;
 Sat,  2 Jan 2021 12:13:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 091FF74760B; Sat,  2 Jan 2021 12:13:30 +0100 (CET)
Message-Id: <69655b23df2ecebbf0aff29726f4b4746f5b74de.1609584216.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
Subject: [PATCH 11/24] vt82c686: Use shorter name for local variable holding
 object state
Date: Sat, 02 Jan 2021 11:43:35 +0100
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
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Rename local variable holding object state for readability and
consistency.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 02d6759c00..2633cfe7dc 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -95,8 +95,8 @@ static const MemoryRegionOps superio_ops = {
 
 static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    VT82C686BISAState *vt82c = VT82C686B_ISA(dev);
-    uint8_t *pci_conf = vt82c->dev.config;
+    VT82C686BISAState *s = VT82C686B_ISA(dev);
+    uint8_t *pci_conf = s->dev.config;
 
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
@@ -112,24 +112,24 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     pci_conf[0x5f] = 0x04;
     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
 
-    vt82c->superio_conf.config[0xe0] = 0x3c;
-    vt82c->superio_conf.config[0xe2] = 0x03;
-    vt82c->superio_conf.config[0xe3] = 0xfc;
-    vt82c->superio_conf.config[0xe6] = 0xde;
-    vt82c->superio_conf.config[0xe7] = 0xfe;
-    vt82c->superio_conf.config[0xe8] = 0xbe;
+    s->superio_conf.config[0xe0] = 0x3c;
+    s->superio_conf.config[0xe2] = 0x03;
+    s->superio_conf.config[0xe3] = 0xfc;
+    s->superio_conf.config[0xe6] = 0xde;
+    s->superio_conf.config[0xe7] = 0xfe;
+    s->superio_conf.config[0xe8] = 0xbe;
 }
 
 /* write config pci function0 registers. PCI-ISA bridge */
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
-    VT82C686BISAState *vt686 = VT82C686B_ISA(d);
+    VT82C686BISAState *s = VT82C686B_ISA(d);
 
     trace_via_isa_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
     if (addr == 0x85) {  /* enable or disable super IO configure */
-        memory_region_set_enabled(&vt686->superio, val & 0x2);
+        memory_region_set_enabled(&s->superio, val & 0x2);
     }
 }
 
@@ -289,7 +289,7 @@ static const VMStateDescription vmstate_via = {
 /* init the PCI-to-ISA bridge */
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BISAState *vt82c = VT82C686B_ISA(d);
+    VT82C686BISAState *s = VT82C686B_ISA(d);
     uint8_t *pci_conf;
     ISABus *isa_bus;
     uint8_t *wmask;
@@ -311,15 +311,15 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
         }
     }
 
-    memory_region_init_io(&vt82c->superio, OBJECT(d), &superio_ops,
-                          &vt82c->superio_conf, "superio", 2);
-    memory_region_set_enabled(&vt82c->superio, false);
+    memory_region_init_io(&s->superio, OBJECT(d), &superio_ops,
+                          &s->superio_conf, "superio", 2);
+    memory_region_set_enabled(&s->superio, false);
     /*
      * The floppy also uses 0x3f0 and 0x3f1.
      * But we do not emulate a floppy, so just set it here.
      */
     memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
-                                &vt82c->superio);
+                                &s->superio);
 }
 
 static void via_class_init(ObjectClass *klass, void *data)
-- 
2.21.3


