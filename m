Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503523FB189
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:02:33 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbJL-0001tH-CS
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajP-0004Rz-CC
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:19 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajN-0007i3-TC
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:19 -0400
Received: by mail-pj1-x1033.google.com with SMTP id d5so2966108pjx.2
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RiX0h+LZeFsC/CB7zg0i2+qNE9Z0TV/acHiKkwOyOgI=;
 b=mdJs2dKLGgL2rINaF/vCJUuXn6NWKgVM1AvHIxOUCiPs0setjBvidm0Mr2lStQD1XV
 VA6AXHS7K5NNTv9lfHGD+en/cYarx9cPojH7HqmThpJui215rpYUc1fsAkkTDSwzYSqU
 5qvR0Jhz1QvGGlcTo5cAva+01FUOlWPAQJBD4rImMRDzydcXV+1Bobemh0MEBO+AP6sS
 kq3RhHAsKJjb6EjvdGTbshYcsF9vj9HlgrSECHkNsqeSaerrvD49w0cpFBDZ4xdNPDzt
 23icTQ8FD0pxSTOBVs4q01M9+aQo1O5m2vpJcvz1HG6ublKFTOu4sOGZfxoLlS44pCaV
 jJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiX0h+LZeFsC/CB7zg0i2+qNE9Z0TV/acHiKkwOyOgI=;
 b=gtipbnxPmxNkb1yHpAp5zs9MrygapXO9qBf1mZe/fajNhTFuoeu2zhKc0p488ItkqY
 E4dGLwgiaxzf4xwDzIUV2PxeP897C0SA09zd8DLOve+ygdqRL2sF20o/04MxtnEw0qAS
 Agbzo+mOCEzJkx5g5Ctr2x5lmfdef8HAK4pV/UcaJ/EJPgN2X7D6rpumiZYN0Dl9c3aT
 8ElQfcSIx1oqSNOtIS/P8LVhe9FX//S5J5B4EsZaJaoXvNVDab1XkIbyviY1/Tz/H045
 72QC73BEfgB8iO1GQ839r0ImcPD6/DOwPEb1WfTn29hm6KmFvfyFSv4TwAy//khLFcpV
 uc0Q==
X-Gm-Message-State: AOAM531Jr13h1Af0vi/y55GMQKbj5oIEt0MLXzE0wWlHoCIz/hlhI5PP
 seoE8KHXmRUQmBRVoPg++p1bUcQtHWj3IQ==
X-Google-Smtp-Source: ABdhPJzIqfRliZ00u5aOD0lvrayF/3UV2LgSDx6MiH4DdIPYfEqadYMDmWCD/zxCcGWpakl5rRku0A==
X-Received: by 2002:a17:90a:7f85:: with SMTP id
 m5mr36007998pjl.185.1630304715504; 
 Sun, 29 Aug 2021 23:25:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/48] tcg/optimize: Split out fold_sub_to_neg
Date: Sun, 29 Aug 2021 23:24:38 -0700
Message-Id: <20210830062451.639572-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Even though there is only one user, place this more complex
conversion into its own helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 84 ++++++++++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 37 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index aba65fdbd3..23594e1a03 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1183,7 +1183,15 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
 
 static bool fold_neg(OptContext *ctx, TCGOp *op)
 {
-    return fold_const1(ctx, op);
+    if (fold_const1(ctx, op)) {
+        return true;
+    }
+    /*
+     * Because of fold_sub_to_neg, we want to always return true,
+     * via finish_folding.
+     */
+    finish_folding(ctx, op);
+    return true;
 }
 
 static bool fold_nor(OptContext *ctx, TCGOp *op)
@@ -1335,10 +1343,47 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_sub_to_neg(OptContext *ctx, TCGOp *op)
+{
+    TCGOpcode neg_op;
+    bool have_neg;
+
+    if (!arg_is_const(op->args[1]) || arg_info(op->args[1])->val != 0) {
+        return false;
+    }
+
+    switch (ctx->type) {
+    case TCG_TYPE_I32:
+        neg_op = INDEX_op_neg_i32;
+        have_neg = TCG_TARGET_HAS_neg_i32;
+        break;
+    case TCG_TYPE_I64:
+        neg_op = INDEX_op_neg_i64;
+        have_neg = TCG_TARGET_HAS_neg_i64;
+        break;
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+    case TCG_TYPE_V256:
+        neg_op = INDEX_op_neg_vec;
+        have_neg = (TCG_TARGET_HAS_neg_vec &&
+                    tcg_can_emit_vec_op(neg_op, ctx->type, TCGOP_VECE(op)) > 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (have_neg) {
+        op->opc = neg_op;
+        op->args[1] = op->args[2];
+        return fold_neg(ctx, op);
+    }
+    return false;
+}
+
 static bool fold_sub(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xx_to_i(ctx, op, 0)) {
+        fold_xx_to_i(ctx, op, 0) ||
+        fold_sub_to_neg(ctx, op)) {
         return true;
     }
     return false;
@@ -1472,41 +1517,6 @@ void tcg_optimize(TCGContext *s)
                 continue;
             }
             break;
-        CASE_OP_32_64_VEC(sub):
-            {
-                TCGOpcode neg_op;
-                bool have_neg;
-
-                if (arg_is_const(op->args[2])) {
-                    /* Proceed with possible constant folding. */
-                    break;
-                }
-                switch (ctx.type) {
-                case TCG_TYPE_I32:
-                    neg_op = INDEX_op_neg_i32;
-                    have_neg = TCG_TARGET_HAS_neg_i32;
-                    break;
-                case TCG_TYPE_I64:
-                    neg_op = INDEX_op_neg_i64;
-                    have_neg = TCG_TARGET_HAS_neg_i64;
-                    break;
-                default:
-                    neg_op = INDEX_op_neg_vec;
-                    have_neg = tcg_can_emit_vec_op(neg_op, ctx.type, TCGOP_VECE(op)) > 0;
-                    break;
-                }
-                if (!have_neg) {
-                    break;
-                }
-                if (arg_is_const(op->args[1])
-                    && arg_info(op->args[1])->val == 0) {
-                    op->opc = neg_op;
-                    reset_temp(op->args[0]);
-                    op->args[1] = op->args[2];
-                    continue;
-                }
-            }
-            break;
         default:
             break;
         }
-- 
2.25.1


