Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED08425DB5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:40:16 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaBa-0000x6-Qp
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXK-0007aP-HA
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:39 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZXI-0003vD-V5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:58:38 -0400
Received: by mail-pg1-x534.google.com with SMTP id 66so822938pgc.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=epe236pamFs8HqTLej6afRtr8fW/Mo+eZnFk8gPaXO0=;
 b=YBGG4MK0MKphI28Mop0I0cCFo594qT9Z039hDVgIHIVdR/00eW+xL5k+yAZDz9ATwx
 sMicamUweYDhBmfWy36741v1FAWfQu8uyDwKk7z3kLK3Rn3ZhwxvkOEzg5g8ekjvBNVD
 TUHevIXgl/ioZQTM5fjAQWytkXC8WipHCEHn01wlVPqvwNrWl262OA7uHpx0KFz8sVKE
 ux6ksVJw1bmAX+3DMiyg8ISn6Ti2BaH6m5MrnrF1zvwtLuSO7185HeRn8rq7T8V4Yy8C
 9/VuqVNQ/ax+UpZ77+X6E7MBNQXNzZyoNbsrc7pQJ8FLdwgq5l12euX9OovKkilci83B
 WdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=epe236pamFs8HqTLej6afRtr8fW/Mo+eZnFk8gPaXO0=;
 b=JXm7bAU5zNs5tJbcul99/imo0ppX/A8Usq3hB5IjRHq5SXAwAu05LUEcPuDB7ptKZy
 XyGNPGjsyJ8YKfqMTTSOG06KaK+abdwe0ruvHY/T+lWhFOMRG/KFn25FPLb6A+m8gwpF
 O0Y8Lr+qYHDQRksP36VMU4Nb3jk6FgkxeaEIYv3zURuKu52FdKqpRVpHV9V210mju4Tm
 dhUoehWgAtKLYIQCb/6QCLEiIjKCWLptPXa//fIEV1doKm8Yj6dNcjxb3KotkIfrkRwn
 +SOPjNObI3QJFryKk+ish9XDzI4dlcjacMq6pSzurEwDf622LZ9T8DmvJ0KP0mWeOgIf
 NNbA==
X-Gm-Message-State: AOAM5302y6YE/FtgTNUhMqbz969phNrtmY8qjD+BGTY27ZvrbwP7BuWy
 bsVjYbwlFdyLPOG25SmBpHBpjJ97qjPMdQ==
X-Google-Smtp-Source: ABdhPJwu7ajdyMi2DOYtq4NngejthBq8n4SENyrN1MQBZT4IO0MFIP4tWbYMqX8bbspOULkc2w6hfA==
X-Received: by 2002:aa7:9e49:0:b0:44b:2a06:715e with SMTP id
 z9-20020aa79e49000000b0044b2a06715emr6300267pfq.78.1633636715563; 
 Thu, 07 Oct 2021 12:58:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm8995380pjf.1.2021.10.07.12.58.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:58:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 48/48] tcg/optimize: Propagate sign info for shifting
Date: Thu,  7 Oct 2021 12:54:56 -0700
Message-Id: <20211007195456.1168070-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

For constant shifts, we can simply shift the s_mask.

For variable shifts, we know that sar does not reduce
the s_mask, which helps for sequences like

    ext32s_i64  t, in
    sar_i64     t, t, v
    ext32s_i64  out, t

allowing the final extend to be eliminated.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 678e7c1983..92cfb644bf 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -84,6 +84,18 @@ static uint64_t smask_from_zmask(uint64_t zmask)
     return ~(~0ull >> rep);
 }
 
+/*
+ * Recreate a properly left-aligned smask after manipulation.
+ * Some bit-shuffling, particularly shifts and rotates, may
+ * retain sign bits on the left, but may scatter disconnected
+ * sign bits on the right.  Retain only what remains to the left.
+ */
+static uint64_t smask_from_smask(int64_t smask)
+{
+    /* Only the 1 bits are significant for smask */
+    return smask_from_zmask(~smask);
+}
+
 static inline TempOptInfo *ts_info(TCGTemp *ts)
 {
     return ts->state_ptr;
@@ -1803,18 +1815,50 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
 static bool fold_shift(OptContext *ctx, TCGOp *op)
 {
+    uint64_t s_mask, z_mask, sign;
+
     if (fold_const2(ctx, op) ||
         fold_ix_to_i(ctx, op, 0) ||
         fold_xi_to_x(ctx, op, 0)) {
         return true;
     }
 
+    s_mask = arg_info(op->args[1])->s_mask;
+    z_mask = arg_info(op->args[1])->z_mask;
+
     if (arg_is_const(op->args[2])) {
-        ctx->z_mask = do_constant_folding(op->opc, ctx->type,
-                                          arg_info(op->args[1])->z_mask,
-                                          arg_info(op->args[2])->val);
+        int sh = arg_info(op->args[2])->val;
+
+        ctx->z_mask = do_constant_folding(op->opc, ctx->type, z_mask, sh);
+
+        s_mask = do_constant_folding(op->opc, ctx->type, s_mask, sh);
+        ctx->s_mask = smask_from_smask(s_mask);
+
         return fold_masks(ctx, op);
     }
+
+    switch (op->opc) {
+    CASE_OP_32_64(sar):
+        /*
+         * Arithmetic right shift will not reduce the number of
+         * input sign repetitions.
+         */
+        ctx->s_mask = s_mask;
+        break;
+    CASE_OP_32_64(shr):
+        /*
+         * If the sign bit is known zero, then logical right shift
+         * will not reduced the number of input sign repetitions.
+         */
+        sign = (s_mask & -s_mask) >> 1;
+        if (!(z_mask & sign)) {
+            ctx->s_mask = s_mask;
+        }
+        break;
+    default:
+        break;
+    }
+
     return false;
 }
 
-- 
2.25.1


