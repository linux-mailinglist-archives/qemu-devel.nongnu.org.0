Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE49436CA6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:28:34 +0200 (CEST)
Received: from localhost ([::1]:43638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfc1-00038w-MW
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGG-0007dm-Hn
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:05 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG9-0004KF-UU
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:04 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k26so1762786pfi.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hi4DSis5cTL2HbgfnjRRSnwrVasUqokkS1WztXB4fS4=;
 b=p1H8UPUQf+phyoIZG7DLcoGdKtxEa7tOUhLULnlyBxhINnZPp03845k1QKWqr9uiHs
 bOzsTeL1htKIHaynHg32Pc418sMqibuIXi1GTg32+qaHbnj7SwaoUYYX7dxw/4yUfQVd
 eiVS8WaFQzD4aoS7Pw/KgwoHV51m0KP+2tB4ZLNEkIXF/Homi6ggyiT23vvFDZwcxR0k
 PBz4AEljA4vM/sGblvlBosfY4wdyGoAEzsXI5MUSKl2FiH8VkmgKaiH3Sh8RSyD8F0jc
 PYoUjKhKp/ney7fywcyQMLYFusemXVXGg4k7XDZqCilY1NO1E9BQhGg14U/A4tBtzJzL
 818w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hi4DSis5cTL2HbgfnjRRSnwrVasUqokkS1WztXB4fS4=;
 b=d3+SMeL6GeJPlrPeQcdiFZy/2AYv8O1T0N/grGnc501rsJ4RtAOXSnU3jTbF2nscM6
 tcU0nI6p/VEcNGrACmXJRwNh1M3E/XlYVSyyCKLXaRdYWXpCTIylfLNqBikGOz7KhLWV
 TGDgzxaRc2Iqq8ctPELTCD5wGPmFE24sptYkaaGsz3sg/KFVVnfCZxXs/ZlJDzXrBMQV
 4ku760g7hGGH9FmsxqYNmq8vWKjildzvYRjMYZwTArf+KcvCIvnvnzY+gYztCCSWlS1m
 nFGz7BPObOLQjCvvYWMyxoHJDavDDrOWTU8wzNW1gBR4gxvmHcAEp14apQly371ji1kU
 QOow==
X-Gm-Message-State: AOAM533+9P85hA/YOs7nL21G69gtzz/td4DtVz1TwO5NqprOJMDIsQR8
 qzfckknrZlueyyFnW4FyRrFGhcvW9y/RzA==
X-Google-Smtp-Source: ABdhPJzCxzBufpZxQTEMzvfTAtLc1EYU6GYT1w6r+c1rIVr3flJ8IgFRUt72/HofV07nIa2iqDs9Ig==
X-Received: by 2002:a62:79d7:0:b0:44c:a583:e5d7 with SMTP id
 u206-20020a6279d7000000b0044ca583e5d7mr8026224pfc.2.1634850356045; 
 Thu, 21 Oct 2021 14:05:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/48] tcg/optimize: Split out fold_addsub2_i32
Date: Thu, 21 Oct 2021 14:05:12 -0700
Message-Id: <20211021210539.825582-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two additional helpers, fold_add2_i32 and fold_sub2_i32
which will not be simple wrappers forever.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 70 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 142f445cb1..eb6f1581ac 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -704,6 +704,39 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
+{
+    if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
+        arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
+        uint32_t al = arg_info(op->args[2])->val;
+        uint32_t ah = arg_info(op->args[3])->val;
+        uint32_t bl = arg_info(op->args[4])->val;
+        uint32_t bh = arg_info(op->args[5])->val;
+        uint64_t a = ((uint64_t)ah << 32) | al;
+        uint64_t b = ((uint64_t)bh << 32) | bl;
+        TCGArg rl, rh;
+        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+
+        if (add) {
+            a += b;
+        } else {
+            a -= b;
+        }
+
+        rl = op->args[0];
+        rh = op->args[1];
+        tcg_opt_gen_movi(ctx, op, rl, (int32_t)a);
+        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(a >> 32));
+        return true;
+    }
+    return false;
+}
+
+static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
+{
+    return fold_addsub2_i32(ctx, op, true);
+}
+
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1041,6 +1074,11 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+{
+    return fold_addsub2_i32(ctx, op, false);
+}
+
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1686,32 +1724,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        case INDEX_op_add2_i32:
-        case INDEX_op_sub2_i32:
-            if (arg_is_const(op->args[2]) && arg_is_const(op->args[3])
-                && arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
-                uint32_t al = arg_info(op->args[2])->val;
-                uint32_t ah = arg_info(op->args[3])->val;
-                uint32_t bl = arg_info(op->args[4])->val;
-                uint32_t bh = arg_info(op->args[5])->val;
-                uint64_t a = ((uint64_t)ah << 32) | al;
-                uint64_t b = ((uint64_t)bh << 32) | bl;
-                TCGArg rl, rh;
-                TCGOp *op2 = tcg_op_insert_before(s, op, INDEX_op_mov_i32);
-
-                if (opc == INDEX_op_add2_i32) {
-                    a += b;
-                } else {
-                    a -= b;
-                }
-
-                rl = op->args[0];
-                rh = op->args[1];
-                tcg_opt_gen_movi(&ctx, op, rl, (int32_t)a);
-                tcg_opt_gen_movi(&ctx, op2, rh, (int32_t)(a >> 32));
-                continue;
-            }
-            break;
 
         default:
             break;
@@ -1722,6 +1734,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
+        case INDEX_op_add2_i32:
+            done = fold_add2_i32(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(and):
             done = fold_and(&ctx, op);
             break;
@@ -1816,6 +1831,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
+        case INDEX_op_sub2_i32:
+            done = fold_sub2_i32(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
             break;
-- 
2.25.1


