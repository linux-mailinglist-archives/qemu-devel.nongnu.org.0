Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5693FB13E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:33:43 +0200 (CEST)
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKarR-0001zB-4R
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj9-0003j9-9z
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:03 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj7-0007T5-Kp
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:03 -0400
Received: by mail-pg1-x536.google.com with SMTP id k24so12406733pgh.8
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/gLxdxuhis4lF5Y8nsFl8eRzcFmtXgy72e0rkfcmU60=;
 b=DXK+/RcN+KITCTiOkWKf/BqblOKpDbCtJ+gkIbn6psKLyQAFa1J4PcgX22IJRbdL12
 xoA5lANq0gVLIV00JYUDENjznkChNOOzsoQd9DIumEzAo3oivrbPobnQzmQwONwhu4Ow
 Ci+RuSRHka24lN2uZgIO8okkmGljtKAArHbAhh/W+tT87h8Bw8AT2KQ/4PjXzLAEQE3r
 EtDnBYQhjdl/tfhVfDKri5Ce1x19BVsxUWSVGGx0ZOHdXyd1dWOKL90mT1wPhO7MwXFf
 HJf2/k1/EFIRKBDLlLC7lLcnqAs0Mj2nx73hkkBl+oqSAF+AfPEwWR5d315F8Kbp1Oi3
 GYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/gLxdxuhis4lF5Y8nsFl8eRzcFmtXgy72e0rkfcmU60=;
 b=hLavnTQ8dbbBH+0s2PISlK5l8zZZIpCvYvT/e5G2XTeFWGj61+WX2fiIX0Hcw3zZ5y
 /NVICJqcaPkSG5hsbj8d69hU1WqyAtyY5Th6JeJb8vhi590enGXtBuGvlpiT9xc5hxRN
 e8gn48GIlxyc/EahZlZ93s6JHaw9lz6ejv8kr/oJ1F4F+v3pvQsNgBRxYbVl3UMNlOoW
 0TeNOnJSJFueBoHXBn8EJC3OnRfIG6yxvJUVYR05ZGxvsh6xFRDTfUqKKmsgxhquJdLb
 xKo279UusrvL7PHJ/qiMAe6HwIL5+9ltcpA+K3EDhPJSfnC7L89aiiZ+eKUHrDUS5zmn
 2e+g==
X-Gm-Message-State: AOAM530HhZPxn8eqskVEi0Fdaxfeqazlxgc7QhOiDxSBhgo7vmGRtDGI
 bV8sYtB4LOkEzZvcvUBhaIYuusnFatAgbw==
X-Google-Smtp-Source: ABdhPJyc0ZTudeXdJqFGbdhG/WxBy5w/LJjtoCDPo8XCmJ/TvuuiopNi2HnuTzrqkVFKROeVT+tyVA==
X-Received: by 2002:a63:4e65:: with SMTP id o37mr20221613pgl.202.1630304700324; 
 Sun, 29 Aug 2021 23:25:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.24.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:25:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/48] tcg/optimize: Return true from tcg_opt_gen_{mov,movi}
Date: Sun, 29 Aug 2021 23:24:14 -0700
Message-Id: <20210830062451.639572-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

This will allow callers to tail call to these functions
and return true indicating processing complete.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 39a65d305f..c4559d32be 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -180,7 +180,7 @@ static bool args_are_copies(TCGArg arg1, TCGArg arg2)
     return ts_are_copies(arg_temp(arg1), arg_temp(arg2));
 }
 
-static void tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
+static bool tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
 {
     TCGTemp *dst_ts = arg_temp(dst);
     TCGTemp *src_ts = arg_temp(src);
@@ -192,7 +192,7 @@ static void tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
 
     if (ts_are_copies(dst_ts, src_ts)) {
         tcg_op_remove(ctx->tcg, op);
-        return;
+        return true;
     }
 
     reset_ts(dst_ts);
@@ -228,9 +228,10 @@ static void tcg_opt_gen_mov(OptContext *ctx, TCGOp *op, TCGArg dst, TCGArg src)
         di->is_const = si->is_const;
         di->val = si->val;
     }
+    return true;
 }
 
-static void tcg_opt_gen_movi(OptContext *ctx, TCGOp *op,
+static bool tcg_opt_gen_movi(OptContext *ctx, TCGOp *op,
                              TCGArg dst, uint64_t val)
 {
     const TCGOpDef *def = &tcg_op_defs[op->opc];
@@ -248,7 +249,7 @@ static void tcg_opt_gen_movi(OptContext *ctx, TCGOp *op,
     /* Convert movi to mov with constant temp. */
     tv = tcg_constant_internal(type, val);
     init_ts_info(ctx, tv);
-    tcg_opt_gen_mov(ctx, op, dst, temp_arg(tv));
+    return tcg_opt_gen_mov(ctx, op, dst, temp_arg(tv));
 }
 
 static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
-- 
2.25.1


