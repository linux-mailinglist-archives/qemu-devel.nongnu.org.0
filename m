Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C9436C9C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:23:05 +0200 (CEST)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfWi-0000RM-PD
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGI-0007e9-6E
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:07 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGD-0004NN-7y
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:04 -0400
Received: by mail-pf1-x429.google.com with SMTP id y7so1754137pfg.8
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gM4ez/YweVRpFAkC4ycWLGaSeqJ7LIDPe68C7IH/4aY=;
 b=V/u5HguzbH4yH4WtivmVUW47ns6G4lE4juJ4vuZc61O6atIck5+FgBwA1R2kXfCJxt
 DFErGeShkLT5X9uYpzpjdXtB5B4ddRKDd+sPwVLG4PAE9TFUTNZKji+CLj0J37jbKj6s
 ZNJBJ+yA56HbbAvs7lt37l3GdJsGC4zVslL65j1ClRBKL79Aah0MLW/q1K0K6ugGHi1/
 667HH4kLYn/nUjNnmYXVepZl1zDUP6iK0qk43o5vHUU3d4TkUNQSXoXB11mmtF4OK14O
 78Ks1DgXGUobsKnZaIhOhQkMHjI8Ymo3qQjjcdoSZ8it8fNxJppNDfjsnbeqsl31iSjL
 xg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gM4ez/YweVRpFAkC4ycWLGaSeqJ7LIDPe68C7IH/4aY=;
 b=1sVyy+0A0ojXcZ265oF1QsiafyJr0Dxew48SNLGCysl0cT6vs5vlrk+klDAzeHu7hN
 62QW6+IaW967XrW+5cAeuALMT3pm2URRwT/9RFvA0K/zkZop3opicqqIF4VBWWUO8Jlw
 V1n1KwfR6gfxjWeTTOafEq+IluMftOvdOf6risxxZu55V4+lyyW66LcyrKHqn9i1KMDv
 0ijy2/1C6ZC+lBlYhRgICqgIlnLwx6u1FX/t00a6SXEqgFGvzK4GQqcihLjPw4P6hRJK
 76Rxs20CD99y4eAPkqL5Q6vVv7DywENU0GtOcf81gm4RyPVaV2s0c3EZVRROSz+sER7/
 hlqA==
X-Gm-Message-State: AOAM532jtEKa1W9KjjU8l2vTnIaDz2A7JHLSmwJIFSjgVhqpDeUaMERQ
 pmIsv8tSlMtz4dYPKcssKBc8n9J/sgSovg==
X-Google-Smtp-Source: ABdhPJy9GWVHR40EvufNPq0MJviJfOIYccGyhQ6VlObhcScXk19BYoQ7VwU3U9Z74sTUlB+cw7Ok9g==
X-Received: by 2002:a62:1596:0:b0:44c:f7b3:df74 with SMTP id
 144-20020a621596000000b0044cf7b3df74mr8431615pfv.60.1634850358852; 
 Thu, 21 Oct 2021 14:05:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/48] tcg/optimize: Split out fold_deposit
Date: Thu, 21 Oct 2021 14:05:16 -0700
Message-Id: <20211021210539.825582-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 3fffc5b200..9758d83e3e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -878,6 +878,18 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     return fold_const1(ctx, op);
 }
 
+static bool fold_deposit(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t1 = arg_info(op->args[1])->val;
+        uint64_t t2 = arg_info(op->args[2])->val;
+
+        t1 = deposit64(t1, op->args[3], op->args[4], t2);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t1);
+    }
+    return false;
+}
+
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1726,16 +1738,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(deposit):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tmp = deposit64(arg_info(op->args[1])->val,
-                                op->args[3], op->args[4],
-                                arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1763,6 +1765,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(ctpop):
             done = fold_ctpop(&ctx, op);
             break;
+        CASE_OP_32_64(deposit):
+            done = fold_deposit(&ctx, op);
+            break;
         CASE_OP_32_64(div):
         CASE_OP_32_64(divu):
             done = fold_const2(&ctx, op);
-- 
2.25.1


