Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3396842C8B6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:32:32 +0200 (CEST)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maj3H-0001Dx-74
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitz-0003pG-I2
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:55 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitr-00030x-Vh
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:51 -0400
Received: by mail-pl1-x62b.google.com with SMTP id x8so2402972plv.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m31KIJw/lcLJxFk5HRMhG0LaXmCEuUD4FjCNknqYFfc=;
 b=oeJQwUSO9UdADn0cpOrNekaNIRjl0tTpSnYpmj6ZLGnaSR7lw8Hme1QX0yzcIJq+tG
 yrN34k55VlnL3vR+mM+CVUiLJ0ViqSUlg3aZcIaqSnXRNyE3eMCwLQcovSz7ETTIv9a5
 Lsh323IPIQTjPHhtB7TSzsb1sj+qoCC5BJ/fa/7FXPD369PRJWTPF7P5GrgVHwrBGNfM
 276/ZjKpq+DaoM96dfqKQyME2ggml35k7k1u9uozW1ASFFqBD271V4dYJYToyBcvCb2D
 NxrLo04WEBw8q2q5V7DRHe6qkjYwJ9wYgihdZnm7nIMnPDJ85r1EfuPXUrNRbzt3sHwu
 /e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m31KIJw/lcLJxFk5HRMhG0LaXmCEuUD4FjCNknqYFfc=;
 b=68HbBkPMQZNTl5fvQPa6WTEi7eaklt+EnGc4R2nzc974lfNhIUaQqfkNzKo0cSAY+J
 qyBFh/2saveOaxnc3B0+arGlNC6TRJ1Jwh7IOki46vGp2z+DDYWFVdpOWe+gUQLBS1ci
 jexeoyqutY0tko3YLgfVU0cfJ6wDscup0IYldoPf1vPoO4iU2BMrT6M6GFFKZxXM85Bw
 KGtNPUgVsxjp2XV/2tQRK5ZViG91N57u6UrGJaNKbkf+E3Lvj1M7Oqjrf66bdxSquZaT
 +2cjdjhXpX54nxAIELcLWt7uPy5HH8+vY8NJbyNFAl2ADxY5ubuI12O0oBtbTFwCeKMR
 jHuA==
X-Gm-Message-State: AOAM532kGKH6LqdKWR4S+LBExo/rI1JvSiKkXVFT7D+86v3JnJHNcr3d
 e4b+rR8/ZfMv2LlnOYTGj+YfyoOyy42MpA==
X-Google-Smtp-Source: ABdhPJyeaNj4FHhT6y1Lh2C+VppFMJy1ZXJ/GrFtvvl/NCw3DrS0GnEHDA2hBDnXkbvpCS1EshYzMg==
X-Received: by 2002:a17:90a:a41:: with SMTP id
 o59mr15362292pjo.243.1634149366647; 
 Wed, 13 Oct 2021 11:22:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] target/ppc: Use MO_128 for 16 byte atomics
Date: Wed, 13 Oct 2021 11:22:28 -0700
Message-Id: <20211013182239.991127-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-ppc@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b985e9e55b..9ca78ee156 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3462,10 +3462,12 @@ static void gen_std(DisasContext *ctx)
             if (HAVE_ATOMIC128) {
                 TCGv_i32 oi = tcg_temp_new_i32();
                 if (ctx->le_mode) {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ, ctx->mem_idx));
+                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128,
+                                                        ctx->mem_idx));
                     gen_helper_stq_le_parallel(cpu_env, EA, lo, hi, oi);
                 } else {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ, ctx->mem_idx));
+                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128,
+                                                        ctx->mem_idx));
                     gen_helper_stq_be_parallel(cpu_env, EA, lo, hi, oi);
                 }
                 tcg_temp_free_i32(oi);
@@ -4067,11 +4069,11 @@ static void gen_lqarx(DisasContext *ctx)
         if (HAVE_ATOMIC128) {
             TCGv_i32 oi = tcg_temp_new_i32();
             if (ctx->le_mode) {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ | MO_ALIGN_16,
+                tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128 | MO_ALIGN,
                                                     ctx->mem_idx));
                 gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
             } else {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ | MO_ALIGN_16,
+                tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128 | MO_ALIGN,
                                                     ctx->mem_idx));
                 gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
             }
@@ -4122,7 +4124,7 @@ static void gen_stqcx_(DisasContext *ctx)
 
     if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_Q) | MO_ALIGN_16);
+            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN);
             if (ctx->le_mode) {
                 gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
                                              EA, lo, hi, oi);
-- 
2.25.1


