Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D3A609867
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:02:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omnIH-0004nD-Md; Sun, 23 Oct 2022 22:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Qviv=2Y=zx2c4.com=Jason@kernel.org>)
 id 1omgQ5-00087l-2M
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 15:14:01 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Qviv=2Y=zx2c4.com=Jason@kernel.org>)
 id 1omgQ2-0001qZ-PA
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 15:14:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC04FB80BED;
 Sun, 23 Oct 2022 19:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CC2C433D6;
 Sun, 23 Oct 2022 19:13:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fPfBV1TY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666552433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=J4/QDtb3UAFmP47djUn5l+9R0wUe33djMFE8q6hSzAA=;
 b=fPfBV1TYDRnPWQuwxwNkwzZ6EB4Mi+8UbHuFTGKFkwmeAmrWDXfsXMNX4zCuore04w2W6i
 qErU/QQGXXgN23M0X6oXJcjwZWqUj4iE2Ywx9/au3Inahb/NGOGhfmCTmUNQJ4A8d1aXvR
 X6jU9BJ5ZGhrdbEoPlwe/82W+AjwQaM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b5bfd599
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 23 Oct 2022 19:13:52 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v5] m68k: write bootinfo as rom section and re-randomize on
 reboot
Date: Sun, 23 Oct 2022 21:13:41 +0200
Message-Id: <20221023191340.36238-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=Qviv=2Y=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rather than poking directly into RAM, add the bootinfo block as a proper
ROM, so that it's restored when rebooting the system. This way, if the
guest corrupts any of the bootinfo items, but then tries to reboot,
it'll still be restored back to normal as expected.

Then, since the RNG seed needs to be fresh on each boot, regenerate the
RNG seed in the ROM when reseting the CPU.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Changes v4->v5:
- Use QEMU_ALIGN_PTR_UP.
I'm also okay with v4, if you prefer that instead. I did this just
because Richard mentioned it. But I don't really care, and most other
QEMU code doesn't bother either.

 hw/m68k/bootinfo.h | 48 +++++++++++++++----------------
 hw/m68k/q800.c     | 71 +++++++++++++++++++++++++++++++++-------------
 hw/m68k/virt.c     | 51 +++++++++++++++++++++++----------
 3 files changed, 111 insertions(+), 59 deletions(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index 897162b818..a3d37e3c80 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -12,66 +12,66 @@
 #ifndef HW_M68K_BOOTINFO_H
 #define HW_M68K_BOOTINFO_H
 
-#define BOOTINFO0(as, base, id) \
+#define BOOTINFO0(base, id) \
     do { \
-        stw_phys(as, base, id); \
+        stw_p(base, id); \
         base += 2; \
-        stw_phys(as, base, sizeof(struct bi_record)); \
+        stw_p(base, sizeof(struct bi_record)); \
         base += 2; \
     } while (0)
 
-#define BOOTINFO1(as, base, id, value) \
+#define BOOTINFO1(base, id, value) \
     do { \
-        stw_phys(as, base, id); \
+        stw_p(base, id); \
         base += 2; \
-        stw_phys(as, base, sizeof(struct bi_record) + 4); \
+        stw_p(base, sizeof(struct bi_record) + 4); \
         base += 2; \
-        stl_phys(as, base, value); \
+        stl_p(base, value); \
         base += 4; \
     } while (0)
 
-#define BOOTINFO2(as, base, id, value1, value2) \
+#define BOOTINFO2(base, id, value1, value2) \
     do { \
-        stw_phys(as, base, id); \
+        stw_p(base, id); \
         base += 2; \
-        stw_phys(as, base, sizeof(struct bi_record) + 8); \
+        stw_p(base, sizeof(struct bi_record) + 8); \
         base += 2; \
-        stl_phys(as, base, value1); \
+        stl_p(base, value1); \
         base += 4; \
-        stl_phys(as, base, value2); \
+        stl_p(base, value2); \
         base += 4; \
     } while (0)
 
-#define BOOTINFOSTR(as, base, id, string) \
+#define BOOTINFOSTR(base, id, string) \
     do { \
         int i; \
-        stw_phys(as, base, id); \
+        stw_p(base, id); \
         base += 2; \
-        stw_phys(as, base, \
+        stw_p(base, \
                  (sizeof(struct bi_record) + strlen(string) + \
                   1 /* null termination */ + 3 /* padding */) & ~3); \
         base += 2; \
         for (i = 0; string[i]; i++) { \
-            stb_phys(as, base++, string[i]); \
+            stb_p(base++, string[i]); \
         } \
-        stb_phys(as, base++, 0); \
-        base = (base + 3) & ~3; \
+        stb_p(base++, 0); \
+        base = QEMU_ALIGN_PTR_UP(base, 4); \
     } while (0)
 
-#define BOOTINFODATA(as, base, id, data, len) \
+#define BOOTINFODATA(base, id, data, len) \
     do { \
         int i; \
-        stw_phys(as, base, id); \
+        stw_p(base, id); \
         base += 2; \
-        stw_phys(as, base, \
+        stw_p(base, \
                  (sizeof(struct bi_record) + len + \
                   2 /* length field */ + 3 /* padding */) & ~3); \
         base += 2; \
-        stw_phys(as, base, len); \
+        stw_p(base, len); \
         base += 2; \
         for (i = 0; i < len; ++i) { \
-            stb_phys(as, base++, data[i]); \
+            stb_p(base++, data[i]); \
         } \
-        base = (base + 3) & ~3; \
+        base = QEMU_ALIGN_PTR_UP(base, 4); \
     } while (0)
 #endif
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index a4590c2cb0..e09e244ddc 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -321,11 +321,22 @@ static const TypeInfo glue_info = {
     },
 };
 
+typedef struct {
+    M68kCPU *cpu;
+    struct bi_record *rng_seed;
+} ResetInfo;
+
 static void main_cpu_reset(void *opaque)
 {
-    M68kCPU *cpu = opaque;
+    ResetInfo *reset_info = opaque;
+    M68kCPU *cpu = reset_info->cpu;
     CPUState *cs = CPU(cpu);
 
+    if (reset_info->rng_seed) {
+        qemu_guest_getrandom_nofail((void *)reset_info->rng_seed->data + 2,
+            be16_to_cpu(*(uint16_t *)reset_info->rng_seed->data));
+    }
+
     cpu_reset(cs);
     cpu->env.aregs[7] = ldl_phys(cs->as, 0);
     cpu->env.pc = ldl_phys(cs->as, 4);
@@ -386,6 +397,7 @@ static void q800_init(MachineState *machine)
     NubusBus *nubus;
     DeviceState *glue;
     DriveInfo *dinfo;
+    ResetInfo *reset_info;
     uint8_t rng_seed[32];
 
     linux_boot = (kernel_filename != NULL);
@@ -396,9 +408,12 @@ static void q800_init(MachineState *machine)
         exit(1);
     }
 
+    reset_info = g_new0(ResetInfo, 1);
+
     /* init CPUs */
     cpu = M68K_CPU(cpu_create(machine->cpu_type));
-    qemu_register_reset(main_cpu_reset, cpu);
+    reset_info->cpu = cpu;
+    qemu_register_reset(main_cpu_reset, reset_info);
 
     /* RAM */
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
@@ -598,6 +613,14 @@ static void q800_init(MachineState *machine)
     cs = CPU(cpu);
     if (linux_boot) {
         uint64_t high;
+        void *param_blob, *param_ptr, *param_rng_seed;
+
+        if (kernel_cmdline) {
+            param_blob = g_malloc(strlen(kernel_cmdline) + 1024);
+        } else {
+            param_blob = g_malloc(1024);
+        }
+
         kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
                                &elf_entry, NULL, &high, NULL, 1,
                                EM_68K, 0, 0);
@@ -607,23 +630,24 @@ static void q800_init(MachineState *machine)
         }
         stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
         parameters_base = (high + 1) & ~1;
-
-        BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_MAC);
-        BOOTINFO1(cs->as, parameters_base, BI_FPUTYPE, FPU_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_MMUTYPE, MMU_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_CPUTYPE, CPU_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_CPUID, CPUB_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_MODEL, MAC_MODEL_Q800);
-        BOOTINFO1(cs->as, parameters_base,
+        param_ptr = param_blob;
+
+        BOOTINFO1(param_ptr, BI_MACHTYPE, MACH_MAC);
+        BOOTINFO1(param_ptr, BI_FPUTYPE, FPU_68040);
+        BOOTINFO1(param_ptr, BI_MMUTYPE, MMU_68040);
+        BOOTINFO1(param_ptr, BI_CPUTYPE, CPU_68040);
+        BOOTINFO1(param_ptr, BI_MAC_CPUID, CPUB_68040);
+        BOOTINFO1(param_ptr, BI_MAC_MODEL, MAC_MODEL_Q800);
+        BOOTINFO1(param_ptr,
                   BI_MAC_MEMSIZE, ram_size >> 20); /* in MB */
-        BOOTINFO2(cs->as, parameters_base, BI_MEMCHUNK, 0, ram_size);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VADDR,
+        BOOTINFO2(param_ptr, BI_MEMCHUNK, 0, ram_size);
+        BOOTINFO1(param_ptr, BI_MAC_VADDR,
                   VIDEO_BASE + macfb_mode->offset);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VDEPTH, graphic_depth);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VDIM,
+        BOOTINFO1(param_ptr, BI_MAC_VDEPTH, graphic_depth);
+        BOOTINFO1(param_ptr, BI_MAC_VDIM,
                   (graphic_height << 16) | graphic_width);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VROW, macfb_mode->stride);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_SCCBASE, SCC_BASE);
+        BOOTINFO1(param_ptr, BI_MAC_VROW, macfb_mode->stride);
+        BOOTINFO1(param_ptr, BI_MAC_SCCBASE, SCC_BASE);
 
         rom = g_malloc(sizeof(*rom));
         memory_region_init_ram_ptr(rom, NULL, "m68k_fake_mac.rom",
@@ -632,13 +656,14 @@ static void q800_init(MachineState *machine)
         memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom);
 
         if (kernel_cmdline) {
-            BOOTINFOSTR(cs->as, parameters_base, BI_COMMAND_LINE,
+            BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
                         kernel_cmdline);
         }
 
         /* Pass seed to RNG. */
+        param_rng_seed = param_ptr;
         qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-        BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
+        BOOTINFODATA(param_ptr, BI_RNG_SEED,
                      rng_seed, sizeof(rng_seed));
 
         /* load initrd */
@@ -653,13 +678,19 @@ static void q800_init(MachineState *machine)
             initrd_base = (ram_size - initrd_size) & TARGET_PAGE_MASK;
             load_image_targphys(initrd_filename, initrd_base,
                                 ram_size - initrd_base);
-            BOOTINFO2(cs->as, parameters_base, BI_RAMDISK, initrd_base,
+            BOOTINFO2(param_ptr, BI_RAMDISK, initrd_base,
                       initrd_size);
         } else {
             initrd_base = 0;
             initrd_size = 0;
         }
-        BOOTINFO0(cs->as, parameters_base, BI_LAST);
+        BOOTINFO0(param_ptr, BI_LAST);
+        rom_add_blob_fixed_as("bootinfo", param_blob, param_ptr - param_blob,
+                              parameters_base, cs->as);
+        reset_info->rng_seed = rom_ptr_for_as(cs->as, parameters_base,
+                                              param_ptr - param_blob) +
+                               (param_rng_seed - param_blob);
+        g_free(param_blob);
     } else {
         uint8_t *ptr;
         /* allocate and load BIOS */
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index f7b903ea1b..89c4108eb5 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -89,6 +89,7 @@ typedef struct {
     M68kCPU *cpu;
     hwaddr initial_pc;
     hwaddr initial_stack;
+    struct bi_record *rng_seed;
 } ResetInfo;
 
 static void main_cpu_reset(void *opaque)
@@ -97,6 +98,11 @@ static void main_cpu_reset(void *opaque)
     M68kCPU *cpu = reset_info->cpu;
     CPUState *cs = CPU(cpu);
 
+    if (reset_info->rng_seed) {
+        qemu_guest_getrandom_nofail((void *)reset_info->rng_seed->data + 2,
+            be16_to_cpu(*(uint16_t *)reset_info->rng_seed->data));
+    }
+
     cpu_reset(cs);
     cpu->env.aregs[7] = reset_info->initial_stack;
     cpu->env.pc = reset_info->initial_pc;
@@ -212,6 +218,13 @@ static void virt_init(MachineState *machine)
     if (kernel_filename) {
         CPUState *cs = CPU(cpu);
         uint64_t high;
+        void *param_blob, *param_ptr, *param_rng_seed;
+
+        if (kernel_cmdline) {
+            param_blob = g_malloc(strlen(kernel_cmdline) + 1024);
+        } else {
+            param_blob = g_malloc(1024);
+        }
 
         kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
                                &elf_entry, NULL, &high, NULL, 1,
@@ -222,35 +235,37 @@ static void virt_init(MachineState *machine)
         }
         reset_info->initial_pc = elf_entry;
         parameters_base = (high + 1) & ~1;
+        param_ptr = param_blob;
 
-        BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_VIRT);
-        BOOTINFO1(cs->as, parameters_base, BI_FPUTYPE, FPU_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_MMUTYPE, MMU_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_CPUTYPE, CPU_68040);
-        BOOTINFO2(cs->as, parameters_base, BI_MEMCHUNK, 0, ram_size);
+        BOOTINFO1(param_ptr, BI_MACHTYPE, MACH_VIRT);
+        BOOTINFO1(param_ptr, BI_FPUTYPE, FPU_68040);
+        BOOTINFO1(param_ptr, BI_MMUTYPE, MMU_68040);
+        BOOTINFO1(param_ptr, BI_CPUTYPE, CPU_68040);
+        BOOTINFO2(param_ptr, BI_MEMCHUNK, 0, ram_size);
 
-        BOOTINFO1(cs->as, parameters_base, BI_VIRT_QEMU_VERSION,
+        BOOTINFO1(param_ptr, BI_VIRT_QEMU_VERSION,
                   ((QEMU_VERSION_MAJOR << 24) | (QEMU_VERSION_MINOR << 16) |
                    (QEMU_VERSION_MICRO << 8)));
-        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_PIC_BASE,
+        BOOTINFO2(param_ptr, BI_VIRT_GF_PIC_BASE,
                   VIRT_GF_PIC_MMIO_BASE, VIRT_GF_PIC_IRQ_BASE);
-        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_RTC_BASE,
+        BOOTINFO2(param_ptr, BI_VIRT_GF_RTC_BASE,
                   VIRT_GF_RTC_MMIO_BASE, VIRT_GF_RTC_IRQ_BASE);
-        BOOTINFO2(cs->as, parameters_base, BI_VIRT_GF_TTY_BASE,
+        BOOTINFO2(param_ptr, BI_VIRT_GF_TTY_BASE,
                   VIRT_GF_TTY_MMIO_BASE, VIRT_GF_TTY_IRQ_BASE);
-        BOOTINFO2(cs->as, parameters_base, BI_VIRT_CTRL_BASE,
+        BOOTINFO2(param_ptr, BI_VIRT_CTRL_BASE,
                   VIRT_CTRL_MMIO_BASE, VIRT_CTRL_IRQ_BASE);
-        BOOTINFO2(cs->as, parameters_base, BI_VIRT_VIRTIO_BASE,
+        BOOTINFO2(param_ptr, BI_VIRT_VIRTIO_BASE,
                   VIRT_VIRTIO_MMIO_BASE, VIRT_VIRTIO_IRQ_BASE);
 
         if (kernel_cmdline) {
-            BOOTINFOSTR(cs->as, parameters_base, BI_COMMAND_LINE,
+            BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
                         kernel_cmdline);
         }
 
         /* Pass seed to RNG. */
+        param_rng_seed = param_ptr;
         qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-        BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
+        BOOTINFODATA(param_ptr, BI_RNG_SEED,
                      rng_seed, sizeof(rng_seed));
 
         /* load initrd */
@@ -265,13 +280,19 @@ static void virt_init(MachineState *machine)
             initrd_base = (ram_size - initrd_size) & TARGET_PAGE_MASK;
             load_image_targphys(initrd_filename, initrd_base,
                                 ram_size - initrd_base);
-            BOOTINFO2(cs->as, parameters_base, BI_RAMDISK, initrd_base,
+            BOOTINFO2(param_ptr, BI_RAMDISK, initrd_base,
                       initrd_size);
         } else {
             initrd_base = 0;
             initrd_size = 0;
         }
-        BOOTINFO0(cs->as, parameters_base, BI_LAST);
+        BOOTINFO0(param_ptr, BI_LAST);
+        rom_add_blob_fixed_as("bootinfo", param_blob, param_ptr - param_blob,
+                              parameters_base, cs->as);
+        reset_info->rng_seed = rom_ptr_for_as(cs->as, parameters_base,
+                                              param_ptr - param_blob) +
+                               (param_rng_seed - param_blob);
+        g_free(param_blob);
     }
 }
 
-- 
2.38.1


