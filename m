Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4881243BE50
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 02:04:26 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfWQb-0006iJ-ED
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 20:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdR-0000FN-5q
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:37 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVdO-000380-1t
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:13:36 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 127so927123pfu.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mUsUojes9E/WUS/+YAxDThhgpmUv93fOZ4TSPj0umDw=;
 b=g1h0Vs1yJD7Ng8siQMw0CnP28NAO1orCan+yDZvbkaVto0lEdd5e2SwSmoW0r06K5p
 P8FWXk/AQWqRiHChHsD8C+i1X2n60X9uq76SYYtzojPXMUdfHk3ppZIODmYBWwIj4CAA
 0HlPV2xOUOelsq8cGaI17nCrTFojHEpe4cAwmtuLz93eeh0BdkPmCFzbw1al3EEi1Ln/
 ZoHXULB4gGGuyWgbSPZ6+mvPd+N3wzOPJ3XDJR0dS8amZiFVD9aMhbWMDZjmKsh96ZWM
 NrP3PLJLrh5lFPEMkFSs7C8NBIE+3gUT60rPLwsyOM6BWC8DYqxxWmOEAbI6/hixqSRQ
 eusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mUsUojes9E/WUS/+YAxDThhgpmUv93fOZ4TSPj0umDw=;
 b=3xI8Nj8wmaejuNao4Z7T1kIPg6qWOUmBFnjEeS0kv+IhXchgzZ2QjjEq7phPfMF4w9
 llpkgGyyb/FFN+pBQm8W/ALCuOouz4hO666nH1Sn93SZL8KpNKF1vzolKVvrj1cegHIL
 bJ9rR7BXnehBFw6UzrnTAGJNf5IvY0YHyiQIyY7AaNLZQfc6iXd63EPqkCfzMGcMDVl/
 //xfFOdBYZg7WFnT6TF+UFJ9bMB6Gcq9WnQIsD5JpfULLe4pX2K1xxV4Nblex3MiGlZf
 iOtDnitS0KCZuO9mBbkMy1GXuUJ0qkCzUD71wB67Qrc9i5IRmFgn1Fw4zXpHhpurs2Ee
 3jTQ==
X-Gm-Message-State: AOAM530uyn05KWsc9yA3/Ycd2HqYGaTBRAPBgnsH46vGJ3ZeZoMqddAH
 D/xd4tQ1cQYDtlVI3NUnQdD7xYQoJ4UNlw==
X-Google-Smtp-Source: ABdhPJwqcLumEAWOx7J6qJ6QJv/HXM6yeNjkivtW/YM2x7K71ll8FFZEEp0szN3Uoa3adO0WRHw8/Q==
X-Received: by 2002:a62:8017:0:b0:47b:fc93:f252 with SMTP id
 j23-20020a628017000000b0047bfc93f252mr13686215pfd.39.1635290012860; 
 Tue, 26 Oct 2021 16:13:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d6sm24158122pfa.39.2021.10.26.16.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:13:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 51/51] tcg/optimize: Propagate sign info for shifting
Date: Tue, 26 Oct 2021 16:09:43 -0700
Message-Id: <20211026230943.1225890-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index ccabc5ed54..98ebe93f04 100644
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
@@ -1842,18 +1854,50 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
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


