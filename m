Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2B425D98
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:33:10 +0200 (CEST)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYa4j-00062O-NR
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUM-0000So-Gn
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:34 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUE-0007eA-Uj
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:33 -0400
Received: by mail-pl1-x633.google.com with SMTP id w11so4578790plz.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FKjPxxZrMAI7AMd/AZiwwZRBfwrFfQz+fcb0OfyR6bQ=;
 b=K+fqdO8qSREoZx0BVByXW5EzABtBo1+W6lJb5wLsQLWxMCeYkLo7p3kRxtRPyS/z9O
 Mdg6lsUtNmLI422ubq7LAj+49CTHMQsgSyd/uaCKCkvXt8whLv0SU6GMGhtEFBvyiX2o
 hGftv6oYoxS8OmmpMF/2pVxof78OtOVjTzw1t/fE5I1gfZX/L89Za/DAZsUQrLXzovzT
 FXZsMS1Tdd89U17JzWLS1uDcOT7LF483OSb1LPtJEOnfXDSzfPg3/rZBQWICxMi9IuV9
 p1ZyFOV6STmVYl+jBCixrFZMy+pePTvBG6R27swYj9Z7hfrdGss9ro7PgEJe46VD7LCf
 1ebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FKjPxxZrMAI7AMd/AZiwwZRBfwrFfQz+fcb0OfyR6bQ=;
 b=2vEaaQIrvX0WAsBC0zCQT/7TpjUsEKwxy/IfI3R/m869WfYLQ7fU/ZB87IPc52cp6f
 G+y5Q1m4AH4HfxM7MHwd2Spckvg5JZd1pgOus6qRm6Lc7kERMy9AARetXG38zoiAiTpg
 3F88ay6dILtln/Ewzxm96pZgLPJJKr6Cot0C43TTDwg0AxVIjeyeawY1u+f69liV3EJe
 /GbcjcSmaStk8zH15SmrNTcPAMsY3fOampPlUpmJQ990CCP+DYOuogUH4a10DpwDfmGb
 PmJcD4EY95yy/O8yKhVNMgCT+cpg/KKEQcjjGvrUnjZrHyqJWEImMo2nCgbqHzrb3fSD
 90rw==
X-Gm-Message-State: AOAM533jTz5ZkbUY636p9Zi6m1usaObSXp1iSgR/o9OwO6DN3WQE8tBS
 oPa/FJ9D59yL3G1v7ZEJC/phpdI+uqlTXQ==
X-Google-Smtp-Source: ABdhPJwdx7ubwhmkRa05q9AY0QqdFy2As1HRBJbgZAhd9LKtqm+ANjYJXpIafTGkauAJq/GxI5H1Qw==
X-Received: by 2002:a17:902:650c:b0:13d:baac:1da5 with SMTP id
 b12-20020a170902650c00b0013dbaac1da5mr5656819plk.20.1633636525053; 
 Thu, 07 Oct 2021 12:55:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 37/48] tcg/optimize: Split out fold_ix_to_i
Date: Thu,  7 Oct 2021 12:54:45 -0700
Message-Id: <20211007195456.1168070-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Pull the "op r, 0, b => movi r, 0" optimization into a function,
and use it in fold_shift.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index d1d0f3f60c..ba4ad38007 100644
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
@@ -1366,6 +1375,7 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_ix_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -1534,24 +1544,6 @@ void tcg_optimize(TCGContext *s)
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


