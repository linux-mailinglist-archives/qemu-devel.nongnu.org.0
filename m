Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2462D09F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 06:16:36 +0100 (CET)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8t1-00043A-US
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 00:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8qz-0002es-5u
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:14:29 -0500
Received: from relay4.mymailcheap.com ([137.74.199.117]:57145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8qx-0004x9-BR
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:14:28 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id C23683F1CF;
 Mon,  7 Dec 2020 06:14:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 951402A50C;
 Mon,  7 Dec 2020 06:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1607318065;
 bh=2/WQny+nxe/dJ+5tq4UFi6+H4MJIhYDdWPt6INm3Fkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PdHmS6EzersqWLxgcXh/uDcLavbLYppqEqCX50FhXrurDGMc3Zy5zdSZHq/P/V9VM
 R6OdSxhJP/kJCvs7AOhvxeq/4u2CTIaW8hLLEayU7jCxLaye68BHqSaZP9k4tBQ04h
 30Nq1cSL/TtdYpk9tX5B55KZr2zTTNV259btZtWE=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEwq-lmHPhta; Mon,  7 Dec 2020 06:14:24 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Mon,  7 Dec 2020 06:14:24 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id C209E41FB1;
 Mon,  7 Dec 2020 05:14:23 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="bc0jQT0N"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 7720441FB1;
 Mon,  7 Dec 2020 05:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1607318056;
 bh=2/WQny+nxe/dJ+5tq4UFi6+H4MJIhYDdWPt6INm3Fkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bc0jQT0N+KDDCl0DTlHK+h2w0Mplo8sILCDPGwX8rwi6rDtDOMODTgG3IcNnNNKlJ
 5jzwnEsf/Ki64iEJ3FgY5YRjYetvbAPPLsGG4cMR5J2rPT+PKxOq//TYV9KwrpDCNx
 iFhMwlYMrAgvNPmegosTc9yaSFlHG/dlntuzLxjE=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/mips/boston: Make use of bootloader helper
Date: Mon,  7 Dec 2020 13:14:09 +0800
Message-Id: <20201207051409.5104-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C209E41FB1
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
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=137.74.199.117;
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use bootloader helper to generate CM Base setting code
and kernel jump.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 60 +++++++++++-------------------------------------
 1 file changed, 13 insertions(+), 47 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 3d40867dc4..c784f8ee62 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -281,40 +281,20 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
     const uint32_t gic_base = 0x16120000;
     const uint32_t cpc_base = 0x16200000;
 
-    /* Move CM GCRs */
     if (is_64b) {
-        stl_p(p++, 0x40287803);                 /* dmfc0 $8, CMGCRBase */
-        stl_p(p++, 0x00084138);                 /* dsll $8, $8, 4 */
+        bl_gen_writeq(&p, cm_base,
+                    cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS));
+        bl_gen_writeq(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
+                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS));
+        bl_gen_writeq(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
+                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS));
     } else {
-        stl_p(p++, 0x40087803);                 /* mfc0 $8, CMGCRBase */
-        stl_p(p++, 0x00084100);                 /* sll  $8, $8, 4 */
-    }
-    stl_p(p++, 0x3c09a000);                     /* lui  $9, 0xa000 */
-    stl_p(p++, 0x01094025);                     /* or   $8, $9 */
-    stl_p(p++, 0x3c0a0000 | (cm_base >> 16));   /* lui  $10, cm_base >> 16 */
-    if (is_64b) {
-        stl_p(p++, 0xfd0a0008);                 /* sd   $10, 0x8($8) */
-    } else {
-        stl_p(p++, 0xad0a0008);                 /* sw   $10, 0x8($8) */
-    }
-    stl_p(p++, 0x012a4025);                     /* or   $8, $10 */
-
-    /* Move & enable GIC GCRs */
-    stl_p(p++, 0x3c090000 | (gic_base >> 16));  /* lui  $9, gic_base >> 16 */
-    stl_p(p++, 0x35290001);                     /* ori  $9, 0x1 */
-    if (is_64b) {
-        stl_p(p++, 0xfd090080);                 /* sd   $9, 0x80($8) */
-    } else {
-        stl_p(p++, 0xad090080);                 /* sw   $9, 0x80($8) */
-    }
-
-    /* Move & enable CPC GCRs */
-    stl_p(p++, 0x3c090000 | (cpc_base >> 16));  /* lui  $9, cpc_base >> 16 */
-    stl_p(p++, 0x35290001);                     /* ori  $9, 0x1 */
-    if (is_64b) {
-        stl_p(p++, 0xfd090088);                 /* sd   $9, 0x88($8) */
-    } else {
-        stl_p(p++, 0xad090088);                 /* sw   $9, 0x88($8) */
+        bl_gen_writel(&p, cm_base,
+                    cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS));
+        bl_gen_writel(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
+                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS));
+        bl_gen_writel(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
+                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS));
     }
 
     /*
@@ -325,21 +305,7 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
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
+    bl_gen_jump_kernel(&p, 0, -2, fdt_addr, 0, 0, kernel_entry);
 }
 
 static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
-- 
2.29.2

