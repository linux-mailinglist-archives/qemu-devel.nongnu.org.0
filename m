Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F088243BDF9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:36:27 +0200 (CEST)
Received: from localhost ([::1]:37078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVzW-0007zt-VQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaM-0003Zi-W8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:27 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaH-00025E-9b
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:26 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so662232plc.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JH7+yeHZn0ym/koyQpEJgke8cqeJnnG3xii+2x78ihg=;
 b=JSm7VElf94lFdM6faRA9BllmanSN9XrvWaM8vRykk+KmJU676STfNnN56CP8G07Qir
 TVCD9rHuCJUAt3X9bjV2VU1tqobeDd4XO4g57revQTX61ADZXnzAM5x37I3iP8CNzFGV
 drZMhM6yYJu/TrlWF2mEX7NotA49zsChDxwZygKX6WqjMiw9ofxGLyIwPJ7qRXKKxj9h
 h1fDSt3x1ix4IejRzcGEXwZVJ31Fu4OZ2Ql2VFCeXtdtNrRbISKlsyBBXOZgQh2cS8H0
 A1wwOQwePii+n7HMVzbZf874JXYrIFGGiISyXQj0/iBPpoMFSl+Kby7Fi2DY1TYgShXh
 93ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JH7+yeHZn0ym/koyQpEJgke8cqeJnnG3xii+2x78ihg=;
 b=Tye2u2CiaihiG3vkiQs9Jld3DD23nKAfmP6juv8+ghu+gCr8wVBRHcbHkqJaPYd0Xw
 CTOOBv3tJP1n++jGjlYj7J+KHO7j9shGCvWeB2VEkzivTX1sVJWbepc8K8LHqQtozjvi
 ddiPfJ1vWC/alrOqUAFJZ9UNKM9Qv46+HkAsICoLku6weQS0Cf4g1AiMZ8rsLkBAuM8P
 XLvlVZXLRAPwMPv9Kz7AMxNMdFOSPb9/ZdP06GzApbtioCN4u6f4jFoYZkP6033vU5Hk
 4Gk6QxSBJDTsKdq7yz7grM+NxlsvnZ3/jg2M3U5flQq4q5eqww87W1tf3bfjOI9S6c0k
 UlJQ==
X-Gm-Message-State: AOAM531hlKt10Evni5geNftjLK68IfWqZKurgJ/1BQOlqzxg5+sLbyt+
 0Xiy2VXf6g86WVCYy9/t2FVixyiYan9zHQ==
X-Google-Smtp-Source: ABdhPJzwmgMsg8DyOMxTOJxlKXzzfAYX3KGJ6beGNtucTHLG+5w9H4ZlXL/S8xg2KzGbQUe5vA1IpA==
X-Received: by 2002:a17:90b:224a:: with SMTP id
 hk10mr1878770pjb.139.1635289819305; 
 Tue, 26 Oct 2021 16:10:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 38/51] tcg/optimize: Split out fold_masks
Date: Tue, 26 Oct 2021 16:09:30 -0700
Message-Id: <20211026230943.1225890-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move all of the known-zero optimizations into the per-opcode
functions.  Use fold_masks when there is a possibility of the
result being determined, and simply set ctx->z_mask otherwise.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 545 ++++++++++++++++++++++++++-----------------------
 1 file changed, 294 insertions(+), 251 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index bf74b77355..cca1e37256 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -50,7 +50,8 @@ typedef struct OptContext {
     TCGTempSet temps_used;
 
     /* In flight values from optimization. */
-    uint64_t z_mask;
+    uint64_t a_mask;  /* mask bit is 0 iff value identical to first input */
+    uint64_t z_mask;  /* mask bit is 0 iff value bit is 0 */
     TCGType type;
 } OptContext;
 
@@ -694,6 +695,31 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_masks(OptContext *ctx, TCGOp *op)
+{
+    uint64_t a_mask = ctx->a_mask;
+    uint64_t z_mask = ctx->z_mask;
+
+    /*
+     * 32-bit ops generate 32-bit results.  For the result is zero test
+     * below, we can ignore high bits, but for further optimizations we
+     * need to record that the high bits contain garbage.
+     */
+    if (ctx->type == TCG_TYPE_I32) {
+        ctx->z_mask |= MAKE_64BIT_MASK(32, 32);
+        a_mask &= MAKE_64BIT_MASK(0, 32);
+        z_mask &= MAKE_64BIT_MASK(0, 32);
+    }
+
+    if (z_mask == 0) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], 0);
+    }
+    if (a_mask == 0) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+    }
+    return false;
+}
+
 /*
  * Convert @op to NOT, if NOT is supported by the host.
  * Return true f the conversion is successful, which will still
@@ -847,24 +873,55 @@ static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
 
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
+    uint64_t z1, z2;
+
     if (fold_const2(ctx, op) ||
         fold_xi_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
-    return false;
+
+    z1 = arg_info(op->args[1])->z_mask;
+    z2 = arg_info(op->args[2])->z_mask;
+    ctx->z_mask = z1 & z2;
+
+    /*
+     * Known-zeros does not imply known-ones.  Therefore unless
+     * arg2 is constant, we can't infer affected bits from it.
+     */
+    if (arg_is_const(op->args[2])) {
+        ctx->a_mask = z1 & ~z2;
+    }
+
+    return fold_masks(ctx, op);
 }
 
 static bool fold_andc(OptContext *ctx, TCGOp *op)
 {
+    uint64_t z1;
+
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_ix_to_not(ctx, op, -1)) {
         return true;
     }
-    return false;
+
+    z1 = arg_info(op->args[1])->z_mask;
+
+    /*
+     * Known-zeros does not imply known-ones.  Therefore unless
+     * arg2 is constant, we can't infer anything from it.
+     */
+    if (arg_is_const(op->args[2])) {
+        uint64_t z2 = ~arg_info(op->args[2])->z_mask;
+        ctx->a_mask = z1 & ~z2;
+        z1 &= z2;
+    }
+    ctx->z_mask = z1;
+
+    return fold_masks(ctx, op);
 }
 
 static bool fold_brcond(OptContext *ctx, TCGOp *op)
@@ -963,13 +1020,52 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 
 static bool fold_bswap(OptContext *ctx, TCGOp *op)
 {
+    uint64_t z_mask, sign;
+
     if (arg_is_const(op->args[1])) {
         uint64_t t = arg_info(op->args[1])->val;
 
         t = do_constant_folding(op->opc, ctx->type, t, op->args[2]);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t);
     }
-    return false;
+
+    z_mask = arg_info(op->args[1])->z_mask;
+    switch (op->opc) {
+    case INDEX_op_bswap16_i32:
+    case INDEX_op_bswap16_i64:
+        z_mask = bswap16(z_mask);
+        sign = INT16_MIN;
+        break;
+    case INDEX_op_bswap32_i32:
+    case INDEX_op_bswap32_i64:
+        z_mask = bswap32(z_mask);
+        sign = INT32_MIN;
+        break;
+    case INDEX_op_bswap64_i64:
+        z_mask = bswap64(z_mask);
+        sign = INT64_MIN;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
+    case TCG_BSWAP_OZ:
+        break;
+    case TCG_BSWAP_OS:
+        /* If the sign bit may be 1, force all the bits above to 1. */
+        if (z_mask & sign) {
+            z_mask |= sign;
+        }
+        break;
+    default:
+        /* The high bits are undefined: force all bits above the sign to 1. */
+        z_mask |= sign << 1;
+        break;
+    }
+    ctx->z_mask = z_mask;
+
+    return fold_masks(ctx, op);
 }
 
 static bool fold_call(OptContext *ctx, TCGOp *op)
@@ -1006,6 +1102,8 @@ static bool fold_call(OptContext *ctx, TCGOp *op)
 
 static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
 {
+    uint64_t z_mask;
+
     if (arg_is_const(op->args[1])) {
         uint64_t t = arg_info(op->args[1])->val;
 
@@ -1015,12 +1113,39 @@ static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
         }
         return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[2]);
     }
+
+    switch (ctx->type) {
+    case TCG_TYPE_I32:
+        z_mask = 31;
+        break;
+    case TCG_TYPE_I64:
+        z_mask = 63;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    ctx->z_mask = arg_info(op->args[2])->z_mask | z_mask;
+
     return false;
 }
 
 static bool fold_ctpop(OptContext *ctx, TCGOp *op)
 {
-    return fold_const1(ctx, op);
+    if (fold_const1(ctx, op)) {
+        return true;
+    }
+
+    switch (ctx->type) {
+    case TCG_TYPE_I32:
+        ctx->z_mask = 32 | 31;
+        break;
+    case TCG_TYPE_I64:
+        ctx->z_mask = 64 | 63;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return false;
 }
 
 static bool fold_deposit(OptContext *ctx, TCGOp *op)
@@ -1032,6 +1157,10 @@ static bool fold_deposit(OptContext *ctx, TCGOp *op)
         t1 = deposit64(t1, op->args[3], op->args[4], t2);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t1);
     }
+
+    ctx->z_mask = deposit64(arg_info(op->args[1])->z_mask,
+                            op->args[3], op->args[4],
+                            arg_info(op->args[2])->z_mask);
     return false;
 }
 
@@ -1077,6 +1206,8 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
 
 static bool fold_extract(OptContext *ctx, TCGOp *op)
 {
+    uint64_t z_mask_old, z_mask;
+
     if (arg_is_const(op->args[1])) {
         uint64_t t;
 
@@ -1084,7 +1215,15 @@ static bool fold_extract(OptContext *ctx, TCGOp *op)
         t = extract64(t, op->args[2], op->args[3]);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t);
     }
-    return false;
+
+    z_mask_old = arg_info(op->args[1])->z_mask;
+    z_mask = sextract64(z_mask_old, op->args[2], op->args[3]);
+    if (op->args[2] == 0) {
+        ctx->a_mask = z_mask_old ^ z_mask;
+    }
+    ctx->z_mask = z_mask;
+
+    return fold_masks(ctx, op);
 }
 
 static bool fold_extract2(OptContext *ctx, TCGOp *op)
@@ -1108,12 +1247,83 @@ static bool fold_extract2(OptContext *ctx, TCGOp *op)
 
 static bool fold_exts(OptContext *ctx, TCGOp *op)
 {
-    return fold_const1(ctx, op);
+    uint64_t z_mask_old, z_mask, sign;
+    bool type_change = false;
+
+    if (fold_const1(ctx, op)) {
+        return true;
+    }
+
+    z_mask_old = z_mask = arg_info(op->args[1])->z_mask;
+
+    switch (op->opc) {
+    CASE_OP_32_64(ext8s):
+        sign = INT8_MIN;
+        z_mask = (uint8_t)z_mask;
+        break;
+    CASE_OP_32_64(ext16s):
+        sign = INT16_MIN;
+        z_mask = (uint16_t)z_mask;
+        break;
+    case INDEX_op_ext_i32_i64:
+        type_change = true;
+        QEMU_FALLTHROUGH;
+    case INDEX_op_ext32s_i64:
+        sign = INT32_MIN;
+        z_mask = (uint32_t)z_mask;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (z_mask & sign) {
+        z_mask |= sign;
+    } else if (!type_change) {
+        ctx->a_mask = z_mask_old ^ z_mask;
+    }
+    ctx->z_mask = z_mask;
+
+    return fold_masks(ctx, op);
 }
 
 static bool fold_extu(OptContext *ctx, TCGOp *op)
 {
-    return fold_const1(ctx, op);
+    uint64_t z_mask_old, z_mask;
+    bool type_change = false;
+
+    if (fold_const1(ctx, op)) {
+        return true;
+    }
+
+    z_mask_old = z_mask = arg_info(op->args[1])->z_mask;
+
+    switch (op->opc) {
+    CASE_OP_32_64(ext8u):
+        z_mask = (uint8_t)z_mask;
+        break;
+    CASE_OP_32_64(ext16u):
+        z_mask = (uint16_t)z_mask;
+        break;
+    case INDEX_op_extrl_i64_i32:
+    case INDEX_op_extu_i32_i64:
+        type_change = true;
+        QEMU_FALLTHROUGH;
+    case INDEX_op_ext32u_i64:
+        z_mask = (uint32_t)z_mask;
+        break;
+    case INDEX_op_extrh_i64_i32:
+        type_change = true;
+        z_mask >>= 32;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    ctx->z_mask = z_mask;
+    if (!type_change) {
+        ctx->a_mask = z_mask_old ^ z_mask;
+    }
+    return fold_masks(ctx, op);
 }
 
 static bool fold_mb(OptContext *ctx, TCGOp *op)
@@ -1154,6 +1364,9 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
         return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
     }
 
+    ctx->z_mask = arg_info(op->args[3])->z_mask
+                | arg_info(op->args[4])->z_mask;
+
     if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
         uint64_t tv = arg_info(op->args[3])->val;
         uint64_t fv = arg_info(op->args[4])->val;
@@ -1228,9 +1441,16 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
 
 static bool fold_neg(OptContext *ctx, TCGOp *op)
 {
+    uint64_t z_mask;
+
     if (fold_const1(ctx, op)) {
         return true;
     }
+
+    /* Set to 1 all bits to the left of the rightmost.  */
+    z_mask = arg_info(op->args[1])->z_mask;
+    ctx->z_mask = -(z_mask & -z_mask);
+
     /*
      * Because of fold_sub_to_neg, we want to always return true,
      * via finish_folding.
@@ -1266,7 +1486,10 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
         fold_xx_to_x(ctx, op)) {
         return true;
     }
-    return false;
+
+    ctx->z_mask = arg_info(op->args[1])->z_mask
+                | arg_info(op->args[2])->z_mask;
+    return fold_masks(ctx, op);
 }
 
 static bool fold_orc(OptContext *ctx, TCGOp *op)
@@ -1281,6 +1504,15 @@ static bool fold_orc(OptContext *ctx, TCGOp *op)
 
 static bool fold_qemu_ld(OptContext *ctx, TCGOp *op)
 {
+    const TCGOpDef *def = &tcg_op_defs[op->opc];
+    MemOpIdx oi = op->args[def->nb_oargs + def->nb_iargs];
+    MemOp mop = get_memop(oi);
+    int width = 8 * memop_size(mop);
+
+    if (!(mop & MO_SIGN) && width < 64) {
+        ctx->z_mask = MAKE_64BIT_MASK(0, width);
+    }
+
     /* Opcodes that touch guest memory stop the mb optimization.  */
     ctx->prev_mb = NULL;
     return false;
@@ -1306,6 +1538,8 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
     if (i >= 0) {
         return tcg_opt_gen_movi(ctx, op, op->args[0], i);
     }
+
+    ctx->z_mask = 1;
     return false;
 }
 
@@ -1372,6 +1606,8 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
         op->opc = INDEX_op_setcond_i32;
         break;
     }
+
+    ctx->z_mask = 1;
     return false;
 
  do_setcond_const:
@@ -1380,6 +1616,8 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 
 static bool fold_sextract(OptContext *ctx, TCGOp *op)
 {
+    int64_t z_mask_old, z_mask;
+
     if (arg_is_const(op->args[1])) {
         uint64_t t;
 
@@ -1387,7 +1625,15 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
         t = sextract64(t, op->args[2], op->args[3]);
         return tcg_opt_gen_movi(ctx, op, op->args[0], t);
     }
-    return false;
+
+    z_mask_old = arg_info(op->args[1])->z_mask;
+    z_mask = sextract64(z_mask_old, op->args[2], op->args[3]);
+    if (op->args[2] == 0 && z_mask >= 0) {
+        ctx->a_mask = z_mask_old ^ z_mask;
+    }
+    ctx->z_mask = z_mask;
+
+    return fold_masks(ctx, op);
 }
 
 static bool fold_shift(OptContext *ctx, TCGOp *op)
@@ -1397,6 +1643,13 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
+
+    if (arg_is_const(op->args[2])) {
+        ctx->z_mask = do_constant_folding(op->opc, ctx->type,
+                                          arg_info(op->args[1])->z_mask,
+                                          arg_info(op->args[2])->val);
+        return fold_masks(ctx, op);
+    }
     return false;
 }
 
@@ -1452,6 +1705,25 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
     return fold_addsub2_i32(ctx, op, false);
 }
 
+static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
+{
+    /* We can't do any folding with a load, but we can record bits. */
+    switch (op->opc) {
+    CASE_OP_32_64(ld8u):
+        ctx->z_mask = MAKE_64BIT_MASK(0, 8);
+        break;
+    CASE_OP_32_64(ld16u):
+        ctx->z_mask = MAKE_64BIT_MASK(0, 16);
+        break;
+    case INDEX_op_ld32u_i64:
+        ctx->z_mask = MAKE_64BIT_MASK(0, 32);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return false;
+}
+
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
@@ -1460,7 +1732,10 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
-    return false;
+
+    ctx->z_mask = arg_info(op->args[1])->z_mask
+                | arg_info(op->args[2])->z_mask;
+    return fold_masks(ctx, op);
 }
 
 /* Propagate constants and copies, fold constant expressions. */
@@ -1481,7 +1756,6 @@ void tcg_optimize(TCGContext *s)
     }
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
-        uint64_t z_mask, partmask, affected, tmp;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def;
         bool done = false;
@@ -1562,245 +1836,9 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify using known-zero bits. Currently only ops with a single
-           output argument is supported. */
-        z_mask = -1;
-        affected = -1;
-        switch (opc) {
-        CASE_OP_32_64(ext8s):
-            if ((arg_info(op->args[1])->z_mask & 0x80) != 0) {
-                break;
-            }
-            QEMU_FALLTHROUGH;
-        CASE_OP_32_64(ext8u):
-            z_mask = 0xff;
-            goto and_const;
-        CASE_OP_32_64(ext16s):
-            if ((arg_info(op->args[1])->z_mask & 0x8000) != 0) {
-                break;
-            }
-            QEMU_FALLTHROUGH;
-        CASE_OP_32_64(ext16u):
-            z_mask = 0xffff;
-            goto and_const;
-        case INDEX_op_ext32s_i64:
-            if ((arg_info(op->args[1])->z_mask & 0x80000000) != 0) {
-                break;
-            }
-            QEMU_FALLTHROUGH;
-        case INDEX_op_ext32u_i64:
-            z_mask = 0xffffffffU;
-            goto and_const;
-
-        CASE_OP_32_64(and):
-            z_mask = arg_info(op->args[2])->z_mask;
-            if (arg_is_const(op->args[2])) {
-        and_const:
-                affected = arg_info(op->args[1])->z_mask & ~z_mask;
-            }
-            z_mask = arg_info(op->args[1])->z_mask & z_mask;
-            break;
-
-        case INDEX_op_ext_i32_i64:
-            if ((arg_info(op->args[1])->z_mask & 0x80000000) != 0) {
-                break;
-            }
-            QEMU_FALLTHROUGH;
-        case INDEX_op_extu_i32_i64:
-            /* We do not compute affected as it is a size changing op.  */
-            z_mask = (uint32_t)arg_info(op->args[1])->z_mask;
-            break;
-
-        CASE_OP_32_64(andc):
-            /* Known-zeros does not imply known-ones.  Therefore unless
-               op->args[2] is constant, we can't infer anything from it.  */
-            if (arg_is_const(op->args[2])) {
-                z_mask = ~arg_info(op->args[2])->z_mask;
-                goto and_const;
-            }
-            /* But we certainly know nothing outside args[1] may be set. */
-            z_mask = arg_info(op->args[1])->z_mask;
-            break;
-
-        case INDEX_op_sar_i32:
-            if (arg_is_const(op->args[2])) {
-                tmp = arg_info(op->args[2])->val & 31;
-                z_mask = (int32_t)arg_info(op->args[1])->z_mask >> tmp;
-            }
-            break;
-        case INDEX_op_sar_i64:
-            if (arg_is_const(op->args[2])) {
-                tmp = arg_info(op->args[2])->val & 63;
-                z_mask = (int64_t)arg_info(op->args[1])->z_mask >> tmp;
-            }
-            break;
-
-        case INDEX_op_shr_i32:
-            if (arg_is_const(op->args[2])) {
-                tmp = arg_info(op->args[2])->val & 31;
-                z_mask = (uint32_t)arg_info(op->args[1])->z_mask >> tmp;
-            }
-            break;
-        case INDEX_op_shr_i64:
-            if (arg_is_const(op->args[2])) {
-                tmp = arg_info(op->args[2])->val & 63;
-                z_mask = (uint64_t)arg_info(op->args[1])->z_mask >> tmp;
-            }
-            break;
-
-        case INDEX_op_extrl_i64_i32:
-            z_mask = (uint32_t)arg_info(op->args[1])->z_mask;
-            break;
-        case INDEX_op_extrh_i64_i32:
-            z_mask = (uint64_t)arg_info(op->args[1])->z_mask >> 32;
-            break;
-
-        CASE_OP_32_64(shl):
-            if (arg_is_const(op->args[2])) {
-                tmp = arg_info(op->args[2])->val & (TCG_TARGET_REG_BITS - 1);
-                z_mask = arg_info(op->args[1])->z_mask << tmp;
-            }
-            break;
-
-        CASE_OP_32_64(neg):
-            /* Set to 1 all bits to the left of the rightmost.  */
-            z_mask = -(arg_info(op->args[1])->z_mask
-                       & -arg_info(op->args[1])->z_mask);
-            break;
-
-        CASE_OP_32_64(deposit):
-            z_mask = deposit64(arg_info(op->args[1])->z_mask,
-                               op->args[3], op->args[4],
-                               arg_info(op->args[2])->z_mask);
-            break;
-
-        CASE_OP_32_64(extract):
-            z_mask = extract64(arg_info(op->args[1])->z_mask,
-                               op->args[2], op->args[3]);
-            if (op->args[2] == 0) {
-                affected = arg_info(op->args[1])->z_mask & ~z_mask;
-            }
-            break;
-        CASE_OP_32_64(sextract):
-            z_mask = sextract64(arg_info(op->args[1])->z_mask,
-                                op->args[2], op->args[3]);
-            if (op->args[2] == 0 && (tcg_target_long)z_mask >= 0) {
-                affected = arg_info(op->args[1])->z_mask & ~z_mask;
-            }
-            break;
-
-        CASE_OP_32_64(or):
-        CASE_OP_32_64(xor):
-            z_mask = arg_info(op->args[1])->z_mask
-                   | arg_info(op->args[2])->z_mask;
-            break;
-
-        case INDEX_op_clz_i32:
-        case INDEX_op_ctz_i32:
-            z_mask = arg_info(op->args[2])->z_mask | 31;
-            break;
-
-        case INDEX_op_clz_i64:
-        case INDEX_op_ctz_i64:
-            z_mask = arg_info(op->args[2])->z_mask | 63;
-            break;
-
-        case INDEX_op_ctpop_i32:
-            z_mask = 32 | 31;
-            break;
-        case INDEX_op_ctpop_i64:
-            z_mask = 64 | 63;
-            break;
-
-        CASE_OP_32_64(setcond):
-        case INDEX_op_setcond2_i32:
-            z_mask = 1;
-            break;
-
-        CASE_OP_32_64(movcond):
-            z_mask = arg_info(op->args[3])->z_mask
-                   | arg_info(op->args[4])->z_mask;
-            break;
-
-        CASE_OP_32_64(ld8u):
-            z_mask = 0xff;
-            break;
-        CASE_OP_32_64(ld16u):
-            z_mask = 0xffff;
-            break;
-        case INDEX_op_ld32u_i64:
-            z_mask = 0xffffffffu;
-            break;
-
-        CASE_OP_32_64(qemu_ld):
-            {
-                MemOpIdx oi = op->args[def->nb_oargs + def->nb_iargs];
-                MemOp mop = get_memop(oi);
-                if (!(mop & MO_SIGN)) {
-                    z_mask = (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - 1;
-                }
-            }
-            break;
-
-        CASE_OP_32_64(bswap16):
-            z_mask = arg_info(op->args[1])->z_mask;
-            if (z_mask <= 0xffff) {
-                op->args[2] |= TCG_BSWAP_IZ;
-            }
-            z_mask = bswap16(z_mask);
-            switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
-            case TCG_BSWAP_OZ:
-                break;
-            case TCG_BSWAP_OS:
-                z_mask = (int16_t)z_mask;
-                break;
-            default: /* undefined high bits */
-                z_mask |= MAKE_64BIT_MASK(16, 48);
-                break;
-            }
-            break;
-
-        case INDEX_op_bswap32_i64:
-            z_mask = arg_info(op->args[1])->z_mask;
-            if (z_mask <= 0xffffffffu) {
-                op->args[2] |= TCG_BSWAP_IZ;
-            }
-            z_mask = bswap32(z_mask);
-            switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
-            case TCG_BSWAP_OZ:
-                break;
-            case TCG_BSWAP_OS:
-                z_mask = (int32_t)z_mask;
-                break;
-            default: /* undefined high bits */
-                z_mask |= MAKE_64BIT_MASK(32, 32);
-                break;
-            }
-            break;
-
-        default:
-            break;
-        }
-
-        /* 32-bit ops generate 32-bit results.  For the result is zero test
-           below, we can ignore high bits, but for further optimizations we
-           need to record that the high bits contain garbage.  */
-        partmask = z_mask;
-        if (ctx.type == TCG_TYPE_I32) {
-            z_mask |= ~(tcg_target_ulong)0xffffffffu;
-            partmask &= 0xffffffffu;
-            affected &= 0xffffffffu;
-        }
-        ctx.z_mask = z_mask;
-
-        if (partmask == 0) {
-            tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
-            continue;
-        }
-        if (affected == 0) {
-            tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-            continue;
-        }
+        /* Assume all bits affected, and no bits known zero. */
+        ctx.a_mask = -1;
+        ctx.z_mask = -1;
 
         /*
          * Process each opcode.
@@ -1873,6 +1911,11 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_extrh_i64_i32:
             done = fold_extu(&ctx, op);
             break;
+        CASE_OP_32_64(ld8u):
+        CASE_OP_32_64(ld16u):
+        case INDEX_op_ld32u_i64:
+            done = fold_tcg_ld(&ctx, op);
+            break;
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
-- 
2.25.1


