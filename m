Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D929A2D09EE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 06:07:54 +0100 (CET)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8kc-0000Ci-0J
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 00:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8gv-0005fx-Vp
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:04:06 -0500
Received: from relay4.mymailcheap.com ([137.74.199.117]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8ge-0008VW-IZ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:04:05 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id B7F093F1CF;
 Mon,  7 Dec 2020 06:03:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 84AB02A7C5;
 Mon,  7 Dec 2020 06:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1607317424;
 bh=vat0YG0Ko72WZjJSiCXittmkMV6Bshp7q44AfzVmbTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a3G/k1M9EXhATgIAfPSY6ijkqtsCx5F13uuZla0xEa/wl/OsaMoUZYNBWxRfB/RQr
 5U4QymZd112k1WlVcjKUVyOXpHTAiObB1nmrzc9+WVJgluZMd850vO8miG4t1Va+s4
 b17+HeQ+PoU0ai6R+8XZilfwy7Q8XnGVFZXj4wlg=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xP_1vwia0hfz; Mon,  7 Dec 2020 06:03:43 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Mon,  7 Dec 2020 06:03:43 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id E27CD4226B;
 Mon,  7 Dec 2020 05:03:42 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="bIEbQ8sN"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 8127641FB1;
 Mon,  7 Dec 2020 05:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1607317402;
 bh=vat0YG0Ko72WZjJSiCXittmkMV6Bshp7q44AfzVmbTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bIEbQ8sNBDsRM7V0RA2U2hiUtXWdDNfN3OwZa3oTVYKOx9aVBRewb8LzyrRwJnC6b
 eu+TrkzcHcYEp/GBuFX6yWE6C7tk961MgQ28HYYpBd6eoPdVL9g2SiO41eGJMJvxs6
 XObHguoMw/yzzW/i5/Hlf7QJ849yx5AxlztYDDCk=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/mips/malta: Make use of bootloader helper
Date: Mon,  7 Dec 2020 13:02:28 +0800
Message-Id: <20201207050231.2712-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E27CD4226B
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
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=137.74.199.117;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay4.mymailcheap.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Use bootloader helper to generate BAR setting code
and kernel jump.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/malta.c | 108 ++++++++++++------------------------------------
 1 file changed, 26 insertions(+), 82 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9d1a3b50b7..e9767e8744 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -841,14 +841,12 @@ static void write_bootloader_nanomips(uint8_t *base, int64_t run_addr,
 static void write_bootloader(uint8_t *base, int64_t run_addr,
                              int64_t kernel_entry)
 {
-    uint32_t *p;
+    uint32_t *p, a0;
 
     /* Small bootloader */
     p = (uint32_t *)base;
 
-    stl_p(p++, 0x08000000 |                  /* j 0x1fc00580 */
-                 ((run_addr + 0x580) & 0x0fffffff) >> 2);
-    stl_p(p++, 0x00000000);                  /* nop */
+    bl_gen_jump_to(&p, run_addr + 0x580);
 
     /* YAMON service vector */
     stl_p(base + 0x500, run_addr + 0x0580);  /* start: */
@@ -869,88 +867,34 @@ static void write_bootloader(uint8_t *base, int64_t run_addr,
     /* Second part of the bootloader */
     p = (uint32_t *) (base + 0x580);
 
-    if (semihosting_get_argc()) {
-        /* Preserve a0 content as arguments have been passed */
-        stl_p(p++, 0x00000000);              /* nop */
-    } else {
-        stl_p(p++, 0x24040002);              /* addiu a0, zero, 2 */
-    }
-
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
-    /* lui a3, high(ram_low_size) */
-    stl_p(p++, 0x3c070000 | (loaderparams.ram_low_size >> 16));
-    /* ori a3, a3, low(ram_low_size) */
-    stl_p(p++, 0x34e70000 | (loaderparams.ram_low_size & 0xffff));
-
-    /* Load BAR registers as done by YAMON */
-    stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c08df00);                  /* lui t0, 0xdf00 */
-#else
-    stl_p(p++, 0x340800df);                  /* ori t0, r0, 0x00df */
-#endif
-    stl_p(p++, 0xad280068);                  /* sw t0, 0x0068(t1) */
-
-    stl_p(p++, 0x3c09bbe0);                  /* lui t1, 0xbbe0 */
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c08c000);                  /* lui t0, 0xc000 */
-#else
-    stl_p(p++, 0x340800c0);                  /* ori t0, r0, 0x00c0 */
-#endif
-    stl_p(p++, 0xad280048);                  /* sw t0, 0x0048(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c084000);                  /* lui t0, 0x4000 */
-#else
-    stl_p(p++, 0x34080040);                  /* ori t0, r0, 0x0040 */
-#endif
-    stl_p(p++, 0xad280050);                  /* sw t0, 0x0050(t1) */
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c088000);                  /* lui t0, 0x8000 */
-#else
-    stl_p(p++, 0x34080080);                  /* ori t0, r0, 0x0080 */
-#endif
-    stl_p(p++, 0xad280058);                  /* sw t0, 0x0058(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c083f00);                  /* lui t0, 0x3f00 */
-#else
-    stl_p(p++, 0x3408003f);                  /* ori t0, r0, 0x003f */
-#endif
-    stl_p(p++, 0xad280060);                  /* sw t0, 0x0060(t1) */
-
+    /* GT64xxxx is always big endian */
 #ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c08c100);                  /* lui t0, 0xc100 */
+#define cpu_to_gt32(x) cpu_to_le32(x)
 #else
-    stl_p(p++, 0x340800c1);                  /* ori t0, r0, 0x00c1 */
+#define cpu_to_gt32(x) cpu_to_be32(x)
 #endif
-    stl_p(p++, 0xad280080);                  /* sw t0, 0x0080(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c085e00);                  /* lui t0, 0x5e00 */
-#else
-    stl_p(p++, 0x3408005e);                  /* ori t0, r0, 0x005e */
-#endif
-    stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
+    /* Load BAR registers as done by YAMON */
+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
+    bl_gen_writel(&p, cpu_to_gt32(0xdf000000), 0xb4000068);
+
+    /* setup MEM-to-PCI0 mapping */
+    /* setup PCI0 io window to 0x18000000-0x181fffff */
+    bl_gen_writel(&p, cpu_to_gt32(0xc0000000), 0xbbe00048);
+    bl_gen_writel(&p, cpu_to_gt32(0x40000000), 0xbbe00050);
+    /* setup PCI0 mem windows */
+    bl_gen_writel(&p, cpu_to_gt32(0x80000000), 0xbbe00058);
+    bl_gen_writel(&p, cpu_to_gt32(0x3f000000), 0xbbe00060);
+    bl_gen_writel(&p, cpu_to_gt32(0xc1000000), 0xbbe00080);
+    bl_gen_writel(&p, cpu_to_gt32(0x5e000000), 0xbbe00088);
+#undef cpu_to_gt32
 
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
+    bl_gen_jump_kernel(&p, ENVP_ADDR - 64, a0, ENVP_ADDR, (ENVP_ADDR + 8),
+                        loaderparams.ram_low_size, kernel_entry);
 
     /* YAMON subroutines */
     p = (uint32_t *) (base + 0x800);
-- 
2.29.2

