Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F743D97F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:48:43 +0200 (CEST)
Received: from localhost ([::1]:54424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvT8-0003hN-QD
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMQ-0004hn-7q
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:46 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMO-0003Nd-K2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:45 -0400
Received: by mail-pf1-x42e.google.com with SMTP id v193so4570720pfc.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/my2BfUMduF0YwUj5N5teVZc/oRLeZHGt5Sceph4cvk=;
 b=vksTni8rYO7pb+k+XCbnATHFfIq0coJkuxt2XsfamAJgFT+xKoIukPBQEjWJ033VsZ
 fF/yP6PsIw6AGsAEGi/FZ2xZZD50hFUI+jjaf7UTUn2biRo1R+94dA87IGkVgllSNuk2
 d9vYp+n6eYbAUghH95W0Zg/Nmyk2J1Efo3KYeX32DnqSb49SUzIA8mOMMeJKB8+RdHyx
 XdisTEsBPEwzrnz7aPcICHr9o2MZ+YAIocNYHy/23K4hgEotyM3Xe66yqh03gUvo1dhn
 3V1mjcJV32RLD2JyDwvHINs2N3DtsPL8hWHZ4jOHbbNoijLo6LYIfKFVNmOBNFJjHgVc
 Sqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/my2BfUMduF0YwUj5N5teVZc/oRLeZHGt5Sceph4cvk=;
 b=2P4VMFDZFekQ2Jfq6nwl6YqrctI7x5JehBEpXQW/Xgh0guEzZQ5oIXslgiQOm9UQKC
 WmHIremkNwoLeNCJZgh3KHucCFei7xindNgGZ7YF/L1qKAkyyaa6DNq6nRaSfXXdTTFi
 ZTMktpmp/ar9HBBF3RT8uJClBe+9b0L5RilrYpP7WGWx036lszIRMFjDV7YUUfRuF8Ak
 scyVTejVL4AxnkQsZYibvS5s+abEEJYnzM/Va9TuUm9vzOE65XzrAG6LiV7eFtJ4iVmY
 nP/3V1sI82UpzsnTeHVxTdcdVn1kg8eOJr+eEwIZ7EiJRY5SLxb+cV8cDfdG7Zj9N0D3
 ZFFQ==
X-Gm-Message-State: AOAM5336wx4NG0UTjBiVjMtYfPu21JMGMTHH7D4RF02kvhDgtnfrMq6k
 5UElAylPKsJvgnEM0mHF7TG1cOhT3Bn69g==
X-Google-Smtp-Source: ABdhPJynv0OuL1gG0EZsQApLYVtegwbI4fDTPu9FPSa7Bv/RpsB9taEfBLgx2KkXbYJi0aI4CXf6cA==
X-Received: by 2002:a63:b402:: with SMTP id s2mr1189329pgf.324.1635388903368; 
 Wed, 27 Oct 2021 19:41:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/56] tcg/optimize: Return true from tcg_opt_gen_{mov,movi}
Date: Wed, 27 Oct 2021 19:40:51 -0700
Message-Id: <20211028024131.1492790-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


