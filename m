Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA2C43D9B0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:11:23 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvp4-0008ON-Ht
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMf-0004sq-9F
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:03 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMc-0003qn-B8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:01 -0400
Received: by mail-pl1-x635.google.com with SMTP id t11so3365567plq.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YxTcI07P5KgjPUJAeZlSj6fs12sCJJNKN5YAni+jya0=;
 b=mVmCfOpN1RAa6jm5fhA0jPLA4MR6sZ0R2QpGEUMQ5p79xffRDCwejaxGroaFf0vhMF
 d2gP8ibqQXPI5r6ljkXxEf+JbfcoDOTLubeBElKpGrt4wFT5DV8rUDO0YWZWRDhZXVr4
 zRuHAklFLXh5RUlEL+fAbRuwAWPvbbFGDcLuAqwQI56DCjqn/WJs7Y9yeloEAI8M7zek
 Z7kmFKoi+hLMfvXsYTr188HnqKVkSrEv7Tiwh1npk/V4YO3zkF5W/39yKkpVLSU0VxeQ
 77l+mxkvBwPxaxMEkva2oROYKBUpYuNc78VAlS8SS4Ckx6Dx+Ef9A/eUU1kBaKkGbxYf
 vKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YxTcI07P5KgjPUJAeZlSj6fs12sCJJNKN5YAni+jya0=;
 b=Z7hlsKI5yCJw98VyfpWWvZ4FB2aK6udHqjHqeD6ZnoXm7Ex6bbq2/mppweYmYq8fdO
 39fVNRi7Xnn1yBrZxu2S3Ldt7Is61X8j4nD1Cjd3Jdf36tQVOJcVKVtAdzAvsUyRYKle
 U1JcTYZXnlAnXtudEmalgjwoS6vZq0jAKpoCee2ipBXNa8ykpHOKiLtNFuUMp+AnOFGz
 +Z33qNdNkk3qyOFslscidHYxifvRV+6iSpsyalqZDHnqlUMGIvGIXUbRvwAAZRbRvBc2
 ocdSQBpTR6Jn/lGcXqoj+VUtFQCuHfqP5yPHMSF9fBQVBsrfMdxcSganwRb2nn05yWB/
 QTzg==
X-Gm-Message-State: AOAM532xpTHNALDEbNnvlnmBd1ED4EGIsnQkCF6syGLYGIMKc6APIZAf
 WSkpoNNF1f3YBRLnKys8F7mQe05XZ5RBRg==
X-Google-Smtp-Source: ABdhPJzNz43ewiKQjtkuBsrEuUIT7ZkZ0jLHN2p/4QhCJE7SlyQDX5v8F7daUfsBu+TtoIC1Cms1Xg==
X-Received: by 2002:a17:90b:789:: with SMTP id l9mr9922284pjz.19.1635388916864; 
 Wed, 27 Oct 2021 19:41:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/56] tcg/optimize: Split out fold_xi_to_i
Date: Wed, 27 Oct 2021 19:41:12 -0700
Message-Id: <20211028024131.1492790-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, a, 0 => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ab96849edf..cfdc53c964 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -695,6 +695,15 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+/* If the binary operation has second argument @i, fold to @i. */
+static bool fold_xi_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[2]) && arg_info(op->args[2])->val == i) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /* If the binary operation has both arguments equal, fold to @i. */
 static bool fold_xx_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -763,6 +772,7 @@ static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
 static bool fold_and(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0) ||
         fold_xx_to_x(ctx, op)) {
         return true;
     }
@@ -1081,12 +1091,20 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
 static bool fold_mul(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_mul_highpart(OptContext *ctx, TCGOp *op)
 {
-    return fold_const2(ctx, op);
+    if (fold_const2(ctx, op) ||
+        fold_xi_to_i(ctx, op, 0)) {
+        return true;
+    }
+    return false;
 }
 
 static bool fold_mulu2_i32(OptContext *ctx, TCGOp *op)
@@ -1753,22 +1771,6 @@ void tcg_optimize(TCGContext *s)
             continue;
         }
 
-        /* Simplify expression for "op r, a, 0 => movi r, 0" cases */
-        switch (opc) {
-        CASE_OP_32_64_VEC(and):
-        CASE_OP_32_64_VEC(mul):
-        CASE_OP_32_64(muluh):
-        CASE_OP_32_64(mulsh):
-            if (arg_is_const(op->args[2])
-                && arg_info(op->args[2])->val == 0) {
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


