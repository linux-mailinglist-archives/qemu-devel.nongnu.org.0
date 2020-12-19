Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE662DEDB5
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 08:26:12 +0100 (CET)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqWd1-0004lh-Sa
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 02:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWar-0003qr-CP
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:23:57 -0500
Received: from relay1.mymailcheap.com ([144.217.248.100]:58578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWao-0008QN-Ke
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:23:56 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id 5B2563F202;
 Sat, 19 Dec 2020 07:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 42C342A374;
 Sat, 19 Dec 2020 02:23:51 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608362631;
 bh=uA2bJbWIb3kc5yACc/sM6b8KUw3r9+UGTPYWRnrDYOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZLRi+1Rznq82/0+bs5VV9fo63cEddaZ07afLkFuD7vk7U3OR+B9zh+hXhbBR7H5gY
 Ii09cL7prtPljfl3u2eK/YpUVL/exFFoHxYBMnhxtz8luE3wSppkMAkW6MwuVEjnI6
 g8Lmr628K6nUi5cAAxe6SdVD1/IH64PLVbl0QKVQ=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtuY0XAlO3dE; Sat, 19 Dec 2020 02:23:50 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 19 Dec 2020 02:23:49 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id EDE2741E18;
 Sat, 19 Dec 2020 07:23:48 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="qdhpo010"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [180.97.240.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 300D442F8B;
 Sat, 19 Dec 2020 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608362624;
 bh=uA2bJbWIb3kc5yACc/sM6b8KUw3r9+UGTPYWRnrDYOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qdhpo0109LoIFMcdsbeb3542F9HrnUE4rAPtDqBeShQcRSh1JtvQyLH1dsh7PRxH2
 nWuWic8ogMDQzs3Bt2pb2ubtVHJxTxetp9ksJ4TF+ItJu44kmEdoIOMQ/jg+qsNI81
 aefwdIB9Gkb5UWgP5wmr+LiNc+u6mjoO1pFRI0JU=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] hw/mips/fuloong2e: Add highmem support
Date: Sat, 19 Dec 2020 15:23:25 +0800
Message-Id: <20201219072326.40157-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [8.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_XBL(3.00)[180.97.240.22:received];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_CSS(1.00)[180.97.240.22:received];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(0.00)[~all]; RCPT_COUNT_FIVE(0.00)[6];
 ARC_NA(0.00)[]; ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: EDE2741E18
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=144.217.248.100;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay1.mymailcheap.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

highmem started from 0x20000000.
Now we can have up to 2G RAM.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Handle SPD for dual DIMM correctly.
---
 hw/mips/fuloong2e.c | 61 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 2744b211fd..8a4bebe066 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -56,6 +56,7 @@
 /* Fuloong 2e has a 512k flash: Winbond W39L040AP70Z */
 #define BIOS_SIZE               (512 * KiB)
 #define MAX_IDE_BUS             2
+#define HIGHMEM_START           0x20000000
 
 /*
  * PMON is not part of qemu and released with BSD license, anyone
@@ -71,7 +72,8 @@
 #define FULOONG2E_RTL8139_SLOT    7
 
 static struct _loaderparams {
-    int ram_size;
+    int ram_low_size;
+    int ram_high_size;
     const char *kernel_filename;
     const char *kernel_cmdline;
     const char *initrd_filename;
@@ -128,14 +130,14 @@ static uint64_t load_kernel(MIPSCPU *cpu)
         initrd_size = get_image_size(loaderparams.initrd_filename);
         if (initrd_size > 0) {
             initrd_offset = ROUND_UP(kernel_high, INITRD_PAGE_SIZE);
-            if (initrd_offset + initrd_size > loaderparams.ram_size) {
+            if (initrd_offset + initrd_size > loaderparams.ram_low_size) {
                 error_report("memory too small for initial ram disk '%s'",
                              loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size = load_image_targphys(loaderparams.initrd_filename,
                                               initrd_offset,
-                                              loaderparams.ram_size - initrd_offset);
+                                              loaderparams.ram_low_size - initrd_offset);
         }
         if (initrd_size == (target_ulong) -1) {
             error_report("could not load initial ram disk '%s'",
@@ -160,7 +162,11 @@ static uint64_t load_kernel(MIPSCPU *cpu)
 
     /* Setup minimum environment variables */
     prom_set(prom_buf, index++, "cpuclock=%u", clock_get_hz(cpu->clock));
-    prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
+    prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_low_size / MiB);
+    if (loaderparams.ram_high_size > 0) {
+            prom_set(prom_buf, index++, "highmemsize=%"PRIi64,
+                    loaderparams.ram_high_size / MiB);
+    }
     prom_set(prom_buf, index++, NULL);
 
     rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
@@ -186,7 +192,7 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     p = (uint32_t *)(base + 0x040);
 
     bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR,
-                       ENVP_VADDR + 8, loaderparams.ram_size,
+                       ENVP_VADDR + 8, loaderparams.ram_low_size,
                        kernel_addr);
 }
 
@@ -258,8 +264,11 @@ static void mips_fuloong2e_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
+    ram_addr_t ram_low_size, ram_high_size = 0;
     char *filename;
     MemoryRegion *address_space_mem = get_system_memory();
+    MemoryRegion *ram_low_alias = g_new(MemoryRegion, 1);
+    MemoryRegion *ram_high_alias;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     long bios_size;
     uint8_t *spd_data;
@@ -282,12 +291,31 @@ static void mips_fuloong2e_init(MachineState *machine)
 
     qemu_register_reset(main_cpu_reset, cpu);
 
-    /* TODO: support more than 256M RAM as highmem */
-    if (machine->ram_size != 256 * MiB) {
-        error_report("Invalid RAM size, should be 256MB");
+    if (machine->ram_size > 2 * GiB) {
+        error_report("Too much memory for this machine: %" PRId64 "MB,"
+                     " maximum 2048MB", machine->ram_size / MiB);
         exit(EXIT_FAILURE);
     }
-    memory_region_add_subregion(address_space_mem, 0, machine->ram);
+
+    ram_low_size = MIN(machine->ram_size, 256 * MiB);
+
+    memory_region_init_alias(ram_low_alias, NULL,
+                            "ram_low_alias",
+                            machine->ram, 0,
+                            ram_low_size);
+    memory_region_add_subregion(address_space_mem, 0,
+                                ram_low_alias);
+
+    if (machine->ram_size > 256 * MiB) {
+        ram_high_alias = g_new(MemoryRegion, 1);
+        ram_high_size = machine->ram_size - ram_low_size;
+        memory_region_init_alias(ram_high_alias, NULL,
+                                "ram_high_alias",
+                                machine->ram, ram_low_size,
+                                ram_high_size);
+        memory_region_add_subregion(address_space_mem, HIGHMEM_START,
+                                    ram_high_alias);
+    }
 
     /* Boot ROM */
     memory_region_init_rom(bios, NULL, "fuloong2e.bios", BIOS_SIZE,
@@ -300,7 +328,8 @@ static void mips_fuloong2e_init(MachineState *machine)
      */
 
     if (kernel_filename) {
-        loaderparams.ram_size = machine->ram_size;
+        loaderparams.ram_low_size = ram_low_size;
+        loaderparams.ram_high_size = ram_high_size;
         loaderparams.kernel_filename = kernel_filename;
         loaderparams.kernel_cmdline = kernel_cmdline;
         loaderparams.initrd_filename = initrd_filename;
@@ -345,8 +374,16 @@ static void mips_fuloong2e_init(MachineState *machine)
     }
 
     /* Populate SPD eeprom data */
-    spd_data = spd_data_generate(DDR, machine->ram_size);
-    smbus_eeprom_init_one(smbus, 0x50, spd_data);
+    if (machine->ram_size <= 1 * GiB) {
+        /* It supports maxium of 1 GiB per DIMM */
+        spd_data = spd_data_generate(DDR, machine->ram_size);
+        smbus_eeprom_init_one(smbus, 0x50, spd_data);
+    } else {
+        /* Split to dual DIMM for more than 1 GiB  */
+        spd_data = spd_data_generate(DDR, machine->ram_size / 2);
+        smbus_eeprom_init_one(smbus, 0x50, spd_data);
+        smbus_eeprom_init_one(smbus, 0x51, spd_data);
+    }
 
     mc146818_rtc_init(isa_bus, 2000, NULL);
 
-- 
2.29.2

