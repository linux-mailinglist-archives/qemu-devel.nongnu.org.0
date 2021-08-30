Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC63FB172
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:55:51 +0200 (CEST)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbCw-0007z5-Ff
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajH-0004Cj-WE
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:12 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKajG-0007bE-EU
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:11 -0400
Received: by mail-pl1-x634.google.com with SMTP id q3so7935943plx.4
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nbGo5fQpM+/mWg/WVsbE+2YrmGc9JnbK/yBEl1yT4PI=;
 b=d7LVAVsGk88ARxIKMmA3Tn9PjVcfK9ON2wVZ/pmwAnaBaa4v8WKlJMr9POFRm0X75H
 XJTrKD3lBUoM5DeV5JW7xHtrs62F83KJjrrUxywYkeUkGOpaJkOprhApQe4lCo594q/O
 shJDyuewaFCcuEGVmU9ielS2ps3kmGo0hmi2k5NclceVJo+tGOF942CtEQalXVIlKSXL
 2Ztq9bFshzS4tym328epbQZp7NSiLLhzk5unBw1lOTLdhMpWLARgFQ6r/oecafxDSPpa
 HlzrRT19juZzljN4agxjLuHwPvqpcG7D+lKOza34Y9yInGqG9BFbq4opTuChud8T/hmV
 YgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbGo5fQpM+/mWg/WVsbE+2YrmGc9JnbK/yBEl1yT4PI=;
 b=lXhFGBl++dILWrWpBpSPiiYjZsq18cL93zXHz3qsAaTcBnOrzkr05BVXw0FAGF6i4L
 KWAljWE+3skLt5PV8v3nQS7lBqLBtVE8hdJFv4cOMzYnA12U13+D8RQFQv8cM3bd/fDZ
 uB0ti04gdEFn3DE+g3zEVVb+hTHtegrOmvTQMdtK6eVTtBTguoIv4u07z/PqnuiD7zVO
 hcL5AGsOEfKgogcRO6EGxJss6CCtzd2crTh5tWth1oLGoeyAsiPzc4hfpc/DcxfFT4rG
 PJDRVzrtuCj8FBbx+eV/a0Ldgl8Zkh2+PeJEvTDVVkxNBFsztpLXmhaEFAql386Y65BY
 BF7A==
X-Gm-Message-State: AOAM530dP0kAMKtqMsFzCoKa7IhdqPciyq0JHmvnNFILQIdDihiOVRQ6
 UhzrKVYqx1zQndW5fE068AzOgx58Um72Vg==
X-Google-Smtp-Source: ABdhPJwgg4w4J5mfIlZz1fqa/ILVQDyxTUFiOuHwn+QtU6yBGN7dVYs6ZRaxh7o93kKgTIyDaHNikA==
X-Received: by 2002:a17:90a:9292:: with SMTP id
 n18mr37531807pjo.120.1630304709121; 
 Sun, 29 Aug 2021 23:25:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.25.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/48] tcg/optimize: Split out fold_deposit
Date: Sun, 29 Aug 2021 23:24:28 -0700
Message-Id: <20210830062451.639572-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index c3c66a949e..74c307951d 100644
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


