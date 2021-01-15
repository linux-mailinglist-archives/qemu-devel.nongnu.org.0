Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5422F8918
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:03:37 +0100 (CET)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Y7z-0000ux-Ht
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsG-0003gG-P2
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:20 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:39729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs6-0005GJ-Mx
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:20 -0500
Received: by mail-pf1-x430.google.com with SMTP id m6so6406543pfm.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kevGJM1Q+4BI+TG/qeyrIdbD80I/diyx5FwIEqL89Lg=;
 b=yjl20JCzeSyY0d+TkDuN3wwMZiKpjLRYjZZFtN5FAQY0IP+krpQQkm7x9J+ZgBtnBK
 RxpY5TF6YB2r1Se761rLFzK0PUICPe21i+qUv9AywzvwvirYPO8ExUFEPfxAw2a2w4HX
 mO/gjZUUlb8YtnY/Q38ocaXymemjMP+7AjZqixWpccHwCTIowIWQtuWy1uje5RiDUknM
 hbariWoPORK3SyQIa7arfgicB8ao+WktrsL+r8bd8auzMwOoZVNKX9ojUP1zHkXoiRFM
 /cxDqFlj4W/eO72nLzxjNFhd02m1tPbI6X+C8nJnxnlQguPPZ6C+Q8xNuSw7iiwrP/VI
 LlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kevGJM1Q+4BI+TG/qeyrIdbD80I/diyx5FwIEqL89Lg=;
 b=GQP8fOu8wXUEWtfR3AGzjV8oYHgaJT8V4IbH5hn8/WYgn63hBfsWZzYT1b6uWITkVt
 4TyHVyD4/AEGqKhTa4uTfefMMWhK5eR8xOGgA8tEZDCpVDXV1GWPTXigNlwkMki2skOu
 Eyl5KRPDY1zaWw9YyfI6LXDJY/ENWOEGaANNpPuYvohSKaCpqPJikqlZq4NzkJdO2exM
 oXybio4gPW/cQJ5XgoKGDwOhY6TkWJQbKgbZK8w3mZ6sGtOo3HwBmVgdSVEg+OAiHb7r
 tBo60k8l1MIqYFgD28TjzE2ozzLBUcMRCpDowPPY17j8RvSTnyVcYTWj1aCtA4qXgeX5
 GTJQ==
X-Gm-Message-State: AOAM530Zml0+QmIPlWSUCcVi65ZDTo4pJkCfSg/nuhU5er8CqEcIGgHO
 4HfMqsQByrt3erWt/S5MZKWc6LP7+mBk+qER
X-Google-Smtp-Source: ABdhPJyV4SgVfvjZsXZSxCadhQf89wBQz68zzBFY4Y27oBJ+wKCss2UjY+1HDCkPRs7oVPN61VZeTQ==
X-Received: by 2002:a63:ea01:: with SMTP id c1mr14823034pgi.138.1610750827934; 
 Fri, 15 Jan 2021 14:47:07 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/21] linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
Date: Fri, 15 Jan 2021 12:46:36 -1000
Message-Id: <20210115224645.1196742-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 target/arm/cpu.h                    | 23 +++++++++++++++++++++++
 linux-user/syscall.c                | 25 +++++++++++++++++++++++++
 target/arm/cpu.c                    |  3 +++
 5 files changed, 58 insertions(+)

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
index 6321385b46..f922aa0650 100644
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
index f3bca73d98..6ddfd9ebe6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -712,6 +712,10 @@ typedef struct CPUARMState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+
+#ifdef TARGET_TAGGED_ADDRESSES
+    target_ulong untagged_addr_mask;
+#endif
 } CPUARMState;
 
 static inline void set_feature(CPUARMState *env, int feature)
@@ -3556,6 +3560,25 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
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
+    return x & cpu->env.untagged_addr_mask;
+}
+#endif
+
 /*
  * Naming convention for isar_feature functions:
  * Functions which test 32-bit ID registers should have _aa32_ in
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index bec2ab7769..ebb4e2898c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10948,6 +10948,31 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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
+                env->untagged_addr_mask = (arg2 & TARGET_PR_TAGGED_ADDR_ENABLE
+                                           ? MAKE_64BIT_MASK(0, 56) : -1);
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
+                if (env->untagged_addr_mask != -1) {
+                    ret |= TARGET_PR_TAGGED_ADDR_ENABLE;
+                }
+                return ret;
+            }
 #endif /* AARCH64 */
         case PR_GET_SECCOMP:
         case PR_SET_SECCOMP:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8387e94b94..abc0affd00 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,6 +208,9 @@ static void arm_cpu_reset(DeviceState *dev)
          * Do not modify this without other changes.
          */
         env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+# ifdef TARGET_TAGGED_ADDRESSES
+        env->untagged_addr_mask = -1;
+# endif
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.25.1


