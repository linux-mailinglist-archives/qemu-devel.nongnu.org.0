Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6A24572C3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:22:24 +0100 (CET)
Received: from localhost ([::1]:38072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6ed-0001Hk-H4
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oh-0005gU-3d
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:56 -0500
Received: from [2a00:1450:4864:20::329] (port=35732
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oe-0004JM-FL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so10907056wme.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2XuECnwmIlTjimsEDqjq8IwlAadDWPgA7pn8s2qqz8=;
 b=UG1NEoVRef2kfLklfUn8egladmJq3uCfXP9iAW79Vmc/IRLToUAaOsaAvwCN8ucH9W
 pFIwhMXIoi5koVQ3wTzTh2xch8oN+COfgdO2XDZ1uImfd0nXaWAh97SiJ7igYvcQlC+Y
 2oHv0w0w39mcqzkvwEbTy6xpjHWUDX1ptcKE4lbeaNPuPnAizLVU6Dqhz6Vi6z1xiDFv
 Zf8kLa3KoDr4EsDwD6u66r6t9omQKybfdO/M2MsEiyrf8/X0sOgu+DU5EaNshPz8KSE4
 Npoi25R1Lh9xjM10c/RUEzpcbhRg4mTtWaS8rTGsDBlMH1qnpOfpNym0iNnkrzRCwQE2
 eHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2XuECnwmIlTjimsEDqjq8IwlAadDWPgA7pn8s2qqz8=;
 b=cJLxYNUwo36N/YMHKlPPfGCoRROP6EwabBVqS6YfhDXQf/OvXmg2Ih+4XGSMRukI6z
 23QBLhq9BaJO1+hadsHsacD33LfZGeuBHxT2cpjiYwY0g0vOIyt1CB8TOZmaj1PUH6Ij
 hxOGjqC9PKq4bJpNyxmvHjlAQn7HeoZ0p90/exgzZHnX8ROXl7ENZQKIqFzEw8U+i3rm
 34Dmi2nNTksAV93NdwEaLLVUeQhyaAdPDjtFW0kO4DH+AWcc3o6pZxM8qdB2e0lXlSlL
 C81QQ2uq6GxTRKRRBzDHkhmnPREzhwTmtJRq5+0YXPp/gCtdWxkBPJWo77CPEYb4on06
 e4Fw==
X-Gm-Message-State: AOAM533BGdgQBMmf9u/HTC5n0cnyLnf3AOMftG6sa+KunS9vo+aPCYHS
 LP3h2WtpfAsSZlIR+1a+1F/zMCOC9zpVl3Hpua4=
X-Google-Smtp-Source: ABdhPJwG+27dc8ct+8jvxdq7eCMZJ7wSkdezO2m9+eEatI3bxuE9QCdR8m2RHqII/95vwBGeHS/BJw==
X-Received: by 2002:a05:600c:3ba5:: with SMTP id
 n37mr893789wms.168.1637337950941; 
 Fri, 19 Nov 2021 08:05:50 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/35] target/ppc: Update fmadd for new flags
Date: Fri, 19 Nov 2021 17:04:45 +0100
Message-Id: <20211119160502.17432-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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

Now that vximz, vxisi, and vxsnan are computed directly by
softfloat, we don't need to recompute it.  This replaces the
separate float{32,64}_maddsub_update_excp functions with a
single float_invalid_op_madd function.

Fix VSX_MADD by passing sfprf to float_invalid_op_madd,
whereas the previous *_maddsub_update_excp assumed it true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 46 ++++++++++-------------------------------
 1 file changed, 11 insertions(+), 35 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 3a462e5596..fdf06f6dc5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -635,38 +635,15 @@ uint64_t helper_frim(CPUPPCState *env, uint64_t arg)
     return do_fri(env, arg, float_round_down);
 }
 
-#define FPU_MADDSUB_UPDATE(NAME, TP)                                    \
-static void NAME(CPUPPCState *env, TP arg1, TP arg2, TP arg3,           \
-                 unsigned int madd_flags, uintptr_t retaddr)            \
-{                                                                       \
-    if (TP##_is_signaling_nan(arg1, &env->fp_status) ||                 \
-        TP##_is_signaling_nan(arg2, &env->fp_status) ||                 \
-        TP##_is_signaling_nan(arg3, &env->fp_status)) {                 \
-        /* sNaN operation */                                            \
-        float_invalid_op_vxsnan(env, retaddr);                          \
-    }                                                                   \
-    if ((TP##_is_infinity(arg1) && TP##_is_zero(arg2)) ||               \
-        (TP##_is_zero(arg1) && TP##_is_infinity(arg2))) {               \
-        /* Multiplication of zero by infinity */                        \
-        float_invalid_op_vximz(env, 1, retaddr);                        \
-    }                                                                   \
-    if ((TP##_is_infinity(arg1) || TP##_is_infinity(arg2)) &&           \
-        TP##_is_infinity(arg3)) {                                       \
-        uint8_t aSign, bSign, cSign;                                    \
-                                                                        \
-        aSign = TP##_is_neg(arg1);                                      \
-        bSign = TP##_is_neg(arg2);                                      \
-        cSign = TP##_is_neg(arg3);                                      \
-        if (madd_flags & float_muladd_negate_c) {                       \
-            cSign ^= 1;                                                 \
-        }                                                               \
-        if (aSign ^ bSign ^ cSign) {                                    \
-            float_invalid_op_vxisi(env, 1, retaddr);                    \
-        }                                                               \
-    }                                                                   \
+static void float_invalid_op_madd(CPUPPCState *env, int flags,
+                                  bool set_fpcc, uintptr_t retaddr)
+{
+    if (flags & float_flag_invalid_imz) {
+        float_invalid_op_vximz(env, set_fpcc, retaddr);
+    } else {
+        float_invalid_op_addsub(env, flags, set_fpcc, retaddr);
+    }
 }
-FPU_MADDSUB_UPDATE(float32_maddsub_update_excp, float32)
-FPU_MADDSUB_UPDATE(float64_maddsub_update_excp, float64)
 
 #define FPU_FMADD(op, madd_flags)                                       \
 uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,                   \
@@ -678,8 +655,7 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,                   \
     flags = get_float_exception_flags(&env->fp_status);                 \
     if (flags) {                                                        \
         if (flags & float_flag_invalid) {                               \
-            float64_maddsub_update_excp(env, arg1, arg2, arg3,          \
-                                        madd_flags, GETPC());           \
+            float_invalid_op_madd(env, flags, 1, GETPC());              \
         }                                                               \
         do_float_check_status(env, GETPC());                            \
     }                                                                   \
@@ -2083,8 +2059,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags;  \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
-            tp##_maddsub_update_excp(env, xa->fld, b->fld,                    \
-                                     c->fld, maddflgs, GETPC());              \
+            float_invalid_op_madd(env, tstat.float_exception_flags,           \
+                                  sfprf, GETPC());                            \
         }                                                                     \
                                                                               \
         if (r2sp) {                                                           \
-- 
2.25.1


