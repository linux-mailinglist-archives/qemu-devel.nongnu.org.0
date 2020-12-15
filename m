Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E52DA834
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:49:17 +0100 (CET)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp495-0000Zc-WE
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp46j-0007KU-Lq
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:46:49 -0500
Received: from relay2.mymailcheap.com ([217.182.113.132]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp46g-0005VK-JC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:46:49 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id 9403A3EDEC;
 Tue, 15 Dec 2020 07:46:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id C1BE22A370;
 Tue, 15 Dec 2020 01:46:43 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608014803;
 bh=Mg/jh/NtAg4BAIaA2cE74QFzPqb6n/LIT/mGYdacmF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SwlYPTVLSE/nnFz/y4cY/DQFhsByde7zrzM3nX0pYHb01WBIuiwpAA6Ag0E/nf7lJ
 QRSo9og/I3tv2yZBt/JWtrhqrBWdeXZEYCH45owrIeB8apoP1eW1YdZR64Sl1wqVVR
 VGmKuKfbrCGjEbJWJnhVJ4EIRfJMNSAnSBVHKWMk=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdlQLTDOQ8Cb; Tue, 15 Dec 2020 01:46:43 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 01:46:43 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 0CC3140026;
 Tue, 15 Dec 2020 06:46:42 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="PXi8Wgzw"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 8F5E440026;
 Tue, 15 Dec 2020 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608014798;
 bh=Mg/jh/NtAg4BAIaA2cE74QFzPqb6n/LIT/mGYdacmF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PXi8WgzwEQsXeLddkL5G/Qp78BgYsUEDU5jFGtayYgO9rCqWWjwarM0RzvJ2CsU0e
 ZPp6yL9r/e/ENmWubIyzmzfyxfpV5X5aaStvpUfKQkZQ0vzBcQtAlFE+qrTRJlyD4L
 +EhjdBTHLKYiQ81M8YITv+th9NnGhiTk8AOjWsIw=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] hw/mips/boston: Use bootloader helper to set GCRs
Date: Tue, 15 Dec 2020 14:46:31 +0800
Message-Id: <20201215064631.30504-1-jiaxun.yang@flygoat.com>
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
X-Rspamd-Queue-Id: 0CC3140026
X-Spam: Yes
Received-SPF: pass client-ip=217.182.113.132;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay2.mymailcheap.com
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

Also hardcode cm_base at boot time instead of reading from CP0.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 45 ++++++++++++---------------------------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index b622222c7d..9f08aa7285 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -281,42 +281,21 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
     const uint32_t gic_base = 0x16120000;
     const uint32_t cpc_base = 0x16200000;
 
-    /* Move CM GCRs */
     if (is_64b) {
-        stl_p(p++, 0x40287803);                 /* dmfc0 $8, CMGCRBase */
-        stl_p(p++, 0x00084138);                 /* dsll $8, $8, 4 */
+        bl_gen_write_u64(&p, cm_base,
+                    cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS));
+        bl_gen_write_u64(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
+                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS));
+        bl_gen_write_u64(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
+                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS));
     } else {
-        stl_p(p++, 0x40087803);                 /* mfc0 $8, CMGCRBase */
-        stl_p(p++, 0x00084100);                 /* sll  $8, $8, 4 */
+        bl_gen_write_u32(&p, cm_base,
+                    cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS));
+        bl_gen_write_u32(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
+                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS));
+        bl_gen_write_u32(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
+                    cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS));
     }
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
-    }
-
     /*
      * Setup argument registers to follow the UHI boot protocol:
      *
-- 
2.29.2

