Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060132DA836
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:51:28 +0100 (CET)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp4BB-000375-D5
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp45W-00061X-RO
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:45:34 -0500
Received: from relay4.mymailcheap.com ([137.74.80.156]:57538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp45T-0004xF-UN
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:45:33 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id 14B533F162;
 Tue, 15 Dec 2020 07:45:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 3DFEA2A370;
 Tue, 15 Dec 2020 01:45:29 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608014729;
 bh=Tr8W+sLtPkU5Ifn7lYtOpahhe6uDBWHqDIhHMMwE6us=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWocI9pOtuN7qo9iPoCXL5sFzb2EOScp7Q36OacXXSJkWQ0maytg1UCPsnlo/lkHl
 NKmiF2iQMj8MCQUSJ3zHzzisi3isw2DFPxxz3EIQVZKTwkrHU5blbU3lvaMtp0wHnO
 ET21+pev84BMyw0KqqL+tNcVskc9NUaCVZjoNpTU=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FlHyo6nfe-CN; Tue, 15 Dec 2020 01:45:28 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 01:45:28 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 3BDFD403B9;
 Tue, 15 Dec 2020 06:45:27 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="kvHZSy5O"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 22903403B9;
 Tue, 15 Dec 2020 06:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608014720;
 bh=Tr8W+sLtPkU5Ifn7lYtOpahhe6uDBWHqDIhHMMwE6us=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kvHZSy5OHSLIaQPvLQbCeUpaItMzB/YSzDPolL23f+jDoA85YV/R0AisEOifBV6ha
 k/9T1Qmaeo3868oYF2FptN9SM/gjOU+APLIIyvvAUMumKxzjsWwuFiGwV/42oSeIHW
 XjYiXSoFfz2RHoN/rD99tN9tmwuN8oYNu+zGt7Dk=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] hw/mips: Use bl_gen_kernel_jump to generate bootloaders
Date: Tue, 15 Dec 2020 14:45:05 +0800
Message-Id: <20201215064507.30148-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(0.00)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5]; ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 3BDFD403B9
X-Spam: Yes
Received-SPF: pass client-ip=137.74.80.156;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay4.mymailcheap.com
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, chenhuacai@kernel.org,
 f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace embedded binary with generated code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c    | 17 ++---------------
 hw/mips/fuloong2e.c | 28 ++++------------------------
 hw/mips/malta.c     | 41 ++++++++++-------------------------------
 3 files changed, 16 insertions(+), 70 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index c3b94c68e1..b622222c7d 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -27,6 +27,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/loader.h"
 #include "hw/loader-fit.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cps.h"
 #include "hw/pci-host/xilinx-pcie.h"
 #include "hw/qdev-clock.h"
@@ -324,21 +325,7 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
      * a2/$6 = 0
      * a3/$7 = 0
      */
-    stl_p(p++, 0x2404fffe);                     /* li   $4, -2 */
-                                                /* lui  $5, hi(fdt_addr) */
-    stl_p(p++, 0x3c050000 | ((fdt_addr >> 16) & 0xffff));
-    if (fdt_addr & 0xffff) {                    /* ori  $5, lo(fdt_addr) */
-        stl_p(p++, 0x34a50000 | (fdt_addr & 0xffff));
-    }
-    stl_p(p++, 0x34060000);                     /* li   $6, 0 */
-    stl_p(p++, 0x34070000);                     /* li   $7, 0 */
-
-    /* Load kernel entry address & jump to it */
-                                                /* lui  $25, hi(kernel_entry) */
-    stl_p(p++, 0x3c190000 | ((kernel_entry >> 16) & 0xffff));
-                                                /* ori  $25, lo(kernel_entry) */
-    stl_p(p++, 0x37390000 | (kernel_entry & 0xffff));
-    stl_p(p++, 0x03200009);                     /* jr   $25 */
+    bl_gen_jump_kernel(&p, 0, (int32_t)-2, fdt_addr, 0, 0, kernel_entry);
 }
 
 static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 64cd4b98ca..9b0eb8a314 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -33,6 +33,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "qemu/log.h"
@@ -195,30 +196,9 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     /* Second part of the bootloader */
     p = (uint32_t *)(base + 0x040);
 
-    /* lui a0, 0 */
-    stl_p(p++, 0x3c040000);
-    /* ori a0, a0, 2 */
-    stl_p(p++, 0x34840002);
-    /* lui a1, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
-    /* ori a1, a0, low(ENVP_VADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
-    /* lui a2, high(ENVP_VADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_VADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
-    /* lui a3, high(env->ram_size) */
-    stl_p(p++, 0x3c070000 | (loaderparams.ram_size >> 16));
-    /* ori a3, a3, low(env->ram_size) */
-    stl_p(p++, 0x34e70000 | (loaderparams.ram_size & 0xffff));
-    /* lui ra, high(kernel_addr) */
-    stl_p(p++, 0x3c1f0000 | ((kernel_addr >> 16) & 0xffff));
-    /* ori ra, ra, low(kernel_addr) */
-    stl_p(p++, 0x37ff0000 | (kernel_addr & 0xffff));
-    /* jr ra */
-    stl_p(p++, 0x03e00008);
-    /* nop */
-    stl_p(p++, 0x00000000);
+    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR,
+                       ENVP_VADDR + 8, loaderparams.ram_size,
+                       kernel_addr);
 }
 
 static void main_cpu_reset(void *opaque)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427b..ffd67b8293 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -37,6 +37,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
@@ -844,6 +845,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 static void write_bootloader(uint8_t *base, uint64_t run_addr,
                              uint64_t kernel_entry)
 {
+    target_ulong a0;
     uint32_t *p;
 
     /* Small bootloader */
@@ -872,30 +874,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     /* Second part of the bootloader */
     p = (uint32_t *) (base + 0x580);
 
-    if (semihosting_get_argc()) {
-        /* Preserve a0 content as arguments have been passed */
-        stl_p(p++, 0x00000000);              /* nop */
-    } else {
-        stl_p(p++, 0x24040002);              /* addiu a0, zero, 2 */
-    }
-
-    /* lui sp, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c1d0000 | (((ENVP_VADDR - 64) >> 16) & 0xffff));
-    /* ori sp, sp, low(ENVP_VADDR) */
-    stl_p(p++, 0x37bd0000 | ((ENVP_VADDR - 64) & 0xffff));
-    /* lui a1, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
-    /* ori a1, a1, low(ENVP_VADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
-    /* lui a2, high(ENVP_VADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_VADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
-    /* lui a3, high(ram_low_size) */
-    stl_p(p++, 0x3c070000 | (loaderparams.ram_low_size >> 16));
-    /* ori a3, a3, low(ram_low_size) */
-    stl_p(p++, 0x34e70000 | (loaderparams.ram_low_size & 0xffff));
-
     /* Load BAR registers as done by YAMON */
     stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
 
@@ -947,13 +925,14 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
 #endif
     stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
 
-    /* Jump to kernel code */
-    stl_p(p++, 0x3c1f0000 |
-          ((kernel_entry >> 16) & 0xffff));  /* lui ra, high(kernel_entry) */
-    stl_p(p++, 0x37ff0000 |
-          (kernel_entry & 0xffff));          /* ori ra, ra, low(kernel_entry) */
-    stl_p(p++, 0x03e00009);                  /* jalr ra */
-    stl_p(p++, 0x00000000);                  /* nop */
+    if (semihosting_get_argc()) {
+        a0 = 0;
+    } else {
+        a0 = 2;
+    }
+    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, a0, ENVP_VADDR,
+                       ENVP_VADDR + 8, loaderparams.ram_low_size,
+                       kernel_entry);
 
     /* YAMON subroutines */
     p = (uint32_t *) (base + 0x800);
-- 
2.29.2

