Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003E43F64B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:49:18 +0200 (CEST)
Received: from localhost ([::1]:46676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJpO-0000gU-2M
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaI-0003kf-PM
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaG-0007uC-10
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:42 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 x33-20020a17090a6c2400b001a63ef25836so72558pjj.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/xA01W4KeTA9PL1ecjuRsphIv0Hw/RH1bb0Ef8kKFU=;
 b=SxllG+OFb7njfNto/8bAbiwyr60GztDdFrG95MKqzc/App8TFLBYm/mUrRk8OYYUlb
 zqPN9Fbq1m6i9IOWy5EKkO8KX5X6Ttdj/b98N1GvlJX1x4aTvAKzT4b0wLSteEZKnr/G
 +ow1kCxekxqlHN5P+RoJv9n7OX5ybZUeBwp/P0E2TmoClG8ImEDIDQYh2XuW/LOyltEg
 caKJ/kjRSB2Yr9MmqtzysLHwL/chjG5dIbjb4CUGRUYLSRZPi6fQx3R1sTF+3f7FnzYZ
 g2IMVfmbLz7vxOldotDvsbC7QozQPtTRtOXuKYphcAQhjTLBEg6GSuJ6dU3JqJUELWvB
 qWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/xA01W4KeTA9PL1ecjuRsphIv0Hw/RH1bb0Ef8kKFU=;
 b=mvpwBvjyeFqfeSoYzigobVCvWoZ27ov6/hyhbcQRRfKp8T2lvtsQyitvgh6bdVXe2I
 qiMFV5VlgTIaxtdm7zgaelYK/6KdwaBhLwhx7Q2xXZD5YBroJr1tUMs4OJ3O0xpkSrea
 kdqnGiRJxtIRwSv6FT+Msh5byEhw4ZQlIlNZUFnGCXatMnPeKvcCsl6bMvPqyYslp1nF
 yZhqHYSvVwVqLTnsTwihkAYdRHuKmclQB5TCJqi0fn7BO582/eNEm1ykOWOsP4jaHG4V
 5NBldqhAEcRIM35tGKXONrGvnjkE10k4QcUfe4MfVKw0go8LUcAHKRXIq9XCmf/wpJ4V
 4Csg==
X-Gm-Message-State: AOAM5338AsjGv/x/Cm/W5cTgNm85x7ZqGkmPL0Sjx9XJJcT3c6AUUxcQ
 1Q/taDmfmqoQlvRaTQ3+ejYn/huwyDr7zA==
X-Google-Smtp-Source: ABdhPJwqgJfbOoErwNsD3Ym4zE5GcyEQC0QTWPqm+vQqyczgwALGXEwsK4h4kMib7furQY5/IvSHCQ==
X-Received: by 2002:a17:90a:718b:: with SMTP id
 i11mr17658689pjk.22.1635482018538; 
 Thu, 28 Oct 2021 21:33:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/60] tcg/optimize: Change tcg_opt_gen_{mov, movi} interface
Date: Thu, 28 Oct 2021 21:32:38 -0700
Message-Id: <20211029043329.1518029-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Adjust the interface to take the OptContext parameter instead
of TCGContext or both.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 67 +++++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index a37efff4d0..627a5b39f6 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -45,6 +45,7 @@ typedef struct TempOptInfo {
 } TempOptInfo;
 
 typedef struct OptContext {
+    TCGContext *tcg;
     TCGTempSet temps_used;
 } OptContext;
 
@@ -183,7 +184,7 @@ static bool args_are_copies(TCGArg arg1, TCGArg arg2)
     return ts_are_copies(arg_temp(arg1), arg_temp(arg2));
 }
 
-static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
+static void tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
 {
     TCGTemp *dst_ts = arg_temp(dst);
     TCGTemp *src_ts = arg_temp(src);
@@ -194,7 +195,7 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     TCGOpcode new_op;
 
     if (ts_are_copies(dst_ts, src_ts)) {
-        tcg_op_remove(s, op);
+        tcg_op_remove(ctx->tcg, op);
         return;
     }
 
@@ -233,8 +234,8 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     }
 }
 
-static void tcg_opt_gen_movi(TCGContext *s, OptContext *ctx,
-                             TCGOp *op, TCGArg dst, uint64_t val)
+static void tcg_opt_gen_movi(OptContext *ctx, TCGOp *op,
+                             TCGArg dst, uint64_t val)
 {
     const TCGOpDef *def = &tcg_op_defs[op->opc];
     TCGType type;
@@ -251,7 +252,7 @@ static void tcg_opt_gen_movi(TCGContext *s, OptContext *ctx,
     /* Convert movi to mov with constant temp. */
     tv = tcg_constant_internal(type, val);
     init_ts_info(ctx, tv);
-    tcg_opt_gen_mov(s, op, dst, temp_arg(tv));
+    tcg_opt_gen_mov(ctx, op, dst, temp_arg(tv));
 }
 
 static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
@@ -609,7 +610,7 @@ void tcg_optimize(TCGContext *s)
 {
     int nb_temps, nb_globals, i;
     TCGOp *op, *op_next, *prev_mb = NULL;
-    OptContext ctx = {};
+    OptContext ctx = { .tcg = s };
 
     /* Array VALS has an element for each temp.
        If this temp holds a constant then its value is kept in VALS' element.
@@ -723,7 +724,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(rotr):
             if (arg_is_const(op->args[1])
                 && arg_info(op->args[1])->val == 0) {
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], 0);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -838,7 +839,7 @@ void tcg_optimize(TCGContext *s)
             if (!arg_is_const(op->args[1])
                 && arg_is_const(op->args[2])
                 && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_mov(s, op, op->args[0], op->args[1]);
+                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
                 continue;
             }
             break;
@@ -848,7 +849,7 @@ void tcg_optimize(TCGContext *s)
             if (!arg_is_const(op->args[1])
                 && arg_is_const(op->args[2])
                 && arg_info(op->args[2])->val == -1) {
-                tcg_opt_gen_mov(s, op, op->args[0], op->args[1]);
+                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
                 continue;
             }
             break;
@@ -1088,12 +1089,12 @@ void tcg_optimize(TCGContext *s)
 
         if (partmask == 0) {
             tcg_debug_assert(nb_oargs == 1);
-            tcg_opt_gen_movi(s, &ctx, op, op->args[0], 0);
+            tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
             continue;
         }
         if (affected == 0) {
             tcg_debug_assert(nb_oargs == 1);
-            tcg_opt_gen_mov(s, op, op->args[0], op->args[1]);
+            tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
             continue;
         }
 
@@ -1105,7 +1106,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(mulsh):
             if (arg_is_const(op->args[2])
                 && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], 0);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1118,7 +1119,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(or):
         CASE_OP_32_64_VEC(and):
             if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_mov(s, op, op->args[0], op->args[1]);
+                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
                 continue;
             }
             break;
@@ -1132,7 +1133,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
         CASE_OP_32_64_VEC(xor):
             if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], 0);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
                 continue;
             }
             break;
@@ -1145,14 +1146,14 @@ void tcg_optimize(TCGContext *s)
            allocator where needed and possible.  Also detect copies. */
         switch (opc) {
         CASE_OP_32_64_VEC(mov):
-            tcg_opt_gen_mov(s, op, op->args[0], op->args[1]);
+            tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
             continue;
 
         case INDEX_op_dup_vec:
             if (arg_is_const(op->args[1])) {
                 tmp = arg_info(op->args[1])->val;
                 tmp = dup_const(TCGOP_VECE(op), tmp);
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1160,7 +1161,7 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_dup2_vec:
             assert(TCG_TARGET_REG_BITS == 32);
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0],
+                tcg_opt_gen_movi(&ctx, op, op->args[0],
                                  deposit64(arg_info(op->args[1])->val, 32, 32,
                                            arg_info(op->args[2])->val));
                 continue;
@@ -1186,7 +1187,7 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_extrh_i64_i32:
             if (arg_is_const(op->args[1])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val, 0);
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1197,7 +1198,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           op->args[2]);
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1227,7 +1228,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
                 tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
                                           arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1238,9 +1239,9 @@ void tcg_optimize(TCGContext *s)
                 TCGArg v = arg_info(op->args[1])->val;
                 if (v != 0) {
                     tmp = do_constant_folding(opc, v, 0);
-                    tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                    tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 } else {
-                    tcg_opt_gen_mov(s, op, op->args[0], op->args[2]);
+                    tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[2]);
                 }
                 continue;
             }
@@ -1251,7 +1252,7 @@ void tcg_optimize(TCGContext *s)
                 tmp = deposit64(arg_info(op->args[1])->val,
                                 op->args[3], op->args[4],
                                 arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1260,7 +1261,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = extract64(arg_info(op->args[1])->val,
                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1269,7 +1270,7 @@ void tcg_optimize(TCGContext *s)
             if (arg_is_const(op->args[1])) {
                 tmp = sextract64(arg_info(op->args[1])->val,
                                  op->args[2], op->args[3]);
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1286,7 +1287,7 @@ void tcg_optimize(TCGContext *s)
                     tmp = (int32_t)(((uint32_t)v1 >> shr) |
                                     ((uint32_t)v2 << (32 - shr)));
                 }
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1295,7 +1296,7 @@ void tcg_optimize(TCGContext *s)
             tmp = do_constant_folding_cond(opc, op->args[1],
                                            op->args[2], op->args[3]);
             if (tmp != 2) {
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             break;
@@ -1319,7 +1320,7 @@ void tcg_optimize(TCGContext *s)
             tmp = do_constant_folding_cond(opc, op->args[1],
                                            op->args[2], op->args[5]);
             if (tmp != 2) {
-                tcg_opt_gen_mov(s, op, op->args[0], op->args[4-tmp]);
+                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[4-tmp]);
                 continue;
             }
             if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
@@ -1361,8 +1362,8 @@ void tcg_optimize(TCGContext *s)
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, &ctx, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(s, &ctx, op2, rh, (int32_t)(a >> 32));
+                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)a);
+                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(a >> 32));
                 continue;
             }
             break;
@@ -1377,8 +1378,8 @@ void tcg_optimize(TCGContext *s)
 
                 rl = op->args[0];
                 rh = op->args[1];
-                tcg_opt_gen_movi(s, &ctx, op, rl, (int32_t)r);
-                tcg_opt_gen_movi(s, &ctx, op2, rh, (int32_t)(r >> 32));
+                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)r);
+                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(r >> 32));
                 continue;
             }
             break;
@@ -1466,7 +1467,7 @@ void tcg_optimize(TCGContext *s)
                                             op->args[5]);
             if (tmp != 2) {
             do_setcond_const:
-                tcg_opt_gen_movi(s, &ctx, op, op->args[0], tmp);
+                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
                 continue;
             }
             if ((op->args[5] == TCG_COND_LT || op->args[5] == TCG_COND_GE)
-- 
2.25.1


