Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5AF425D99
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:33:12 +0200 (CEST)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYa4l-000675-6i
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUJ-0000RR-Oe
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0007Oe-7J
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:29 -0400
Received: by mail-pl1-x634.google.com with SMTP id y5so4645610pll.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NxFgWT4ru6x0IdGSyZDen0BhvRtc1g1hOUCqOyHF/68=;
 b=zZkrurEKQhCUEVfSlVlbcPaVJ4WnHZHOYdFePYdQ58zuxAB5PtHkkBuVTZoql0an4q
 HOXRv12PCS08/cosuvcrGfhsVGAD7dhq+Hv5DCOKPfJrEF7kVX+YzPaiFc94EczX22Eh
 Eqsuzuboqf71glJA0BZB9jGgXIUp1v7RUyWC3Ij+zrRjxDL4feLb0NxC1z0yKtysXL0L
 diINX9Fwo4KyATed+RRNxqt5MMz7eHXMEMmGjh61QZje5douZN/6PGS/bitZwyZMS6Z1
 YDgt5VIUMiM40oQ42YX2tkRmQalB1oITfLlaA+7j0JpER3t5m0jQJVBlqHc47dKH8ZtN
 4xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxFgWT4ru6x0IdGSyZDen0BhvRtc1g1hOUCqOyHF/68=;
 b=aIFJ+u/ubUUkGrtvRaHIafv0FSQJPlT9xYYOI44ChPRZXwzyzaERj7VIiUOXlv8G+R
 I+8gfyxCH92RLbsCzZwAMUa9jwGgGDqaSE5W/3HDhQb6hJ/gzorzCNhadm/I8wLTxqOm
 cfLmiqfimJ0+GusTmPvlIybkCFx3UFcwlNaaPIPVdZeHypYBPE+RY4f0YFIEDIY1/yGC
 5w5uzwe8HcNFMbZu13NtBADkhGViqvFmSAbJU7M5VXFc+M6HAp2eMg2kbROY0rquh+95
 6ASxZ2UYBCRZv+JhBHdJVqnIr9VvPXEFfDh+xDh8ZtpUxt6kSZy3ml9cHYX1+7esxQUp
 kceQ==
X-Gm-Message-State: AOAM530DJaoV2Kk8EnebG0gssCCftsLtbX7FkF+ixGCbGmqY3nZ0qkpg
 mfPDsHGY6uy2mmRpZ3Zo621odUDio2YIoA==
X-Google-Smtp-Source: ABdhPJyzUDrkYJug42yr4r/Du6DonyRV9eZ9fGWHdsG/Zr6ZKb3JN+3yt1eE2ZvMMAxtfLO+DI+wsA==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr7125266pjb.76.1633636522128; 
 Thu, 07 Oct 2021 12:55:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/48] tcg/optimize: Add type to OptContext
Date: Thu,  7 Oct 2021 12:54:41 -0700
Message-Id: <20211007195456.1168070-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Compute the type of the operation early.

There are at least 4 places that used a def->flags ladder
to determine the type of the operation being optimized.

There were two places that assumed !TCG_OPF_64BIT means
TCG_TYPE_I32, and so could potentially compute incorrect
results for vector operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 130 ++++++++++++++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 55 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 0734bcb42e..324866cbf1 100644
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
@@ -838,7 +837,7 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
          * Simplify EQ/NE comparisons where one of the pairs
          * can be simplified.
          */
-        i = do_constant_folding_cond(INDEX_op_brcond_i32, op->args[0],
+        i = do_constant_folding_cond(TCG_TYPE_I32, op->args[0],
                                      op->args[2], cond);
         switch (i ^ inv) {
         case 0:
@@ -847,7 +846,7 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
             goto do_brcond_high;
         }
 
-        i = do_constant_folding_cond(INDEX_op_brcond_i32, op->args[1],
+        i = do_constant_folding_cond(TCG_TYPE_I32, op->args[1],
                                      op->args[3], cond);
         switch (i ^ inv) {
         case 0:
@@ -889,7 +888,7 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
     if (arg_is_const(op->args[1])) {
         uint64_t t = arg_info(op->args[1])->val;
 
-        t = do_constant_folding(op->opc, t, op->args[2]);
+        t = do_constant_folding(op->opc, ctx->type, t, op->args[2]);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t);
     }
     return false;
@@ -933,7 +932,7 @@ static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
         uint64_t t = arg_info(op->args[1])->val;
 
         if (t != 0) {
-            t = do_constant_folding(op->opc, t, 0);
+            t = do_constant_folding(op->opc, ctx->type, t, 0);
             return tcg_opt_gen_movi(ctx, op, op->args[0], t);
         }
         return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[2]);
@@ -1060,9 +1059,8 @@ static bool fold_mov(OptContext *ctx, TCGOp *op)
 
 static bool fold_movcond(OptContext *ctx, TCGOp *op)
 {
-    TCGOpcode opc = op->opc;
     TCGCond cond = op->args[5];
-    int i = do_constant_folding_cond(opc, op->args[1], op->args[2], cond);
+    int i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
 
     if (i >= 0) {
         return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
@@ -1071,9 +1069,18 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
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
@@ -1164,7 +1171,7 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
 static bool fold_setcond(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[3];
-    int i = do_constant_folding_cond(op->opc, op->args[1], op->args[2], cond);
+    int i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
 
     if (i >= 0) {
         return tcg_opt_gen_movi(ctx, op, op->args[0], i);
@@ -1203,7 +1210,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
          * Simplify EQ/NE comparisons where one of the pairs
          * can be simplified.
          */
-        i = do_constant_folding_cond(INDEX_op_setcond_i32, op->args[1],
+        i = do_constant_folding_cond(TCG_TYPE_I32, op->args[1],
                                      op->args[3], cond);
         switch (i ^ inv) {
         case 0:
@@ -1212,7 +1219,7 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
             goto do_setcond_high;
         }
 
-        i = do_constant_folding_cond(INDEX_op_setcond_i32, op->args[2],
+        i = do_constant_folding_cond(TCG_TYPE_I32, op->args[2],
                                      op->args[4], cond);
         switch (i ^ inv) {
         case 0:
@@ -1314,6 +1321,15 @@ void tcg_optimize(TCGContext *s)
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
@@ -1394,18 +1410,18 @@ void tcg_optimize(TCGContext *s)
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
+                    break;
+                default:
                     neg_op = INDEX_op_neg_vec;
-                    have_neg = tcg_can_emit_vec_op(neg_op, type, vece) > 0;
-                } else {
+                    have_neg = tcg_can_emit_vec_op(neg_op, ctx.type, TCGOP_VECE(op)) > 0;
                     break;
                 }
                 if (!have_neg) {
@@ -1459,15 +1475,19 @@ void tcg_optimize(TCGContext *s)
                 TCGOpcode not_op;
                 bool have_not;
 
-                if (def->flags & TCG_OPF_VECTOR) {
+                switch (ctx.type) {
+                default:
                     not_op = INDEX_op_not_vec;
                     have_not = TCG_TARGET_HAS_not_vec;
-                } else if (def->flags & TCG_OPF_64BIT) {
+                    break;
+                case TCG_TYPE_I64:
                     not_op = INDEX_op_not_i64;
                     have_not = TCG_TARGET_HAS_not_i64;
-                } else {
+                    break;
+                case TCG_TYPE_I32:
                     not_op = INDEX_op_not_i32;
                     have_not = TCG_TARGET_HAS_not_i32;
+                    break;
                 }
                 if (!have_not) {
                     break;
@@ -1738,7 +1758,7 @@ void tcg_optimize(TCGContext *s)
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


