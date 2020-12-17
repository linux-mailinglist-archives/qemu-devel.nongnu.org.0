Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400A2DD41E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:26:55 +0100 (CET)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvB8-0001cX-IB
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudz-0003Se-Dm
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:39 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudr-0004wG-Fh
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:39 -0500
Received: by mail-ot1-x331.google.com with SMTP id q25so27503147otn.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6cqDqqpGgJpdgueLdcG6e3yOEykjqKPHvO+r5JreBA4=;
 b=d4K1SCVIRPsRWGjGmVz+K+KCIeqZV6Q5D+hi+kMlz0b55TbaAgxyjP5wptEz7jAMW/
 Sq4FjlneUFjbwcvLnOFIK2UxuB0fLZSKXKuzQaAEVplleNnFjxJGzcRI8b8/wv6pZLb4
 ztMAAkbob60VHsBBKStuGXDal0KY891J2eyzX+jipVP0xvBQBgzT+DRqzyrLBCjKg0R3
 ltjrVvPY96wVDuZ/961K1iR9aae0amtvQXzHUbXSNEwcfvoat9z3pL8bySJdMqqq2/gP
 ALs94hTToqZ++zpkLJnhrhpTWqETl4ZSdPTHxOzk3DwElorMC5CLTI0X0JTuNFBoJEp0
 DKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cqDqqpGgJpdgueLdcG6e3yOEykjqKPHvO+r5JreBA4=;
 b=FXihdIAWG3+Y/YueQpP/uPkQoe8OKbRroukw8TrqMQOLWzRAkZzKZjtUUR0q6oHAzl
 Q6ICz9r+SoRTuWmUNIeXFlIo9RT0Wd9FeY2rQkY1gZ1AXdq1yOJ03Y213BPMLIGBGPT3
 3dBaknTNRiV+jGuctWgkX/sELwoaLiKiqxn5OhMPq0goTdFxWL+z0FBmhpLXJ8VcTWEV
 +HKqjwTogEq40IbS02EW03VplBDppbhbdchv1GQ6HSJ6EIIJlOvJu6cczOu+wUKUtPwi
 KELrgF4XgiCHNr9zqZ8kIPRbPlByEjWTcVSO4oUOuOvdUhFaMwcoDhIoFof0ygL8EZZY
 f76g==
X-Gm-Message-State: AOAM532KlnMOzL5xB793SotDRrj1xhmPdF8hcP/qXos9McsEKIDcvMJH
 M3JvcPciYJqfp/tcXTxlGUAk2QON8vyYt6T1
X-Google-Smtp-Source: ABdhPJw6JZb6WhQOF8adyhY5DIQM3Fmjq9Yd7tow5V11exWXYSYOphEYwAOAiT6VZDBUS4kPyc8eHw==
X-Received: by 2002:a9d:62d7:: with SMTP id z23mr23971262otk.353.1608216749782; 
 Thu, 17 Dec 2020 06:52:29 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/23] tcg/optimize: Use tcg_constant_internal with
 constant folding
Date: Thu, 17 Dec 2020 08:52:03 -0600
Message-Id: <20201217145215.534637-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
index e269962932..1eda7dc419 100644
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
@@ -1050,7 +1040,7 @@ void tcg_optimize(TCGContext *s)
 
         if (partmask == 0) {
             tcg_debug_assert(nb_oargs == 1);
-            tcg_opt_gen_movi(s, op, op->args[0], 0);
+            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
             continue;
         }
         if (affected == 0) {
@@ -1067,7 +1057,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(mulsh):
             if (arg_is_const(op->args[2])
                 && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_movi(s, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1094,7 +1084,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
         CASE_OP_32_64_VEC(xor):
             if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_movi(s, op, op->args[0], 0);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1111,14 +1101,14 @@ void tcg_optimize(TCGContext *s)
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
@@ -1128,7 +1118,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
                 tmp = arg_info(op->args[1])->val;
                 if (tmp == arg_info(op->args[2])->val) {
-                    tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                     break;
                 }
             } else if (args_are_copies(op->args[1], op->args[2])) {
@@ -1156,7 +1146,7 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_extrh_i64_i32:
             if (arg_is_const(op->args[1])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val, 0);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1186,7 +1176,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1197,7 +1187,7 @@ void tcg_optimize(TCGContext *s)
                 TCGArg v = arg_info(op->args[1])->val;
                 if (v != 0) {
                     tmp = do_constant_folding(opc, v, 0);
-                    tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 } else {
                     tcg_opt_gen_mov(s, op, op->args[0], op->args[2]);
                 }
@@ -1210,7 +1200,7 @@ void tcg_optimize(TCGContext *s)
                 tmp = deposit64(arg_info(op->args[1])->val,
                                 op->args[3], op->args[4],
                                 arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1219,7 +1209,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = extract64(arg_info(op->args[1])->val,
                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1228,7 +1218,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = sextract64(arg_info(op->args[1])->val,
                                  op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1245,7 +1235,7 @@ void tcg_optimize(TCGContext *s)
                     tmp = (int32_t)(((uint32_t)v1 >> shr) |
                                     ((uint32_t)v2 << (32 - shr)));
                 }
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1254,7 +1244,7 @@ void tcg_optimize(TCGContext *s)
             tmp = do_constant_folding_cond(opc, op->args[1],
                                            op->args[2], op->args[3]);
             if (tmp != 2) {
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
                 break;
             }
             goto do_default;
@@ -1264,7 +1254,7 @@ void tcg_optimize(TCGContext *s)
                                            op->args[1], op->args[2]);
             if (tmp != 2) {
                 if (tmp) {
-                    bitmap_zero(temps_used.l, nb_temps);
+                    memset(&temps_used, 0, sizeof(temps_used));
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[3];
                 } else {
@@ -1310,7 +1300,7 @@ void tcg_optimize(TCGContext *s)
                 uint64_t a = ((uint64_t)ah << 32) | al;
                 uint64_t b = ((uint64_t)bh << 32) | bl;
                 TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_movi_i32);
+                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
 
                 if (opc == INDEX_op_add2_i32) {
                     a += b;
@@ -1320,8 +1310,8 @@ void tcg_optimize(TCGContext *s)
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(s, op2, rh, (int32_t)(a >> 32));
+                tcg_opt_gen_movi(s, &temps_used, op, rl, (int32_t)a);
+                tcg_opt_gen_movi(s, &temps_used, op2, rh, (int32_t)(a >> 32));
                 break;
             }
             goto do_default;
@@ -1332,12 +1322,12 @@ void tcg_optimize(TCGContext *s)
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
@@ -1348,7 +1338,7 @@ void tcg_optimize(TCGContext *s)
             if (tmp != 2) {
                 if (tmp) {
             do_brcond_true:
-                    bitmap_zero(temps_used.l, nb_temps);
+                    memset(&temps_used, 0, sizeof(temps_used));
                     op->opc = INDEX_op_br;
                     op->args[0] = op->args[5];
                 } else {
@@ -1364,7 +1354,7 @@ void tcg_optimize(TCGContext *s)
                 /* Simplify LT/GE comparisons vs zero to a single compare
                    vs the high word of the input.  */
             do_brcond_high:
-                bitmap_zero(temps_used.l, nb_temps);
+                memset(&temps_used, 0, sizeof(temps_used));
                 op->opc = INDEX_op_brcond_i32;
                 op->args[0] = op->args[1];
                 op->args[1] = op->args[3];
@@ -1390,7 +1380,7 @@ void tcg_optimize(TCGContext *s)
                     goto do_default;
                 }
             do_brcond_low:
-                bitmap_zero(temps_used.l, nb_temps);
+                memset(&temps_used, 0, sizeof(temps_used));
                 op->opc = INDEX_op_brcond_i32;
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
@@ -1425,7 +1415,7 @@ void tcg_optimize(TCGContext *s)
                                             op->args[5]);
             if (tmp != 2) {
             do_setcond_const:
-                tcg_opt_gen_movi(s, op, op->args[0], tmp);
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
             } else if ((op->args[5] == TCG_COND_LT
                         || op->args[5] == TCG_COND_GE)
                        && arg_is_const(op->args[3])
@@ -1510,7 +1500,7 @@ void tcg_optimize(TCGContext *s)
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


