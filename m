Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401642DB933
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:34:41 +0100 (CET)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMeG-0002w3-9n
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMbW-0001fH-Mf
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:31:51 -0500
Received: from relay3.mymailcheap.com ([217.182.119.155]:38261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMbS-0004W8-Nv
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:31:49 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 83B883F1CC;
 Wed, 16 Dec 2020 03:31:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id B57262A0F7;
 Tue, 15 Dec 2020 21:31:43 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608085903;
 bh=QlGO2ggl0mfQieHXz63v/Fgya0HE5z76YOS5YkncyJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GG5RKo0ojxGgb+aMdKBYQ45EAj3+1stvu6UsJe4Am6KzQR1mwVxNVZz/gPM1FC+4Z
 EMLA8Yw82Sqze79TmHP3iTl/w2U0+/f5QFAWqDvAkN4ZzixuTbqh8aTDr9DFrBe2hg
 KNoB1WMK8ZpkZsywtpKEG2hOXRVaAVf1uVy7hct0=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyNu-DenBvfI; Tue, 15 Dec 2020 21:31:42 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 21:31:42 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id A5CAF42E82;
 Wed, 16 Dec 2020 02:31:41 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="EOxBhckc"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 7E12342E7F;
 Wed, 16 Dec 2020 02:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608085895;
 bh=QlGO2ggl0mfQieHXz63v/Fgya0HE5z76YOS5YkncyJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EOxBhckcpQ839YZdEnaCeIIy48spkmqgik5Iwhk2xuoOAv656jMJd7bQ9gCu0+I0j
 4nVb4JQEgop+XbZHGbq3b/f+tqQi8gH4pnVAmTEnArSGK/lgE8lPed3lmZkQDHK3pE
 zGG1CHetLHBj6EoRjgfi7dOXja8HuYrkcWiHseOg=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] hw/mips/fuloong2e: Add highmem support
Date: Wed, 16 Dec 2020 10:31:23 +0800
Message-Id: <20201216023123.92335-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
References: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(0.00)[~all:c];
 TO_DN_SOME(0.00)[]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: A5CAF42E82
X-Spam: Yes
Received-SPF: pass client-ip=217.182.119.155;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay3.mymailcheap.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SORBS_WEB=1.5,
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

highmem started from 0x20000000.
Now we can have up to 2G RAM.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/fuloong2e.c | 49 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index af2d259dc4..dec6ac3b13 100644
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
@@ -128,14 +130,14 @@ static uint64_t load_kernel(CPUMIPSState *env)
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
@@ -160,7 +162,11 @@ static uint64_t load_kernel(CPUMIPSState *env)
 
     /* Setup minimum environment variables */
     prom_set(prom_buf, index++, "cpuclock=533080000");
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
-- 
2.29.2

