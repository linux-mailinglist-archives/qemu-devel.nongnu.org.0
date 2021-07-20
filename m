Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE23D0403
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:44:18 +0200 (CEST)
Received: from localhost ([::1]:36470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xXE-0000FX-0r
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQo-00063A-3S
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:38 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQl-0000Ea-RL
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:37 -0400
Received: by mail-pg1-x535.google.com with SMTP id k20so23755938pgg.7
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E44AAclzpTIljt+uwc9zjVKN1U0J8m7T2mfXeYGPYLM=;
 b=w2Us82DZ/VUD+G5aiht3PIdYkSJ9PyfOxyB0ZRc85DyBwCNxaqamltjVDc7LBDlp8N
 M9Jv1RdnkhU0igp18J1pXjKeoY/8bqT4z3kqnLDovWG7tefGj7Yt+LQRstP8eISix4EP
 CCK+FeBZS+g8C4gGUVMwtGRWd9BdLbpejuFnT1/BQR1LFx2VVop/fz0z91b4LGspodnJ
 P+tE6/LC2md8pa5Fxpc+WkOmZ5ycFkqYfcBhSI94UYWH6ojax3nL2LTqKh+U864KuGpU
 IUiC4OQotkqVdfImr42KFPWqiBSb6uAJgh5aE/XKp0SLsDsvynO/hP/rz59vfFFTy+h6
 emiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E44AAclzpTIljt+uwc9zjVKN1U0J8m7T2mfXeYGPYLM=;
 b=fGuGf02wINTlYW2LEKHfTbLX9kG4x79V/80UrLIPTYqi91oBDh6n1ELLUh+NoGg3Zj
 hI3d0c9HWp16Q2Q+BzcGACQ+3fiLbP3fKbYcYHJpzxf07X/Z7v/efNZJD+FyPQA5d/qo
 DrNVxC05H/a3JP4bp7FiIBDSEZ0BcnpYZoJ/WZpA2CG0k4DKiZbYj4yZ44/y9A9vsD8Y
 j4mF0klXgEdKXrsEQ4rAL9Ug2Hr5ibd7s/QVoZPirCtECgZVBqJgPBSej2o79N4qxwkp
 wFmqxSfN917ahrZgsM5zcv6qsaSoKuZ9QB1Zxy/ftjoH06bqgxuom9A2MVlumoiMvHY2
 rhQw==
X-Gm-Message-State: AOAM5315XJcEbJjAqD21OyXMMa8eOjly1IKORLSKR3g5PUD5ZLdsinVK
 gOwcFHjqgI+DpQnsPWXukcbyP5zlpwcWng==
X-Google-Smtp-Source: ABdhPJz0qJEPtCtoMQ2xdGOLrY08fOuYldUl+WywFpR2y7ynA8PSRv/fAMYObfObrDIw6qDbI4u7cA==
X-Received: by 2002:a63:a01:: with SMTP id 1mr32312831pgk.360.1626817053746;
 Tue, 20 Jul 2021 14:37:33 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/10] accel/tcg: Standardize atomic helpers on softmmu api
Date: Tue, 20 Jul 2021 11:37:18 -1000
Message-Id: <20210720213723.630552-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720213723.630552-1-richard.henderson@linaro.org>
References: <20210720213723.630552-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reduce the amount of code duplication by always passing
the TCGMemOpIdx argument to helper_atomic_*.  This is not
currently used for user-only, but it's easy to ignore.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h       | 46 -----------------------
 accel/tcg/cputlb.c            | 32 ----------------
 accel/tcg/user-exec.c         | 26 -------------
 tcg/tcg-op.c                  | 51 ++++++-------------------
 accel/tcg/atomic_common.c.inc | 70 +++++++++++++++++++++++++++++++++++
 5 files changed, 82 insertions(+), 143 deletions(-)

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
index 0c561fb253..75eaa910c9 100644
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
@@ -3140,18 +3133,13 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
         tcg_temp_free_i32(t1);
     } else {
         gen_atomic_cx_i32 gen;
+        TCGMemOpIdx oi;
 
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
+        oi = make_memop_idx(memop & ~MO_SIGN, idx);
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
 
         if (memop & MO_SIGN) {
             tcg_gen_ext_i32(retv, retv, memop);
@@ -3184,18 +3172,13 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
     } else if ((memop & MO_SIZE) == MO_64) {
 #ifdef CONFIG_ATOMIC64
         gen_atomic_cx_i64 gen;
+        TCGMemOpIdx oi;
 
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
+        oi = make_memop_idx(memop, idx);
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
 #else
         gen_helper_exit_atomic(cpu_env);
         /* Produce a result, so that we have a well-formed opcode stream
@@ -3245,20 +3228,15 @@ static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
                              TCGArg idx, MemOp memop, void * const table[])
 {
     gen_atomic_op_i32 gen;
+    TCGMemOpIdx oi;
 
     memop = tcg_canonicalize_memop(memop, 0, 0);
 
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
+    oi = make_memop_idx(memop & ~MO_SIGN, idx);
+    gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
 
     if (memop & MO_SIGN) {
         tcg_gen_ext_i32(ret, ret, memop);
@@ -3292,18 +3270,13 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
     if ((memop & MO_SIZE) == MO_64) {
 #ifdef CONFIG_ATOMIC64
         gen_atomic_op_i64 gen;
+        TCGMemOpIdx oi;
 
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
+        oi = make_memop_idx(memop & ~MO_SIGN, idx);
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


