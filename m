Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7F436CD8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:37:59 +0200 (CEST)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfl8-0003Uw-N5
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGQ-0007k9-BL
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfGM-0004m0-1U
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:06:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so412815pje.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BUDQu/CJgwa4ODuJqZ+yd21Xfefoe1a81eW46BFAUmA=;
 b=O1e94xnR0CjTuMfhM3xgHlxxtQVNDySOSWrdE4LMMu+PohZ9+B3DV0ZRYo8wuhwiRN
 8utAaFsBArgzDjMqOS6mve7r1W5TqG15kyLrTiHocE/iLwWZ21M9Mbg+1TLOiONi92X8
 PSOMXenxgrEf1x/0lvemsottEOtTUFx3GmhbYukFhKdB4nU/tIEeLjOMmdUeP26G6K6H
 0p99ZNS1EeEECXod5dR6NTJRSonZVZP3uVsvbN+t7sd8UXPNp56X+pSr9oWtKovL6aHX
 1m6Im1YNTQdfMUXDGb6VvcvNk2aD7WZPMvF51QOrWC6mKE/0oY5Uf65GVmBTyHJa4hWG
 4N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUDQu/CJgwa4ODuJqZ+yd21Xfefoe1a81eW46BFAUmA=;
 b=xYD0JtM5mMpu46z7RfHk1bcKnETvSLEQpyq3WKqO9pkP7hAekbz3mGhQKnbwg6amJ1
 wrTflu83GKQolcKrzFJMs449MOYvA7VDDzCYdk9sCZQPmAVEsMccs9oLiMhuDZK8Ee+D
 3eFenHq+j6KNFKDSy/Z061AMdTRC4J+MKgZCfgLk4v10X1sROKk1r2srUvz2E8qxzxT/
 2LbjHMb94rR9MC3wbai+AQk4Y1wApyrv5Yu5g3kqamqcCBvXY+gQhz73P9Lh5VQSBzwg
 BjLpAkaFZ4g33sqmautch8PLUGOYIIS9d9OXjGvPDsqeMOOreuPAtbW5Yp6Z/ma6higt
 gRIw==
X-Gm-Message-State: AOAM532+Ob2yq6LGMoZWTtxN+avakXtfODGG/mRHJLQ81EUgvKTmoXA6
 ykaTa8zZUAG+RtlIb1rvsvAzbN06ssJHCQ==
X-Google-Smtp-Source: ABdhPJwen37aioTeCAz//DSGBb6dILDRnOaaE63MjLG9PO774wzLO7PTE1fbsCMA0LKUb7l3+2nA8Q==
X-Received: by 2002:a17:902:ea0a:b0:13e:8b24:b94 with SMTP id
 s10-20020a170902ea0a00b0013e8b240b94mr7420082plg.45.1634850368663; 
 Thu, 21 Oct 2021 14:06:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 37/48] tcg/optimize: Split out fold_ix_to_i
Date: Thu, 21 Oct 2021 14:05:28 -0700
Message-Id: <20211021210539.825582-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Pull the "op r, 0, b => movi r, 0" optimization into a function,
and use it in fold_shift.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index af26429175..6c1cc3e635 100644
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
@@ -1364,6 +1373,7 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_ix_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
@@ -1532,24 +1542,6 @@ void tcg_optimize(TCGContext *s)
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


