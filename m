Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE133A3C8
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 10:13:23 +0100 (CET)
Received: from localhost ([::1]:37612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLMoM-0006xu-Kp
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 05:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lLMIX-00010R-T8; Sun, 14 Mar 2021 04:40:29 -0400
Received: from sender-of-o52.zoho.in ([103.117.158.52]:2297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lLMIS-00043C-EO; Sun, 14 Mar 2021 04:40:29 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615711216; cv=none; d=zohomail.in; s=zohoarc; 
 b=E/wKj3nMteTm1g2ZQr3GUVo/d6dvYpcHZHBt5ckdU8ahM0V7Gxw3jZt4ByK665rusoKujUIgLWtV1mTivtC/D8cBdW1Kd6gNJUHtKUCkVYmN9+Ow6d7meEawH5aGUs8SpNehcddJ5BWhOhVONp68ZTA8qeB4PKcvcJIkQOgoNPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1615711216;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=v4/j1k/7XmDy7GHjcY2wyfOM24vfWHfCWNNQiQI1vwM=; 
 b=IEZQ2RTcLCEpA5NjStkHoWk4FeChZcCRd10WscvPBtgb2W34CX42w81Ak6BrUIABFEEAq8yp7yF/Oice55EnJJCHMa60AXDM+uT4+cvYQql1w6ai5TUW2uoih9SHnQTIzBSYsgPUlGO04oKAnQgiJBmsvOJnd+KqFJblUyPLUmM=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615711216; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=v4/j1k/7XmDy7GHjcY2wyfOM24vfWHfCWNNQiQI1vwM=;
 b=Wng0b+xV8ibN/E2JNGkB5KKNaH/Q+yhS745OhAkxHO2lfe83cittFLiuoXZWNiC0
 rQN+8x67v+EOvpP7C9jOoUmL8n9Y9mPldwz5dFyrVGDyxyZo0Wb4ni3QM6XqkrtmrZx
 8XhGfTp9O+10Wg/ioLj7jl6QH7/mt2Tl4YcgoAKI=
Received: from helium.Dlink (49.207.215.131 [49.207.215.131]) by mx.zoho.in
 with SMTPS id 1615711213622385.9354413935521;
 Sun, 14 Mar 2021 14:10:13 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org
Message-ID: <20210314083936.76269-2-vijai@behindbytes.com>
Subject: [PATCH 1/3] riscv: Add initial support for Shakti C class
Date: Sun, 14 Mar 2021 14:09:34 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314083936.76269-1-vijai@behindbytes.com>
References: <20210314083936.76269-1-vijai@behindbytes.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.52;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o52.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 14 Mar 2021 05:09:55 -0400
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C-Class is a member of the SHAKTI family of processors from Indian
Institute of Technology - Madras(IIT-M).
It is an extremely configurable and commercial-grade 5-stage in-order
core supporting the standard RV64GCSUN ISA extensions.

Add support for emulating Shakti SoC based on C-class running on arty-100T
platform.

https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.rst

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 MAINTAINERS                                 |   7 +
 default-configs/devices/riscv64-softmmu.mak |   1 +
 hw/riscv/Kconfig                            |  10 ++
 hw/riscv/meson.build                        |   1 +
 hw/riscv/shakti_c.c                         | 178 ++++++++++++++++++++
 include/hw/riscv/shakti_c.h                 |  74 ++++++++
 target/riscv/cpu.c                          |   9 +
 target/riscv/cpu.h                          |   1 +
 8 files changed, 281 insertions(+)
 create mode 100644 hw/riscv/shakti_c.c
 create mode 100644 include/hw/riscv/shakti_c.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e9f0d591e..9f71c4cc3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1380,6 +1380,13 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
 F: include/hw/misc/mchp_pfsoc_ioscb.h
 F: include/hw/misc/mchp_pfsoc_sysreg.h
=20
+Shakti C class SoC
+M: Vijai Kumar K <vijai@behindbytes.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: hw/riscv/shakti_c.c
+F: include/hw/riscv/shakti_c.h
+
 SiFive Machines
 M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Bin Meng <bin.meng@windriver.com>
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/=
devices/riscv64-softmmu.mak
index d5eec75f05..bc69301fa4 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -13,3 +13,4 @@ CONFIG_SIFIVE_E=3Dy
 CONFIG_SIFIVE_U=3Dy
 CONFIG_RISCV_VIRT=3Dy
 CONFIG_MICROCHIP_PFSOC=3Dy
+CONFIG_SHAKTI_C=3Dy
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d139074b02..92a62b5ce9 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,16 @@ config OPENTITAN
     select IBEX
     select UNIMP
=20
+config SHAKTI
+    bool
+
+config SHAKTI_C
+    bool
+    select UNIMP
+    select SHAKTI
+    select SIFIVE_CLINT
+    select SIFIVE_PLIC
+
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 275c0f7eb7..a97454661c 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -4,6 +4,7 @@ riscv_ss.add(files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
+riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
new file mode 100644
index 0000000000..e96436a3bf
--- /dev/null
+++ b/hw/riscv/shakti_c.c
@@ -0,0 +1,178 @@
+/*
+ * Shakti C-class SoC emulation
+ *
+ * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along=
 with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/boards.h"
+#include "hw/riscv/shakti_c.h"
+#include "qapi/error.h"
+#include "hw/intc/sifive_plic.h"
+#include "hw/intc/sifive_clint.h"
+#include "sysemu/sysemu.h"
+#include "hw/qdev-properties.h"
+#include "exec/address-spaces.h"
+#include "hw/riscv/boot.h"
+
+#define DEBUG_SHAKTI_C 0
+#define DPRINTF(fmt, args...) \
+    do { \
+        if (DEBUG_SHAKTI_C) { \
+            fprintf(stderr, "[%s]%s: " fmt , TYPE_RISCV_SHAKTI_SOC, \
+                                             __func__, ##args); \
+        } \
+    } while (0)
+
+static const struct MemmapEntry {
+    hwaddr base;
+    hwaddr size;
+} shakti_c_memmap[] =3D {
+    [SHAKTI_C_ROM]   =3D  {  0x00001000,  0x2000   },
+    [SHAKTI_C_RAM]   =3D  {  0x80000000,  0x0      },
+    [SHAKTI_C_UART]  =3D  {  0x00011300,  0x00040  },
+    [SHAKTI_C_GPIO]  =3D  {  0x020d0000,  0x00100  },
+    [SHAKTI_C_PLIC]  =3D  {  0x0c000000,  0x20000  },
+    [SHAKTI_C_CLINT] =3D  {  0x02000000,  0xc0000  },
+    [SHAKTI_C_DEBUG] =3D  {  0x00000000,  0x00010  },
+    [SHAKTI_C_I2C]   =3D  {  0x20c00000,  0x00100  },
+};
+
+static void shakti_c_machine_state_init(MachineState *mstate)
+{
+    ShaktiCMachineState *sms =3D RISCV_SHAKTI_MACHINE(mstate);
+    MemoryRegion *system_memory =3D get_system_memory();
+    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
+    int i;
+
+    /* Initialize SoC */
+    object_initialize_child(OBJECT(mstate), "soc", &sms->soc,
+                            TYPE_RISCV_SHAKTI_SOC);
+    qdev_realize(DEVICE(&sms->soc), NULL, &error_abort);
+
+    /* register RAM */
+    memory_region_init_ram(main_mem, NULL, "riscv.shakti.c.ram",
+                           mstate->ram_size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                shakti_c_memmap[SHAKTI_C_RAM].base,
+                                main_mem);
+
+    /* ROM reset vector */
+    uint32_t reset_vec[3];
+
+    reset_vec[0] =3D 0x080002b7;      /*  lui     t0,0x08000  */
+    reset_vec[1] =3D 0x00429293;      /*  slli    t0,t0,4     */
+    reset_vec[2] =3D 0x00028067;      /*  jr      t0          */
+
+    /* copy in the reset vector in little_endian byte order */
+    for (i =3D 0; i < ARRAY_SIZE(reset_vec); i++) {
+        reset_vec[i] =3D cpu_to_le32(reset_vec[i]);
+    }
+    rom_add_blob_fixed_as("rom.reset", reset_vec, sizeof(reset_vec),
+                          shakti_c_memmap[SHAKTI_C_ROM].base,
+                          &address_space_memory);
+    riscv_load_firmware(mstate->firmware, shakti_c_memmap[SHAKTI_C_RAM].ba=
se,
+                        NULL);
+}
+
+static void shakti_c_machine_instance_init(Object *obj)
+{
+}
+
+static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(klass);
+    mc->desc =3D "RISC-V Board compatible with Shakti SDK";
+    mc->init =3D shakti_c_machine_state_init;
+    mc->default_cpu_type =3D TYPE_RISCV_CPU_SHAKTI_C;
+}
+
+static const TypeInfo shakti_c_machine_type_info =3D {
+    .name =3D TYPE_RISCV_SHAKTI_MACHINE,
+    .parent =3D TYPE_MACHINE,
+    .class_init =3D shakti_c_machine_class_init,
+    .instance_init =3D shakti_c_machine_instance_init,
+    .instance_size =3D sizeof(ShaktiCMachineState),
+};
+
+static void shakti_c_machine_type_info_register(void)
+{
+    type_register_static(&shakti_c_machine_type_info);
+}
+type_init(shakti_c_machine_type_info_register)
+
+static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
+{
+    ShaktiCSoCState *sss =3D RISCV_SHAKTI_SOC(dev);
+    MemoryRegion *system_memory =3D get_system_memory();
+    sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
+    sss->plic =3D sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
+        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0,
+        SHAKTI_C_PLIC_NUM_SOURCES,
+        SHAKTI_C_PLIC_NUM_PRIORITIES,
+        SHAKTI_C_PLIC_PRIORITY_BASE,
+        SHAKTI_C_PLIC_PENDING_BASE,
+        SHAKTI_C_PLIC_ENABLE_BASE,
+        SHAKTI_C_PLIC_ENABLE_STRIDE,
+        SHAKTI_C_PLIC_CONTEXT_BASE,
+        SHAKTI_C_PLIC_CONTEXT_STRIDE,
+        shakti_c_memmap[SHAKTI_C_PLIC].size);
+    sifive_clint_create(shakti_c_memmap[SHAKTI_C_CLINT].base,
+        shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1,
+        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+    /* ROM */
+    memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
+                           shakti_c_memmap[SHAKTI_C_ROM].size, &error_fata=
l);
+    memory_region_add_subregion(system_memory,
+        shakti_c_memmap[SHAKTI_C_ROM].base, &sss->rom);
+}
+
+static void shakti_c_soc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->realize =3D shakti_c_soc_state_realize;
+}
+
+static void shakti_c_soc_instance_init(Object *obj)
+{
+    ShaktiCSoCState *sss =3D RISCV_SHAKTI_SOC(obj);
+
+    object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY=
);
+
+    /*
+     * CPU type is fixed and we are not supporting passing from commandlin=
e yet.
+     * So let it be in instance_init. When supported should use ms->cpu_ty=
pe
+     * instead of TYPE_RISCV_CPU_SHAKTI_C
+     */
+    object_property_set_str(OBJECT(&sss->cpus), "cpu-type",
+                            TYPE_RISCV_CPU_SHAKTI_C, &error_abort);
+    object_property_set_int(OBJECT(&sss->cpus), "num-harts", 1,
+                            &error_abort);
+}
+
+static const TypeInfo shakti_c_type_info =3D {
+    .name =3D TYPE_RISCV_SHAKTI_SOC,
+    .parent =3D TYPE_DEVICE,
+    .class_init =3D shakti_c_soc_class_init,
+    .instance_init =3D shakti_c_soc_instance_init,
+    .instance_size =3D sizeof(ShaktiCSoCState),
+};
+
+static void shakti_c_type_info_register(void)
+{
+    type_register_static(&shakti_c_type_info);
+}
+type_init(shakti_c_type_info_register)
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
new file mode 100644
index 0000000000..6c66a160f5
--- /dev/null
+++ b/include/hw/riscv/shakti_c.h
@@ -0,0 +1,74 @@
+/*
+ * Shakti C-class SoC emulation
+ *
+ * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along=
 with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SHAKTI_H
+#define HW_SHAKTI_H
+
+#include "hw/riscv/riscv_hart.h"
+#include "hw/boards.h"
+
+#define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
+#define RISCV_SHAKTI_SOC(obj) \
+    OBJECT_CHECK(ShaktiCSoCState, (obj), TYPE_RISCV_SHAKTI_SOC)
+
+typedef struct ShaktiCSoCState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    RISCVHartArrayState cpus;
+    DeviceState *plic;
+    MemoryRegion rom;
+
+} ShaktiCSoCState;
+
+#define TYPE_RISCV_SHAKTI_MACHINE MACHINE_TYPE_NAME("shakti_c")
+#define RISCV_SHAKTI_MACHINE(obj) \
+    OBJECT_CHECK(ShaktiCMachineState, (obj), TYPE_RISCV_SHAKTI_MACHINE)
+typedef struct ShaktiCMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+
+    /*< public >*/
+    ShaktiCSoCState soc;
+} ShaktiCMachineState;
+
+enum {
+    SHAKTI_C_ROM,
+    SHAKTI_C_RAM,
+    SHAKTI_C_UART,
+    SHAKTI_C_GPIO,
+    SHAKTI_C_PLIC,
+    SHAKTI_C_CLINT,
+    SHAKTI_C_DEBUG,
+    SHAKTI_C_I2C,
+};
+
+#define SHAKTI_C_PLIC_HART_CONFIG "MS"
+/* Including Interrupt ID 0 (no interrupt)*/
+#define SHAKTI_C_PLIC_NUM_SOURCES 28
+/* Excluding Priority 0 */
+#define SHAKTI_C_PLIC_NUM_PRIORITIES 2
+#define SHAKTI_C_PLIC_PRIORITY_BASE 0x04
+#define SHAKTI_C_PLIC_PENDING_BASE 0x1000
+#define SHAKTI_C_PLIC_ENABLE_BASE 0x2000
+#define SHAKTI_C_PLIC_ENABLE_STRIDE 0x80
+#define SHAKTI_C_PLIC_CONTEXT_BASE 0x200000
+#define SHAKTI_C_PLIC_CONTEXT_STRIDE 0x1000
+
+#endif
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2a990f6253..618d203aa0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -159,6 +159,14 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, RV64);
 }
=20
+static void rv64_shakti_c_cpu_init(Object *obj)
+{
+    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_resetvec(env, DEFAULT_RSTVEC);
+}
+
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
@@ -707,6 +715,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_shakti_c_cpu_init),
 #endif
 };
=20
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a2..ebbf15fb1c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -38,6 +38,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex"=
)
+#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
--=20
2.25.1



