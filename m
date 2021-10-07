Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29226425CFC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:11:27 +0200 (CEST)
Received: from localhost ([::1]:35702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZjh-00034F-SK
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZUC-0000OY-Gw
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:26 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU4-0007GQ-DQ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:22 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y5so4645415pll.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GGGoLkGVm3XuJy/LLBpNptjDTMVJbB7q3LUXP3AL6AM=;
 b=zrCmRIT44zjw46hhRaQ/63/LQx9Le4qFylq1RZwgntVf5n2NurByDiM+xJZDNtTxAE
 dYYiUb394N5hKtl6QUED8z6KMgPll3ZkFawU6YQwIUByYj741FbJnyxuEVgu4F/l6Vym
 bvWfmxSL/OdfgwVACyWvEIWyoLyfz0OOBGXeFwjfaqWOpPXfMmhisQw6SvLDXJ/MmYt9
 4MjOiXtl5mzljWQ7li71faoa3fLV9vdIDi6/A76zGUt36UEOU7XMMbKNfQhSPLsE42F5
 L9ildimTa443jMTJT9tMFFl6NVxJrg6uBBsG3VCiYXyD46DdiLob7mzxpfvidWsSYvEF
 bo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGGoLkGVm3XuJy/LLBpNptjDTMVJbB7q3LUXP3AL6AM=;
 b=xFfJssMAizFVtfmgIoThJFT9dBcm7JCZIFi9gXRMJF92/xN20BmKGJNKee2u474RXv
 qzbmhWuNPJmMQOMb6qKxsObQii8zvmpWaQszYziPv3A3+6Ngu4z6wslVdE6XM36TJRaq
 FSPV9IIuDKfDgC/fwUhkeSTJ5K5uU7qCaMHW9qVNGjYnaWPwBIYrAe9K8gQ4diKIFp8U
 6KCwFYxT2udY8mfImQScujnvm2qAU8SuoWZXAD0omBDK3jpX30uFxNBcfsQDxXU0eFeO
 4+h5H1gVQRhaEODQavgXC8cTzZnlVP/aPyi1BPWKRhnUlrAqpOOmkRYtSsd15dsiAfwW
 xJUw==
X-Gm-Message-State: AOAM533BqipLlFSOoTMUlrgfE5AbGi56OV2Kiu+gOFUHFvXqG8OxZ1rZ
 2Dgvx7SUVRvTI+ovf9MTxI8VhBa18dteTQ==
X-Google-Smtp-Source: ABdhPJzxZsu6ojdEi5izm7ace5VKaz+6u9iH101BH22pHxmvPfmjvLBZofwMOVjdiHz4zQN79PBvhA==
X-Received: by 2002:a17:90a:d90c:: with SMTP id
 c12mr7711136pjv.237.1633636514614; 
 Thu, 07 Oct 2021 12:55:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/48] tcg/optimize: Split out fold_extract2
Date: Thu,  7 Oct 2021 12:54:31 -0700
Message-Id: <20211007195456.1168070-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c8aa027a5a..8229a67192 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -885,6 +885,25 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
     return fold_const2(ctx, op);
 }
 
+static bool fold_extract2(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t v1 = arg_info(op->args[1])->val;
+        uint64_t v2 = arg_info(op->args[2])->val;
+        int shr = op->args[3];
+
+        if (op->opc == INDEX_op_extract2_i64) {
+            v1 >>= shr;
+            v2 <<= 64 - shr;
+        } else {
+            v1 = (uint32_t)v1 >> shr;
+            v2 = (int32_t)v2 << (32 - shr);
+        }
+        return tcg_opt_gen_movi(ctx, op, op->args[0], v1 | v2);
+    }
+    return false;
+}
+
 static bool fold_exts(OptContext *ctx, TCGOp *op)
 {
     return fold_const1(ctx, op);
@@ -1713,23 +1732,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(extract2):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                uint64_t v1 = arg_info(op->args[1])->val;
-                uint64_t v2 = arg_info(op->args[2])->val;
-                int shr = op->args[3];
-
-                if (opc == INDEX_op_extract2_i64) {
-                    tmp = (v1 >> shr) | (v2 << (64 - shr));
-                } else {
-                    tmp = (int32_t)(((uint32_t)v1 >> shr) |
-                                    ((uint32_t)v2 << (32 - shr)));
-                }
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1764,6 +1766,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(eqv):
             done = fold_eqv(&ctx, op);
             break;
+        CASE_OP_32_64(extract2):
+            done = fold_extract2(&ctx, op);
+            break;
         CASE_OP_32_64(ext8s):
         CASE_OP_32_64(ext16s):
         case INDEX_op_ext32s_i64:
-- 
2.25.1


