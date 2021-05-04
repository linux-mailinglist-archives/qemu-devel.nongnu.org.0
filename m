Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633103725C3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:21:44 +0200 (CEST)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoRD-0001O1-FZ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0B-0005Pn-14; Tue, 04 May 2021 01:53:47 -0400
Received: from ozlabs.org ([203.11.71.1]:41511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo08-0004s4-QG; Tue, 04 May 2021 01:53:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CL6R2Nz9sjD; Tue,  4 May 2021 15:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107598;
 bh=A4jdODat3Z6GefaXXFSiKe0Cos01b2C3YnZHIpUCy0Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PDmSS8iugnbmWIygHh7xgkacmEKTYbGo1kUOpAWqitU6oNRNfnDd/gdQkcdSjGZhj
 +z/dDGDXjILzPChv+Ez8rBQl9D7pEp7JmmXCa5YO9kI0qQydDYFeP6EgIkj6aJfeGI
 s06fktHhm5Fyvp1JZ+p20LckPvF2iPiYBqfUeO1E=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 25/46] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
Date: Tue,  4 May 2021 15:52:51 +1000
Message-Id: <20210504055312.306823-26-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
a PowerPC board based on the Marvell MV64361 system controller and the
VIA VT8231 integrated south bridge/superio chips. It can run Linux,
AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
image is needed to boot and only MorphOS has a video driver to produce
graphics output. Linux could work too but distros that supported this
machine don't include usual video drivers so those only run with
serial console for now.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <30cbfb9cbe6f46a1e15a69a75fac45ac39340122.1616680239.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS                             |  10 ++
 default-configs/devices/ppc-softmmu.mak |   2 +
 hw/ppc/Kconfig                          |   9 ++
 hw/ppc/meson.build                      |   2 +
 hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++++
 5 files changed, 167 insertions(+)
 create mode 100644 hw/ppc/pegasos2.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c05ff8bba..6bc008d825 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1364,6 +1364,16 @@ F: pc-bios/canyonlands.dt[sb]
 F: pc-bios/u-boot-sam460ex-20100605.bin
 F: roms/u-boot-sam460ex
 
+pegasos2
+M: BALATON Zoltan <balaton@eik.bme.hu>
+R: David Gibson <david@gibson.dropbear.id.au>
+L: qemu-ppc@nongnu.org
+S: Maintained
+F: hw/ppc/pegasos2.c
+F: hw/pci-host/mv64361.c
+F: hw/pci-host/mv643xx.h
+F: include/hw/pci-host/mv64361.h
+
 RISC-V Machines
 ---------------
 OpenTitan
diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
index 61b78b844d..c2d41198cd 100644
--- a/default-configs/devices/ppc-softmmu.mak
+++ b/default-configs/devices/ppc-softmmu.mak
@@ -14,5 +14,7 @@ CONFIG_SAM460EX=y
 CONFIG_MAC_OLDWORLD=y
 CONFIG_MAC_NEWWORLD=y
 
+CONFIG_PEGASOS2=n
+
 # For PReP
 CONFIG_PREP=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index d11dc30509..e51e0e5e5a 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -68,6 +68,15 @@ config SAM460EX
     select USB_OHCI
     select FDT_PPC
 
+config PEGASOS2
+    bool
+    select MV64361
+    select VT82C686
+    select IDE_VIA
+    select SMBUS_EEPROM
+# This should come with VT82C686
+    select ACPI_X86
+
 config PREP
     bool
     imply PCI_DEVICES
diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index 218631c883..86d6f379d1 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -78,5 +78,7 @@ ppc_ss.add(when: 'CONFIG_E500', if_true: files(
 ))
 # PowerPC 440 Xilinx ML507 reference board.
 ppc_ss.add(when: 'CONFIG_VIRTEX', if_true: files('virtex_ml507.c'))
+# Pegasos2
+ppc_ss.add(when: 'CONFIG_PEGASOS2', if_true: files('pegasos2.c'))
 
 hw_arch += {'ppc': ppc_ss}
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
new file mode 100644
index 0000000000..0bfd0928aa
--- /dev/null
+++ b/hw/ppc/pegasos2.c
@@ -0,0 +1,144 @@
+/*
+ * QEMU PowerPC CHRP (Genesi/bPlan Pegasos II) hardware System Emulator
+ *
+ * Copyright (c) 2018-2020 BALATON Zoltan
+ *
+ * This work is licensed under the GNU GPL license version 2 or later.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "hw/hw.h"
+#include "hw/ppc/ppc.h"
+#include "hw/sysbus.h"
+#include "hw/pci/pci_host.h"
+#include "hw/irq.h"
+#include "hw/pci-host/mv64361.h"
+#include "hw/isa/vt82c686.h"
+#include "hw/ide/pci.h"
+#include "hw/i2c/smbus_eeprom.h"
+#include "hw/qdev-properties.h"
+#include "sysemu/reset.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/fw-path-provider.h"
+#include "elf.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "sysemu/kvm.h"
+#include "kvm_ppc.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+#include "qemu/datadir.h"
+#include "sysemu/device_tree.h"
+
+#define PROM_FILENAME "pegasos2.rom"
+#define PROM_ADDR     0xfff00000
+#define PROM_SIZE     0x80000
+
+#define BUS_FREQ_HZ 133333333
+
+static void pegasos2_cpu_reset(void *opaque)
+{
+    PowerPCCPU *cpu = opaque;
+
+    cpu_reset(CPU(cpu));
+    cpu->env.spr[SPR_HID1] = 7ULL << 28;
+}
+
+static void pegasos2_init(MachineState *machine)
+{
+    PowerPCCPU *cpu = NULL;
+    MemoryRegion *rom = g_new(MemoryRegion, 1);
+    DeviceState *mv;
+    PCIBus *pci_bus;
+    PCIDevice *dev;
+    I2CBus *i2c_bus;
+    const char *fwname = machine->firmware ?: PROM_FILENAME;
+    char *filename;
+    int sz;
+    uint8_t *spd_data;
+
+    /* init CPU */
+    cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
+    if (PPC_INPUT(&cpu->env) != PPC_FLAGS_INPUT_6xx) {
+        error_report("Incompatible CPU, only 6xx bus supported");
+        exit(1);
+    }
+
+    /* Set time-base frequency */
+    cpu_ppc_tb_init(&cpu->env, BUS_FREQ_HZ / 4);
+    qemu_register_reset(pegasos2_cpu_reset, cpu);
+
+    /* RAM */
+    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
+
+    /* allocate and load firmware */
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, fwname);
+    if (!filename) {
+        error_report("Could not find firmware '%s'", fwname);
+        exit(1);
+    }
+    memory_region_init_rom(rom, NULL, "pegasos2.rom", PROM_SIZE, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), PROM_ADDR, rom);
+    sz = load_elf(filename, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1,
+                  PPC_ELF_MACHINE, 0, 0);
+    if (sz <= 0) {
+        sz = load_image_targphys(filename, PROM_ADDR, PROM_SIZE);
+    }
+    if (sz <= 0 || sz > PROM_SIZE) {
+        error_report("Could not load firmware '%s'", filename);
+        exit(1);
+    }
+    g_free(filename);
+
+    /* Marvell Discovery II system controller */
+    mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
+                        ((qemu_irq *)cpu->env.irq_inputs)[PPC6xx_INPUT_INT]));
+    pci_bus = mv64361_get_pci_bus(mv, 1);
+
+    /* VIA VT8231 South Bridge (multifunction PCI device) */
+    /* VT8231 function 0: PCI-to-ISA Bridge */
+    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
+                                          TYPE_VT8231_ISA);
+    qdev_connect_gpio_out(DEVICE(dev), 0,
+                          qdev_get_gpio_in_named(mv, "gpp", 31));
+
+    /* VT8231 function 1: IDE Controller */
+    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
+    pci_ide_create_devs(dev);
+
+    /* VT8231 function 2-3: USB Ports */
+    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
+    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
+
+    /* VT8231 function 4: Power Management Controller */
+    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
+    i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
+    spd_data = spd_data_generate(DDR, machine->ram_size);
+    smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
+
+    /* VT8231 function 5-6: AC97 Audio & Modem */
+    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
+    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
+
+    /* other PC hardware */
+    pci_vga_init(pci_bus);
+}
+
+static void pegasos2_machine(MachineClass *mc)
+{
+    mc->desc = "Genesi/bPlan Pegasos II";
+    mc->init = pegasos2_init;
+    mc->block_default_type = IF_IDE;
+    mc->default_boot_order = "cd";
+    mc->default_display = "std";
+    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7400_v2.9");
+    mc->default_ram_id = "pegasos2.ram";
+    mc->default_ram_size = 512 * MiB;
+}
+
+DEFINE_MACHINE("pegasos2", pegasos2_machine)
-- 
2.31.1


