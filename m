Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B191143BDCF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:24:55 +0200 (CEST)
Received: from localhost ([::1]:37170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVoM-0005cB-Pd
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa1-0002yh-Qr
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:05 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZz-0001yC-7N
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:05 -0400
Received: by mail-pf1-x434.google.com with SMTP id x66so862815pfx.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFsfCOujg6xp28y0o9M8YysK5F5Ff4YXOa1Luu+j29I=;
 b=k7hI726Wfc6dC5/ziKhwNJVwtTa+jmSFf8Db6lTHOkJt48h0BV44mUmDIo4I801X8I
 BHAESc41AgeEva+2asQ3/hgYWbZkKOG5drybMLe5lTnHh/e2p0wSfna/50TkGkgkHyqP
 VmHH/7fXkTRfBkpzzga0/P82tpD7OAr9WQpYrEj7mbFIIr6Dukfr8ZiQ0QfCeF6KS/Xx
 oDfoHu7y888xvSP+1i2uY0FVPeNMfLx8BVt3EszbRtOpEH7yGI6NbIfRmeDlMHE6ZB0X
 m027uXc9opm6KHeEvCAjUQBxepl/LKJM3bSVtOWxxiMrfrmsnXPI4Zw+auUQhaSpmo+u
 ep8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFsfCOujg6xp28y0o9M8YysK5F5Ff4YXOa1Luu+j29I=;
 b=J8MzuXFIf9ZAQPUoRY4uBPcHt5BJxGF4BIJOxWW977DofxPJmk+8o631bFaTL8cB20
 rFp5nSp2C2J7H9gYvzS6YtzpsvYVCTmrmCIuWJu4aXjPHtjUil4UwtFaPhLLhq2KdFkb
 ELhM46kJ8MEn0qrH3nLF+VuK2Pb1DLMCdCWSWXJZdkSrqXv35lSoE6iIZvKuQJ2NYQRG
 x+mfcqUsR+puYlMFk9erx2WRAYSJtSPLFwjLnWrbIlpI0EeGXX3p5NyIydXv5cc45u2A
 tfcu8a3vhUgn0yKf4XloGrptf0IzrNTlvHW+TDaIRwk+lxzFc3ZbpqCvNH8XZfBq5Azg
 BVxQ==
X-Gm-Message-State: AOAM530hYyTKK99J9Z2W+35637+BmPgkTPsBwHBaK1w1axo87MTPlM9S
 8WrW292HoG8PGIc/amzxs3zfMyzxW3ssgQ==
X-Google-Smtp-Source: ABdhPJxHy8KOHUfYyPUy93/xnC5945pxMU9OuE5quF2aD7WWKNCE/RgMPOtygR3Gh48qw/GHmIn4yQ==
X-Received: by 2002:a63:618d:: with SMTP id v135mr13947990pgb.79.1635289800905; 
 Tue, 26 Oct 2021 16:10:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/51] tcg/optimize: Split out fold_brcond
Date: Tue, 26 Oct 2021 16:09:10 -0700
Message-Id: <20211026230943.1225890-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c9db14f1d0..24ba6d2830 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -714,6 +714,22 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_brcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[2];
+    int i = do_constant_folding_cond(op->opc, op->args[0], op->args[1], cond);
+
+    if (i == 0) {
+        tcg_op_remove(ctx->tcg, op);
+        return true;
+    }
+    if (i > 0) {
+        op->opc = INDEX_op_br;
+        op->args[0] = op->args[3];
+    }
+    return false;
+}
+
 static bool fold_brcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[4];
@@ -1641,20 +1657,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(brcond):
-            i = do_constant_folding_cond(opc, op->args[0],
-                                         op->args[1], op->args[2]);
-            if (i == 0) {
-                tcg_op_remove(s, op);
-                continue;
-            } else if (i > 0) {
-                memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
-                op->opc = opc = INDEX_op_br;
-                op->args[0] = op->args[3];
-                break;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1737,6 +1739,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(andc):
             done = fold_andc(&ctx, op);
             break;
+        CASE_OP_32_64(brcond):
+            done = fold_brcond(&ctx, op);
+            break;
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
-- 
2.25.1


