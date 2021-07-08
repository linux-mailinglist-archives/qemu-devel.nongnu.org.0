Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61F3C1AD2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:06:10 +0200 (CEST)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bDl-0006t5-FZ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1b69-0006Yq-Lv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:58:17 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1b66-0004cy-Ot
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:58:17 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b12so6676978pfv.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PxXjjDB20Mtauw+8hUpHM9KZ5JeiVgO4cr6GF629Uso=;
 b=H6LzQ//z0iyMleUwEdCWcYkT/uHuUvFTtsdIXqGzn20p3c6vvLVcu0TzI1RW26XDoP
 0xPRxleENDIQ6Ry1oX++4yUVDGv4EnDUK1VaCTAl8dOqRvJxZxiRUCP/YJAAuUTgxaCO
 IhZesjJySjsAflOUftKmmuzoA/rlT2fTGVVM/6Ngs6uJVz+2/p+bJflw3se0KcrlouJ7
 tWacgII3z4WZyc4Vt75PCanPTfNBPeaA+h0pd09pDTHgcht2YqpAc83feU5FwjbpWaF0
 VSPqMXHUPYz8O1jrz1HNDvS9/ChqEwn47LttkUMI+1O++WRwjeaqPTCDay2d6JbyRF8F
 DfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxXjjDB20Mtauw+8hUpHM9KZ5JeiVgO4cr6GF629Uso=;
 b=oxeNN14bZOQd6Ndn4LXlU67T6tXHs0a1JhNhIUwqusDyH1W9cq4Ec9I4GQOaTHUt7P
 eIZkw9wjf8FFp0T4nEj158kRWqrfkTM927e9UcCuDe8Lsv0F9k1OkyYLGCrF08jDoZ6V
 6i3VwRmbe/PBBd7TKsRFe++ieR5mqR2UdhSXwkeCDC1Po5evKhTzrZgkdIr9JG4WDPiP
 9mtRiZSx4+h8r+bfTjAlxb7i6Kf3qdKiW9fYGFe8yM0c9+nGtrKXJW8J1z+SIBxfk6r3
 l48MVhSuJwwg9qcbgm+xtIU/uSeZ1sJIB3EFHu687rSjvlhZGlk/Fi8sN25dVtFu6S5p
 yheQ==
X-Gm-Message-State: AOAM533Y/JrtvFjOIa6WkZ/srRrEyWj4eemIoCcULUMR1NfxzTjMEPje
 oQeCI9JLbSQlsDOSAy3WGXe7vLv+oF4iUg==
X-Google-Smtp-Source: ABdhPJwsdafjmzXsI3MPG8DUmSEDLsFgzAPPkwj+FN7co1rMpazicKPiOKTnXAHc/8A4p2pNrN8IRg==
X-Received: by 2002:a65:41c6:: with SMTP id b6mr34244634pgq.206.1625777890010; 
 Thu, 08 Jul 2021 13:58:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z5sm3757000pfb.114.2021.07.08.13.58.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 13:58:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/hppa: Clean up DisasCond
Date: Thu,  8 Jul 2021 13:58:07 -0700
Message-Id: <20210708205807.827147-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708205807.827147-1-richard.henderson@linaro.org>
References: <20210708205807.827147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
index d17568880f..fcb814735f 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -253,8 +253,6 @@
 typedef struct DisasCond {
     TCGCond c;
     TCGv_reg a0, a1;
-    bool a0_is_n;
-    bool a1_is_0;
 } DisasCond;
 
 typedef struct DisasContext {
@@ -449,9 +447,7 @@ static DisasCond cond_make_n(void)
     return (DisasCond){
         .c = TCG_COND_NE,
         .a0 = cpu_psw_n,
-        .a0_is_n = true,
-        .a1 = NULL,
-        .a1_is_0 = true
+        .a1 = tcg_constant_reg(0)
     };
 }
 
@@ -459,7 +455,7 @@ static DisasCond cond_make_0_tmp(TCGCond c, TCGv_reg a0)
 {
     assert (c != TCG_COND_NEVER && c != TCG_COND_ALWAYS);
     return (DisasCond){
-        .c = c, .a0 = a0, .a1_is_0 = true
+        .c = c, .a0 = a0, .a1 = tcg_constant_reg(0)
     };
 }
 
@@ -483,26 +479,14 @@ static DisasCond cond_make(TCGCond c, TCGv_reg a0, TCGv_reg a1)
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
@@ -560,9 +544,8 @@ static TCGv_reg dest_gpr(DisasContext *ctx, unsigned reg)
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
@@ -669,11 +652,9 @@ static void nullify_over(DisasContext *ctx)
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
@@ -686,7 +667,7 @@ static void nullify_over(DisasContext *ctx)
         }
 
         tcg_gen_brcond_reg(ctx->null_cond.c, ctx->null_cond.a0,
-                          ctx->null_cond.a1, ctx->null_lab);
+                           ctx->null_cond.a1, ctx->null_lab);
         cond_free(&ctx->null_cond);
     }
 }
@@ -700,10 +681,9 @@ static void nullify_save(DisasContext *ctx)
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
@@ -1182,7 +1162,6 @@ static void do_add(DisasContext *ctx, unsigned rt, TCGv_reg in1,
     /* Emit any conditional trap before any writeback.  */
     cond = do_cond(cf, dest, cb_msb, sv);
     if (is_tc) {
-        cond_prep(&cond);
         tmp = tcg_temp_new();
         tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
         gen_helper_tcond(cpu_env, tmp);
@@ -1277,7 +1256,6 @@ static void do_sub(DisasContext *ctx, unsigned rt, TCGv_reg in1,
 
     /* Emit any conditional trap before any writeback.  */
     if (is_tc) {
-        cond_prep(&cond);
         tmp = tcg_temp_new();
         tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
         gen_helper_tcond(cpu_env, tmp);
@@ -1403,7 +1381,6 @@ static void do_unit(DisasContext *ctx, unsigned rt, TCGv_reg in1,
 
         if (is_tc) {
             TCGv_reg tmp = tcg_temp_new();
-            cond_prep(&cond);
             tcg_gen_setcond_reg(cond.c, tmp, cond.a0, cond.a1);
             gen_helper_tcond(cpu_env, tmp);
             tcg_temp_free(tmp);
@@ -1859,7 +1836,6 @@ static bool do_cbranch(DisasContext *ctx, target_sreg disp, bool is_n,
     }
 
     taken = gen_new_label();
-    cond_prep(cond);
     tcg_gen_brcond_reg(c, cond->a0, cond->a1, taken);
     cond_free(cond);
 
@@ -1956,7 +1932,6 @@ static bool do_ibranch(DisasContext *ctx, TCGv_reg dest,
         tcg_gen_lookup_and_goto_ptr();
         return nullify_end(ctx);
     } else {
-        cond_prep(&ctx->null_cond);
         c = ctx->null_cond.c;
         a0 = ctx->null_cond.a0;
         a1 = ctx->null_cond.a1;
-- 
2.25.1


