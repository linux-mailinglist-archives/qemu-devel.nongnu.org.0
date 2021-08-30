Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAEE3FB17D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:59:11 +0200 (CEST)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbGA-0005W7-JG
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajK-0004IS-2M
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:14 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajI-0007cl-B8
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d3-20020a17090ae28300b0019629c96f25so6355381pjz.2
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HRy9ECrCXomzAwAjSMZ0wo8n5E+QDPpcqNFOCgo836E=;
 b=PGJF6B0jcZcAPRkfFOmo7+QdT+XjTILJ++/V4IV2r9TyWDM8/oYWhVyU2l7yEn7Frd
 oRlPtOFmnsofsqV/KFFO/mO39EiH07ipppNwKJpXcGwcgHMjLyL/xw2RZvh/AUS5cbBt
 qRzb5/0t+N6FPyK6b+wlDEzi3k3CJpvpsZ1pqv8sXqYpReJnwdnebq5yvDDDGmsZtdBH
 b/yyHo8DrNt9X7uVZ3Dc6QcZAiwhIZyHjNQC3qP8phQXHuRFlBuisEpMgh9Gx8tw3gdW
 PtZojN8oijbhGQzKLOxDU63GzyOteRgmEwlKwOt2CX0nf8kKzjrVyE7owL109DUQbbQh
 2VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HRy9ECrCXomzAwAjSMZ0wo8n5E+QDPpcqNFOCgo836E=;
 b=VwtjWZRTiKgyLixtx2vZFpRQ6I0Xdg9xV6zus4+s/wSzJw2UvToO3/o5cgnTWab4/8
 XZd7GRabTG6sQhz7yqDm4xBVbZiO6AUs/8uSAHtGeszgqSsotknXoiZNQcP06YZiR+XI
 6gGHlmbS0AYUJKeoVizoSOiylw7rLE/jFM6eGtz495gN9UjExP/BbpIJEPNZ4if4BY1T
 b544g2+MLFhTIqBBrUdOpXfsv9sDSG2ReQJVk8GW7+yHx3gV5gMG+pAE7wxtDkps3Vvj
 sK+5PFe8pWNweVptwNt7yxpM8hiSRDtSl4Q3iNV+aFBJsEkEyjuLCd1N6oPR0oeYWtvX
 QzEg==
X-Gm-Message-State: AOAM5337o9XzdmSZXMRmZiVME8doRwF88xTo5ndCYsN1V1ob6MR6lJOF
 PCThKXUOtdAYXvfbDRaRIkb0EFBXVllTgg==
X-Google-Smtp-Source: ABdhPJwdIX6eyZl0eR7bQh/yhXxNivd1e+zseRq2ALkWLsUuH12f+ovZQyyvQjFs9MQ4n6uDY/Kadg==
X-Received: by 2002:a17:90a:c293:: with SMTP id
 f19mr4474970pjt.106.1630304710970; 
 Sun, 29 Aug 2021 23:25:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/48] tcg/optimize: Split out fold_dup, fold_dup2
Date: Sun, 29 Aug 2021 23:24:31 -0700
Message-Id: <20210830062451.639572-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
index 1366bbaa17..1361bffab9 100644
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


