Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5047B55C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:47:36 +0100 (CET)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQVL-0000Jm-F3
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:47:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPg-0000CU-Gi
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:44 -0500
Received: from [2607:f8b0:4864:20::534] (port=45708
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPc-0002wN-Dy
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:43 -0500
Received: by mail-pg1-x534.google.com with SMTP id 2so3683645pgb.12
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOIMkOtaPiPk0iyP69IgrG+76NtK5ZKoaU3FDVqgSUM=;
 b=CqfWNz4W1eguTg1zIwlOQ6SmbzJC96ckA+HMo8OdJIDcUrlSzo0d0sbAS95bqEXY2P
 wFfwR6tqeEZZ62WtDhngmq10FaVGQn3lx9RGSR4EOQhltIZNR+JMdZk/14GXV4YAmVZc
 CLi7JiDg4YowCpVK4crlM0fugBcSlOUOrkjEGp9xbrWrWEWkV3vf69MqP8C4pcCW7XvI
 jqwreWtcOYJiUs2soFAFoUY4Bs2FTkUAUivEzyUD8KjrgyQsCYPJCwZ/AZdYL2PVtU1r
 AsCr9p4T+SorrJDPClIGcnrTGF4IcqunHugcA+aw+DU+byh3jkX4qgMJYDfJ4oXSEW5P
 ytZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOIMkOtaPiPk0iyP69IgrG+76NtK5ZKoaU3FDVqgSUM=;
 b=xGPmM9mc56oolabJlI4czuzAlzctiI3DvOw+EonYxkrIFIqG+NlAXeIlSX6wpi9+ku
 b6RwBuZTnhTVt/BDZlbPYgpcc3P3vpkqwAQHzoagCzSGaUVNaYNaJjzgFYJskrkfL+sQ
 2eWVhWe2Ryrfx7WTPCNm5xInI8Hf+ahVndk/DpXvIhOcL6I5c2an1F4KxpOdogRgkOne
 09qXqVelODOQBa9Cx52B1ZfSiguryaoUWGvZIPj4Bb301J7ge+i4W1/WT4Sa0XP//MmT
 uPCyaWlrB76RgBZdFfC8Qk70e4HgqOFOku13tzX4pkIxRE8n1dVqc5u03twyv2DLko5l
 N6EA==
X-Gm-Message-State: AOAM531YBEYADsKlbqkCSLi34tK3XIhfCyC7eg6HcVTkPnRbCxlU7f9T
 1r2WglzU3azXJw3eqlwslC4OIKmXaB96tA==
X-Google-Smtp-Source: ABdhPJzYUpclAiTVmBv9FtJ2gro+Ym/6F2/mgDAiJqeQ47yvPPsb46cmso3t0fuMMrCEJJWSVJiD2Q==
X-Received: by 2002:a63:618d:: with SMTP id v135mr56501pgb.502.1640036498884; 
 Mon, 20 Dec 2021 13:41:38 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id u10sm12508748pfm.58.2021.12.20.13.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:41:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] linux-user: Split out do_prctl and subroutines
Date: Mon, 20 Dec 2021 13:41:30 -0800
Message-Id: <20211220214135.189157-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220214135.189157-1-richard.henderson@linaro.org>
References: <20211220214135.189157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
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
 linux-user/aarch64/target_prctl.h    | 160 ++++++++++
 linux-user/aarch64/target_syscall.h  |  23 --
 linux-user/alpha/target_prctl.h      |   1 +
 linux-user/arm/target_prctl.h        |   1 +
 linux-user/cris/target_prctl.h       |   1 +
 linux-user/hexagon/target_prctl.h    |   1 +
 linux-user/hppa/target_prctl.h       |   1 +
 linux-user/i386/target_prctl.h       |   1 +
 linux-user/m68k/target_prctl.h       |   1 +
 linux-user/microblaze/target_prctl.h |   1 +
 linux-user/mips/target_prctl.h       |  88 ++++++
 linux-user/mips/target_syscall.h     |   6 -
 linux-user/mips64/target_prctl.h     |   1 +
 linux-user/mips64/target_syscall.h   |   6 -
 linux-user/nios2/target_prctl.h      |   1 +
 linux-user/openrisc/target_prctl.h   |   1 +
 linux-user/ppc/target_prctl.h        |   1 +
 linux-user/riscv/target_prctl.h      |   1 +
 linux-user/s390x/target_prctl.h      |   1 +
 linux-user/sh4/target_prctl.h        |   1 +
 linux-user/sparc/target_prctl.h      |   1 +
 linux-user/x86_64/target_prctl.h     |   1 +
 linux-user/xtensa/target_prctl.h     |   1 +
 linux-user/syscall.c                 | 433 +++++++++------------------
 24 files changed, 414 insertions(+), 320 deletions(-)
 create mode 100644 linux-user/aarch64/target_prctl.h
 create mode 100644 linux-user/alpha/target_prctl.h
 create mode 100644 linux-user/arm/target_prctl.h
 create mode 100644 linux-user/cris/target_prctl.h
 create mode 100644 linux-user/hexagon/target_prctl.h
 create mode 100644 linux-user/hppa/target_prctl.h
 create mode 100644 linux-user/i386/target_prctl.h
 create mode 100644 linux-user/m68k/target_prctl.h
 create mode 100644 linux-user/microblaze/target_prctl.h
 create mode 100644 linux-user/mips/target_prctl.h
 create mode 100644 linux-user/mips64/target_prctl.h
 create mode 100644 linux-user/nios2/target_prctl.h
 create mode 100644 linux-user/openrisc/target_prctl.h
 create mode 100644 linux-user/ppc/target_prctl.h
 create mode 100644 linux-user/riscv/target_prctl.h
 create mode 100644 linux-user/s390x/target_prctl.h
 create mode 100644 linux-user/sh4/target_prctl.h
 create mode 100644 linux-user/sparc/target_prctl.h
 create mode 100644 linux-user/x86_64/target_prctl.h
 create mode 100644 linux-user/xtensa/target_prctl.h

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
new file mode 100644
index 0000000000..3f5a5d3933
--- /dev/null
+++ b/linux-user/aarch64/target_prctl.h
@@ -0,0 +1,160 @@
+/*
+ * AArch64 specific prctl functions for linux-user
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef AARCH64_TARGET_PRCTL_H
+#define AARCH64_TARGET_PRCTL_H
+
+static abi_long do_prctl_get_vl(CPUArchState *env)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
+    }
+    return -TARGET_EINVAL;
+}
+#define do_prctl_get_vl do_prctl_get_vl
+
+static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
+{
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
+    return -TARGET_EINVAL;
+}
+#define do_prctl_set_vl do_prctl_set_vl
+
+static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
+{
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
+    return -TARGET_EINVAL;
+}
+#define do_prctl_reset_keys do_prctl_reset_keys
+
+static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
+{
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
+}
+#define do_prctl_set_tagged_addr_ctrl do_prctl_set_tagged_addr_ctrl
+
+static abi_long do_prctl_get_tagged_addr_ctrl(CPUArchState *env)
+{
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
+}
+#define do_prctl_get_tagged_addr_ctrl do_prctl_get_tagged_addr_ctrl
+
+#endif /* AARCH64_TARGET_PRCTL_H */
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
diff --git a/linux-user/alpha/target_prctl.h b/linux-user/alpha/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/alpha/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/arm/target_prctl.h b/linux-user/arm/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/arm/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/cris/target_prctl.h b/linux-user/cris/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/cris/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/hexagon/target_prctl.h b/linux-user/hexagon/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/hexagon/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/hppa/target_prctl.h b/linux-user/hppa/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/hppa/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/i386/target_prctl.h b/linux-user/i386/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/i386/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/m68k/target_prctl.h b/linux-user/m68k/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/m68k/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/microblaze/target_prctl.h b/linux-user/microblaze/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/microblaze/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/mips/target_prctl.h b/linux-user/mips/target_prctl.h
new file mode 100644
index 0000000000..e028333db9
--- /dev/null
+++ b/linux-user/mips/target_prctl.h
@@ -0,0 +1,88 @@
+/*
+ * MIPS specific prctl functions for linux-user
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef MIPS_TARGET_PRCTL_H
+#define MIPS_TARGET_PRCTL_H
+
+static abi_long do_prctl_get_fp_mode(CPUArchState *env)
+{
+    abi_long ret = 0;
+
+    if (env->CP0_Status & (1 << CP0St_FR)) {
+        ret |= PR_FP_MODE_FR;
+    }
+    if (env->CP0_Config5 & (1 << CP0C5_FRE)) {
+        ret |= PR_FP_MODE_FRE;
+    }
+    return ret;
+}
+#define do_prctl_get_fp_mode do_prctl_get_fp_mode
+
+static abi_long do_prctl_set_fp_mode(CPUArchState *env, abi_long arg2)
+{
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
+}
+#define do_prctl_set_fp_mode do_prctl_set_fp_mode
+
+#endif /* MIPS_TARGET_PRCTL_H */
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
diff --git a/linux-user/mips64/target_prctl.h b/linux-user/mips64/target_prctl.h
new file mode 100644
index 0000000000..18da9ae619
--- /dev/null
+++ b/linux-user/mips64/target_prctl.h
@@ -0,0 +1 @@
+#include "../mips/target_prctl.h"
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
diff --git a/linux-user/nios2/target_prctl.h b/linux-user/nios2/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/nios2/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/openrisc/target_prctl.h b/linux-user/openrisc/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/openrisc/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/ppc/target_prctl.h b/linux-user/ppc/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/ppc/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/riscv/target_prctl.h b/linux-user/riscv/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/riscv/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/s390x/target_prctl.h b/linux-user/s390x/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/s390x/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/sh4/target_prctl.h b/linux-user/sh4/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/sh4/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/sparc/target_prctl.h b/linux-user/sparc/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/sparc/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/x86_64/target_prctl.h b/linux-user/x86_64/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/x86_64/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/xtensa/target_prctl.h b/linux-user/xtensa/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/xtensa/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f1cfcc8104..b93b8a4f5e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6293,9 +6293,155 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
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
+#include "target_prctl.h"
+
+static abi_long do_prctl_inval0(CPUArchState *env)
+{
+    return -TARGET_EINVAL;
+}
+
+static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
+{
+    return -TARGET_EINVAL;
+}
+
+#ifndef do_prctl_get_fp_mode
+#define do_prctl_get_fp_mode do_prctl_inval0
+#endif
+#ifndef do_prctl_set_fp_mode
+#define do_prctl_set_fp_mode do_prctl_inval1
+#endif
+#ifndef do_prctl_get_vl
+#define do_prctl_get_vl do_prctl_inval0
+#endif
+#ifndef do_prctl_set_vl
+#define do_prctl_set_vl do_prctl_inval1
+#endif
+#ifndef do_prctl_reset_keys
+#define do_prctl_reset_keys do_prctl_inval1
+#endif
+#ifndef do_prctl_set_tagged_addr_ctrl
+#define do_prctl_set_tagged_addr_ctrl do_prctl_inval1
+#endif
+#ifndef do_prctl_get_tagged_addr_ctrl
+#define do_prctl_get_tagged_addr_ctrl do_prctl_inval0
+#endif
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
 
 
@@ -10634,290 +10780,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


