Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3593FB17A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:57:40 +0200 (CEST)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbEc-0001wQ-Qu
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajO-0004RR-2B
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:19 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajK-0007eW-3d
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:17 -0400
Received: by mail-pg1-x536.google.com with SMTP id c17so12473542pgc.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uRn4oZx0R2inY58Z0L6HjLhCbVRsyKo+GkaJcQcjclE=;
 b=Wz9HSwNoPlaTM8Ng+52gPh8S+JuYQIGZljbZ2ai2tHZneHuhBhdEweOj3eiw4BJtZ1
 9EwxxV9nWc7iGCH0BgG60SRzYR7hvPt32zkmGFe4UOEKDBrlvx5OYyotnTG6P6X679+Y
 9Njo0+agmfk3CIGA3Wrr8fv/2TRH+DjBvRR6348+b46XbAWX5VpVUOrr6hizB2frnYR1
 i0yj4VBUp+XDOC3RZmmWO3It5Uc8/4zKtLriwrrney4rkgqZyOgLvILBfxqhE5kBbG7M
 vYlmQLAK8sN1yjFJOK0HzoW4BLbfNYphWu2fUD3z46Q35FYvBbQfV4Bb3vyl4l6veG29
 lcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uRn4oZx0R2inY58Z0L6HjLhCbVRsyKo+GkaJcQcjclE=;
 b=LauWRwga3+/C0Slr+ID3XLW/9OSo1uBCPu3e4NA8kp4eWP+QUGAZ8sgkrW2TDGo2t1
 aYh1AdsxefuUSDhCEA3Uzk5FxfeIRdkWkudlaqPOYh9DEYEfNoQeaAmjmIU+SPFkqJoF
 gGK/p2TyzmOrmr6CsUJOcTZXpvHtxlYYmLGpUJbo5nbOMs+bTBPglkaLRXhVLRyYEBia
 V/jJd22MV1RcOY4ccJhYkFviI3TkoE7uoN0l6vE/B7zPq3voWjwbMhmViV059gPCJtPx
 9VOis9qtYN7+UIHvVC9isLI55q8pCNXNSsezKOf7bgDxgLmsyaYhgw0W8kVeMDwdaWz7
 GfTw==
X-Gm-Message-State: AOAM531XzUOMPpj5vaH9ImfBHTfupEc5lP3Bjlcx1Cu9hG4MT11OrazB
 EdtNFMYih1OLjL6rlQoiLJNbwZdERhDISw==
X-Google-Smtp-Source: ABdhPJyeGnghilLRWTMlC7F0wrYjFjS5pL/NmVGk0F65cVgCnA6WJPeHBF+R+VI+14pLDKVZYkRJ4w==
X-Received: by 2002:aa7:8888:0:b0:3ff:1d90:1864 with SMTP id
 z8-20020aa78888000000b003ff1d901864mr4582206pfe.54.1630304712805; 
 Sun, 29 Aug 2021 23:25:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/48] tcg/optimize: Split out fold_xx_to_x
Date: Sun, 29 Aug 2021 23:24:34 -0700
Message-Id: <20210830062451.639572-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Pull the "op r, a, a => mov r, a" optimization into a function,
and use it in the outer opcode fold functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f48d0bc52d..cb05da7b39 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -704,8 +704,22 @@ static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
     return false;
 }
 
+/* If the binary operation has both arguments equal, fold to identity. */
+static bool fold_xx_to_x(OptContext *ctx, TCGOp *op)
+{
+    if (args_are_copies(op->args[1], op->args[2])) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
+    }
+    return false;
+}
+
 /*
  * These outermost fold_<op> functions are sorted alphabetically.
+ *
+ * The ordering of the transformations should be:
+ *   1) those that produce a constant
+ *   2) those that produce a copy
+ *   3) those that produce information about the result value.
  */
 
 static bool fold_add(OptContext *ctx, TCGOp *op)
@@ -748,7 +762,11 @@ static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
 
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_x(ctx, op)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_andc(OptContext *ctx, TCGOp *op)
@@ -1103,7 +1121,11 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
 
 static bool fold_or(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_x(ctx, op)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_orc(OptContext *ctx, TCGOp *op)
@@ -1734,19 +1756,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expression for "op r, a, a => mov r, a" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(or):
-        CASE_OP_32_64_VEC(and):
-            if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-                continue;
-            }
-            break;
-        default:
-            break;
-        }
-
         /*
          * Process each opcode.
          * Sorted alphabetically by opcode as much as possible.
-- 
2.25.1


