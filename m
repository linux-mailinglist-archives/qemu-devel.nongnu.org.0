Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E6E4B0E39
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 14:16:10 +0100 (CET)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI9Iv-0006oa-4r
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 08:16:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eT-0002Pm-0V
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:21 -0500
Received: from [2607:f8b0:4864:20::1033] (port=52046
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8eQ-0004w0-9I
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:34:20 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y9so5037626pjf.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ES/oQ6LuXIqEXT43TcR4h4A2W/oUZn4E/6n2qRbF8aU=;
 b=HDr3B6Tvqsgyg6KjrU3Zw2E1agSaRONez0ORsy43JfjzsqlC2nk3lnvxRbUAFfgtAR
 ptaPIdIEeqgPTeqqEhVKAx83QFpyo4OsVP1/rQtrUJes5wQw4jVDwzgWGe7tQJSSzSzh
 zDsRuvQKEv5XMNwbm0drx0tvT5BuLmJcDlK6Y4HNlZDfsFJ8gJN4mktNIOMxZUYlaB0w
 ikoZsUuFOkMPQuJNBOIbOWDttfSjlPQA9MWEr2ynNRGU/N1IU2uUDyogpSogs8oJgGn8
 AZM1K2xdh1pumY3NicsMBTqx1wyiWmttC0VRdH67gSaCT9GoKZhG/GfXDG4YIFdzXEXM
 dAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ES/oQ6LuXIqEXT43TcR4h4A2W/oUZn4E/6n2qRbF8aU=;
 b=Vu3QJ2l+BGPdEGRFBUX1ms1Z+XWg6b24APmoO/ikJM4NL0IBZ41yVgvG8rCkpjFWBl
 /UcZ7+s1p+KRiLWwdPg01BhQ2vCvY0iP+cUIYXBByV3lsAdH97DL+pp6TYhY/gizzvbJ
 WSnKqf1UrpDwGrOGnvGMkxyQIRz8VBSv88OVLBRobLdexyFCx0agDScpyzh/Ql1wKfHq
 ftTwQ3oM0R9jOgL9s/XwCRnCxlWRWlzvewBmbNK86cO907+ccMfye0RvY2PeHpcz+bzr
 nMwxDSlnGorYNBXryi1evlKSFBxkrMo1ilbkyawvy8SZwbtPwNTdAJ/Ii50pkx+V0+f3
 0TNA==
X-Gm-Message-State: AOAM530HTRrpnDvZiLirqsEY15FS6IC2E6nPEzUNZmCWjuz94hQYGSff
 mYmeRN9LYTvpGcc1bZhH5j46yDgyidYpN0ok
X-Google-Smtp-Source: ABdhPJyMl3fYKdsNscVPHHFMoi7ucFBzIZ5GkP8adOGcwIWMnG6BSB4L/UO6vled4g/thRlKyq9vkg==
X-Received: by 2002:a17:902:e84f:: with SMTP id
 t15mr7334579plg.102.1644496456584; 
 Thu, 10 Feb 2022 04:34:16 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id 16sm4942368pgz.76.2022.02.10.04.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:34:15 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/4] hw/openrisc/openrisc_sim;
 Add support for loading a device tree
Date: Thu, 10 Feb 2022 21:34:02 +0900
Message-Id: <20220210123403.2059926-4-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210123403.2059926-1-shorne@gmail.com>
References: <20220210123403.2059926-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the device tree means that qemu can now directly tell
the kernel what hardware is configured rather than use having
to maintain and update a separate device tree file.

This patch adds device tree support for the OpenRISC simulator.
A device tree is built up based on the state of the configure
openrisc simulator.

This is then dumped to memory and the load address is passed to the
kernel in register r3.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 configs/targets/or1k-softmmu.mak |   1 +
 hw/openrisc/openrisc_sim.c       | 159 ++++++++++++++++++++++++++++++-
 2 files changed, 156 insertions(+), 4 deletions(-)

diff --git a/configs/targets/or1k-softmmu.mak b/configs/targets/or1k-softmmu.mak
index 1dfb93e46d..9e1d4a1fb1 100644
--- a/configs/targets/or1k-softmmu.mak
+++ b/configs/targets/or1k-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=openrisc
 TARGET_WORDS_BIGENDIAN=y
+TARGET_NEED_FDT=y
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index d12b3e0c5e..d7c26af82c 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -29,14 +29,20 @@
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
 
+#define OR1KSIM_CLK_MHZ 20000000
+
 #define TYPE_OR1KSIM_MACHINE MACHINE_TYPE_NAME("or1k-sim")
 #define OR1KSIM_MACHINE(obj) \
     OBJECT_CHECK(Or1ksimState, (obj), TYPE_OR1KSIM_MACHINE)
@@ -46,6 +52,8 @@ typedef struct Or1ksimState {
     MachineState parent_obj;
 
     /*< public >*/
+    void *fdt;
+    int fdt_size;
 
 } Or1ksimState;
 
@@ -74,6 +82,7 @@ static const struct MemmapEntry {
 
 static struct openrisc_boot_info {
     uint32_t bootstrap_pc;
+    uint32_t fdt_addr;
 } boot_info;
 
 static void main_cpu_reset(void *opaque)
@@ -84,6 +93,7 @@ static void main_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 
     cpu_set_pc(cs, boot_info.bootstrap_pc);
+    cpu_set_gpr(&cpu->env, 3, boot_info.fdt_addr);
 }
 
 static qemu_irq get_cpu_irq(OpenRISCCPU *cpus[], int cpunum, int irq_pin)
@@ -137,26 +147,29 @@ static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
     sysbus_mmio_map(s, 0, base);
 }
 
-static void openrisc_load_kernel(ram_addr_t ram_size,
+static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
                                  const char *kernel_filename)
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
@@ -168,7 +181,139 @@ static void openrisc_load_kernel(ram_addr_t ram_size,
             exit(1);
         }
         boot_info.bootstrap_pc = entry;
+
+        return high_addr;
+    }
+    return 0;
+}
+
+static uint32_t openrisc_load_fdt(Or1ksimState *s, hwaddr load_start,
+    uint64_t mem_size)
+{
+    uint32_t fdt_addr;
+    int fdtsize = fdt_totalsize(s->fdt);
+
+    if (fdtsize <= 0) {
+        error_report("invalid device-tree");
+        exit(1);
+    }
+
+    /* We should put fdt right after the kernel */
+    fdt_addr = ROUND_UP(load_start, 4);
+
+    fdt_pack(s->fdt);
+    /* copy in the device tree */
+    qemu_fdt_dumpdtb(s->fdt, fdtsize);
+
+    rom_add_blob_fixed_as("fdt", s->fdt, fdtsize, fdt_addr,
+                          &address_space_memory);
+
+    return fdt_addr;
+}
+
+static void openrisc_create_fdt(Or1ksimState *s,
+    const struct MemmapEntry *memmap, int num_cpus, uint64_t mem_size,
+    const char *cmdline)
+{
+    void *fdt;
+    int cpu;
+    char *nodename;
+    int pic_ph;
+
+    fdt = s->fdt = create_device_tree(&s->fdt_size);
+    if (!fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    qemu_fdt_setprop_string(fdt, "/", "compatible", "opencores,or1ksim");
+    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x1);
+    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x1);
+
+    nodename = g_strdup_printf("/memory@%lx",
+                               (long)memmap[OR1KSIM_DRAM].base);
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
+    if (num_cpus > 0) {
+        nodename = g_strdup_printf("/ompic@%lx",
+                                   (long)memmap[OR1KSIM_OMPIC].base);
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "compatible", "openrisc,ompic");
+        qemu_fdt_setprop_cells(fdt, nodename, "reg",
+                               memmap[OR1KSIM_OMPIC].base,
+                               memmap[OR1KSIM_OMPIC].size);
+        qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 0);
+        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_OMPIC_IRQ);
+        g_free(nodename);
     }
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
+    if (nd_table[0].used) {
+        nodename = g_strdup_printf("/ethoc@%lx",
+                                   (long)memmap[OR1KSIM_ETHOC].base);
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "compatible", "opencores,ethoc");
+        qemu_fdt_setprop_cells(fdt, nodename, "reg",
+                               memmap[OR1KSIM_ETHOC].base,
+                               memmap[OR1KSIM_ETHOC].size);
+        qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_ETHOC_IRQ);
+        qemu_fdt_setprop(fdt, nodename, "big-endian", NULL, 0);
+
+        qemu_fdt_add_subnode(fdt, "/aliases");
+        qemu_fdt_setprop_string(fdt, "/aliases", "enet0", nodename);
+        g_free(nodename);
+    }
+
+    nodename = g_strdup_printf("/serial@%lx",
+                               (long)memmap[OR1KSIM_UART].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+                           memmap[OR1KSIM_UART].base,
+                           memmap[OR1KSIM_UART].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", OR1KSIM_UART_IRQ);
+    qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency", OR1KSIM_CLK_MHZ);
+    qemu_fdt_setprop(fdt, nodename, "big-endian", NULL, 0);
+
+    qemu_fdt_add_subnode(fdt, "/chosen");
+    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
+    if (cmdline) {
+        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
+    }
+
+    qemu_fdt_setprop_string(fdt, "/aliases", "uart0", nodename);
+
+    g_free(nodename);
 }
 
 static void openrisc_sim_init(MachineState *machine)
@@ -176,7 +321,9 @@ static void openrisc_sim_init(MachineState *machine)
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     OpenRISCCPU *cpus[2] = {};
+    Or1ksimState *s = OR1KSIM_MACHINE(machine);
     MemoryRegion *ram;
+    hwaddr load_addr;
     qemu_irq serial_irq;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
@@ -218,7 +365,11 @@ static void openrisc_sim_init(MachineState *machine)
     serial_mm_init(get_system_memory(), or1ksim_memmap[OR1KSIM_UART].base, 0,
                    serial_irq, 115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
 
-    openrisc_load_kernel(ram_size, kernel_filename);
+    openrisc_create_fdt(s, or1ksim_memmap, smp_cpus, machine->ram_size,
+                        machine->kernel_cmdline);
+
+    load_addr = openrisc_load_kernel(ram_size, kernel_filename);
+    boot_info.fdt_addr = openrisc_load_fdt(s, load_addr, machine->ram_size);
 }
 
 static void openrisc_sim_machine_init(ObjectClass *oc, void *data)
-- 
2.31.1


