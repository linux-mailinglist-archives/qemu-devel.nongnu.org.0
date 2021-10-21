Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D878436CE1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:42:30 +0200 (CEST)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfpV-0001VY-DL
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGN-0007hi-V8
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:13 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGH-0004W7-RP
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ls18so1412574pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2mtOn4rMVNP2RgfAFpzeI+ubeNI5mnnLuo1JiLFyiNQ=;
 b=JMMAYJoaF6yeiOYaaFmGs2sieIwsG5ElgwW+rkcQITfe4vUKRQTaW0QWWnAxTOjZe4
 I5qYI8zbzCLFHZTyFJzZpyN0uvtZYQYGD3OVOsFKBt3zh5nor1XS6ZaXzl0o1M6M6G3g
 AyP3SWxlja17iEdVOLhRvz/BSB6bN2RJxcmBiLWgjfII2XJjnnqLNjO/Sbmgjb/36IX2
 tZSqOGV+XE2ebkBsIlBj1GmEsBmCenSFjbAKBvnxaL6CERgY2Zc4qFBQiagsFoBMBzsq
 KJovR41WtEs5AT0xjX8yRTPjqu1RtgYj1yNdxed2J71B6TOWHcMmsxCPNaswgrwH4cQ8
 HkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2mtOn4rMVNP2RgfAFpzeI+ubeNI5mnnLuo1JiLFyiNQ=;
 b=hxjriJ+5kLT8ENOeAjl9G5KkufeTYxkCaew1m1q9Wmc+BaUXHk+5wcdP2DIKnF4S+D
 7SLJqMHSNV4VKLoieWdxFpPrS1OuPJ2Z7yBIh/YrvE7cg3XvGMLIu3x+onbUXTxt0zQL
 DR7NW4vE/dpqeFFTlNyL10TgFofORUXB6aiY6h4i2wc339zqVhRzGO/0+HuyoiGRt4DT
 QG64zOMxJVBLW3Ff4lXbBCpDMaNL3Bw6DygxfMN/mK1p3arMCnW740xck5eXs47eCL1/
 hPCLBQQJTpRQjkYvOSukiqznmLXCZSDrqzijIVsJppLhcpqP/TyrHhxUwE5JJZiCzRCV
 ZT7Q==
X-Gm-Message-State: AOAM532C9v24qbA4MMt2SvvQhd56E3L6tP3eDILD3N2DWI6T6mDr6YN4
 m63gtOl8NTB0+GTvi3vN5nnCnReFqbU=
X-Google-Smtp-Source: ABdhPJxCXnKSEiXwulDACFE/hoHZ+54LO8wEUtbmPXSiJ1jlhb736IhNIN9WGrXfVsWT48oqRiNSKA==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr9293407pjb.169.1634850362643; 
 Thu, 21 Oct 2021 14:06:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/48] tcg/optimize: Split out fold_xx_to_i
Date: Thu, 21 Oct 2021 14:05:21 -0700
Message-Id: <20211021210539.825582-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the "op r, a, a => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index af055f05d3..5ac7a45597 100644
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
@@ -1209,7 +1222,11 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
 
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
@@ -1219,7 +1236,11 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 
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
@@ -1724,20 +1745,6 @@ void tcg_optimize(TCGContext *s)
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


