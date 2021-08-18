Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C0F3F0C1D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:54:23 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRdl-00067z-VM
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6a-0000tY-6N
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:04 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6V-0000I4-AE
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:03 -0400
Received: by mail-pf1-x430.google.com with SMTP id k19so3188803pfc.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q093LgoazQXD1mrQPO6HShzD/dNR5WYWX7WEFYLLMcI=;
 b=prNFIwKXUkfGxR443l96X4me2CjfnTy604nZTKpxulqd0ZhNzckCbmUtUDKDpKkdgj
 THvaHCgCzvqelHMJW7CNVuiJoXlLO9KzuVPnPS4qoCzm96LWHDU1rwBAKcNPCBzruAXk
 P/MHSxMw1Qj1Ry2QZ2bkLPKWLT60U5GO2isE8UyDqsq9ahr2wrn7t5baUliS81lHodj/
 f4bhYig9wULI2sxwolB5cdFD/4/OLvjrxWPMymiHhz9/27FM8Bas8mpKqDpUgjJgSf7S
 sKYgfXIRLzFnb+aqUlPZ9QbBpyzMIWwip3gQFdhD7B5kO/7JOKETK8y6AEIaSfCmtxDg
 +MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q093LgoazQXD1mrQPO6HShzD/dNR5WYWX7WEFYLLMcI=;
 b=S+g4kPrW5fJCcTHmeBdaLVfWzyNnbGtrTnzESHBb3qxhRcV30mlbsel5dPk/HmhhzL
 V2VTq6xwZOikhX3os+GKJPFgMn46QXkyExjJP/f0aGIJKmX15O2FoQi6FHJ2/02Bx30F
 96+z2aUOrqSW1icZxSDYNAIBIs4zyN5rpRI7WeNbd4lDBwPF8lQE4JAtKDgJqKusJMAm
 f81vVInikj+hDM15A/wSmI3AmjLwqjxb1wZc8C58Z7gzdsuiBOBuvIJBKPqe2oGQTVC9
 f9SAK8nqm+qP3RuDsz/4VVPI6bKLL7fqPjmO9xb3n+FX2k73jExlFwJsqGIXiSxcujAf
 lFqg==
X-Gm-Message-State: AOAM531tQYhG52LP6gVIsMRKwEIMmQ4ng5u3GQKNjlz7NJCK1tuT3Wqf
 yAXUkDaFFSI0YVH0ihJUvw3kh3AkbWcbnA==
X-Google-Smtp-Source: ABdhPJxfHL455Z33JD0sMjUkYmAn02ElXyK3OAvaABhq//22BHmsolvWF4WvMQFMgoFeyo+8Cr4sLg==
X-Received: by 2002:a62:bd15:0:b029:31c:a584:5f97 with SMTP id
 a21-20020a62bd150000b029031ca5845f97mr10901520pff.33.1629314398102; 
 Wed, 18 Aug 2021 12:19:58 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/66] trace: Split guest_mem_before
Date: Wed, 18 Aug 2021 09:18:43 -1000
Message-Id: <20210818191920.390759-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no point in encoding load/store within a bit of
the memory trace info operand.  Represent atomic operations
as a single read-modify-write tracepoint.  Use MemOpIdx
instead of inventing a form specifically for traces.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h   |  1 -
 trace/mem.h                   | 51 -----------------------------------
 accel/tcg/cputlb.c            |  7 ++---
 accel/tcg/user-exec.c         | 43 ++++++++++-------------------
 tcg/tcg-op.c                  | 17 +++---------
 accel/tcg/atomic_common.c.inc | 12 +++------
 trace-events                  | 18 +++----------
 7 files changed, 27 insertions(+), 122 deletions(-)
 delete mode 100644 trace/mem.h

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index c08d859a8a..2d917b6b1f 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/plugin.h"
-#include "trace/mem.h"
 
 #if DATA_SIZE == 16
 # define SUFFIX     o
diff --git a/trace/mem.h b/trace/mem.h
deleted file mode 100644
index 699566c661..0000000000
--- a/trace/mem.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/*
- * Helper functions for guest memory tracing
- *
- * Copyright (C) 2016 Lluís Vilanova <vilanova@ac.upc.edu>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef TRACE__MEM_H
-#define TRACE__MEM_H
-
-#include "exec/memopidx.h"
-
-#define TRACE_MEM_SZ_SHIFT_MASK 0xf /* size shift mask */
-#define TRACE_MEM_SE (1ULL << 4)    /* sign extended (y/n) */
-#define TRACE_MEM_BE (1ULL << 5)    /* big endian (y/n) */
-#define TRACE_MEM_ST (1ULL << 6)    /* store (y/n) */
-#define TRACE_MEM_MMU_SHIFT 8       /* mmu idx */
-
-/**
- * trace_mem_get_info:
- *
- * Return a value for the 'info' argument in guest memory access traces.
- */
-static inline uint16_t trace_mem_get_info(MemOpIdx oi, bool store)
-{
-    MemOp op = get_memop(oi);
-    uint32_t size_shift = op & MO_SIZE;
-    bool sign_extend = op & MO_SIGN;
-    bool big_endian = (op & MO_BSWAP) == MO_BE;
-    uint16_t res;
-
-    res = size_shift & TRACE_MEM_SZ_SHIFT_MASK;
-    if (sign_extend) {
-        res |= TRACE_MEM_SE;
-    }
-    if (big_endian) {
-        res |= TRACE_MEM_BE;
-    }
-    if (store) {
-        res |= TRACE_MEM_ST;
-    }
-#ifdef CONFIG_SOFTMMU
-    res |= get_mmuidx(oi) << TRACE_MEM_MMU_SHIFT;
-#endif
-
-    return res;
-}
-
-#endif /* TRACE__MEM_H */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 04436f98c8..3d8471810c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -34,7 +34,6 @@
 #include "qemu/atomic128.h"
 #include "exec/translate-all.h"
 #include "trace/trace-root.h"
-#include "trace/mem.h"
 #include "tb-hash.h"
 #include "internal.h"
 #ifdef CONFIG_PLUGIN
@@ -2104,10 +2103,9 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
                                        MemOp op, FullLoadHelper *full_load)
 {
     MemOpIdx oi = make_memop_idx(op, mmu_idx);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
 
     ret = full_load(env, addr, oi, retaddr);
 
@@ -2541,9 +2539,8 @@ cpu_store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
                  int mmu_idx, uintptr_t retaddr, MemOp op)
 {
     MemOpIdx oi = make_memop_idx(op, mmu_idx);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
 
     store_helper(env, addr, val, oi, retaddr, op);
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index d96d60a804..246be4502d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,7 +27,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
-#include "trace/mem.h"
 #include "internal.h"
 
 #undef EAX
@@ -856,10 +855,9 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 {
     MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
     ret = ldub_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -873,10 +871,9 @@ int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
 uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 {
     MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
     ret = lduw_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -890,10 +887,9 @@ int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
 uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
 {
     MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
     ret = ldl_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -902,10 +898,9 @@ uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
 uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
 {
     MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
     ret = ldq_be_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -914,10 +909,9 @@ uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
 uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
 {
     MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
     ret = lduw_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -931,10 +925,9 @@ int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
 uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
 {
     MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint32_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
     ret = ldl_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -943,10 +936,9 @@ uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
 uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr)
 {
     MemOpIdx oi = make_memop_idx(MO_LEQ, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), ptr, oi);
     ret = ldq_le_p(g2h(env_cpu(env), ptr));
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
@@ -1040,9 +1032,8 @@ uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stb_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1050,9 +1041,8 @@ void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stw_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1060,9 +1050,8 @@ void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stl_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1070,9 +1059,8 @@ void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stq_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1080,9 +1068,8 @@ void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stw_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1090,9 +1077,8 @@ void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stl_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1100,9 +1086,8 @@ void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_LEQ, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stq_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index af7bb851b5..b1cfd36f29 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -28,7 +28,6 @@
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
 #include "trace-tcg.h"
-#include "trace/mem.h"
 #include "exec/plugin-gen.h"
 
 /* Reduce the number of ifdefs below.  This assumes that all uses of
@@ -2869,13 +2868,11 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
     MemOpIdx oi;
-    uint16_t info;
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 0, 0);
     oi = make_memop_idx(memop, idx);
-    info = trace_mem_get_info(oi, 0);
-    trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
+    trace_guest_ld_before_tcg(tcg_ctx->cpu, cpu_env, addr, oi);
 
     orig_memop = memop;
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
@@ -2910,13 +2907,11 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     TCGv_i32 swap = NULL;
     MemOpIdx oi;
-    uint16_t info;
 
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 0, 1);
     oi = make_memop_idx(memop, idx);
-    info = trace_mem_get_info(oi, 1);
-    trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
+    trace_guest_st_before_tcg(tcg_ctx->cpu, cpu_env, addr, oi);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         swap = tcg_temp_new_i32();
@@ -2951,7 +2946,6 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
     MemOpIdx oi;
-    uint16_t info;
 
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_ld_i32(TCGV_LOW(val), addr, idx, memop);
@@ -2966,8 +2960,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 1, 0);
     oi = make_memop_idx(memop, idx);
-    info = trace_mem_get_info(oi, 0);
-    trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
+    trace_guest_ld_before_tcg(tcg_ctx->cpu, cpu_env, addr, oi);
 
     orig_memop = memop;
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
@@ -3006,7 +2999,6 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     TCGv_i64 swap = NULL;
     MemOpIdx oi;
-    uint16_t info;
 
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_st_i32(TCGV_LOW(val), addr, idx, memop);
@@ -3016,8 +3008,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 1, 1);
     oi = make_memop_idx(memop, idx);
-    info = trace_mem_get_info(oi, 1);
-    trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
+    trace_guest_st_before_tcg(tcg_ctx->cpu, cpu_env, addr, oi);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         swap = tcg_temp_new_i64();
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index f3ab96e888..1df1f243e9 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -17,10 +17,8 @@ static void atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi)
 {
     CPUState *cpu = env_cpu(env);
-    uint16_t info = trace_mem_get_info(oi, false);
 
-    trace_guest_mem_before_exec(cpu, addr, info);
-    trace_guest_mem_before_exec(cpu, addr, info | TRACE_MEM_ST);
+    trace_guest_rmw_before_exec(cpu, addr, oi);
 }
 
 static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
@@ -33,9 +31,7 @@ static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
 static void atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
                                 MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(oi, false);
-
-    trace_guest_mem_before_exec(env_cpu(env), addr, info);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
 }
 
 static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
@@ -47,9 +43,7 @@ static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
 static void atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
                                 MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(oi, true);
-
-    trace_guest_mem_before_exec(env_cpu(env), addr, info);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
 }
 
 static void atomic_trace_st_post(CPUArchState *env, target_ulong addr,
diff --git a/trace-events b/trace-events
index c4cca29939..a637a61eba 100644
--- a/trace-events
+++ b/trace-events
@@ -120,26 +120,16 @@ vcpu guest_cpu_reset(void)
 # tcg/tcg-op.c
 
 # @vaddr: Access' virtual address.
-# @info : Access' information (see below).
+# @memopidx: Access' information (see below).
 #
 # Start virtual memory access (before any potential access violation).
-#
 # Does not include memory accesses performed by devices.
 #
-# Access information can be parsed as:
-#
-# struct mem_info {
-#     uint8_t size_shift : 4; /* interpreted as "1 << size_shift" bytes */
-#     bool    sign_extend: 1; /* sign-extended */
-#     uint8_t endianness : 1; /* 0: little, 1: big */
-#     bool    store      : 1; /* whether it is a store operation */
-#             pad        : 1;
-#     uint8_t mmuidx     : 4; /* mmuidx (softmmu only)  */
-# };
-#
 # Mode: user, softmmu
 # Targets: TCG(all)
-vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"
+vcpu tcg guest_ld_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"
+vcpu tcg guest_st_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"
+vcpu tcg guest_rmw_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"
 
 # include/user/syscall-trace.h
 
-- 
2.25.1


