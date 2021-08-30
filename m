Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBE43FB155
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:45:23 +0200 (CEST)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb2j-0004Tv-IC
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajQ-0004TC-Bj
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajO-0007hV-AE
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:20 -0400
Received: by mail-pj1-x1033.google.com with SMTP id oa17so8765043pjb.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I7oNavD7wRA/u6mTbBY5YtK34tMDTw/5n3Es5YrcfuQ=;
 b=L20WMVz6TK3CVsvqnv9YfhGw3qs0gUkmfneYSZQw4JuAhxNmg/zQssHcATkEQamVkq
 0UziAMQ5AcQEpfCxGeoUZwXvdxTUNdZxPSr36uRxr/6/MEvC6gK6/PyPa9g3q1geIfIR
 c5XiIc2VpQQ2A9ZEZdd0zMKf2NLl0jQnfEzBrRB8Unp/jVFzMYusFTBy5cVNu+2jv1w8
 qK2SyjMnT3wEydRDiLbIBfo6Vc6smZry/WMtNhSZl0p2JYXBgfHOqVTB0u1Y7srpY7o6
 E1SdJw57T6sOj7x6c0L1up5UYRQj9e8M4PsHHLsag7OhTZI898Z1JjUtTqzgwgsb34Dm
 4uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7oNavD7wRA/u6mTbBY5YtK34tMDTw/5n3Es5YrcfuQ=;
 b=aab5l/u9SCAU3Uwshk8Bn7B4EUQQumOc2y3P30uKtwEl2W9rYqkcir4Tji/cC+sTmt
 8ipiL/v3RLBaruzrhk6soqMpVEsf0T/zMnJgmxwQEZSgZcgnSVjqDgBlEeNHFRG0gmEB
 LuK8M5jHYD+vvBVWCdUDjSKVOPPiYc1GrFchi7SpElo21tY4Vxm0oZVLFpV63Sh+WTOO
 3lRu6M+GSPmZCJpZnLyM+OAuPL2u6IhdiB5pkoSSS0RHSAPvAJEWFg6daqhO3UL6uKck
 6FHCfXTbjPBOWwm2rXgis68U5X7GayB09OB0O2OCb4OJB+exN7HP0aUALqlueGhfXCWK
 fnEQ==
X-Gm-Message-State: AOAM5327EowElO5cWcztKYxoW7yMprpQQTHKQvjX7FMzNtINvfK8l4NU
 ioBD9tAz20uqbjg6IXt9NkIv1qbpcoHHrg==
X-Google-Smtp-Source: ABdhPJzCxzcjwyNyZbwLGz/uyz8XnIxnoss9xzpsZWZ1ezejcdQXcpa9M8NGUtMbRDQkNXoOwX8kig==
X-Received: by 2002:a17:90a:4a8a:: with SMTP id
 f10mr18712348pjh.195.1630304716068; 
 Sun, 29 Aug 2021 23:25:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 36/48] tcg/optimize: Split out fold_xi_to_x
Date: Sun, 29 Aug 2021 23:24:39 -0700
Message-Id: <20210830062451.639572-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Pull the "op r, a, i => mov r, a" optimization into a function,
and use them int the outer-most logical operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 60 +++++++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 35 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 23594e1a03..3b0be1c4e1 100644
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
@@ -1041,6 +1056,7 @@ static bool fold_dup2(OptContext *ctx, TCGOp *op)
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, -1) ||
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
@@ -1217,6 +1233,7 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -1340,7 +1357,11 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
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
@@ -1383,6 +1404,7 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_sub_to_neg(ctx, op)) {
         return true;
     }
@@ -1398,6 +1420,7 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
         fold_xx_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 0) ||
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
@@ -1521,39 +1544,6 @@ void tcg_optimize(TCGContext *s)
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


