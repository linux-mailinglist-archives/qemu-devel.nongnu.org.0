Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C943D9ED
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:42:17 +0200 (CEST)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfwIy-0005Q2-Mb
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPp-0001db-O0
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:18 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPk-0006Ut-07
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:16 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so3532558pjb.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6S77ImV++TbyhM1Alu0N2O92xVncEhY3IGwCmm5NjQ=;
 b=OgFQCo1OAX/8CxOmNBpjsiB4gxe2yMV1GPMyyD+4IMsvlAOyMNXZgMw4NeULSWSv48
 vkDumSJOIAyaViSuqadhlkmSN1maJmhirfft4FH3HdO4MzB37Ai0Bz2vtsy4uoVV+L5K
 1vo00FA1zdwkLeiECrR2jTVcZ0fqKech8Tl6Mv63x2i13mPoahb2QI+MZWZsA7UUhl0K
 /G1gFcjZvzCrEAHcp13gj0HDNpkNiVElmSAG6/xd1ipZK06YbaMxKTNa0G8Sk4epcJYe
 OONNe9STyBSfQjXtKB23YRiCjT+Mxvm0Rsv+u6Vy+1CVfVj29SRjK9CnacYOuaAlk7N+
 NT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6S77ImV++TbyhM1Alu0N2O92xVncEhY3IGwCmm5NjQ=;
 b=KXz9bueTxEh3f9FAPdK1EZBzIXOdqKBFX9CVaeAqMm4XsDxBRpnoKvyfXDhSmDQN+f
 9KzMtMhBR2G949h25/dcXj0lx4jYgdTRjK4W7HBgOwSd2hxtIP/3gQ2+QCnqGaCRV07p
 Ljw9+TR/R9/7IkScLvphmqZRIO9ShADGvNAt0HsWaxQxkJQwTKhxPoDrkrg+zAvo4qGn
 LKy+xMxyWeAq4Va+DX9ju+gLJ/AotewpJ6T3mE0DBSFfxQRJ5PfH0Hs54stCP7A8z0QM
 Jo9Zb5IcfXOzGBtt/4v4L5KQ9dryBkRAN7i3cQTf8yqqde8BsDB0LM1nnPIvyY/yGEoR
 aLqQ==
X-Gm-Message-State: AOAM530USiQ/O689PYffl7dp8okOV/4yreUXCJJ/F20JRZAkoqod7o9U
 R/WPHKj9DAcvhAyrE8erzNdFMRBgA0Bm2g==
X-Google-Smtp-Source: ABdhPJzHygXho3GIOHzjASFWtZKkSKjLa5Anf580cuMEfrsTIVANR+e7v2/J/NIdwaYwL3umUbTIOg==
X-Received: by 2002:a17:902:900c:b0:13f:974c:19b0 with SMTP id
 a12-20020a170902900c00b0013f974c19b0mr1275792plp.12.1635389110431; 
 Wed, 27 Oct 2021 19:45:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 56/56] tcg/optimize: Propagate sign info for shifting
Date: Wed, 27 Oct 2021 19:41:31 -0700
Message-Id: <20211028024131.1492790-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For constant shifts, we can simply shift the s_mask.

For variable shifts, we know that sar does not reduce
the s_mask, which helps for sequences like

    ext32s_i64  t, in
    sar_i64     t, t, v
    ext32s_i64  out, t

allowing the final extend to be eliminated.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c0eccc61d6..dbb2d46e88 100644
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
@@ -1843,18 +1855,50 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
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


