Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A961943BDB7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:18:35 +0200 (CEST)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfViE-0000Ug-PY
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa3-00030E-Vi
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:08 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZz-0001yT-DH
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:07 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so688764pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEAmAjtRAA8VTRQA9Y1dByLl7XumxO8Ow9/VzdNZDew=;
 b=UObz/MYgYViruDx4QjWLTHmfokG55Zu93zCVAU+71KM+ItHm+oHi3J8aozQAI/FXSL
 ARjhh+Z1KCWrObCEImWFK0ro6If5xT1wOKvC29bb6xseIoOjItaQl7ygP0GCnYWErVmo
 WWblmFhLSUEAdE/E7WpHX9ok/9fYVIZM/YJIdYnTaWUivYbADyUaE0vxBYA+4Wg/zUHS
 CWUHgosIY1dHx8Vv6L+4b2uEBx4vl0qpxCt1Fn0s1ReAqlxuS5+Whwm/bvisXcMmfk+0
 w0LbYClFgJyUwnpzwzwaAaiqsaP+TR9kMA6V1kQcrn6/7AHFrxFTcX8N9XtQMI4ckl36
 qiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEAmAjtRAA8VTRQA9Y1dByLl7XumxO8Ow9/VzdNZDew=;
 b=N1Tg+oBj/24zTcPYH2usHzmxCZMDYG373BIO0jDzUdgHHY/xjIoa7Me6/7SR7Vgv7o
 BSFNkaMfdkqFRTT4mqCm5ODlreKT5Lwc9joTUISiKPKSYRCTqXtxTX6GFxcH6VSNr6Nd
 lWPWN/111YiwgtzmTtTnjmcCDkL4CG9kMVeubmMcuSGXgFRF6rc6WWbACKjwcqPjAfZp
 QQZPCILN3fzC4OcPYAr8u+ST4cotBydBWvgO8ALPanZmupO8kyxPzC7eRkL+O8p7T3pS
 ZL/1rQ3hkVGQADemFajjIFSHI/DyZZeq+b5It0APSoul6KDoOcDUMS2CWW0q6dbEsBpJ
 BJBQ==
X-Gm-Message-State: AOAM532TOavsO9TAl6Wceak+CaecYFravQV9uh9JOSdzTOfXu6MvHCzN
 Jqm8GqV8u8N7a2D2G8G9IgzffBoUltY+nQ==
X-Google-Smtp-Source: ABdhPJwAO4apW8vmmW05Xb4uRe+G5XSJnihOeUk8YnAJnjH0+95YSetuTWJa1I3Q5wO7Z2+iDpiPrA==
X-Received: by 2002:a17:90a:fe8a:: with SMTP id
 co10mr1868151pjb.183.1635289801911; 
 Tue, 26 Oct 2021 16:10:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/51] tcg/optimize: Split out fold_setcond
Date: Tue, 26 Oct 2021 16:09:11 -0700
Message-Id: <20211026230943.1225890-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 24ba6d2830..f79cb44944 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -948,6 +948,17 @@ static bool fold_remainder(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_setcond(OptContext *ctx, TCGOp *op)
+{
+    TCGCond cond = op->args[3];
+    int i = do_constant_folding_cond(op->opc, op->args[1], op->args[2], cond);
+
+    if (i >= 0) {
+        return tcg_opt_gen_movi(ctx, op, op->args[0], i);
+    }
+    return false;
+}
+
 static bool fold_setcond2(OptContext *ctx, TCGOp *op)
 {
     TCGCond cond = op->args[5];
@@ -1648,15 +1659,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(setcond):
-            i = do_constant_folding_cond(opc, op->args[1],
-                                         op->args[2], op->args[3]);
-            if (i >= 0) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0], i);
-                continue;
-            }
-            break;
-
         CASE_OP_32_64(movcond):
             i = do_constant_folding_cond(opc, op->args[1],
                                          op->args[2], op->args[5]);
@@ -1817,6 +1819,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(shr):
             done = fold_shift(&ctx, op);
             break;
+        CASE_OP_32_64(setcond):
+            done = fold_setcond(&ctx, op);
+            break;
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
-- 
2.25.1


