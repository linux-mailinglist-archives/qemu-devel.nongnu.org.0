Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B543F64F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:51:58 +0200 (CEST)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJrx-0004Qy-LS
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaN-0003zY-Jd
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:48 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaL-0007wp-Ua
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:47 -0400
Received: by mail-pg1-x530.google.com with SMTP id q187so8739708pgq.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/my2BfUMduF0YwUj5N5teVZc/oRLeZHGt5Sceph4cvk=;
 b=fTWzUGcqhusY8C0B/jsefioy2i5esrWU2i1TVUXzlgz2ijNjstOv5ggEj7JiqjLaAD
 cGM8aqZ1Sct5lHVaWg/60lDH9DchhYrDl1/i+PEwSM8JpkBTqjmHK/o+XPJydMfONhHp
 aj8n4TOWK6hsLHZoJ/Lp0QzkxLFSN8Ni9fgQUa6B7Ed+eRb/3PBvnl3J4uDHZh0+jHu9
 Wtqs7jDf2ZOJyAORybOPF5GqQ65cty1uyQFPNAXSaXRd+j2tvswoNmaoneqihIYFvbcg
 PPMeLE9Nu8X914qPnUv0yNrMhKJJVk8LKPv9i7PmQIb57huPGjt+X5q4WolaShS2qwHY
 ZVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/my2BfUMduF0YwUj5N5teVZc/oRLeZHGt5Sceph4cvk=;
 b=nKaj7Kuj5/o280Nbm9096I5T8UCp4KgnLN5cgOTy4Bez5L0YOPOmELkREdq9ilYTYu
 aCBqJm+zLKEjUrFL1QKWoNfay17B7po8y7aeOci+ZyxLBbftrwXwwljPHv00SMRfDgFV
 LrRDOlMJAYF6NgMIGqgyyzrq++y5Ih60ZJWBTC283MZtvVEGJq1sTmNCpWpENZsUL5qq
 rep7kUSMwJZGASOfGfItI0X1AEnRgOIy9E9PIVMs/jEMov20iWVkApnS3fHSmwMJrfwx
 uQnmjcX6D52bJdjawVrqO6HV8QQJBT5up0qVbNmDZVDB5qL4B1/INmJ4VfakmYoUb1mv
 eJgw==
X-Gm-Message-State: AOAM533mJAF+U7mkna4w3LkXGkNEClSysq1fKl9lXUNuUEQVzxYZFpeK
 Z6w+12mV0d/0yhTMZGgqFofq71WmT4rsfQ==
X-Google-Smtp-Source: ABdhPJx5jp/yvy6AReHcl8FWqpwHOrrzXEPj9WGypeRCQbcHMaF1GzCh04pPzdFUUnT5KGg/AcHMdA==
X-Received: by 2002:a05:6a00:812:b0:47e:4c65:2a77 with SMTP id
 m18-20020a056a00081200b0047e4c652a77mr6937794pfk.51.1635482024605; 
 Thu, 28 Oct 2021 21:33:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/60] tcg/optimize: Return true from tcg_opt_gen_{mov, movi}
Date: Thu, 28 Oct 2021 21:32:45 -0700
Message-Id: <20211029043329.1518029-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
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


