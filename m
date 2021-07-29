Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91B3D9B03
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:21:45 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uk4-0004kA-4e
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCr-0004hg-U0
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:25 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCo-0002iV-Kk
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:25 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso12920771pjq.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FcO/+HpaqcqhM0RcIfiZDKD/VSZ116ryMG65DZz88pc=;
 b=hQVzOeloTNF1naI1OYlEQMTCxDIpewrOf3irirwsKF/uUZOnmU3bmgOrvyIFDQuC11
 M1j2aBIf19ezBrhmylwOqyXYKr7goPC6nLBUQRCCCPVrWQaieTQ5yc2pEYkWWHs3Odq+
 zBqb5Edi3wjnk6Wo2odSql1jBlLBjhNOh1VDnmsDzDjb5oSIm5xRGb1L67/n6EPu3MmD
 RpsYBQeotYInfILQ7BQAf27ybFrV1SOu3+yOO58HQcCzMg30lhKPzaQPIWEuajKQCsok
 utY9JwA48Zgwe6kf6rQE3GCLa7tGoZHC9Nyx0YYl22GE5DmyUok2eIdfodpE0iexqVCP
 mKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FcO/+HpaqcqhM0RcIfiZDKD/VSZ116ryMG65DZz88pc=;
 b=LkJfDwj36iIVDClbE0wVcYC9diC468iKvcxqSPLSaHxv7EX4XPWSzhYKqHD4mf1SVc
 mooaJSYyzsrgCpBnAXu7kmbu99YSF5O0E7fAxHjmZFfh5bRc/HxKETF5Mpz9haxSvBnj
 UEXMRKfSds+zKgXcM33hYxWcSdi8vMlXNzqd5Cze18ScjL5A08jgCMkefagfXlBu7q1/
 lA5IHTbJv4/g6iNUIf1tvBi62KaGpfP3J9pQZaXzx+jI2sWZwLGFrbkt0CRYCt7mKrTo
 bUCWGEliiIuree+avBfkQd4K/eOBaptk7Y1uSeCk9QMXUk4TCbrWaHH00o+depZq0mIE
 sBww==
X-Gm-Message-State: AOAM531gh3ZKyptNSaBA+6LWo+RRbV5hM0spoKKRfynkUW93CVexHWUJ
 3DkHGyEaneND+KF6FH58uPR9+l5eadcqjQ==
X-Google-Smtp-Source: ABdhPJxqzxgr6QkxkwHXs9aiYIAZGYLZMnXMrXTJ/54p8tt0Q+FRXtDRyIpEdgc0WaZFMYKCdfqY8w==
X-Received: by 2002:a17:902:a989:b029:12c:4288:bd68 with SMTP id
 bh9-20020a170902a989b029012c4288bd68mr2269053plb.0.1627519641197; 
 Wed, 28 Jul 2021 17:47:21 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 26/43] trace: Split guest_mem_before
Date: Wed, 28 Jul 2021 14:46:30 -1000
Message-Id: <20210729004647.282017-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no point in encoding load/store within a bit of
the memory trace info operand.  Represent atomic operations
as a single read-modify-write tracepoint.  Use MemOpIdx
instead of inventing a form specifically for traces.

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
index ee07457880..46140ccff3 100644
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
@@ -2113,10 +2112,9 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
                                        MemOp op, FullLoadHelper *full_load)
 {
     MemOpIdx oi = make_memop_idx(op, mmu_idx);
-    uint16_t meminfo = trace_mem_get_info(oi, false);
     uint64_t ret;
 
-    trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
+    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
 
     ret = full_load(env, addr, oi, retaddr);
 
@@ -2550,9 +2548,8 @@ cpu_store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
                  int mmu_idx, uintptr_t retaddr, MemOp op)
 {
     MemOpIdx oi = make_memop_idx(op, mmu_idx);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), addr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), addr, oi);
 
     store_helper(env, addr, val, oi, retaddr, op);
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 9f8f3a8031..eda577013f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,7 +27,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
-#include "trace/mem.h"
 
 #undef EAX
 #undef ECX
@@ -865,10 +864,9 @@ static void cpu_unaligned_access(CPUState *cpu, vaddr addr,
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
@@ -882,10 +880,9 @@ int cpu_ldsb_data(CPUArchState *env, abi_ptr ptr)
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
@@ -899,10 +896,9 @@ int cpu_ldsw_be_data(CPUArchState *env, abi_ptr ptr)
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
@@ -911,10 +907,9 @@ uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
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
@@ -923,10 +918,9 @@ uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
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
@@ -940,10 +934,9 @@ int cpu_ldsw_le_data(CPUArchState *env, abi_ptr ptr)
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
@@ -952,10 +945,9 @@ uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
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
@@ -1049,9 +1041,8 @@ uint64_t cpu_ldq_le_data_ra(CPUArchState *env, abi_ptr ptr, uintptr_t retaddr)
 void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_UB, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stb_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1059,9 +1050,8 @@ void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_BEUW, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stw_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1069,9 +1059,8 @@ void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_BEUL, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stl_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1079,9 +1068,8 @@ void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_BEQ, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stq_be_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1089,9 +1077,8 @@ void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_LEUW, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stw_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1099,9 +1086,8 @@ void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 {
     MemOpIdx oi = make_memop_idx(MO_LEUL, MMU_USER_IDX);
-    uint16_t meminfo = trace_mem_get_info(oi, true);
 
-    trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
+    trace_guest_st_before_exec(env_cpu(env), ptr, oi);
     stl_le_p(g2h(env_cpu(env), ptr), val);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
@@ -1109,9 +1095,8 @@ void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
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


