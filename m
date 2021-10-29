Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA143F693
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:24:07 +0200 (CEST)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKN4-0006gL-Nl
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdr-0002dE-V8
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:24 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdn-0000PD-GO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:23 -0400
Received: by mail-pj1-x102d.google.com with SMTP id np13so6332309pjb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6S77ImV++TbyhM1Alu0N2O92xVncEhY3IGwCmm5NjQ=;
 b=xAvOj/gwyEXrE0u0pWyXo5rLrPIz4WGLbolcCNNTciwkoZkfB7U3mCI+dbLg654b3G
 52qqftxVA+JDt7/INlcBEwicgeNUTFwnhIALc1pqSsphfTkuvKoXE6y644NfwQ/Ha4/e
 G2t5dbSIKFKEN8TJK2XzKUzOyXm8zLYqvx8l5zbivPGW8uWsnheMibsK4z1AjkhM4GgE
 l6SGE3CiQZufxzwqA3ZBIXmHyXMGTet2TEfs0MnE8YVH42eugBEW0jEiHhBFGE3Up+dE
 yjte4GWQNAvIgWp0AZY7PGCbez1o3o+QgyL+AUOH5SOibBwmAvCWSThjLVGd4hr5s1MX
 wXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6S77ImV++TbyhM1Alu0N2O92xVncEhY3IGwCmm5NjQ=;
 b=IgsFXHPT4d9tHI5dA+m7LJoTXsWjzwY4ufYqY0pGdhSI4n8P6Y0LHsgVwldkxWHN9S
 BguTUsYLCNGXqoIzQGqPcBbMVb/15GTFyxBFkUAPpjA5E3sNv8L77KdcMKdv/aqg6Smn
 NOjMqq9uFWd2u8G6rDb9prbX0ccLWXsF1ayaPREz+Jmgb624tvPvL7kN9+MMLZpO6BoM
 nzArnCdz915VC1uJJsQL4yvhW6zwtuWkDOBxy64OAT+slg+V/bD0PVwO/AcbHcK9Fd0W
 fsP/ZTEg3vVLr4xhac6/dWCAbVeCtstS3wcWtX1N/EhQRI7E3QwLctdH9t1xmEs4q+eF
 g9fg==
X-Gm-Message-State: AOAM532dLmc3HZJ/5YiCd6aiXZlDvINrr4mSWr3CNFDSjbhDfo+ZXqCG
 7N43bhI+MugTl7sQsWZ/tKHObgqt004D1A==
X-Google-Smtp-Source: ABdhPJyCOjP8gCqJBy1DxwFW7iUjYtiqky/5Qv0ru9QSPofB7Lgr79x1m1rPjH/v6KeIvbHerI5zFw==
X-Received: by 2002:a17:902:d64d:b0:140:2cde:7f6d with SMTP id
 y13-20020a170902d64d00b001402cde7f6dmr7637349plh.55.1635482236765; 
 Thu, 28 Oct 2021 21:37:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 57/60] tcg/optimize: Propagate sign info for shifting
Date: Thu, 28 Oct 2021 21:33:26 -0700
Message-Id: <20211029043329.1518029-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
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


