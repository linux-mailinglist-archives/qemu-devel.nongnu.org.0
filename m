Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3EF2DA832
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:48:40 +0100 (CET)
Received: from localhost ([::1]:39908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp48V-0008Ez-Gw
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp45Y-00066C-B0
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:45:36 -0500
Received: from relay1.mymailcheap.com ([144.217.248.102]:52765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp45W-0004yQ-KD
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:45:36 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id 67EF43F1C5;
 Tue, 15 Dec 2020 06:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 5103B2A370;
 Tue, 15 Dec 2020 01:45:33 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608014733;
 bh=zJE5fp1EqMxX8dCgYttVAKHUtea9qIzC4ou0u94Fil8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YIjaqRKbm8okAknTPn3QCYqd9CBvnVqSbUbQnScN6L27LotxPPRARZXJ7BKMVoM9p
 13mmxzF2HcJMfKEohode/T+1R+NSTwdDJEXDDHPCifl/7VRIllnkR+nhBxJkbJXjgs
 c4LxcW0QJ73S8fvq2GyNOubeFg3hCfhmScDJA5Xk=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EwHq_0GVmw4; Tue, 15 Dec 2020 01:45:32 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 01:45:32 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 7B9A8403B9;
 Tue, 15 Dec 2020 06:45:31 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="ksaOM1kY"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id B9915403B9;
 Tue, 15 Dec 2020 06:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608014725;
 bh=zJE5fp1EqMxX8dCgYttVAKHUtea9qIzC4ou0u94Fil8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ksaOM1kYC+I13E30ArOKNQA85/IDAJWP2yfsvL1F3cmd3ztzibThwl9YYp64rKGgG
 SkOHSTg5qVD2caPQ2NCff/W+3ArPEl0B2xs9YIKTREzdPI8TxP47Bl0slUFLWmI7Zc
 Haop3C2fj9Gjoghkim+zOrrCgspT+FKZkiPfju+o=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] hw/mips/malta: Use bootloader helper to set BAR
 resgiters
Date: Tue, 15 Dec 2020 14:45:07 +0800
Message-Id: <20201215064507.30148-4-jiaxun.yang@flygoat.com>
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
X-Rspamd-Queue-Id: 7B9A8403B9
X-Spam: Yes
Received-SPF: pass client-ip=144.217.248.102;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay1.mymailcheap.com
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

Translate embedded assembly into IO writes which is more
readable.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/malta.c | 68 ++++++++++++++-----------------------------------
 1 file changed, 19 insertions(+), 49 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ffd67b8293..2799bc36c7 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -875,55 +875,25 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     p = (uint32_t *) (base + 0x580);
 
     /* Load BAR registers as done by YAMON */
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
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c08c100);                  /* lui t0, 0xc100 */
-#else
-    stl_p(p++, 0x340800c1);                  /* ori t0, r0, 0x00c1 */
-#endif
-    stl_p(p++, 0xad280080);                  /* sw t0, 0x0080(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c085e00);                  /* lui t0, 0x5e00 */
-#else
-    stl_p(p++, 0x3408005e);                  /* ori t0, r0, 0x005e */
-#endif
-    stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
+    bl_gen_write_u32(&p, cpu_to_be32(0xdf000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x14000068));
+
+    /* setup MEM-to-PCI0 mapping */
+    /* setup PCI0 io window to 0x18000000-0x181fffff */
+    bl_gen_write_u32(&p, cpu_to_be32(0xc0000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00048));
+    bl_gen_write_u32(&p, cpu_to_be32(0x40000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00050));
+    /* setup PCI0 mem windows */
+    bl_gen_write_u32(&p, cpu_to_be32(0x80000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00058));
+    bl_gen_write_u32(&p, cpu_to_be32(0x3f000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00060));
+    bl_gen_write_u32(&p, cpu_to_be32(0xc1000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00080));
+    bl_gen_write_u32(&p, cpu_to_be32(0x5e000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00088));
 
     if (semihosting_get_argc()) {
         a0 = 0;
-- 
2.29.2

