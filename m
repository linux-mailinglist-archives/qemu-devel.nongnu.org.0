Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79830392618
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:23:26 +0200 (CEST)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7YL-0001ma-Jc
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PZ-0001cr-07
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:22 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PS-0007Es-9c
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:20 -0400
Received: by mail-pg1-x535.google.com with SMTP id t193so2728299pgb.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fxhT5T2jN/8rQ+o7wJeAhpV/9V3uAlnXkzPAEXr9qP0=;
 b=DHI9VWeaQcvvzr+boGdZjn0q24hRoQP9IM8EiaiiCMf+AnpvOsc8r4VlwPWwSTSI3j
 NrP8QJVITUXpt1S0BHuUMtDiHjXBFdItRB2YBxXCBe7f4WScY3eBs73mBgxPDBIdMk9F
 6lFc7GzjMJeLJImnzRyhmMYb29Nvh0qRgcS2vGSStMNQywYeAlPBbvu6NOIdatIqorpq
 QliEQAxB8BzteYsoxt5+HwQsVK45rR7KbHp3jq8Or+O57MzRi8s4EefLjOk6VMVCfa9t
 63wyQ11G4oGFL0O0IG2HC1Mr8LjZRsX+mNe0nrK7udI9RafYqnIOLhJJxTBHssonTn+A
 UrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxhT5T2jN/8rQ+o7wJeAhpV/9V3uAlnXkzPAEXr9qP0=;
 b=NtAAlRfBYis2hmbwXY9tfLsxRMzAKB/jKs24Qn684XmWcAFak7YW2KpOOCJgmoz4Nj
 Re5bd4ELgZBSXp2oNl3TkgvT8zVDuITsaAcxZWRQUFoq3nC1owitSyxCpDe2ZBf+Kkj8
 ZLmwY1EtO5TzZnyICgF5kjz4z/9KFsl//DXxaVxiV5b1vO7GJJPbGM/ovqU0t6Cpiwvf
 zNpnNY8XSd2HVVDylUzEIHIomTfs20frdCyjavB7tUk3BXBtla7hrALbudN3oiJbbRBH
 h2xSZddTDdtsRPIT9eJ0huksoxntqj1awKdGjst5Ar3DNOc9HCjGG+JnOBHI2Bq1yiyN
 UsgA==
X-Gm-Message-State: AOAM530anAq3o6I+TxpWheBy9GT9UQKgPa8ni8ZCjK9H8nj7Qx1g7mCn
 q5WPwXd9gTEbV9phcXO4UJvoEhfC0yaC3A==
X-Google-Smtp-Source: ABdhPJzZ8W7/Vn4Bb2llfxFMLXpLVeFM2sQSY8urIv3gDNVR08K/353CvW4Uf9UaskemIU6PxTKn+A==
X-Received: by 2002:a62:2a14:0:b029:263:20c5:6d8c with SMTP id
 q20-20020a622a140000b029026320c56d8cmr1449434pfq.23.1622088852973; 
 Wed, 26 May 2021 21:14:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] target/mips: Drop denormal operand to update_msacsr
Date: Wed, 26 May 2021 21:14:05 -0700
Message-Id: <20210527041405.391567-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: alex.bennee@linaro.org, Yongbok Kim <yongbok.kim@mips.com>,
 mmorrell@tachyum.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The comment about not signaling all underflow cases is
almost certainly incorrect.  It has been there since the
initial commit of the file.

There is a bit of code below that sets underflow with
float_flag_oflush_denormal, which is probably the fix
for whatever the original case may have been.

Cc: Yongbok Kim <yongbok.kim@mips.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/msa_helper.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index ffe6e630ed..b752373bce 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -6205,7 +6205,7 @@ static int ieee_to_mips_xcpt_msa(int ieee_xcpt)
     return mips_xcpt;
 }
 
-static int update_msacsr(CPUMIPSState *env, int action, int denormal)
+static int update_msacsr(CPUMIPSState *env, int action)
 {
     int ieee_exception_flags;
     int mips_exception_flags = 0;
@@ -6215,10 +6215,6 @@ static int update_msacsr(CPUMIPSState *env, int action, int denormal)
     ieee_exception_flags = get_float_exception_flags(
                                &env->active_tc.msa_fp_status);
 
-    /* QEMU softfloat does not signal all underflow cases */
-    if (denormal) {
-        ieee_exception_flags |= float_flag_underflow;
-    }
     if (ieee_exception_flags) {
         mips_exception_flags = ieee_to_mips_xcpt_msa(ieee_exception_flags);
     }
@@ -6469,7 +6465,7 @@ static int32_t float64_to_q32(float64 a, float_status *status)
             cond = float ## BITS ## _ ## OP ## _quiet(ARG1, ARG2, status);  \
         }                                                                   \
         DEST = cond ? M_MAX_UINT(BITS) : 0;                                 \
-        c = update_msacsr(env, CLEAR_IS_INEXACT, 0);                        \
+        c = update_msacsr(env, CLEAR_IS_INEXACT);                           \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
@@ -7043,13 +7039,6 @@ void helper_msa_fsne_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     compare_ne(env, pwd, pws, pwt, df, 0, GETPC());
 }
 
-#define float16_is_zero(ARG) 0
-#define float16_is_zero_or_denormal(ARG) 0
-
-#define IS_DENORMAL(ARG, BITS)                      \
-    (!float ## BITS ## _is_zero(ARG)                \
-    && float ## BITS ## _is_zero_or_denormal(ARG))
-
 #define MSA_FLOAT_BINOP(DEST, OP, ARG1, ARG2, BITS)                         \
     do {                                                                    \
         float_status *status = &env->active_tc.msa_fp_status;               \
@@ -7057,7 +7046,7 @@ void helper_msa_fsne_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
                                                                             \
         set_float_exception_flags(0, status);                               \
         DEST = float ## BITS ## _ ## OP(ARG1, ARG2, status);                \
-        c = update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));                 \
+        c = update_msacsr(env, 0);                                          \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
@@ -7193,7 +7182,7 @@ void helper_msa_fdiv_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
                                                                             \
         set_float_exception_flags(0, status);                               \
         DEST = float ## BITS ## _muladd(ARG2, ARG3, ARG1, NEGATE, status);  \
-        c = update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));                 \
+        c = update_msacsr(env, 0);                                          \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
@@ -7312,7 +7301,7 @@ void helper_msa_fexp2_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
                                                                             \
         set_float_exception_flags(0, status);                               \
         DEST = float ## BITS ## _ ## OP(ARG, status);                       \
-        c = update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));                 \
+        c = update_msacsr(env, 0);                                          \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
@@ -7365,7 +7354,7 @@ void helper_msa_fexdo_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
                                                                             \
         set_float_exception_flags(0, status);                               \
         DEST = float ## BITS ## _ ## OP(ARG, status);                       \
-        c = update_msacsr(env, CLEAR_FS_UNDERFLOW, 0);                      \
+        c = update_msacsr(env, CLEAR_FS_UNDERFLOW);                         \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## XBITS(status) >> 6) << 6) | c;           \
@@ -7416,7 +7405,7 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
                                                                             \
         set_float_exception_flags(0, status);                               \
         DEST = float ## BITS ## _ ## OP(ARG1, ARG2, status);                \
-        c = update_msacsr(env, 0, 0);                                       \
+        c = update_msacsr(env, 0);                                          \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
@@ -7672,7 +7661,7 @@ void helper_msa_fclass_df(CPUMIPSState *env, uint32_t df,
                                                                             \
         set_float_exception_flags(0, status);                               \
         DEST = float ## BITS ## _ ## OP(ARG, status);                       \
-        c = update_msacsr(env, CLEAR_FS_UNDERFLOW, 0);                      \
+        c = update_msacsr(env, CLEAR_FS_UNDERFLOW);                         \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
@@ -7780,8 +7769,7 @@ void helper_msa_fsqrt_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         DEST = float ## BITS ## _ ## div(FLOAT_ONE ## BITS, ARG, status);   \
         c = update_msacsr(env, float ## BITS ## _is_infinity(ARG) ||        \
                           float ## BITS ## _is_quiet_nan(DEST, status) ?    \
-                          0 : RECIPROCAL_INEXACT,                           \
-                          IS_DENORMAL(DEST, BITS));                         \
+                          0 : RECIPROCAL_INEXACT);                          \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
@@ -7897,7 +7885,7 @@ void helper_msa_frint_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
                                   (~float_flag_inexact),                    \
                                   status);                                  \
                                                                             \
-        c = update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));                 \
+        c = update_msacsr(env, 0);                                          \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
             DEST = ((FLOAT_SNAN ## BITS(status) >> 6) << 6) | c;            \
-- 
2.25.1


