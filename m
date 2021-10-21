Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80267436CB7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:31:58 +0200 (CEST)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdffJ-00018G-Jt
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGC-0007Sn-6O
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGA-0004Kr-1E
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:59 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o4-20020a17090a3d4400b001a1c8344c3fso2008064pjf.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPnzpLDdmnkBH9ndqiQcvmk5JgDTuG8za90PycoBVSg=;
 b=SvruDtDU6tYssCV6avNuT+mTIV/MFp8bu7qGpb17Q+CujVsy486HpoaD/HywOXr+um
 VCek6y2XRp7YLRuE7xQ4xRCVHZsNrm83IlzuwIT8oarNqF/WcDW02SKQk2yd01CvOBHV
 9GaSnrdVhdr6IHjeBGbCmxpAovF/wLNpQyEOiYtwm5MLVtWseUgpWOKppqGLELLfEM4s
 YYMerpv00wQixHVy7n3mEqmPx1arM5025ef9Xtf3FEf3wDChd32+ECGQEkrsKwFJl9GA
 WcGKDQ9RXeTb7FLHEftMAca9TcJeLTK8R5kMik8bZTRvpAjxFAo/phuZfAGtBCtQJyyP
 JI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPnzpLDdmnkBH9ndqiQcvmk5JgDTuG8za90PycoBVSg=;
 b=phy15L9oo4rp7V++u0tNl1p5bBk1d3XrKSdWCxyHQYVK8XpcP4ljpVYB/SR7RbcnJA
 +DIHR+LMgotLBEtGyFPnFHSBgN1Uu8DID1EBXGBYsVhZ2QEp4jG/RPe1XvIcRzfZrGTU
 MgUgM3XjyH5W1loIto/eG4U/iozvSEhEXB6ZuknDnzDk8AI4x4XLyYcLrlSIhSqCX5dO
 6q83aMhI31pcgab5uJCNxX0WyPd2hIGRZHRGwgzGm0hsngRUgrvO1I3qccf87JTEhV5n
 fiQ2qYWecEKxnn83c08AhtSzbV+lCvvaikgph+M63gMKOO8FMb0rZOadAWWxQgI8oV84
 p3jg==
X-Gm-Message-State: AOAM5313SpPgxP/4Me+NNS4GD3flqJfd5gc4uzAhrxyWSHv+XlPLfkoh
 rpEL14yRSlB/hA45l/o32uKgQ6Cb9Lf5AA==
X-Google-Smtp-Source: ABdhPJy1i9rm4y0YEJ61bU2uRyUSD3PVXx9EcTLAElsx2yeVj8OPrtUGfCFhBk6VHW1sF7roHo57Yw==
X-Received: by 2002:a17:90b:1c90:: with SMTP id
 oo16mr9344891pjb.199.1634850356751; 
 Thu, 21 Oct 2021 14:05:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/48] tcg/optimize: Split out fold_movcond
Date: Thu, 21 Oct 2021 14:05:13 -0700
Message-Id: <20211021210539.825582-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 56 ++++++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index eb6f1581ac..ed5a304089 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -917,6 +917,34 @@ static bool fold_mb(OptContext *ctx, TCGOp *op)
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
@@ -1700,31 +1728,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1776,6 +1779,9 @@ void tcg_optimize(TCGContext *s)
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


