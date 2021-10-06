Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5AD424178
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:39:52 +0200 (CEST)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY91J-0001Cg-UD
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iq-0002Vq-S7
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8id-0007ju-LJ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:44 -0400
Received: by mail-pl1-x629.google.com with SMTP id n2so1845364plk.12
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eP1/JAfeAN1qDVOqeksWzV21dZN+/Vk7CiDQx36dpUA=;
 b=JU/9xt/DEqUc/kDILmubHm8TKzEVmsZDZRZfancKZ08yiznRv+DIOf+IX4HD99kCyC
 AD/qawucifFMRJYTxaCnr6asc/l03GwLywUbZKo1rIdLdmI0QIL1zWXdmBjDXA9aJio5
 5xhgi25RbpyVMhC1ETZPe2PNtbJZOA9e/NuqoOlQOVGNSWfX66YgcbE0ai1efglpMhF9
 P6UJOIVSXJNTp8Z2HBfN3cLmRrlCHS55f1ji1Vb6q3PxXWeaUEdY3kUpZA9VibPpBwEV
 x7rHtMJ4ht3G1raPfYpPqubnQI7y0xnNVhI+j9+i59sxaYmIjyngffXIq5vLgBfF/rad
 WJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eP1/JAfeAN1qDVOqeksWzV21dZN+/Vk7CiDQx36dpUA=;
 b=2BsYYaPsKusAsrrbZ2Rw3JwwgLWJccovD8YpU7n02CYfkzz4HrJq1dTeavudGWaUy6
 Go3hdrBMNvGJFrzw1xJhuxq2kCkSpKDE74sYtyozEHs4ZmHOC84maXRly+Yw/4EBbGhR
 oav8RDsVgVxRNYYdHe80cm/0rOh/iThDzoQaHkcKEoEC5OwGEkdDDrO7ajDQLt6y+cPk
 FoIoZgTHlj6oZZQpn6wOqgCAInUL7Yf0fqyVLGZ5zcftRye7CARds6HBwb+BlRwM/OQ+
 u0QzXcJvffVFVqaBrCfzz8GE9/8Tv3LSMM5hnXV+SCsZRTK5wket6kwwz7TnYm/LfWgt
 dvvw==
X-Gm-Message-State: AOAM532bjbpOK0gwS3cNH/1BsXzLAqXbV8mH7BVk5DHigZXF4Y9sW+fX
 CIqKqCXnLlhbwX0ymKx83ybCZSKMooBDFA==
X-Google-Smtp-Source: ABdhPJxrDKO1xrJMlE1hk9na/DQWg4xjteX3DT4MsY32y45mJfMDvp7O11dq2DPBOEqs9Dl9h5R1Uw==
X-Received: by 2002:a17:902:868d:b0:13d:dfa7:f3f2 with SMTP id
 g13-20020a170902868d00b0013ddfa7f3f2mr11732543plo.30.1633533624352; 
 Wed, 06 Oct 2021 08:20:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/28] plugins: Reorg arguments to qemu_plugin_vcpu_mem_cb
Date: Wed,  6 Oct 2021 08:19:56 -0700
Message-Id: <20211006152014.741026-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Use the MemOpIdx directly, rather than the rearrangement
of the same bits currently done by the trace infrastructure.
Pass in enum qemu_plugin_mem_rw so that we are able to treat
read-modify-write operations as a single operation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/plugin.h         | 26 ++++++++++++++++++++++++--
 accel/tcg/cputlb.c            |  4 ++--
 accel/tcg/plugin-gen.c        |  5 ++---
 accel/tcg/user-exec.c         | 28 ++++++++++++++--------------
 plugins/api.c                 | 19 +++++++++++--------
 plugins/core.c                | 10 +++++-----
 tcg/tcg-op.c                  | 30 +++++++++++++++++++++---------
 accel/tcg/atomic_common.c.inc | 13 +++----------
 8 files changed, 82 insertions(+), 53 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 9a8438f683..b3172b147f 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -12,6 +12,7 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/option.h"
+#include "exec/memopidx.h"
 
 /*
  * Events that plugins can subscribe to.
@@ -36,6 +37,25 @@ enum qemu_plugin_event {
 struct qemu_plugin_desc;
 typedef QTAILQ_HEAD(, qemu_plugin_desc) QemuPluginList;
 
+/*
+ * Construct a qemu_plugin_meminfo_t.
+ */
+static inline qemu_plugin_meminfo_t
+make_plugin_meminfo(MemOpIdx oi, enum qemu_plugin_mem_rw rw)
+{
+    return oi | (rw << 16);
+}
+
+/*
+ * Extract the memory operation direction from a qemu_plugin_meminfo_t.
+ * Other portions may be extracted via get_memop and get_mmuidx.
+ */
+static inline enum qemu_plugin_mem_rw
+get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
+{
+    return i >> 16;
+}
+
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
@@ -180,7 +200,8 @@ qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1,
                          uint64_t a6, uint64_t a7, uint64_t a8);
 void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t ret);
 
-void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr, uint32_t meminfo);
+void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
+                             MemOpIdx oi, enum qemu_plugin_mem_rw rw);
 
 void qemu_plugin_flush_cb(void);
 
@@ -244,7 +265,8 @@ void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t ret)
 { }
 
 static inline void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
-                                           uint32_t meminfo)
+                                           MemOpIdx oi,
+                                           enum qemu_plugin_mem_rw rw)
 { }
 
 static inline void qemu_plugin_flush_cb(void)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 0aa6157ec4..ee07457880 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2120,7 +2120,7 @@ static inline uint64_t cpu_load_helper(CPUArchState *env, abi_ptr addr,
 
     ret = full_load(env, addr, oi, retaddr);
 
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
 
     return ret;
 }
@@ -2556,7 +2556,7 @@ cpu_store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
     store_helper(env, addr, val, oi, retaddr, op);
 
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stb_mmuidx_ra(CPUArchState *env, target_ulong addr, uint32_t val,
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 88e25c6df9..f5fd5f279c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -45,7 +45,6 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
-#include "trace/mem.h"
 #include "exec/exec-all.h"
 #include "exec/plugin-gen.h"
 #include "exec/translator.h"
@@ -211,9 +210,9 @@ static void gen_mem_wrapped(enum plugin_gen_cb type,
                             const union mem_gen_fn *f, TCGv addr,
                             uint32_t info, bool is_mem)
 {
-    int wr = !!(info & TRACE_MEM_ST);
+    enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
 
-    gen_plugin_cb_start(PLUGIN_GEN_FROM_MEM, type, wr);
+    gen_plugin_cb_start(PLUGIN_GEN_FROM_MEM, type, rw);
     if (is_mem) {
         f->mem_fn(addr, info);
     } else {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 3ba7acf7f4..13e0b9e430 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -894,7 +894,7 @@ uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldub_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
@@ -911,7 +911,7 @@ uint32_t cpu_lduw_be_data(CPUArchState *env, abi_ptr ptr)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = lduw_be_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
@@ -928,7 +928,7 @@ uint32_t cpu_ldl_be_data(CPUArchState *env, abi_ptr ptr)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldl_be_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
@@ -940,7 +940,7 @@ uint64_t cpu_ldq_be_data(CPUArchState *env, abi_ptr ptr)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldq_be_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
@@ -952,7 +952,7 @@ uint32_t cpu_lduw_le_data(CPUArchState *env, abi_ptr ptr)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = lduw_le_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
@@ -969,7 +969,7 @@ uint32_t cpu_ldl_le_data(CPUArchState *env, abi_ptr ptr)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldl_le_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
@@ -981,7 +981,7 @@ uint64_t cpu_ldq_le_data(CPUArchState *env, abi_ptr ptr)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     ret = ldq_le_p(g2h(env_cpu(env), ptr));
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_R);
     return ret;
 }
 
@@ -1077,7 +1077,7 @@ void cpu_stb_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stb_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
@@ -1087,7 +1087,7 @@ void cpu_stw_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stw_be_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
@@ -1097,7 +1097,7 @@ void cpu_stl_be_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stl_be_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
@@ -1107,7 +1107,7 @@ void cpu_stq_be_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stq_be_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
@@ -1117,7 +1117,7 @@ void cpu_stw_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stw_le_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
@@ -1127,7 +1127,7 @@ void cpu_stl_le_data(CPUArchState *env, abi_ptr ptr, uint32_t val)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stl_le_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
@@ -1137,7 +1137,7 @@ void cpu_stq_le_data(CPUArchState *env, abi_ptr ptr, uint64_t val)
 
     trace_guest_mem_before_exec(env_cpu(env), ptr, meminfo);
     stq_le_p(g2h(env_cpu(env), ptr), val);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, meminfo);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), ptr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stb_data_ra(CPUArchState *env, abi_ptr ptr,
diff --git a/plugins/api.c b/plugins/api.c
index acff9ce8ac..b143b09ce9 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -45,7 +45,6 @@
 #include "qemu/plugin-memory.h"
 #include "hw/boards.h"
 #endif
-#include "trace/mem.h"
 
 /* Uninstall and Reset handlers */
 
@@ -246,22 +245,25 @@ const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)
 
 unsigned qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info)
 {
-    return info & TRACE_MEM_SZ_SHIFT_MASK;
+    MemOp op = get_memop(info);
+    return op & MO_SIZE;
 }
 
 bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info)
 {
-    return !!(info & TRACE_MEM_SE);
+    MemOp op = get_memop(info);
+    return op & MO_SIGN;
 }
 
 bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info)
 {
-    return !!(info & TRACE_MEM_BE);
+    MemOp op = get_memop(info);
+    return (op & MO_BSWAP) == MO_BE;
 }
 
 bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
 {
-    return !!(info & TRACE_MEM_ST);
+    return get_plugin_meminfo_rw(info) & QEMU_PLUGIN_MEM_W;
 }
 
 /*
@@ -277,11 +279,12 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
 {
 #ifdef CONFIG_SOFTMMU
     CPUState *cpu = current_cpu;
-    unsigned int mmu_idx = info >> TRACE_MEM_MMU_SHIFT;
-    hwaddr_info.is_store = info & TRACE_MEM_ST;
+    unsigned int mmu_idx = get_mmuidx(info);
+    enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
+    hwaddr_info.is_store = (rw & QEMU_PLUGIN_MEM_W) != 0;
 
     if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
-                           info & TRACE_MEM_ST, &hwaddr_info)) {
+                           hwaddr_info.is_store, &hwaddr_info)) {
         error_report("invalid use of qemu_plugin_get_hwaddr");
         return NULL;
     }
diff --git a/plugins/core.c b/plugins/core.c
index 6b2490f973..792262da08 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -27,7 +27,6 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
-#include "trace/mem.h" /* mem_info macros */
 #include "plugin.h"
 #include "qemu/compiler.h"
 
@@ -446,7 +445,8 @@ void exec_inline_op(struct qemu_plugin_dyn_cb *cb)
     }
 }
 
-void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr, uint32_t info)
+void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
+                             MemOpIdx oi, enum qemu_plugin_mem_rw rw)
 {
     GArray *arr = cpu->plugin_mem_cbs;
     size_t i;
@@ -457,14 +457,14 @@ void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr, uint32_t info)
     for (i = 0; i < arr->len; i++) {
         struct qemu_plugin_dyn_cb *cb =
             &g_array_index(arr, struct qemu_plugin_dyn_cb, i);
-        int w = !!(info & TRACE_MEM_ST) + 1;
 
-        if (!(w & cb->rw)) {
+        if (!(rw & cb->rw)) {
                 break;
         }
         switch (cb->type) {
         case PLUGIN_CB_REGULAR:
-            cb->f.vcpu_mem(cpu->cpu_index, info, vaddr, cb->userp);
+            cb->f.vcpu_mem(cpu->cpu_index, make_plugin_meminfo(oi, rw),
+                           vaddr, cb->userp);
             break;
         case PLUGIN_CB_INLINE:
             exec_inline_op(cb);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 37b440af7f..af7bb851b5 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2853,10 +2853,12 @@ static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
     return vaddr;
 }
 
-static inline void plugin_gen_mem_callbacks(TCGv vaddr, uint16_t info)
+static void plugin_gen_mem_callbacks(TCGv vaddr, MemOpIdx oi,
+                                     enum qemu_plugin_mem_rw rw)
 {
 #ifdef CONFIG_PLUGIN
     if (tcg_ctx->plugin_insn != NULL) {
+        qemu_plugin_meminfo_t info = make_plugin_meminfo(oi, rw);
         plugin_gen_empty_mem_callback(vaddr, info);
         tcg_temp_free(vaddr);
     }
@@ -2866,10 +2868,13 @@ static inline void plugin_gen_mem_callbacks(TCGv vaddr, uint16_t info)
 void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
-    uint16_t info = trace_mem_get_info(make_memop_idx(memop, idx), 0);
+    MemOpIdx oi;
+    uint16_t info;
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 0, 0);
+    oi = make_memop_idx(memop, idx);
+    info = trace_mem_get_info(oi, 0);
     trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
 
     orig_memop = memop;
@@ -2883,7 +2888,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 
     addr = plugin_prep_mem_callbacks(addr);
     gen_ldst_i32(INDEX_op_qemu_ld_i32, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, info);
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
 
     if ((orig_memop ^ memop) & MO_BSWAP) {
         switch (orig_memop & MO_SIZE) {
@@ -2904,10 +2909,13 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     TCGv_i32 swap = NULL;
-    uint16_t info = trace_mem_get_info(make_memop_idx(memop, idx), 1);
+    MemOpIdx oi;
+    uint16_t info;
 
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 0, 1);
+    oi = make_memop_idx(memop, idx);
+    info = trace_mem_get_info(oi, 1);
     trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
@@ -2932,7 +2940,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     } else {
         gen_ldst_i32(INDEX_op_qemu_st_i32, val, addr, memop, idx);
     }
-    plugin_gen_mem_callbacks(addr, info);
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
 
     if (swap) {
         tcg_temp_free_i32(swap);
@@ -2942,6 +2950,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
 void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     MemOp orig_memop;
+    MemOpIdx oi;
     uint16_t info;
 
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
@@ -2956,7 +2965,8 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
     memop = tcg_canonicalize_memop(memop, 1, 0);
-    info = trace_mem_get_info(make_memop_idx(memop, idx), 0);
+    oi = make_memop_idx(memop, idx);
+    info = trace_mem_get_info(oi, 0);
     trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
 
     orig_memop = memop;
@@ -2970,7 +2980,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 
     addr = plugin_prep_mem_callbacks(addr);
     gen_ldst_i64(INDEX_op_qemu_ld_i64, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, info);
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_R);
 
     if ((orig_memop ^ memop) & MO_BSWAP) {
         int flags = (orig_memop & MO_SIGN
@@ -2995,6 +3005,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 {
     TCGv_i64 swap = NULL;
+    MemOpIdx oi;
     uint16_t info;
 
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
@@ -3004,7 +3015,8 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 
     tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 1, 1);
-    info = trace_mem_get_info(make_memop_idx(memop, idx), 1);
+    oi = make_memop_idx(memop, idx);
+    info = trace_mem_get_info(oi, 1);
     trace_guest_mem_before_tcg(tcg_ctx->cpu, cpu_env, addr, info);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
@@ -3028,7 +3040,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
 
     addr = plugin_prep_mem_callbacks(addr);
     gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, memop, idx);
-    plugin_gen_mem_callbacks(addr, info);
+    plugin_gen_mem_callbacks(addr, oi, QEMU_PLUGIN_MEM_W);
 
     if (swap) {
         tcg_temp_free_i64(swap);
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index db81eb5e66..f3ab96e888 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -26,10 +26,7 @@ static void atomic_trace_rmw_pre(CPUArchState *env, target_ulong addr,
 static void atomic_trace_rmw_post(CPUArchState *env, target_ulong addr,
                                   MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(oi, false);
-
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info | TRACE_MEM_ST);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_RW);
 }
 
 #if HAVE_ATOMIC128
@@ -44,9 +41,7 @@ static void atomic_trace_ld_pre(CPUArchState *env, target_ulong addr,
 static void atomic_trace_ld_post(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(oi, false);
-
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
 }
 
 static void atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
@@ -60,9 +55,7 @@ static void atomic_trace_st_pre(CPUArchState *env, target_ulong addr,
 static void atomic_trace_st_post(CPUArchState *env, target_ulong addr,
                                  MemOpIdx oi)
 {
-    uint16_t info = trace_mem_get_info(oi, false);
-
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, info);
+    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 #endif
 
-- 
2.25.1


