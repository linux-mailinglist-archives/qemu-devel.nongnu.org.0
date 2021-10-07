Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84AA425D35
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:26:10 +0200 (CEST)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZxy-0003le-0f
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000Oh-IJ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:26 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU4-0007HO-KI
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:23 -0400
Received: by mail-pj1-x102f.google.com with SMTP id oa4so5016550pjb.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k319WHbf4AosmwtYApMOY/BUNfnO7bTID5c1KU0/PGE=;
 b=TO1ejXMmNc2jJQNgocZq1hKqfHtSxTFZUOYga3QTBV32OwNNbXawdavyWU7Wpj5bJv
 JmgdXFqlVk6aG9ct+trm0n+f0/Mb5bDqvCsSWPYumZUkhoGHhKAdZCb5cA0VfZ8fZm/q
 pz7dMgEKugvTAGope9/Ir9vSuiseTmGxd0sluVELMIxpw8EOOfASP3dJjO4qnc2SmAXa
 vTXm7iMyAHM44o3SlP6mmPwUos/vXzCaw3s3O8q18Cc/gTcxLkPgiOGtEzjzXjgyiPn3
 DmvFPWWiwgOFbM7bVgLcqFo2U3wUHobD54e6t/KtNKVdVuRc4gAU8vG+B0ERd7Hl6tdX
 RO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k319WHbf4AosmwtYApMOY/BUNfnO7bTID5c1KU0/PGE=;
 b=EahSwzRMKa9XM8qOei+tNTSZx0/stS9K/PJyseN8iEJQRqWEUR0E4QocKBylWuyjYP
 4uF0UHlJyjHwuz7rh5fO63HjfXdEhHk4L+jxkUYjEHMMOt/CFlJl1aqp910E1Svf3jPq
 /jHUEhd0bX7YI0JQKa0G896F0qoGrTKMyPQZ7EHNyzQhf22crlWqJ6XQBo/1SgCpuCmu
 kpeCw6sHo2EARV07dE6kzqNK0aDVspOni/LwZCRjkwzeCKISnt1QOnOHD8KyKzsC2VhS
 6Tc+UbwuRb4jj1W26gohAyx4o1Oo7pcHEeehiUPB4YNQCzkV3AEzysM0qr1MuJf1PRqg
 ofPw==
X-Gm-Message-State: AOAM530KDkUBhp4zO8Ae51qCazwcxzuOAdsNAcKcZNhWLlmjjekdkmUb
 NmFjcKbrJBljx34ali0XPOa9EYJw7bDyLQ==
X-Google-Smtp-Source: ABdhPJxTRYKsghGJMKFR8Uk9KKen/UQn4t7qJUywb5+52AihlM0qELybS1TbRDgywywTVTLZD39TJw==
X-Received: by 2002:a17:90b:1b49:: with SMTP id
 nv9mr6857147pjb.134.1633636515387; 
 Thu, 07 Oct 2021 12:55:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/48] tcg/optimize: Split out fold_extract, fold_sextract
Date: Thu,  7 Oct 2021 12:54:32 -0700
Message-Id: <20211007195456.1168070-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 tcg/optimize.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 8229a67192..6020a678ab 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -885,6 +885,18 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = extract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_extract2(OptContext *ctx, TCGOp *op)
 {
     if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
@@ -1113,6 +1125,18 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *op)
     return tcg_opt_gen_movi(ctx, op, op->args[0], i);
 }
 
+static bool fold_sextract(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t;
+
+        t = arg_info(op->args[1])->val;
+        t = sextract64(t, op->args[2], op->args[3]);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1714,24 +1738,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract):
-            if (arg_is_const(op->args[1])) {
-                tmp = extract64(arg_info(op->args[1])->val,
-                                op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        CASE_OP_32_64(sextract):
-            if (arg_is_const(op->args[1])) {
-                tmp = sextract64(arg_info(op->args[1])->val,
-                                 op->args[2], op->args[3]);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1766,6 +1772,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract):
+            done = fold_extract(&ctx, op);
+            break;
         CASE_OP_32_64(extract2):
             done = fold_extract2(&ctx, op);
             break;
@@ -1841,6 +1850,9 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_setcond2_i32:
             done = fold_setcond2(&ctx, op);
             break;
+        CASE_OP_32_64(sextract):
+            done = fold_sextract(&ctx, op);
+            break;
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-- 
2.25.1


