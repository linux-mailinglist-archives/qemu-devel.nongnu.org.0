Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2EA436D18
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:52:05 +0200 (CEST)
Received: from localhost ([::1]:47888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfyk-0002De-GJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJQ-00044F-0D
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:20 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJM-00007w-PW
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:19 -0400
Received: by mail-pl1-x629.google.com with SMTP id y4so1329725plb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GU366PG39bQrvgFIMFuSB4WuW9ukWUVOmma2KCQGLxs=;
 b=ex6wbFjju0ycdbqer6JnDsF7MVWbKuTFK+RuIn4y03Pq5YgYW9YDD72g5uKtrMrNdX
 leO95WblEl6EufJObBTyiGLdt3BE9kb3FUo1dMGjiGAZ2/NXKGC/gYdBaJlUkAWTLS/m
 0fWLkdCECX30TxRcoW5OGOdPKSo3LuiF72UTX3wG39qcmEcMVki7JPEJIa84CzXE8zSN
 Y1vYno7nMxv3ytlbJieJ+RPfyvxg5cHpI6o5fRBYYewIZFkwr5EJ9NkOPp03ztp25zpa
 hfLvQiDZSmdBeyHgaME/LfjPL/nHlFd9trJzJUB5rc3+y6eqrqBtc6VZobpGQ7UUeU1J
 8UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GU366PG39bQrvgFIMFuSB4WuW9ukWUVOmma2KCQGLxs=;
 b=b2k+lCfg0NrpRW9S6DKDCw3ht1bUlUkfXwoGe59PSGKalNbuVnlQZhxdcZYSz5nHTJ
 2+MXp8yLAR2bkh0ysYZ8aRSITGnXY2dJzQuJ+t+fBty3wTkW7Ryf2AgAAt5Ph4wbxeO/
 VCTbcO4sVAYWLS3kVxvZFy73bbYcO5B5zsi97BUXF70RC8YQhpf9vC+HyTPtRrkzZkmM
 f2Wc6fd93484vvfn9WoYfGVeB8egvMGH4ZcotXzx0DWX2FSD1kB/80usrnpz6ZnugBp3
 c+cKoW3S18gqLpncr6Gh6HwExur6965Lk/+/GlzlUgM8nOPgk82V3Hz+tDVZ0Qym5Fmq
 dIUA==
X-Gm-Message-State: AOAM532O2jiaB/WRNjrNAM8O25+jaCRgpmo8+iaTfQZpcTPsoa6+zbTI
 9fVO7JUobfmkIDR+SUI4aCbE1NPjrbCbFQ==
X-Google-Smtp-Source: ABdhPJyR/sRLaplWWjmmOe9MetRjJNrHm2iWoXX9yXrmn6TLOVg30WrUbPkSMNzbVxXExveBCzp8QA==
X-Received: by 2002:a17:902:e848:b0:13e:f908:155a with SMTP id
 t8-20020a170902e84800b0013ef908155amr7469256plg.13.1634850555330; 
 Thu, 21 Oct 2021 14:09:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i5sm6258856pgo.36.2021.10.21.14.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 45/48] tcg/optimize: Propagate sign info for logical
 operations
Date: Thu, 21 Oct 2021 14:05:36 -0700
Message-Id: <20211021210539.825582-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Sign repetitions are perforce all identical, whether they are 1 or 0.
Bitwise operations preserve the relative quantity of the repetitions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index cf3c9d6b12..d08cf7e4eb 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -953,6 +953,13 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
     z2 = arg_info(op->args[2])->z_mask;
     ctx->z_mask = z1 & z2;
 
+    /*
+     * Sign repetitions are perforce all identical, whether they are 1 or 0.
+     * Bitwise operations preserve the relative quantity of the repetitions.
+     */
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
+
     /*
      * Known-zeros does not imply known-ones.  Therefore unless
      * arg2 is constant, we can't infer affected bits from it.
@@ -988,6 +995,8 @@ static bool fold_andc(OptContext *ctx, TCGOp *op)
     }
     ctx->z_mask = z1;
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1277,6 +1286,9 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1464,6 +1476,8 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[3])->z_mask
                 | arg_info(op->args[4])->z_mask;
+    ctx->s_mask = arg_info(op->args[3])->s_mask
+                & arg_info(op->args[4])->s_mask;
 
     if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
         uint64_t tv = arg_info(op->args[3])->val;
@@ -1552,6 +1566,9 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, -1)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1581,6 +1598,9 @@ static bool fold_nor(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1590,6 +1610,8 @@ static bool fold_not(OptContext *ctx, TCGOp *op)
         return true;
     }
 
+    ctx->s_mask = arg_info(op->args[1])->s_mask;
+
     /* Because of fold_to_not, we want to always return true, via finish. */
     finish_folding(ctx, op);
     return true;
@@ -1605,6 +1627,8 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
@@ -1616,6 +1640,9 @@ static bool fold_orc(OptContext *ctx, TCGOp *op)
         fold_xi_to_not(ctx, op, 0)) {
         return true;
     }
+
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return false;
 }
 
@@ -1880,6 +1907,8 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
 
     ctx->z_mask = arg_info(op->args[1])->z_mask
                 | arg_info(op->args[2])->z_mask;
+    ctx->s_mask = arg_info(op->args[1])->s_mask
+                & arg_info(op->args[2])->s_mask;
     return fold_masks(ctx, op);
 }
 
-- 
2.25.1


