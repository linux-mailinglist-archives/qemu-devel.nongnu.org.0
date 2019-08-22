Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF82992A5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 13:54:27 +0200 (CEST)
Received: from localhost ([::1]:41450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0lfd-0007qI-T1
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 07:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP7-0004jq-RG
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i0lP3-0007rc-DI
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:21 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48185 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i0lOw-0007hu-EM
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 07:37:12 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 8B3561A2053;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 5C6DA1A2080;
 Thu, 22 Aug 2019 13:35:58 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 13:35:32 +0200
Message-Id: <1566473750-17743-9-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1566473750-17743-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 08/26] target/mips: Clean up handling of CP0
 register 9
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
Cc: aurelien@aurel32.net, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 9.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c046a10..f8baa95 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6660,7 +6660,7 @@ static void gen_mfhc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_09:
         switch (sel) {
-        case 7:
+        case CP0_REG09__SAAR:
             CP0_CHECK(ctx->saar);
             gen_helper_mfhc0_saar(arg, cpu_env);
             register_name = "SAAR";
@@ -6761,7 +6761,7 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_09:
         switch (sel) {
-        case 7:
+        case CP0_REG09__SAAR:
             CP0_CHECK(ctx->saar);
             gen_helper_mthc0_saar(cpu_env, arg);
             register_name = "SAAR";
@@ -7168,7 +7168,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_09:
         switch (sel) {
-        case 0:
+        case CP0_REG09__COUNT:
             /* Mark as an IO operation because we read the time.  */
             if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
@@ -7186,12 +7186,12 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             ctx->base.is_jmp = DISAS_EXIT;
             register_name = "Count";
             break;
-        case 6:
+        case CP0_REG09__SAARI:
             CP0_CHECK(ctx->saar);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SAARI));
             register_name = "SAARI";
             break;
-        case 7:
+        case CP0_REG09__SAAR:
             CP0_CHECK(ctx->saar);
             gen_helper_mfc0_saar(arg, cpu_env);
             register_name = "SAAR";
@@ -7903,16 +7903,16 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_09:
         switch (sel) {
-        case 0:
+        case CP0_REG09__COUNT:
             gen_helper_mtc0_count(cpu_env, arg);
             register_name = "Count";
             break;
-        case 6:
+        case CP0_REG09__SAARI:
             CP0_CHECK(ctx->saar);
             gen_helper_mtc0_saari(cpu_env, arg);
             register_name = "SAARI";
             break;
-        case 7:
+        case CP0_REG09__SAAR:
             CP0_CHECK(ctx->saar);
             gen_helper_mtc0_saar(cpu_env, arg);
             register_name = "SAAR";
@@ -8656,7 +8656,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_09:
         switch (sel) {
-        case 0:
+        case CP0_REG09__COUNT:
             /* Mark as an IO operation because we read the time.  */
             if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
@@ -8674,12 +8674,12 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             ctx->base.is_jmp = DISAS_EXIT;
             register_name = "Count";
             break;
-        case 6:
+        case CP0_REG09__SAARI:
             CP0_CHECK(ctx->saar);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SAARI));
             register_name = "SAARI";
             break;
-        case 7:
+        case CP0_REG09__SAAR:
             CP0_CHECK(ctx->saar);
             gen_helper_dmfc0_saar(arg, cpu_env);
             register_name = "SAAR";
@@ -9374,16 +9374,16 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_09:
         switch (sel) {
-        case 0:
+        case CP0_REG09__COUNT:
             gen_helper_mtc0_count(cpu_env, arg);
             register_name = "Count";
             break;
-        case 6:
+        case CP0_REG09__SAARI:
             CP0_CHECK(ctx->saar);
             gen_helper_mtc0_saari(cpu_env, arg);
             register_name = "SAARI";
             break;
-        case 7:
+        case CP0_REG09__SAAR:
             CP0_CHECK(ctx->saar);
             gen_helper_mtc0_saar(cpu_env, arg);
             register_name = "SAAR";
-- 
2.7.4


