Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741434C41B3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:45:34 +0100 (CET)
Received: from localhost ([::1]:55354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXAL-00053M-0K
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:45:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1z-0004cv-0a
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:53 -0500
Received: from [2607:f8b0:4864:20::1035] (port=55182
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1w-0002vt-58
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:50 -0500
Received: by mail-pj1-x1035.google.com with SMTP id b8so4182178pjb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 00:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6bYxsAh3+guLnp4fMGAdftsYRKJtOjCH26W44rqWsE=;
 b=q3bOQxP+c0RXVhmLsGaTM3IPSxX7ZJ6Yx7GxEEc76BNT6knNHFKaO2kmej4itIP3Q8
 9r7obgZPcf7dz0vdaQ2IfkSrvfbJou7cPVHgPKpGHZUzTyLMT3Ala+sH2QIjWqrCnZSw
 GVbUHZwJVPIJqBHBwtwPd4NqtYuMd5cehSAOtHkrJeD4Gyi9XmnM/u1c86B0/biu9JAK
 wntpvV8e8z1vGEQgwpWdZUMT1V0ZfWo4mrZcE7BEBIuMuiO24FKLt8CSZ/6XMkIe+Ifg
 Oyqv8QHbJQQ3st1vGgg98gyIQ3YiRi69pbfk88ODFI5N9wLEzEqFt+iCMfdyE726Z/1B
 9NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6bYxsAh3+guLnp4fMGAdftsYRKJtOjCH26W44rqWsE=;
 b=HnlTkpVp6gY8+HEhPXnfot9W2IKQ+JjfjS05lzK+caG/MUtbNfgE4HIPxMi2hT8Aeb
 z2ldboXzButu0+xs0V3x9I+iipg8R54KUkl6p9iyfXUqa0xrW3Nb4ROish/7aGRWGib/
 NVxaoL5nbV8aBFcST5IHVRYa2wdnN/7XdagtHAJRrweT44+mkWiueMYFaHWVjx6kQfpt
 4nSpIumPQzPEER0TdVZrv49MtEsWxy2HXBk7RuXQat2Ok5I1l1ll8jpBPF1gL5Ax1cRE
 CY1VDQ8qfiwTE4l2LwQ0uG28qVCNjsSBvb4Va8nz5xy2+lLJgTopJqJUJSjRskylyOBx
 Teow==
X-Gm-Message-State: AOAM530wLWiadZXsEW5T5uFbPq4bAQpC+e2GH39Wrr+a2q+61e8ekFYJ
 K94nyBxVYvZqRaJJBzfJFA+SWARO7zy3XiJ9
X-Google-Smtp-Source: ABdhPJwBu/Llboq1ePh5rxZvBRmcW1g+7RW1VvNOAfMT9g/S5lrJYJ+1KYFQcrEL0ScyjwrYm5gW4w==
X-Received: by 2002:a17:90b:3ce:b0:1bc:7783:4ce0 with SMTP id
 go14-20020a17090b03ce00b001bc77834ce0mr2142653pjb.60.1645777966216; 
 Fri, 25 Feb 2022 00:32:46 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a63fa45000000b0037407b6ffdasm1891405pgk.5.2022.02.25.00.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:32:45 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL 5/6] hw/openrisc/openrisc_sim: Add automatic device tree
 generation
Date: Fri, 25 Feb 2022 17:32:21 +0900
Message-Id: <20220225083222.1174517-6-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225083222.1174517-1-shorne@gmail.com>
References: <20220225083222.1174517-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the device tree means that qemu can now directly tell
the kernel what hardware is configured rather than use having
to maintain and update a separate device tree file.

This patch adds automatic device tree generation support for the
OpenRISC simulator.  A device tree is built up based on the state of the
configure openrisc simulator.

This is then dumped to memory and the load address is passed to the
kernel in register r3.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 configs/targets/or1k-softmmu.mak |   1 +
 hw/openrisc/openrisc_sim.c       | 189 ++++++++++++++++++++++++++++---
 2 files changed, 175 insertions(+), 15 deletions(-)

diff --git a/configs/targets/or1k-softmmu.mak b/configs/targets/or1k-softmmu.mak
index 1dfb93e46d..9e1d4a1fb1 100644
--- a/configs/targets/or1k-softmmu.mak
+++ b/configs/targets/or1k-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=openrisc
 TARGET_WORDS_BIGENDIAN=y
+TARGET_NEED_FDT=y
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 8cfb92bec6..e0e71c0faa 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -29,15 +29,20 @@
 #include "net/net.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
+#include "exec/address-spaces.h"
+#include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "hw/core/split-irq.h"
 
+#include <libfdt.h>
+
 #define KERNEL_LOAD_ADDR 0x100
 
 #define OR1KSIM_CPUS_MAX 4
+#define OR1KSIM_CLK_MHZ 20000000
 
 #define TYPE_OR1KSIM_MACHINE MACHINE_TYPE_NAME("or1k-sim")
 #define OR1KSIM_MACHINE(obj) \
@@ -48,6 +53,8 @@ typedef struct Or1ksimState {
     MachineState parent_obj;
 
     /*< public >*/
+    void *fdt;
+    int fdt_size;
 
 } Or1ksimState;
 
@@ -76,6 +83,7 @@ static const struct MemmapEntry {
 
 static struct openrisc_boot_info {
     uint32_t bootstrap_pc;
+    uint32_t fdt_addr;
 } boot_info;
 
 static void main_cpu_reset(void *opaque)
@@ -86,6 +94,7 @@ static void main_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 
     cpu_set_pc(cs, boot_info.bootstrap_pc);
+    cpu_set_gpr(&cpu->env, 3, boot_info.fdt_addr);
 }
 
 static qemu_irq get_cpu_irq(OpenRISCCPU *cpus[], int cpunum, int irq_pin)
@@ -93,12 +102,77 @@ static qemu_irq get_cpu_irq(OpenRISCCPU *cpus[], int cpunum, int irq_pin)
     return qdev_get_gpio_in_named(DEVICE(cpus[cpunum]), "IRQ", irq_pin);
 }
 
-static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
+static void openrisc_create_fdt(Or1ksimState *state,
+                                const struct MemmapEntry *memmap,
+                                int num_cpus, uint64_t mem_size,
+                                const char *cmdline)
+{
+    void *fdt;
+    int cpu;
+    char *nodename;
+    int pic_ph;
+
+    fdt = state->fdt = create_device_tree(&state->fdt_size);
+    if (!fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    qemu_fdt_setprop_string(fdt, "/", "compatible", "opencores,or1ksim");
+    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x1);
+    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x1);
+
+    nodename = g_strdup_printf("/memory@%" HWADDR_PRIx,
+                               memmap[OR1KSIM_DRAM].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+                           memmap[OR1KSIM_DRAM].base, mem_size);
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+    g_free(nodename);
+
+    qemu_fdt_add_subnode(fdt, "/cpus");
+    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
+
+    for (cpu = 0; cpu < num_cpus; cpu++) {
+        nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "compatible",
+                                "opencores,or1200-rtlsvn481");
+        qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
+        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
+                              OR1KSIM_CLK_MHZ);
+        g_free(nodename);
+    }
+
+    nodename = (char *)"/pic";
+    qemu_fdt_add_subnode(fdt, nodename);
+    pic_ph = qemu_fdt_alloc_phandle(fdt);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+                            "opencores,or1k-pic-level");
+    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
+    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", pic_ph);
+
+    qemu_fdt_setprop_cell(fdt, "/", "interrupt-parent", pic_ph);
+
+    qemu_fdt_add_subnode(fdt, "/chosen");
+    if (cmdline) {
+        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
+    }
+
+    /* Create aliases node for use by devices. */
+    qemu_fdt_add_subnode(fdt, "/aliases");
+}
+
+static void openrisc_sim_net_init(Or1ksimState *state, hwaddr base, hwaddr size,
                                   int num_cpus, OpenRISCCPU *cpus[],
                                   int irq_pin, NICInfo *nd)
 {
+    void *fdt = state->fdt;
     DeviceState *dev;
     SysBusDevice *s;
+    char *nodename;
     int i;
 
     dev = qdev_new("open_eth");
@@ -118,14 +192,28 @@ static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
         sysbus_connect_irq(s, 0, get_cpu_irq(cpus, 0, irq_pin));
     }
     sysbus_mmio_map(s, 0, base);
-    sysbus_mmio_map(s, 1, descriptors);
+    sysbus_mmio_map(s, 1, base + 0x400);
+
+    /* Init device tree node for ethoc. */
+    nodename = g_strdup_printf("/ethoc@%" HWADDR_PRIx, base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "opencores,ethoc");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg", base, size);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", irq_pin);
+    qemu_fdt_setprop(fdt, nodename, "big-endian", NULL, 0);
+
+    qemu_fdt_setprop_string(fdt, "/aliases", "enet0", nodename);
+    g_free(nodename);
 }
 
-static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
+static void openrisc_sim_ompic_init(Or1ksimState *state, hwaddr base,
+                                    hwaddr size, int num_cpus,
                                     OpenRISCCPU *cpus[], int irq_pin)
 {
+    void *fdt = state->fdt;
     DeviceState *dev;
     SysBusDevice *s;
+    char *nodename;
     int i;
 
     dev = qdev_new("or1k-ompic");
@@ -137,11 +225,24 @@ static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
         sysbus_connect_irq(s, i, get_cpu_irq(cpus, i, irq_pin));
     }
     sysbus_mmio_map(s, 0, base);
+
+    /* Add device tree node for ompic. */
+    nodename = g_strdup_printf("/ompic@%" HWADDR_PRIx, base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "openrisc,ompic");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg", base, size);
+    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", irq_pin);
+    g_free(nodename);
 }
 
-static void openrisc_sim_serial_init(hwaddr base, int num_cpus,
+static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
+                                     hwaddr size, int num_cpus,
                                      OpenRISCCPU *cpus[], int irq_pin)
 {
+    void *fdt = state->fdt;
+    char *nodename;
     qemu_irq serial_irq;
     int i;
 
@@ -158,29 +259,45 @@ static void openrisc_sim_serial_init(hwaddr base, int num_cpus,
     }
     serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
                    serial_hd(0), DEVICE_NATIVE_ENDIAN);
-}
 
+    /* Add device tree node for serial. */
+    nodename = g_strdup_printf("/serial@%" HWADDR_PRIx, base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg", base, size);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", irq_pin);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", OR1KSIM_CLK_MHZ);
+    qemu_fdt_setprop(fdt, nodename, "big-endian", NULL, 0);
+
+    /* The /chosen node is created during fdt creation. */
+    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
+    qemu_fdt_setprop_string(fdt, "/aliases", "uart0", nodename);
+    g_free(nodename);
+}
 
-static void openrisc_load_kernel(ram_addr_t ram_size,
-                                 const char *kernel_filename)
+static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
+                                   const char *kernel_filename)
 {
     long kernel_size;
     uint64_t elf_entry;
+    uint64_t high_addr;
     hwaddr entry;
 
     if (kernel_filename && !qtest_enabled()) {
         kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
-                               &elf_entry, NULL, NULL, NULL, 1, EM_OPENRISC,
-                               1, 0);
+                               &elf_entry, NULL, &high_addr, NULL, 1,
+                               EM_OPENRISC, 1, 0);
         entry = elf_entry;
         if (kernel_size < 0) {
             kernel_size = load_uimage(kernel_filename,
                                       &entry, NULL, NULL, NULL, NULL);
+            high_addr = entry + kernel_size;
         }
         if (kernel_size < 0) {
             kernel_size = load_image_targphys(kernel_filename,
                                               KERNEL_LOAD_ADDR,
                                               ram_size - KERNEL_LOAD_ADDR);
+            high_addr = KERNEL_LOAD_ADDR + kernel_size;
         }
 
         if (entry <= 0) {
@@ -192,7 +309,38 @@ static void openrisc_load_kernel(ram_addr_t ram_size,
             exit(1);
         }
         boot_info.bootstrap_pc = entry;
+
+        return high_addr;
     }
+    return 0;
+}
+
+static uint32_t openrisc_load_fdt(Or1ksimState *state, hwaddr load_start,
+                                  uint64_t mem_size)
+{
+    void *fdt = state->fdt;
+    uint32_t fdt_addr;
+    int ret;
+    int fdtsize = fdt_totalsize(fdt);
+
+    if (fdtsize <= 0) {
+        error_report("invalid device-tree");
+        exit(1);
+    }
+
+    /* We put fdt right after the kernel and/or initrd. */
+    fdt_addr = ROUND_UP(load_start, 4);
+
+    ret = fdt_pack(fdt);
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
+    /* copy in the device tree */
+    qemu_fdt_dumpdtb(fdt, fdtsize);
+
+    rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
+                          &address_space_memory);
+
+    return fdt_addr;
 }
 
 static void openrisc_sim_init(MachineState *machine)
@@ -200,7 +348,9 @@ static void openrisc_sim_init(MachineState *machine)
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     OpenRISCCPU *cpus[OR1KSIM_CPUS_MAX] = {};
+    Or1ksimState *state = OR1KSIM_MACHINE(machine);
     MemoryRegion *ram;
+    hwaddr load_addr;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
@@ -221,22 +371,31 @@ static void openrisc_sim_init(MachineState *machine)
     memory_region_init_ram(ram, NULL, "openrisc.ram", ram_size, &error_fatal);
     memory_region_add_subregion(get_system_memory(), 0, ram);
 
+    openrisc_create_fdt(state, or1ksim_memmap, smp_cpus, machine->ram_size,
+                        machine->kernel_cmdline);
+
     if (nd_table[0].used) {
-        openrisc_sim_net_init(or1ksim_memmap[OR1KSIM_ETHOC].base,
-                              or1ksim_memmap[OR1KSIM_ETHOC].base + 0x400,
+        openrisc_sim_net_init(state, or1ksim_memmap[OR1KSIM_ETHOC].base,
+                              or1ksim_memmap[OR1KSIM_ETHOC].size,
                               smp_cpus, cpus,
                               OR1KSIM_ETHOC_IRQ, nd_table);
     }
 
     if (smp_cpus > 1) {
-        openrisc_sim_ompic_init(or1ksim_memmap[OR1KSIM_OMPIC].base, smp_cpus,
-                                cpus, OR1KSIM_OMPIC_IRQ);
+        openrisc_sim_ompic_init(state, or1ksim_memmap[OR1KSIM_OMPIC].base,
+                                or1ksim_memmap[OR1KSIM_UART].size,
+                                smp_cpus, cpus, OR1KSIM_OMPIC_IRQ);
     }
 
-    openrisc_sim_serial_init(or1ksim_memmap[OR1KSIM_UART].base, smp_cpus, cpus,
+    openrisc_sim_serial_init(state, or1ksim_memmap[OR1KSIM_UART].base,
+                             or1ksim_memmap[OR1KSIM_UART].size, smp_cpus, cpus,
                              OR1KSIM_UART_IRQ);
 
-    openrisc_load_kernel(ram_size, kernel_filename);
+    load_addr = openrisc_load_kernel(ram_size, kernel_filename);
+    if (load_addr > 0) {
+        boot_info.fdt_addr = openrisc_load_fdt(state, load_addr,
+                                               machine->ram_size);
+    }
 }
 
 static void openrisc_sim_machine_init(ObjectClass *oc, void *data)
-- 
2.31.1


