Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3D43BDF1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:34:03 +0200 (CEST)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVxC-00041t-RB
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVaE-0003Jw-J8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVa7-00020d-7V
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:10:18 -0400
Received: by mail-pg1-x529.google.com with SMTP id t7so1009060pgl.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwDfuaHLd2phF2WKQRX+NWoB84U/ilhRWeGAC07+3IE=;
 b=Xu1l7AtWff5GUEkgHyFlyssm6dY2W7TaM8u76lMCxki0AgvVeNyFahloWBnF9S2tcG
 hUuK/rx8Kq0EElY5ZarEMqPMv3k4kycu3g7ZxN/qWZcOwiRKpVFmaVOPbxG1J948cHps
 VRYoafD5MAcFOL9gxGnUh5Zoz0NB7JsDs9eQtpRzAMhXbmIWANgA0MBxK/woOcnpx2nM
 QZKhj8WUQC80XcZawSamq7f1egrQg7f6DRI5ILAlbOBgL3RYRvctvrt4DuX7dezSSZcN
 oFh1ync/J7zKTXS9oiusNI9MXP4abUKREwJoGn8S3hLi3woUFCte0eek58S8/wK3I+CO
 BDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwDfuaHLd2phF2WKQRX+NWoB84U/ilhRWeGAC07+3IE=;
 b=dA42vqG39zKB8OLBM0nTODZE8b/wHxnlqA0Zzk4FV6Crr/Key1DjOpxGzK0GNbd5Yj
 GQK7ijzspOUy5LloANNoP7va5mme+RU6BedgirXIo9pVwdDRMFijoWbgaEq/6kX9Z28p
 hYpeT5OwtCwI+45BYpTR1aw15SEJhOevfkCoSrnyXQ9zyLQPKyEi3T5qOhkVHYB4U8CX
 9tq3rwGA+xMQGV0x4HZNWZIQ4kMeBzYvtx51i1nfLaalRjeuK391AkxyzM5LUojGatL7
 ylM7fmtzhNpPIWSnBpWcHOYBQzaDPyyV1Wi2rUFOu3kwPMzTOGCA+GBWTfWWptUT5rqN
 zSMw==
X-Gm-Message-State: AOAM532ryWySse+P0yMrqZEwIkg6d2cZ0zqvIDKLtklyPEVMK5BZNAP9
 uWYvj/YB5KlPd4jTtdW/CSLmDNDd8fVSsA==
X-Google-Smtp-Source: ABdhPJy8Jv+EoKnzSAWW1J3qhSYlgAMOG8UXGYmb67tQ5l+/HhEyAD9i89jUsy5Fim0B6evY/gDnow==
X-Received: by 2002:a63:7006:: with SMTP id l6mr15315807pgc.402.1635289810022; 
 Tue, 26 Oct 2021 16:10:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:10:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/51] tcg/optimize: Split out fold_dup, fold_dup2
Date: Tue, 26 Oct 2021 16:09:20 -0700
Message-Id: <20211026230943.1225890-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 53 +++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 5374c230da..8524fe1f8a 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -920,6 +920,31 @@ static bool fold_divide(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
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
@@ -1731,28 +1756,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1796,6 +1799,12 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(divu):
             done = fold_divide(&ctx, op);
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


