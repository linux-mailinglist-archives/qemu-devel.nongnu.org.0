Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D75443D9A1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:04:02 +0200 (CEST)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvhx-0005cC-Fr
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMd-0004sj-P9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:42:02 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMX-0003h6-Rj
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:58 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g184so4925448pgc.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJWu7yUFUqO6SxASLIr2hIPwbeHCDr8GBSl6LyJ/KfE=;
 b=x/7NcGxJq+yOHrZwau6hBNkHG8txCgYZ0+Xt1KZgTgVCuXpyVO3Omekn1L7PRHClRw
 8g5HKxKsUMEEs8M11Jew5KZgJoCZYJ40rLkcw5ktwCqKBxtEfGka/bq1HuSJy8/3qhTu
 v2r9pCDbmW5I20VO7fGgwE+hracNSkYO2XbVy3T85KiZz1a3gHWMKmX/8u38OVQFYHqn
 Lz+r0vyTlGqQtaIKJW8DDPHkL/fI5VcRX2vXMdYs46QeWb+QY2F6nSoLVGTnVVokGGLc
 SBmTmiSW04sVwJ2Cznd5jdZrQ3QNZJl8LYTZvzQuLsvpr6VDCEWBhzLWidG9bqeLbl3W
 SHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJWu7yUFUqO6SxASLIr2hIPwbeHCDr8GBSl6LyJ/KfE=;
 b=vZ3Su8p8S5qMGamStwCnnrC53pNijDkLhlPgyLw73/owtuF/r19phqMOv05oTG3Ev1
 mnmfstsFYl1Q/nhLvrzaSc6YpWKHtpP9YdW05rlL9BWZcZBK4eFYdq5TDEkzV7j62FJf
 6GP9JQN98VxRNPKQGQMdgRec2iau44Q6F/dxxe3h9dxgFuJds0hirccZYMAI0UEa0s+N
 GW3lxbXb21kj8wOfj/Ym/FQrDnYeIFtG1Y6r1aTLBbS+qiBDGu/ZzjgxifUmeMGc0vFV
 wmf6TkwRCAjbgMwyuvq02AfFSv1mvAWWUscfJgpZ96IY6srrlEYoVK1lx60Q0NkCFMi/
 uMsA==
X-Gm-Message-State: AOAM533sBCgWeaAB3GCmZfomyyWgLk+FdWErCwB3Z5g7EmgfOfTFKCel
 yUjAeWasZkOuICX1zxZdPWTxmST7qTOhkg==
X-Google-Smtp-Source: ABdhPJyO+O/cquYIkgM308JnSWCHgRJNX9wr+BSb+2/idxoIuQ4FGNas+xLb1oro9u8XYuwcBnvjcQ==
X-Received: by 2002:a05:6a00:2186:b0:473:5a61:a7f6 with SMTP id
 h6-20020a056a00218600b004735a61a7f6mr1482892pfi.15.1635388912561; 
 Wed, 27 Oct 2021 19:41:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/56] tcg/optimize: Split out fold_deposit
Date: Wed, 27 Oct 2021 19:41:05 -0700
Message-Id: <20211028024131.1492790-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 3bd5f043c8..2c57d08760 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -878,6 +878,18 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     return fold_const1(ctx, op);
 }
 
+static bool fold_deposit(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t1 = arg_info(op->args[1])->val;
+        uint64_t t2 = arg_info(op->args[2])->val;
+
+        t1 = deposit64(t1, op->args[3], op->args[4], t2);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t1);
+    }
+    return false;
+}
+
 static bool fold_divide(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1741,16 +1753,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(deposit):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tmp = deposit64(arg_info(op->args[1])->val,
-                                op->args[3], op->args[4],
-                                arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1778,6 +1780,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(ctpop):
             done = fold_ctpop(&ctx, op);
             break;
+        CASE_OP_32_64(deposit):
+            done = fold_deposit(&ctx, op);
+            break;
         CASE_OP_32_64(div):
         CASE_OP_32_64(divu):
             done = fold_divide(&ctx, op);
-- 
2.25.1


