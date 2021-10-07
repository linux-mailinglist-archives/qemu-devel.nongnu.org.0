Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537C425D41
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:28:54 +0200 (CEST)
Received: from localhost ([::1]:51298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYa0b-0007aN-Lr
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000Ol-Vi
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:26 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU8-0007Id-Aw
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6064209pjb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aWoKHX7GFhaLowzRN+ZxI6se6u5BkCJ7ipcZCIcNdKk=;
 b=SjNjSsVn0QoPaAwdtx8r3HlmqBTpFJrZQY0a93OePfyl1An5E+C8kuR16gGtS/qEQ5
 Pl21r9Lg6J4rP8MiSgW3AQQVIfSDRWCmEkU3i1al3FjcNE/aHxkVlghG8hJOjsEFhHEk
 eNeUC3zLSOB3+jrd+FPk8ct9L+yI2ELvCQMV6c94WGWX/On1b8Jv8GajbGS+eG2qInuN
 O9OZrslTsiQAV5CoJplvGJ6+ShbtwTAoZdImDajmfhdSTrWV0TGK9id5p1pMQemY2Cvp
 J+IJ+LQwiL3AU9ZMb1ZTzT4fr1+9tt3Poerep9EZuYWT35wEC42Ckb2TEphIzbxvFmTU
 XIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWoKHX7GFhaLowzRN+ZxI6se6u5BkCJ7ipcZCIcNdKk=;
 b=WfjSEBKwdubG20gGtSZlJQ90Q8Bj+SlXDFah7d7ZBKC6kI9LOGOFAs45W5NtjlECNB
 f66zJmXICCGE8xHNuXdAF0aVdgc9TvbDKrtaxRwTbLcQUJB7GDbC5Rw27W2HpSFmPZy9
 vds7P7qyxcnJ3nTErUylSzKDLNUdN/3Q/1Q5WHk3s8k5IRHbu+MR+gpnuwL1beqRjk/z
 TD2VHJTd0dGiPKwPmJBJmCnezVJ0wnAfhn5QPs8yyBlB2GjVEaf9NSb8S+3brBdmnTEx
 +DCND/tb3mjKCppYz0BZcdM/KK7aXW70cdoKYQWhNZhEFap7AxUla5MoL4gFbPxI1h5x
 hsGQ==
X-Gm-Message-State: AOAM530ilZFcf1OMu/VOy/j2wlBtuWjzkxkpCV5N2iLLT5DxeMBzFLrk
 +ozfaVpvJJATLA8tNXQ/S+S0YQylfEbv3g==
X-Google-Smtp-Source: ABdhPJzwzYO6S4oJon6aYPObaucWyeulZQ/yE/FaBQj6aTHALyOHkcqTY3WI2mESEJbBI5B/+TktUw==
X-Received: by 2002:a17:90a:b795:: with SMTP id
 m21mr6880176pjr.143.1633636516502; 
 Thu, 07 Oct 2021 12:55:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/48] tcg/optimize: Split out fold_count_zeros
Date: Thu,  7 Oct 2021 12:54:34 -0700
Message-Id: <20211007195456.1168070-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index dd78982330..d2e5727662 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -875,6 +875,20 @@ static bool fold_call(OptContext *ctx, TCGOp *op)
     return true;
 }
 
+static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1])) {
+        uint64_t t = arg_info(op->args[1])->val;
+
+        if (t != 0) {
+            t = do_constant_folding(op->opc, t, 0);
+            return tcg_opt_gen_movi(ctx, op, op->args[0], t);
+        }
+        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[2]);
+    }
+    return false;
+}
+
 static bool fold_ctpop(OptContext *ctx, TCGOp *op)
 {
     return fold_const1(ctx, op);
@@ -1726,20 +1740,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(clz):
-        CASE_OP_32_64(ctz):
-            if (arg_is_const(op->args[1])) {
-                TCGArg v = arg_info(op->args[1])->val;
-                if (v != 0) {
-                    tmp = do_constant_folding(opc, v, 0);
-                    tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                } else {
-                    tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[2]);
-                }
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1764,6 +1764,10 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_brcond2_i32:
             done = fold_brcond2(&ctx, op);
             break;
+        CASE_OP_32_64(clz):
+        CASE_OP_32_64(ctz):
+            done = fold_count_zeros(&ctx, op);
+            break;
         CASE_OP_32_64(ctpop):
             done = fold_ctpop(&ctx, op);
             break;
-- 
2.25.1


