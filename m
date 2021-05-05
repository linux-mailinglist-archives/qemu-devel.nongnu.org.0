Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50761374BEB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:31:10 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQyz-0001SS-Bp
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrj-0007E4-Lk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:40 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrg-0000B0-Ql
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257016; x=1651793016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nxu0r0XsFGA7H51yhFs7iNQYKGExqeeJWDVb2S/WE5k=;
 b=Dv6W62s81U4by2uLbWtK64ySrY4Two7RZYI46/xojEDyusXpNE8nSgRq
 FNYuk7vQzPvsKXx+Bu7weH6GxkH4WRmRLzi+Nu9+X8S54rZKtSHOwtp+B
 zUfn6JEgu39UVDWXYzJFA7uIw7p5wtMzMyikPo6ga0ArpeOSCGYvwDFrj
 usriZInjXEOJWIica/TXP0UQ/AOCd/YqKw5ZB5sQNCuh6xaZXu9T7+sSb
 p3tgmwRUQTUWzfW1XBgCiRrvlNM1VMdVssN76PS830osugZ1z3qieqwUu
 tzRMNkwgChM0G5yDd/pzCqafWlaAQG/XJcofqKCSml0bxfwcrDxFWesSX A==;
IronPort-SDR: FiU/huUghAGDw9atwWzOdsMKMW8PzlIP8t5xguxOLnSue2k0PrqMNzJ03WdPV1G1EUnvTDXKBM
 7YhVBA1g1tQIy87FHysB+i4eVAPHhgz7M4QdcJ9lMhXTT1D31L81bk8XAEnDHo+4JUhzq64TXs
 OzxcNQN7LAxRcRfo4G1HkMY4kf27HAymeyw4A+tVQcyvC6NfzdsFNSNY+NeGO44rbTMoOzGXlo
 /jMqzoljVuwU1ETLu2/dDAg+cNCzNc0y9bGLSFvPaenej5qfQ4Vlzttk59ZYksrRBWQC+SFAPZ
 Tj4=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356872"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:35 +0800
IronPort-SDR: b6hT5HkeFbc/RecN7+Hv0hBIV+vk4lZt7Bk1Fw2ikqRRj4F/zkdVQGwJXVZ4r67P62hgHicoh0
 SpKQ02fuKW6kr5peNnUc0U7+dDoR3KplFpNqbo5cBF/NqNXNp0Ddkcb0lcwe6DkfoisOgqRZBD
 AjY95gqvi1prS6A1W7t1WYLzXTEOI9eyAlZjFivFwlaCA4/5lSCaoFaOS8Qmwci7DrX/PMJeqw
 XDlvrCnChUnPOjgijFoFieTLv5J1J2iiZESfc4wzy5lc+Z5o1ZCsAgEwCmuA3SX0YO6FILqCug
 p8o1I9u13do5K2MsnEER9dzq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:16 -0700
IronPort-SDR: j38n1gM3k7xvZrmbp1WA3Jux1XfFjCL4eOtqlM53XY4Twm8wIKueGB0fKehzr3JwVpIWpGiOj9
 Tv2qwy9rRKUS/GCnzKSXal7WwigBxZqwqvPQb9VoB28EC491AIYJ5/4gX8cYU68XlFuSud/o6G
 A3nnp1c2pg/bG7VjGU0GwmXlAQDa+SnVcNQRR/BkdgVrlUSA2OPE8QaVAWO71D7J+Phq48SlP1
 asS2ranH8a7ooGs553wXc2/LunAXzGRuES2aNdV0UTI4roOVGXXgnFFR4h0ufIFsUh3mK3tyBA
 2f8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 06/42] riscv: Add initial support for Shakti C machine
Date: Thu,  6 May 2021 09:22:36 +1000
Message-Id: <20210505232312.4175486-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Add support for emulating Shakti reference platform based on C-class
running on arty-100T board.

https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/README.rst

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-3-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 default-configs/devices/riscv64-softmmu.mak |   1 +
 include/hw/riscv/shakti_c.h                 |  73 +++++++++
 hw/riscv/shakti_c.c                         | 170 ++++++++++++++++++++
 MAINTAINERS                                 |   7 +
 hw/riscv/Kconfig                            |  10 ++
 hw/riscv/meson.build                        |   1 +
 6 files changed, 262 insertions(+)
 create mode 100644 include/hw/riscv/shakti_c.h
 create mode 100644 hw/riscv/shakti_c.c

diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index d5eec75f05..bc69301fa4 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -13,3 +13,4 @@ CONFIG_SIFIVE_E=y
 CONFIG_SIFIVE_U=y
 CONFIG_RISCV_VIRT=y
 CONFIG_MICROCHIP_PFSOC=y
+CONFIG_SHAKTI_C=y
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
new file mode 100644
index 0000000000..8ffc2b0213
--- /dev/null
+++ b/include/hw/riscv/shakti_c.h
@@ -0,0 +1,73 @@
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
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
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
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
new file mode 100644
index 0000000000..c8205d3f22
--- /dev/null
+++ b/hw/riscv/shakti_c.c
@@ -0,0 +1,170 @@
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
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
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
+
+static const struct MemmapEntry {
+    hwaddr base;
+    hwaddr size;
+} shakti_c_memmap[] = {
+    [SHAKTI_C_ROM]   =  {  0x00001000,  0x2000   },
+    [SHAKTI_C_RAM]   =  {  0x80000000,  0x0      },
+    [SHAKTI_C_UART]  =  {  0x00011300,  0x00040  },
+    [SHAKTI_C_GPIO]  =  {  0x020d0000,  0x00100  },
+    [SHAKTI_C_PLIC]  =  {  0x0c000000,  0x20000  },
+    [SHAKTI_C_CLINT] =  {  0x02000000,  0xc0000  },
+    [SHAKTI_C_I2C]   =  {  0x20c00000,  0x00100  },
+};
+
+static void shakti_c_machine_state_init(MachineState *mstate)
+{
+    ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
+
+    /* Allow only Shakti C CPU for this platform */
+    if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {
+        error_report("This board can only be used with Shakti C CPU");
+        exit(1);
+    }
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
+    riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
+                              shakti_c_memmap[SHAKTI_C_RAM].base,
+                              shakti_c_memmap[SHAKTI_C_ROM].base,
+                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0,
+                              NULL);
+    riscv_load_firmware(mstate->firmware, shakti_c_memmap[SHAKTI_C_RAM].base,
+                        NULL);
+}
+
+static void shakti_c_machine_instance_init(Object *obj)
+{
+}
+
+static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(klass);
+    mc->desc = "RISC-V Board compatible with Shakti SDK";
+    mc->init = shakti_c_machine_state_init;
+    mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+}
+
+static const TypeInfo shakti_c_machine_type_info = {
+    .name = TYPE_RISCV_SHAKTI_MACHINE,
+    .parent = TYPE_MACHINE,
+    .class_init = shakti_c_machine_class_init,
+    .instance_init = shakti_c_machine_instance_init,
+    .instance_size = sizeof(ShaktiCMachineState),
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
+    ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(dev);
+    MemoryRegion *system_memory = get_system_memory();
+
+    sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
+
+    sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
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
+
+    sifive_clint_create(shakti_c_memmap[SHAKTI_C_CLINT].base,
+        shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1,
+        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+
+    /* ROM */
+    memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
+                           shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+        shakti_c_memmap[SHAKTI_C_ROM].base, &sss->rom);
+}
+
+static void shakti_c_soc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = shakti_c_soc_state_realize;
+}
+
+static void shakti_c_soc_instance_init(Object *obj)
+{
+    ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj);
+
+    object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY);
+
+    /*
+     * CPU type is fixed and we are not supporting passing from commandline yet.
+     * So let it be in instance_init. When supported should use ms->cpu_type
+     * instead of TYPE_RISCV_CPU_SHAKTI_C
+     */
+    object_property_set_str(OBJECT(&sss->cpus), "cpu-type",
+                            TYPE_RISCV_CPU_SHAKTI_C, &error_abort);
+    object_property_set_int(OBJECT(&sss->cpus), "num-harts", 1,
+                            &error_abort);
+}
+
+static const TypeInfo shakti_c_type_info = {
+    .name = TYPE_RISCV_SHAKTI_SOC,
+    .parent = TYPE_DEVICE,
+    .class_init = shakti_c_soc_class_init,
+    .instance_init = shakti_c_soc_instance_init,
+    .instance_size = sizeof(ShaktiCSoCState),
+};
+
+static void shakti_c_type_info_register(void)
+{
+    type_register_static(&shakti_c_type_info);
+}
+type_init(shakti_c_type_info_register)
diff --git a/MAINTAINERS b/MAINTAINERS
index 6c5b5693a8..1b0386d25c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1394,6 +1394,13 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
 F: include/hw/misc/mchp_pfsoc_ioscb.h
 F: include/hw/misc/mchp_pfsoc_sysreg.h
 
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
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 1de18cdcf1..a0225716b5 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,16 @@ config OPENTITAN
     select IBEX
     select UNIMP
 
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
-- 
2.31.1


