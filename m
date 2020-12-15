Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36172DA82E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:45:12 +0100 (CET)
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp459-0004PI-QR
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp42a-0002dc-EN
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:42:32 -0500
Received: from relay3.mymailcheap.com ([217.182.119.157]:51909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp42Y-00041t-0K
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:42:32 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 66DE63F1CC;
 Tue, 15 Dec 2020 07:42:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 45BB02A510;
 Tue, 15 Dec 2020 07:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608014548;
 bh=y6ctQgUVU5gcTG+wXv4vT3vKt925fZLwcV3fkk1kHxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JRVwf+PI9DdjysesS7wqh8CGwEgsPC8bGIYhrL0aZe8vVZYgXKQBAHJIeDaU5le/j
 DF1taDdxAP9N+bw8rl1L5TKRYt0rIjCLG4cfs8al/w2by7noznNojvg2UMBZwpOQ3l
 s6L/9lJvdqotZs/10lHPEI0VBaOAyfyAIUQPd2As=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OrAcvZSG7O0O; Tue, 15 Dec 2020 07:42:27 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 07:42:27 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id C6B3840026;
 Tue, 15 Dec 2020 06:42:26 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="AfFEY/j7"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1FF0540026;
 Tue, 15 Dec 2020 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608014537;
 bh=y6ctQgUVU5gcTG+wXv4vT3vKt925fZLwcV3fkk1kHxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AfFEY/j7dwMMfgFulrF801N7zac6hRwL55pczu32muUzoLey0Xgi1evzo46uKSFk2
 53Dlu/kgRwYUezmYeeEijJJb/rQLMXjEXZEvIjQVcDIQAEIIzYQNemVjrq9F4Odh/S
 SAh2exTeoVoVuxK9DTN40HmLvtXoLREzEdxbsySY=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] hw/mips: Use address translation helper to handle
 ENVP_ADDR
Date: Tue, 15 Dec 2020 14:41:55 +0800
Message-Id: <20201215064200.28751-4-jiaxun.yang@flygoat.com>
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
 RCPT_COUNT_FIVE(0.00)[5]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: C6B3840026
X-Spam: Yes
Received-SPF: pass client-ip=217.182.119.157;
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, chenhuacai@kernel.org,
 f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will signed extend vaddr properly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/fuloong2e.c | 24 +++++++++---------
 hw/mips/malta.c     | 62 ++++++++++++++++++++++-----------------------
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index fc4d7f21ed..64cd4b98ca 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -49,7 +49,8 @@
 
 #define DEBUG_FULOONG2E_INIT
 
-#define ENVP_ADDR               0x80002000l
+#define ENVP_PADDR              0x2000
+#define ENVP_VADDR              cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
 #define ENVP_NB_ENTRIES         16
 #define ENVP_ENTRY_SIZE         256
 
@@ -100,7 +101,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
     }
 
     table_addr = sizeof(int32_t) * ENVP_NB_ENTRIES + index * ENVP_ENTRY_SIZE;
-    prom_buf[index] = tswap32(ENVP_ADDR + table_addr);
+    prom_buf[index] = tswap32(ENVP_VADDR + table_addr);
 
     va_start(ap, string);
     vsnprintf((char *)prom_buf + table_addr, ENVP_ENTRY_SIZE, string, ap);
@@ -172,8 +173,7 @@ static uint64_t load_kernel(CPUMIPSState *env)
     prom_set(prom_buf, index++, "modetty0=38400n8r");
     prom_set(prom_buf, index++, NULL);
 
-    rom_add_blob_fixed("prom", prom_buf, prom_size,
-                       cpu_mips_kseg0_to_phys(NULL, ENVP_ADDR));
+    rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
 
     g_free(prom_buf);
     return kernel_entry;
@@ -199,14 +199,14 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     stl_p(p++, 0x3c040000);
     /* ori a0, a0, 2 */
     stl_p(p++, 0x34840002);
-    /* lui a1, high(ENVP_ADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_ADDR >> 16) & 0xffff));
-    /* ori a1, a0, low(ENVP_ADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_ADDR & 0xffff));
-    /* lui a2, high(ENVP_ADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_ADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_ADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_ADDR + 8) & 0xffff));
+    /* lui a1, high(ENVP_VADDR) */
+    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
+    /* ori a1, a0, low(ENVP_VADDR) */
+    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
+    /* lui a2, high(ENVP_VADDR + 8) */
+    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
+    /* ori a2, a2, low(ENVP_VADDR + 8) */
+    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
     /* lui a3, high(env->ram_size) */
     stl_p(p++, 0x3c070000 | (loaderparams.ram_size >> 16));
     /* ori a3, a3, low(env->ram_size) */
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 1fbb8a3220..9afc0b427b 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -62,7 +62,8 @@
 #include "hw/mips/cps.h"
 #include "hw/qdev-clock.h"
 
-#define ENVP_ADDR           0x80002000l
+#define ENVP_PADDR          0x2000
+#define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
 #define ENVP_NB_ENTRIES     16
 #define ENVP_ENTRY_SIZE     256
 
@@ -656,29 +657,29 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                                 /* li a0,2                      */
     }
 
-    stw_p(p++, 0xe3a0 | NM_HI1(ENVP_ADDR - 64));
+    stw_p(p++, 0xe3a0 | NM_HI1(ENVP_VADDR - 64));
 
-    stw_p(p++, NM_HI2(ENVP_ADDR - 64));
-                                /* lui sp,%hi(ENVP_ADDR - 64)   */
+    stw_p(p++, NM_HI2(ENVP_VADDR - 64));
+                                /* lui sp,%hi(ENVP_VADDR - 64)   */
 
-    stw_p(p++, 0x83bd); stw_p(p++, NM_LO(ENVP_ADDR - 64));
-                                /* ori sp,sp,%lo(ENVP_ADDR - 64) */
+    stw_p(p++, 0x83bd); stw_p(p++, NM_LO(ENVP_VADDR - 64));
+                                /* ori sp,sp,%lo(ENVP_VADDR - 64) */
 
-    stw_p(p++, 0xe0a0 | NM_HI1(ENVP_ADDR));
+    stw_p(p++, 0xe0a0 | NM_HI1(ENVP_VADDR));
 
-    stw_p(p++, NM_HI2(ENVP_ADDR));
-                                /* lui a1,%hi(ENVP_ADDR)        */
+    stw_p(p++, NM_HI2(ENVP_VADDR));
+                                /* lui a1,%hi(ENVP_VADDR)        */
 
-    stw_p(p++, 0x80a5); stw_p(p++, NM_LO(ENVP_ADDR));
-                                /* ori a1,a1,%lo(ENVP_ADDR)     */
+    stw_p(p++, 0x80a5); stw_p(p++, NM_LO(ENVP_VADDR));
+                                /* ori a1,a1,%lo(ENVP_VADDR)     */
 
-    stw_p(p++, 0xe0c0 | NM_HI1(ENVP_ADDR + 8));
+    stw_p(p++, 0xe0c0 | NM_HI1(ENVP_VADDR + 8));
 
-    stw_p(p++, NM_HI2(ENVP_ADDR + 8));
-                                /* lui a2,%hi(ENVP_ADDR + 8)    */
+    stw_p(p++, NM_HI2(ENVP_VADDR + 8));
+                                /* lui a2,%hi(ENVP_VADDR + 8)    */
 
-    stw_p(p++, 0x80c6); stw_p(p++, NM_LO(ENVP_ADDR + 8));
-                                /* ori a2,a2,%lo(ENVP_ADDR + 8) */
+    stw_p(p++, 0x80c6); stw_p(p++, NM_LO(ENVP_VADDR + 8));
+                                /* ori a2,a2,%lo(ENVP_VADDR + 8) */
 
     stw_p(p++, 0xe0e0 | NM_HI1(loaderparams.ram_low_size));
 
@@ -878,18 +879,18 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
         stl_p(p++, 0x24040002);              /* addiu a0, zero, 2 */
     }
 
-    /* lui sp, high(ENVP_ADDR) */
-    stl_p(p++, 0x3c1d0000 | (((ENVP_ADDR - 64) >> 16) & 0xffff));
-    /* ori sp, sp, low(ENVP_ADDR) */
-    stl_p(p++, 0x37bd0000 | ((ENVP_ADDR - 64) & 0xffff));
-    /* lui a1, high(ENVP_ADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_ADDR >> 16) & 0xffff));
-    /* ori a1, a1, low(ENVP_ADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_ADDR & 0xffff));
-    /* lui a2, high(ENVP_ADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_ADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_ADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_ADDR + 8) & 0xffff));
+    /* lui sp, high(ENVP_VADDR) */
+    stl_p(p++, 0x3c1d0000 | (((ENVP_VADDR - 64) >> 16) & 0xffff));
+    /* ori sp, sp, low(ENVP_VADDR) */
+    stl_p(p++, 0x37bd0000 | ((ENVP_VADDR - 64) & 0xffff));
+    /* lui a1, high(ENVP_VADDR) */
+    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
+    /* ori a1, a1, low(ENVP_VADDR) */
+    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
+    /* lui a2, high(ENVP_VADDR + 8) */
+    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
+    /* ori a2, a2, low(ENVP_VADDR + 8) */
+    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
     /* lui a3, high(ram_low_size) */
     stl_p(p++, 0x3c070000 | (loaderparams.ram_low_size >> 16));
     /* ori a3, a3, low(ram_low_size) */
@@ -1015,7 +1016,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
     }
 
     table_addr = sizeof(uint32_t) * ENVP_NB_ENTRIES + index * ENVP_ENTRY_SIZE;
-    prom_buf[index] = tswap32(ENVP_ADDR + table_addr);
+    prom_buf[index] = tswap32(ENVP_VADDR + table_addr);
 
     va_start(ap, string);
     vsnprintf((char *)prom_buf + table_addr, ENVP_ENTRY_SIZE, string, ap);
@@ -1122,8 +1123,7 @@ static uint64_t load_kernel(void)
     prom_set(prom_buf, prom_index++, "38400n8r");
     prom_set(prom_buf, prom_index++, NULL);
 
-    rom_add_blob_fixed("prom", prom_buf, prom_size,
-                       cpu_mips_kseg0_to_phys(NULL, ENVP_ADDR));
+    rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
 
     g_free(prom_buf);
     return kernel_entry;
-- 
2.29.2

