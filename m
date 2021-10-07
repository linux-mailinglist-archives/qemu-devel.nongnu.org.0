Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1571425D2B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:23:37 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZvU-0007M3-Ly
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000OX-Hn
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:26 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU3-0007Fm-4e
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id a73so876624pge.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EHVDwnG6dREWQKRf227cIpmq7UBRaNolNQfJjNu7bOI=;
 b=BpTeB0hUFx4G2LJ214aOxbui16oSY+LyBm0f/FKsSdjBg2qK43pNpOwmTYdBz6FtKj
 WOwLvgfQXavXCNzaBZluhHEVIdzmPvSWJLNU+XvyG0ldZBVzAnNa5wAED+V/RKv6ehqm
 aHJD+0sEEH6y0qb9aHfXHxogQVRNZemViRFLLZqliYspPHktqE0Mm/MRHOOPPNZUKI1a
 GRRsiQU89OMW0ENehSEZwNx/OW0CWSfm3FraO+mXpvcJzWUJDVvZvnanCKJ3Y2Dunl2g
 G5fwT2txZy2T5Jf0Q8uCimBizX2XzA54dWdI1oaVYSRtbWixAFB8icHflHJIpajb3XpW
 vlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EHVDwnG6dREWQKRf227cIpmq7UBRaNolNQfJjNu7bOI=;
 b=PowYUrDIOpgFpPiU3zQ7kcNDjxqysup2+Dcvbjd7qg/EDJmzvzstjslAuU0btSS1gU
 Jc9rXYUBLvR085xIZOPzHA7AXDIzsnEPe44joQ7N5vtFLsbmg6rjIo23KPPX/Ye7lLIR
 FXF8fStLWam475KQ+Q1GdrW02fhaeVJP8vrnoMuO9Gnos9irMJhPAtW5QdpqdhRkV8Mp
 uffJPlvn1R7LidQwX88vgM/bSdrim6nSkx5nygDihvtjHPGhfhH3N44HBPKplNuV9Adx
 cL/GF7S8jmKKGeX0DHnMU3Ub1N4sDJFOVXpPqnO8Jhpq9h6HaW9KWP4Hk9m2OZXUV11V
 SFxA==
X-Gm-Message-State: AOAM5321eCs1LS3BCY+O+S20BjTfJP4ZrelStpJQlH3bT/gjyuxHlva+
 odep5VOQbPTp7CwEtNT6uPmy6YAnAKvwFg==
X-Google-Smtp-Source: ABdhPJxb+82XJE5MctQprUoME9NPmXzMUnNY4qG+WcsTmcw3p3JKBb2YCt7xda6XkCHppP/UsAW1UQ==
X-Received: by 2002:a62:77d8:0:b0:44c:8618:1bed with SMTP id
 s207-20020a6277d8000000b0044c86181bedmr6278991pfc.27.1633636513879; 
 Thu, 07 Oct 2021 12:55:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/48] tcg/optimize: Split out fold_movcond
Date: Thu,  7 Oct 2021 12:54:30 -0700
Message-Id: <20211007195456.1168070-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 56 ++++++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 1cec06aa81..c8aa027a5a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -919,6 +919,34 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_movcond(OptContext *ctx, TCGOp *op)
+{
+    TCGOpcode opc = op->opc;
+    TCGCond cond = op->args[5];
+    int i = do_constant_folding_cond(opc, op->args[1], op->args[2], cond);
+
+    if (i >= 0) {
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
+    }
+
+    if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
+        uint64_t tv = arg_info(op->args[3])->val;
+        uint64_t fv = arg_info(op->args[4])->val;
+
+        opc = (opc == INDEX_op_movcond_i32
+               ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64);
+
+        if (tv == 1 && fv == 0) {
+            op->opc = opc;
+            op->args[3] = cond;
+        } else if (fv == 1 && tv == 0) {
+            op->opc = opc;
+            op->args[3] = tcg_invert_cond(cond);
+        }
+    }
+    return false;
+}
+
 static bool fold_multiply(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1702,31 +1730,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(movcond):
-            i = do_constant_folding_cond(opc, op->args[1],
-                                         op->args[2], op->args[5]);
-            if (i >= 0) {
-                tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[4 - i]);
-                continue;
-            }
-            if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
-                uint64_t tv = arg_info(op->args[3])->val;
-                uint64_t fv = arg_info(op->args[4])->val;
-                TCGCond cond = op->args[5];
-
-                if (fv == 1 && tv == 0) {
-                    cond = tcg_invert_cond(cond);
-                } else if (!(tv == 1 && fv == 0)) {
-                    break;
-                }
-                op->args[3] = cond;
-                op->opc = opc = (opc == INDEX_op_movcond_i32
-                                 ? INDEX_op_setcond_i32
-                                 : INDEX_op_setcond_i64);
-            }
-            break;
-
-
         default:
             break;
 
@@ -1778,6 +1781,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_mb:
             done = fold_mb(&ctx, op);
             break;
+        CASE_OP_32_64(movcond):
+            done = fold_movcond(&ctx, op);
+            break;
         CASE_OP_32_64(mul):
         CASE_OP_32_64(mulsh):
         CASE_OP_32_64(muluh):
-- 
2.25.1


