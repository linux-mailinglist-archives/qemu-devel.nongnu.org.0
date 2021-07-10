Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7AF3C3559
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:51:58 +0200 (CEST)
Received: from localhost ([::1]:56232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FGn-0005mN-3H
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExZ-0005oR-Gj
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:05 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExX-0002Ov-AR
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:05 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso10004763pjc.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7Ia+ie6XOcjpcC/dD6Ub5PbrcGQ/yV9nqv+RZL1T9E=;
 b=w+2mOkg2SmviNZKs9u9VvgjoT4TxhsBVmJdsDZjFvLFJ1eZ/s8c4o+wLzcb8SMxeI4
 usdEWLWja4zmNtVcfCQeVo1huZftEEUbdu6hLbCPVUhE+Py9dVCIvRGNnwGehXu72A6S
 KrFvUiRkDI5XDE0lV4VqNGqtSoOaiPt0jIkCJzf93INSnAgN4nf0w7a7u+9CR11fUip9
 pgF/2212EPbxTzirMdH5IjIwE9XkaxM9C6Mf6AVMZGFgmEKW5NTeBngup4k4/t+9Jk0G
 ZCLTJZ4UKQamw1ZppUEavo1KQNVGpUlV+picMgKNST93KEFHgNQwPDsnOouD327XGGOH
 74CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7Ia+ie6XOcjpcC/dD6Ub5PbrcGQ/yV9nqv+RZL1T9E=;
 b=SKrUhX9KxLfTfCTF5aa8ZYkuThGsIv9TmPlT9sscrVI7SPHLHjtCskmCQhy5GRr8YY
 WUuhehNbF+QS6YhLkxkGsPZJRlmOw+dpOlBajCGa6qOp03zpKF+UYjz01Vxo1JSXOPHH
 3YCxj730ohRksAVczoLMeMPvSumH+4h3AMj2XibBDjS8PCEPt5LqnfvZ8jZVycnvndt0
 PMO5vDmEg89+OCem/uFlsmpAbRhUY4rdwh2zbg0CA57rXXX+xzrZmmz2CVPQT2JfPhWh
 DDHzi3He1QE/+1PPt7TJ3cDU35NKx5UDpkSI7ekl2o9hGxM9KRgm/dszoCQhqN1Gs/R6
 J6AA==
X-Gm-Message-State: AOAM530MqspmUSP6d55qazVniLNokaT1Wj9VdDrPrCm0qujgnIsq1rKx
 oE/Q2cJE6GKxlRrkrizFHx/Q2dvqLlD4WA==
X-Google-Smtp-Source: ABdhPJzr32ipZLNgldMbAYO4y1/r5CVw220c1UybtosgjnPFw/QD3DkwSBKxrBrdp+qwnWhsgB54+Q==
X-Received: by 2002:a17:902:7108:b029:129:5858:b388 with SMTP id
 a8-20020a1709027108b02901295858b388mr35885155pll.37.1625931122117; 
 Sat, 10 Jul 2021 08:32:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/41] target/riscv: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:27 -0700
Message-Id: <20210710153143.1320521-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 62a7d7e4c7..deda0c8a44 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -168,29 +168,11 @@ static void gen_exception_inst_addr_mis(DisasContext *ctx)
     generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
 
-static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-{
-    if (unlikely(ctx->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    if (use_goto_tb(ctx, dest)) {
-        /* chaining is only allowed when the jump is to the same page */
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_pc, dest);
-
-        /* No need to check for single stepping here as use_goto_tb() will
-         * return false in case of single stepping.
-         */
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-- 
2.25.1


