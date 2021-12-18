Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE072479C5F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:45:51 +0100 (CET)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfeQ-0003JB-2I
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:45:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbb-0000Rn-Bp
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:55 -0500
Received: from [2607:f8b0:4864:20::631] (port=38416
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbZ-0003RV-PJ
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:54 -0500
Received: by mail-pl1-x631.google.com with SMTP id o14so4764565plg.5
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Py2CQU23qc5Ab7F/OtpE3uQ6+1+aoSI03Ao4KqfuEtM=;
 b=iL7arnROj0I5ahxLD+Ikwc5Pz3lq3PNItUQTFgKWijLf88XxOemVP926B7PfBCbObT
 X5BjHg74TI6GURv3l3Fxh24ChKTGUrcPGpxEkO4DT7uL9xTeD4v4LiAMVqOvz1HYWi0e
 dy+VUzHttpMlej5OitVwIkY7uNa87aVKVcEbZLWHpni64eJxL8IlpUcFvwA3iiwrwId5
 c1MI0TLx68HBg/dZZMB0e1+088qjBFVC1686mQaPF7JG9rmR0e/JhVvSzju5IRO/UGAa
 ywrzKmsOu8mL0K9db3xume0rGK6o0ceH5YQG7Rkh8I6S6iXj7eNy5FHIaZ93db/rXQWq
 Z83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Py2CQU23qc5Ab7F/OtpE3uQ6+1+aoSI03Ao4KqfuEtM=;
 b=YhvfTI1gJjPrnRXwF7lfQkNVCTGOWOP8OKJc5lxEIm515DFoNf+h+htlMyPgAD9hyp
 syYiEnl5R2V4qHmxFD41iieY+ElM5ywO3e6mzezZ+aeyLaXBBmvo5W8uNg9fpo4MN5Ti
 gQ1spnAn9kbGxQMU0xJi8bxgy8luwXCZQ7lSq8Y/aVMiiTp5c51PbQq2dN3shJbZ8wqZ
 N8eMqDT3+6xM/HBlgxtYv1USIU/hgt6m3vCpf8mIJwrI9eh/LFlpFL0dzUUmf7VuUK6Q
 O5TxLzfsUO2TV7h+9mnhnxs20gmbRvFRZUbrKFubvwA2WrBKJFTWryPXome8p+lQmWzK
 UHbg==
X-Gm-Message-State: AOAM533/f7L1tsn9VKUUZEDAtW5UC63hrk5k4pgnFtZ7SmCeMBF/QO1y
 pE9wm1TuyLcAwklFmkLBvwdCMLffEevcmw==
X-Google-Smtp-Source: ABdhPJzQa8LR3H5OHlKPYZVDctWhKLQbEDMUb8ZMNxG2Dr1e0+F/CDWEtywZVX9y4xyecSPl3tHtsA==
X-Received: by 2002:a17:90b:4f4d:: with SMTP id
 pj13mr10992696pjb.4.1639856572488; 
 Sat, 18 Dec 2021 11:42:52 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/20] tcg/optimize: Fix folding of vector ops
Date: Sat, 18 Dec 2021 11:42:31 -0800
Message-Id: <20211218194250.247633-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Bitwise operations are easy to fold, because the operation is
identical regardess of element size.  But add and sub need
extra element size info that is not currently propagated.

Fixes: 2f9f08ba43d
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 2397f2cf93..e573000951 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -308,13 +308,13 @@ static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
     CASE_OP_32_64(mul):
         return x * y;
 
-    CASE_OP_32_64(and):
+    CASE_OP_32_64_VEC(and):
         return x & y;
 
-    CASE_OP_32_64(or):
+    CASE_OP_32_64_VEC(or):
         return x | y;
 
-    CASE_OP_32_64(xor):
+    CASE_OP_32_64_VEC(xor):
         return x ^ y;
 
     case INDEX_op_shl_i32:
@@ -347,16 +347,16 @@ static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
     case INDEX_op_rotl_i64:
         return rol64(x, y & 63);
 
-    CASE_OP_32_64(not):
+    CASE_OP_32_64_VEC(not):
         return ~x;
 
     CASE_OP_32_64(neg):
         return -x;
 
-    CASE_OP_32_64(andc):
+    CASE_OP_32_64_VEC(andc):
         return x & ~y;
 
-    CASE_OP_32_64(orc):
+    CASE_OP_32_64_VEC(orc):
         return x | ~y;
 
     CASE_OP_32_64(eqv):
@@ -751,6 +751,12 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_commutative(OptContext *ctx, TCGOp *op)
+{
+    swap_commutative(op->args[0], &op->args[1], &op->args[2]);
+    return false;
+}
+
 static bool fold_const2_commutative(OptContext *ctx, TCGOp *op)
 {
     swap_commutative(op->args[0], &op->args[1], &op->args[2]);
@@ -905,6 +911,16 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+/* We cannot as yet do_constant_folding with vectors. */
+static bool fold_add_vec(OptContext *ctx, TCGOp *op)
+{
+    if (fold_commutative(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0)) {
+        return true;
+    }
+    return false;
+}
+
 static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
 {
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
@@ -1938,10 +1954,10 @@ static bool fold_sub_to_neg(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_sub(OptContext *ctx, TCGOp *op)
+/* We cannot as yet do_constant_folding with vectors. */
+static bool fold_sub_vec(OptContext *ctx, TCGOp *op)
 {
-    if (fold_const2(ctx, op) ||
-        fold_xx_to_i(ctx, op, 0) ||
+    if (fold_xx_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0) ||
         fold_sub_to_neg(ctx, op)) {
         return true;
@@ -1949,6 +1965,11 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_sub(OptContext *ctx, TCGOp *op)
+{
+    return fold_const2(ctx, op) || fold_sub_vec(ctx, op);
+}
+
 static bool fold_sub2(OptContext *ctx, TCGOp *op)
 {
     return fold_addsub2(ctx, op, false);
@@ -2052,9 +2073,12 @@ void tcg_optimize(TCGContext *s)
          * Sorted alphabetically by opcode as much as possible.
          */
         switch (opc) {
-        CASE_OP_32_64_VEC(add):
+        CASE_OP_32_64(add):
             done = fold_add(&ctx, op);
             break;
+        case INDEX_op_add_vec:
+            done = fold_add_vec(&ctx, op);
+            break;
         CASE_OP_32_64(add2):
             done = fold_add2(&ctx, op);
             break;
@@ -2193,9 +2217,12 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(sextract):
             done = fold_sextract(&ctx, op);
             break;
-        CASE_OP_32_64_VEC(sub):
+        CASE_OP_32_64(sub):
             done = fold_sub(&ctx, op);
             break;
+        case INDEX_op_sub_vec:
+            done = fold_sub_vec(&ctx, op);
+            break;
         CASE_OP_32_64(sub2):
             done = fold_sub2(&ctx, op);
             break;
-- 
2.25.1


