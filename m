Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E186F5182
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:30:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pP-0007zG-Dj; Wed, 03 May 2023 03:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0006pe-T1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oq-0007IF-KU
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:38 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso49244075e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098550; x=1685690550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYUE9gPxMRNF7+vT1TWVzEuDtvHTnL9W9dfDsaNgc7M=;
 b=gbolJf9OuZ7SjYC96bZMg/nBqMegxkdTp6cPlLcsB0mwpt5vfT3lfStXnRlb1UC+cr
 mSh9WPOLue8PfCIvA5/IUR/CeR16xRhy3E2guH+hL85+3zHbdD1bPFzNVMQG037kfi5n
 xEC8vxAWHJSODliOCBjQJPKkjZVf50NnmOmTJI3WfV81IdU1NjTydw+cAQS8hB96IOr3
 LvAsrc/QVaOYhqQQeBY1J073ewOEGZQuBmIapZh2St/13Z1ob2tY2HuFKHU4niSklQCi
 bFagx1Y0maNePzMedQhOC9/9AbdbXE7ASg73I2soskI8KkSvexlGOOrfIzuKDWSg2bxc
 XzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098550; x=1685690550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYUE9gPxMRNF7+vT1TWVzEuDtvHTnL9W9dfDsaNgc7M=;
 b=b8UIYnkOu2XJzW2rHqQqWrj9fmFdn5cIrwbg0+0GGitLd5uQlNOYhe04ZzpadQe8Fw
 N1eYKobPzpRVxr/arfAij1Pcg9FTvq21vBsRBT+RZuiZscijqQD6oeHYxk69y0q8tEOz
 o4N7DNK+IyPqdGB7aYPqcH1NVr9cFa4imfAzO6t4M9N5u0W3QxHsb0zgmcKbQf0z4WvL
 B9PPppb+aWxLYKQo7MRVbGY42QVbuaLO2awL0yPv81CbXgVWORvs4LsWCnZMRQE9k0zW
 yjzpLEr5N1rckHtkql4OM7/WaUwJFlWiEuIvaJ0L22mS1qJlinTQPg12avF0ahZh3D9J
 gGHQ==
X-Gm-Message-State: AC+VfDyigca7TexCLiQJTEoqAEt97MZxFaU53wnWGbMRc/RR2jFaOXuu
 qdjLkSIm/oh5UGjCDHaF1gQYPE+OnSnD3r+L1vugiA==
X-Google-Smtp-Source: ACHHUZ5tM2m13YN3pkn1dBqiS8fzqWBgOX9mhSGzb03G4SWESAfmB9uCZyus8kUWdhXv6lij1CCAzg==
X-Received: by 2002:a7b:cc1a:0:b0:3f1:969f:c9d0 with SMTP id
 f26-20020a7bcc1a000000b003f1969fc9d0mr13711505wmh.4.1683098549697; 
 Wed, 03 May 2023 00:22:29 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 05/84] tcg: Widen helper_atomic_* addresses to uint64_t
Date: Wed,  3 May 2023 08:20:55 +0100
Message-Id: <20230503072221.1746802-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Always pass the target address as uint64_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h       | 46 +++++++++++++++++------------------
 tcg/tcg-op-ldst.c             | 38 ++++++++++++++++++++---------
 accel/tcg/atomic_common.c.inc | 14 +++++------
 3 files changed, 57 insertions(+), 41 deletions(-)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 0e6c5f55fd..6f8c2061d0 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -43,61 +43,61 @@ DEF_HELPER_FLAGS_3(ld_i128, TCG_CALL_NO_WG, i128, env, i64, i32)
 DEF_HELPER_FLAGS_4(st_i128, TCG_CALL_NO_WG, void, env, i64, i128, i32)
 
 DEF_HELPER_FLAGS_5(atomic_cmpxchgb, TCG_CALL_NO_WG,
-                   i32, env, tl, i32, i32, i32)
+                   i32, env, i64, i32, i32, i32)
 DEF_HELPER_FLAGS_5(atomic_cmpxchgw_be, TCG_CALL_NO_WG,
-                   i32, env, tl, i32, i32, i32)
+                   i32, env, i64, i32, i32, i32)
 DEF_HELPER_FLAGS_5(atomic_cmpxchgw_le, TCG_CALL_NO_WG,
-                   i32, env, tl, i32, i32, i32)
+                   i32, env, i64, i32, i32, i32)
 DEF_HELPER_FLAGS_5(atomic_cmpxchgl_be, TCG_CALL_NO_WG,
-                   i32, env, tl, i32, i32, i32)
+                   i32, env, i64, i32, i32, i32)
 DEF_HELPER_FLAGS_5(atomic_cmpxchgl_le, TCG_CALL_NO_WG,
-                   i32, env, tl, i32, i32, i32)
+                   i32, env, i64, i32, i32, i32)
 #ifdef CONFIG_ATOMIC64
 DEF_HELPER_FLAGS_5(atomic_cmpxchgq_be, TCG_CALL_NO_WG,
-                   i64, env, tl, i64, i64, i32)
+                   i64, env, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_5(atomic_cmpxchgq_le, TCG_CALL_NO_WG,
-                   i64, env, tl, i64, i64, i32)
+                   i64, env, i64, i64, i64, i32)
 #endif
 #ifdef CONFIG_CMPXCHG128
 DEF_HELPER_FLAGS_5(atomic_cmpxchgo_be, TCG_CALL_NO_WG,
-                   i128, env, tl, i128, i128, i32)
+                   i128, env, i64, i128, i128, i32)
 DEF_HELPER_FLAGS_5(atomic_cmpxchgo_le, TCG_CALL_NO_WG,
-                   i128, env, tl, i128, i128, i32)
+                   i128, env, i64, i128, i128, i32)
 #endif
 
 DEF_HELPER_FLAGS_5(nonatomic_cmpxchgo_be, TCG_CALL_NO_WG,
-                   i128, env, tl, i128, i128, i32)
+                   i128, env, i64, i128, i128, i32)
 DEF_HELPER_FLAGS_5(nonatomic_cmpxchgo_le, TCG_CALL_NO_WG,
-                   i128, env, tl, i128, i128, i32)
+                   i128, env, i64, i128, i128, i32)
 
 #ifdef CONFIG_ATOMIC64
 #define GEN_ATOMIC_HELPERS(NAME)                                  \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), b),              \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), w_le),           \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), w_be),           \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), l_le),           \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), l_be),           \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), q_le),           \
-                       TCG_CALL_NO_WG, i64, env, tl, i64, i32)    \
+                       TCG_CALL_NO_WG, i64, env, i64, i64, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), q_be),           \
-                       TCG_CALL_NO_WG, i64, env, tl, i64, i32)
+                       TCG_CALL_NO_WG, i64, env, i64, i64, i32)
 #else
 #define GEN_ATOMIC_HELPERS(NAME)                                  \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), b),              \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), w_le),           \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), w_be),           \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), l_le),           \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)    \
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)   \
     DEF_HELPER_FLAGS_4(glue(glue(atomic_, NAME), l_be),           \
-                       TCG_CALL_NO_WG, i32, env, tl, i32, i32)
+                       TCG_CALL_NO_WG, i32, env, i64, i32, i32)
 #endif /* CONFIG_ATOMIC64 */
 
 GEN_ATOMIC_HELPERS(fetch_add)
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index 0010afb1a1..17fe35b93c 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -634,15 +634,15 @@ static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, MemOp opc)
     }
 }
 
-typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv,
+typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv_i64,
                                   TCGv_i32, TCGv_i32, TCGv_i32);
-typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv,
+typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv_i64,
                                   TCGv_i64, TCGv_i64, TCGv_i32);
-typedef void (*gen_atomic_cx_i128)(TCGv_i128, TCGv_env, TCGv,
+typedef void (*gen_atomic_cx_i128)(TCGv_i128, TCGv_env, TCGv_i64,
                                    TCGv_i128, TCGv_i128, TCGv_i32);
-typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv,
+typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv_i64,
                                   TCGv_i32, TCGv_i32);
-typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
+typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv_i64,
                                   TCGv_i64, TCGv_i32);
 
 #ifdef CONFIG_ATOMIC64
@@ -693,6 +693,7 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
                                 TCGv_i32 newv, TCGArg idx, MemOp memop)
 {
     gen_atomic_cx_i32 gen;
+    TCGv_i64 a64;
     MemOpIdx oi;
 
     if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
@@ -705,7 +706,9 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
     tcg_debug_assert(gen != NULL);
 
     oi = make_memop_idx(memop & ~MO_SIGN, idx);
-    gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+    a64 = maybe_extend_addr64(addr);
+    gen(retv, cpu_env, a64, cmpv, newv, tcg_constant_i32(oi));
+    maybe_free_addr64(a64);
 
     if (memop & MO_SIGN) {
         tcg_gen_ext_i32(retv, retv, memop);
@@ -761,7 +764,9 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
         gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
         if (gen) {
             MemOpIdx oi = make_memop_idx(memop, idx);
-            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+            TCGv_i64 a64 = maybe_extend_addr64(addr);
+            gen(retv, cpu_env, a64, cmpv, newv, tcg_constant_i32(oi));
+            maybe_free_addr64(a64);
             return;
         }
 
@@ -813,11 +818,14 @@ void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
                                   ? gen_helper_nonatomic_cmpxchgo_le
                                   : gen_helper_nonatomic_cmpxchgo_be);
         MemOpIdx oi = make_memop_idx(memop, idx);
+        TCGv_i64 a64;
 
         tcg_debug_assert((memop & MO_SIZE) == MO_128);
         tcg_debug_assert((memop & MO_SIGN) == 0);
 
-        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+        a64 = maybe_extend_addr64(addr);
+        gen(retv, cpu_env, a64, cmpv, newv, tcg_constant_i32(oi));
+        maybe_free_addr64(a64);
     } else {
         TCGv_i128 oldv = tcg_temp_ebb_new_i128();
         TCGv_i128 tmpv = tcg_temp_ebb_new_i128();
@@ -865,7 +873,9 @@ void tcg_gen_atomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
 
     if (gen) {
         MemOpIdx oi = make_memop_idx(memop, idx);
-        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+        TCGv_i64 a64 = maybe_extend_addr64(addr);
+        gen(retv, cpu_env, a64, cmpv, newv, tcg_constant_i32(oi));
+        maybe_free_addr64(a64);
         return;
     }
 
@@ -903,6 +913,7 @@ static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
                              TCGArg idx, MemOp memop, void * const table[])
 {
     gen_atomic_op_i32 gen;
+    TCGv_i64 a64;
     MemOpIdx oi;
 
     memop = tcg_canonicalize_memop(memop, 0, 0);
@@ -911,7 +922,9 @@ static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
     tcg_debug_assert(gen != NULL);
 
     oi = make_memop_idx(memop & ~MO_SIGN, idx);
-    gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
+    a64 = maybe_extend_addr64(addr);
+    gen(ret, cpu_env, a64, val, tcg_constant_i32(oi));
+    maybe_free_addr64(a64);
 
     if (memop & MO_SIGN) {
         tcg_gen_ext_i32(ret, ret, memop);
@@ -945,13 +958,16 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
     if ((memop & MO_SIZE) == MO_64) {
 #ifdef CONFIG_ATOMIC64
         gen_atomic_op_i64 gen;
+        TCGv_i64 a64;
         MemOpIdx oi;
 
         gen = table[memop & (MO_SIZE | MO_BSWAP)];
         tcg_debug_assert(gen != NULL);
 
         oi = make_memop_idx(memop & ~MO_SIGN, idx);
-        gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
+        a64 = maybe_extend_addr64(addr);
+        gen(ret, cpu_env, a64, val, tcg_constant_i32(oi));
+        maybe_free_addr64(a64);
 #else
         gen_helper_exit_atomic(cpu_env);
         /* Produce a result, so that we have a well-formed opcode stream
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index 8f2ce43ee6..fe0eea018f 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -13,20 +13,20 @@
  * See the COPYING file in the top-level directory.
  */
 
-static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
+static void atomic_trace_rmw_post(CPUArchState *env, uint64_t addr,
                                   MemOpIdx oi)
 {
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_RW);
 }
 
 #if HAVE_ATOMIC128
-static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
+static void atomic_trace_ld_post(CPUArchState *env, uint64_t addr,
                                  MemOpIdx oi)
 {
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
 }
 
-static void atomic_trace_st_post(CPUArchState *env, target_ulong addr,
+static void atomic_trace_st_post(CPUArchState *env, uint64_t addr,
                                  MemOpIdx oi)
 {
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
@@ -40,7 +40,7 @@ static void atomic_trace_st_post(CPUArchState *env, target_ulong addr,
  */
 
 #define CMPXCHG_HELPER(OP, TYPE) \
-    TYPE HELPER(atomic_##OP)(CPUArchState *env, target_ulong addr,  \
+    TYPE HELPER(atomic_##OP)(CPUArchState *env, uint64_t addr,      \
                              TYPE oldv, TYPE newv, uint32_t oi)     \
     { return cpu_atomic_##OP##_mmu(env, addr, oldv, newv, oi, GETPC()); }
 
@@ -62,7 +62,7 @@ CMPXCHG_HELPER(cmpxchgo_le, Int128)
 
 #undef CMPXCHG_HELPER
 
-Int128 HELPER(nonatomic_cmpxchgo_be)(CPUArchState *env, target_ulong addr,
+Int128 HELPER(nonatomic_cmpxchgo_be)(CPUArchState *env, uint64_t addr,
                                      Int128 cmpv, Int128 newv, uint32_t oi)
 {
 #if TCG_TARGET_REG_BITS == 32
@@ -82,7 +82,7 @@ Int128 HELPER(nonatomic_cmpxchgo_be)(CPUArchState *env, target_ulong addr,
 #endif
 }
 
-Int128 HELPER(nonatomic_cmpxchgo_le)(CPUArchState *env, target_ulong addr,
+Int128 HELPER(nonatomic_cmpxchgo_le)(CPUArchState *env, uint64_t addr,
                                      Int128 cmpv, Int128 newv, uint32_t oi)
 {
 #if TCG_TARGET_REG_BITS == 32
@@ -103,7 +103,7 @@ Int128 HELPER(nonatomic_cmpxchgo_le)(CPUArchState *env, target_ulong addr,
 }
 
 #define ATOMIC_HELPER(OP, TYPE) \
-    TYPE HELPER(glue(atomic_,OP))(CPUArchState *env, target_ulong addr,  \
+    TYPE HELPER(glue(atomic_,OP))(CPUArchState *env, uint64_t addr,  \
                                   TYPE val, uint32_t oi)                 \
     { return glue(glue(cpu_atomic_,OP),_mmu)(env, addr, val, oi, GETPC()); }
 
-- 
2.34.1


