Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0479943BDEB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:33:05 +0200 (CEST)
Received: from localhost ([::1]:56640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVwG-0002Ek-1H
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaM-0003ZO-Qm
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:26 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaE-00024C-M6
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r28so1097636pga.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3ElF8JA3bM0mJLq0luTOxuWYnSYGx2kNvlEU56rwcM=;
 b=sgIQ8t5IZxTauvmM1tldQUs11szXhOB9HvCBwnty8sXIo0S1dcqfqFehoCG4XKWiKS
 4IsYGQlzIZWYgQqkzBErHAYu/KYSMYTpHjlU58w4VE2TBdAICd2pZ3yPxUFddsKsmWnU
 dWbG+7mAfCHjuENGIoo5oY2IOMRJNX+y2tLbnWdUfRxrxZqpPNXvDyAnkIIBg/wPzqYp
 mkABg+UN+GaDW2eF4GaQLSRUQMBtU5gfc/v1lb9bnFo8XD4c8Ci/IVXUHuuTQWGYYVUm
 CZggbz5pMCa4qD4SVxwB43RxgjsA2JgSpwPF6TUxTerPXBjx/suPbVsm9b0FToRLMHql
 2qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3ElF8JA3bM0mJLq0luTOxuWYnSYGx2kNvlEU56rwcM=;
 b=jgjaT8IJSFBdS5BrmJ4k1iLcXKFaiRtXFIUEHqV2Do8ZX2W90zTrtNxBxswRinSlsA
 n+l3R/afB8iXGLN2HRPpeC4LIN+gfqxk/A8mKG+sgGSexCiLxIgHPJ7H7E8qd9cQei6v
 EYhW5IS1Q7G77njGCPtoLzTmjpdbTh3Gwa27eTJ2aopTGzLUCJ0r7JtRiPcsfnFGLFi9
 0crrCSUng+T/9cRX2vbdZsV0BipsJDzS8Pe5NBsVM/jm3I2ld50wRejavxbsqNnk6rmK
 /wuvW0wE1DWFnKmtVMOcFaJBeMp3s33FA7MZ4u6QHL6xjBxFYIyOHw1cl4h6xCUUemVV
 YY5A==
X-Gm-Message-State: AOAM532HopuoooLUWn/1kWhepxqn+2XpQWDOfAvAw36NGOITXdUgPzgv
 PCkiMvub3ozHoLhkjjMev70jjwHzMLeFDg==
X-Google-Smtp-Source: ABdhPJxFFuUo9xX/DuEiGozQDVFC5T6D7ZYvV3WRotUt0N7Cuz1/+7fe2iIHw0zPKCKkyKOX2jRiFw==
X-Received: by 2002:a05:6a00:1995:b0:47c:1e13:b679 with SMTP id
 d21-20020a056a00199500b0047c1e13b679mr3825743pfl.19.1635289817330; 
 Tue, 26 Oct 2021 16:10:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/51] tcg/optimize: Split out fold_xi_to_x
Date: Tue, 26 Oct 2021 16:09:28 -0700
Message-Id: <20211026230943.1225890-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Pull the "op r, a, i => mov r, a" optimization into a function,
and use them in the outer-most logical operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 61 +++++++++++++++++++++-----------------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e0d850ffe4..f5ab0500b7 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -749,6 +749,15 @@ static bool fold_xi_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
     return false;
 }
 
+/* If the binary operation has second argument @i, fold to identity. */
+static bool fold_xi_to_x(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[2]) && arg_info(op->args[2])->val == i) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+    }
+    return false;
+}
+
 /* If the binary operation has second argument @i, fold to NOT. */
 static bool fold_xi_to_not(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -787,7 +796,11 @@ static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
 
 static bool fold_add(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
@@ -827,6 +840,7 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xi_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -837,6 +851,7 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_ix_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1044,6 +1059,7 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1237,6 +1253,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -1246,6 +1263,7 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_ix_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1365,7 +1383,11 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_sub_to_neg(OptContext *ctx, TCGOp *op)
@@ -1408,6 +1430,7 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_sub_to_neg(ctx, op)) {
         return true;
     }
@@ -1423,6 +1446,7 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1546,39 +1570,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expression for "op r, a, const => mov r, a" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(add):
-        CASE_OP_32_64_VEC(sub):
-        CASE_OP_32_64_VEC(or):
-        CASE_OP_32_64_VEC(xor):
-        CASE_OP_32_64_VEC(andc):
-        CASE_OP_32_64(shl):
-        CASE_OP_32_64(shr):
-        CASE_OP_32_64(sar):
-        CASE_OP_32_64(rotl):
-        CASE_OP_32_64(rotr):
-            if (!arg_is_const(op->args[1])
-                && arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == 0) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-                continue;
-            }
-            break;
-        CASE_OP_32_64_VEC(and):
-        CASE_OP_32_64_VEC(orc):
-        CASE_OP_32_64(eqv):
-            if (!arg_is_const(op->args[1])
-                && arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == -1) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /* Simplify using known-zero bits. Currently only ops with a single
            output argument is supported. */
         z_mask = -1;
-- 
2.25.1


