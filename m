Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C37D425CD9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:03:11 +0200 (CEST)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZbi-0006Jc-7d
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTt-0000Gn-2N
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:06 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTq-000741-52
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:04 -0400
Received: by mail-pf1-x435.google.com with SMTP id 187so6222681pfc.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zrvO2z9GjXuWPQBRWWDewzO2sRrhZhxmVaxdB8/aWA4=;
 b=qmyZA5O0WqoyAEk9WAE6X+PfrND0b4rYzgGGuqLgopB+I1jClk5dZSAZQaLPxAR0a8
 uu5PMEYYT58/TqalP+prrgnxFe0nAxzLx1t91H2vNB2ifVCnwI02wMo621wCPSnHntTX
 dgM5fc5AItUeJBgtvDU8eb+han03I49zRunYIHogFPg5fZ5SIhd2/Fu+25A6gAuFMpVG
 Oqi694c6zjIQEMWALEVnFcN6SIvik7Vtk10o+JTr0i7ICGgxX9NRim2f9PufM1bOC9B7
 kBPdOcTDmFsDghhVRELKoaAZtL/DrPD2YRSebm+bbxUm1+CQ+gbFiyW/ou+ooByU4Ako
 LcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrvO2z9GjXuWPQBRWWDewzO2sRrhZhxmVaxdB8/aWA4=;
 b=yoCFb96s2fXfPlrpRruYFKLOhok6X2+RhRK6f2FLoNCHv75joJ9v1BP88hHES4jTdm
 DqWnvn+nl+tKUMb619htS4ZM5ROOcZ7iL65NCQaFWxM3DONtf3qFR5y0eocbyroR/TFa
 lPZL2k7RRClH0oSYa/ZcSqu4qNiSWawXMm0EXQImYtmhhRmMahCI/rn6DkfDfVRIzkf3
 X6AgReJdg5vPnO1/XBsNNz/C3/4jxxBYDl0gxPb3wrrwFdoLezzHa4vf3bIJPkHLKnyt
 FksOC/VpGx9N9VlcQf2HcZ31Q/kwjGZX/iiJEE9YbpefSqjL8GKTU1WrJQ0QPYKcVAyo
 Oe9g==
X-Gm-Message-State: AOAM530fKVX3+vDL12kYmci42Tifm75T0tC9ko2NeVysl+OQMr9yFC58
 AD4ytx1JXMVOLaJ9vS2qh9HFr+B7iZ5RcQ==
X-Google-Smtp-Source: ABdhPJz69UKbKLgtmZx/5AJo/AUoCUXLQoCU6BvQCE7LmcnkF3RX+Yf82YDfvL2h7TfzStcBebUpvg==
X-Received: by 2002:a62:9215:0:b0:44c:4de1:f777 with SMTP id
 o21-20020a629215000000b0044c4de1f777mr5902113pfd.31.1633636500620; 
 Thu, 07 Oct 2021 12:55:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/48] tcg/optimize: Change tcg_opt_gen_{mov,
 movi} interface
Date: Thu,  7 Oct 2021 12:54:12 -0700
Message-Id: <20211007195456.1168070-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Adjust the interface to take the OptContext parameter instead
of TCGContext or both.

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


