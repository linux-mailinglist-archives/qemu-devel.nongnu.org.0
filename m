Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BAD3CC09F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 03:47:03 +0200 (CEST)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ZPy-0003l0-1V
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 21:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKc-0000xe-U7
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:30 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKZ-00011Q-Vs
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:30 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b12so6167206plh.10
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 18:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZKXPsuBwFbo2PKnUwpkwRoY2GI4hcbn0RSaqmuFSsg=;
 b=raG8Vnc6gli7R9w4XYncIlMd2x5Kr0SRccF3dXjp2kvUHnGhvhfKLWP/yeNmmcxuXM
 GvQnLc/PHbWJt9gghIec7/xf/bRaPNJazRZx61oDlu/k2XrJeuxMq8pAcNB74TGyWGHE
 XzjrFaHpCaU5UX2QAPtGYMWe/ZtRZtfF4jHpWzxGY1sJKjaxws14ri0hcl3nO+zpILhM
 pxHo2cPoP1Jdpvmv6lfxp0S+n8xqNX8C5tDkIm8hxthpG/dNWqFewBSwr4EKltvLoetl
 JC/MsWwpBlVEPXAHHlShugEZQXE9h42JJXgAsyw4CqyiTPpM0Tk4K44uiD7Wj3hQ8DjM
 svHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZKXPsuBwFbo2PKnUwpkwRoY2GI4hcbn0RSaqmuFSsg=;
 b=el2Zzl4uSJPxu25/ub22+90uZPufWx3B5Y03hdk7/uQ4hrSSfZ92lQ1G+ZBLMAZq0A
 W8x79cWSrHG6PZrKKKdernjPiNgge0GEycTo/lhgGk9BBhl5PhmzT4P9azZrA3KYrnnz
 cgA/WRfK+U8ish2nj/u61tfQWgSI4hV1ZB12PR8BnZtVmEQipiINRe74GYiSpZhXei51
 +vg8NPvXn4BGQPUyqnNqMe4KOyuGFcP6rgadgO3Jl7T+DxVDbPYfOFo5mk/AHMbRA9Rv
 4KUke20nxukuRVJCRnvrYmNmjW4MOvwMo4cVwpuMy11WNjZzmRHcvhbW2jYlncACzpz+
 v3SA==
X-Gm-Message-State: AOAM530jtd7EcleIiu9rYKEKnoU6/GiTFBcZOyvLBOJa3/+Mb57qlyat
 m7yoZcNAJrYXgBYdALrI7gWR1HDTUAB81A==
X-Google-Smtp-Source: ABdhPJyyhA50vnXBZYN76p7ZjpIb2Jh+F7XOSaVppeNe/8yVKhHOC5Ul0+hFZ2nj8GQJukAaWQgM8g==
X-Received: by 2002:a17:902:d681:b029:12b:381c:c86 with SMTP id
 v1-20020a170902d681b029012b381c0c86mr9915872ply.46.1626486086536; 
 Fri, 16 Jul 2021 18:41:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm12812738pgj.8.2021.07.16.18.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 18:41:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] tcg: Rename helper_atomic_*_mmu and provide for
 user-only
Date: Fri, 16 Jul 2021 18:41:15 -0700
Message-Id: <20210717014121.1784956-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717014121.1784956-1-richard.henderson@linaro.org>
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always provide the atomic interface using TCGMemOpIdx oi
and uintptr_t retaddr.  Rename from helper_* to cpu_* so
as to (mostly) match the exec/cpu_ldst.h functions, and
to emphasize that they are not callable from TCG directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h             | 78 ++++++++++++++++-------------------
 accel/tcg/cputlb.c            |  8 ++--
 accel/tcg/user-exec.c         | 59 ++++++++++++++++----------
 target/arm/helper-a64.c       |  8 ++--
 target/i386/tcg/mem_helper.c  | 15 +------
 target/m68k/op_helper.c       | 19 +++------
 target/ppc/mem_helper.c       | 16 +++----
 target/s390x/tcg/mem_helper.c | 19 ++++-----
 8 files changed, 104 insertions(+), 118 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 25dd19d6e1..44ccd86f3e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1341,31 +1341,32 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 # define helper_ret_stl_mmu   helper_le_stl_mmu
 # define helper_ret_stq_mmu   helper_le_stq_mmu
 #endif
+#endif /* CONFIG_SOFTMMU */
 
-uint32_t helper_atomic_cmpxchgb_mmu(CPUArchState *env, target_ulong addr,
+uint32_t cpu_atomic_cmpxchgb_mmu(CPUArchState *env, target_ulong addr,
+                                 uint32_t cmpv, uint32_t newv,
+                                 TCGMemOpIdx oi, uintptr_t retaddr);
+uint32_t cpu_atomic_cmpxchgw_le_mmu(CPUArchState *env, target_ulong addr,
                                     uint32_t cmpv, uint32_t newv,
                                     TCGMemOpIdx oi, uintptr_t retaddr);
-uint32_t helper_atomic_cmpxchgw_le_mmu(CPUArchState *env, target_ulong addr,
-                                       uint32_t cmpv, uint32_t newv,
-                                       TCGMemOpIdx oi, uintptr_t retaddr);
-uint32_t helper_atomic_cmpxchgl_le_mmu(CPUArchState *env, target_ulong addr,
-                                       uint32_t cmpv, uint32_t newv,
-                                       TCGMemOpIdx oi, uintptr_t retaddr);
-uint64_t helper_atomic_cmpxchgq_le_mmu(CPUArchState *env, target_ulong addr,
-                                       uint64_t cmpv, uint64_t newv,
-                                       TCGMemOpIdx oi, uintptr_t retaddr);
-uint32_t helper_atomic_cmpxchgw_be_mmu(CPUArchState *env, target_ulong addr,
-                                       uint32_t cmpv, uint32_t newv,
-                                       TCGMemOpIdx oi, uintptr_t retaddr);
-uint32_t helper_atomic_cmpxchgl_be_mmu(CPUArchState *env, target_ulong addr,
-                                       uint32_t cmpv, uint32_t newv,
-                                       TCGMemOpIdx oi, uintptr_t retaddr);
-uint64_t helper_atomic_cmpxchgq_be_mmu(CPUArchState *env, target_ulong addr,
-                                       uint64_t cmpv, uint64_t newv,
-                                       TCGMemOpIdx oi, uintptr_t retaddr);
+uint32_t cpu_atomic_cmpxchgl_le_mmu(CPUArchState *env, target_ulong addr,
+                                    uint32_t cmpv, uint32_t newv,
+                                    TCGMemOpIdx oi, uintptr_t retaddr);
+uint64_t cpu_atomic_cmpxchgq_le_mmu(CPUArchState *env, target_ulong addr,
+                                    uint64_t cmpv, uint64_t newv,
+                                    TCGMemOpIdx oi, uintptr_t retaddr);
+uint32_t cpu_atomic_cmpxchgw_be_mmu(CPUArchState *env, target_ulong addr,
+                                    uint32_t cmpv, uint32_t newv,
+                                    TCGMemOpIdx oi, uintptr_t retaddr);
+uint32_t cpu_atomic_cmpxchgl_be_mmu(CPUArchState *env, target_ulong addr,
+                                    uint32_t cmpv, uint32_t newv,
+                                    TCGMemOpIdx oi, uintptr_t retaddr);
+uint64_t cpu_atomic_cmpxchgq_be_mmu(CPUArchState *env, target_ulong addr,
+                                    uint64_t cmpv, uint64_t newv,
+                                    TCGMemOpIdx oi, uintptr_t retaddr);
 
 #define GEN_ATOMIC_HELPER(NAME, TYPE, SUFFIX)         \
-TYPE helper_atomic_ ## NAME ## SUFFIX ## _mmu         \
+TYPE cpu_atomic_ ## NAME ## SUFFIX ## _mmu            \
     (CPUArchState *env, target_ulong addr, TYPE val,  \
      TCGMemOpIdx oi, uintptr_t retaddr);
 
@@ -1411,31 +1412,22 @@ GEN_ATOMIC_HELPER_ALL(xchg)
 
 #undef GEN_ATOMIC_HELPER_ALL
 #undef GEN_ATOMIC_HELPER
-#endif /* CONFIG_SOFTMMU */
 
-/*
- * These aren't really a "proper" helpers because TCG cannot manage Int128.
- * However, use the same format as the others, for use by the backends.
- *
- * The cmpxchg functions are only defined if HAVE_CMPXCHG128;
- * the ld/st functions are only defined if HAVE_ATOMIC128,
- * as defined by <qemu/atomic128.h>.
- */
-Int128 helper_atomic_cmpxchgo_le_mmu(CPUArchState *env, target_ulong addr,
-                                     Int128 cmpv, Int128 newv,
-                                     TCGMemOpIdx oi, uintptr_t retaddr);
-Int128 helper_atomic_cmpxchgo_be_mmu(CPUArchState *env, target_ulong addr,
-                                     Int128 cmpv, Int128 newv,
-                                     TCGMemOpIdx oi, uintptr_t retaddr);
+Int128 cpu_atomic_cmpxchgo_le_mmu(CPUArchState *env, target_ulong addr,
+                                  Int128 cmpv, Int128 newv,
+                                  TCGMemOpIdx oi, uintptr_t retaddr);
+Int128 cpu_atomic_cmpxchgo_be_mmu(CPUArchState *env, target_ulong addr,
+                                  Int128 cmpv, Int128 newv,
+                                  TCGMemOpIdx oi, uintptr_t retaddr);
 
-Int128 helper_atomic_ldo_le_mmu(CPUArchState *env, target_ulong addr,
-                                TCGMemOpIdx oi, uintptr_t retaddr);
-Int128 helper_atomic_ldo_be_mmu(CPUArchState *env, target_ulong addr,
-                                TCGMemOpIdx oi, uintptr_t retaddr);
-void helper_atomic_sto_le_mmu(CPUArchState *env, target_ulong addr, Int128 val,
-                              TCGMemOpIdx oi, uintptr_t retaddr);
-void helper_atomic_sto_be_mmu(CPUArchState *env, target_ulong addr, Int128 val,
-                              TCGMemOpIdx oi, uintptr_t retaddr);
+Int128 cpu_atomic_ldo_le_mmu(CPUArchState *env, target_ulong addr,
+                             TCGMemOpIdx oi, uintptr_t retaddr);
+Int128 cpu_atomic_ldo_be_mmu(CPUArchState *env, target_ulong addr,
+                             TCGMemOpIdx oi, uintptr_t retaddr);
+void cpu_atomic_sto_le_mmu(CPUArchState *env, target_ulong addr, Int128 val,
+                           TCGMemOpIdx oi, uintptr_t retaddr);
+void cpu_atomic_sto_be_mmu(CPUArchState *env, target_ulong addr, Int128 val,
+                           TCGMemOpIdx oi, uintptr_t retaddr);
 
 #ifdef CONFIG_DEBUG_TCG
 void tcg_assert_listed_vecop(TCGOpcode);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b6d5fc6326..2ff72e0aed 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2686,12 +2686,14 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
     cpu_stq_le_data_ra(env, ptr, val, 0);
 }
 
-/* First set of helpers allows passing in of OI and RETADDR.  This makes
-   them callable from other helpers.  */
+/*
+ * First set of functions passes in OI and RETADDR.
+ * This makes them callable from other helpers.
+ */
 
 #define EXTRA_ARGS     , TCGMemOpIdx oi, uintptr_t retaddr
 #define ATOMIC_NAME(X) \
-    HELPER(glue(glue(glue(atomic_ ## X, SUFFIX), END), _mmu))
+    glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
 #define ATOMIC_MMU_DECLS
 #define ATOMIC_MMU_LOOKUP_RW \
     atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ | PAGE_WRITE, retaddr)
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ba09fd0413..82dbe06f08 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1234,19 +1234,23 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     return ret;
 }
 
-/* Macro to call the above, with local variables from the use context.  */
-#define ATOMIC_MMU_DECLS do {} while (0)
-#define ATOMIC_MMU_LOOKUP_RW  atomic_mmu_lookup(env, addr, DATA_SIZE, GETPC())
+#include "atomic_common.c.inc"
+
+/*
+ * First set of functions passes in OI and RETADDR.
+ * This makes them callable from other helpers.
+ */
+
+#define EXTRA_ARGS     , TCGMemOpIdx oi, uintptr_t retaddr
+#define ATOMIC_NAME(X) \
+    glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
+#define ATOMIC_MMU_DECLS
+#define ATOMIC_MMU_LOOKUP_RW  atomic_mmu_lookup(env, addr, DATA_SIZE, retaddr)
 #define ATOMIC_MMU_LOOKUP_R   ATOMIC_MMU_LOOKUP_RW
 #define ATOMIC_MMU_LOOKUP_W   ATOMIC_MMU_LOOKUP_RW
 #define ATOMIC_MMU_CLEANUP do { clear_helper_retaddr(); } while (0)
 #define ATOMIC_MMU_IDX MMU_USER_IDX
 
-#define ATOMIC_NAME(X)   HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
-#define EXTRA_ARGS
-
-#include "atomic_common.c.inc"
-
 #define DATA_SIZE 1
 #include "atomic_template.h"
 
@@ -1261,20 +1265,33 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 #include "atomic_template.h"
 #endif
 
-/* The following is only callable from other helpers, and matches up
-   with the softmmu version.  */
-
 #if HAVE_ATOMIC128 || HAVE_CMPXCHG128
-
-#undef EXTRA_ARGS
-#undef ATOMIC_NAME
-#undef ATOMIC_MMU_LOOKUP_RW
-
-#define EXTRA_ARGS     , TCGMemOpIdx oi, uintptr_t retaddr
-#define ATOMIC_NAME(X) \
-    HELPER(glue(glue(glue(atomic_ ## X, SUFFIX), END), _mmu))
-#define ATOMIC_MMU_LOOKUP_RW  atomic_mmu_lookup(env, addr, DATA_SIZE, retaddr)
-
 #define DATA_SIZE 16
 #include "atomic_template.h"
 #endif
+
+/*
+ * Second set of functions is directly callable from TCG.
+ */
+
+#undef EXTRA_ARGS
+#undef ATOMIC_NAME
+#undef ATOMIC_MMU_DECLS
+
+#define ATOMIC_NAME(X)   HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
+#define EXTRA_ARGS
+#define ATOMIC_MMU_DECLS uintptr_t retaddr = GETPC()
+
+#define DATA_SIZE 1
+#include "atomic_template.h"
+
+#define DATA_SIZE 2
+#include "atomic_template.h"
+
+#define DATA_SIZE 4
+#include "atomic_template.h"
+
+#ifdef CONFIG_ATOMIC64
+#define DATA_SIZE 8
+#include "atomic_template.h"
+#endif
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index ac5c4452d5..26f79f9141 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -564,7 +564,7 @@ uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
 
     cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
     newv = int128_make128(new_lo, new_hi);
-    oldv = helper_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
+    oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
 
     success = int128_eq(oldv, cmpv);
     return !success;
@@ -638,7 +638,7 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
      */
     cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
     newv = int128_make128(new_hi, new_lo);
-    oldv = helper_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
+    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
 
     success = int128_eq(oldv, cmpv);
     return !success;
@@ -660,7 +660,7 @@ void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
 
     cmpv = int128_make128(env->xregs[rs], env->xregs[rs + 1]);
     newv = int128_make128(new_lo, new_hi);
-    oldv = helper_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
+    oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
 
     env->xregs[rs] = int128_getlo(oldv);
     env->xregs[rs + 1] = int128_gethi(oldv);
@@ -681,7 +681,7 @@ void HELPER(casp_be_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
 
     cmpv = int128_make128(env->xregs[rs + 1], env->xregs[rs]);
     newv = int128_make128(new_lo, new_hi);
-    oldv = helper_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
+    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
 
     env->xregs[rs + 1] = int128_getlo(oldv);
     env->xregs[rs] = int128_gethi(oldv);
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 591f512bff..2da3cd14b6 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -64,22 +64,12 @@ void helper_cmpxchg8b(CPUX86State *env, target_ulong a0)
     cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
     newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
 
-#ifdef CONFIG_USER_ONLY
-    {
-        uint64_t *haddr = g2h(env_cpu(env), a0);
-        cmpv = cpu_to_le64(cmpv);
-        newv = cpu_to_le64(newv);
-        oldv = qatomic_cmpxchg__nocheck(haddr, cmpv, newv);
-        oldv = le64_to_cpu(oldv);
-    }
-#else
     {
         uintptr_t ra = GETPC();
         int mem_idx = cpu_mmu_index(env, false);
         TCGMemOpIdx oi = make_memop_idx(MO_TEQ, mem_idx);
-        oldv = helper_atomic_cmpxchgq_le_mmu(env, a0, cmpv, newv, oi, ra);
+        oldv = cpu_atomic_cmpxchgq_le_mmu(env, a0, cmpv, newv, oi, ra);
     }
-#endif
 
     if (oldv == cmpv) {
         eflags |= CC_Z;
@@ -147,8 +137,7 @@ void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
 
         int mem_idx = cpu_mmu_index(env, false);
         TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
-        Int128 oldv = helper_atomic_cmpxchgo_le_mmu(env, a0, cmpv,
-                                                    newv, oi, ra);
+        Int128 oldv = cpu_atomic_cmpxchgo_le_mmu(env, a0, cmpv, newv, oi, ra);
 
         if (int128_eq(oldv, cmpv)) {
             eflags |= CC_Z;
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index ae1ba4b437..d006d1cb3e 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "semihosting/semihost.h"
+#include "tcg/tcg.h"
 
 #if defined(CONFIG_USER_ONLY)
 
@@ -782,9 +783,9 @@ static void do_cas2l(CPUM68KState *env, uint32_t regs, uint32_t a1, uint32_t a2,
     uint32_t u2 = env->dregs[Du2];
     uint32_t l1, l2;
     uintptr_t ra = GETPC();
-#if defined(CONFIG_ATOMIC64) && !defined(CONFIG_USER_ONLY)
+#if defined(CONFIG_ATOMIC64)
     int mmu_idx = cpu_mmu_index(env, 0);
-    TCGMemOpIdx oi;
+    TCGMemOpIdx oi = make_memop_idx(MO_BEQ, mmu_idx);
 #endif
 
     if (parallel) {
@@ -794,23 +795,13 @@ static void do_cas2l(CPUM68KState *env, uint32_t regs, uint32_t a1, uint32_t a2,
         if ((a1 & 7) == 0 && a2 == a1 + 4) {
             c = deposit64(c2, 32, 32, c1);
             u = deposit64(u2, 32, 32, u1);
-#ifdef CONFIG_USER_ONLY
-            l = helper_atomic_cmpxchgq_be(env, a1, c, u);
-#else
-            oi = make_memop_idx(MO_BEQ, mmu_idx);
-            l = helper_atomic_cmpxchgq_be_mmu(env, a1, c, u, oi, ra);
-#endif
+            l = cpu_atomic_cmpxchgq_be_mmu(env, a1, c, u, oi, ra);
             l1 = l >> 32;
             l2 = l;
         } else if ((a2 & 7) == 0 && a1 == a2 + 4) {
             c = deposit64(c1, 32, 32, c2);
             u = deposit64(u1, 32, 32, u2);
-#ifdef CONFIG_USER_ONLY
-            l = helper_atomic_cmpxchgq_be(env, a2, c, u);
-#else
-            oi = make_memop_idx(MO_BEQ, mmu_idx);
-            l = helper_atomic_cmpxchgq_be_mmu(env, a2, c, u, oi, ra);
-#endif
+            l = cpu_atomic_cmpxchgq_be_mmu(env, a2, c, u, oi, ra);
             l2 = l >> 32;
             l1 = l;
         } else
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 444b2a30ef..e2282baa8d 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -376,7 +376,7 @@ uint64_t helper_lq_le_parallel(CPUPPCState *env, target_ulong addr,
 
     /* We will have raised EXCP_ATOMIC from the translator.  */
     assert(HAVE_ATOMIC128);
-    ret = helper_atomic_ldo_le_mmu(env, addr, opidx, GETPC());
+    ret = cpu_atomic_ldo_le_mmu(env, addr, opidx, GETPC());
     env->retxh = int128_gethi(ret);
     return int128_getlo(ret);
 }
@@ -388,7 +388,7 @@ uint64_t helper_lq_be_parallel(CPUPPCState *env, target_ulong addr,
 
     /* We will have raised EXCP_ATOMIC from the translator.  */
     assert(HAVE_ATOMIC128);
-    ret = helper_atomic_ldo_be_mmu(env, addr, opidx, GETPC());
+    ret = cpu_atomic_ldo_be_mmu(env, addr, opidx, GETPC());
     env->retxh = int128_gethi(ret);
     return int128_getlo(ret);
 }
@@ -401,7 +401,7 @@ void helper_stq_le_parallel(CPUPPCState *env, target_ulong addr,
     /* We will have raised EXCP_ATOMIC from the translator.  */
     assert(HAVE_ATOMIC128);
     val = int128_make128(lo, hi);
-    helper_atomic_sto_le_mmu(env, addr, val, opidx, GETPC());
+    cpu_atomic_sto_le_mmu(env, addr, val, opidx, GETPC());
 }
 
 void helper_stq_be_parallel(CPUPPCState *env, target_ulong addr,
@@ -412,7 +412,7 @@ void helper_stq_be_parallel(CPUPPCState *env, target_ulong addr,
     /* We will have raised EXCP_ATOMIC from the translator.  */
     assert(HAVE_ATOMIC128);
     val = int128_make128(lo, hi);
-    helper_atomic_sto_be_mmu(env, addr, val, opidx, GETPC());
+    cpu_atomic_sto_be_mmu(env, addr, val, opidx, GETPC());
 }
 
 uint32_t helper_stqcx_le_parallel(CPUPPCState *env, target_ulong addr,
@@ -429,8 +429,8 @@ uint32_t helper_stqcx_le_parallel(CPUPPCState *env, target_ulong addr,
 
         cmpv = int128_make128(env->reserve_val2, env->reserve_val);
         newv = int128_make128(new_lo, new_hi);
-        oldv = helper_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv,
-                                             opidx, GETPC());
+        oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv,
+                                          opidx, GETPC());
         success = int128_eq(oldv, cmpv);
     }
     env->reserve_addr = -1;
@@ -451,8 +451,8 @@ uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
 
         cmpv = int128_make128(env->reserve_val2, env->reserve_val);
         newv = int128_make128(new_lo, new_hi);
-        oldv = helper_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv,
-                                             opidx, GETPC());
+        oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv,
+                                          opidx, GETPC());
         success = int128_eq(oldv, cmpv);
     }
     env->reserve_addr = -1;
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 9bae13ecf0..21a4de4067 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1811,7 +1811,7 @@ void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
 
     mem_idx = cpu_mmu_index(env, false);
     oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
-    oldv = helper_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
+    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
     fail = !int128_eq(oldv, cmpv);
 
     env->cc_op = fail;
@@ -1884,7 +1884,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 ov = qatomic_cmpxchg__nocheck(haddr, cv, nv);
 #else
                 TCGMemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mem_idx);
-                ov = helper_atomic_cmpxchgl_be_mmu(env, a1, cv, nv, oi, ra);
+                ov = cpu_atomic_cmpxchgl_be_mmu(env, a1, cv, nv, oi, ra);
 #endif
             } else {
                 ov = cpu_ldl_data_ra(env, a1, ra);
@@ -1903,13 +1903,8 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
 
             if (parallel) {
 #ifdef CONFIG_ATOMIC64
-# ifdef CONFIG_USER_ONLY
-                uint64_t *haddr = g2h(env_cpu(env), a1);
-                ov = qatomic_cmpxchg__nocheck(haddr, cv, nv);
-# else
                 TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN, mem_idx);
-                ov = helper_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi, ra);
-# endif
+                ov = cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi, ra);
 #else
                 /* Note that we asserted !parallel above.  */
                 g_assert_not_reached();
@@ -1945,7 +1940,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 cpu_stq_data_ra(env, a1 + 8, int128_getlo(nv), ra);
             } else if (HAVE_CMPXCHG128) {
                 TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
-                ov = helper_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi, ra);
+                ov = cpu_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi, ra);
                 cc = !int128_eq(ov, cv);
             } else {
                 /* Note that we asserted !parallel above.  */
@@ -1985,7 +1980,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
             } else if (HAVE_ATOMIC128) {
                 TCGMemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
                 Int128 sv = int128_make128(svl, svh);
-                helper_atomic_sto_be_mmu(env, a2, sv, oi, ra);
+                cpu_atomic_sto_be_mmu(env, a2, sv, oi, ra);
             } else {
                 /* Note that we asserted !parallel above.  */
                 g_assert_not_reached();
@@ -2486,7 +2481,7 @@ uint64_t HELPER(lpq_parallel)(CPUS390XState *env, uint64_t addr)
 
     mem_idx = cpu_mmu_index(env, false);
     oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
-    v = helper_atomic_ldo_be_mmu(env, addr, oi, ra);
+    v = cpu_atomic_ldo_be_mmu(env, addr, oi, ra);
     hi = int128_gethi(v);
     lo = int128_getlo(v);
 
@@ -2518,7 +2513,7 @@ void HELPER(stpq_parallel)(CPUS390XState *env, uint64_t addr,
     mem_idx = cpu_mmu_index(env, false);
     oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
     v = int128_make128(low, high);
-    helper_atomic_sto_be_mmu(env, addr, v, oi, ra);
+    cpu_atomic_sto_be_mmu(env, addr, v, oi, ra);
 }
 
 /* Execute instruction.  This instruction executes an insn modified with
-- 
2.25.1


