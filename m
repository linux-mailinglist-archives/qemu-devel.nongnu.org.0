Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4712E7524
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 00:12:28 +0100 (CET)
Received: from localhost ([::1]:41234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuOAE-0001z1-I2
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 18:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuO7s-0008SL-RP
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 18:10:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:48957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuO7n-0006bh-9P
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 18:10:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3327E7470F2;
 Wed, 30 Dec 2020 00:09:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 974527470E0; Wed, 30 Dec 2020 00:09:51 +0100 (CET)
Message-Id: <93f3b97f84dbc04f9bb0157b558d728ff4f1a526.1609282253.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609282253.git.balaton@eik.bme.hu>
References: <cover.1609282253.git.balaton@eik.bme.hu>
Subject: [PATCH 2/7] vt82c686: Rename superio config related parts
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

Use less confusing naming for superio config register handling related
parts that makes it clearer what belongs to this part.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c | 48 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2633cfe7dc..a6f5a0843d 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -27,7 +27,7 @@
 #include "trace.h"
 
 typedef struct SuperIOConfig {
-    uint8_t config[0x100];
+    uint8_t regs[0x100];
     uint8_t index;
     uint8_t data;
 } SuperIOConfig;
@@ -35,23 +35,23 @@ typedef struct SuperIOConfig {
 struct VT82C686BISAState {
     PCIDevice dev;
     MemoryRegion superio;
-    SuperIOConfig superio_conf;
+    SuperIOConfig superio_cfg;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
-static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
-                                  unsigned size)
+static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
+                              unsigned size)
 {
-    SuperIOConfig *superio_conf = opaque;
+    SuperIOConfig *sc = opaque;
 
     if (addr == 0x3f0) { /* config index register */
-        superio_conf->index = data & 0xff;
+        sc->index = data & 0xff;
     } else {
         bool can_write = true;
         /* 0x3f1, config data register */
-        trace_via_superio_write(superio_conf->index, data & 0xff);
-        switch (superio_conf->index) {
+        trace_via_superio_write(sc->index, data & 0xff);
+        switch (sc->index) {
         case 0x00 ... 0xdf:
         case 0xe4:
         case 0xe5:
@@ -69,23 +69,23 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
 
         }
         if (can_write) {
-            superio_conf->config[superio_conf->index] = data & 0xff;
+            sc->regs[sc->index] = data & 0xff;
         }
     }
 }
 
-static uint64_t superio_ioport_readb(void *opaque, hwaddr addr, unsigned size)
+static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
 {
-    SuperIOConfig *superio_conf = opaque;
-    uint8_t val = superio_conf->config[superio_conf->index];
+    SuperIOConfig *sc = opaque;
+    uint8_t val = sc->regs[sc->index];
 
-    trace_via_superio_read(superio_conf->index, val);
+    trace_via_superio_read(sc->index, val);
     return val;
 }
 
-static const MemoryRegionOps superio_ops = {
-    .read = superio_ioport_readb,
-    .write = superio_ioport_writeb,
+static const MemoryRegionOps superio_cfg_ops = {
+    .read = superio_cfg_read,
+    .write = superio_cfg_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -112,12 +112,12 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     pci_conf[0x5f] = 0x04;
     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
 
-    s->superio_conf.config[0xe0] = 0x3c;
-    s->superio_conf.config[0xe2] = 0x03;
-    s->superio_conf.config[0xe3] = 0xfc;
-    s->superio_conf.config[0xe6] = 0xde;
-    s->superio_conf.config[0xe7] = 0xfe;
-    s->superio_conf.config[0xe8] = 0xbe;
+    s->superio_cfg.regs[0xe0] = 0x3c; /* Device ID */
+    s->superio_cfg.regs[0xe2] = 0x03; /* Function select */
+    s->superio_cfg.regs[0xe3] = 0xfc; /* Floppy ctrl base addr */
+    s->superio_cfg.regs[0xe6] = 0xde; /* Parallel port base addr */
+    s->superio_cfg.regs[0xe7] = 0xfe; /* Serial port 1 base addr */
+    s->superio_cfg.regs[0xe8] = 0xbe; /* Serial port 2 base addr */
 }
 
 /* write config pci function0 registers. PCI-ISA bridge */
@@ -311,8 +311,8 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
         }
     }
 
-    memory_region_init_io(&s->superio, OBJECT(d), &superio_ops,
-                          &s->superio_conf, "superio", 2);
+    memory_region_init_io(&s->superio, OBJECT(d), &superio_cfg_ops,
+                          &s->superio_cfg, "superio", 2);
     memory_region_set_enabled(&s->superio, false);
     /*
      * The floppy also uses 0x3f0 and 0x3f1.
-- 
2.21.3


