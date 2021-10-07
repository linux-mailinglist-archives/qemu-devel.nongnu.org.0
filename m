Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AE0425D10
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:17:12 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZpH-00045h-TS
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTy-0000KG-W1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTw-000797-Gl
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id r201so831385pgr.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PXYs6BKQGgxD10RSzQzzU46QA/mx5PLipRBQg658RPE=;
 b=XuNmhyE6Pj2yM5/L3p4Ww1qNU6/Zk/dZnbyNfU/AjA9r/jLAEfq6YZExIq0mOhvsMV
 mqH4TKwEGPNp+BpWLFd3t7cWhQdS7wF9vQMMERJ3b6RUPEqJKZ1veMbzUJEP0n0Ds/Qe
 KRaQSdNSz6Uy78ckfF1QrGAUbqJLtFFsmtpO92BgYAE6vrgFHDOcCEb38xfLLWF1yzjy
 nW4bUOBDfrsTRi0nsWaREjLc/2ch3yphsnDhD5YJVAqZ6iZ6KfFV3+ffbUVangW4ECmi
 lj4JpgHXBDbnm6WHqycGL2jQh7X8BG2GGLGqwBLjguuMMsWIT4YgWurLlGLJLdmT26uq
 qE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PXYs6BKQGgxD10RSzQzzU46QA/mx5PLipRBQg658RPE=;
 b=VyxWYAcdjZvnO9uKPe1AIhVLz5C+OI9eaCkf+81Z75CmsmvknvpluzdhjjakCoPiq8
 LdEVt4gWzFnUsN5seU7C34axcPOPpMaF3OR6n24HdGXAwsMiUjOJQY9GNa/Kz16AF5x0
 6pHUypWuogiKYZxPJ2iA8BNQR8M2GJAFXqkxDDi/0lgDWrP/QIXZ0JfySGSPZa9V9Bah
 THgHd2LELA1fj37D7+2seYkRp8Vphk3o85pCkoGrE1YjkDTQnIv2/i/097rQaQ8N8J0o
 jqfs2A291p2WenR+IRsUyqc4JOZ4llZOGVg12Uz6Slm2pVGH7M4hJxshzWG1HEgLRbBj
 JKQg==
X-Gm-Message-State: AOAM5318YpzWGCVuFOg6y4pD6fGvR1H+CHpZ/84gEfmbHExr7V1+fCkM
 9+Lt/zNaYXD6ajzRTkZLXYJJOPh2FmWquw==
X-Google-Smtp-Source: ABdhPJyDr64E8x50bR5appEUpRd/9BV0se8TclbMO3w6KFsmDqvz3Ys4ZOWl8J5NkGWG93GZgSEYHg==
X-Received: by 2002:a63:7504:: with SMTP id q4mr1217918pgc.103.1633636505996; 
 Thu, 07 Oct 2021 12:55:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/48] tcg/optimize: Return true from tcg_opt_gen_{mov,
 movi}
Date: Thu,  7 Oct 2021 12:54:19 -0700
Message-Id: <20211007195456.1168070-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow callers to tail call to these functions
and return true indicating processing complete.

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


