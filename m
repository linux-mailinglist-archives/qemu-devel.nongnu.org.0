Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A4F425CE9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:07:06 +0200 (CEST)
Received: from localhost ([::1]:52508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZfV-0003dO-DL
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUD-0000Or-No
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:27 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU8-0007JL-B7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:25 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so6026919pji.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=E4ObmGNykxKaQa5VfLS5cuL/CVeOQKjN8HAN9xs9Ea0=;
 b=GXn5EXbMLHFAWPIBOiq44NfJZZF6/BaFm6NCEwb6LJ9meFEvZy/nDLmAs8Udsd8hn4
 Hj/6TxyRvWYxVcdZ82EwGc7Z5HQEIvVJcr8L1kuv5t74uBGYyQFenXflAh3sK5zWmDHT
 zNEShsRa8chAViN2wqvsq0lCar09OgifDKE+z6I124OlGaG/ZvR6yc4a2RbBromQT36m
 yCVUpMvDZZLUPMRYsvNZdaJls92P+Qk5pCMPjTd0r1aGD/9b+3jGFKySmoaaGyhfi+FH
 23p94/OWZukyH4o+pEG2kmUKB6nKFhrAeKbwMgotYFj3W7K+I7DZkSGWmXO2xUGXoCJL
 1kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E4ObmGNykxKaQa5VfLS5cuL/CVeOQKjN8HAN9xs9Ea0=;
 b=me0mFZrqpiT05+iqbDuiElxdxkrGttd+eUgyTzomqOGzwGAhwe3CtU4aGB/cWfRdlD
 mW6/2l1XjZvZLchSwkJaoGpHjpzpq7ulxpKvC0epmgUc/PJNnpW+iXjLJfodEXoBT84V
 Y2Z7sON0gusykVSmkq58l3YEoqL+cjPF8H/uyq9r/PBNhS+peFrmAfbOamKrP/xG/3KT
 F79hDjEKKqo79RdCuZZT8cP23U2Sdh0EFP7l8RWuUCGgr/m2IFqfFKbGZeHvQrsLM4UU
 ln6Ks5zcH39YpaKgUsgsYan4skcE6ubK9OoCHR0zts9UsS0FbjDfNc70FwS+B5A5YYN9
 u2Vw==
X-Gm-Message-State: AOAM533irNrPGSwOgjTauga36X3X/vWApYkgS3GiydsN8PlQ5BVeCMNu
 Gk78CvEN6Ak4JrfkenypAmNNckMxTITpqw==
X-Google-Smtp-Source: ABdhPJxmy0MC+YUw1YV19GJWUlUIoTh95aSZt+eW3PCO3qMARrsbVVgLwfXgovaH8QSWZleW9PcgbQ==
X-Received: by 2002:a17:90a:ead3:: with SMTP id
 ev19mr7521695pjb.136.1633636517896; 
 Thu, 07 Oct 2021 12:55:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/48] tcg/optimize: Split out fold_dup, fold_dup2
Date: Thu,  7 Oct 2021 12:54:36 -0700
Message-Id: <20211007195456.1168070-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
 tcg/optimize.c | 53 +++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 7a7c3e25c5..db50cf6499 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -917,6 +917,31 @@ static bool fold_deposit(OptContext *ctx, TCGOp *op)
     return false;
 }
 
+static bool fold_dup(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+        t = dup_const(TCGOP_VECE(op), t);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+    return false;
+}
+
+static bool fold_dup2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t = deposit64(arg_info(op->args[1])->val, 32, 32,
+                               arg_info(op->args[2])->val);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+    }
+
+    if (args_are_copies(op->args[1], op->args[2])) {
+        op->opc = INDEX_op_dup_vec;
+        TCGOP_VECE(op) = MO_32;
+    }
+    return false;
+}
+
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1718,28 +1743,6 @@ void tcg_optimize(TCGContext *s)
             done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
             break;
 
-        case INDEX_op_dup_vec:
-            if (arg_is_const(op->args[1])) {
-                tmp = arg_info(op->args[1])->val;
-                tmp = dup_const(TCGOP_VECE(op), tmp);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
-        case INDEX_op_dup2_vec:
-            assert(TCG_TARGET_REG_BITS == 32);
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tcg_opt_gen_movi(&ctx, op, op->args[0],
-                                 deposit64(arg_info(op->args[1])->val, 32, 32,
-                                           arg_info(op->args[2])->val));
-                continue;
-            } else if (args_are_copies(op->args[1], op->args[2])) {
-                op->opc = INDEX_op_dup_vec;
-                TCGOP_VECE(op) = MO_32;
-            }
-            break;
-
         default:
             break;
 
@@ -1783,6 +1786,12 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(divu):
             done = fold_const2(&ctx, op);
             break;
+        case INDEX_op_dup_vec:
+            done = fold_dup(&ctx, op);
+            break;
+        case INDEX_op_dup2_vec:
+            done = fold_dup2(&ctx, op);
+            break;
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
-- 
2.25.1


