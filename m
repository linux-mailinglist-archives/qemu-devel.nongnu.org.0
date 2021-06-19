Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39F3ADB12
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:28:16 +0200 (CEST)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luelT-00060I-AU
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejo-0003OF-I1
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:32 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejm-0003WM-JX
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:32 -0400
Received: by mail-pl1-x62a.google.com with SMTP id h1so6308948plt.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wIFh2DuxKQMSyvWLpaRvi15RkQtsLP+YpZiRlKkZFwQ=;
 b=NiX8dbAwH8tq2wcVUduP67zuH+bL95zEL9DAfvJcKSM1U8Zw/sSJxmQRAplnP8AteG
 h5h8moSjOwHntkTDQEJwX4H1RpGnlOXBgUQsu4rrAmcwgnrIPdQ337sT01D7af8UG7da
 LP5YSORDkWtqbN2vsudS4ok+7Qc36u7MGziLhu1+KurGldtJRO8JKADJRpqUw+oIHrkw
 cLoPY6ZJboHqjHmy22NiFi7D16jXwZ5JeILxogU65/Qcb2vAFe6f94X2YiQDAuQP51am
 xES/UBQz0NxK/uV+0pbc309vM5yfjzP23P1SBaLzoYWMpDLRQApd2ChcDCtr6vvuk/BU
 mbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wIFh2DuxKQMSyvWLpaRvi15RkQtsLP+YpZiRlKkZFwQ=;
 b=r8Yg0vEHHcFiBUC1/oo+aCOtHri1QnLLqmIFOYiPUXbD9anR0C9mR6EG3GFpYh6Do4
 PogUvswgNpWKnGcE4xpaUt8wUq5TwaMp4+741YD1yUstasE5QYsXWxXoZBEwaWzmX/2S
 c0p6ZgXNFJoD4jVm9WjmPZWvIgKo0O4FCM7GLgvtvL/8+CXRT1SR24NY7/BnUE33VX2c
 +uzyD8fF3bOmNF3YKTSXqNnLx7D2+t8p6xQtgzoejFHZPvIeSLBNYL4vsBVjTiy8DUtW
 JdNxSVzHdGGPRcvsgCfGeY1Puz8tOdpJ4xV9oJLqbFAXe52hn9qk4fdvrsuxu5ueMWZk
 hRSg==
X-Gm-Message-State: AOAM531u/HVL8/Dn/cStG2zkUnHM8A6FWb1h9rBZI3CndT4/RtU2WrZS
 VvV7TGy+mLXkj1/l9ej2xKBjQ2G9JRF1dA==
X-Google-Smtp-Source: ABdhPJxS8eR45HJdmqYeKRVweJh1aIW/zctr7HFyeqnrvwfFO6KFLarn7Tp9e8RIggIsMo/SfQx8uA==
X-Received: by 2002:a17:902:e545:b029:111:6990:4103 with SMTP id
 n5-20020a170902e545b029011169904103mr10189125plf.63.1624123588748; 
 Sat, 19 Jun 2021 10:26:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/15] NOTFORMERGE q800: test case for do_unaligned_access
 issue
Date: Sat, 19 Jun 2021 10:26:12 -0700
Message-Id: <20210619172626.875885-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

A hack so that the built-in rom for -M a800 triggers the
problem within the first two instructions.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 131 ++++---------------------------------------------
 1 file changed, 9 insertions(+), 122 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 11376daa85..9795ceb06a 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -174,26 +174,13 @@ static void main_cpu_reset(void *opaque)
     CPUState *cs = CPU(cpu);
 
     cpu_reset(cs);
-    cpu->env.aregs[7] = ldl_phys(cs->as, 0);
-    cpu->env.pc = ldl_phys(cs->as, 4);
+    cpu->env.aregs[7] = 0x1000;
+    cpu->env.pc = MACROM_ADDR;
 }
 
 static uint8_t fake_mac_rom[] = {
-    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-
-    /* offset: 0xa - mac_reset */
-
-    /* via2[vDirB] |= VIA2B_vPower */
-    0x20, 0x7C, 0x50, 0xF0, 0x24, 0x00, /* moveal VIA2_BASE+vDirB,%a0 */
-    0x10, 0x10,                         /* moveb %a0@,%d0 */
-    0x00, 0x00, 0x00, 0x04,             /* orib #4,%d0 */
-    0x10, 0x80,                         /* moveb %d0,%a0@ */
-
-    /* via2[vBufB] &= ~VIA2B_vPower */
-    0x20, 0x7C, 0x50, 0xF0, 0x20, 0x00, /* moveal VIA2_BASE+vBufB,%a0 */
-    0x10, 0x10,                         /* moveb %a0@,%d0 */
-    0x02, 0x00, 0xFF, 0xFB,             /* andib #-5,%d0 */
-    0x10, 0x80,                         /* moveb %d0,%a0@ */
+    0x41, 0xf9, 0x50, 0x00, 0x00, 0x00,  /* lea 0x50000000,%a0 */
+    0x30, 0x28, 0x11, 0xff,              /* movew %a0@(4607),%d0 */
 
     /* while (true) ; */
     0x60, 0xFE                          /* bras [self] */
@@ -202,24 +189,11 @@ static uint8_t fake_mac_rom[] = {
 static void q800_init(MachineState *machine)
 {
     M68kCPU *cpu = NULL;
-    int linux_boot;
-    int32_t kernel_size;
-    uint64_t elf_entry;
-    char *filename;
-    int bios_size;
-    ram_addr_t initrd_base;
-    int32_t initrd_size;
     MemoryRegion *rom;
     MemoryRegion *io;
     const int io_slice_nb = (IO_SIZE / IO_SLICE) - 1;
     int i;
     ram_addr_t ram_size = machine->ram_size;
-    const char *kernel_filename = machine->kernel_filename;
-    const char *initrd_filename = machine->initrd_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
-    const char *bios_name = machine->firmware ?: MACROM_FILENAME;
-    hwaddr parameters_base;
-    CPUState *cs;
     DeviceState *dev;
     DeviceState *via_dev;
     DeviceState *escc_orgate;
@@ -231,8 +205,6 @@ static void q800_init(MachineState *machine)
     DeviceState *glue;
     DriveInfo *dinfo;
 
-    linux_boot = (kernel_filename != NULL);
-
     if (ram_size > 1 * GiB) {
         error_report("Too much memory for this machine: %" PRId64 " MiB, "
                      "maximum 1024 MiB", ram_size / MiB);
@@ -392,96 +364,11 @@ static void q800_init(MachineState *machine)
     qdev_prop_set_uint8(dev, "depth", graphic_depth);
     qdev_realize_and_unref(dev, BUS(nubus), &error_fatal);
 
-    cs = CPU(cpu);
-    if (linux_boot) {
-        uint64_t high;
-        kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
-                               &elf_entry, NULL, &high, NULL, 1,
-                               EM_68K, 0, 0);
-        if (kernel_size < 0) {
-            error_report("could not load kernel '%s'", kernel_filename);
-            exit(1);
-        }
-        stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
-        parameters_base = (high + 1) & ~1;
-
-        BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_MAC);
-        BOOTINFO1(cs->as, parameters_base, BI_FPUTYPE, FPU_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_MMUTYPE, MMU_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_CPUTYPE, CPU_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_CPUID, CPUB_68040);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_MODEL, MAC_MODEL_Q800);
-        BOOTINFO1(cs->as, parameters_base,
-                  BI_MAC_MEMSIZE, ram_size >> 20); /* in MB */
-        BOOTINFO2(cs->as, parameters_base, BI_MEMCHUNK, 0, ram_size);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VADDR, VIDEO_BASE);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VDEPTH, graphic_depth);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VDIM,
-                  (graphic_height << 16) | graphic_width);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_VROW,
-                  (graphic_width * graphic_depth + 7) / 8);
-        BOOTINFO1(cs->as, parameters_base, BI_MAC_SCCBASE, SCC_BASE);
-
-        rom = g_malloc(sizeof(*rom));
-        memory_region_init_ram_ptr(rom, NULL, "m68k_fake_mac.rom",
-                                   sizeof(fake_mac_rom), fake_mac_rom);
-        memory_region_set_readonly(rom, true);
-        memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom);
-
-        if (kernel_cmdline) {
-            BOOTINFOSTR(cs->as, parameters_base, BI_COMMAND_LINE,
-                        kernel_cmdline);
-        }
-
-        /* load initrd */
-        if (initrd_filename) {
-            initrd_size = get_image_size(initrd_filename);
-            if (initrd_size < 0) {
-                error_report("could not load initial ram disk '%s'",
-                             initrd_filename);
-                exit(1);
-            }
-
-            initrd_base = (ram_size - initrd_size) & TARGET_PAGE_MASK;
-            load_image_targphys(initrd_filename, initrd_base,
-                                ram_size - initrd_base);
-            BOOTINFO2(cs->as, parameters_base, BI_RAMDISK, initrd_base,
-                      initrd_size);
-        } else {
-            initrd_base = 0;
-            initrd_size = 0;
-        }
-        BOOTINFO0(cs->as, parameters_base, BI_LAST);
-    } else {
-        uint8_t *ptr;
-        /* allocate and load BIOS */
-        rom = g_malloc(sizeof(*rom));
-        memory_region_init_rom(rom, NULL, "m68k_mac.rom", MACROM_SIZE,
-                               &error_abort);
-        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-        memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom);
-
-        /* Load MacROM binary */
-        if (filename) {
-            bios_size = load_image_targphys(filename, MACROM_ADDR, MACROM_SIZE);
-            g_free(filename);
-        } else {
-            bios_size = -1;
-        }
-
-        /* Remove qtest_enabled() check once firmware files are in the tree */
-        if (!qtest_enabled()) {
-            if (bios_size < 0 || bios_size > MACROM_SIZE) {
-                error_report("could not load MacROM '%s'", bios_name);
-                exit(1);
-            }
-
-            ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
-            stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
-            stl_phys(cs->as, 4,
-                     MACROM_ADDR + ldl_p(ptr + 4)); /* reset initial PC */
-        }
-    }
+    rom = g_malloc(sizeof(*rom));
+    memory_region_init_ram_ptr(rom, NULL, "m68k_fake_mac.rom",
+                               sizeof(fake_mac_rom), fake_mac_rom);
+    memory_region_set_readonly(rom, true);
+    memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom);
 }
 
 static void q800_machine_class_init(ObjectClass *oc, void *data)
-- 
2.25.1


