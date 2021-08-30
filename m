Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C493FB148
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:38:09 +0200 (CEST)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKavj-0001X3-Hg
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajM-0004Na-2M
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:16 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajJ-0007eL-PT
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:15 -0400
Received: by mail-pg1-x530.google.com with SMTP id y23so12414618pgi.7
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Dk8TGNQOVNzQn8cwlm1MaEPrVhLuKdgx7sOHdUet68w=;
 b=qHLA0FQTXvedK6h0BU9XOvS+oFEnmoCv874Kg41AdiAI/ZSOTCNlcteQkfzYNBfuuD
 4SntmMPYG92y1f03OXDRXEuaNfKvzf7GXUnDYLwmUK91jzGUc1rML+mwnl/zMWdR7YaR
 U1sO20G7reXW1xSf8wmcCY4m194KSAL6PhnJ/HQ8E9XRmV2dlsJefJz+fWfQRo0s020P
 NvqDBZrcl3CTA0an+pczBuFKtFiOynntfkyAqINr1f5DisZfzymQ2SscMwG3JhARPwST
 6kcAV/OvbMU2Lz8sWEWpAH/Vjg+PgXQqgEgfiRM1VHaOM/FB/IKEZ7Muz9lGrtHHmXSS
 zkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dk8TGNQOVNzQn8cwlm1MaEPrVhLuKdgx7sOHdUet68w=;
 b=XwpLvltl3Vm5nk+YorOwKjEFqr6k2HJGYOmiWnFs4/OYiWgrngfTY4yTgwKRXk9T5u
 rA3CJCfkO6Sn2CtN9K3ZO8qbM3UCfx8BqhhvKd0j/I4eEZoXP34Op4DhRxu6quavadRx
 UxGRZ6JJp5GxJz3tVLFBUOp/KenDO/5rjMoEw524WI0ENwSmeyCjOe1fJy37bxEv2oLj
 QVezZlvhjMaFxKpHpgcl5k/BFHF1pXL1bpy/AA1JrLW9O3LpBJil91SsAy8CMQGI656r
 mggU/BMPN2DkBLaEGxHeEozEK2qmTI7w3IA9Fa9H0VcWBTGu/yBFcEQZsFYcMbu0PVjF
 I/Gg==
X-Gm-Message-State: AOAM5308bVoOHKHLQL1uXT4clahhsG5wYZDK2U/+V3zi8OojQ2j0jHT5
 1Ab9Iu5WZZk5IzZ3Eb2pBZaGq/fTS7DWMA==
X-Google-Smtp-Source: ABdhPJzQM54LSV8K+iDqHoHFP4F77OsB4Mm39Uj/vydZAKxCAinWd0ZUjptBX5dvqX7Jvl+f94kIaw==
X-Received: by 2002:aa7:9ae9:0:b0:3f5:e1a7:db23 with SMTP id
 y9-20020aa79ae9000000b003f5e1a7db23mr14282965pfp.42.1630304712224; 
 Sun, 29 Aug 2021 23:25:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/48] tcg/optimize: Split out fold_xx_to_i
Date: Sun, 29 Aug 2021 23:24:33 -0700
Message-Id: <20210830062451.639572-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Pull the "op r, a, a => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ee674fe623..f48d0bc52d 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -695,6 +695,15 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+/* If the binary operation has both arguments equal, fold to @i. */
+static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (args_are_copies(op->args[1], op->args[2])) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /*
  * These outermost fold_<op> functions are sorted alphabetically.
  */
@@ -744,7 +753,11 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
 
 static bool fold_andc(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_brcond(OptContext *ctx, TCGOp *op)
@@ -1211,7 +1224,11 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
 
 static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
@@ -1221,7 +1238,11 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 
 static bool fold_xor(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 /* Propagate constants and copies, fold constant expressions. */
@@ -1726,20 +1747,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expression for "op r, a, a => movi r, 0" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(andc):
-        CASE_OP_32_64_VEC(sub):
-        CASE_OP_32_64_VEC(xor):
-            if (args_are_copies(op->args[1], op->args[2])) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
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


