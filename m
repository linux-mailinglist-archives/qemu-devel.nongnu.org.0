Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8743BDC2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:21:16 +0200 (CEST)
Received: from localhost ([::1]:53926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVkp-0006HV-Mr
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZt-0002uL-Ph
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:59 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZr-0001wq-VS
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so688665pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/my2BfUMduF0YwUj5N5teVZc/oRLeZHGt5Sceph4cvk=;
 b=vvbTGhGTCXHO0oR3zsdEk8FG6QmaZxZdYEpqLOvx8GYmWxT9DfWFOVrDwdLH0U28Ji
 m3iSRJjVSoEpF5OKQ1i5l94D2a3RZZ3AdM5iEV60JFvsYWkwkyTiVQitqJvc5L/KuCW/
 uAJTB2zfcPx+vaf9D72djx4aEAO5vE68kpocXfBo2t2VrT1/bYGJINtURuT7oi4XexlP
 gvKTz/PfCU4Uc237uLdO0X0wUqWQkV8DZx3GlBv5t3HAZZQ6dT8/AIyhEEN7B5nYD5Ex
 0p5t0co+KOTdL8vX+mlMFw5Bs6A2pW9xTe/Ezop/zBMrZBwzqJn3/S5Kw5sEzIgHSOdl
 XxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/my2BfUMduF0YwUj5N5teVZc/oRLeZHGt5Sceph4cvk=;
 b=mZLBub790k2ZEMriMAAY5WqvcbMKvpz+Fm8Z4Puw10WuDC6WzcvamPHjESojS2CHZT
 yIt/IIprNCOfsH0Ou7YQPEHQ/B0ptyjdd8RwkoHNom4lbPgJFK0eMyVXpJoZ2Kq4kg1X
 9oDVqrVN/ZTPktd/KuuycqIJPDcyvwhwwtPu68RDKbDpVNlml9GwkLO5w71XYAsT1YmC
 ouyui+i/xzgp3jUEu9X6Yinp6c6I4kw2DL26ZQcOUsZej4tuBIcNyB53IoYMKJpRidR7
 Ymax15MmhZie/B45UpAQVt8iu9XJHHTEGfU84GhS16mkPVyTGcVEZSk38MBcddaTD8wh
 gtgg==
X-Gm-Message-State: AOAM5301QE/ZC9MAEnTzDJnet4oBYH5ZPL8CLhXLwoR61d9DvlpX6iYE
 Wc4NQR1r0KdP357MFAu2SLRFXTyjobsUVA==
X-Google-Smtp-Source: ABdhPJy3gE4aWwgbLW95wG1U0x9M8JU/hRaiREpf6VrCR7iF9T6kvYX6lu2X78s89AKdZ7NIzdbYGw==
X-Received: by 2002:a17:90b:30d8:: with SMTP id
 hi24mr1935076pjb.60.1635289794710; 
 Tue, 26 Oct 2021 16:09:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/51] tcg/optimize: Return true from tcg_opt_gen_{mov,
 movi}
Date: Tue, 26 Oct 2021 16:09:03 -0700
Message-Id: <20211026230943.1225890-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow callers to tail call to these functions
and return true indicating processing complete.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 19c01687b4..066e635f73 100644
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


