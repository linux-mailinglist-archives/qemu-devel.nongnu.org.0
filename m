Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8F43D9B4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:13:24 +0200 (CEST)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvr1-0004Ko-6z
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPe-0001Uk-9z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:06 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPa-0005ya-FR
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:05 -0400
Received: by mail-pf1-x42e.google.com with SMTP id a26so4542100pfr.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c9WNRlGeOHz8VZWPjOaGMMZX6Dax33jheJzEQdYsE1k=;
 b=gE5Q+1nsu2Bv3zt9O2npp5hRbm9Z8eFR4kssxCl81yZKz6V3RGcJCWcmo27yF5CVTQ
 A3qyFY2AXOGlDXuob4+/jhc9s0bJ7tnYZ+kJlg8PalRJdMCpZHVJSNFL4XcTMInonY7a
 pJU0vG4GWChRnum8aXdW09Bcw8IcYEktlBxhr5iquTFFhQ9ZcUl9zJm6cXhLSGGUpWV3
 IlPX2CcM25nG9NhzQnBiQPiRl2Ikdz3B72R+kPMeed4vnWcAZKsROeEMfQsN0YrrT0W+
 n1l1Vq8VvsNza3pqXMPE55+VajJdi5r3bBr6TMNjtD4cjBKOhwa/Chs1FZlhAADonoeM
 DQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c9WNRlGeOHz8VZWPjOaGMMZX6Dax33jheJzEQdYsE1k=;
 b=cD5uInAXa51GmVcNzQV507Plfp8VoM2ue7ftjCk+vf4jf9hBm7k39tHV/SQSIeui4+
 wHKSPhIsoMjq7UdwnRY7fLVQUIVL4TbQaVMEgblXj3g+doN5DaKKtKJKklmvKkGINNEX
 ymA6k7wfrKf4bhq7B8OUV6HnpSnXNg+LHd+5QV9DGA5Ab5s7Q4qLeyHFRESlAT9wwnee
 z3iwJJzytO+MKX+4M/oApADoRkQa+pXLkvqvjzMC0NiagewmaFfVGl2wuMipy949NbwB
 TeoZuAmZKcHYmU5Q3I1SOt3MeZxyq1aOaytYjqRwMjWo4Xei9kfUO1PBdB9cx+vekl0V
 +zEg==
X-Gm-Message-State: AOAM531dDdwg7ZHHRP17KEnZpLWI3JUlYw1hfeezPP3WglJOmbXq8IrJ
 7bHAWCgrFsqrjWvkQReyPh80N6AFZpqy1g==
X-Google-Smtp-Source: ABdhPJw6Hgf+lzRZTEw4ZeSvIJ/ffbxI3SH1KwgFmmQiFQHWTpchhC2l/zE4mz0g2p6ITAQ21tjuPQ==
X-Received: by 2002:a65:62d1:: with SMTP id m17mr1200140pgv.370.1635389100625; 
 Wed, 27 Oct 2021 19:45:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/56] tcg/optimize: Split out fold_ix_to_i
Date: Wed, 27 Oct 2021 19:41:17 -0700
Message-Id: <20211028024131.1492790-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Pull the "op r, 0, b => movi r, 0" optimization into a function,
and use it in fold_shift.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index f5ab0500b7..bf74b77355 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -731,6 +731,15 @@ static bool fold_to_not(OptContext *ctx, TCGOp *op, int idx)
     return false;
 }
 
+/* If the binary operation has first argument @i, fold to @i. */
+static bool fold_ix_to_i(OptContext *ctx, TCGOp *op, uint64_t i)
+{
+    if (arg_is_const(op->args[1]) && arg_info(op->args[1])->val == i) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 /* If the binary operation has first argument @i, fold to NOT. */
 static bool fold_ix_to_not(OptContext *ctx, TCGOp *op, uint64_t i)
 {
@@ -1384,6 +1393,7 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_ix_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -1552,24 +1562,6 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        /* Simplify expressions for "shift/rot r, 0, a => movi r, 0",
-           and "sub r, 0, a => neg r, a" case.  */
-        switch (opc) {
-        CASE_OP_32_64(shl):
-        CASE_OP_32_64(shr):
-        CASE_OP_32_64(sar):
-        CASE_OP_32_64(rotl):
-        CASE_OP_32_64(rotr):
-            if (arg_is_const(op->args[1])
-                && arg_info(op->args[1])->val == 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
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


