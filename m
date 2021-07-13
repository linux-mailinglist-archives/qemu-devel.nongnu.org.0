Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C59B3C752D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:44:52 +0200 (CEST)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LWd-0003NO-ID
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUF-0006wT-VK
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:23 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUE-0005hx-02
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:23 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t9so22131865pgn.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XIRufaelCqcDThyPCfIwauMBr0gxGhP21bSIuzV5jtE=;
 b=qPtOMHs5JOoPf3+tW//LAfW5OSqNKknZLPrg8HFK6OMaMzyWqocB/9pwUARnrN5hK5
 5wbPGOFpY1+LPUH3w6FtQVhKw7Pvk1d7tsupb6vVM1fzkF4TUaFfQyxG9rnuyUPjlFlj
 yjib1o1cyEgbVrQxwFNOWNnjfz1H3r0UXiPrsDBPHaeGdCzILiAy8Iij94jfAYkho3w1
 /+w4PRcGDBVoWWLy94GhDgfd9ln6Gmnoh60zHAxfQMPoikL4r8nIBwq6chvuCEXd47cC
 kQjP9FrXq5bwbogyTUu4BY2UrjjSTM+K35vtGaTS0XCQc9UBq3qbz2Hr3POBFR3CL8VC
 +v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIRufaelCqcDThyPCfIwauMBr0gxGhP21bSIuzV5jtE=;
 b=MRZksn7OgF2/82zeHPMVDeY5AonAZRrovAtfXAKIrijfreDb6sRx96+s36MD9cqOtg
 N2sSJJ7vULo2cl/f7b353p40XMiLzBtmoDe1BENTN6wpL2KgrBt0G6FSVosXg1DVP8fn
 bUpKQTOfqUTaY6Km0ReXVdtfvMdgyHlK7Yyq2fvZvQ3217361tq4KKKNVjNmJ1oDIO/k
 gXVUO7aXCV86kx6FzOlNZTPkabZH5OhNqndBVeqPO9YRlc9WoSvq2ARNDNyhkhk+LTY9
 lpE8Uiv6I6L1p3g+hoL4Cz+w8EZvePlSZrD4s/S1ngWzEJ6ijI1MTERxV7sLNzUWVz8z
 Oz3w==
X-Gm-Message-State: AOAM5323XSo1MsCgzeae0puBWEvkwiTY2mKnd1+W9H4lnLp8ltjDEMzF
 mD+0Kog9w/r0x4NpwAodNJqVvZFL2u0hMg==
X-Google-Smtp-Source: ABdhPJzvx7Fk922pWqnpHJd7bMhCVDOTc1b3Si0HzCBENH5GHm20hscrCnmpxmaD9Zg4Wce7ju9JuA==
X-Received: by 2002:aa7:8602:0:b029:32d:3e9b:27de with SMTP id
 p2-20020aa786020000b029032d3e9b27demr5382822pfn.39.1626194540614; 
 Tue, 13 Jul 2021 09:42:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/14] target/hppa: Clean up DisasCond
Date: Tue, 13 Jul 2021 09:42:11 -0700
Message-Id: <20210713164211.1520109-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The a0_is_n flag is redundant with comparing a0 to cpu_psw_n.
The a1_is_0 flag can be removed by initializing a1 to $0,
which also means that cond_prep can be removed entirely.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 43 +++++++++--------------------------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index fa668072d0..2552747138 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -252,8 +252,6 @@
 typedef struct DisasCond {
     TCGCond c;
     TCGv_reg a0, a1;
-    bool a0_is_n;
-    bool a1_is_0;
 } DisasCond;
 
 typedef struct DisasContext {
@@ -448,9 +446,7 @@ static DisasCond cond_make_n(void)
     return (DisasCond){
         .c = TCG_COND_NE,
         .a0 = cpu_psw_n,
-        .a0_is_n = true,
-        .a1 = NULL,
-        .a1_is_0 = true
+        .a1 = tcg_constant_reg(0)
     };
 }
 
@@ -458,7 +454,7 @@ static DisasCond cond_make_0_tmp(TCGCond c, TCGv_reg a0)
 {
     assert (c != TCG_COND_NEVER && c != TCG_COND_ALWAYS);
     return (DisasCond){
-        .c = c, .a0 = a0, .a1_is_0 = true
+        .c = c, .a0 = a0, .a1 = tcg_constant_reg(0)
     };
 }
 
@@ -482,26 +478,14 @@ static DisasCond cond_make(TCGCond c, TCGv_reg a0, TCGv_reg a1)
     return r;
 }
 
-static void cond_prep(DisasCond *cond)
-{
-    if (cond->a1_is_0) {
-        cond->a1_is_0 = false;
-        cond->a1 = tcg_const_reg(0);
-    }
-}
-
 static void cond_free(DisasCond *cond)
 {
     switch (cond->c) {
     default:
-        if (!cond->a0_is_n) {
+        if (cond->a0 != cpu_psw_n) {
             tcg_temp_free(cond->a0);
         }
-        if (!cond->a1_is_0) {
-            tcg_temp_free(cond->a1);
-        }
-        cond->a0_is_n = false;
-        cond->a1_is_0 = false;
+        tcg_temp_free(cond->a1);
         cond->a0 = NULL;
         cond->a1 = NULL;
         /* fallthru */
@@ -559,9 +543,8 @@ static TCGv_reg dest_gpr(DisasContext *ctx, unsigned reg)
 static void save_or_nullify(DisasContext *ctx, TCGv_reg dest, TCGv_reg t)
 {
     if (ctx->null_cond.c != TCG_COND_NEVER) {
-        cond_prep(&ctx->null_cond);
         tcg_gen_movcond_reg(ctx->null_cond.c, dest, ctx->null_cond.a0,
-                           ctx->null_cond.a1, dest, t);
+                            ctx->null_cond.a1, dest, t);
     } else {
         tcg_gen_mov_reg(dest, t);
     }
@@ -668,11 +651,9 @@ static void nullify_over(DisasContext *ctx)
         assert(ctx->null_cond.c != TCG_COND_ALWAYS);
 
         ctx->null_lab = gen_new_label();
-        cond_prep(&ctx->null_cond);
 
         /* If we're using PSW[N], copy it to a temp because... */
-        if (ctx->null_cond.a0_is_n) {
-            ctx->null_cond.a0_is_n = false;
+        if (ctx->null_cond.a0 == cpu_psw_n) {
             ctx->null_cond.a0 = tcg_temp_new();
             tcg_gen_mov_reg(ctx->null_cond.a0, cpu_psw_n);
         }
@@ -685,7 +666,7 @@ static void nullify_over(DisasContext *ctx)
         }
 
         tcg_gen_brcond_reg(ctx->null_cond.c, ctx->null_cond.a0,
-                          ctx->null_cond.a1, ctx->null_lab);
+                           ctx->null_cond.a1, ctx->null_lab);
         cond_free(&ctx->null_cond);
     }
 }
@@ -699,10 +680,9 @@ static void nullify_save(DisasContext *ctx)
         }
         return;
     }
-    if (!ctx->null_cond.a0_is_n) {
-        cond_prep(&ctx->null_cond);
+    if (ctx->null_cond.a0 != cpu_psw_n) {
         tcg_gen_setcond_reg(ctx->null_cond.c, cpu_psw_n,
-                           ctx->null_cond.a0, ctx->null_cond.a1);
+                            ctx->null_cond.a0, ctx->null_cond.a1);
         ctx->psw_n_nonzero = true;
     }
     cond_free(&ctx->null_cond);
@@ -1178,7 +1158,6 @@ static void do_add(DisasContext *ctx, unsigned rt, TCGv_reg in1,
     /* Emit any conditional trap before any writeback.  */
     cond = do_cond(cf, dest, cb_msb, sv);
     if (is_tc) {
-        cond_prep(&cond);
         tmp = tcg_temp_new();
         tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
         gen_helper_tcond(cpu_env, tmp);
@@ -1273,7 +1252,6 @@ static void do_sub(DisasContext *ctx, unsigned rt, TCGv_reg in1,
 
     /* Emit any conditional trap before any writeback.  */
     if (is_tc) {
-        cond_prep(&cond);
         tmp = tcg_temp_new();
         tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
         gen_helper_tcond(cpu_env, tmp);
@@ -1399,7 +1377,6 @@ static void do_unit(DisasContext *ctx, unsigned rt, TCGv_reg in1,
 
         if (is_tc) {
             TCGv_reg tmp = tcg_temp_new();
-            cond_prep(&cond);
             tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
             gen_helper_tcond(cpu_env, tmp);
             tcg_temp_free(tmp);
@@ -1855,7 +1832,6 @@ static bool do_cbranch(DisasContext *ctx, target_sreg disp, bool is_n,
     }
 
     taken = gen_new_label();
-    cond_prep(cond);
     tcg_gen_brcond_reg(c, cond->a0, cond->a1, taken);
     cond_free(cond);
 
@@ -1952,7 +1928,6 @@ static bool do_ibranch(DisasContext *ctx, TCGv_reg dest,
         tcg_gen_lookup_and_goto_ptr();
         return nullify_end(ctx);
     } else {
-        cond_prep(&ctx->null_cond);
         c = ctx->null_cond.c;
         a0 = ctx->null_cond.a0;
         a1 = ctx->null_cond.a1;
-- 
2.25.1


