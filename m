Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD562F037F
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 21:37:38 +0100 (CET)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyKzR-0007nD-Rb
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 15:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKsU-000062-PI
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:27 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyKsF-0007DN-5A
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 15:30:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 57E4C74763B;
 Sat,  9 Jan 2021 21:29:58 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 77BF2747605; Sat,  9 Jan 2021 21:29:57 +0100 (CET)
Message-Id: <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1610223396.git.balaton@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the ISA
 bridge
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

Currently the ISA devices that are part of the VIA south bridge,
superio chip are wired up by board code. Move creation of these ISA
devices to the VIA ISA bridge model so that board code does not need
to access ISA bus. This also allows vt82c686b-superio to be made
internal to vt82c686 which allows implementing its configuration via
registers in subseqent commits.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/vt82c686.c   | 20 ++++++++++++++++++++
 hw/mips/fuloong2e.c | 29 +++++------------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 58c0bba1d0..5df9be8ff4 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -16,6 +16,11 @@
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "hw/isa/superio.h"
+#include "hw/intc/i8259.h"
+#include "hw/irq.h"
+#include "hw/dma/i8257.h"
+#include "hw/timer/i8254.h"
+#include "hw/rtc/mc146818rtc.h"
 #include "migration/vmstate.h"
 #include "hw/isa/apm.h"
 #include "hw/acpi/acpi.h"
@@ -307,9 +312,16 @@ OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
 struct VT82C686BISAState {
     PCIDevice dev;
+    qemu_irq cpu_intr;
     SuperIOConfig superio_cfg;
 };
 
+static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
+{
+    VT82C686BISAState *s = opaque;
+    qemu_set_irq(s->cpu_intr, level);
+}
+
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
@@ -365,10 +377,18 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     VT82C686BISAState *s = VT82C686B_ISA(d);
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
+    qemu_irq *isa_irq;
     int i;
 
+    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
+    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(isa_bus, 0);
+    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index fbdd6122b3..0fc3288556 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -25,9 +25,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/clock.h"
-#include "hw/intc/i8259.h"
-#include "hw/dma/i8257.h"
-#include "hw/isa/superio.h"
 #include "net/net.h"
 #include "hw/boards.h"
 #include "hw/i2c/smbus_eeprom.h"
@@ -38,13 +35,13 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "hw/ide/pci.h"
+#include "hw/qdev-properties.h"
 #include "elf.h"
 #include "hw/isa/vt82c686.h"
-#include "hw/rtc/mc146818rtc.h"
-#include "hw/timer/i8254.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 
 #define ENVP_PADDR              0x2000
@@ -224,26 +221,13 @@ static void main_cpu_reset(void *opaque)
 }
 
 static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
-                                       I2CBus **i2c_bus, ISABus **p_isa_bus)
+                                       I2CBus **i2c_bus)
 {
-    qemu_irq *i8259;
-    ISABus *isa_bus;
     PCIDevice *dev;
 
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
-    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
-    assert(isa_bus);
-    *p_isa_bus = isa_bus;
-    /* Interrupt controller */
-    /* The 8259 -> IP5  */
-    i8259 = i8259_init(isa_bus, intc);
-    isa_bus_irqs(isa_bus, i8259);
-    /* init other devices */
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(isa_bus, 0);
-    /* Super I/O */
-    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
+    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
 
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
     pci_ide_create_devs(dev);
@@ -290,7 +274,6 @@ static void mips_fuloong2e_init(MachineState *machine)
     uint64_t kernel_entry;
     PCIDevice *pci_dev;
     PCIBus *pci_bus;
-    ISABus *isa_bus;
     I2CBus *smbus;
     Clock *cpuclk;
     MIPSCPU *cpu;
@@ -357,7 +340,7 @@ static void mips_fuloong2e_init(MachineState *machine)
 
     /* South bridge -> IP5 */
     vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
-                               &smbus, &isa_bus);
+                               &smbus);
 
     /* GPU */
     if (vga_interface_type != VGA_NONE) {
@@ -372,8 +355,6 @@ static void mips_fuloong2e_init(MachineState *machine)
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(smbus, 0x50, spd_data);
 
-    mc146818_rtc_init(isa_bus, 2000, NULL);
-
     /* Network card: RTL8139D */
     network_init(pci_bus);
 }
-- 
2.21.3


