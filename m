Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436C4671C12
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:31:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7ZX-0007G7-Mi; Wed, 18 Jan 2023 07:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pI7ZV-0007FZ-Bj
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:29:41 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pI7ZS-0004Ef-Sp
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:29:41 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 5CE6011EF83
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 12:29:37 +0000 (UTC)
From: ~luhux <luhux@git.sr.ht>
Date: Wed, 18 Jan 2023 17:06:02 +0800
Subject: [PATCH qemu 3/3] hw/mips/mt7628.c: add mt7628 soc support, add a
 mt7628 board VoCore2.
Message-ID: <167404497644.25699.12403586061485468184-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167404497644.25699.12403586061485468184-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 FREEMAIL_FORGED_REPLYTO=2.095, FREEMAIL_REPLYTO_END_DIGIT=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~luhux <luhux76@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: LuHui <luhux76@gmail.com>

Signed-off-by: LuHui <luhux76@gmail.com>
---
 MAINTAINERS                             |   1 +
 configs/devices/mips-softmmu/common.mak |   2 +
 hw/mips/Kconfig                         |  11 ++
 hw/mips/meson.build                     |   2 +
 hw/mips/mt7628.c                        | 189 ++++++++++++++++++++++++
 hw/mips/vocore2.c                       | 180 ++++++++++++++++++++++
 include/hw/mips/mt7628.h                |  77 ++++++++++
 7 files changed, 462 insertions(+)
 create mode 100644 hw/mips/mt7628.c
 create mode 100644 hw/mips/vocore2.c
 create mode 100644 include/hw/mips/mt7628.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 41854e939c..1b2f92e078 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1238,6 +1238,7 @@ VoCore2
 M: Lu Hui <luhux76@gmail.com>
 S: Maintained
 F: hw/*/*mt7628*
+F: hw/mips/vocore2.c
=20
 Jazz
 M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-s=
oftmmu/common.mak
index 7da99327a7..e4a5c54635 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -29,3 +29,5 @@ CONFIG_PCNET_PCI=3Dy
 CONFIG_MIPSSIM=3Dy
 CONFIG_SMBUS_EEPROM=3Dy
 CONFIG_TEST_DEVICES=3Dy
+CONFIG_MT7628=3Dy
+CONFIG_VOCORE2=3Dy
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index da3a37e215..f7faec010c 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -10,6 +10,17 @@ config MIPSSIM
     select SERIAL_ISA
     select MIPSNET
=20
+config MT7628
+    bool
+    select SERIAL
+    select USB_EHCI
+    select USB_EHCI_SYSBUS
+    select UNIMP
+
+config VOCORE2
+    bool
+    select MT7628
+
 config JAZZ
     bool
     select ISA_BUS
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 900613fc08..9ad125a996 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -10,6 +10,8 @@ mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
+mips_ss.add(when: 'CONFIG_MT7628', if_true: files('mt7628.c'))
+mips_ss.add(when: 'CONFIG_VOCORE2', if_true: files('vocore2.c'))
 endif
=20
 hw_arch +=3D {'mips': mips_ss}
diff --git a/hw/mips/mt7628.c b/hw/mips/mt7628.c
new file mode 100644
index 0000000000..d982b1c704
--- /dev/null
+++ b/hw/mips/mt7628.c
@@ -0,0 +1,189 @@
+/*
+ * QEMU/mt7628 emulation
+ *
+ * Copyright (c) 2023 Lu Hui <luhux76@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHO=
UT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/datadir.h"
+#include "hw/clock.h"
+#include "hw/block/flash.h"
+#include "hw/mips/mips.h"
+#include "hw/mips/cpudevs.h"
+#include "hw/mips/bios.h"
+#include "hw/usb/hcd-ehci.h"
+#include "hw/char/serial.h"
+#include "hw/misc/unimp.h"
+#include "hw/mips/mt7628.h"
+#include "sysemu/sysemu.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "elf.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+#include "qemu/error-report.h"
+#include "sysemu/qtest.h"
+#include "sysemu/reset.h"
+
+/* data src: linux kernel, openwrt, uboot */
+
+/* irq table */
+enum {
+    IRQ_UART0 =3D 20,
+    IRQ_UART1 =3D 21,
+    IRQ_UART2 =3D 22,
+    IRQ_EHCI =3D 18
+};
+
+/* Memory map */
+const hwaddr mt7628_memmap[] =3D {
+    [MT7628_DEV_DDR]          =3D 0x00000000,
+    [MT7628_DEV_SYSCTRL]      =3D 0x10000000,
+    [MT7628_DEV_INTC]         =3D 0x10000200,
+    [MT7628_DEV_UART0]        =3D 0x10000C00,
+    [MT7628_DEV_UART1]        =3D 0x10000D00,
+    [MT7628_DEV_UART2]        =3D 0x10000E00,
+    [MT7628_DEV_EHCI]         =3D 0x101C0000,
+    [MT7628_DEV_FLASH_DIRECT] =3D 0x1C000000,
+};
+
+struct mt7628Unimplemented {
+    const char *device_name;
+    hwaddr base;
+    hwaddr size;
+} unimplemented[] =3D {
+    { "timer",        0x10000100, 0xFF },
+    { "memc",         0x10000300, 0xFF },
+    { "rbus",         0x10000400, 0xFF },
+    { "mips-cnt",     0x10000500, 0xFF },
+    { "gpio",         0x10000600, 0xFF },
+    { "spi-slave",    0x10000700, 0xFF },
+    { "i2c",          0x10000900, 0xFF },
+    { "i2s",          0x10000A00, 0xFF },
+    { "spi-master",   0x10000B00, 0xFF },
+    { "rgctl",        0x10001000, 2 * KiB },
+    { "pcm",          0x10002000, 2 * KiB },
+    { "dma",          0x10002800, 2 * KiB },
+    { "aes",          0x10004000, 4 * KiB },
+    { "pwm",          0x10005000, 4 * KiB },
+    { "ethernet-phy", 0x10100000, 64 * KiB },
+    { "ethernet",     0x10110000, 32 * KiB },
+    { "usb-phy",      0x10120000, 32 * KiB },
+    { "sdxc",         0x10130000, 32 * KiB },
+    { "pcie",         0x10140000, 256 * KiB },
+    { "wlan",         0x10300000, 1 * MiB },
+    { "pcie-direct",  0x20000000, 256 * MiB },
+};
+
+static void mt7628_init(Object *obj)
+{
+    mt7628State *s =3D MT7628(obj);
+    s->memmap =3D mt7628_memmap;
+
+    object_initialize_child(obj, "sysctrl", &s->sysctrl, TYPE_MT7628_SYSCTRL=
);
+    object_initialize_child(obj, "intc", &s->intc, TYPE_MT7628_INTC);
+    if (machine_usb(current_machine)) {
+        object_initialize_child(obj, "ehci", &s->ehci, TYPE_PLATFORM_EHCI);
+    }
+}
+
+static void mt7628_realize(DeviceState *dev, Error **errp)
+{
+    mt7628State *s =3D MT7628(dev);
+    SysBusDevice *sysbusdev;
+    int i;
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->intc), errp)) {
+        return;
+    }
+    CPUMIPSState *env =3D &s->cpu->env;
+
+    /* interrupt control */
+    sysbusdev =3D SYS_BUS_DEVICE(&s->intc);
+    sysbus_mmio_map(sysbusdev, 0, s->memmap[MT7628_DEV_INTC]);
+    sysbus_connect_irq(sysbusdev, 0, env->irq[MT7628_CPU_IRQ_INTC]);
+    qdev_pass_gpios(DEVICE(&s->intc), dev, NULL);
+
+    /* system control */
+    sysbus_realize(SYS_BUS_DEVICE(&s->sysctrl), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctrl), 0,
+                    s->memmap[MT7628_DEV_SYSCTRL]);
+
+    /* serial port */
+    for (i =3D 0; i < 3; i++) {
+        if (serial_hd(i)) {
+            serial_mm_init(get_system_memory(),
+                           s->memmap[MT7628_DEV_UART0 + i], 2,
+                           qdev_get_gpio_in(dev, IRQ_UART0 + i), 115200,
+                           serial_hd(i), DEVICE_NATIVE_ENDIAN);
+        } else {
+            create_unimplemented_device("uart",
+                                        s->memmap[MT7628_DEV_UART0 + i], 256=
);
+        }
+    }
+
+    /* usb 2.0 host */
+    if (machine_usb(current_machine)) {
+        sysbus_realize(SYS_BUS_DEVICE(&s->ehci), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci), 0,
+                        s->memmap[MT7628_DEV_EHCI]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci), 0,
+                           qdev_get_gpio_in(dev, IRQ_EHCI));
+    } else {
+        create_unimplemented_device("ehci", s->memmap[MT7628_DEV_EHCI],
+                                    256 * KiB);
+    }
+
+    /* flash direct access */
+    DriveInfo *dinfo =3D drive_get(IF_PFLASH, 0, 0);
+    if (dinfo) {
+        pflash_cfi01_register(s->memmap[MT7628_DEV_FLASH_DIRECT],
+                              "mt7628.flash0", 4 * MiB,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              4096, 4, 0, 0, 0, 0, 0);
+    } else {
+        create_unimplemented_device("flash-direct",
+                                    s->memmap[MT7628_DEV_FLASH_DIRECT],
+                                    4 * MiB);
+    }
+
+    /* Unimplemented devices */
+    for (i =3D 0; i < ARRAY_SIZE(unimplemented); i++) {
+        create_unimplemented_device(unimplemented[i].device_name,
+                                    unimplemented[i].base,
+                                    unimplemented[i].size);
+    }
+}
+
+static void mt7628_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+    dc->realize =3D mt7628_realize;
+    dc->user_creatable =3D false;
+}
+
+static const TypeInfo mt7628_type_info =3D {
+    .name =3D TYPE_MT7628,
+    .parent =3D TYPE_DEVICE,
+    .instance_size =3D sizeof(mt7628State),
+    .instance_init =3D mt7628_init,
+    .class_init =3D mt7628_class_init,
+};
+
+static void mt7628_register_types(void)
+{
+    type_register_static(&mt7628_type_info);
+}
+
+type_init(mt7628_register_types);
diff --git a/hw/mips/vocore2.c b/hw/mips/vocore2.c
new file mode 100644
index 0000000000..e9662224fd
--- /dev/null
+++ b/hw/mips/vocore2.c
@@ -0,0 +1,180 @@
+/*
+ * QEMU/mt7628 emulation
+ *
+ * Copyright (c) 2023 Lu Hui <luhux76@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHO=
UT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/datadir.h"
+#include "hw/clock.h"
+#include "hw/mips/mips.h"
+#include "hw/mips/cpudevs.h"
+#include "hw/mips/mt7628.h"
+#include "sysemu/sysemu.h"
+#include "hw/boards.h"
+#include "hw/mips/bios.h"
+#include "hw/loader.h"
+#include "elf.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
+#include "qemu/error-report.h"
+#include "sysemu/qtest.h"
+#include "sysemu/reset.h"
+
+static struct _loaderparams {
+    int ram_size;
+    const char *kernel_filename;
+    const char *kernel_cmdline;
+    const char *initrd_filename;
+} loaderparams;
+
+typedef struct ResetData {
+    MIPSCPU *cpu;
+    uint64_t vector;
+} ResetData;
+
+static uint64_t load_kernel(void)
+{
+    uint64_t entry, kernel_high, initrd_size;
+    long kernel_size;
+    ram_addr_t initrd_offset;
+
+    kernel_size =3D load_elf(loaderparams.kernel_filename, NULL,
+                           cpu_mips_kseg0_to_phys, NULL,
+                           &entry, NULL,
+                           &kernel_high, NULL, 0, EM_MIPS, 1, 0);
+    if (kernel_size < 0) {
+        error_report("could not load kernel '%s': %s",
+                     loaderparams.kernel_filename,
+                     load_elf_strerror(kernel_size));
+        exit(1);
+    }
+
+    /* load initrd */
+    initrd_size =3D 0;
+    initrd_offset =3D 0;
+    if (loaderparams.initrd_filename) {
+        initrd_size =3D get_image_size(loaderparams.initrd_filename);
+        if (initrd_size > 0) {
+            initrd_offset =3D ROUND_UP(kernel_high, INITRD_PAGE_SIZE);
+            if (initrd_offset + initrd_size > loaderparams.ram_size) {
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
+                exit(1);
+            }
+            initrd_size =3D load_image_targphys(loaderparams.initrd_filename,
+                                       initrd_offset,
+                                       loaderparams.ram_size - initrd_offset=
);
+        }
+        if (initrd_size =3D=3D (target_ulong)-1) {
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
+            exit(1);
+        }
+    }
+    return entry;
+}
+
+static void main_cpu_reset(void *opaque)
+{
+    ResetData *s =3D (ResetData *) opaque;
+    CPUMIPSState *env =3D &s->cpu->env;
+
+    cpu_reset(CPU(s->cpu));
+    env->active_tc.PC =3D s->vector & ~(target_ulong) 1;
+    if (s->vector & 1) {
+        env->hflags |=3D MIPS_HFLAG_M16;
+    }
+}
+
+static void vocore2_init(MachineState *machine)
+{
+    const char *kernel_filename =3D machine->kernel_filename;
+    const char *kernel_cmdline =3D machine->kernel_cmdline;
+    const char *initrd_filename =3D machine->initrd_filename;
+    mt7628State *mt7628;
+    Clock *cpuclk;
+    MIPSCPU *cpu;
+    ResetData *reset_info;
+
+    /* BIOS is not supported by this board */
+    if (machine->firmware) {
+        error_report("BIOS not supported for this machine");
+        exit(1);
+    }
+
+    /* CPU limit */
+    if (strcmp(machine->cpu_type, MIPS_CPU_TYPE_NAME("24KEc")) !=3D 0) {
+        error_report("This board can only be used with 24KEc CPU");
+        exit(1);
+    }
+
+    /* RAM limit */
+    if (machine->ram_size > 256 * MiB) {
+        error_report("mt7628: memory size must not exceed 256MiB");
+    }
+
+    mt7628 =3D MT7628(object_new(TYPE_MT7628));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(mt7628));
+    object_unref(OBJECT(mt7628));
+
+    /* CPU Clock */
+    cpuclk =3D clock_new(OBJECT(machine), "cpu-refclk");
+    /* xtal 40Mhz -> cpu 580Mhz (VoCore2 use this) */
+    /* xtal 25Mhz -> cpu 575Mhz */
+    clock_set_hz(cpuclk, 580000000);
+
+    /* CPU */
+    cpu =3D mips_cpu_create_with_clock(machine->cpu_type, cpuclk);
+    cpu_mips_irq_init_cpu(cpu);
+    cpu_mips_clock_init(cpu);
+    mt7628->cpu =3D cpu;
+
+    /* Mark mt7628 object realized */
+    qdev_realize(DEVICE(mt7628), NULL, &error_abort);
+
+    /* DDR */
+    memory_region_add_subregion(get_system_memory(),
+                                mt7628->memmap[MT7628_DEV_DDR],
+                                machine->ram);
+
+    /* Load kernel to RAM & goto kernel */
+    reset_info =3D g_new0(ResetData, 1);
+    reset_info->cpu =3D cpu;
+    reset_info->vector =3D reset_info->cpu->env.active_tc.PC;
+    qemu_register_reset(main_cpu_reset, reset_info);
+    if (kernel_filename) {
+        loaderparams.ram_size =3D machine->ram_size;
+        loaderparams.kernel_filename =3D kernel_filename;
+        loaderparams.kernel_cmdline =3D kernel_cmdline;
+        loaderparams.initrd_filename =3D initrd_filename;
+        reset_info->vector =3D load_kernel();
+    }
+    /* TODO: boot from flash */
+}
+
+static void vocore2_machine_init(MachineClass *mc)
+{
+    mc->desc =3D "VoCore2 (24KEc)";
+    mc->init =3D vocore2_init;
+    mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24KEc");
+    mc->default_ram_id =3D "vocore2.ram";
+    mc->default_ram_size =3D 128 * MiB;
+    mc->min_cpus =3D 1;
+    mc->max_cpus =3D 1;
+    mc->default_cpus =3D 1;
+}
+
+DEFINE_MACHINE("vocore2", vocore2_machine_init)
diff --git a/include/hw/mips/mt7628.h b/include/hw/mips/mt7628.h
new file mode 100644
index 0000000000..2570f87846
--- /dev/null
+++ b/include/hw/mips/mt7628.h
@@ -0,0 +1,77 @@
+/*
+ * MT7628 System on Chip emulation
+ *
+ * Copyright (C) 2023 Lu Hui <luhux76@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_MIPS_MT7628_H
+#define HW_MIPS_MT7628_H
+
+#include "qom/object.h"
+#include "hw/mips/mips.h"
+#include "hw/mips/cpudevs.h"
+#include "hw/mips/bios.h"
+#include "hw/usb/hcd-ehci.h"
+#include "hw/misc/mt7628-sysctrl.h"
+#include "hw/intc/mt7628-intc.h"
+
+/**
+ * MT7628 device list
+ *
+ * This enumeration is can be used refer to a particular device in the
+ * MT7628 SoC. For example, the physical memory base address for
+ * each device can be found in the mt7628State object in the memmap member
+ * using the device enum value as index.
+ *
+ * @see mt7628State
+ */
+enum {
+    MT7628_DEV_DDR,
+    MT7628_DEV_SYSCTRL,
+    MT7628_DEV_INTC,
+    MT7628_DEV_UART0,
+    MT7628_DEV_UART1,
+    MT7628_DEV_UART2,
+    MT7628_DEV_EHCI,
+    MT7628_DEV_FLASH_DIRECT,
+};
+
+
+/* mt7628 cpu interrupt table */
+
+
+enum {
+    MT7628_CPU_IRQ_INTC =3D 2,
+    MT7628_CPU_IRQ_PCIE =3D 4,
+};
+
+#define TYPE_MT7628 "mt7628"
+OBJECT_DECLARE_SIMPLE_TYPE(mt7628State, MT7628)
+
+struct mt7628State {
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
+
+    MIPSCPU *cpu;
+    const hwaddr *memmap;
+    mt7628SysCtrlState sysctrl;
+    mt7628intcState intc;
+    EHCISysBusState ehci;
+    MemoryRegion flash_direct;
+};
+
+#endif /* HW_MIPS_MT7628_H */
--=20
2.34.5

