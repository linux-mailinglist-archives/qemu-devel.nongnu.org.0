Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B8424185
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:43:12 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY94Z-0006sA-KB
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8id-0002LC-Sv
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:31 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iW-0007j8-AT
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:31 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so2559919pjb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=657nOUksvj/sUI2sYjO37QlELa5Xe6mSRTlP+SVI4NE=;
 b=QLqCG7lsd/FG0wvsMxBs/DxUaXDkvGKiU7Nw4QtZGBuuZffDI2dkx2srR9PHEUXf2d
 GZo6tjcAknDQEj4oNM6EqVQoPAKDD6X0QzkuBBvLFdKqaqoYPoRE1FHOjfgIt/07dmH6
 y3G5q0SHsRSbtXOh0j18tt0vcfVPkQip3fhR/6p0+0HYXZFyO9SLpA6zlTyzCK3J63yR
 kZf+SG6/9nslJHQiDxuW+Dza0/IyjUc8lMLjAh7SLf/dU37o0gzzUk06CU0X/HkAeDJQ
 b+ofyq6KWSSbu5efBNgDJag9BdD6yBALpzFx5Nh7gnZ9xG8MQ2UnzXOi2UlGmNj9RGI6
 RXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=657nOUksvj/sUI2sYjO37QlELa5Xe6mSRTlP+SVI4NE=;
 b=ZWVzWRCX1mnkzqkMEt2AwFQoN6qJHTK60NmS9l2bUfw5ZYBN4dh07DsFGBqbw+f27T
 oT4yqOKuQQaLWKAlV6e5vdoeeqQ0vWPPMvA84PeJJkmmAF7OOEMij/KyJgFO+v7sEtlc
 HgblEDl1NH7SxbLuxhM/tvsbLHgV7hKMKQmKeXaCPcwGgU+O4U4mLNlHi3xPi5yN4jXw
 k+8QEMh1zN2/spl2D8kjSjAMThVdgCvonjP7IeNhKdj5Y0Ogrs1qwbgzMaFSXJv8Qt35
 efjiQM8qdM9rB2vIhJORGTs74sw3KaIbc9zbI64A+YVd6CWRDU6AAIFErv9KP5Mt5Vta
 qCKg==
X-Gm-Message-State: AOAM531X4fEcs3zjjhVaF3kuJ9Y7DJeyGqlk/Li95VoV7UyNmPb6zRa9
 xPqbU4KRCuKjA3AE0a/tc5YYqNykvuMWWQ==
X-Google-Smtp-Source: ABdhPJwsyHfhT+G5jxYYkWKq+l59OMtqwcACpvUeMI5DYLlGtNElEEOmD4HWnUpqwu8CT0mOB3Nk+Q==
X-Received: by 2002:a17:90a:ba86:: with SMTP id
 t6mr11649770pjr.1.1633533621864; 
 Wed, 06 Oct 2021 08:20:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/28] trace/mem: Pass MemOpIdx to trace_mem_get_info
Date: Wed,  6 Oct 2021 08:19:54 -0700
Message-Id: <20211006152014.741026-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We (will) often have the complete MemOpIdx handy, so use that.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 trace/mem.h                   | 32 +++++++++-----------------
 accel/tcg/cputlb.c            | 12 ++++------
 accel/tcg/user-exec.c         | 42 +++++++++++++++++++++++------------
 tcg/tcg-op.c                  |  8 +++----
 accel/tcg/atomic_common.c.inc |  6 ++---
 5 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/trace/mem.h b/trace/mem.h
index 2f27e7bdf0..699566c661 100644
--- a/trace/mem.h
+++ b/trace/mem.h
@@ -10,7 +10,7 @@
 #ifndef TRACE__MEM_H
 #define TRACE__MEM_H
 
-#include "tcg/tcg.h"
+#include "exec/memopidx.h"
 
 #define TRACE_MEM_SZ_SHIFT_MASK 0xf /* size shift mask */
 #define TRACE_MEM_SE (1ULL << 4)    /* sign extended (y/n) */
@@ -19,45 +19,33 @@
 #define TRACE_MEM_MMU_SHIFT 8       /* mmu idx */
 
 /**
- * trace_mem_build_info:
+ * trace_mem_get_info:
  *
  * Return a value for the 'info' argument in guest memory access traces.
  */
-static inline uint16_t trace_mem_build_info(int size_shift, bool sign_extend,
-                                            MemOp endianness, bool store,
-                                            unsigned int mmu_idx)
+static inline uint16_t trace_mem_get_info(MemOpIdx oi, bool store)
 {
+    MemOp op = get_memop(oi);
+    uint32_t size_shift = op & MO_SIZE;
+    bool sign_extend = op & MO_SIGN;
+    bool big_endian = (op & MO_BSWAP) == MO_BE;
     uint16_t res;
 
     res = size_shift & TRACE_MEM_SZ_SHIFT_MASK;
     if (sign_extend) {
         res |= TRACE_MEM_SE;
     }
-    if (endianness == MO_BE) {
+    if (big_endian) {
         res |= TRACE_MEM_BE;
     }
     if (store) {
         res |= TRACE_MEM_ST;
     }
 #ifdef CONFIG_SOFTMMU
-    res |= mmu_idx << TRACE_MEM_MMU_SHIFT;
+    res |= get_mmuidx(oi) << TRACE_MEM_MMU_SHIFT;
 #endif
+
     return res;
 }
 
-
-/**
- * trace_mem_get_info:
- *
- * Return a value for the 'info' argument in guest memory access traces.
- */
-static inline uint16_t trace_mem_get_info(MemOp op,
-                                          unsigned int mmu_idx,
-                                          bool store)
-{
-    return trace_mem_build_info(op & MO_SIZE, !!(op & MO_SIGN),
-                                op & MO_BSWAP, store,
-                                mmu_idx);
-}
-
 #endif /* TRACE__MEM_H */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d72f65f42b..0aa6157ec4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2112,14 +2112,12 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
                                        int mmu_idx, uintptr_t retaddr,
                                        MemOp op, FullLoadHelper *full_load)
 {
-    uint16_t meminfo;
-    MemOpIdx oi;
+    MemOpIdx oi = make_memop_idx(op, mmu_idx);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
 
-    meminfo = trace_mem_get_info(op, mmu_idx, false);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
-    oi = make_memop_idx(op, mmu_idx);
     ret = full_load(env, addr, oi, retaddr);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, meminfo);
@@ -2551,13 +2549,11 @@ static inline void QEMU_ALWAYS_INLINE
 cpu_store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
                  int mmu_idx, uintptr_t retaddr, MemOp op)
 {
-    MemOpIdx oi;
-    uint16_t meminfo;
+    MemOpIdx oi = make_memop_idx(op, mmu_idx);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    meminfo = trace_mem_get_info(op, mmu_idx, true);
     trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
 
-    oi = make_memop_idx(op, mmu_idx);
     store_helper(env, addr, val, oi, retaddr, op);
 
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, meminfo);
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 1187362a4c..3ba7acf7f4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -888,8 +888,9 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldub_p(g2h(env_cpu(env), ptr));
@@ -904,8 +905,9 @@ int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
 
 uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = lduw_be_p(g2h(env_cpu(env), ptr));
@@ -920,8 +922,9 @@ int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
 
 uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldl_be_p(g2h(env_cpu(env), ptr));
@@ -931,8 +934,9 @@ uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
 
 uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldq_be_p(g2h(env_cpu(env), ptr));
@@ -942,8 +946,9 @@ uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
 
 uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = lduw_le_p(g2h(env_cpu(env), ptr));
@@ -958,8 +963,9 @@ int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
 
 uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldl_le_p(g2h(env_cpu(env), ptr));
@@ -969,8 +975,9 @@ uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
 
 uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr)
 {
+    MemOpIdx oi = make_memop_idx(MO_LEQ, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
-    uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, false);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldq_le_p(g2h(env_cpu(env), ptr));
@@ -1065,7 +1072,8 @@ uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 
 void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_UB, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stb_p(g2h(env_cpu(env), ptr), val);
@@ -1074,7 +1082,8 @@ void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_BEUW, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stw_be_p(g2h(env_cpu(env), ptr), val);
@@ -1083,7 +1092,8 @@ void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_BEUL, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stl_be_p(g2h(env_cpu(env), ptr), val);
@@ -1092,7 +1102,8 @@ void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_BEQ, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stq_be_p(g2h(env_cpu(env), ptr), val);
@@ -1101,7 +1112,8 @@ void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 
 void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_LEUW, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stw_le_p(g2h(env_cpu(env), ptr), val);
@@ -1110,7 +1122,8 @@ void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_LEUL, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stl_le_p(g2h(env_cpu(env), ptr), val);
@@ -1119,7 +1132,8 @@ void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
 void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 {
-    uint16_t meminfo = trace_mem_get_info(MO_LEQ, MMU_USER_IDX, true);
+    MemOpIdx oi = make_memop_idx(MO_LEQ, MMU_USER_IDX);
+    uint16_t meminfo = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stq_le_p(g2h(env_cpu(env), ptr), val);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index e1490c372e..37b440af7f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2866,7 +2866,7 @@ static inline void plugin_gen_mem_callbacks(TCGv vaddr, uint16_t info)
 void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
-    uint16_t info = trace_mem_get_info(memop, idx, 0);
+    uint16_t info = trace_mem_get_info(make_memop_idx(memop, idx), 0);
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 0, 0);
@@ -2904,7 +2904,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     TCGv_i32 swap = NULL;
-    uint16_t info = trace_mem_get_info(memop, idx, 1);
+    uint16_t info = trace_mem_get_info(make_memop_idx(memop, idx), 1);
 
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 0, 1);
@@ -2956,7 +2956,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 1, 0);
-    info = trace_mem_get_info(memop, idx, 0);
+    info = trace_mem_get_info(make_memop_idx(memop, idx), 0);
     trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
 
     orig_memop = memop;
@@ -3004,7 +3004,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 1, 1);
-    info = trace_mem_get_info(memop, idx, 1);
+    info = trace_mem_get_info(make_memop_idx(memop, idx), 1);
     trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index ebaa793464..6019a957b9 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -17,7 +17,7 @@ static uint16_t atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
                                      MemOpIdx oi)
 {
     CPUState *cpu = env_cpu(env);
-    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), false);
+    uint16_t info = trace_mem_get_info(oi, false);
 
     trace_guest_mem_before_exec(cpu, addr, info);
     trace_guest_mem_before_exec(cpu, addr, info | TRACE_MEM_ST);
@@ -36,7 +36,7 @@ static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
 static uint16_t atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), false);
+    uint16_t info = trace_mem_get_info(oi, false);
 
     trace_guest_mem_before_exec(env_cpu(env), addr, info);
 
@@ -52,7 +52,7 @@ static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
 static uint16_t atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(get_memop(oi), get_mmuidx(oi), true);
+    uint16_t info = trace_mem_get_info(oi, true);
 
     trace_guest_mem_before_exec(env_cpu(env), addr, info);
 
-- 
2.25.1


