Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05746943C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:49:43 +0100 (CET)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBZ0-0004iQ-OS
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:49:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1muBNH-0001Ei-Bs; Mon, 06 Dec 2021 05:37:35 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1muBNB-0001oL-MH; Mon, 06 Dec 2021 05:37:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B8909D01203F;
 Mon,  6 Dec 2021 11:37:20 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001f1aa82c5-c95c-4caf-84a4-a9dcb4ff58b6,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 11/15] ppc/ppc405: Fix boot from kernel
Date: Mon, 6 Dec 2021 11:37:08 +0100
Message-ID: <20211206103712.1866296-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 10b323f2-b8e1-4973-9895-5937012951f6
X-Ovh-Tracer-Id: 16708354620868103020
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine can already boot with kernel and initrd U-boot images if a
firmware is loaded first. Adapt and improve the load sequence to let
the machine boot directly from a Linux kernel ELF image and a usual
initrd image if a firmware image is not provided. For that, install a
custom CPU reset handler to setup the registers and to start the CPU
from the Linux kernel entry point.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 145 +++++++++++++++++++++++++++++------------
 1 file changed, 102 insertions(+), 43 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 71a652e2d846..3ae2b36373a5 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -41,6 +41,7 @@
 #include "qemu/error-report.h"
 #include "hw/loader.h"
 #include "qemu/cutils.h"
+#include "elf.h"
 
 #define BIOS_FILENAME "ppc405_rom.bin"
 #define BIOS_SIZE (2 * MiB)
@@ -136,25 +137,101 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
     qemu_register_reset(&ref405ep_fpga_reset, fpga);
 }
 
+/*
+ * CPU reset handler when booting directly from a loaded kernel
+ */
+static struct boot_info {
+    uint32_t entry;
+    uint32_t bdloc;
+    uint32_t initrd_base;
+    uint32_t initrd_size;
+    uint32_t cmdline_base;
+    uint32_t cmdline_size;
+} boot_info;
+
+static void main_cpu_reset(void *opaque)
+{
+    PowerPCCPU *cpu = opaque;
+    CPUPPCState *env = &cpu->env;
+    struct boot_info *bi = env->load_info;
+
+    cpu_reset(CPU(cpu));
+
+    /* stack: top of sram */
+    env->gpr[1] = PPC405EP_SRAM_BASE + PPC405EP_SRAM_SIZE - 8;
+
+    /* Tune our boot state */
+    env->gpr[3] = bi->bdloc;
+    env->gpr[4] = bi->initrd_base;
+    env->gpr[5] = bi->initrd_base + bi->initrd_size;
+    env->gpr[6] = bi->cmdline_base;
+    env->gpr[7] = bi->cmdline_size;
+
+    env->nip = bi->entry;
+}
+
+static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
+{
+    CPUPPCState *env = &cpu->env;
+    hwaddr boot_entry;
+    hwaddr kernel_base;
+    int kernel_size;
+    hwaddr initrd_base;
+    int initrd_size;
+    ram_addr_t bdloc;
+    int len;
+
+    bdloc = ppc405_set_bootinfo(env, machine->ram_size);
+    boot_info.bdloc = bdloc;
+
+    kernel_size = load_elf(machine->kernel_filename, NULL, NULL, NULL,
+                           &boot_entry, &kernel_base, NULL, NULL,
+                           1, PPC_ELF_MACHINE, 0, 0);
+    if (kernel_size < 0) {
+        error_report("Could not load kernel '%s' : %s",
+                     machine->kernel_filename, load_elf_strerror(kernel_size));
+        exit(1);
+    }
+    boot_info.entry = boot_entry;
+
+    /* load initrd */
+    if (machine->initrd_filename) {
+        initrd_base = INITRD_LOAD_ADDR;
+        initrd_size = load_image_targphys(machine->initrd_filename, initrd_base,
+                                          machine->ram_size - initrd_base);
+        if (initrd_size < 0) {
+            error_report("could not load initial ram disk '%s'",
+                         machine->initrd_filename);
+            exit(1);
+        }
+
+        boot_info.initrd_base = initrd_base;
+        boot_info.initrd_size = initrd_size;
+    }
+
+    if (machine->kernel_cmdline) {
+        len = strlen(machine->kernel_cmdline);
+        bdloc -= ((len + 255) & ~255);
+        cpu_physical_memory_write(bdloc, machine->kernel_cmdline, len + 1);
+        boot_info.cmdline_base = bdloc;
+        boot_info.cmdline_size = bdloc + len;
+    }
+
+    /* Install our custom reset handler to start from Linux */
+    qemu_register_reset(main_cpu_reset, cpu);
+    env->load_info = &boot_info;
+}
+
 static void ref405ep_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
-    const char *initrd_filename = machine->initrd_filename;
     PowerPCCPU *cpu;
-    CPUPPCState *env;
     DeviceState *dev;
     SysBusDevice *s;
     MemoryRegion *sram = g_new(MemoryRegion, 1);
-    ram_addr_t bdloc;
     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
-    long bios_size = -1;
-    target_ulong kernel_base, initrd_base;
-    long kernel_size, initrd_size;
-    int linux_boot;
-    int len;
     MemoryRegion *sysmem = get_system_memory();
     DeviceState *uicdev;
 
@@ -176,7 +253,6 @@ static void ref405ep_init(MachineState *machine)
 
     cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
-    env = &cpu->env;
 
     /* allocate SRAM */
     memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
@@ -187,6 +263,7 @@ static void ref405ep_init(MachineState *machine)
     if (machine->firmware) {
         MemoryRegion *bios = g_new(MemoryRegion, 1);
         g_autofree char *filename;
+        long bios_size;
 
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
                                &error_fatal);
@@ -217,54 +294,36 @@ static void ref405ep_init(MachineState *machine)
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
-    /* Load kernel */
-    linux_boot = (kernel_filename != NULL);
-    if (linux_boot) {
-        bdloc = ppc405_set_bootinfo(env, machine->ram_size);
-        env->gpr[3] = bdloc;
+
+    /* Load kernel and initrd using U-Boot images */
+    if (kernel_filename && machine->firmware) {
+        target_ulong kernel_base, initrd_base;
+        long kernel_size, initrd_size;
+
         kernel_base = KERNEL_LOAD_ADDR;
-        /* now we can load the kernel */
         kernel_size = load_image_targphys(kernel_filename, kernel_base,
                                           machine->ram_size - kernel_base);
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
-        printf("Load kernel size %ld at " TARGET_FMT_lx,
-               kernel_size, kernel_base);
+
         /* load initrd */
-        if (initrd_filename) {
+        if (machine->initrd_filename) {
             initrd_base = INITRD_LOAD_ADDR;
-            initrd_size = load_image_targphys(initrd_filename, initrd_base,
+            initrd_size = load_image_targphys(machine->initrd_filename,
+                                              initrd_base,
                                               machine->ram_size - initrd_base);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
-                             initrd_filename);
+                             machine->initrd_filename);
                 exit(1);
             }
-        } else {
-            initrd_base = 0;
-            initrd_size = 0;
-        }
-        env->gpr[4] = initrd_base;
-        env->gpr[5] = initrd_size;
-        if (kernel_cmdline != NULL) {
-            len = strlen(kernel_cmdline);
-            bdloc -= ((len + 255) & ~255);
-            cpu_physical_memory_write(bdloc, kernel_cmdline, len + 1);
-            env->gpr[6] = bdloc;
-            env->gpr[7] = bdloc + len;
-        } else {
-            env->gpr[6] = 0;
-            env->gpr[7] = 0;
         }
-        env->nip = KERNEL_LOAD_ADDR;
-    } else {
-        kernel_base = 0;
-        kernel_size = 0;
-        initrd_base = 0;
-        initrd_size = 0;
-        bdloc = 0;
+
+    /* Load ELF kernel and rootfs.cpio */
+    } else if (kernel_filename && !machine->firmware) {
+        boot_from_kernel(machine, cpu);
     }
 }
 
-- 
2.31.1


