Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B568043BDE5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:30:58 +0200 (CEST)
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVuD-0006Lf-Po
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaB-0003DV-Ng
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:15 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZw-0001xR-Le
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:15 -0400
Received: by mail-pf1-x429.google.com with SMTP id m14so881340pfc.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2aCMzzpED1pnAsbhFWuSe8VI84HPP2h5WLYR7vcie50=;
 b=v/S1P1Z7olRdgjQTeA+/Hjnyd7e5kwwLEzKdvoFkdR9pNjiPw2szgssMaNLrkZN58H
 yk0qhrBOpINmhx8dzQDFWp28R5TBNwk5XMxDmacIzacC9SzH91eTu2GDb4kt8BNp/11P
 wA990nt+9AFM/95xL9GUu4VN8FhartKq1lysQbQV3yhiFVu11vgHRTDO7GYgqm+Z2J0C
 gq8XHMy2c/ztc1qKsRhpewh4Yk8Rwn49eSjm3ZNI1Y/6TolmqWctcdoAoz61gmJxq2K/
 UFDTTPRptnuERkYsIM5ZFlQZUl3essC/95vmRiGeSD3t3300OBLWlWfZec69Y1JUqbXG
 9ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2aCMzzpED1pnAsbhFWuSe8VI84HPP2h5WLYR7vcie50=;
 b=E52o+oByneVv3v2OUO1PoqcuNubYRBCeEOg2E/jlYgLbaWoGpskCZEGjOSZeS76hEz
 rDkP/CX+xiBWksux7aISqaqdjp/hqPOaSVfsxzWsobIDuJKgPAO7UXxMT6/YxZ3DWV0B
 ypJxBKXcGLJgVJzZwdfb37Zc3db562uqYDoiS1F6Kp44+b8eEQS8fQ9iTaqXLd/XCpgu
 Fue9lxaIv8i09wMnFw2XhoebXhKFUQ9KNTTtEru/0VRtYltekG728J4lGHrBrUJAIG82
 sER2UgjAnUo3VJFDv3QKr5deX3WqZBoUoBo6gkSTEDLjJD4p1niWIspbwJZb2zAhtu3l
 1q8A==
X-Gm-Message-State: AOAM533EDjUWJSxip0EYpd65rxO2Y/wIOfty4TPbf5/w0fn7/MEmgLKt
 80AvW/R/X72cpnoV+8ktImhwZ3QftbtNyg==
X-Google-Smtp-Source: ABdhPJxmonPChmiNsbpBngJ7idbVE09JzsYPji4ck38AbevadlxApp76oJO/NdTr006rTvCPq3YqgA==
X-Received: by 2002:a63:2a88:: with SMTP id
 q130mr21061252pgq.169.1635289798215; 
 Tue, 26 Oct 2021 16:09:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/51] tcg/optimize: Split out fold_const{1,2}
Date: Tue, 26 Oct 2021 16:09:07 -0700
Message-Id: <20211026230943.1225890-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Split out a whole bunch of placeholder functions, which are
currently identical.  That won't last as more code gets moved.

Use CASE_32_64_VEC for some logical operators that previously
missed the addition of vectors.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 271 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 219 insertions(+), 52 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 159a5a9ee5..5c3f8e8fcd 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -660,6 +660,60 @@ static void finish_folding(OptContext *ctx, TCGOp *op)
     }
 }
 
+/*
+ * The fold_* functions return true when processing is complete,
+ * usually by folding the operation to a constant or to a copy,
+ * and calling tcg_opt_gen_{mov,movi}.  They may do other things,
+ * like collect information about the value produced, for use in
+ * optimizing a subsequent operation.
+ *
+ * These first fold_* functions are all helpers, used by other
+ * folders for more specific operations.
+ */
+
+static bool fold_const1(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = do_constant_folding(op->opc, t, 0);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
+static bool fold_const2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t1 = arg_info(op->args[1])->val;
+        uint64_t t2 = arg_info(op->args[2])->val;
+
+        t1 = do_constant_folding(op->opc, t1, t2);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t1);
+    }
+    return false;
+}
+
+/*
+ * These outermost fold_<op> functions are sorted alphabetically.
+ */
+
+static bool fold_add(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_and(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_andc(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
 static bool fold_call(OptContext *ctx, TCGOp *op)
 {
     TCGContext *s = ctx->tcg;
@@ -692,6 +746,31 @@ static bool fold_call(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_ctpop(OptContext *ctx, TCGOp *op)
+{
+    return fold_const1(ctx, op);
+}
+
+static bool fold_divide(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_eqv(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_exts(OptContext *ctx, TCGOp *op)
+{
+    return fold_const1(ctx, op);
+}
+
+static bool fold_extu(OptContext *ctx, TCGOp *op)
+{
+    return fold_const1(ctx, op);
+}
+
 static bool fold_mb(OptContext *ctx, TCGOp *op)
 {
     /* Eliminate duplicate and redundant fence instructions.  */
@@ -716,6 +795,46 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_mul(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_nand(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_neg(OptContext *ctx, TCGOp *op)
+{
+    return fold_const1(ctx, op);
+}
+
+static bool fold_nor(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_not(OptContext *ctx, TCGOp *op)
+{
+    return fold_const1(ctx, op);
+}
+
+static bool fold_or(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_orc(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
 static bool fold_qemu_ld(OptContext *ctx, TCGOp *op)
 {
     /* Opcodes that touch guest memory stop the mb optimization.  */
@@ -730,6 +849,26 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_remainder(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_shift(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_sub(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
+static bool fold_xor(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op);
+}
+
 /* Propagate constants and copies, fold constant expressions. */
 void tcg_optimize(TCGContext *s)
 {
@@ -1276,26 +1415,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(not):
-        CASE_OP_32_64(neg):
-        CASE_OP_32_64(ext8s):
-        CASE_OP_32_64(ext8u):
-        CASE_OP_32_64(ext16s):
-        CASE_OP_32_64(ext16u):
-        CASE_OP_32_64(ctpop):
-        case INDEX_op_ext32s_i64:
-        case INDEX_op_ext32u_i64:
-        case INDEX_op_ext_i32_i64:
-        case INDEX_op_extu_i32_i64:
-        case INDEX_op_extrl_i64_i32:
-        case INDEX_op_extrh_i64_i32:
-            if (arg_is_const(op->args[1])) {
-                tmp = do_constant_folding(opc, arg_info(op->args[1])->val, 0);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         CASE_OP_32_64(bswap16):
         CASE_OP_32_64(bswap32):
         case INDEX_op_bswap64_i64:
@@ -1307,36 +1426,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(add):
-        CASE_OP_32_64(sub):
-        CASE_OP_32_64(mul):
-        CASE_OP_32_64(or):
-        CASE_OP_32_64(and):
-        CASE_OP_32_64(xor):
-        CASE_OP_32_64(shl):
-        CASE_OP_32_64(shr):
-        CASE_OP_32_64(sar):
-        CASE_OP_32_64(rotl):
-        CASE_OP_32_64(rotr):
-        CASE_OP_32_64(andc):
-        CASE_OP_32_64(orc):
-        CASE_OP_32_64(eqv):
-        CASE_OP_32_64(nand):
-        CASE_OP_32_64(nor):
-        CASE_OP_32_64(muluh):
-        CASE_OP_32_64(mulsh):
-        CASE_OP_32_64(div):
-        CASE_OP_32_64(divu):
-        CASE_OP_32_64(rem):
-        CASE_OP_32_64(remu):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tmp = do_constant_folding(opc, arg_info(op->args[1])->val,
-                                          arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         CASE_OP_32_64(clz):
         CASE_OP_32_64(ctz):
             if (arg_is_const(op->args[1])) {
@@ -1637,9 +1726,73 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
+        default:
+            break;
+
+        /* ---------------------------------------------------------- */
+        /* Sorted alphabetically by opcode as much as possible. */
+
+        CASE_OP_32_64_VEC(add):
+            done = fold_add(&ctx, op);
+            break;
+        CASE_OP_32_64_VEC(and):
+            done = fold_and(&ctx, op);
+            break;
+        CASE_OP_32_64_VEC(andc):
+            done = fold_andc(&ctx, op);
+            break;
+        CASE_OP_32_64(ctpop):
+            done = fold_ctpop(&ctx, op);
+            break;
+        CASE_OP_32_64(div):
+        CASE_OP_32_64(divu):
+            done = fold_divide(&ctx, op);
+            break;
+        CASE_OP_32_64(eqv):
+            done = fold_eqv(&ctx, op);
+            break;
+        CASE_OP_32_64(ext8s):
+        CASE_OP_32_64(ext16s):
+        case INDEX_op_ext32s_i64:
+        case INDEX_op_ext_i32_i64:
+            done = fold_exts(&ctx, op);
+            break;
+        CASE_OP_32_64(ext8u):
+        CASE_OP_32_64(ext16u):
+        case INDEX_op_ext32u_i64:
+        case INDEX_op_extu_i32_i64:
+        case INDEX_op_extrl_i64_i32:
+        case INDEX_op_extrh_i64_i32:
+            done = fold_extu(&ctx, op);
+            break;
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
+        CASE_OP_32_64(mul):
+            done = fold_mul(&ctx, op);
+            break;
+        CASE_OP_32_64(mulsh):
+        CASE_OP_32_64(muluh):
+            done = fold_mul_highpart(&ctx, op);
+            break;
+        CASE_OP_32_64(nand):
+            done = fold_nand(&ctx, op);
+            break;
+        CASE_OP_32_64(neg):
+            done = fold_neg(&ctx, op);
+            break;
+        CASE_OP_32_64(nor):
+            done = fold_nor(&ctx, op);
+            break;
+        CASE_OP_32_64_VEC(not):
+            done = fold_not(&ctx, op);
+            break;
+        CASE_OP_32_64_VEC(or):
+            done = fold_or(&ctx, op);
+            break;
+        CASE_OP_32_64_VEC(orc):
+            done = fold_orc(&ctx, op);
+            break;
         case INDEX_op_qemu_ld_i32:
         case INDEX_op_qemu_ld_i64:
             done = fold_qemu_ld(&ctx, op);
@@ -1649,8 +1802,22 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_qemu_st_i64:
             done = fold_qemu_st(&ctx, op);
             break;
-
-        default:
+        CASE_OP_32_64(rem):
+        CASE_OP_32_64(remu):
+            done = fold_remainder(&ctx, op);
+            break;
+        CASE_OP_32_64(rotl):
+        CASE_OP_32_64(rotr):
+        CASE_OP_32_64(sar):
+        CASE_OP_32_64(shl):
+        CASE_OP_32_64(shr):
+            done = fold_shift(&ctx, op);
+            break;
+        CASE_OP_32_64_VEC(sub):
+            done = fold_sub(&ctx, op);
+            break;
+        CASE_OP_32_64_VEC(xor):
+            done = fold_xor(&ctx, op);
             break;
         }
 
-- 
2.25.1


