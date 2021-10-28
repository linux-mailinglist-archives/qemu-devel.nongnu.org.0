Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7642843D9E3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:32:39 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfw9e-00040m-JI
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMg-0004ss-2J
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:03 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMd-0003qx-UT
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:01 -0400
Received: by mail-pf1-x430.google.com with SMTP id a26so4537152pfr.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=skOoD+WVXqg1LP1/W8y7ihe77x/ObnYayHV13fG5FOQ=;
 b=rdWktjlxbAibkH+oLyfrquSGrOtb3m9rOF76pcm53HCBWG686G44IJyKnu5MjdsuQR
 UQ2owC0tAbr9h11W+PXq1dDdVA21OjeKmZ152HkNd6My4eXQq282sA1FHThu3If4RXac
 2qhyBSicnntQGmbwahaLCFbNLWzqL+FUY+GOdqzlHAw4MEj7eIaosJXo2oSGrTFoFShA
 YBZP/T5z7cvjRB1ciGnwE3VjX8Z7Y0P5NjrsGGPa/nYB7GhosxaG3sG+ASLN6oR3SOOE
 nieuxSkANEMFORCtB6HKUro7vzg8Tz6FvJX23fWFUuiKeM12x7Y5PBr/AwrvEM3cppM+
 R8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=skOoD+WVXqg1LP1/W8y7ihe77x/ObnYayHV13fG5FOQ=;
 b=q1nNB54sEgYxvJil3b3rSFNTugQmjrbEvkpmBYwRMU0ImYis2Llk2TCVw8oF+PxHhe
 2qN/RBsGtrjU8wTcrNvmJgi+j/dXFImDvc+C5ay7o15yvvspZRPPny8vvZ6/mGijOqHA
 mmh2Znsv5q2WjRSpv7TWsboID5x5h+eJpQE4f3Aqk7a2NZco7XbfCLMlRlfGzmfS1oi2
 d6EzRUDzojeYoVvbMiUYJQyJILizgLI2tPD2Wa0UUD2FuB8VqnekHKDWhVfcUlzAo0Xd
 rfPpwm/76mzgJOBdli4jt22UCmZ3UaRpDGhgq0SaE0ULFteUxqz5EwXdQBCLw/djfPkv
 NNXQ==
X-Gm-Message-State: AOAM533Gq0N/p43dUwxRHjY5m1CS4MYbzJhLgzprY0tMcOuOqQaTcO3c
 FICNtvOJKPLRbWq9h2crQ7MgnkwPNaEKBg==
X-Google-Smtp-Source: ABdhPJydkRk7KNNlXaiU8K0HW91ijLvxjkQeSddk89+R8SFlvy4H6RkaqgS3yQ79Uaa5QVK6C7ixJA==
X-Received: by 2002:a63:3c53:: with SMTP id i19mr1221163pgn.450.1635388917528; 
 Wed, 27 Oct 2021 19:41:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/56] tcg/optimize: Add type to OptContext
Date: Wed, 27 Oct 2021 19:41:13 -0700
Message-Id: <20211028024131.1492790-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compute the type of the operation early.

There are at least 4 places that used a def->flags ladder
to determine the type of the operation being optimized.

There were two places that assumed !TCG_OPF_64BIT means
TCG_TYPE_I32, and so could potentially compute incorrect
results for vector operations.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 149 +++++++++++++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 60 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index cfdc53c964..e869fa7e78 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -51,6 +51,7 @@ typedef struct OptContext {
 
     /* In flight values from optimization. */
     uint64_t z_mask;
+    TCGType type;
 } OptContext;
 
 static inline TempOptInfo *ts_info(TCGTemp *ts)
@@ -187,7 +188,6 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
 {
     TCGTemp *dst_ts = arg_temp(dst);
     TCGTemp *src_ts = arg_temp(src);
-    const TCGOpDef *def;
     TempOptInfo *di;
     TempOptInfo *si;
     uint64_t z_mask;
@@ -201,16 +201,24 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
     reset_ts(dst_ts);
     di = ts_info(dst_ts);
     si = ts_info(src_ts);
-    def = &tcg_op_defs[op->opc];
-    if (def->flags & TCG_OPF_VECTOR) {
-        new_op = INDEX_op_mov_vec;
-    } else if (def->flags & TCG_OPF_64BIT) {
-        new_op = INDEX_op_mov_i64;
-    } else {
+
+    switch (ctx->type) {
+    case TCG_TYPE_I32:
         new_op = INDEX_op_mov_i32;
+        break;
+    case TCG_TYPE_I64:
+        new_op = INDEX_op_mov_i64;
+        break;
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+    case TCG_TYPE_V256:
+        /* TCGOP_VECL and TCGOP_VECE remain unchanged.  */
+        new_op = INDEX_op_mov_vec;
+        break;
+    default:
+        g_assert_not_reached();
     }
     op->opc = new_op;
-    /* TCGOP_VECL and TCGOP_VECE remain unchanged.  */
     op->args[0] = dst;
     op->args[1] = src;
 
@@ -237,20 +245,9 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
 static bool tcg_opt_gen_movi(OptContext *ctx, TCGOp *op,
                              TCGArg dst, uint64_t val)
 {
-    const TCGOpDef *def = &tcg_op_defs[op->opc];
-    TCGType type;
-    TCGTemp *tv;
-
-    if (def->flags & TCG_OPF_VECTOR) {
-        type = TCGOP_VECL(op) + TCG_TYPE_V64;
-    } else if (def->flags & TCG_OPF_64BIT) {
-        type = TCG_TYPE_I64;
-    } else {
-        type = TCG_TYPE_I32;
-    }
-
     /* Convert movi to mov with constant temp. */
-    tv = tcg_constant_internal(type, val);
+    TCGTemp *tv = tcg_constant_internal(ctx->type, val);
+
     init_ts_info(ctx, tv);
     return tcg_opt_gen_mov(ctx, op, dst, temp_arg(tv));
 }
@@ -420,11 +417,11 @@ static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
     }
 }
 
-static uint64_t do_constant_folding(TCGOpcode op, uint64_t x, uint64_t y)
+static uint64_t do_constant_folding(TCGOpcode op, TCGType type,
+                                    uint64_t x, uint64_t y)
 {
-    const TCGOpDef *def = &tcg_op_defs[op];
     uint64_t res = do_constant_folding_2(op, x, y);
-    if (!(def->flags & TCG_OPF_64BIT)) {
+    if (type == TCG_TYPE_I32) {
         res = (int32_t)res;
     }
     return res;
@@ -510,19 +507,21 @@ static bool do_constant_folding_cond_eq(TCGCond c)
  * Return -1 if the condition can't be simplified,
  * and the result of the condition (0 or 1) if it can.
  */
-static int do_constant_folding_cond(TCGOpcode op, TCGArg x,
+static int do_constant_folding_cond(TCGType type, TCGArg x,
                                     TCGArg y, TCGCond c)
 {
     uint64_t xv = arg_info(x)->val;
     uint64_t yv = arg_info(y)->val;
 
     if (arg_is_const(x) && arg_is_const(y)) {
-        const TCGOpDef *def = &tcg_op_defs[op];
-        tcg_debug_assert(!(def->flags & TCG_OPF_VECTOR));
-        if (def->flags & TCG_OPF_64BIT) {
-            return do_constant_folding_cond_64(xv, yv, c);
-        } else {
+        switch (type) {
+        case TCG_TYPE_I32:
             return do_constant_folding_cond_32(xv, yv, c);
+        case TCG_TYPE_I64:
+            return do_constant_folding_cond_64(xv, yv, c);
+        default:
+            /* Only scalar comparisons are optimizable */
+            return -1;
         }
     } else if (args_are_copies(x, y)) {
         return do_constant_folding_cond_eq(c);
@@ -677,7 +676,7 @@ static bool fold_const1(OptContext *ctx, TCGOp *op)
         uint64_t t;
 
         t = arg_info(op->args[1])->val;
-        t = do_constant_folding(op->opc, t, 0);
+        t = do_constant_folding(op->opc, ctx->type, t, 0);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t);
     }
     return false;
@@ -689,7 +688,7 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
         uint64_t t1 = arg_info(op->args[1])->val;
         uint64_t t2 = arg_info(op->args[2])->val;
 
-        t1 = do_constant_folding(op->opc, t1, t2);
+        t1 = do_constant_folding(op->opc, ctx->type, t1, t2);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t1);
     }
     return false;
@@ -791,7 +790,7 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
 static bool fold_brcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[2];
-    int i = do_constant_folding_cond(op->opc, op->args[0], op->args[1], cond);
+    int i = do_constant_folding_cond(ctx->type, op->args[0], op->args[1], cond);
 
     if (i == 0) {
         tcg_op_remove(ctx->tcg, op);
@@ -836,7 +835,7 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
          * Simplify EQ/NE comparisons where one of the pairs
          * can be simplified.
          */
-        i = do_constant_folding_cond(INDEX_op_brcond_i32, op->args[0],
+        i = do_constant_folding_cond(TCG_TYPE_I32, op->args[0],
                                      op->args[2], cond);
         switch (i ^ inv) {
         case 0:
@@ -845,7 +844,7 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
             goto do_brcond_high;
         }
 
-        i = do_constant_folding_cond(INDEX_op_brcond_i32, op->args[1],
+        i = do_constant_folding_cond(TCG_TYPE_I32, op->args[1],
                                      op->args[3], cond);
         switch (i ^ inv) {
         case 0:
@@ -887,7 +886,7 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
     if (arg_is_const(op->args[1])) {
         uint64_t t = arg_info(op->args[1])->val;
 
-        t = do_constant_folding(op->opc, t, op->args[2]);
+        t = do_constant_folding(op->opc, ctx->type, t, op->args[2]);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t);
     }
     return false;
@@ -931,7 +930,7 @@ static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
         uint64_t t = arg_info(op->args[1])->val;
 
         if (t != 0) {
-            t = do_constant_folding(op->opc, t, 0);
+            t = do_constant_folding(op->opc, ctx->type, t, 0);
             return tcg_opt_gen_movi(ctx, op, op->args[0], t);
         }
         return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[2]);
@@ -1063,9 +1062,8 @@ static bool fold_mov(OptContext *ctx, TCGOp *op)
 
 static bool fold_movcond(OptContext *ctx, TCGOp *op)
 {
-    TCGOpcode opc = op->opc;
     TCGCond cond = op->args[5];
-    int i = do_constant_folding_cond(opc, op->args[1], op->args[2], cond);
+    int i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
 
     if (i >= 0) {
         return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
@@ -1074,9 +1072,18 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
     if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
         uint64_t tv = arg_info(op->args[3])->val;
         uint64_t fv = arg_info(op->args[4])->val;
+        TCGOpcode opc;
 
-        opc = (opc == INDEX_op_movcond_i32
-               ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64);
+        switch (ctx->type) {
+        case TCG_TYPE_I32:
+            opc = INDEX_op_setcond_i32;
+            break;
+        case TCG_TYPE_I64:
+            opc = INDEX_op_setcond_i64;
+            break;
+        default:
+            g_assert_not_reached();
+        }
 
         if (tv == 1 && fv == 0) {
             op->opc = opc;
@@ -1181,7 +1188,7 @@ static bool fold_remainder(OptContext *ctx, TCGOp *op)
 static bool fold_setcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[3];
-    int i = do_constant_folding_cond(op->opc, op->args[1], op->args[2], cond);
+    int i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
 
     if (i >= 0) {
         return tcg_opt_gen_movi(ctx, op, op->args[0], i);
@@ -1220,7 +1227,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
          * Simplify EQ/NE comparisons where one of the pairs
          * can be simplified.
          */
-        i = do_constant_folding_cond(INDEX_op_setcond_i32, op->args[1],
+        i = do_constant_folding_cond(TCG_TYPE_I32, op->args[1],
                                      op->args[3], cond);
         switch (i ^ inv) {
         case 0:
@@ -1229,7 +1236,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
             goto do_setcond_high;
         }
 
-        i = do_constant_folding_cond(INDEX_op_setcond_i32, op->args[2],
+        i = do_constant_folding_cond(TCG_TYPE_I32, op->args[2],
                                      op->args[4], cond);
         switch (i ^ inv) {
         case 0:
@@ -1331,6 +1338,15 @@ void tcg_optimize(TCGContext *s)
         init_arguments(&ctx, op, def->nb_oargs + def->nb_iargs);
         copy_propagate(&ctx, op, def->nb_oargs, def->nb_iargs);
 
+        /* Pre-compute the type of the operation. */
+        if (def->flags & TCG_OPF_VECTOR) {
+            ctx.type = TCG_TYPE_V64 + TCGOP_VECL(op);
+        } else if (def->flags & TCG_OPF_64BIT) {
+            ctx.type = TCG_TYPE_I64;
+        } else {
+            ctx.type = TCG_TYPE_I32;
+        }
+
         /* For commutative operations make constant second argument */
         switch (opc) {
         CASE_OP_32_64_VEC(add):
@@ -1411,19 +1427,24 @@ void tcg_optimize(TCGContext *s)
                     /* Proceed with possible constant folding. */
                     break;
                 }
-                if (opc == INDEX_op_sub_i32) {
+                switch (ctx.type) {
+                case TCG_TYPE_I32:
                     neg_op = INDEX_op_neg_i32;
                     have_neg = TCG_TARGET_HAS_neg_i32;
-                } else if (opc == INDEX_op_sub_i64) {
+                    break;
+                case TCG_TYPE_I64:
                     neg_op = INDEX_op_neg_i64;
                     have_neg = TCG_TARGET_HAS_neg_i64;
-                } else if (TCG_TARGET_HAS_neg_vec) {
-                    TCGType type = TCGOP_VECL(op) + TCG_TYPE_V64;
-                    unsigned vece = TCGOP_VECE(op);
-                    neg_op = INDEX_op_neg_vec;
-                    have_neg = tcg_can_emit_vec_op(neg_op, type, vece) > 0;
-                } else {
                     break;
+                case TCG_TYPE_V64:
+                case TCG_TYPE_V128:
+                case TCG_TYPE_V256:
+                    neg_op = INDEX_op_neg_vec;
+                    have_neg = tcg_can_emit_vec_op(neg_op, ctx.type,
+                                                   TCGOP_VECE(op)) > 0;
+                    break;
+                default:
+                    g_assert_not_reached();
                 }
                 if (!have_neg) {
                     break;
@@ -1476,15 +1497,23 @@ void tcg_optimize(TCGContext *s)
                 TCGOpcode not_op;
                 bool have_not;
 
-                if (def->flags & TCG_OPF_VECTOR) {
-                    not_op = INDEX_op_not_vec;
-                    have_not = TCG_TARGET_HAS_not_vec;
-                } else if (def->flags & TCG_OPF_64BIT) {
-                    not_op = INDEX_op_not_i64;
-                    have_not = TCG_TARGET_HAS_not_i64;
-                } else {
+                switch (ctx.type) {
+                case TCG_TYPE_I32:
                     not_op = INDEX_op_not_i32;
                     have_not = TCG_TARGET_HAS_not_i32;
+                    break;
+                case TCG_TYPE_I64:
+                    not_op = INDEX_op_not_i64;
+                    have_not = TCG_TARGET_HAS_not_i64;
+                    break;
+                case TCG_TYPE_V64:
+                case TCG_TYPE_V128:
+                case TCG_TYPE_V256:
+                    not_op = INDEX_op_not_vec;
+                    have_not = TCG_TARGET_HAS_not_vec;
+                    break;
+                default:
+                    g_assert_not_reached();
                 }
                 if (!have_not) {
                     break;
@@ -1755,7 +1784,7 @@ void tcg_optimize(TCGContext *s)
            below, we can ignore high bits, but for further optimizations we
            need to record that the high bits contain garbage.  */
         partmask = z_mask;
-        if (!(def->flags & TCG_OPF_64BIT)) {
+        if (ctx.type == TCG_TYPE_I32) {
             z_mask |= ~(tcg_target_ulong)0xffffffffu;
             partmask &= 0xffffffffu;
             affected &= 0xffffffffu;
-- 
2.25.1


