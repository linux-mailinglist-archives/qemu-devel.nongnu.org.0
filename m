Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C13FB1AE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:12:12 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbSg-0001r2-7l
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamT-0003Ft-Vg
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamP-0001qi-F3
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so13107992pjw.2
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p0it7vKYyHwg4t/yKbk7c6DB6PeidQgx1KIrVCB5r9Y=;
 b=KxZ0aXerzz1E7sUSGWyJWFZAueqzNzv3S6d6M6Estk2BFm0sx8L0GdFtySApbkYlQr
 TYE7Y5VFzqqkEGusHKwJk1Lbp4WLGKYqnQjZlf8svgvLJ7BDsNLmm7GB0lHAmUjVBot8
 e1m9g49lRAqNHRR5NBridl0ozPs8pGxgR9Am58xsQ5ZHrhpGgp5QLo6dK4Isv/1uuWbe
 DlbwboZhgTyaUxNNxBUlz7HmmgXjP3hl4Z3UpgnRQD6xaRM7188UEzOFenjDGVmoiIyk
 5T7BpODQVWzR5zdvBzYmq+4gt2wAeGr/FrB2dtu0EQXX6TNmE6s2S+sqWSa+oWw094z6
 Hc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0it7vKYyHwg4t/yKbk7c6DB6PeidQgx1KIrVCB5r9Y=;
 b=LAleLGu5GFkdiy4hsmgdiDYHv4EPMBD+fl1IyZ6X/JD6l/bHKT9PPYAOwFS6omt3tn
 Nl+kYPFh3fQZUYYRHv0yAllv7TvTA+g25Cy9erS05XchEWCT2K97uW6+JwZYJZ2lZtkT
 OmWAtFL7mi9XUB1romiHaSoldh1NeTcTI/eXODFvJZzJ3cGZB1aC0aF8mDmo8ZNidQp3
 xIAWhnX5OaqpHFSnLOvo1BGzzsVSX7mgHJFoyfkSf+MFQam49qFcxs3hxvFgFuYCyRze
 iTL6M6HClkwNu9fGWNUSwwCFstcs2ltLxKEp3RKfucamsdrNyy5FdyXrMYHxDtD+Rxzm
 DNNQ==
X-Gm-Message-State: AOAM532dIX8lkoGg1sKkCZ8bj3zTEixZ4Koip7+Q9bdUZzbAndqACUNY
 gdvVb2KLON4NlX3yw35ZrrszGfEsyBvY5w==
X-Google-Smtp-Source: ABdhPJzdu0Sscl7g/Ft6Kt+IbtNPn+CKVYCZ7/NxnjYcauMtU1scjwHPnMlXvNhTanwIDbfsXwKGFg==
X-Received: by 2002:a17:90a:bc49:: with SMTP id
 t9mr24852789pjv.48.1630304903915; 
 Sun, 29 Aug 2021 23:28:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o6sm13337072pjk.4.2021.08.29.23.28.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:28:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 48/48] tcg/optimize: Propagate sign info for shifting
Date: Sun, 29 Aug 2021 23:24:51 -0700
Message-Id: <20210830062451.639572-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index dad72b2ff5..db3661c975 100644
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
@@ -1795,18 +1807,50 @@ static bool fold_sextract(OptContext *ctx, TCGOp *op)
 
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


