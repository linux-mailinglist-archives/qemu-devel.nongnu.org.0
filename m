Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32822F1C88
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:35:57 +0100 (CET)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz16j-0007wI-0S
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0re-0003F1-P5
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:24 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rS-00009H-3L
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:22 -0500
Received: by mail-pg1-x52c.google.com with SMTP id g15so78575pgu.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uEiBPhKLKz+SNXjEHNJYg16zyVS+pzInRZgKwDfY3iQ=;
 b=NjyKL9tMdtgErTHWKJSpaMvIZ99v6bqpdVreCgz7BkszBdusxLxj4vKpj+ztqspsHO
 h2Txvh5CX1Xl0A5jLbUg0G4ptN9jMDdRmisgx9YAEdUULXwnByt0EdDih6erpgrdGNoK
 SMT4KPn2CXrc+7PA8Zc2NNPd8XQuiT/jjYhzBrHKQTjy+fVReuZ/7em2zQFmi89l0gCK
 ML557ZHfphga9GR6vaq0qyWwkizndfdWxFZ3dyLbbDWgPooNOVSgAT27snuMmly9VmVg
 2dpkHwq+e3A3Ao7LLIizQcgEDFhrSlW/nfx+F7Yoe9DCuOXF+1JKA1SEFh5OCBkLjVhI
 fzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEiBPhKLKz+SNXjEHNJYg16zyVS+pzInRZgKwDfY3iQ=;
 b=i2mEiUzj30vMrbvP1496eu+cnZyfTyMigrLt2lSfoZVxz+3WWo//r7XW2n8lIDgqyh
 1UtKPJ7LIjV7ems30TTzTX8/rh9jfo0QMcoN60pkTxNP/BuXg9OObn3o8MRVBzyRfpq7
 4J9umLG3AX4qUHJdkGXC6lY7aKs2mKoUxwsrTF/7NgqNu5pC5V1EdqCeWsESEKarS8Zp
 xEyf/iX3rtfk6QHcVCtRuwhwPEdeVQxp/+/XeLXsGiTqzIXCXeZ5xFIphJAoV0N//K9d
 vKT7peDWSREXgY8wx1dnIkM7U/BSWSw/+yIfo1cWDHZhu2lgLBa4XTApMlMv8bCDX+OR
 uSEw==
X-Gm-Message-State: AOAM531dDCwgYBZVTvvXodsSmynqcvYt1qnbIdkIWwl1q6yXUgKbp8R2
 yTD5wb+44dG/cMzgX2uSHWvU5h0XI7EY2w==
X-Google-Smtp-Source: ABdhPJzqYOoEzqdcp9LleCl+JdSAM7u2THYbvkBDaWHI/5GwGaFckyVfvapCaa6UuSX/IMSLCPyP6w==
X-Received: by 2002:a63:745a:: with SMTP id e26mr497071pgn.321.1610385608313; 
 Mon, 11 Jan 2021 09:20:08 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/23] tcg/optimize: Use tcg_constant_internal with
 constant folding
Date: Mon, 11 Jan 2021 07:19:34 -1000
Message-Id: <20210111171946.219469-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 108 ++++++++++++++++++++++---------------------------
 1 file changed, 49 insertions(+), 59 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 49bf1386c7..bda727d5ed 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -178,37 +178,6 @@ static bool args_are_copies(TCGArg arg1, TCGArg arg2)
     return ts_are_copies(arg_temp(arg1), arg_temp(arg2));
 }
 
-static void tcg_opt_gen_movi(TCGContext *s, TCGOp *op, TCGArg dst, uint64_t val)
-{
-    const TCGOpDef *def;
-    TCGOpcode new_op;
-    uint64_t mask;
-    TempOptInfo *di = arg_info(dst);
-
-    def = &tcg_op_defs[op->opc];
-    if (def->flags & TCG_OPF_VECTOR) {
-        new_op = INDEX_op_dupi_vec;
-    } else if (def->flags & TCG_OPF_64BIT) {
-        new_op = INDEX_op_movi_i64;
-    } else {
-        new_op = INDEX_op_movi_i32;
-    }
-    op->opc = new_op;
-    /* TCGOP_VECL and TCGOP_VECE remain unchanged.  */
-    op->args[0] = dst;
-    op->args[1] = val;
-
-    reset_temp(dst);
-    di->is_const = true;
-    di->val = val;
-    mask = val;
-    if (TCG_TARGET_REG_BITS > 32 && new_op == INDEX_op_movi_i32) {
-        /* High bits of the destination are now garbage.  */
-        mask |= ~0xffffffffull;
-    }
-    di->mask = mask;
-}
-
 static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
 {
     TCGTemp *dst_ts = arg_temp(dst);
@@ -259,6 +228,27 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     }
 }
 
+static void tcg_opt_gen_movi(TCGContext *s, TCGTempSet *temps_used,
+                             TCGOp *op, TCGArg dst, uint64_t val)
+{
+    const TCGOpDef *def = &tcg_op_defs[op->opc];
+    TCGType type;
+    TCGTemp *tv;
+
+    if (def->flags & TCG_OPF_VECTOR) {
+        type = TCGOP_VECL(op) + TCG_TYPE_V64;
+    } else if (def->flags & TCG_OPF_64BIT) {
+        type = TCG_TYPE_I64;
+    } else {
+        type = TCG_TYPE_I32;
+    }
+
+    /* Convert movi to mov with constant temp. */
+    tv = tcg_constant_internal(type, val);
+    init_ts_info(temps_used, tv);
+    tcg_opt_gen_mov(s, op, dst, temp_arg(tv));
+}
+
 static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
 {
     uint64_t l64, h64;
@@ -622,7 +612,7 @@ void tcg_optimize(TCGContext *s)
     nb_temps = s->nb_temps;
     nb_globals = s->nb_globals;
 
-    bitmap_zero(temps_used.l, nb_temps);
+    memset(&temps_used, 0, sizeof(temps_used));
     for (i = 0; i < nb_temps; ++i) {
         s->temps[i].state_ptr = NULL;
     }
@@ -727,7 +717,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(rotr):
             if (arg_is_const(op->args[1])
                 && arg_info(op->args[1])->val == 0) {
-                tcg_opt_gen_movi(s, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1054,7 +1044,7 @@ void tcg_optimize(TCGContext *s)
 
         if (partmask == 0) {
             tcg_debug_assert(nb_oargs == 1);
-            tcg_opt_gen_movi(s, op, op->args[0], 0);
+            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
             continue;
         }
         if (affected == 0) {
@@ -1071,7 +1061,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(mulsh):
             if (arg_is_const(op->args[2])
                 && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_movi(s, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1098,7 +1088,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
         CASE_OP_32_64_VEC(xor):
             if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_movi(s, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1115,14 +1105,14 @@ void tcg_optimize(TCGContext *s)
             break;
         CASE_OP_32_64(movi):
         case INDEX_op_dupi_vec:
-            tcg_opt_gen_movi(s, op, op->args[0], op->args[1]);
+            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], op->args[1]);
             break;
 
         case INDEX_op_dup_vec:
             if (arg_is_const(op->args[1])) {
                 tmp = arg_info(op->args[1])->val;
                 tmp = dup_const(TCGOP_VECE(op), tmp);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1132,7 +1122,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
                 tmp = arg_info(op->args[1])->val;
                 if (tmp == arg_info(op->args[2])->val) {
-                    tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                     break;
                 }
             } else if (args_are_copies(op->args[1], op->args[2])) {
@@ -1160,7 +1150,7 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_extrh_i64_i32:
             if (arg_is_const(op->args[1])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val, 0);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1190,7 +1180,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1201,7 +1191,7 @@ void tcg_optimize(TCGContext *s)
                 TCGArg v = arg_info(op->args[1])->val;
                 if (v != 0) {
                     tmp = do_constant_folding(opc, v, 0);
-                    tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 } else {
                     tcg_opt_gen_mov(s, op, op->args[0], op->args[2]);
                 }
@@ -1214,7 +1204,7 @@ void tcg_optimize(TCGContext *s)
                 tmp = deposit64(arg_info(op->args[1])->val,
                                 op->args[3], op->args[4],
                                 arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1223,7 +1213,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = extract64(arg_info(op->args[1])->val,
                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1232,7 +1222,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = sextract64(arg_info(op->args[1])->val,
                                  op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1249,7 +1239,7 @@ void tcg_optimize(TCGContext *s)
                     tmp = (int32_t)(((uint32_t)v1 >> shr) |
                                     ((uint32_t)v2 << (32 - shr)));
                 }
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1258,7 +1248,7 @@ void tcg_optimize(TCGContext *s)
             tmp = do_constant_folding_cond(opc, op->args[1],
                                            op->args[2], op->args[3]);
             if (tmp != 2) {
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1268,7 +1258,7 @@ void tcg_optimize(TCGContext *s)
                                            op->args[1], op->args[2]);
             if (tmp != 2) {
                 if (tmp) {
-                    bitmap_zero(temps_used.l, nb_temps);
+                    memset(&temps_used, 0, sizeof(temps_used));
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[3];
                 } else {
@@ -1314,7 +1304,7 @@ void tcg_optimize(TCGContext *s)
                 uint64_t a = ((uint64_t)ah << 32) | al;
                 uint64_t b = ((uint64_t)bh << 32) | bl;
                 TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_movi_i32);
+                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
 
                 if (opc == INDEX_op_add2_i32) {
                     a += b;
@@ -1324,8 +1314,8 @@ void tcg_optimize(TCGContext *s)
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(s, op2, rh, (int32_t)(a >> 32));
+                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)a);
+                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(a >> 32));
                 break;
             }
             goto do_default;
@@ -1336,12 +1326,12 @@ void tcg_optimize(TCGContext *s)
                 uint32_t b = arg_info(op->args[3])->val;
                 uint64_t r = (uint64_t)a * b;
                 TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_movi_i32);
+                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, op, rl, (int32_t)r);
-                tcg_opt_gen_movi(s, op2, rh, (int32_t)(r >> 32));
+                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)r);
+                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(r >> 32));
                 break;
             }
             goto do_default;
@@ -1352,7 +1342,7 @@ void tcg_optimize(TCGContext *s)
             if (tmp != 2) {
                 if (tmp) {
             do_brcond_true:
-                    bitmap_zero(temps_used.l, nb_temps);
+                    memset(&temps_used, 0, sizeof(temps_used));
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[5];
                 } else {
@@ -1368,7 +1358,7 @@ void tcg_optimize(TCGContext *s)
                 /* Simplify LT/GE comparisons vs zero to a single compare
                    vs the high word of the input.  */
             do_brcond_high:
-                bitmap_zero(temps_used.l, nb_temps);
+                memset(&temps_used, 0, sizeof(temps_used));
                 op->opc = INDEX_op_brcond_i32;
                 op->args[0] = op->args[1];
                 op->args[1] = op->args[3];
@@ -1394,7 +1384,7 @@ void tcg_optimize(TCGContext *s)
                     goto do_default;
                 }
             do_brcond_low:
-                bitmap_zero(temps_used.l, nb_temps);
+                memset(&temps_used, 0, sizeof(temps_used));
                 op->opc = INDEX_op_brcond_i32;
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
@@ -1429,7 +1419,7 @@ void tcg_optimize(TCGContext *s)
                                             op->args[5]);
             if (tmp != 2) {
             do_setcond_const:
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
             } else if ((op->args[5] == TCG_COND_LT
                         || op->args[5] == TCG_COND_GE)
                        && arg_is_const(op->args[3])
@@ -1514,7 +1504,7 @@ void tcg_optimize(TCGContext *s)
                block, otherwise we only trash the output args.  "mask" is
                the non-zero bits mask for the first output arg.  */
             if (def->flags & TCG_OPF_BB_END) {
-                bitmap_zero(temps_used.l, nb_temps);
+                memset(&temps_used, 0, sizeof(temps_used));
             } else {
         do_reset_output:
                 for (i = 0; i < nb_oargs; i++) {
-- 
2.25.1


