Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F58425DB1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:38:03 +0200 (CEST)
Received: from localhost ([::1]:45774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYa9S-00063s-R8
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXG-0007WJ-S5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:36 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXE-0003rv-ON
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:34 -0400
Received: by mail-pg1-x52a.google.com with SMTP id a73so884661pge.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=83IcPD3sEjLAMh7neKFO7FQGnXUuSkl6iYLPda+bmdU=;
 b=kI78ituul58hyq4Wxh6mXxNr9hdmoWRt51Rf1bgnQv7n52QD2e/LExqfsM6HqFDrwb
 LnSHXGwiV/M0hHwqVXPxscYXm//qqtUpn0+n2Um+CV0w+rbAc8NpQlHZ3THxPoD9+gzk
 NyPcRp2j3793LOHUuzub2vVLLQJ8z/0jlqWm7Du9P1BfeICu/48Vn5bP/R/ZdMSbdKsA
 QRpfPYjC1y6nVF80RYwkdpSEAVyaJQpf+X7zKKS1h7DcA2dvyABE/chsxQNE4NEOO39J
 V5Nd/B6uaUO4qAjGq3R116cCQNhsM6tghCNFKgHQGHIwtKyBRV7amfdtXuE0hXNOEcC2
 rDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83IcPD3sEjLAMh7neKFO7FQGnXUuSkl6iYLPda+bmdU=;
 b=RskKEaRBM25LjEczsMCiItCJXLoTi4PAaNsfKdEzYVaPCo9RdAR50RKhZF3j6NhwlR
 OXewJ5ertX78ogHXqI1NTcaZb5HjN6GoikNXjCsqduXeQ+dsED/YFTnCPzb7yU2SdNNU
 8FMzXHCbVjbyK86tWcSq+A8irl3Gl9ldLsLqriWWWJZgsBKmNMwDVH2dxNya9+LcQCTz
 B+f37JHfypYf5fEcWSjQF+vLtecFKthqyn0ngDB+LpC8YfzRXuKIMfungC3FhUYNKind
 AtQWX5+oPmyiLX4Cklm0tiBn94jZ9iMcuvrqWhO7oW8rrcshKgfVkbTtw8dgPkTNWJRi
 SUgw==
X-Gm-Message-State: AOAM530pmGjo+QIDafCfqjTxfcPw7K70oaaJpPH6sMBtm6qBTuIqDXXi
 tTWwmFszrKDeU2jvhgxljrxP1cYHPxSbfQ==
X-Google-Smtp-Source: ABdhPJxnYTszZEVofAE5KGozQlBojByQDHfeuAlk9luDiRAiwrO7Rrqtcxx1wKF3ncij30ViI5Bryw==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id
 c8-20020a056a000ac8b0290320a6bb880dmr6252359pfl.41.1633636711296; 
 Thu, 07 Oct 2021 12:58:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 44/48] tcg/optimize: Optimize sign extensions
Date: Thu,  7 Oct 2021 12:54:52 -0700
Message-Id: <20211007195456.1168070-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Certain targets, like riscv, produce signed 32-bit results.
This can lead to lots of redundant extensions as values are
manipulated.

Begin by tracking only the obvious sign-extensions, and
converting them to simple copies when possible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 129 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 105 insertions(+), 24 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5ef41e2769..06b178aa4a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -42,6 +42,7 @@ typedef struct TempOptInfo {
     TCGTemp *next_copy;
     uint64_t val;
     uint64_t z_mask;  /* mask bit is 0 if and only if value bit is 0 */
+    uint64_t s_mask;  /* a left-aligned mask of clrsb(value) bits. */
 } TempOptInfo;
 
 typedef struct OptContext {
@@ -52,9 +53,37 @@ typedef struct OptContext {
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
@@ -93,6 +122,7 @@ static void reset_ts(TCGTemp *ts)
     ti->prev_copy = ts;
     ti->is_const = false;
     ti->z_mask = -1;
+    ti->s_mask = 0;
 }
 
 static void reset_temp(TCGArg arg)
@@ -123,9 +153,11 @@ static void init_ts_info(OptContext *ctx, TCGTemp *ts)
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
 
@@ -219,6 +251,7 @@ static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
     op->args[1] = src;
 
     di->z_mask = si->z_mask;
+    di->s_mask = si->s_mask;
 
     if (src_ts->type == dst_ts->type) {
         TempOptInfo *ni = ts_info(si->next_copy);
@@ -644,13 +677,15 @@ static void finish_folding(OptContext *ctx, TCGOp *op)
 
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
@@ -700,6 +735,7 @@ static bool fold_masks(OptContext *ctx, TCGOp *op)
 {
     uint64_t a_mask = ctx->a_mask;
     uint64_t z_mask = ctx->z_mask;
+    uint64_t s_mask = ctx->s_mask;
 
     /*
      * 32-bit ops generate 32-bit results, which for the purpose of
@@ -711,7 +747,9 @@ static bool fold_masks(OptContext *ctx, TCGOp *op)
     if (ctx->type == TCG_TYPE_I32) {
         a_mask = (int32_t)a_mask;
         z_mask = (int32_t)z_mask;
+        s_mask |= MAKE_64BIT_MASK(32, 32);
         ctx->z_mask = z_mask;
+        ctx->s_mask = s_mask;
     }
 
     if (z_mask == 0) {
@@ -1059,7 +1097,7 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 
 static bool fold_bswap(OptContext *ctx, TCGOp *op)
 {
-    uint64_t z_mask, sign;
+    uint64_t z_mask, s_mask, sign;
 
     if (arg_is_const(op->args[1])) {
         uint64_t t = arg_info(op->args[1])->val;
@@ -1069,6 +1107,7 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
     }
 
     z_mask = arg_info(op->args[1])->z_mask;
+
     switch (op->opc) {
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
@@ -1087,6 +1126,7 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
     default:
         g_assert_not_reached();
     }
+    s_mask = smask_from_zmask(z_mask);
 
     switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
     case TCG_BSWAP_OZ:
@@ -1095,14 +1135,17 @@ static bool fold_bswap(OptContext *ctx, TCGOp *op)
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
@@ -1241,21 +1284,24 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
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
-    z_mask = sextract64(z_mask_old, op->args[2], op->args[3]);
-    if (op->args[2] == 0) {
+    z_mask = extract64(z_mask_old, pos, len);
+    if (pos == 0) {
         ctx->a_mask = z_mask_old ^ z_mask;
     }
     ctx->z_mask = z_mask;
+    ctx->s_mask = smask_from_zmask(z_mask);
 
     return fold_masks(ctx, op);
 }
@@ -1281,14 +1327,16 @@ static bool fold_extract2(OptContext *ctx, TCGOp *op)
 
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
@@ -1312,10 +1360,14 @@ static bool fold_exts(OptContext *ctx, TCGOp *op)
 
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
@@ -1354,6 +1406,7 @@ static bool fold_extu(OptContext *ctx, TCGOp *op)
     }
 
     ctx->z_mask = z_mask;
+    ctx->s_mask = smask_from_zmask(z_mask);
     if (!type_change) {
         ctx->a_mask = z_mask_old ^ z_mask;
     }
@@ -1574,8 +1627,12 @@ static bool fold_qemu_ld(OptContext *ctx, TCGOp *op)
     MemOp mop = get_memop(oi);
     int width = 8 << (mop & MO_SIZE);
 
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
@@ -1685,23 +1742,31 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 
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
 
@@ -1778,14 +1843,26 @@ static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
 {
     /* We can't do any folding with a load, but we can record bits. */
     switch (op->opc) {
+    CASE_OP_32_64(ld8s):
+        ctx->s_mask = MAKE_64BIT_MASK(8, 56);
+        break;
     CASE_OP_32_64(ld8u):
-        ctx->z_mask = 0xff;
+        ctx->z_mask = MAKE_64BIT_MASK(0, 8);
+        ctx->s_mask = MAKE_64BIT_MASK(9, 55);
+        break;
+    CASE_OP_32_64(ld16s):
+        ctx->s_mask = MAKE_64BIT_MASK(16, 48);
         break;
     CASE_OP_32_64(ld16u):
-        ctx->z_mask = 0xffff;
+        ctx->z_mask = MAKE_64BIT_MASK(0, 16);
+        ctx->s_mask = MAKE_64BIT_MASK(17, 47);
+        break;
+    case INDEX_op_ld32s_i64:
+        ctx->s_mask = MAKE_64BIT_MASK(32, 32);
         break;
     case INDEX_op_ld32u_i64:
-        ctx->z_mask = 0xffffffffu;
+        ctx->z_mask = MAKE_64BIT_MASK(0, 32);
+        ctx->s_mask = MAKE_64BIT_MASK(33, 31);
         break;
     default:
         g_assert_not_reached();
@@ -1848,9 +1925,10 @@ void tcg_optimize(TCGContext *s)
             ctx.type = TCG_TYPE_I32;
         }
 
-        /* Assume all bits affected, and no bits known zero. */
+        /* Assume all bits affected, no bits known zero, no sign reps. */
         ctx.a_mask = -1;
         ctx.z_mask = -1;
+        ctx.s_mask = 0;
 
         /*
          * Process each opcode.
@@ -1923,8 +2001,11 @@ void tcg_optimize(TCGContext *s)
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


