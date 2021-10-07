Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B9425D1C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:20:16 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZsF-0001Us-PN
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000Of-GF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU6-0007IH-Ge
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:22 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so6009272pjb.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O0q81kCYe/orfnkEuC1SCXOvUEuJWztV/bwCpN/GWE8=;
 b=Oy09coFv/aSzO1RW7W11arg5fGUfjs8yLj2dHSW0J9seJI1TKWat2Cj5vPlwhrLEys
 6LTnsS1B9HYKh071j133BEeCsochtthn0+v1Dap5bpc/Bc56p+/B4DN1Rm9NgaSvfOvW
 8XqSmKsPuwVRHXv4A2IbuYlxsYxbvOSBsPbkBVtieMqVY3LaLzmpKp0juJp8ZMNIiZoe
 neFnkWo62XX5FUfUKxkx4r0DBYpgMMQpDfeyGaM6omM/VeBHQfxnAy1KIkhM8x4mckTK
 6+ezGcodpTXieSPKAHmUli7B78sNfyb5Dl5OzIi9Uzo1shBRnzb1knsbGufKPgIDmdxr
 1csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0q81kCYe/orfnkEuC1SCXOvUEuJWztV/bwCpN/GWE8=;
 b=7T6pkM+rdx/1IOq7UkFuU8KVHlg+amjYKOmmuq/T1PAlp/FRGI84JAmhc+NTKPCUA8
 IknYgsVqhHp2wFbx2yv676y7Xi/3fmvYCrePf3cOxY8rE8AsWYU0W3cD7UnaHoWthFW1
 bxoZBe7PRN7fb90tXAYaVfFlafJbb/lRMeE5Hte0ODxIyzb/KVw2PPbm5Y/ziWqPvv8a
 ZDbi6rNGKFRVcJh+enXOoK5DcYFwaO2yPrsZeqzGcEJHMHunbYB4eMfAoKIZhSNLsctJ
 AX848JXc9Fvog3w68OShcw+MUUeswYJsgVkPwNPlEysvS63fjEoJpqDbS3DplrA4/TAO
 612g==
X-Gm-Message-State: AOAM533CZbCUlfmBI+bZRmPRezBACNMeGJhQ2hqAWc7/q3E+fSdTuEtc
 v8WBguXczoCbKaXcQ4aLN2zlLh9tVgspOw==
X-Google-Smtp-Source: ABdhPJywKijx5vpxV2X9L1sgfSUD9tclK+0nw9CFiGLq92i3c5ya7ucNKrwNarZ3u1gWSQgVAvjVMg==
X-Received: by 2002:a17:90a:b78d:: with SMTP id
 m13mr7588842pjr.17.1633636515921; 
 Thu, 07 Oct 2021 12:55:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/48] tcg/optimize: Split out fold_deposit
Date: Thu,  7 Oct 2021 12:54:33 -0700
Message-Id: <20211007195456.1168070-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 tcg/optimize.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 6020a678ab..dd78982330 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -880,6 +880,18 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
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
 static bool fold_eqv(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1728,16 +1740,6 @@ void tcg_optimize(TCGContext *s)
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
 
@@ -1765,6 +1767,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(ctpop):
             done = fold_ctpop(&ctx, op);
             break;
+        CASE_OP_32_64(deposit):
+            done = fold_deposit(&ctx, op);
+            break;
         CASE_OP_32_64(div):
         CASE_OP_32_64(divu):
             done = fold_const2(&ctx, op);
-- 
2.25.1


