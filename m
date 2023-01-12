Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA56666FAA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:31:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFulc-0002ng-Nj; Thu, 12 Jan 2023 05:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFula-0002nG-5P
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:25:02 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulY-0000IV-EQ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:25:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id t5so13186631wrq.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Em3cdaU0A4mDO/4c/HA3b5yoakmz2M4KDrzcG5G3fHE=;
 b=yKyEQ4SVE2qG6ILL25rghQEbX940+Dd59c6uKBanddX/AK8NI9qbHtXS0BUqglQyyI
 +DVVYhGVUhE/s/9cxqZ1VgGEKvWvNx7gwm0GeSfnBFydYpfPmt2RMqvf/1A9JJEd3n1G
 kbhOR24LAaqR2Y8YyHYbV79u1LcXmgsytJM6mCb5Katj88nm6AHu9BPMiFaWQNa2K8vc
 k31E7rutyz3kqFHFz3Qpr5qtwT6cIF275FWZG2K4f01in0+xcuRC47M7WC6hf589o956
 AZkLEtoFfwWfrS+e/0x+X92Y/F31yErzt51E/VBOLpez/Z9F8i04Dmd/yG6rI0GZjc6c
 ddcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Em3cdaU0A4mDO/4c/HA3b5yoakmz2M4KDrzcG5G3fHE=;
 b=RP+x6Pn4v3CBwNMnoBVgy/y8qPSvVX9LE/foyIATQUHsOHyJ0sCCI0iRd8NXOiC0aW
 UxSjJy+jYJpWtgeCE5FieEZ/7HP1SboJk0tWJ0jyM4P91YL+wff8s2WjIdexFrxTc7HR
 3fLEi7s2ZtFOBoZsCpaPe3nv8sPiSneIfUDIas0KY26oT8RJ1gbZLP7Ua8kM7fc4xSSK
 W1TXgo583IiEf0IBepWxIfMyTgE4qdJPcA+E2l54XlU7P5w1q7Kl87zi7PIGxg5uV+IZ
 3Ok+HkgCo32pPn+Q5drvn/RtcXyRgaBxVhjQl77BdxSCy5BXifhMXHdXlwcPlDh1nCuS
 xBTg==
X-Gm-Message-State: AFqh2kqMmhWSLfg1+ea1P1epKA4y3rgMhkcdpDy4GPxnFv5ZFIEkRtzY
 HIq9KP7l7i85UWemT/i/oUJNNdLyAKblcZEs
X-Google-Smtp-Source: AMrXdXsqe9SffNChchUXLDZY29HmQDGaVF8IVpZ2RQBahhxLVwxNb6RidOSf7AVYcNcD52oXndemLA==
X-Received: by 2002:a5d:5a19:0:b0:242:2088:1546 with SMTP id
 bq25-20020a5d5a19000000b0024220881546mr63860138wrb.61.1673519098883; 
 Thu, 12 Jan 2023 02:24:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d534a000000b00272c0767b4asm16149711wrv.109.2023.01.12.02.24.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:24:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/7] target/arm/sme: Reset SVE state in aarch64_set_svcr()
Date: Thu, 12 Jan 2023 11:24:33 +0100
Message-Id: <20230112102436.1913-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Move arm_reset_sve_state() calls to aarch64_set_svcr().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/aarch64/cpu_loop.c |  1 -
 linux-user/aarch64/signal.c   |  8 +-------
 target/arm/cpu.h              |  1 -
 target/arm/helper.c           | 13 +++++++++++++
 target/arm/sme_helper.c       | 10 ----------
 5 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index d53742e10b..5e93d27d8f 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -96,7 +96,6 @@ void cpu_loop(CPUARMState *env)
             aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
             if (FIELD_EX64(env->svcr, SVCR, SM)) {
                 arm_rebuild_hflags(env);
-                arm_reset_sve_state(env);
             }
             ret = do_syscall(env,
                              env->xregs[8],
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index b6e4dcb494..a326a6def5 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -665,14 +665,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         env->btype = 2;
     }
 
-    /*
-     * Invoke the signal handler with both SM and ZA disabled.
-     * When clearing SM, ResetSVEState, per SMSTOP.
-     */
+    /* Invoke the signal handler with both SM and ZA disabled. */
     aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
-    if (FIELD_EX64(env->svcr, SVCR, SM)) {
-        arm_reset_sve_state(env);
-    }
     if (env->svcr) {
         arm_rebuild_hflags(env);
     }
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0484da3322..a471add499 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1124,7 +1124,6 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask);
-void arm_reset_sve_state(CPUARMState *env);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b5626627a1..b655dde27d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6722,11 +6722,24 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* ResetSVEState */
+static void arm_reset_sve_state(CPUARMState *env)
+{
+    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
+    /* Recall that FFR is stored as pregs[16]. */
+    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
+    vfp_set_fpcr(env, 0x0800009f);
+}
+
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
 {
     uint64_t change = (env->svcr ^ new) & mask;
 
     env->svcr ^= change;
+
+    if (change & R_SVCR_SM_MASK) {
+        arm_reset_sve_state(env);
+    }
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 94dc084135..f73bf4d285 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -29,22 +29,12 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
-/* ResetSVEState */
-void arm_reset_sve_state(CPUARMState *env)
-{
-    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
-    /* Recall that FFR is stored as pregs[16]. */
-    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
-    vfp_set_fpcr(env, 0x0800009f);
-}
-
 void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
 {
     if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
         return;
     }
     aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
-    arm_reset_sve_state(env);
     arm_rebuild_hflags(env);
 }
 
-- 
2.38.1


