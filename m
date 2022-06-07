Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDD6541646
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:49:08 +0200 (CEST)
Received: from localhost ([::1]:52942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyg8R-0002In-P4
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftH-0007h7-Mz
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft1-0007Bo-0K
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso16461281pjg.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Y1P1Y+Ffb//73mSlBoiFZFZX3qfQHSQssa2vHrkCbU=;
 b=e7s6XLU3e+TZeIlsfNcOEYyQpDmpnKxIhCX8e/s4WsAluW8iDW6yAtUSkPVrwHokYU
 xKxJfUQTPrd2So2zNtGkbMTwWmoofM71hlsU2S6mNC8/2VR01BPmxQYDPwDjyNSmCw9j
 1Tavx57VU0YoFDHjUCIy+DV9aZ1JyYYoogfJ/wbaF1uAW2KryA7/tE2RSlakiKkK998P
 I8NW3wSeiMf1uEq0qjv37ywAaXTjbkxJbDc0mA9NwU7PCHCA3opiUrSVTWDHy7hUCGK9
 k7gUNWdpiAYUCjx5fS5D3rj3Pf2ZLNc0XbfhBj8FSoG5I4D2SH6O6Q2oCsxeNODRgweU
 wmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Y1P1Y+Ffb//73mSlBoiFZFZX3qfQHSQssa2vHrkCbU=;
 b=pBO6bMwL5fqeyFJEPM2VnvhoakFCeEBOtpMM+tLZV3edZoHV1wPJza8O+GAiN5fvJO
 bYkF6uza+vAnwWLtCpV9hyvPwzlzytJSA8Z5eJ2z2X2qaSnKKFtY4fwX9G2umBy8Nq4W
 dWY94ulNxivMX6OqpNVodkHqlVmb4/4A3kAY5os+1qjQYo3OlJKgB47RYkzT+dDNtQzb
 S67CxiaWVHYVdg6z84q2grDPmhdg1/ra/CxhjMvlT1kH706pk9bS5uJUDeaHp0TaiAba
 U9OdL+tvotmNpXTSJf1x9de3ZjFLAwnwx6zK0wNe2VKiHBk2n2+jhmtlE9riOEZJNAhQ
 6yWg==
X-Gm-Message-State: AOAM530qHpIHvgPc2Ulfew9W5PdCHwfixW+uqSycTWykfvpYAiZSDLc0
 w7wp88DP1Y0/411m9T1SO1hvBQ3wqmDrgg==
X-Google-Smtp-Source: ABdhPJyNVgSSFSYg2lcXq7+1k94mLNnUutPsXNw7f9jZ0rDK/ijt4m3hckqHQlarKcE9y6jwjMsObg==
X-Received: by 2002:a17:90a:bc98:b0:1e8:6895:645e with SMTP id
 x24-20020a17090abc9800b001e86895645emr17990399pjr.131.1654633989714; 
 Tue, 07 Jun 2022 13:33:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 02/71] linux-user/aarch64: Introduce sve_vq
Date: Tue,  7 Jun 2022 13:31:57 -0700
Message-Id: <20220607203306.657998-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Add an interface function to extract the digested vector length
rather than the raw zcr_el[1] value.  This fixes an incorrect
return from do_prctl_set_vl where we didn't take into account
the set of vector lengths supported by the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Add sve_vq_cached rather than directly access hflags.
v3: Rename to sve_vq.
---
 linux-user/aarch64/target_prctl.h | 20 +++++++++++++-------
 target/arm/cpu.h                  | 11 +++++++++++
 linux-user/aarch64/signal.c       |  4 ++--
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 3f5a5d3933..1d440ffbea 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,7 +10,7 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
+        return sve_vq(env) * 16;
     }
     return -TARGET_EINVAL;
 }
@@ -25,18 +25,24 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
      */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
-        ARMCPU *cpu = env_archcpu(env);
         uint32_t vq, old_vq;
 
-        old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
-        vq = MAX(arg2 / 16, 1);
-        vq = MIN(vq, cpu->sve_max_vq);
+        old_vq = sve_vq(env);
 
+        /*
+         * Bound the value of arg2, so that we know that it fits into
+         * the 4-bit field in ZCR_EL1.  Rely on the hflags rebuild to
+         * sort out the length supported by the cpu.
+         */
+        vq = MAX(arg2 / 16, 1);
+        vq = MIN(vq, ARM_MAX_VQ);
+        env->vfp.zcr_el[1] = vq - 1;
+        arm_rebuild_hflags(env);
+
+        vq = sve_vq(env);
         if (vq < old_vq) {
             aarch64_sve_narrow_vq(env, vq);
         }
-        env->vfp.zcr_el[1] = vq - 1;
-        arm_rebuild_hflags(env);
         return vq * 16;
     }
     return -TARGET_EINVAL;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 015ce12fe2..6e35e30000 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3286,6 +3286,17 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     return EX_TBFLAG_ANY(env->hflags, MMUIDX);
 }
 
+/**
+ * sve_vq
+ * @env: the cpu context
+ *
+ * Return the VL cached within env->hflags, in units of quadwords.
+ */
+static inline int sve_vq(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, VL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7de4c96eb9..7da0e36c6d 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -315,7 +315,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_SVE_MAGIC:
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+                vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
                 if (!sve && size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
@@ -434,7 +434,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     /* SVE state needs saving only if it exists.  */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        vq = sve_vq(env);
         sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
-- 
2.34.1


