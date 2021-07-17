Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17A3CC5E3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:29:53 +0200 (CEST)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4q0W-0000Qn-TZ
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvK-00042C-4S
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:30 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvE-0002k4-Uu
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id w15so14019989pgk.13
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FJE26e9jkKYuDVjlIY4eNK3Z4AYayPeoPy0X3M1x/0=;
 b=qAZ/GZpbNNKCveYA/jyLlSLQrQojqt0Kn3W1KliKpV+L8wUYYk73sx0IsUNwt+hPIW
 FRL0bJDLzmQ/hLjNi4DAJBEKvUsrpH5fT4/GeXRgsmX9BnBE+W7vlJivNoM2P5Mo3jB1
 RTUuHLkhu6NJRDLqyrE7EnLU0ys6OZie5DNsLhI5rtwhSEoj4l3qPGVmsm5h80ZAztm4
 5PYjShkEVlZ384K0MJvBECsxK7/pWRW6DbhBH1Snj3Pab5ssf1+eIJo1+XxZN9RkfjIa
 UOP4r9e1wY8XQ8yGqd1yOYe96tGaw4df/u4EWTV9k8T14XTJWc9iZqaFS6V6QMlcdEhM
 iRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FJE26e9jkKYuDVjlIY4eNK3Z4AYayPeoPy0X3M1x/0=;
 b=UYS4zCVjlvwyvaQy3/krc6vwChBwFqHR1VJNAh1Vu6zfTVwVNaPY6UHcP9bcnDJa96
 SWHEZzdL61RVgiq6Epr5FlReOB3TWAhNZPBnBspJ2hn97tHx1+QRSe1bP8eQ4YBF4oF5
 QiV2Ds3ifzVqIxrCzc3/tMezOGAE4Gnc+8V/Gcp+/mecjMX70FPsojNayc94rNymTdTa
 WewDBHYL1mJUosFg5CpbQcQn4qUJHm2+ygzeCpFyLAbsUzsK+cisqjBmrqMaM/lvJG++
 clkw9EXkw+tFmIeDx+QkYGyXbb8blD62AVJwgz5t9bZkyrwQBWFcxhHvSIGMwu+fb54o
 rfMg==
X-Gm-Message-State: AOAM532pgPFmSpzLhtRUfcEzFddB75s/cuQWKG9MwdiDkd1m6N1eSRSJ
 o74E3BaIECMQU4NNhrVv5gtKS2S9l/9IMQ==
X-Google-Smtp-Source: ABdhPJxHqekBpf3wXOdYRrKIqXbnm0oieQuK9wtYunbXiaQP2dS4O7d6Xe/G6QRAKQ3Kkatoixp4pA==
X-Received: by 2002:a62:1d86:0:b029:32a:311a:9595 with SMTP id
 d128-20020a621d860000b029032a311a9595mr16989162pfd.74.1626549863668; 
 Sat, 17 Jul 2021 12:24:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/10] accel/tcg: Standardize atomic helpers on softmmu api
Date: Sat, 17 Jul 2021 12:24:14 -0700
Message-Id: <20210717192419.2066778-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Reduce the amount of code duplication by always passing
the TCGMemOpIdx argument to helper_atomic_*.  This is not
currently used for user-only, but it's easy to ignore.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h       | 46 -----------------------
 accel/tcg/cputlb.c            | 32 ----------------
 accel/tcg/user-exec.c         | 26 -------------
 tcg/tcg-op.c                  | 47 ++++-------------------
 accel/tcg/atomic_common.c.inc | 70 +++++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 143 deletions(-)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 91a5b7e85f..37cbd722bf 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -39,8 +39,6 @@ DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_FLAGS_3(memset, TCG_CALL_NO_RWG, ptr, ptr, int, ptr)
 #endif /* IN_HELPER_PROTO */
 
-#ifdef CONFIG_SOFTMMU
-
 DEF_HELPER_FLAGS_5(atomic_cmpxchgb, TCG_CALL_NO_WG,
                    i32, env, tl, i32, i32, i32)
 DEF_HELPER_FLAGS_5(atomic_cmpxchgw_be, TCG_CALL_NO_WG,
@@ -88,50 +86,6 @@ DEF_HELPER_FLAGS_5(atomic_cmpxchgq_le, TCG_CALL_NO_WG,
                        TCG_CALL_NO_WG, i32, env, tl, i32, i32)
 #endif /* CONFIG_ATOMIC64 */
 
-#else
-
-DEF_HELPER_FLAGS_4(atomic_cmpxchgb, TCG_CALL_NO_WG, i32, env, tl, i32, i32)
-DEF_HELPER_FLAGS_4(atomic_cmpxchgw_be, TCG_CALL_NO_WG, i32, env, tl, i32, i32)
-DEF_HELPER_FLAGS_4(atomic_cmpxchgw_le, TCG_CALL_NO_WG, i32, env, tl, i32, i32)
-DEF_HELPER_FLAGS_4(atomic_cmpxchgl_be, TCG_CALL_NO_WG, i32, env, tl, i32, i32)
-DEF_HELPER_FLAGS_4(atomic_cmpxchgl_le, TCG_CALL_NO_WG, i32, env, tl, i32, i32)
-#ifdef CONFIG_ATOMIC64
-DEF_HELPER_FLAGS_4(atomic_cmpxchgq_be, TCG_CALL_NO_WG, i64, env, tl, i64, i64)
-DEF_HELPER_FLAGS_4(atomic_cmpxchgq_le, TCG_CALL_NO_WG, i64, env, tl, i64, i64)
-#endif
-
-#ifdef CONFIG_ATOMIC64
-#define GEN_ATOMIC_HELPERS(NAME)                             \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), b),         \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), w_le),      \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), w_be),      \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), l_le),      \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), l_be),      \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), q_le),      \
-                       TCG_CALL_NO_WG, i64, env, tl, i64)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), q_be),      \
-                       TCG_CALL_NO_WG, i64, env, tl, i64)
-#else
-#define GEN_ATOMIC_HELPERS(NAME)                             \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), b),         \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), w_le),      \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), w_be),      \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), l_le),      \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)    \
-    DEF_HELPER_FLAGS_3(glue(glue(atomic_, NAME), l_be),      \
-                       TCG_CALL_NO_WG, i32, env, tl, i32)
-#endif /* CONFIG_ATOMIC64 */
-
-#endif /* CONFIG_SOFTMMU */
-
 GEN_ATOMIC_HELPERS(fetch_add)
 GEN_ATOMIC_HELPERS(fetch_and)
 GEN_ATOMIC_HELPERS(fetch_or)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 63da1cc96f..842cf4b572 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2725,38 +2725,6 @@ void cpu_stq_le_data(CPUArchState *env, target_ulong ptr, uint64_t val)
 #include "atomic_template.h"
 #endif
 
-/* Second set of helpers are directly callable from TCG as helpers.  */
-
-#undef EXTRA_ARGS
-#undef ATOMIC_NAME
-#undef ATOMIC_MMU_LOOKUP_RW
-#undef ATOMIC_MMU_LOOKUP_R
-#undef ATOMIC_MMU_LOOKUP_W
-
-#define EXTRA_ARGS         , TCGMemOpIdx oi
-#define ATOMIC_NAME(X)     HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
-#define ATOMIC_MMU_LOOKUP_RW \
-    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ | PAGE_WRITE, GETPC())
-#define ATOMIC_MMU_LOOKUP_R \
-    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_READ, GETPC())
-#define ATOMIC_MMU_LOOKUP_W \
-    atomic_mmu_lookup(env, addr, oi, DATA_SIZE, PAGE_WRITE, GETPC())
-
-#define DATA_SIZE 1
-#include "atomic_template.h"
-
-#define DATA_SIZE 2
-#include "atomic_template.h"
-
-#define DATA_SIZE 4
-#include "atomic_template.h"
-
-#ifdef CONFIG_ATOMIC64
-#define DATA_SIZE 8
-#include "atomic_template.h"
-#endif
-#undef ATOMIC_MMU_IDX
-
 /* Code access functions.  */
 
 static uint64_t full_ldub_code(CPUArchState *env, target_ulong addr,
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 82dbe06f08..7e92d6b875 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1269,29 +1269,3 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 #define DATA_SIZE 16
 #include "atomic_template.h"
 #endif
-
-/*
- * Second set of functions is directly callable from TCG.
- */
-
-#undef EXTRA_ARGS
-#undef ATOMIC_NAME
-#undef ATOMIC_MMU_DECLS
-
-#define ATOMIC_NAME(X)   HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
-#define EXTRA_ARGS
-#define ATOMIC_MMU_DECLS uintptr_t retaddr = GETPC()
-
-#define DATA_SIZE 1
-#include "atomic_template.h"
-
-#define DATA_SIZE 2
-#include "atomic_template.h"
-
-#define DATA_SIZE 4
-#include "atomic_template.h"
-
-#ifdef CONFIG_ATOMIC64
-#define DATA_SIZE 8
-#include "atomic_template.h"
-#endif
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 0c561fb253..66829be6ba 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3084,7 +3084,6 @@ static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, MemOp opc)
     }
 }
 
-#ifdef CONFIG_SOFTMMU
 typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv,
                                   TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv,
@@ -3093,12 +3092,6 @@ typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv,
                                   TCGv_i32, TCGv_i32);
 typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
                                   TCGv_i64, TCGv_i32);
-#else
-typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv, TCGv_i32, TCGv_i32);
-typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv, TCGv_i64, TCGv_i64);
-typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv, TCGv_i32);
-typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv, TCGv_i64);
-#endif
 
 #ifdef CONFIG_ATOMIC64
 # define WITH_ATOMIC64(X) X,
@@ -3144,14 +3137,8 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
         gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
         tcg_debug_assert(gen != NULL);
 
-#ifdef CONFIG_SOFTMMU
-        {
-            TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
-            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
-        }
-#else
-        gen(retv, cpu_env, addr, cmpv, newv);
-#endif
+        TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
 
         if (memop & MO_SIGN) {
             tcg_gen_ext_i32(retv, retv, memop);
@@ -3188,14 +3175,8 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
         gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
         tcg_debug_assert(gen != NULL);
 
-#ifdef CONFIG_SOFTMMU
-        {
-            TCGMemOpIdx oi = make_memop_idx(memop, idx);
-            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
-        }
-#else
-        gen(retv, cpu_env, addr, cmpv, newv);
-#endif
+        TCGMemOpIdx oi = make_memop_idx(memop, idx);
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
 #else
         gen_helper_exit_atomic(cpu_env);
         /* Produce a result, so that we have a well-formed opcode stream
@@ -3251,14 +3232,8 @@ static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
     gen = table[memop & (MO_SIZE | MO_BSWAP)];
     tcg_debug_assert(gen != NULL);
 
-#ifdef CONFIG_SOFTMMU
-    {
-        TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
-        gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
-    }
-#else
-    gen(ret, cpu_env, addr, val);
-#endif
+    TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
+    gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
 
     if (memop & MO_SIGN) {
         tcg_gen_ext_i32(ret, ret, memop);
@@ -3296,14 +3271,8 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
         gen = table[memop & (MO_SIZE | MO_BSWAP)];
         tcg_debug_assert(gen != NULL);
 
-#ifdef CONFIG_SOFTMMU
-        {
-            TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
-            gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
-        }
-#else
-        gen(ret, cpu_env, addr, val);
-#endif
+        TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
+        gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
 #else
         gen_helper_exit_atomic(cpu_env);
         /* Produce a result, so that we have a well-formed opcode stream
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index 344525b0bb..a668cf0d6f 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -52,3 +52,73 @@ void atomic_trace_st_post(CPUArchState *env, target_ulong addr, uint16_t info)
 {
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
 }
+
+/*
+ * Atomic helpers callable from TCG.
+ * These have a common interface and all defer to cpu_atomic_*
+ * using the host return address from GETPC().
+ */
+
+#define CMPXCHG_HELPER(OP, TYPE) \
+    TYPE HELPER(atomic_##OP)(CPUArchState *env, target_ulong addr,  \
+                             TYPE oldv, TYPE newv, uint32_t oi)     \
+    { return cpu_atomic_##OP##_mmu(env, addr, oldv, newv, oi, GETPC()); }
+
+CMPXCHG_HELPER(cmpxchgb, uint32_t)
+CMPXCHG_HELPER(cmpxchgw_be, uint32_t)
+CMPXCHG_HELPER(cmpxchgw_le, uint32_t)
+CMPXCHG_HELPER(cmpxchgl_be, uint32_t)
+CMPXCHG_HELPER(cmpxchgl_le, uint32_t)
+
+#ifdef CONFIG_ATOMIC64
+CMPXCHG_HELPER(cmpxchgq_be, uint64_t)
+CMPXCHG_HELPER(cmpxchgq_le, uint64_t)
+#endif
+
+#undef CMPXCHG_HELPER
+
+#define ATOMIC_HELPER(OP, TYPE) \
+    TYPE HELPER(glue(atomic_,OP))(CPUArchState *env, target_ulong addr,  \
+                                  TYPE val, uint32_t oi)                 \
+    { return glue(glue(cpu_atomic_,OP),_mmu)(env, addr, val, oi, GETPC()); }
+
+#ifdef CONFIG_ATOMIC64
+#define GEN_ATOMIC_HELPERS(OP)              \
+    ATOMIC_HELPER(glue(OP,b), uint32_t)     \
+    ATOMIC_HELPER(glue(OP,w_be), uint32_t)  \
+    ATOMIC_HELPER(glue(OP,w_le), uint32_t)  \
+    ATOMIC_HELPER(glue(OP,l_be), uint32_t)  \
+    ATOMIC_HELPER(glue(OP,l_le), uint32_t)  \
+    ATOMIC_HELPER(glue(OP,q_be), uint64_t)  \
+    ATOMIC_HELPER(glue(OP,q_le), uint64_t)
+#else
+#define GEN_ATOMIC_HELPERS(OP)              \
+    ATOMIC_HELPER(glue(OP,b), uint32_t)     \
+    ATOMIC_HELPER(glue(OP,w_be), uint32_t)  \
+    ATOMIC_HELPER(glue(OP,w_le), uint32_t)  \
+    ATOMIC_HELPER(glue(OP,l_be), uint32_t)  \
+    ATOMIC_HELPER(glue(OP,l_le), uint32_t)
+#endif
+
+GEN_ATOMIC_HELPERS(fetch_add)
+GEN_ATOMIC_HELPERS(fetch_and)
+GEN_ATOMIC_HELPERS(fetch_or)
+GEN_ATOMIC_HELPERS(fetch_xor)
+GEN_ATOMIC_HELPERS(fetch_smin)
+GEN_ATOMIC_HELPERS(fetch_umin)
+GEN_ATOMIC_HELPERS(fetch_smax)
+GEN_ATOMIC_HELPERS(fetch_umax)
+
+GEN_ATOMIC_HELPERS(add_fetch)
+GEN_ATOMIC_HELPERS(and_fetch)
+GEN_ATOMIC_HELPERS(or_fetch)
+GEN_ATOMIC_HELPERS(xor_fetch)
+GEN_ATOMIC_HELPERS(smin_fetch)
+GEN_ATOMIC_HELPERS(umin_fetch)
+GEN_ATOMIC_HELPERS(smax_fetch)
+GEN_ATOMIC_HELPERS(umax_fetch)
+
+GEN_ATOMIC_HELPERS(xchg)
+
+#undef ATOMIC_HELPER
+#undef GEN_ATOMIC_HELPERS
-- 
2.25.1


