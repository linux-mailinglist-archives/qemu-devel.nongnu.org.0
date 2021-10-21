Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A403436D1B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:54:18 +0200 (CEST)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdg0v-00085G-5J
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJQ-00045O-Pc
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJO-0000A2-T8
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:20 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w17so1280459plg.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOs5dk/JjBB+U1kfM4iGuyzcyV6uCGa5kiLeJfswCh8=;
 b=p2Z55PxB+CCq278VYHceK6G6MwhAVqzaD4o+Xyg3FAk/pucA3qObjv9qncqwL8BuX5
 DFdc5+PYdLMnOg2Gnvtehq6q1mitzWLVQ8NBCHR3qmWJwkyzZbPUG2FAvtnk28RCXhWS
 pU2AAvfewzjoFB5rV6S5CGPozyFSofpRr5LsFSkYX7NmTyBHKyXFH2QFk1/YJFLkexmM
 MEDHzCKfhc9hvT7CDjA9sbT89Fm6y+5cHC/J/vnVdbhkg8AJn3YLqOqTqauFqk20pbp1
 9nsgTRhoTToucuZW8fXpqIopgXPCle7mX6d42jF5Ux/AXTVUaz2djDMyEUIY61xP+jo9
 +2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOs5dk/JjBB+U1kfM4iGuyzcyV6uCGa5kiLeJfswCh8=;
 b=gjbz5haoeMyLoXdoQhcCmI/iOQhDONO7rl4gTJYd3RcIGJTWUnbKTAgmCwPEjotsDh
 JYL4SMf/omoVW/w+LVeOwPCs4440gljOYWX4LPhKhV2BQi5JKP8azcS45M8w+gcEUayo
 L1A5zWhs0YTmp9H8Ea/CmSxqhfNo3rMlo1ri5cW8sSSK6OOqtQJtPqPbKyM/sja7k9DB
 y6ti2ifcezzGIeCDWEjwK9tCepmDyulV+XAAr52xnxjyuHZroFK2NiYkf3YIWHawCOR6
 TFSpQ999Q85uMcSZriut0GFcEkdjZVPiWclhZsIFYLSg2c/E+6GwG7Ev9G5R1aKQucxj
 qZzg==
X-Gm-Message-State: AOAM533zD0fIZYc9ScAfwFb3RwwRDDURQQ5E3yPl8KAQuz/xoiSzGd32
 OuWyrYzfEXwJuQyafR13+5a+JbwXfQeXug==
X-Google-Smtp-Source: ABdhPJwNKGyshvYe4BdJEsxwr48X6PTh2oqxkdF11eA7xfihw6dcuXprRkIJShMFyoWBezuy8/T7Kw==
X-Received: by 2002:a17:902:c950:b0:13e:fbf9:7939 with SMTP id
 i16-20020a170902c95000b0013efbf97939mr7339824pla.65.1634850557442; 
 Thu, 21 Oct 2021 14:09:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i5sm6258856pgo.36.2021.10.21.14.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 48/48] tcg/optimize: Propagate sign info for shifting
Date: Thu, 21 Oct 2021 14:05:39 -0700
Message-Id: <20211021210539.825582-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
index 3dd9219d69..5e239e00ee 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -85,6 +85,18 @@ static uint64_t smask_from_zmask(uint64_t zmask)
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
@@ -1801,18 +1813,50 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
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


