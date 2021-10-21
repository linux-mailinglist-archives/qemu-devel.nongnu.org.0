Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB3436C92
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:19:55 +0200 (CEST)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfTf-00031b-20
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGB-0007Rl-ME
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG8-0004JI-DS
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so4104723pji.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=om0J3xSMPMe885vWCuxDNsOizQIwIVZQbET6qRz7AvU=;
 b=Myv+55zNB0PtM5K8OLd2MHj+KjBb+r5N/sm7Yjur+3NlxZW/rEjgnLpIRPtu/I5a6u
 80CFeaaMsT27rcJgdeElbAvkF+16LT5tLLvm5XT+b1/h3dPoA8n4dSM5Lyfh1500ewUH
 G0OJz4k7MhKJU71/zWmxymQ2/eY7/iFVqzC3J3PmzefJgxLeOgPKTU/q71iVEgMyppHM
 oa1xpRVRnug210sqE4ouKbwbNx7QhRRsGQqR05Uc934lYTBd+Xgfsuk2Bv4FtdoARSSR
 565cWeDsJYvTvVm3dblPrEuTIs/o30WsbLdGVTDA6MdFPEvuJWbV8HXnvQQIjW05Fm/T
 pnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=om0J3xSMPMe885vWCuxDNsOizQIwIVZQbET6qRz7AvU=;
 b=aSaDVvYz7EFWzK710/C2yXtbIPBiCAuizycPKmcaCiMS1Vm+ffeUefdP5/fnh809uV
 gDVbBBSQ6125bNR+S2ibKd2IJl8CiqGo8LUQ2As+CT+8FzQSmDBZq08Td5OsIJzfCMQR
 uX4X980ca8Ayzk76QjBBtnn9Ob/vUWAtiYLNL94vfGZHuoIlIBt1E7zWgLABXWPfY2pJ
 yTNQVozl0toBnAtg3us9SHR8vKzKgBHbe07ipx37PVuRVcUVltYSWwuamL2P/L7109Qv
 XUJZyYumFfIz4byEeczNpEZjAduR6Pdh9/KMpra3Q3ZBA4tWj6323tdwC7QOSwUgz4jP
 JHPA==
X-Gm-Message-State: AOAM530dVwiXBuFVXYOfEZ4qLyzpo6jM4WUNjxp6JlbKgV1RTxQOzipU
 QAoZnQ4dS/CzgeQ94qshdw1e4Vs6Q8LEMA==
X-Google-Smtp-Source: ABdhPJx2IxTUWIWFidO2Re7dUpixlkqz6cK1+7Fl74urftCANze0MA0yAAdbddv+CPqW2CW+xvocdg==
X-Received: by 2002:a17:902:b188:b029:11b:1549:da31 with SMTP id
 s8-20020a170902b188b029011b1549da31mr7307793plr.7.1634850353609; 
 Thu, 21 Oct 2021 14:05:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/48] tcg/optimize: Split out fold_brcond
Date: Thu, 21 Oct 2021 14:05:09 -0700
Message-Id: <20211021210539.825582-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 tcg/optimize.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 61a6221ad2..9059e917cf 100644
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
@@ -1626,20 +1642,6 @@ void tcg_optimize(TCGContext *s)
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
@@ -1722,6 +1724,9 @@ void tcg_optimize(TCGContext *s)
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


