Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B44436C93
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:19:57 +0200 (CEST)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfTg-00034t-I4
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGE-0007YD-DX
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:02 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG9-0004JX-E3
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m14so1745159pfc.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oO+3JjESjP15t2fk2EDQgBB6bUdwG1Yt7W+t+rnnIlU=;
 b=NuTGg6/znWoSQa5QPJw/20kNHuUgbH2FP3CauzK2J/rNmKyOIV7VczbcaUeCU15aXv
 hOtv8pctXdhRRj1cIsljWasOMQ2uKQZZM9neRdhD19i/r9qYlrnWNTu+TCn6CLXyZkei
 ozayouaA+QwCw0luwEp7q5QZzCOxr9VFy9hZes1F7H5ZHkECoCluUCkODjWf2snoNA/V
 5FnxIPHxOqsyV9keUqL/KGpCjbUhiAFCk6tum4mxxhTc/ZsgJq+3qmRpoxTfqf2zTOpz
 ac+JDa9XVtCwJv+eSg3jCSlPnFWcFhyCKHx0mCEcNLgfimRN6thEVLsgeIvjzELETUEo
 fQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oO+3JjESjP15t2fk2EDQgBB6bUdwG1Yt7W+t+rnnIlU=;
 b=PhfmQKi2qB7JE4O1d2KmsBM9Y7Muc8xIPaz4wuKtsRapm4rUgZSLRXZePyLz71Gqhw
 FW9lLEufqQzxdvDXXzMubhOZPN1wjmfqlEHjSXTpm/KSXqaM8KNFDrjd5fMHXYPx5HI8
 mUc6ggnGPYuyPgKrutnCcw4BoaHAPE03aoF0g6ij4+4yndYG2eLXiB7v7ej8vf5ugAhe
 7BZKLjoahFUnVsLrGlPVtaKjQi73g7ZTerhD4C4YxymE8RKQjFBjxZddpzMCtx4i15wA
 Ns1/Z+KrSX9cSgu0SINVzPtpyCXQGVrVGcpNhgih6Ltu8MLZJq+Z2rDYf7et/kOw1uuV
 +6Uw==
X-Gm-Message-State: AOAM533ImGDabfpAMHG+gxFKTnsC5GJWNZHnAg2iq6sMEd+XPop7gMq9
 AcQMTgRZoaI2QlC/zjNxt9P51w9nF7ui6Q==
X-Google-Smtp-Source: ABdhPJyjx9TqjXYgQXhAV6xjwWOAqsUPOQQlOaENLJLH4QvHvE+rQO68PjUdMyOySLPeTjOfI9bn0g==
X-Received: by 2002:aa7:9258:0:b0:44d:4f03:6a7a with SMTP id
 24-20020aa79258000000b0044d4f036a7amr7866184pfp.33.1634850354550; 
 Thu, 21 Oct 2021 14:05:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/48] tcg/optimize: Split out fold_setcond
Date: Thu, 21 Oct 2021 14:05:10 -0700
Message-Id: <20211021210539.825582-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9059e917cf..2086e894c6 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -933,6 +933,17 @@ static bool fold_qemu_st(OptContext *ctx, TCGOp *op)
     return false;
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
@@ -1633,15 +1644,6 @@ void tcg_optimize(TCGContext *s)
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
@@ -1800,6 +1802,9 @@ void tcg_optimize(TCGContext *s)
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


