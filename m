Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C993F0BE9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:39:43 +0200 (CEST)
Received: from localhost ([::1]:42252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRPa-00011p-4W
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9p-00078p-Cp
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:25 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9m-0002iS-Cz
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:25 -0400
Received: by mail-pl1-x630.google.com with SMTP id f3so2464027plg.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gNee4hhTlvWkz/5tdoJ4exWIgD810vPDkwtmNEyoiEo=;
 b=ET9mRQrXX4OayrWD1irhdP2pXQdDLnGPQe0+XZj50BKPe4Q5xi05RfiL6JoTBKCFwM
 Hu1dL+Qrrg5Qb1kL6vV4kN1AAWXLB9E94iEvOWzHbElPy0OEpEH9Uc8ZdEedQhR30xl2
 1Yfn/lhicAd1ZXbDb4zrmJVYZ2t/9vw0GQKbdaHee0NcIRYhE1fTo80O1vi1PFbl6rEl
 t1qR1IP76WIbqyPmBw6N6+hQ7tOqX40i3sqz1ATi4KxcZ09opkabXuc2T6d4eF7ie43a
 U9MRzBCGpqg++ZLCAjMrpD/dzjWdWlKazsIiKbGcJfG580+5CN3tojhVIEm4TbcbQ+zR
 gtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gNee4hhTlvWkz/5tdoJ4exWIgD810vPDkwtmNEyoiEo=;
 b=mJkIThBuEBU/itq1N4ryhFENEtZawXdDCyQ/QwBCsq94h5hAfOY31VS1pbHo7kQ+oc
 d7MvoA0KKJWsQwqNSHt2m0csg49LncNIuEIPFyMU4F8WD3wZEN0RTyntOMQDoZvWA4qD
 2JQaqoY+g4NC5Sk2f/htBniUnENx3oV4NokkF3XfhpSLG1RSGuQxM5cMBbsWUtTKs5Ma
 +pS0J6njmnR9OnVGhbbtJ95djxU4Cvd/HcFZQeTFblxW45g/2av80eFAqIg+c7hGAeOC
 pkmYq39E6NJHa0QMqjxWOlYimJbjDn0VYkcr3Kk2wd/RMvTAZ6C0fVfqeOcxBdbafWsi
 CNww==
X-Gm-Message-State: AOAM532a0ZIqbxPtfXcxQ77V2voOxugn1cfhGLUWw0WQbpf++nJIbvLf
 7WDFrcTFigWQ9zENmuUnKKu/JVb6ivGZHA==
X-Google-Smtp-Source: ABdhPJyWYBLWgJKTrA+PwMfubXN8PSt9APAnMUpJ3wFymanqXZ+izTGmnshW3fgMzy8jYh/MvpiHrg==
X-Received: by 2002:a17:90a:3ec6:: with SMTP id
 k64mr10912998pjc.94.1629314600942; 
 Wed, 18 Aug 2021 12:23:20 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 46/66] linux-user: Split out do_prctl and subroutines
Date: Wed, 18 Aug 2021 09:19:00 -1000
Message-Id: <20210818191920.390759-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the prctl constants are supposed to be generic, supply
any that are not provided by the host.

Split out subroutines for PR_GET_FP_MODE, PR_SET_FP_MODE,
PR_GET_VL, PR_SET_VL, PR_RESET_KEYS, PR_SET_TAGGED_ADDR_CTRL,
PR_GET_TAGGED_ADDR_CTRL.  Return EINVAL for guests that do
not support these options rather than pass them on to the host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  23 -
 linux-user/mips/target_syscall.h    |   6 -
 linux-user/mips64/target_syscall.h  |   6 -
 linux-user/syscall.c                | 644 ++++++++++++++++------------
 4 files changed, 359 insertions(+), 320 deletions(-)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 76f6c3391d..819f112ab0 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -20,27 +20,4 @@ struct target_pt_regs {
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
 
-#define TARGET_PR_SVE_SET_VL  50
-#define TARGET_PR_SVE_GET_VL  51
-
-#define TARGET_PR_PAC_RESET_KEYS 54
-# define TARGET_PR_PAC_APIAKEY   (1 << 0)
-# define TARGET_PR_PAC_APIBKEY   (1 << 1)
-# define TARGET_PR_PAC_APDAKEY   (1 << 2)
-# define TARGET_PR_PAC_APDBKEY   (1 << 3)
-# define TARGET_PR_PAC_APGAKEY   (1 << 4)
-
-#define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
-#define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
-# define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
-/* MTE tag check fault modes */
-# define TARGET_PR_MTE_TCF_SHIFT       1
-# define TARGET_PR_MTE_TCF_NONE        (0UL << TARGET_PR_MTE_TCF_SHIFT)
-# define TARGET_PR_MTE_TCF_SYNC        (1UL << TARGET_PR_MTE_TCF_SHIFT)
-# define TARGET_PR_MTE_TCF_ASYNC       (2UL << TARGET_PR_MTE_TCF_SHIFT)
-# define TARGET_PR_MTE_TCF_MASK        (3UL << TARGET_PR_MTE_TCF_SHIFT)
-/* MTE tag inclusion mask */
-# define TARGET_PR_MTE_TAG_SHIFT       3
-# define TARGET_PR_MTE_TAG_MASK        (0xffffUL << TARGET_PR_MTE_TAG_SHIFT)
-
 #endif /* AARCH64_TARGET_SYSCALL_H */
diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
index f59057493a..1ce0a5bbf4 100644
--- a/linux-user/mips/target_syscall.h
+++ b/linux-user/mips/target_syscall.h
@@ -36,10 +36,4 @@ static inline abi_ulong target_shmlba(CPUMIPSState *env)
     return 0x40000;
 }
 
-/* MIPS-specific prctl() options */
-#define TARGET_PR_SET_FP_MODE  45
-#define TARGET_PR_GET_FP_MODE  46
-#define TARGET_PR_FP_MODE_FR   (1 << 0)
-#define TARGET_PR_FP_MODE_FRE  (1 << 1)
-
 #endif /* MIPS_TARGET_SYSCALL_H */
diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
index cd1e1b4969..74f12365bc 100644
--- a/linux-user/mips64/target_syscall.h
+++ b/linux-user/mips64/target_syscall.h
@@ -33,10 +33,4 @@ static inline abi_ulong target_shmlba(CPUMIPSState *env)
     return 0x40000;
 }
 
-/* MIPS-specific prctl() options */
-#define TARGET_PR_SET_FP_MODE  45
-#define TARGET_PR_GET_FP_MODE  46
-#define TARGET_PR_FP_MODE_FR   (1 << 0)
-#define TARGET_PR_FP_MODE_FRE  (1 << 1)
-
 #endif /* MIPS64_TARGET_SYSCALL_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2d..6e630745fa 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6282,9 +6282,366 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
     return ret;
 }
 #endif /* defined(TARGET_ABI32 */
-
 #endif /* defined(TARGET_I386) */
 
+/*
+ * These constants are generic.  Supply any that are missing from the host.
+ */
+#ifndef PR_SET_NAME
+# define PR_SET_NAME    15
+# define PR_GET_NAME    16
+#endif
+#ifndef PR_SET_FP_MODE
+# define PR_SET_FP_MODE 45
+# define PR_GET_FP_MODE 46
+# define PR_FP_MODE_FR   (1 << 0)
+# define PR_FP_MODE_FRE  (1 << 1)
+#endif
+#ifndef PR_SVE_SET_VL
+# define PR_SVE_SET_VL  50
+# define PR_SVE_GET_VL  51
+# define PR_SVE_VL_LEN_MASK  0xffff
+# define PR_SVE_VL_INHERIT   (1 << 17)
+#endif
+#ifndef PR_PAC_RESET_KEYS
+# define PR_PAC_RESET_KEYS  54
+# define PR_PAC_APIAKEY   (1 << 0)
+# define PR_PAC_APIBKEY   (1 << 1)
+# define PR_PAC_APDAKEY   (1 << 2)
+# define PR_PAC_APDBKEY   (1 << 3)
+# define PR_PAC_APGAKEY   (1 << 4)
+#endif
+#ifndef PR_SET_TAGGED_ADDR_CTRL
+# define PR_SET_TAGGED_ADDR_CTRL 55
+# define PR_GET_TAGGED_ADDR_CTRL 56
+# define PR_TAGGED_ADDR_ENABLE  (1UL << 0)
+#endif
+#ifndef PR_MTE_TCF_SHIFT
+# define PR_MTE_TCF_SHIFT       1
+# define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_SYNC        (1UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_ASYNC       (2UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_MASK        (3UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TAG_SHIFT       3
+# define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
+#endif
+
+static abi_long do_prctl_get_fp_mode(CPUArchState *env)
+{
+#ifdef TARGET_MIPS
+    abi_long ret = 0;
+
+    if (env->CP0_Status & (1 << CP0St_FR)) {
+        ret |= PR_FP_MODE_FR;
+    }
+    if (env->CP0_Config5 & (1 << CP0C5_FRE)) {
+        ret |= PR_FP_MODE_FRE;
+    }
+    return ret;
+#else
+    return -TARGET_EINVAL;
+#endif
+}
+
+static abi_long do_prctl_set_fp_mode(CPUArchState *env, abi_long arg2)
+{
+#ifdef TARGET_MIPS
+    bool old_fr = env->CP0_Status & (1 << CP0St_FR);
+    bool old_fre = env->CP0_Config5 & (1 << CP0C5_FRE);
+    bool new_fr = arg2 & PR_FP_MODE_FR;
+    bool new_fre = arg2 & PR_FP_MODE_FRE;
+    const unsigned int known_bits = PR_FP_MODE_FR | PR_FP_MODE_FRE;
+
+    /* If nothing to change, return right away, successfully.  */
+    if (old_fr == new_fr && old_fre == new_fre) {
+        return 0;
+    }
+    /* Check the value is valid */
+    if (arg2 & ~known_bits) {
+        return -TARGET_EOPNOTSUPP;
+    }
+    /* Setting FRE without FR is not supported.  */
+    if (new_fre && !new_fr) {
+        return -TARGET_EOPNOTSUPP;
+    }
+    if (new_fr && !(env->active_fpu.fcr0 & (1 << FCR0_F64))) {
+        /* FR1 is not supported */
+        return -TARGET_EOPNOTSUPP;
+    }
+    if (!new_fr && (env->active_fpu.fcr0 & (1 << FCR0_F64))
+        && !(env->CP0_Status_rw_bitmask & (1 << CP0St_FR))) {
+        /* cannot set FR=0 */
+        return -TARGET_EOPNOTSUPP;
+    }
+    if (new_fre && !(env->active_fpu.fcr0 & (1 << FCR0_FREP))) {
+        /* Cannot set FRE=1 */
+        return -TARGET_EOPNOTSUPP;
+    }
+
+    int i;
+    fpr_t *fpr = env->active_fpu.fpr;
+    for (i = 0; i < 32 ; i += 2) {
+        if (!old_fr && new_fr) {
+            fpr[i].w[!FP_ENDIAN_IDX] = fpr[i + 1].w[FP_ENDIAN_IDX];
+        } else if (old_fr && !new_fr) {
+            fpr[i + 1].w[FP_ENDIAN_IDX] = fpr[i].w[!FP_ENDIAN_IDX];
+        }
+    }
+
+    if (new_fr) {
+        env->CP0_Status |= (1 << CP0St_FR);
+        env->hflags |= MIPS_HFLAG_F64;
+    } else {
+        env->CP0_Status &= ~(1 << CP0St_FR);
+        env->hflags &= ~MIPS_HFLAG_F64;
+    }
+    if (new_fre) {
+        env->CP0_Config5 |= (1 << CP0C5_FRE);
+        if (env->active_fpu.fcr0 & (1 << FCR0_FREP)) {
+            env->hflags |= MIPS_HFLAG_FRE;
+        }
+    } else {
+        env->CP0_Config5 &= ~(1 << CP0C5_FRE);
+        env->hflags &= ~MIPS_HFLAG_FRE;
+    }
+
+    return 0;
+#else
+    return -TARGET_EINVAL;
+#endif
+}
+
+static abi_long do_prctl_get_vl(CPUArchState *env)
+{
+#ifdef TARGET_AARCH64
+    ARMCPU *cpu = env_archcpu(env);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
+    }
+#endif
+    return -TARGET_EINVAL;
+}
+
+static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
+{
+#ifdef TARGET_AARCH64
+    /*
+     * We cannot support either PR_SVE_SET_VL_ONEXEC or PR_SVE_VL_INHERIT.
+     * Note the kernel definition of sve_vl_valid allows for VQ=512,
+     * i.e. VL=8192, even though the current architectural maximum is VQ=16.
+     */
+    if (cpu_isar_feature(aa64_sve, env_archcpu(env))
+        && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
+        ARMCPU *cpu = env_archcpu(env);
+        uint32_t vq, old_vq;
+
+        old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        vq = MAX(arg2 / 16, 1);
+        vq = MIN(vq, cpu->sve_max_vq);
+
+        if (vq < old_vq) {
+            aarch64_sve_narrow_vq(env, vq);
+        }
+        env->vfp.zcr_el[1] = vq - 1;
+        arm_rebuild_hflags(env);
+        return vq * 16;
+    }
+#endif
+    return -TARGET_EINVAL;
+}
+
+static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
+{
+#ifdef TARGET_AARCH64
+    ARMCPU *cpu = env_archcpu(env);
+
+    if (cpu_isar_feature(aa64_pauth, cpu)) {
+        int all = (PR_PAC_APIAKEY | PR_PAC_APIBKEY |
+                   PR_PAC_APDAKEY | PR_PAC_APDBKEY | PR_PAC_APGAKEY);
+        int ret = 0;
+        Error *err = NULL;
+
+        if (arg2 == 0) {
+            arg2 = all;
+        } else if (arg2 & ~all) {
+            return -TARGET_EINVAL;
+        }
+        if (arg2 & PR_PAC_APIAKEY) {
+            ret |= qemu_guest_getrandom(&env->keys.apia,
+                                        sizeof(ARMPACKey), &err);
+        }
+        if (arg2 & PR_PAC_APIBKEY) {
+            ret |= qemu_guest_getrandom(&env->keys.apib,
+                                        sizeof(ARMPACKey), &err);
+        }
+        if (arg2 & PR_PAC_APDAKEY) {
+            ret |= qemu_guest_getrandom(&env->keys.apda,
+                                        sizeof(ARMPACKey), &err);
+        }
+        if (arg2 & PR_PAC_APDBKEY) {
+            ret |= qemu_guest_getrandom(&env->keys.apdb,
+                                        sizeof(ARMPACKey), &err);
+        }
+        if (arg2 & PR_PAC_APGAKEY) {
+            ret |= qemu_guest_getrandom(&env->keys.apga,
+                                        sizeof(ARMPACKey), &err);
+        }
+        if (ret != 0) {
+            /*
+             * Some unknown failure in the crypto.  The best
+             * we can do is log it and fail the syscall.
+             * The real syscall cannot fail this way.
+             */
+            qemu_log_mask(LOG_UNIMP, "PR_PAC_RESET_KEYS: Crypto failure: %s",
+                          error_get_pretty(err));
+            error_free(err);
+            return -TARGET_EIO;
+        }
+        return 0;
+    }
+#endif
+    return -TARGET_EINVAL;
+}
+
+static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
+{
+#ifdef TARGET_AARCH64
+    abi_ulong valid_mask = PR_TAGGED_ADDR_ENABLE;
+    ARMCPU *cpu = env_archcpu(env);
+
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        valid_mask |= PR_MTE_TCF_MASK;
+        valid_mask |= PR_MTE_TAG_MASK;
+    }
+
+    if (arg2 & ~valid_mask) {
+        return -TARGET_EINVAL;
+    }
+    env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
+
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        switch (arg2 & PR_MTE_TCF_MASK) {
+        case PR_MTE_TCF_NONE:
+        case PR_MTE_TCF_SYNC:
+        case PR_MTE_TCF_ASYNC:
+            break;
+        default:
+            return -EINVAL;
+        }
+
+        /*
+         * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
+         * Note that the syscall values are consistent with hw.
+         */
+        env->cp15.sctlr_el[1] =
+            deposit64(env->cp15.sctlr_el[1], 38, 2, arg2 >> PR_MTE_TCF_SHIFT);
+
+        /*
+         * Write PR_MTE_TAG to GCR_EL1[Exclude].
+         * Note that the syscall uses an include mask,
+         * and hardware uses an exclude mask -- invert.
+         */
+        env->cp15.gcr_el1 =
+            deposit64(env->cp15.gcr_el1, 0, 16, ~arg2 >> PR_MTE_TAG_SHIFT);
+        arm_rebuild_hflags(env);
+    }
+    return 0;
+#else
+    return -TARGET_EINVAL;
+#endif
+}
+
+static abi_long do_prctl_get_tagged_addr_ctrl(CPUArchState *env)
+{
+#ifdef TARGET_AARCH64
+    ARMCPU *cpu = env_archcpu(env);
+    abi_long ret = 0;
+
+    if (env->tagged_addr_enable) {
+        ret |= PR_TAGGED_ADDR_ENABLE;
+    }
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        /* See do_prctl_set_tagged_addr_ctrl. */
+        ret |= extract64(env->cp15.sctlr_el[1], 38, 2) << PR_MTE_TCF_SHIFT;
+        ret = deposit64(ret, PR_MTE_TAG_SHIFT, 16, ~env->cp15.gcr_el1);
+    }
+    return ret;
+#else
+    return -TARGET_EINVAL;
+#endif
+}
+
+static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
+                         abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    abi_long ret;
+
+    switch (option) {
+    case PR_GET_PDEATHSIG:
+        {
+            int deathsig;
+            ret = get_errno(prctl(PR_GET_PDEATHSIG, &deathsig,
+                                  arg3, arg4, arg5));
+            if (!is_error(ret) && arg2 && put_user_s32(deathsig, arg2)) {
+                return -TARGET_EFAULT;
+            }
+            return ret;
+        }
+    case PR_GET_NAME:
+        {
+            void *name = lock_user(VERIFY_WRITE, arg2, 16, 1);
+            if (!name) {
+                return -TARGET_EFAULT;
+            }
+            ret = get_errno(prctl(PR_GET_NAME, (uintptr_t)name,
+                                  arg3, arg4, arg5));
+            unlock_user(name, arg2, 16);
+            return ret;
+        }
+    case PR_SET_NAME:
+        {
+            void *name = lock_user(VERIFY_READ, arg2, 16, 1);
+            if (!name) {
+                return -TARGET_EFAULT;
+            }
+            ret = get_errno(prctl(PR_SET_NAME, (uintptr_t)name,
+                                  arg3, arg4, arg5));
+            unlock_user(name, arg2, 0);
+            return ret;
+        }
+    case PR_GET_FP_MODE:
+        return do_prctl_get_fp_mode(env);
+    case PR_SET_FP_MODE:
+        return do_prctl_set_fp_mode(env, arg2);
+    case PR_SVE_GET_VL:
+        return do_prctl_get_vl(env);
+    case PR_SVE_SET_VL:
+        return do_prctl_set_vl(env, arg2);
+    case PR_PAC_RESET_KEYS:
+        if (arg3 || arg4 || arg5) {
+            return -TARGET_EINVAL;
+        }
+        return do_prctl_reset_keys(env, arg2);
+    case PR_SET_TAGGED_ADDR_CTRL:
+        if (arg3 || arg4 || arg5) {
+            return -TARGET_EINVAL;
+        }
+        return do_prctl_set_tagged_addr_ctrl(env, arg2);
+    case PR_GET_TAGGED_ADDR_CTRL:
+        if (arg2 || arg3 || arg4 || arg5) {
+            return -TARGET_EINVAL;
+        }
+        return do_prctl_get_tagged_addr_ctrl(env);
+    case PR_GET_SECCOMP:
+    case PR_SET_SECCOMP:
+        /* Disable seccomp to prevent the target disabling syscalls we need. */
+        return -TARGET_EINVAL;
+    default:
+        /* Most prctl options have no pointer arguments */
+        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+    }
+}
+
 #define NEW_STACK_SIZE 0x40000
 
 
@@ -10621,290 +10978,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
 #endif
     case TARGET_NR_prctl:
-        switch (arg1) {
-        case PR_GET_PDEATHSIG:
-        {
-            int deathsig;
-            ret = get_errno(prctl(arg1, &deathsig, arg3, arg4, arg5));
-            if (!is_error(ret) && arg2
-                && put_user_s32(deathsig, arg2)) {
-                return -TARGET_EFAULT;
-            }
-            return ret;
-        }
-#ifdef PR_GET_NAME
-        case PR_GET_NAME:
-        {
-            void *name = lock_user(VERIFY_WRITE, arg2, 16, 1);
-            if (!name) {
-                return -TARGET_EFAULT;
-            }
-            ret = get_errno(prctl(arg1, (unsigned long)name,
-                                  arg3, arg4, arg5));
-            unlock_user(name, arg2, 16);
-            return ret;
-        }
-        case PR_SET_NAME:
-        {
-            void *name = lock_user(VERIFY_READ, arg2, 16, 1);
-            if (!name) {
-                return -TARGET_EFAULT;
-            }
-            ret = get_errno(prctl(arg1, (unsigned long)name,
-                                  arg3, arg4, arg5));
-            unlock_user(name, arg2, 0);
-            return ret;
-        }
-#endif
-#ifdef TARGET_MIPS
-        case TARGET_PR_GET_FP_MODE:
-        {
-            CPUMIPSState *env = ((CPUMIPSState *)cpu_env);
-            ret = 0;
-            if (env->CP0_Status & (1 << CP0St_FR)) {
-                ret |= TARGET_PR_FP_MODE_FR;
-            }
-            if (env->CP0_Config5 & (1 << CP0C5_FRE)) {
-                ret |= TARGET_PR_FP_MODE_FRE;
-            }
-            return ret;
-        }
-        case TARGET_PR_SET_FP_MODE:
-        {
-            CPUMIPSState *env = ((CPUMIPSState *)cpu_env);
-            bool old_fr = env->CP0_Status & (1 << CP0St_FR);
-            bool old_fre = env->CP0_Config5 & (1 << CP0C5_FRE);
-            bool new_fr = arg2 & TARGET_PR_FP_MODE_FR;
-            bool new_fre = arg2 & TARGET_PR_FP_MODE_FRE;
-
-            const unsigned int known_bits = TARGET_PR_FP_MODE_FR |
-                                            TARGET_PR_FP_MODE_FRE;
-
-            /* If nothing to change, return right away, successfully.  */
-            if (old_fr == new_fr && old_fre == new_fre) {
-                return 0;
-            }
-            /* Check the value is valid */
-            if (arg2 & ~known_bits) {
-                return -TARGET_EOPNOTSUPP;
-            }
-            /* Setting FRE without FR is not supported.  */
-            if (new_fre && !new_fr) {
-                return -TARGET_EOPNOTSUPP;
-            }
-            if (new_fr && !(env->active_fpu.fcr0 & (1 << FCR0_F64))) {
-                /* FR1 is not supported */
-                return -TARGET_EOPNOTSUPP;
-            }
-            if (!new_fr && (env->active_fpu.fcr0 & (1 << FCR0_F64))
-                && !(env->CP0_Status_rw_bitmask & (1 << CP0St_FR))) {
-                /* cannot set FR=0 */
-                return -TARGET_EOPNOTSUPP;
-            }
-            if (new_fre && !(env->active_fpu.fcr0 & (1 << FCR0_FREP))) {
-                /* Cannot set FRE=1 */
-                return -TARGET_EOPNOTSUPP;
-            }
-
-            int i;
-            fpr_t *fpr = env->active_fpu.fpr;
-            for (i = 0; i < 32 ; i += 2) {
-                if (!old_fr && new_fr) {
-                    fpr[i].w[!FP_ENDIAN_IDX] = fpr[i + 1].w[FP_ENDIAN_IDX];
-                } else if (old_fr && !new_fr) {
-                    fpr[i + 1].w[FP_ENDIAN_IDX] = fpr[i].w[!FP_ENDIAN_IDX];
-                }
-            }
-
-            if (new_fr) {
-                env->CP0_Status |= (1 << CP0St_FR);
-                env->hflags |= MIPS_HFLAG_F64;
-            } else {
-                env->CP0_Status &= ~(1 << CP0St_FR);
-                env->hflags &= ~MIPS_HFLAG_F64;
-            }
-            if (new_fre) {
-                env->CP0_Config5 |= (1 << CP0C5_FRE);
-                if (env->active_fpu.fcr0 & (1 << FCR0_FREP)) {
-                    env->hflags |= MIPS_HFLAG_FRE;
-                }
-            } else {
-                env->CP0_Config5 &= ~(1 << CP0C5_FRE);
-                env->hflags &= ~MIPS_HFLAG_FRE;
-            }
-
-            return 0;
-        }
-#endif /* MIPS */
-#ifdef TARGET_AARCH64
-        case TARGET_PR_SVE_SET_VL:
-            /*
-             * We cannot support either PR_SVE_SET_VL_ONEXEC or
-             * PR_SVE_VL_INHERIT.  Note the kernel definition
-             * of sve_vl_valid allows for VQ=512, i.e. VL=8192,
-             * even though the current architectural maximum is VQ=16.
-             */
-            ret = -TARGET_EINVAL;
-            if (cpu_isar_feature(aa64_sve, env_archcpu(cpu_env))
-                && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
-                CPUARMState *env = cpu_env;
-                ARMCPU *cpu = env_archcpu(env);
-                uint32_t vq, old_vq;
-
-                old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
-                vq = MAX(arg2 / 16, 1);
-                vq = MIN(vq, cpu->sve_max_vq);
-
-                if (vq < old_vq) {
-                    aarch64_sve_narrow_vq(env, vq);
-                }
-                env->vfp.zcr_el[1] = vq - 1;
-                arm_rebuild_hflags(env);
-                ret = vq * 16;
-            }
-            return ret;
-        case TARGET_PR_SVE_GET_VL:
-            ret = -TARGET_EINVAL;
-            {
-                ARMCPU *cpu = env_archcpu(cpu_env);
-                if (cpu_isar_feature(aa64_sve, cpu)) {
-                    ret = ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
-                }
-            }
-            return ret;
-        case TARGET_PR_PAC_RESET_KEYS:
-            {
-                CPUARMState *env = cpu_env;
-                ARMCPU *cpu = env_archcpu(env);
-
-                if (arg3 || arg4 || arg5) {
-                    return -TARGET_EINVAL;
-                }
-                if (cpu_isar_feature(aa64_pauth, cpu)) {
-                    int all = (TARGET_PR_PAC_APIAKEY | TARGET_PR_PAC_APIBKEY |
-                               TARGET_PR_PAC_APDAKEY | TARGET_PR_PAC_APDBKEY |
-                               TARGET_PR_PAC_APGAKEY);
-                    int ret = 0;
-                    Error *err = NULL;
-
-                    if (arg2 == 0) {
-                        arg2 = all;
-                    } else if (arg2 & ~all) {
-                        return -TARGET_EINVAL;
-                    }
-                    if (arg2 & TARGET_PR_PAC_APIAKEY) {
-                        ret |= qemu_guest_getrandom(&env->keys.apia,
-                                                    sizeof(ARMPACKey), &err);
-                    }
-                    if (arg2 & TARGET_PR_PAC_APIBKEY) {
-                        ret |= qemu_guest_getrandom(&env->keys.apib,
-                                                    sizeof(ARMPACKey), &err);
-                    }
-                    if (arg2 & TARGET_PR_PAC_APDAKEY) {
-                        ret |= qemu_guest_getrandom(&env->keys.apda,
-                                                    sizeof(ARMPACKey), &err);
-                    }
-                    if (arg2 & TARGET_PR_PAC_APDBKEY) {
-                        ret |= qemu_guest_getrandom(&env->keys.apdb,
-                                                    sizeof(ARMPACKey), &err);
-                    }
-                    if (arg2 & TARGET_PR_PAC_APGAKEY) {
-                        ret |= qemu_guest_getrandom(&env->keys.apga,
-                                                    sizeof(ARMPACKey), &err);
-                    }
-                    if (ret != 0) {
-                        /*
-                         * Some unknown failure in the crypto.  The best
-                         * we can do is log it and fail the syscall.
-                         * The real syscall cannot fail this way.
-                         */
-                        qemu_log_mask(LOG_UNIMP,
-                                      "PR_PAC_RESET_KEYS: Crypto failure: %s",
-                                      error_get_pretty(err));
-                        error_free(err);
-                        return -TARGET_EIO;
-                    }
-                    return 0;
-                }
-            }
-            return -TARGET_EINVAL;
-        case TARGET_PR_SET_TAGGED_ADDR_CTRL:
-            {
-                abi_ulong valid_mask = TARGET_PR_TAGGED_ADDR_ENABLE;
-                CPUARMState *env = cpu_env;
-                ARMCPU *cpu = env_archcpu(env);
-
-                if (cpu_isar_feature(aa64_mte, cpu)) {
-                    valid_mask |= TARGET_PR_MTE_TCF_MASK;
-                    valid_mask |= TARGET_PR_MTE_TAG_MASK;
-                }
-
-                if ((arg2 & ~valid_mask) || arg3 || arg4 || arg5) {
-                    return -TARGET_EINVAL;
-                }
-                env->tagged_addr_enable = arg2 & TARGET_PR_TAGGED_ADDR_ENABLE;
-
-                if (cpu_isar_feature(aa64_mte, cpu)) {
-                    switch (arg2 & TARGET_PR_MTE_TCF_MASK) {
-                    case TARGET_PR_MTE_TCF_NONE:
-                    case TARGET_PR_MTE_TCF_SYNC:
-                    case TARGET_PR_MTE_TCF_ASYNC:
-                        break;
-                    default:
-                        return -EINVAL;
-                    }
-
-                    /*
-                     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
-                     * Note that the syscall values are consistent with hw.
-                     */
-                    env->cp15.sctlr_el[1] =
-                        deposit64(env->cp15.sctlr_el[1], 38, 2,
-                                  arg2 >> TARGET_PR_MTE_TCF_SHIFT);
-
-                    /*
-                     * Write PR_MTE_TAG to GCR_EL1[Exclude].
-                     * Note that the syscall uses an include mask,
-                     * and hardware uses an exclude mask -- invert.
-                     */
-                    env->cp15.gcr_el1 =
-                        deposit64(env->cp15.gcr_el1, 0, 16,
-                                  ~arg2 >> TARGET_PR_MTE_TAG_SHIFT);
-                    arm_rebuild_hflags(env);
-                }
-                return 0;
-            }
-        case TARGET_PR_GET_TAGGED_ADDR_CTRL:
-            {
-                abi_long ret = 0;
-                CPUARMState *env = cpu_env;
-                ARMCPU *cpu = env_archcpu(env);
-
-                if (arg2 || arg3 || arg4 || arg5) {
-                    return -TARGET_EINVAL;
-                }
-                if (env->tagged_addr_enable) {
-                    ret |= TARGET_PR_TAGGED_ADDR_ENABLE;
-                }
-                if (cpu_isar_feature(aa64_mte, cpu)) {
-                    /* See above. */
-                    ret |= (extract64(env->cp15.sctlr_el[1], 38, 2)
-                            << TARGET_PR_MTE_TCF_SHIFT);
-                    ret = deposit64(ret, TARGET_PR_MTE_TAG_SHIFT, 16,
-                                    ~env->cp15.gcr_el1);
-                }
-                return ret;
-            }
-#endif /* AARCH64 */
-        case PR_GET_SECCOMP:
-        case PR_SET_SECCOMP:
-            /* Disable seccomp to prevent the target disabling syscalls we
-             * need. */
-            return -TARGET_EINVAL;
-        default:
-            /* Most prctl options have no pointer arguments */
-            return get_errno(prctl(arg1, arg2, arg3, arg4, arg5));
-        }
+        return do_prctl(cpu_env, arg1, arg2, arg3, arg4, arg5);
         break;
 #ifdef TARGET_NR_arch_prctl
     case TARGET_NR_arch_prctl:
-- 
2.25.1


