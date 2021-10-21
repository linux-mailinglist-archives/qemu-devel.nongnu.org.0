Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B77436CA3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:26:21 +0200 (CEST)
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfZp-0006TN-VD
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG4-0007Nm-Qn
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:53 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfG2-0004Em-F2
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:05:52 -0400
Received: by mail-pg1-x531.google.com with SMTP id q187so1426251pgq.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vj6eiTLQTF9Hihcv311hW6R5u8RCFhiOgb4iuNdXdzk=;
 b=D7ItLjIBfAmH4gKxsjNQEs4w3S5Iz0oF71LyxDJB9V+XssggEZb4/l69RhsWbx7Hi5
 6YwOdCzRQ5Wfzerc3ZmyFIyZkXQJqXfAGO+ze2+xEXE5du+zMdxXcZlF/Qsf1p27Ini4
 I0VssuIw6owIDSIJgT2JKg74SKyoenQWgg6yjpo9tH2/J2sH+tRFEgTTSRjz5IYFUyUw
 cqbRFqE1HG1EJoMfCRjsA7SGQoylx5mHOHvHoPBjmuvMPW+tVBwyGXux5wwh9nWz4bAo
 qQT9Mz729trn7+4ux9n5Mbt7JsdRIvUeK+iynSRpFkeYhr8r0YxXWpJfUMBPUnVaQLiQ
 KAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vj6eiTLQTF9Hihcv311hW6R5u8RCFhiOgb4iuNdXdzk=;
 b=2ApL+fsfV1uwI8kTWkEfchS26ls2CHjdLl9H96yQFCvLpntWIBepEEj6K6kh8ebWwf
 u0AZSXuW1TOH7ZOIRTzuzpY2ovsiV/tHJ32DvgM09NSVrlihpAOX/0ORqN1vWZYAIjAk
 qiJKQLcgVrhXxJvoDPvlsjMMxPgffWNGapePKA0e2BX9t54UFJPxcyZC5Cy3qHZijrAA
 F40o940gDteCkmhzcsF6YyOu70LTbKmHuYwOi75bXLE2PqR0SVJj8gTbmEQnXVlfuamI
 ufaoFK/LLKS18n2FXCHjjPXQgieUvG3MhGA1NTyMUReJpuwhTkj60GQY31zLB2bzj3tW
 aROQ==
X-Gm-Message-State: AOAM530CADs2NtgoJJHSVEi3qTIW3Q26XCO7IL6+4ZYdnh9ayTQdymLH
 PMe6G9dTf1LCbwgjAoBf3/z4/lMtemWR+Q==
X-Google-Smtp-Source: ABdhPJxE6ftUiq68I9E76LCRiZnorYuIcMzXoXkbxAa4lQYW0ZXgUNwpmjNZulkxEHv7YjvKZpcMmw==
X-Received: by 2002:a62:7f4a:0:b0:44d:292f:cc24 with SMTP id
 a71-20020a627f4a000000b0044d292fcc24mr7888270pfd.58.1634850348977; 
 Thu, 21 Oct 2021 14:05:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g7sm5981670pgp.17.2021.10.21.14.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:05:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/48] tcg/optimize: Return true from tcg_opt_gen_{mov,
 movi}
Date: Thu, 21 Oct 2021 14:05:02 -0700
Message-Id: <20211021210539.825582-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow callers to tail call to these functions
and return true indicating processing complete.

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


