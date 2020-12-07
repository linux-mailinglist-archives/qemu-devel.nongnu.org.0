Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640592D09EA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 06:06:01 +0100 (CET)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8im-0006fi-4r
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 00:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8gj-0005Ys-LM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:03:53 -0500
Received: from relay2.mymailcheap.com ([217.182.66.162]:47586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8ge-0008Vq-Ij
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:03:52 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id A03CF3EDEC;
 Mon,  7 Dec 2020 06:03:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 7B1DB2A7C5;
 Mon,  7 Dec 2020 06:03:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1607317425;
 bh=zmMa6pi3Sb/p78/TVezdVAjqlJmjaL5ZPeE0MOt8WeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0LNX7FcwdvDjEKv5n6aMSgUSoM5/dnXfOyxvIhpBBjk7c2kmb3PtSW7wBFYbjBUmG
 9bwu4RxIhvIyJVJwcSIZP5D5pUyQzW0Q6vtq+hpW5e7B0QBWWxZB7dG31KbzzYNtzb
 GP0Kryl9kEo1KdNe/trZiQmRpRKTfMbmVThEZJRo=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id av8IsYcgmsVE; Mon,  7 Dec 2020 06:03:44 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Mon,  7 Dec 2020 06:03:44 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 08CE44238C;
 Mon,  7 Dec 2020 05:03:44 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="cnLM22zS"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 490B241FB1;
 Mon,  7 Dec 2020 05:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1607317405;
 bh=zmMa6pi3Sb/p78/TVezdVAjqlJmjaL5ZPeE0MOt8WeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cnLM22zS5Qx00zlrISv5/1q4VAxIAAPxMrHmL+AEkk9imyB6gSBZRVJUzkFxSjsHQ
 PhAQPtKYnFrrFGX0GqsSFaZhkPCYmWFlpgZ3plbq3jR/kUgeR3ndd5tumj2qxBaZuw
 k+7uREPsAhcEscwxINvqa6pfPD1QvfHojRdYTR8g=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/mips/fuloong2e: Make use of bootloader helper
Date: Mon,  7 Dec 2020 13:02:29 +0800
Message-Id: <20201207050231.2712-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 08CE44238C
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
Received-SPF: pass client-ip=217.182.66.162;
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use bootloader helper to generate kernel jump.
Also move kernel jump to 0x580 to avoid collisions with exception
vectors.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/fuloong2e.c | 35 +++++------------------------------
 1 file changed, 5 insertions(+), 30 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index a9e0c2f8d3..0a4809c816 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -186,38 +186,13 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     /* Small bootloader */
     p = (uint32_t *)base;
 
-    /* j 0x1fc00040 */
-    stl_p(p++, 0x0bf00010);
-    /* nop */
-    stl_p(p++, 0x00000000);
+    bl_gen_jump_to(&p, 0xbfc00580);
 
     /* Second part of the bootloader */
-    p = (uint32_t *)(base + 0x040);
-
-    /* lui a0, 0 */
-    stl_p(p++, 0x3c040000);
-    /* ori a0, a0, 2 */
-    stl_p(p++, 0x34840002);
-    /* lui a1, high(ENVP_ADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_ADDR >> 16) & 0xffff));
-    /* ori a1, a0, low(ENVP_ADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_ADDR & 0xffff));
-    /* lui a2, high(ENVP_ADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_ADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_ADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_ADDR + 8) & 0xffff));
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
+    p = (uint32_t *)(base + 0x580);
+
+    bl_gen_jump_kernel(&p, ENVP_ADDR - 64, 2, ENVP_ADDR, ENVP_ADDR + 8,
+                        loaderparams.ram_size, kernel_addr);
 }
 
 static void main_cpu_reset(void *opaque)
-- 
2.29.2

