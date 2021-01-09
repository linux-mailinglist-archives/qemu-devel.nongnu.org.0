Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DFF2F0380
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 21:37:40 +0100 (CET)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyKzT-0007qK-SG
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 15:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKsL-0008Ra-CY
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:18 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKs5-00078S-Of
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:16 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EC984747637;
 Sat,  9 Jan 2021 21:29:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 534697475FE; Sat,  9 Jan 2021 21:29:57 +0100 (CET)
Message-Id: <9f942989dba46fc1c23b881f6cb135948f818c2f.1610223397.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1610223396.git.balaton@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 02/13] vt82c686: Reorganise code
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Move lines around so that object definitions become consecutive and
not scattered around. This brings functions belonging to an object
together so it's clearer what is defined and what parts belong to
which object.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 279 +++++++++++++++++++++++-----------------------
 1 file changed, 140 insertions(+), 139 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 30fe02f4c6..fe8961b057 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -26,112 +26,7 @@
 #include "exec/address-spaces.h"
 #include "trace.h"
 
-typedef struct SuperIOConfig {
-    uint8_t regs[0x100];
-    uint8_t index;
-    MemoryRegion io;
-} SuperIOConfig;
-
-struct VT82C686BISAState {
-    PCIDevice dev;
-    SuperIOConfig superio_cfg;
-};
-
-OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
-
-static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
-                              unsigned size)
-{
-    SuperIOConfig *sc = opaque;
-
-    if (addr == 0x3f0) { /* config index register */
-        sc->index = data & 0xff;
-    } else {
-        bool can_write = true;
-        /* 0x3f1, config data register */
-        trace_via_superio_write(sc->index, data & 0xff);
-        switch (sc->index) {
-        case 0x00 ... 0xdf:
-        case 0xe4:
-        case 0xe5:
-        case 0xe9 ... 0xed:
-        case 0xf3:
-        case 0xf5:
-        case 0xf7:
-        case 0xf9 ... 0xfb:
-        case 0xfd ... 0xff:
-            can_write = false;
-            break;
-        /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
-        default:
-            break;
-
-        }
-        if (can_write) {
-            sc->regs[sc->index] = data & 0xff;
-        }
-    }
-}
-
-static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
-{
-    SuperIOConfig *sc = opaque;
-    uint8_t val = sc->regs[sc->index];
-
-    trace_via_superio_read(sc->index, val);
-    return val;
-}
-
-static const MemoryRegionOps superio_cfg_ops = {
-    .read = superio_cfg_read,
-    .write = superio_cfg_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 1,
-        .max_access_size = 1,
-    },
-};
-
-static void vt82c686b_isa_reset(DeviceState *dev)
-{
-    VT82C686BISAState *s = VT82C686B_ISA(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
-                 PCI_COMMAND_MASTER | PCI_COMMAND_SPECIAL);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
-
-    pci_conf[0x48] = 0x01; /* Miscellaneous Control 3 */
-    pci_conf[0x4a] = 0x04; /* IDE interrupt Routing */
-    pci_conf[0x4f] = 0x03; /* DMA/Master Mem Access Control 3 */
-    pci_conf[0x50] = 0x2d; /* PnP DMA Request Control */
-    pci_conf[0x59] = 0x04;
-    pci_conf[0x5a] = 0x04; /* KBC/RTC Control*/
-    pci_conf[0x5f] = 0x04;
-    pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
-
-    s->superio_cfg.regs[0xe0] = 0x3c; /* Device ID */
-    s->superio_cfg.regs[0xe2] = 0x03; /* Function select */
-    s->superio_cfg.regs[0xe3] = 0xfc; /* Floppy ctrl base addr */
-    s->superio_cfg.regs[0xe6] = 0xde; /* Parallel port base addr */
-    s->superio_cfg.regs[0xe7] = 0xfe; /* Serial port 1 base addr */
-    s->superio_cfg.regs[0xe8] = 0xbe; /* Serial port 2 base addr */
-}
-
-/* write config pci function0 registers. PCI-ISA bridge */
-static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
-                                   uint32_t val, int len)
-{
-    VT82C686BISAState *s = VT82C686B_ISA(d);
-
-    trace_via_isa_write(addr, val, len);
-    pci_default_write_config(d, addr, val, len);
-    if (addr == 0x85) {
-        /* BIT(1): enable or disable superio config io ports */
-        memory_region_set_enabled(&s->superio_cfg.io, val & BIT(1));
-    }
-}
+OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
 
 struct VT686PMState {
     PCIDevice dev;
@@ -142,30 +37,6 @@ struct VT686PMState {
     uint32_t smb_io_base;
 };
 
-OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
-
-static void pm_update_sci(VT686PMState *s)
-{
-    int sci_level, pmsts;
-
-    pmsts = acpi_pm1_evt_get_sts(&s->ar);
-    sci_level = (((pmsts & s->ar.pm1.evt.en) &
-                  (ACPI_BITMASK_RT_CLOCK_ENABLE |
-                   ACPI_BITMASK_POWER_BUTTON_ENABLE |
-                   ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
-                   ACPI_BITMASK_TIMER_ENABLE)) != 0);
-    pci_set_irq(&s->dev, sci_level);
-    /* schedule a timer interruption if needed */
-    acpi_pm_tmr_update(&s->ar, (s->ar.pm1.evt.en & ACPI_BITMASK_TIMER_ENABLE) &&
-                       !(pmsts & ACPI_BITMASK_TIMER_STATUS));
-}
-
-static void pm_tmr_timer(ACPIREGS *ar)
-{
-    VT686PMState *s = container_of(ar, VT686PMState, ar);
-    pm_update_sci(s);
-}
-
 static void pm_io_space_update(VT686PMState *s)
 {
     uint32_t pm_io_base;
@@ -179,12 +50,6 @@ static void pm_io_space_update(VT686PMState *s)
     memory_region_transaction_commit();
 }
 
-static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
-{
-    trace_via_pm_write(addr, val, len);
-    pci_default_write_config(d, addr, val, len);
-}
-
 static int vmstate_acpi_post_load(void *opaque, int version_id)
 {
     VT686PMState *s = opaque;
@@ -210,7 +75,34 @@ static const VMStateDescription vmstate_acpi = {
     }
 };
 
-/* vt82c686 pm init */
+static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
+{
+    trace_via_pm_write(addr, val, len);
+    pci_default_write_config(d, addr, val, len);
+}
+
+static void pm_update_sci(VT686PMState *s)
+{
+    int sci_level, pmsts;
+
+    pmsts = acpi_pm1_evt_get_sts(&s->ar);
+    sci_level = (((pmsts & s->ar.pm1.evt.en) &
+                  (ACPI_BITMASK_RT_CLOCK_ENABLE |
+                   ACPI_BITMASK_POWER_BUTTON_ENABLE |
+                   ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
+                   ACPI_BITMASK_TIMER_ENABLE)) != 0);
+    pci_set_irq(&s->dev, sci_level);
+    /* schedule a timer interruption if needed */
+    acpi_pm_tmr_update(&s->ar, (s->ar.pm1.evt.en & ACPI_BITMASK_TIMER_ENABLE) &&
+                       !(pmsts & ACPI_BITMASK_TIMER_STATUS));
+}
+
+static void pm_tmr_timer(ACPIREGS *ar)
+{
+    VT686PMState *s = container_of(ar, VT686PMState, ar);
+    pm_update_sci(s);
+}
+
 static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 {
     VT686PMState *s = VT82C686B_PM(dev);
@@ -276,6 +168,87 @@ static const TypeInfo via_pm_info = {
     },
 };
 
+
+typedef struct SuperIOConfig {
+    uint8_t regs[0x100];
+    uint8_t index;
+    MemoryRegion io;
+} SuperIOConfig;
+
+static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
+                              unsigned size)
+{
+    SuperIOConfig *sc = opaque;
+
+    if (addr == 0x3f0) { /* config index register */
+        sc->index = data & 0xff;
+    } else {
+        bool can_write = true;
+        /* 0x3f1, config data register */
+        trace_via_superio_write(sc->index, data & 0xff);
+        switch (sc->index) {
+        case 0x00 ... 0xdf:
+        case 0xe4:
+        case 0xe5:
+        case 0xe9 ... 0xed:
+        case 0xf3:
+        case 0xf5:
+        case 0xf7:
+        case 0xf9 ... 0xfb:
+        case 0xfd ... 0xff:
+            can_write = false;
+            break;
+        /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
+        default:
+            break;
+
+        }
+        if (can_write) {
+            sc->regs[sc->index] = data & 0xff;
+        }
+    }
+}
+
+static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
+{
+    SuperIOConfig *sc = opaque;
+    uint8_t val = sc->regs[sc->index];
+
+    trace_via_superio_read(sc->index, val);
+    return val;
+}
+
+static const MemoryRegionOps superio_cfg_ops = {
+    .read = superio_cfg_read,
+    .write = superio_cfg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+
+OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
+
+struct VT82C686BISAState {
+    PCIDevice dev;
+    SuperIOConfig superio_cfg;
+};
+
+static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
+                                   uint32_t val, int len)
+{
+    VT82C686BISAState *s = VT82C686B_ISA(d);
+
+    trace_via_isa_write(addr, val, len);
+    pci_default_write_config(d, addr, val, len);
+    if (addr == 0x85) {
+        /* BIT(1): enable or disable superio config io ports */
+        memory_region_set_enabled(&s->superio_cfg.io, val & BIT(1));
+    }
+}
+
 static const VMStateDescription vmstate_via = {
     .name = "vt82c686b",
     .version_id = 1,
@@ -286,7 +259,33 @@ static const VMStateDescription vmstate_via = {
     }
 };
 
-/* init the PCI-to-ISA bridge */
+static void vt82c686b_isa_reset(DeviceState *dev)
+{
+    VT82C686BISAState *s = VT82C686B_ISA(dev);
+    uint8_t *pci_conf = s->dev.config;
+
+    pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
+    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
+                 PCI_COMMAND_MASTER | PCI_COMMAND_SPECIAL);
+    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
+
+    pci_conf[0x48] = 0x01; /* Miscellaneous Control 3 */
+    pci_conf[0x4a] = 0x04; /* IDE interrupt Routing */
+    pci_conf[0x4f] = 0x03; /* DMA/Master Mem Access Control 3 */
+    pci_conf[0x50] = 0x2d; /* PnP DMA Request Control */
+    pci_conf[0x59] = 0x04;
+    pci_conf[0x5a] = 0x04; /* KBC/RTC Control*/
+    pci_conf[0x5f] = 0x04;
+    pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
+
+    s->superio_cfg.regs[0xe0] = 0x3c; /* Device ID */
+    s->superio_cfg.regs[0xe2] = 0x03; /* Function select */
+    s->superio_cfg.regs[0xe3] = 0xfc; /* Floppy ctrl base addr */
+    s->superio_cfg.regs[0xe6] = 0xde; /* Parallel port base addr */
+    s->superio_cfg.regs[0xe7] = 0xfe; /* Serial port 1 base addr */
+    s->superio_cfg.regs[0xe8] = 0xbe; /* Serial port 2 base addr */
+}
+
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
     VT82C686BISAState *s = VT82C686B_ISA(d);
@@ -354,6 +353,7 @@ static const TypeInfo via_info = {
     },
 };
 
+
 static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
 {
     ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
@@ -372,11 +372,12 @@ static const TypeInfo via_superio_info = {
     .class_init    = vt82c686b_superio_class_init,
 };
 
+
 static void vt82c686b_register_types(void)
 {
     type_register_static(&via_pm_info);
-    type_register_static(&via_superio_info);
     type_register_static(&via_info);
+    type_register_static(&via_superio_info);
 }
 
 type_init(vt82c686b_register_types)
-- 
2.21.3


