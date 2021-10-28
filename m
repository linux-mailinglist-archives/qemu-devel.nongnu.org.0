Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF37843D9AB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:09:05 +0200 (CEST)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvmr-0004x8-17
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMh-0004tG-60
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:03 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMb-0003nf-3l
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:02 -0400
Received: by mail-pg1-x535.google.com with SMTP id h193so4964437pgc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8y4qKou3t3jzIUIj9qEAD2/5WFZAuzm9armlPHHtAYM=;
 b=TkHeTtle3sxri8qarnqJ2/9ktVESMt5Ulph73eqD9LcDr8irqcvrSCjZtNj0qMZSx0
 ZtflK/viXAeMtx3FFfsIwU+8Ez8i14kbwBN2NviHMsP4LMTzkLPoOOwnTemqLrGRmUHT
 C+BtCNzmbgMKdHGykp/nJ8yaJAPcqtZvEwjFneR/1Sl9C6fcpaBCfYaKf4LK10IWBsTe
 Boc7PcLheIuqyYoFhc4Q123MxAmpvAacFsDNh3TvcZcS8UFOPxQwhTwgKjSCyfFAddtU
 9FjbMMrLurnzrjSN/2OLrrDsZi9HqUJ4crMBvddDTuZDFM+UUjidg/eBn9FOHfCXnKTO
 AkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8y4qKou3t3jzIUIj9qEAD2/5WFZAuzm9armlPHHtAYM=;
 b=JfUlMTDubZsVChPrtO2FI9uPAYKC17PVBsPh/1D+903KdAtYdQMTC9O9FSkOtgDpPF
 gy1kbSFBwt3mc9oEKuzse2xfp6WaAYjxiCLeyskWudJ254TNmf1sBa211f2DcVWujpSf
 jjjsLmkMLqMeEIa3aoxYoK87HHZSTI3ACjYLJmUc2VUiLDb0N8IBd/cXIkQiBA8ST14Q
 M+0ZuhU6QgkpM3x7pzn2OBvzEoBhssiP3j07jMYMxxnPyAh1KVsIDKQ0F2eoNrnP1osQ
 GjGASTxcrSEDjpAYWRIsYuJpGQAS820ib0nGTVabBWTw2QVtqTD/rYX6Sx7afDwa5AjK
 /BWg==
X-Gm-Message-State: AOAM530peaWrmzIivOY0jtW/3jq/QE6FPWtxLQ515oujZ0yt8uBOQ1+j
 SMIrlWtJA+Ol2953l2WWUAMOnG9hbcc9RA==
X-Google-Smtp-Source: ABdhPJwiNogIV/Sz8oXmu2ctY7yPGmt9mWqbAm6FGlzrGDCGndsNWCQ87TQpqhv4sEP5z89lejE6wQ==
X-Received: by 2002:a63:91ca:: with SMTP id l193mr1143050pge.213.1635388915650; 
 Wed, 27 Oct 2021 19:41:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/56] tcg/optimize: Split out fold_xx_to_i
Date: Wed, 27 Oct 2021 19:41:10 -0700
Message-Id: <20211028024131.1492790-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Pull the "op r, a, a => movi r, 0" optimization into a function,
and use it in the outer opcode fold functions.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5f1bd7cd78..2f55dc56c0 100644
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
@@ -1224,7 +1237,11 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
 
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
@@ -1234,7 +1251,11 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
 
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
@@ -1739,20 +1760,6 @@ void tcg_optimize(TCGContext *s)
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


