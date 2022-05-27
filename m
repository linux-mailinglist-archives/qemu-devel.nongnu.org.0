Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7753675D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:13:13 +0200 (CEST)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufOa-0004rv-7U
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYq-0007lS-1L
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:44 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYl-0003fn-7i
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:43 -0400
Received: by mail-pg1-x533.google.com with SMTP id s68so4548880pgs.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Tb3jrtughSCfdEcxDgiEe9Xl6N1iTWei8jPIPKCx/Q=;
 b=CEiY6gmNYnILCJMCamB2z9wCHsl66PVH3xSSvocTvW8Pdo0HRxqA8A4Jk3SRn2sFlf
 nmIZMVG+VyEi3mgKYKnJ+dDP1HzhLneAsddI5+kvdQCjvs37LySv+PNLiptB/XB8R6fk
 6naOgH19S9ADKk3atuXrSSGjPcVt1cCoNv/ZC6N/m6Dev45XKPbvtdKDJF77Mg+BbIQq
 rQVE+9bny29JBtMB7jv39MN55uC9TFF0EpZnvT3BjKOTa6tGJk4xK9OCjImCGlKOQYxv
 uM4MexI8n4p6UwWovmaXUxN4/iZ3u7xRP0CreRqkyRxiXXDSSSnNEjUrrFNWR0oGQFKn
 wI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Tb3jrtughSCfdEcxDgiEe9Xl6N1iTWei8jPIPKCx/Q=;
 b=tkAv6Yc4xF2bwwnpTh/W1yD+ZMVb+awml+0+y/NLhpVWohRdUvpalFaLsWBy5fM4RA
 ZQLlBFsiNOeTJYtID7ppFQlw24+4umGVV9B8iqZu7upeZ95K0nH25i3tPAIJUl46fU2i
 KWn0mekeaCG1zb5KcbGzMi9j8c6bgYGR6qpcG6vzkQpdXK7P7LFT35xHz64x+No6KtQB
 sE7ZE2nlhODSw2pKJjvouBPOCrQvToMndFpziWU6ZLU9GyHBbH+6hvxsL3hVmC3UqqPn
 SNaTmS3knC0ppLkm4fXzZ3Sr1WqIN29myctwqbJx8jEqh5w7GhlhN+2j1xAiSv4MNJXj
 QN2w==
X-Gm-Message-State: AOAM533fVJV8JhMyPEGM4j4s3lQCCQP+aVpZlqg+R2kjtRfIV0/zmCwM
 xfCZoF9+ID2927Qm0/bDXtT5McTynEs+cg==
X-Google-Smtp-Source: ABdhPJysOyw1WbLzSdZIUoL2aQq1lqOVqZ2cSfd8UPuAUZN4cxthS+Oz0oGPUhBvIR1BM7vPh88NOA==
X-Received: by 2002:a05:6a00:2918:b0:512:e4b5:60fb with SMTP id
 cg24-20020a056a00291800b00512e4b560fbmr45450494pfb.50.1653675577882; 
 Fri, 27 May 2022 11:19:37 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 031/114] target/arm: Rename do_zzz_fn to gen_gvec_fn_arg_zzz
Date: Fri, 27 May 2022 11:17:44 -0700
Message-Id: <20220527181907.189259-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Rename the function to match gen_gvec_fn_zzz,
and move to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3af4626e58..1b3afcc24c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -274,6 +274,12 @@ static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
     return true;
 }
 
+static bool gen_gvec_fn_arg_zzz(DisasContext *s, GVecGen3Fn *fn,
+                                arg_rrr_esz *a)
+{
+    return gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+}
+
 /* Invoke a vector expander on four Zregs.  */
 static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
                              int esz, int rd, int rn, int rm, int ra)
@@ -370,29 +376,24 @@ const uint64_t pred_esz_masks[4] = {
  *** SVE Logical - Unpredicated Group
  */
 
-static bool do_zzz_fn(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *gvec_fn)
-{
-    return gen_gvec_fn_zzz(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
-}
-
 static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_and);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_and, a);
 }
 
 static bool trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_or);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_or, a);
 }
 
 static bool trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_xor);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_xor, a);
 }
 
 static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_andc);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_andc, a);
 }
 
 static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
@@ -707,32 +708,32 @@ static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
 
 static bool trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_add);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_add, a);
 }
 
 static bool trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_sub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sub, a);
 }
 
 static bool trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_ssadd);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ssadd, a);
 }
 
 static bool trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_sssub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sssub, a);
 }
 
 static bool trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_usadd);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_usadd, a);
 }
 
 static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_ussub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ussub, a);
 }
 
 /*
-- 
2.34.1


