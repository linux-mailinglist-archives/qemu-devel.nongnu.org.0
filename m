Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6236F3B3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:33:52 +0200 (CEST)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI2R-0003XK-Bx
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlN-000350-TS
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:14 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl5-0007YA-KN
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t21so4640148plo.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dtTAq0h6uZvJe2v8duAmpGVqYM3A3f710RFs1XYPxA=;
 b=cxkuCXsS5dHNtmH+IYqmV5pRuo1sEAEAtH3WoAnpO6nMl4ScziaLQW85JTSnNAfu3S
 ppufenNiknyOFo0CkcUGwhPTMFohMYTZrWTS8eB1aKWOIxzcW4IKcIEhEiGKGMA2FcHf
 vqDJ9Kmt6ToX8YvIyG/dHCb7YxTvEG8VPf/z5eK8XcK2FnVfRMvetj6z5wT7bI4cDumY
 Jzl3PhIAKpGQSDfqnnfLUmvA3aI2ceTWkClP51pUWCTUxurFJ3GbbsYVLqYtxQWQkwYW
 JEHzFOy4UsiWSkxBu329y3rIOhj9zKCHKE+iYnxMXkfn+EVMqCve57j8Gzt+YaWehSD0
 c+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dtTAq0h6uZvJe2v8duAmpGVqYM3A3f710RFs1XYPxA=;
 b=BCEjbL+mkIREoXPsWQMo2SrgvcdlvAnukW3l38t5u8LOLtI6e+PA3XOVbrQDJqiqwv
 wZilBIPxlxvunmOJHONBzb0uvQGXwuTWHgarFPn74kLJakYN5TKeCEyjmO/6ylH8gK2B
 jD8LCiil2Z3wFGi5awpdtckXETUokHxj401tVscOmn7xovEi7utlDAabVMjCuFRYouN6
 UO6WLee/znppjr4jsiVqK6jOyfrMb3emCnOL7n89k9mfqvVD4Pngt+s0xfQ01yLPHhBF
 cmfN/IflYJ+inMsQvmj+NdQ0TP3+A62Y/wxoZZbC0EqXZFByB9zIu6JdyQmgjX1RAN/O
 YCDw==
X-Gm-Message-State: AOAM5339xlmq80X58j6Vd90jNcnPNM9EGTSsjhRaCycTXrlAXkHcPAjt
 7sc1sa9Y8Ao0AdaCECgEveecg/krcTV0wg==
X-Google-Smtp-Source: ABdhPJyM4s9aKI1pVFhya9rNfBMmjBJxznodnsN5X84zEW8fNyJeLY9YQGWeEtg6qqjot1Gz1fuqUg==
X-Received: by 2002:a17:902:edc4:b029:eb:159f:32b7 with SMTP id
 q4-20020a170902edc4b02900eb159f32b7mr2752651plk.11.1619745354063; 
 Thu, 29 Apr 2021 18:15:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/30] target/ppc: Introduce gen_icount_io_start
Date: Thu, 29 Apr 2021 18:15:27 -0700
Message-Id: <20210430011543.1017113-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a function to handle the details for interacting with icount.

Force the exit from the tb via DISAS_TOO_MANY, which allows chaining
to the next tb, where the code emitted for gen_tb_start() will
determine if we must exit.  We can thus remove any matching
conditional call to gen_stop_exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c          |  41 +++++-----
 target/ppc/translate_init.c.inc | 133 +++++---------------------------
 2 files changed, 39 insertions(+), 135 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d22d6e5b85..45cd3189c0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -302,6 +302,20 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
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
@@ -1842,18 +1856,13 @@ static void gen_darn(DisasContext *ctx)
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
@@ -3995,9 +4004,7 @@ static void gen_rfi(DisasContext *ctx)
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
@@ -4012,9 +4019,7 @@ static void gen_rfid(DisasContext *ctx)
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
@@ -4029,9 +4034,7 @@ static void gen_rfscv(DisasContext *ctx)
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
@@ -4406,9 +4409,7 @@ static void gen_mtmsrd(DisasContext *ctx)
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     if (ctx->opcode & 0x00010000) {
         /* L=1 form only updates EE and RI */
         TCGv t0 = tcg_temp_new();
@@ -4443,9 +4444,7 @@ static void gen_mtmsr(DisasContext *ctx)
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
-    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
+    gen_icount_io_start(ctx);
     if (ctx->opcode & 0x00010000) {
         /* L=1 form only updates EE and RI */
         TCGv t0 = tcg_temp_new();
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 99e5f52925..9af3fb2066 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -183,24 +183,14 @@ static void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 #if !defined(CONFIG_USER_ONLY)
 static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
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
 
 static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
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
 
@@ -208,24 +198,14 @@ static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
 /* Time base */
 static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
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
 
 static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
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
 
 ATTRIBUTE_UNUSED
@@ -243,24 +223,14 @@ static void spr_read_atbu(DisasContext *ctx, int gprn, int sprn)
 #if !defined(CONFIG_USER_ONLY)
 static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
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
 
 static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
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
 
 ATTRIBUTE_UNUSED
@@ -279,80 +249,45 @@ static void spr_write_atbu(DisasContext *ctx, int sprn, int gprn)
 ATTRIBUTE_UNUSED
 static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
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
 
 static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
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
 static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
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
 
 static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
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
 
 static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
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
 
 static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
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
 
 static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
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
@@ -560,71 +495,41 @@ static void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
 #if !defined(CONFIG_USER_ONLY)
 static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
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
 
 static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
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
 
 static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
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
 
 static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
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
 
 static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
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
 
 static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
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
 
-- 
2.25.1


