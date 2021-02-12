Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F631A535
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:18:59 +0100 (CET)
Received: from localhost ([::1]:41210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdxy-0000sU-3H
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVZ-0001qt-PS
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:37 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVT-0007qW-HX
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:37 -0500
Received: by mail-pj1-x102b.google.com with SMTP id q72so138731pjq.2
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ii8KjL9vsZV9U86ikUpsidwXGfwtzhRNG8B9htIsBiQ=;
 b=KDlahd2DJXyQmvNadL21lLzxUJC/yFxcR0qhsvvmzXGd9jj72UcwYWl03c+OHJKCAf
 em8nzUaPrQHsFN1pLkt+GnT3pZgDAfDb1d0EjGr7Xhav+Wp6/weV1TlcCxI66x9h0Nmj
 MS/y/COnu+iA5shpy+gmcVZhrt7gpsWoxlizezBjaTZZOyrQQM46vFL1cTc3Mr3VgBPJ
 cKB9zc0HyOCLhRDRlqF+qV90mx8TJhMxoQ+H/w/EOzyXIKndun8R9D8ECMqn01NVbhSO
 7fdgFwxnY7+7/m7CrpJDr34KeGFNEHA0yG2QhRVJyuZm5gxyMuZAzE1OlB7bCAY+C5PH
 Rf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ii8KjL9vsZV9U86ikUpsidwXGfwtzhRNG8B9htIsBiQ=;
 b=X4vJSml6y7z9MtIc8BOy+aKU9mvt1DDCcXnq+dCEE04JXELOanW9U0zIkaXp5E3ry9
 2eaqvj9HW98jXVHXoJ3rNUCzdiW7f9kyVvBsKBBVmB0ovR6XMRwPCKigDVwKGo5GkiKd
 i2xJmTT+vSHy/x0z3rb/fM7IQyXUXq2mY0jLjsRhsGbQtZ/plJWTnMi6U1v7W+LTGxpJ
 orD82Ca1GNyyTmDrf/NmLl/gpw6VgWSPiS53/Om1/1B6n+XeoT3PasOb3aoivuKjCG5l
 v4Xj82lJqTSgQibaZ7FD1q1gcsIrfDfkox08YEtMqkBEOSbo+HMD8qNUnIWLs8ruzeKO
 7bSA==
X-Gm-Message-State: AOAM533Tm5jGXt3vdfb25T1hTsArgatKAc9H9hPpyN4Juy1NArcIQHe6
 kdhW/pIT8SdHhM0Fpi95TF1ml9obK/Tz5w==
X-Google-Smtp-Source: ABdhPJw12HmIV6C/9XDhqF0NnUgCq7C3QQRPh5MI89nsVeYFeldFgMe+h6FPqwuQG5zshqAkaGOguA==
X-Received: by 2002:a17:902:9b91:b029:e3:2c9e:f511 with SMTP id
 y17-20020a1709029b91b02900e32c9ef511mr1451415plp.74.1613155770121; 
 Fri, 12 Feb 2021 10:49:30 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 20/31] linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
Date: Fri, 12 Feb 2021 10:48:51 -0800
Message-Id: <20210212184902.1251044-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index f240275407..72a0819eb8 100644
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
@@ -3604,6 +3609,32 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
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


