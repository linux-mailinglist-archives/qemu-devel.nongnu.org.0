Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8272E2F90
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 02:27:51 +0100 (CET)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktKqc-0004y2-NZ
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 20:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkV-0008RN-Sg
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:31 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkR-0001DW-UR
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9079A7470F0;
 Sun, 27 Dec 2020 02:21:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E56EE7470F2; Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Message-Id: <d404014f90d8ba9d09d4c000ca599dea86992864.1609031406.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609031406.git.balaton@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
Subject: [PATCH 09/12] vt82c686: Convert debug printf to trace points
Date: Sun, 27 Dec 2020 02:10:06 +0100
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/trace-events |  6 ++++++
 hw/isa/vt82c686.c   | 51 +++++++++++++--------------------------------
 2 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index 3544c6213c..d267d3e652 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -13,3 +13,9 @@ pc87312_io_write(uint32_t addr, uint32_t val) "write addr=0x%x val=0x%x"
 # apm.c
 apm_io_read(uint8_t addr, uint8_t val) "read addr=0x%x val=0x%02x"
 apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
+
+# vt82c686.c
+via_isa_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
+via_pm_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
+via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
+via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b138838400..789459bcae 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -28,14 +28,7 @@
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
-
-/* #define DEBUG_VT82C686B */
-
-#ifdef DEBUG_VT82C686B
-#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA_ARGS__)
-#else
-#define DPRINTF(fmt, ...)
-#endif
+#include "trace.h"
 
 typedef struct SuperIOConfig {
     uint8_t config[0x100];
@@ -56,16 +49,17 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
 {
     SuperIOConfig *superio_conf = opaque;
 
-    DPRINTF("superio_ioport_writeb  address 0x%x  val 0x%x\n", addr, data);
-    if (addr == 0x3f0) {
+    if (addr == 0x3f0) { /* config index register */
         superio_conf->index = data & 0xff;
     } else {
         bool can_write = true;
-        /* 0x3f1 */
+        /* 0x3f1, config data register */
+        trace_via_superio_write(superio_conf->index, data & 0xff);
         switch (superio_conf->index) {
         case 0x00 ... 0xdf:
         case 0xe4:
         case 0xe5:
+        case 0xe6 ... 0xe8: /* Should set base port of parallel and serial */
         case 0xe9 ... 0xed:
         case 0xf3:
         case 0xf5:
@@ -74,18 +68,6 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
         case 0xfd ... 0xff:
             can_write = false;
             break;
-        case 0xe7:
-            if ((data & 0xff) != 0xfe) {
-                DPRINTF("change uart 1 base. unsupported yet\n");
-                can_write = false;
-            }
-            break;
-        case 0xe8:
-            if ((data & 0xff) != 0xbe) {
-                DPRINTF("change uart 2 base. unsupported yet\n");
-                can_write = false;
-            }
-            break;
         default:
             break;
 
@@ -99,9 +81,10 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
 static uint64_t superio_ioport_readb(void *opaque, hwaddr addr, unsigned size)
 {
     SuperIOConfig *superio_conf = opaque;
+    uint8_t val = superio_conf->config[superio_conf->index];
 
-    DPRINTF("superio_ioport_readb  address 0x%x\n", addr);
-    return superio_conf->config[superio_conf->index];
+    trace_via_superio_read(superio_conf->index, val);
+    return val;
 }
 
 static const MemoryRegionOps superio_ops = {
@@ -142,16 +125,14 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 }
 
 /* write config pci function0 registers. PCI-ISA bridge */
-static void vt82c686b_write_config(PCIDevice *d, uint32_t address,
+static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
     VT82C686BState *vt686 = VT82C686B(d);
 
-    DPRINTF("vt82c686b_write_config  address 0x%x  val 0x%x len 0x%x\n",
-           address, val, len);
-
-    pci_default_write_config(d, address, val, len);
-    if (address == 0x85) {  /* enable or disable super IO configure */
+    trace_via_isa_write(addr, val, len);
+    pci_default_write_config(d, addr, val, len);
+    if (addr == 0x85) {  /* enable or disable super IO configure */
         memory_region_set_enabled(&vt686->superio, val & 0x2);
     }
 }
@@ -204,12 +185,10 @@ static void pm_io_space_update(VT686PMState *s)
     memory_region_transaction_commit();
 }
 
-static void pm_write_config(PCIDevice *d,
-                            uint32_t address, uint32_t val, int len)
+static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
 {
-    DPRINTF("pm_write_config  address 0x%x  val 0x%x len 0x%x\n",
-           address, val, len);
-    pci_default_write_config(d, address, val, len);
+    trace_via_pm_write(addr, val, len);
+    pci_default_write_config(d, addr, val, len);
 }
 
 static int vmstate_acpi_post_load(void *opaque, int version_id)
-- 
2.21.3


