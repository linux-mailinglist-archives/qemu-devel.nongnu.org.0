Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08673D9ACD
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:07:37 +0200 (CEST)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uWO-0004oq-Gn
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCt-0004o2-Pk
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:27 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCs-0002kw-27
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id z3so3538066plg.8
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XT0R3qxdD5eZBJLk1lojYkK8JN65pbr+dOyaZNR/6oQ=;
 b=T34DP9v4G84dsM0YnA3l82zYlkL7TXZ5Uy/W2sz+q9juOzIfh3T0Dhit4iqUxH0cXq
 tc0ci2KqORfZU5PFSda56P5aR5OusCUSGwmz9ryZ0diG+7j9QV6WwZWHNLu+wucynuW8
 XCTkjEQGn1wEmy3ZzrXPsBNC/QdeFWH8XdVs7maBHqGkST99CtHbFKU14Q4bmd0Ul9gt
 BgEx6UUUjbpbKAXkjebRf+cmBb3Obfoy+i3JdBElDyEKdJ58AaC2NyJEuCYVnKlNEKFY
 XQnfoVDhCGxXRxhBF2+e1KkQwPhPeQq86Pjk8wYkMPm32iIYdnGoMp6yUVbveTFtjXgi
 6G2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XT0R3qxdD5eZBJLk1lojYkK8JN65pbr+dOyaZNR/6oQ=;
 b=pRXwxdYuTDy2V3dWMq80b1oeIfGciZV1Y/O/OxA3r8SPrt3xNW/ISUdfdy9DDhHGgf
 hXgtKHIS9BPGDpPPD3dJI8rODl/hNwhTZwfsg4G7c+2zEcMfcER09HThyd70c6vK4qAF
 OOy6f0hCso9yfh52YaQX7rBKYpWLlwCvyxLpbsfs2zQ1O5h9FctP9myO7CqqKUCyN0dq
 nmAiQ2SslaOpQwixiw8kqtKsF0Be8TgK8tdrmGSPVeE3j3KpjqYluelVC2i36YglBF+1
 20xTS+JSGlaF5NvN3HQ3vczcsDuIQDO8K9U2wQd2UUm9CR8r3MIjVJOADn1EAtpijmkZ
 Asvg==
X-Gm-Message-State: AOAM53289ZqSkWiRdLjfYpRFTWfPGj+5stUWYqjUWd2sRnmVAxSX2HnP
 TH2tTeX37l3Y94jS+CHtXgDG9fFTJoxUog==
X-Google-Smtp-Source: ABdhPJzIme60XUYgBD2aip27YJrKS1jtPIRPYAh2VSc3AvYjsbw2AHsDphbQuXBFj2d/cPa5Q26bpA==
X-Received: by 2002:a17:902:fe12:b029:12b:e52f:3ace with SMTP id
 g18-20020a170902fe12b029012be52f3acemr2143901plj.38.1627519644767; 
 Wed, 28 Jul 2021 17:47:24 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 29/43] target/ppc: Use MO_128 for 16 byte atomics
Date: Wed, 28 Jul 2021 14:46:33 -1000
Message-Id: <20210729004647.282017-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 171b216e17..540efa858f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3461,10 +3461,12 @@ static void gen_std(DisasContext *ctx)
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
@@ -4066,11 +4068,11 @@ static void gen_lqarx(DisasContext *ctx)
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
@@ -4121,7 +4123,7 @@ static void gen_stqcx_(DisasContext *ctx)
 
     if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_Q) | MO_ALIGN_16);
+            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN);
             if (ctx->le_mode) {
                 gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
                                              EA, lo, hi, oi);
-- 
2.25.1


