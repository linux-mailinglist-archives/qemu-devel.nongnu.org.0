Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89AA315B1E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:29:51 +0100 (CET)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dOA-00040E-Qp
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyT-0003v6-23
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:17 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy3-00085b-AU
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:16 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x9so212081plb.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NmqOnFZ3gzFTWfhEXE/IEZcCHdcqEoHvbx2VhkXYfn0=;
 b=Y7Eicnod+lvdrae4/tZ0jIkv7t2H7TCAMO4XTP1as3v5MRnnpC3uk4N7oILCV6hyQF
 oUkf0PHMiSEso+N1Mj9OZdYgj6CEuWMDFG5IB2/X3W/twNiouOjr20N+LhAh/NF9leZC
 u8jgjtp0q6wRJmUsKXMH6sO+60du49ZfH+av4ZlAkP2gTavvyt1vBwmL9BcTfefWfbCE
 lO6rqJbR3rEvDGDlIrQI5U3Jopgyk1MCunkeNWAKL4UJerjevwO7tsjRD93jPHX7BaTO
 Oy3zRK/h5X1rSgn3WPZyaGptZGyQFRZKOy9DtBZdHzygEvV3vFYXOdEZ9AQ/5VgAMLJ+
 m/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NmqOnFZ3gzFTWfhEXE/IEZcCHdcqEoHvbx2VhkXYfn0=;
 b=cPtmFkTu2qoMXbMz58esd2I0QjtmZXvnFMF/nxNFnvva1A/SceuVfHlE9ZSHRSnCO+
 De6bLtvKS14DJ9Kka+f7SeUnIco1ljVm5ZPpE1pdblcMxeqPMZwblXxojAhjhM670P3x
 kFi4wXUnmaTKp5XyXJsmWpHXGVxzWieM4G6pT97/d1/WZD6SgCi3Ixj5TAs6HlPDEU4c
 h6NnU2qTsPRU0SXl61WYJ8KsL5AISurpn3No9neSgmT4/+BNmqW7xbdNrsznL+7XHbBR
 DiFgXfm7uGi3PUUiVRl/ilQ053s2bPJf5JdvzagnPB9OsF27WY79E8G5kqXo09gspYOL
 e7og==
X-Gm-Message-State: AOAM533WQRpRXsxHvt+egjkDBK9fYQ0chF4nnXVilzlsG2iySP51nkN9
 wpBYHy1nxZVYCc7Iyh7WfnHDOacIHkAXvw==
X-Google-Smtp-Source: ABdhPJx+7lZqyoyrrsGI8tKPMWpg/SbHS9gAR4q6V71EZuAXMav1hQyAGAqAJ/Fz+J+5Dpitay26dg==
X-Received: by 2002:a17:902:cd13:b029:e2:efc5:d33d with SMTP id
 g19-20020a170902cd13b02900e2efc5d33dmr325620ply.61.1612915369845; 
 Tue, 09 Feb 2021 16:02:49 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 20/31] linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
Date: Tue,  9 Feb 2021 16:02:12 -0800
Message-Id: <20210210000223.884088-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the prctl bit that controls whether syscalls accept tagged
addresses.  See Documentation/arm64/tagged-address-abi.rst in the
linux kernel.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index d080239863..558ad1466b 100644
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
@@ -3602,6 +3607,32 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
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
index 24fc1daf02..ba4da7f8a6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10981,6 +10981,30 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


