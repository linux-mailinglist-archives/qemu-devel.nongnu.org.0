Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48D73FB133
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:30:22 +0200 (CEST)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKaoH-0004XF-O6
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajC-0003uo-Im
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:06 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajA-0007Uy-77
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so11493633pje.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ccx5AzXxSsIcY6hQ8fBoKCVwOyG1Wy2tldYYTSJ/shU=;
 b=Vbqt+BYyRztL13tn3IvuKZPYv3bp9b0h5qIwCkWkkbXBrA/DSjK+DTYHGUFVbRDhK6
 3mYLGOBG664MR0yWmtDqs1jTpSc3ZLqo6PPi6pyKsE2Sy9VFV2AyRp6niNQNwk+hgv2O
 zKjIaSm9T1J7CnXy2xI3eZwRclcXmdQsRU0uNA16l2UsE7pL24dk2pTD0UMhi0aYCjKR
 ojMLcU6meUU0FkvsOmG3OCba6GpJIYpHHGkWLfXMm2GJ+yG1Qv1FZvYAjuAxytloL1HE
 HBs59h91vbQC0+ClrOzCuzkobYjKkyTo/kR+wskMEbmmUdZkJaYNjR7E41Fc5uNu1qcp
 kwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ccx5AzXxSsIcY6hQ8fBoKCVwOyG1Wy2tldYYTSJ/shU=;
 b=MEQ8W00y9iWqnk+Ex8JdVtSD9xvR27RHyFTjFx2Khenf8d4anbezNLezZejySJMIqC
 NdpPGEq0T2sItm1gtIz6peGVdL0ux1UkxhjeesblE+0MJLwRisSaqb2+RA/dNuLASuka
 buNzN3POnY881zOE/ZkTsCoDKkuDa6Nbyb68BVMnRPmxQ2l6WQy0Hq48cagqXUo7b9/G
 KxPqaXj1F7q4oeqEynfbtRpsRTEEYoViLPp1exSE0eWn6Ll/lbsNXUYob2N3l/4Zh0bU
 AafT4rDy/rU9Rme/F3bqWCeP49wfjce6ReWseP6Eu3AePF9aQJiiChbYfQd15jax9RH0
 kTtw==
X-Gm-Message-State: AOAM533nUyyLDsn9jldtMPjbi4Spjkv9RE37+cVQx5j5Hc3DcnRCUzVX
 rXILO6vpyUg7Uffxk4+/R5WCgedLDmZ2Sw==
X-Google-Smtp-Source: ABdhPJzpHgjEeERhJMiLIzAklwOX6EoIGki/VSXApiHoTeVEEPb7VHnXzggsTR6rZrFtNNpsuNeP1Q==
X-Received: by 2002:a17:903:31c3:b029:ed:6f74:49c7 with SMTP id
 v3-20020a17090331c3b02900ed6f7449c7mr19907014ple.12.1630304702849; 
 Sun, 29 Aug 2021 23:25:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/48] tcg/optimize: Split out fold_const{1,2}
Date: Sun, 29 Aug 2021 23:24:18 -0700
Message-Id: <20210830062451.639572-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Split out a whole bunch of placeholder functions, which are
currently identical.  That won't last as more code gets moved.

Use CASE_32_64_VEC for some logical operators that previously
missed the addition of vectors.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 254 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 202 insertions(+), 52 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index a3780514e5..05de083d50 100644
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
@@ -692,6 +746,26 @@ static bool fold_call(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_ctpop(OptContext *ctx, TCGOp *op)
+{
+    return fold_const1(ctx, op);
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
@@ -716,6 +790,41 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_multiply(OptContext *ctx, TCGOp *op)
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
@@ -730,6 +839,21 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
     return false;
 }
 
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
@@ -1276,26 +1400,6 @@ void tcg_optimize(TCGContext *s)
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
@@ -1307,36 +1411,6 @@ void tcg_optimize(TCGContext *s)
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
@@ -1637,9 +1711,71 @@ void tcg_optimize(TCGContext *s)
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
+            done = fold_const2(&ctx, op);
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
+        CASE_OP_32_64(mulsh):
+        CASE_OP_32_64(muluh):
+            done = fold_multiply(&ctx, op);
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
@@ -1649,8 +1785,22 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_qemu_st_i64:
             done = fold_qemu_st(&ctx, op);
             break;
-
-        default:
+        CASE_OP_32_64(rem):
+        CASE_OP_32_64(remu):
+            done = fold_const2(&ctx, op);
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


