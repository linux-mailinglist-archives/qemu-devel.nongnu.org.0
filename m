Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31869484BE0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 01:53:29 +0100 (CET)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4uYR-0003T2-Ia
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 19:53:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uMW-0005Eb-Ls
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:12 -0500
Received: from [2607:f8b0:4864:20::1034] (port=45886
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uML-0005eu-Em
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:08 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso4785087pjg.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 16:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5JjYgAjXn1kQxSGxYgLEIz1R3XcGictv5Sz0+SPB7Hc=;
 b=okq8YPLpf8gr+v1HLphYVdWkyNhpTaBGTZXgSz5MxC7wkCPXN9QKxAEvI0ILgxOoqF
 yYBHSd7k3HMVqptvHqGViuDD/ByRXTlT9A7fw4rIDbF76u6rkM6fhZ4U+xSwkckzvHxF
 lb3QR6CNAcO1FscanxVPCVT7xP0zYmmkG+gOq6A6VPmeUSgRKFpnN8hDxOVQTpn9vfdK
 qorZAG62A4Tu8sTpgxIwlEogZxpIU6qWArXRR3zErc0RPlcyqqlTQuz1gyEuOR5kANm/
 HYe9KMhj/Q+TEImj37F3Gf4owjqA2uav7CzDJYHJ6X2fhlnRPqr5RB/IzBRvj9fs5mro
 7Iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5JjYgAjXn1kQxSGxYgLEIz1R3XcGictv5Sz0+SPB7Hc=;
 b=upy/0BgbksnmMhbLn2VgypWGMtt6ePIHItMilA2uLSBqVWbcDW1I7xOkrDP6yKtbs8
 +WJtDyNoCOx/rrORDmby/N0Y7LJqZf+Gd5UyzYEnd8x8VfexgFULh/fMV6+RH9/F6N+E
 nvnRPcLKNSy3UziCD1VMPvvA8shOdcpOVFLNCwCIB+bVhVilCOeMrQB/dxV6rVrzD/Bl
 06eslgNq3ABdoZMEAFUfDtIVA0bqLcfgwpFWnaH3Q/o43ZgY2oLAlTeO+8yBd2eh+aup
 A6DD2UkAx4z9Oc4GD17wngfRUHzIeZ5FlOOTxb0mbg33ECy3PJAPZhxO8tLRcza0JAoH
 vz+Q==
X-Gm-Message-State: AOAM533qR424MdkXPllqf2UDZt+1dlEVYJHRBDxTYI9LZoNcg98HLdK9
 PeorJWlUYDjfAS7aHgf0RGh8YcBZpjSaqg==
X-Google-Smtp-Source: ABdhPJzeanz0S3bR2zMY8WuSvOQAlmj+GW702GpRNqDCkaLd7RKzCiZS951DK2f5W6WoTSIAOGQLuQ==
X-Received: by 2002:a17:902:d487:b0:149:c6e8:b4aa with SMTP id
 c7-20020a170902d48700b00149c6e8b4aamr3805936plg.108.1641343256134; 
 Tue, 04 Jan 2022 16:40:56 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k3sm35312356pgq.54.2022.01.04.16.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 16:40:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] tcg/optimize: Fix folding of vector ops
Date: Tue,  4 Jan 2022 16:40:51 -0800
Message-Id: <20220105004054.587588-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105004054.587588-1-richard.henderson@linaro.org>
References: <20220105004054.587588-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bitwise operations are easy to fold, because the operation is
identical regardless of element size.  But add and sub need
extra element size info that is not currently propagated.

Fixes: 2f9f08ba43d
Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/799
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


