Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67437308175
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:52:33 +0100 (CET)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G9Q-0006dn-AE
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzc-0005dV-Ky
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:24 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzK-00089q-9b
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:24 -0500
Received: by mail-pl1-x635.google.com with SMTP id s15so4166936plr.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ed3tfUDy0PesAaobPtQ3BXGUB495/TZW6laQkFKoabs=;
 b=yF/j6ZLfWtPUzR7p8XrSzBl2BK9YTHUQZCxe0KLo1/mQIrw3kv6MpzPbrk6Ad128Tf
 4LygrIKCrYoBb+kyiAV7Z31dFLJwVfU1t2jdMG1V4RxcBI2xcRxob1dP6T1xauIEgO40
 QwnX9T7arJgp7Pv9FHXOE+Yjf1rwWFOIz4NOOjITazEWJm+uHSwy9xm7X0PRnoRBAfz4
 96buEfaXSlp2MTiG3xNTzBFw+fadhQgzrZr2CJG4Ug6bYxE/93KWCzwZs1HV7gTDO87V
 szTEE519iyqoajLMsiea2Rk2gwoFyE3jXMECk69zpBYuLJ1ooWojZO/c0Jac4RpscUBr
 9iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ed3tfUDy0PesAaobPtQ3BXGUB495/TZW6laQkFKoabs=;
 b=Sx/i3uAK1ptJWw5iCPBLw0AGMFie3h5XCeILtFdfCL/okTOvCbBED2KQsOdTMgHgYl
 P1wW0x/x2NZF8v0tQ4mAJRaNuR92fulSJQmD32C2U/LvfTNql9p2P0S3gXi6hArgX9Up
 V8Z2xW4Kh1m7F73uZ1qP3LIcr1Gk1uCLZKNcKdj5y5huDABpKKKDA0vFWsWmMUH7Q9Dv
 wG4YLOtpUMYJ35EsFe4tL5iNLPiTCMaQuGykQwoDy1pwq6ZDUKuw36KLgLBrhDOjQkht
 z6+ABSuCUeLWMvv7DBohAYRnAAlSdj99E/Tqux7zAC4ZiebOLcJcuh7W6rfMStNRfWt1
 fLTA==
X-Gm-Message-State: AOAM533cgD+enP/t+3UwiRlwxywuP/0fksvsqauCHKZ4YqUqJFd53rNM
 lM4sU7tf3ZI5ealkcWX8shVGFO9uSl14/tnU
X-Google-Smtp-Source: ABdhPJyde7yebterc+4Mi3C8TxjBmNz6nlVyOMhieN/q0ZnXNIN5EZsn6XCmzEM/ctcw9j4bV2vmog==
X-Received: by 2002:a17:90a:f181:: with SMTP id
 bv1mr1468286pjb.57.1611873724671; 
 Thu, 28 Jan 2021 14:42:04 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/23] linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
Date: Thu, 28 Jan 2021 12:41:30 -1000
Message-Id: <20210128224141.638790-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the prctl bit that controls whether syscalls accept tagged
addresses.  See Documentation/arm64/tagged-address-abi.rst in the
linux kernel.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  4 ++++
 target/arm/cpu-param.h              |  3 +++
 target/arm/cpu.h                    | 31 +++++++++++++++++++++++++++++
 linux-user/syscall.c                | 24 ++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 3194e6b009..820601dfcc 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -30,4 +30,8 @@ struct target_pt_regs {
 # define TARGET_PR_PAC_APDBKEY   (1 << 3)
 # define TARGET_PR_PAC_APGAKEY   (1 << 4)
 
+#define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
+#define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
+# define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
+
 #endif /* AARCH64_TARGET_SYSCALL_H */
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 00e7d9e937..7f38d33b8e 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -20,6 +20,9 @@
 
 #ifdef CONFIG_USER_ONLY
 #define TARGET_PAGE_BITS 12
+# ifdef TARGET_AARCH64
+#  define TARGET_TAGGED_ADDRESSES
+# endif
 #else
 /*
  * ARMv7 and later CPUs have 4K pages minimum, but ARMv5 and v6
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df0d677833..0db6e65467 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -721,6 +721,11 @@ typedef struct CPUARMState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+
+#ifdef TARGET_TAGGED_ADDRESSES
+    /* Linux syscall tagged address support */
+    bool tagged_addr_enable;
+#endif
 } CPUARMState;
 
 static inline void set_feature(CPUARMState *env, int feature)
@@ -3601,6 +3606,32 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
  */
 #define PAGE_BTI  PAGE_TARGET_1
 
+#ifdef TARGET_TAGGED_ADDRESSES
+/**
+ * cpu_untagged_addr:
+ * @cs: CPU context
+ * @x: tagged address
+ *
+ * Remove any address tag from @x.  This is explicitly related to the
+ * linux syscall TIF_TAGGED_ADDR setting, not TBI in general.
+ *
+ * There should be a better place to put this, but we need this in
+ * include/exec/cpu_ldst.h, and not some place linux-user specific.
+ */
+static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    if (cpu->env.tagged_addr_enable) {
+        /*
+         * TBI is enabled for userspace but not kernelspace addresses.
+         * Only clear the tag if bit 55 is clear.
+         */
+        x &= sextract64(x, 0, 56);
+    }
+    return x;
+}
+#endif
+
 /*
  * Naming convention for isar_feature functions:
  * Functions which test 32-bit ID registers should have _aa32_ in
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6001022e96..46526f50b0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10963,6 +10963,30 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 }
             }
             return -TARGET_EINVAL;
+        case TARGET_PR_SET_TAGGED_ADDR_CTRL:
+            {
+                abi_ulong valid_mask = TARGET_PR_TAGGED_ADDR_ENABLE;
+                CPUARMState *env = cpu_env;
+
+                if ((arg2 & ~valid_mask) || arg3 || arg4 || arg5) {
+                    return -TARGET_EINVAL;
+                }
+                env->tagged_addr_enable = arg2 & TARGET_PR_TAGGED_ADDR_ENABLE;
+                return 0;
+            }
+        case TARGET_PR_GET_TAGGED_ADDR_CTRL:
+            {
+                abi_long ret = 0;
+                CPUARMState *env = cpu_env;
+
+                if (arg2 || arg3 || arg4 || arg5) {
+                    return -TARGET_EINVAL;
+                }
+                if (env->tagged_addr_enable) {
+                    ret |= TARGET_PR_TAGGED_ADDR_ENABLE;
+                }
+                return ret;
+            }
 #endif /* AARCH64 */
         case PR_GET_SECCOMP:
         case PR_SET_SECCOMP:
-- 
2.25.1


