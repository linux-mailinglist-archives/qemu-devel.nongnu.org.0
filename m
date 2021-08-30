Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41EE3FB153
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:43:31 +0200 (CEST)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKb10-0002At-TI
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajG-00047G-DB
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:10 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajE-0007Z2-O8
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:10 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 7so11359264pfl.10
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/vdSltFmm9a0bjdpwYOIscnkkdf2FFQGP5qIRQELjPM=;
 b=yy4Xy+VgOYOVilVDTLRF17y+Fp3YsCM7kuvIUAiIUz0/7BbqBXkRpwkL8eQ25PNk/M
 OykSSRT1YOlOq+y/fREYJfZGlK0c0+28M+CBZ0lPEnQT61mrBZK6gj4ZvmbIbdpqm9Jg
 hMRhLPvtaotf5KKKbTpizZgFkO6CC8XGzfV6hH7Xp8zIqrtmURUZNTnKauBHcazdu+w7
 qwOQLG8suwY/Hbo5NdWSfUyV7bsEjsYuvOQYl6AChofShp0ajmsgCE3SsFpB03WDJjmK
 mqTPAE4oMClTeTf16NImi3ItlrsvKZt7zfLPTiEVP8z02czoTO0j0D4QFZCyAfgP7Rw7
 P+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vdSltFmm9a0bjdpwYOIscnkkdf2FFQGP5qIRQELjPM=;
 b=YoXmP33M3sFYHOVcKl25r314d/ncSHrU3dd/k+lNmGCn/QQ12/WZStQr904y42Vdyy
 iDK0vlvZebbbbN/Hky2pShgzK+YbP+SL4w4eurST0RT56mWi8I9E7cz9NjHz1kD7ovvu
 tsUgYus2HoKzwPOESQhdHMvwF+kwh7CIgJRnbaQRkhytkaJBcvA362bypnRZdyRtK+8U
 Ft6kC45W1e3f9fJZPhGOthPV+sCO15SG6iGWWfcrDjeKV/6CjrPWEXV0EHAxX4ir0vHU
 05F/p1aC3nNO9OvXTQ+OmS46k/D1q+K0zVjChNdIjkGBEaf05mtIVJ4wGZrYTKD0TsP7
 +OCw==
X-Gm-Message-State: AOAM531LD3wiip7KuHQAqwQ8mP63U1lHUm4f7sTr9B2QdKMBaUA2ao9H
 624HPI+TTySYBT6jt4QZNWLWatYsaG8yvg==
X-Google-Smtp-Source: ABdhPJwklPxH/zrxEcl35RA8F1v9EezYlKhR1qhnmjgqQbR3Bks/WD4mF61LNn2il4jjxDLwKNnjFA==
X-Received: by 2002:a05:6a00:b89:b0:3f1:af56:8697 with SMTP id
 g9-20020a056a000b8900b003f1af568697mr21604456pfj.58.1630304707304; 
 Sun, 29 Aug 2021 23:25:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/48] tcg/optimize: Split out fold_movcond
Date: Sun, 29 Aug 2021 23:24:25 -0700
Message-Id: <20210830062451.639572-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
index b72fe6e847..d9592a039c 100644
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


