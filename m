Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F1A0761
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 18:30:12 +0200 (CEST)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i30pm-0000JD-HY
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 12:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30mp-0006u3-J4
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i30mn-0007oQ-2u
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:07 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:55310 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i30mm-0007mG-KF
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 12:27:04 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 48C9B1A22C9;
 Wed, 28 Aug 2019 18:27:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id F30FC1A22B3;
 Wed, 28 Aug 2019 18:26:59 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 18:26:34 +0200
Message-Id: <1567009614-12438-11-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1567009614-12438-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 10/30] target/mips: Clean up handling of CP0
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Clean up handling of CP0 register 9.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/translate.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index cf8be8f..33a882c 100644
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
@@ -7169,7 +7169,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_09:
         switch (sel) {
-        case 0:
+        case CP0_REG09__COUNT:
             /* Mark as an IO operation because we read the time.  */
             if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
@@ -7187,12 +7187,12 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
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
@@ -7905,16 +7905,16 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
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
@@ -8659,7 +8659,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         break;
     case CP0_REGISTER_09:
         switch (sel) {
-        case 0:
+        case CP0_REG09__COUNT:
             /* Mark as an IO operation because we read the time.  */
             if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
@@ -8677,12 +8677,12 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
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
@@ -9378,16 +9378,16 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
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


