Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E822457332
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:37:59 +0100 (CET)
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6ti-0008Kb-CQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:37:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6PM-00076Q-Ng
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:39 -0500
Received: from [2a00:1450:4864:20::432] (port=38449
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6P6-0004Xy-7v
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id u18so18987297wrg.5
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oeLIswcSVdWllblb8zsAtciTHxrmWmXEMgr/6V/SjGY=;
 b=Q7pdQHmy5rxjhV1AMuFC1fHPaIybjaA0wc0KSuopEiDLcp5azdiGJFHrSbAmCIRNJc
 0dF1hbo6pWTjgnBJpdP5cechtaKYcSdBp6OLdTKJAC2iW4pIWOXyfDlhTrkbtL9D5Ldr
 Tugyf7A0qJW8m6rX6XslEmQVbUwR4Txb0HRSfEvOBQPw2LTE4FZi3Ty5uqcvCrFxQRJF
 3cXwt4ChounxnsV5WKuPrtHa8/j7XsQWgAlqN+A8syAB3DX2Mbye6hMYuHTy/MbGNWc9
 apLG0TOv78LEAouV3zeMhQgqZJnv7DRI2WMae7yH6hfFVgAzdvopYyhpQBzFBj2oT0it
 F1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oeLIswcSVdWllblb8zsAtciTHxrmWmXEMgr/6V/SjGY=;
 b=JNNCEqK8Z5WBQ/9/3fneGQ5fVmgwxOnq+jmJNi2JurVYWQEz6WJ6mwnRhAzWoyKxKR
 3acCMTLgaKyTa2hAn88kGXHCZieKDuqyDhaytiPQA1LjgIMBUot0RYW8yIjDXpiFc1oZ
 4bZZUvQgBekCmQUtW+L0hw3DjlbTJiSBvcFhY3q244joYMBvfwxgk151KyEOuUKXIukO
 u76vggEHFntH50VzaX0TqIo9YnPu0ymG0j5+ItCRIC9X4FM5M+HmU9lWicEbsYoQlUXj
 bC7rtQAsC7Oxj93FZp/PPEH6XUY9h5enPLEI5bNvEv28tP6vKelsCKHXuD699NkNvn9f
 Kl1A==
X-Gm-Message-State: AOAM531+TJHRNYyaMOxdnK5DZjxWpX1hQmUV4xxknVAkxQwj7plVGBZu
 paUsZ+9UsobSrVhUYnJcLATBIqYtNb0xf190j9M=
X-Google-Smtp-Source: ABdhPJwYA/7EnXBmm+Cmv5gLfu6JSzu9NwJoVlP1Cbuy/x2Vua0LWjEeIUSWKmVyyrxSoSCi4RVXHg==
X-Received: by 2002:adf:db47:: with SMTP id f7mr8560886wrj.113.1637337977308; 
 Fri, 19 Nov 2021 08:06:17 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/35] target/ppc: Add helper for frsqrtes
Date: Fri, 19 Nov 2021 17:04:59 +0100
Message-Id: <20211119160502.17432-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no double-rounding bug here, because the result is
merely an estimate to within 1 part in 32, but perform the
operation with float64r32_div for consistency.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                |  1 +
 target/ppc/fpu_helper.c            | 19 +++++++++++++++++++
 target/ppc/translate/fp-impl.c.inc |  3 +--
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9810d416cf..48d12233ea 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -113,6 +113,7 @@ DEF_HELPER_2(fsqrts, f64, env, f64)
 DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
 DEF_HELPER_2(frsqrte, i64, env, i64)
+DEF_HELPER_2(frsqrtes, i64, env, i64)
 DEF_HELPER_4(fsel, i64, env, i64, i64, i64)
 
 DEF_HELPER_FLAGS_2(ftdiv, TCG_CALL_NO_RWG_SE, i32, i64, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 6278d61d36..cb511f2050 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -848,6 +848,25 @@ float64 helper_frsqrte(CPUPPCState *env, float64 arg)
     return retd;
 }
 
+/* frsqrtes  - frsqrtes. */
+float64 helper_frsqrtes(CPUPPCState *env, float64 arg)
+{
+    /* "Estimate" the reciprocal with actual division.  */
+    float64 rets = float64_sqrt(arg, &env->fp_status);
+    float64 retd = float64r32_div(float64_one, rets, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_sqrt(env, flags, 1, GETPC());
+    }
+    if (unlikely(flags & float_flag_divbyzero)) {
+        /* Reciprocal of (square root of) zero.  */
+        float_zero_divide_excp(env, GETPC());
+    }
+
+    return retd;
+}
+
 /* fsel - fsel. */
 uint64_t helper_fsel(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
                      uint64_t arg3)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 17b4d46040..9056a773cb 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -212,8 +212,7 @@ static void gen_frsqrtes(DisasContext *ctx)
     t1 = tcg_temp_new_i64();
     gen_reset_fpstatus();
     get_fpr(t0, rB(ctx->opcode));
-    gen_helper_frsqrte(t1, cpu_env, t0);
-    gen_helper_frsp(t1, cpu_env, t1);
+    gen_helper_frsqrtes(t1, cpu_env, t0);
     set_fpr(rD(ctx->opcode), t1);
     gen_compute_fprf_float64(t1);
     if (unlikely(Rc(ctx->opcode) != 0)) {
-- 
2.25.1


