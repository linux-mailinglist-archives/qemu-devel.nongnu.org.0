Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D7388EEB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:21:40 +0200 (CEST)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljM8p-0000Fs-Qu
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhI-0001Me-O4; Wed, 19 May 2021 08:53:12 -0400
Received: from ozlabs.org ([203.11.71.1]:51007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhD-0001Iu-GA; Wed, 19 May 2021 08:53:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnh316tz9t1Q; Wed, 19 May 2021 22:52:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428728;
 bh=lNPPIVSq3q9zlmsi55IC/0ytJrrjeLihEY/GbwRXqmg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jWHgLhQbpVItyvhdyQu4jZiPSOTteltGyVtByF5fLevUX8Jf05uNDUHP01wZCwf1z
 a6FmiAUorP+DPZauCGe2Z8K7l6S+znjckzzFWnvBYcbz67UYaVLtv6RrRajhXGg7pY
 3pnIuRevDIjh2vGU6zshqJ/3Q9EuojnItrWEa8PE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 25/48] target/ppc: Introduce gen_icount_io_start
Date: Wed, 19 May 2021 22:51:25 +1000
Message-Id: <20210519125148.27720-26-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create a function to handle the details for interacting with icount.

Force the exit from the tb via DISAS_TOO_MANY, which allows chaining
to the next tb, where the code emitted for gen_tb_start() will
determine if we must exit.  We can thus remove any matching
conditional call to gen_stop_exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210517205025.3777947-2-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 174 +++++++++--------------------------------
 1 file changed, 39 insertions(+), 135 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d51a1913a7..060ef83bc0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -304,6 +304,20 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_icount_io_start(DisasContext *ctx)
+{
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+        /*
+         * An I/O instruction must be last in the TB.
+         * Chain to the next TB, and let the code from gen_tb_start
+         * decide if we need to return to the main loop.
+         * Doing this first also allows this value to be overridden.
+         */
+        ctx->base.is_jmp = DISAS_TOO_MANY;
+    }
+}
+
 /*
  * Tells the caller what is the appropriate exception to generate and prepares
  * SPR registers for this exception.
@@ -540,24 +554,14 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 #if !defined(CONFIG_USER_ONLY)
 void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 #endif
 
@@ -565,24 +569,14 @@ void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
 /* Time base */
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
@@ -598,24 +592,14 @@ void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
 #if !defined(CONFIG_USER_ONLY)
 void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
@@ -631,80 +615,45 @@ void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
 #if defined(TARGET_PPC64)
 void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 /* HDECR */
 void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 #endif
@@ -912,71 +861,41 @@ void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
 #if !defined(CONFIG_USER_ONLY)
 void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_store_spr(sprn, cpu_gpr[gprn]);
     gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
     /* We must stop translation as we may have rebooted */
     gen_stop_exception(ctx);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 
 void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
 {
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
-    }
 }
 #endif
 
@@ -2860,18 +2779,13 @@ static void gen_darn(DisasContext *ctx)
     if (l > 2) {
         tcg_gen_movi_i64(cpu_gpr[rD(ctx->opcode)], -1);
     } else {
-        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
+        gen_icount_io_start(ctx);
         if (l == 0) {
             gen_helper_darn32(cpu_gpr[rD(ctx->opcode)]);
         } else {
             /* Return 64-bit random for both CRN and RRN */
             gen_helper_darn64(cpu_gpr[rD(ctx->opcode)]);
         }
-        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-            gen_stop_exception(ctx);
-        }
     }
 }
 #endif
@@ -5013,9 +4927,7 @@ static void gen_rfi(DisasContext *ctx)
     }
     /* Restore CPU state */
     CHK_SV;
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5030,9 +4942,7 @@ static void gen_rfid(DisasContext *ctx)
 #else
     /* Restore CPU state */
     CHK_SV;
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5047,9 +4957,7 @@ static void gen_rfscv(DisasContext *ctx)
 #else
     /* Restore CPU state */
     CHK_SV;
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5379,9 +5287,7 @@ static void gen_mtmsrd(DisasContext *ctx)
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     if (ctx->opcode & 0x00010000) {
         /* L=1 form only updates EE and RI */
         TCGv t0 = tcg_temp_new();
@@ -5416,9 +5322,7 @@ static void gen_mtmsr(DisasContext *ctx)
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     if (ctx->opcode & 0x00010000) {
         /* L=1 form only updates EE and RI */
         TCGv t0 = tcg_temp_new();
-- 
2.31.1


