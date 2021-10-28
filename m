Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9113243D9D7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:25:02 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfw2H-00022t-G7
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPm-0001cM-3s
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:14 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPi-0006NG-QM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v16so3370033ple.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKLftSTQsQ1gAc3QxL60hYM2F6IdjBMip2wzW+AEFac=;
 b=u+XXDISjo2E7zXmLA8pzIBZiNLciSpaUiSWbCaC2yxg8JK7x/StSF5DAq4A9tNsmrp
 Hl+zzr7z13e5kPZd6f8eun+/x4CJqji8+yE61BnjelWojSNUlHbP1h7zYDx5brcuj+bg
 yRQpqgnz4D78ULZWtm85+ivIZG15z3hWTQONLcCIX2AykC7CnH2XpK/oNjXrjUApFVO3
 3AIM923K6/SdVRkvodBenV2+6LUIth3losOhXP3ZMjaItBygyXBlNi4aarVOm8lhB5RW
 Iik9It1CgMYbcePgKVNY2bWetgGxJWihVMsxEEbXiyzrkSCqbkNBK0aGuYBzReMlzlqd
 jyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKLftSTQsQ1gAc3QxL60hYM2F6IdjBMip2wzW+AEFac=;
 b=N/Jyz4tS8umiDgrlMERZREy8H5JYQdSkQit6cYJ/T6vJPU+BwjgnZ8TW/sy77LTPUR
 SMIXtqgATDC452Raj32hgn/G/Uy7Qjgt4uPGoChZnZr4jYXTpybGkFTYM+IghV1VSrQ0
 Z1eZhpQE7uM+mjQNvolXDjSGBwnZGuI84Z0u7dS6BaSvwU5bsgt8BpuoA4ZxCVCiszZc
 XmwQzxKEZTcKD9RgTrLjusRalppb+xwxg6FxjdNRPJGsJa0Qwnz/LRsmZEvGDkwdDwML
 YvuuPmcfO43dyP4qR+sfANtC4jSHTf0V+zXxctntiVovbi59Vpokc+7BFqp807Z71/El
 bflg==
X-Gm-Message-State: AOAM532feEeaV5KuVC+5koxMEcY8wQ09b7JtJzXJ2+NN2i0xWWPxpSaX
 fw/ptM43VVayFC8NcDGRWLssI1rzM7l2pg==
X-Google-Smtp-Source: ABdhPJzPRKaibNqZg0+MSYvo8Ex/fImf9/z9W0pnkmOCUNi6nKkbI8AmoiYyaEb+u6wfWkoWS1pRlA==
X-Received: by 2002:a17:902:ce85:b0:13e:dfc0:139 with SMTP id
 f5-20020a170902ce8500b0013edfc00139mr1263378plg.80.1635389107811; 
 Wed, 27 Oct 2021 19:45:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 52/56] tcg/optimize: Optimize sign extensions
Date: Wed, 27 Oct 2021 19:41:27 -0700
Message-Id: <20211028024131.1492790-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Certain targets, like riscv, produce signed 32-bit results.
This can lead to lots of redundant extensions as values are
manipulated.

Begin by tracking only the obvious sign-extensions, and
converting them to simple copies when possible.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 123 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 102 insertions(+), 21 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 7ac63c9231..ef202abbcb 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -43,6 +43,7 @@ typedef struct TempOptInfo {
     TCGTemp *next_copy;
     uint64_t val;
     uint64_t z_mask;  /* mask bit is 0 if and only if value bit is 0 */
+    uint64_t s_mask;  /* a left-aligned mask of clrsb(value) bits. */
 } TempOptInfo;
 
 typedef struct OptContext {
@@ -53,9 +54,37 @@ typedef struct OptContext {
     /* In flight values from optimization. */
     uint64_t a_mask;  /* mask bit is 0 iff value identical to first input */
     uint64_t z_mask;  /* mask bit is 0 iff value bit is 0 */
+    uint64_t s_mask;  /* mask of clrsb(value) bits */
     TCGType type;
 } OptContext;
 
+/* Calculate the smask for a specific value. */
+static uint64_t smask_from_value(uint64_t value)
+{
+    int rep = clrsb64(value);
+    return ~(~0ull >> rep);
+}
+
+/*
+ * Calculate the smask for a given set of known-zeros.
+ * If there are lots of zeros on the left, we can consider the remainder
+ * an unsigned field, and thus the corresponding signed field is one bit
+ * larger.
+ */
+static uint64_t smask_from_zmask(uint64_t zmask)
+{
+    /*
+     * Only the 0 bits are significant for zmask, thus the msb itself
+     * must be zero, else we have no sign information.
+     */
+    int rep = clz64(zmask);
+    if (rep == 0) {
+        return 0;
+    }
+    rep -= 1;
+    return ~(~0ull >> rep);
+}
+
 static inline TempOptInfo *ts_info(TCGTemp *ts)
 {
     return ts->state_ptr;
@@ -94,6 +123,7 @@ static void reset_ts(TCGTemp *ts)
     ti->prev_copy = ts;
     ti->is_const = false;
     ti->z_mask = -1;
+    ti->s_mask = 0;
 }
 
 static void reset_temp(TCGArg arg)
@@ -124,9 +154,11 @@ static void init_ts_info(OptContext *ctx, TCGTemp *ts)
         ti->is_const = true;
         ti->val = ts->val;
         ti->z_mask = ts->val;
+        ti->s_mask = smask_from_value(ts->val);
     } else {
         ti->is_const = false;
         ti->z_mask = -1;
+        ti->s_mask = 0;
     }
 }
 
@@ -220,6 +252,7 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
     op->args[1] = src;
 
     di->z_mask = si->z_mask;
+    di->s_mask = si->s_mask;
 
     if (src_ts->type == dst_ts->type) {
         TempOptInfo *ni = ts_info(si->next_copy);
@@ -658,13 +691,15 @@ static void finish_folding(OptContext *ctx, TCGOp *op)
 
     nb_oargs = def->nb_oargs;
     for (i = 0; i < nb_oargs; i++) {
-        reset_temp(op->args[i]);
+        TCGTemp *ts = arg_temp(op->args[i]);
+        reset_ts(ts);
         /*
-         * Save the corresponding known-zero bits mask for the
+         * Save the corresponding known-zero/sign bits mask for the
          * first output argument (only one supported so far).
          */
         if (i == 0) {
-            arg_info(op->args[i])->z_mask = ctx->z_mask;
+            ts_info(ts)->z_mask = ctx->z_mask;
+            ts_info(ts)->s_mask = ctx->s_mask;
         }
     }
 }
@@ -714,6 +749,7 @@ static bool fold_masks(OptContext *ctx, TCGOp *op)
 {
     uint64_t a_mask = ctx->a_mask;
     uint64_t z_mask = ctx->z_mask;
+    uint64_t s_mask = ctx->s_mask;
 
     /*
      * 32-bit ops generate 32-bit results, which for the purpose of
@@ -725,7 +761,9 @@ static bool fold_masks(OptContext *ctx, TCGOp *op)
     if (ctx->type == TCG_TYPE_I32) {
         a_mask = (int32_t)a_mask;
         z_mask = (int32_t)z_mask;
+        s_mask |= MAKE_64BIT_MASK(32, 32);
         ctx->z_mask = z_mask;
+        ctx->s_mask = s_mask;
     }
 
     if (z_mask == 0) {
@@ -1072,7 +1110,7 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 
 static bool fold_bswap(OptContext *ctx, TCGOp *op)
 {
-    uint64_t z_mask, sign;
+    uint64_t z_mask, s_mask, sign;
 
     if (arg_is_const(op->args[1])) {
         uint64_t t = arg_info(op->args[1])->val;
@@ -1082,6 +1120,7 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
     }
 
     z_mask = arg_info(op->args[1])->z_mask;
+
     switch (op->opc) {
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
@@ -1100,6 +1139,7 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
     default:
         g_assert_not_reached();
     }
+    s_mask = smask_from_zmask(z_mask);
 
     switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
     case TCG_BSWAP_OZ:
@@ -1108,14 +1148,17 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
         /* If the sign bit may be 1, force all the bits above to 1. */
         if (z_mask & sign) {
             z_mask |= sign;
+            s_mask = sign << 1;
         }
         break;
     default:
         /* The high bits are undefined: force all bits above the sign to 1. */
         z_mask |= sign << 1;
+        s_mask = 0;
         break;
     }
     ctx->z_mask = z_mask;
+    ctx->s_mask = s_mask;
 
     return fold_masks(ctx, op);
 }
@@ -1263,21 +1306,24 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
 static bool fold_extract(OptContext *ctx, TCGOp *op)
 {
     uint64_t z_mask_old, z_mask;
+    int pos = op->args[2];
+    int len = op->args[3];
 
     if (arg_is_const(op->args[1])) {
         uint64_t t;
 
         t = arg_info(op->args[1])->val;
-        t = extract64(t, op->args[2], op->args[3]);
+        t = extract64(t, pos, len);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t);
     }
 
     z_mask_old = arg_info(op->args[1])->z_mask;
-    z_mask = extract64(z_mask_old, op->args[2], op->args[3]);
-    if (op->args[2] == 0) {
+    z_mask = extract64(z_mask_old, pos, len);
+    if (pos == 0) {
         ctx->a_mask = z_mask_old ^ z_mask;
     }
     ctx->z_mask = z_mask;
+    ctx->s_mask = smask_from_zmask(z_mask);
 
     return fold_masks(ctx, op);
 }
@@ -1303,14 +1349,16 @@ static bool fold_extract2(OptContext *ctx, TCGOp *op)
 
 static bool fold_exts(OptContext *ctx, TCGOp *op)
 {
-    uint64_t z_mask_old, z_mask, sign;
+    uint64_t s_mask_old, s_mask, z_mask, sign;
     bool type_change = false;
 
     if (fold_const1(ctx, op)) {
         return true;
     }
 
-    z_mask_old = z_mask = arg_info(op->args[1])->z_mask;
+    z_mask = arg_info(op->args[1])->z_mask;
+    s_mask = arg_info(op->args[1])->s_mask;
+    s_mask_old = s_mask;
 
     switch (op->opc) {
     CASE_OP_32_64(ext8s):
@@ -1334,10 +1382,14 @@ static bool fold_exts(OptContext *ctx, TCGOp *op)
 
     if (z_mask & sign) {
         z_mask |= sign;
-    } else if (!type_change) {
-        ctx->a_mask = z_mask_old ^ z_mask;
     }
+    s_mask |= sign << 1;
+
     ctx->z_mask = z_mask;
+    ctx->s_mask = s_mask;
+    if (!type_change) {
+        ctx->a_mask = s_mask & ~s_mask_old;
+    }
 
     return fold_masks(ctx, op);
 }
@@ -1376,6 +1428,7 @@ static bool fold_extu(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = z_mask;
+    ctx->s_mask = smask_from_zmask(z_mask);
     if (!type_change) {
         ctx->a_mask = z_mask_old ^ z_mask;
     }
@@ -1606,8 +1659,12 @@ static bool fold_qemu_ld(OptContext *ctx, TCGOp *op)
     MemOp mop = get_memop(oi);
     int width = 8 * memop_size(mop);
 
-    if (!(mop & MO_SIGN) && width < 64) {
-        ctx->z_mask = MAKE_64BIT_MASK(0, width);
+    if (width < 64) {
+        ctx->s_mask = MAKE_64BIT_MASK(width, 64 - width);
+        if (!(mop & MO_SIGN)) {
+            ctx->z_mask = MAKE_64BIT_MASK(0, width);
+            ctx->s_mask <<= 1;
+        }
     }
 
     /* Opcodes that touch guest memory stop the mb optimization.  */
@@ -1726,23 +1783,31 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 
 static bool fold_sextract(OptContext *ctx, TCGOp *op)
 {
-    int64_t z_mask_old, z_mask;
+    uint64_t z_mask, s_mask, s_mask_old;
+    int pos = op->args[2];
+    int len = op->args[3];
 
     if (arg_is_const(op->args[1])) {
         uint64_t t;
 
         t = arg_info(op->args[1])->val;
-        t = sextract64(t, op->args[2], op->args[3]);
+        t = sextract64(t, pos, len);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t);
     }
 
-    z_mask_old = arg_info(op->args[1])->z_mask;
-    z_mask = sextract64(z_mask_old, op->args[2], op->args[3]);
-    if (op->args[2] == 0 && z_mask >= 0) {
-        ctx->a_mask = z_mask_old ^ z_mask;
-    }
+    z_mask = arg_info(op->args[1])->z_mask;
+    z_mask = sextract64(z_mask, pos, len);
     ctx->z_mask = z_mask;
 
+    s_mask_old = arg_info(op->args[1])->s_mask;
+    s_mask = sextract64(s_mask_old, pos, len);
+    s_mask |= MAKE_64BIT_MASK(len, 64 - len);
+    ctx->s_mask = s_mask;
+
+    if (pos == 0) {
+        ctx->a_mask = s_mask & ~s_mask_old;
+    }
+
     return fold_masks(ctx, op);
 }
 
@@ -1819,14 +1884,26 @@ static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
 {
     /* We can't do any folding with a load, but we can record bits. */
     switch (op->opc) {
+    CASE_OP_32_64(ld8s):
+        ctx->s_mask = MAKE_64BIT_MASK(8, 56);
+        break;
     CASE_OP_32_64(ld8u):
         ctx->z_mask = MAKE_64BIT_MASK(0, 8);
+        ctx->s_mask = MAKE_64BIT_MASK(9, 55);
+        break;
+    CASE_OP_32_64(ld16s):
+        ctx->s_mask = MAKE_64BIT_MASK(16, 48);
         break;
     CASE_OP_32_64(ld16u):
         ctx->z_mask = MAKE_64BIT_MASK(0, 16);
+        ctx->s_mask = MAKE_64BIT_MASK(17, 47);
+        break;
+    case INDEX_op_ld32s_i64:
+        ctx->s_mask = MAKE_64BIT_MASK(32, 32);
         break;
     case INDEX_op_ld32u_i64:
         ctx->z_mask = MAKE_64BIT_MASK(0, 32);
+        ctx->s_mask = MAKE_64BIT_MASK(33, 31);
         break;
     default:
         g_assert_not_reached();
@@ -1889,9 +1966,10 @@ void tcg_optimize(TCGContext *s)
             ctx.type = TCG_TYPE_I32;
         }
 
-        /* Assume all bits affected, and no bits known zero. */
+        /* Assume all bits affected, no bits known zero, no sign reps. */
         ctx.a_mask = -1;
         ctx.z_mask = -1;
+        ctx.s_mask = 0;
 
         /*
          * Process each opcode.
@@ -1964,8 +2042,11 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_extrh_i64_i32:
             done = fold_extu(&ctx, op);
             break;
+        CASE_OP_32_64(ld8s):
         CASE_OP_32_64(ld8u):
+        CASE_OP_32_64(ld16s):
         CASE_OP_32_64(ld16u):
+        case INDEX_op_ld32s_i64:
         case INDEX_op_ld32u_i64:
             done = fold_tcg_ld(&ctx, op);
             break;
-- 
2.25.1


