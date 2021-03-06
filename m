Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039332FDA4
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:51:33 +0100 (CET)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIepg-0003rN-3X
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebO-0007SW-CX
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:46 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebM-00031E-2R
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:46 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so995369pjh.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GwJxG66e4p7W1I3fD4aM6XDpJ+3y7V4Z2paPMR5PGCU=;
 b=qvYVtcTbbT/n7rS8YFXLIgDVSIrMYGUOoYqD64is3uBA9PEEa4XXfmjEc5oxe6AiLo
 MYUJg7jHq+LA4qg2eD1e3UnKZnAKPALvlTOL7n2utuzk1msZW4OKYqhA9UGLULJt8R7n
 CcO9VXNqH+lP3g/vP1ikyHUchsQZLaEi9XH62pv4N7vb7si6ZgzOyf3QVcnpbXHvT3Dk
 pDuZdwDGy4LvLIQ7f3Zp0S85fGDxF7Z/Z5lmy35ZL5bO8g6tm4N1/k4lzl62dLaUJ31U
 bz/9bcU8xlQc/rOKO5HCjlro+39/eUw+b/DRzR8089XWRZQYD7p1wZ83GdOT1Poyt4m0
 eKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GwJxG66e4p7W1I3fD4aM6XDpJ+3y7V4Z2paPMR5PGCU=;
 b=PoFXbCzn8xjc3eRRDZFyRdyxvLryjIVn3ysSns1NarTn2aEHX70XWOL3UpL1gvnv+s
 M4Fo/t0Qwg94a4WGBN9yNSPHWF/fyDOySwESNp14NdXLsnWmki4NVhRu4/k5xTCU1OIQ
 0uc/IeYZWt7VDR3VZqN44uXy4aqWzB7hdxFU51CPmOSjc4zEpF332q21Krw4tyuzGuAG
 XWFBo9Zjg2Bz/l+ioKL/E6qFUcvvySDgnIV/OXpAygx0gvd76F1MhsdHYEwr3XaZIGRN
 66FkoBeS5u99khGz+SdB4Bp9Sq9peDHdEUCQDNXpbV2j1eO1/kzRH0WnzMr59QmJhuCm
 wbOA==
X-Gm-Message-State: AOAM531tzsDIgQjRmXCSxEfXGXwzYivgHMvchAeRhD8yaYkorA07PMfa
 4uTbZftwCEje8wL7nzl9+wj5bdUA9ze6Yg==
X-Google-Smtp-Source: ABdhPJwqjvGjpdUGcLzVEjaXBmCcY9eKXsY/X7Cgu9X6SMMQQPxXhOUhh1J5ZcZcruUlFWNJZ8trcA==
X-Received: by 2002:a17:90a:aa8b:: with SMTP id
 l11mr17732665pjq.225.1615066602699; 
 Sat, 06 Mar 2021 13:36:42 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/27] accel/tcg: Precompute curr_cflags into cpu->tcg_cflags
Date: Sat,  6 Mar 2021 13:36:13 -0800
Message-Id: <20210306213613.85168-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The primary motivation is to remove a dozen insns along
the fast-path in tb_lookup.  As a byproduct, this allows
us to completely remove parallel_cpus.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.h       |  1 +
 include/exec/exec-all.h         |  7 +------
 include/hw/core/cpu.h           |  2 ++
 accel/tcg/cpu-exec.c            |  3 ---
 accel/tcg/tcg-accel-ops-mttcg.c |  3 +--
 accel/tcg/tcg-accel-ops-rr.c    |  2 +-
 accel/tcg/tcg-accel-ops.c       |  8 ++++++++
 accel/tcg/translate-all.c       |  4 ----
 linux-user/main.c               |  1 +
 linux-user/sh4/signal.c         |  8 +++++---
 linux-user/syscall.c            | 18 ++++++++++--------
 11 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops.h b/accel/tcg/tcg-accel-ops.h
index 48130006de..6a5fcef889 100644
--- a/accel/tcg/tcg-accel-ops.h
+++ b/accel/tcg/tcg-accel-ops.h
@@ -17,5 +17,6 @@
 void tcg_cpus_destroy(CPUState *cpu);
 int tcg_cpus_exec(CPUState *cpu);
 void tcg_handle_interrupt(CPUState *cpu, int mask);
+void tcg_cpu_init_cflags(CPUState *cpu, bool parallel);
 
 #endif /* TCG_CPUS_H */
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index a262dd5804..6b036cae8f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -513,8 +513,6 @@ struct TranslationBlock {
     uintptr_t jmp_dest[2];
 };
 
-extern bool parallel_cpus;
-
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
@@ -524,10 +522,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 /* current cflags for hashing/comparison */
 static inline uint32_t curr_cflags(CPUState *cpu)
 {
-    uint32_t cflags = deposit32(0, CF_CLUSTER_SHIFT, 8, cpu->cluster_index);
-    cflags |= parallel_cpus ? CF_PARALLEL : 0;
-    cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
-    return cflags;
+    return cpu->tcg_cflags;
 }
 
 /* TranslationBlock invalidate API */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d..c68bc3ba8a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -282,6 +282,7 @@ struct qemu_work_item;
  *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it will
  *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
  *   QOM parent.
+ * @tcg_cflags: Pre-computed cflags for this cpu.
  * @nr_cores: Number of cores within this CPU package.
  * @nr_threads: Number of threads within this CPU.
  * @running: #true if CPU is currently running (lockless).
@@ -412,6 +413,7 @@ struct CPUState {
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
     int cluster_index;
+    uint32_t tcg_cflags;
     uint32_t halted;
     uint32_t can_do_io;
     int32_t exception_index;
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 931da96c2b..bdfa036ac8 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -267,8 +267,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
             mmap_unlock();
         }
 
-        /* Since we got here, we know that parallel_cpus must be true.  */
-        parallel_cpus = false;
         cpu_exec_enter(cpu);
         /* execute the generated code */
         trace_exec_tb(tb, pc);
@@ -296,7 +294,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
      * the execution.
      */
     g_assert(cpu_in_exclusive_context(cpu));
-    parallel_cpus = true;
     cpu->running = false;
     end_exclusive();
 }
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 42973fb062..847d2079d2 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -114,8 +114,7 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
     g_assert(tcg_enabled());
-
-    parallel_cpus = (current_machine->smp.max_cpus > 1);
+    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
 
     cpu->thread = g_malloc0(sizeof(QemuThread));
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 4a66055e0d..018b54c508 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -269,7 +269,7 @@ void rr_start_vcpu_thread(CPUState *cpu)
     static QemuThread *single_tcg_cpu_thread;
 
     g_assert(tcg_enabled());
-    parallel_cpus = false;
+    tcg_cpu_init_cflags(cpu, false);
 
     if (!single_tcg_cpu_thread) {
         cpu->thread = g_malloc0(sizeof(QemuThread));
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6144d9df87..6cdcaa2855 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -41,6 +41,14 @@
 
 /* common functionality among all TCG variants */
 
+void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
+{
+    uint32_t cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
+    cflags |= parallel ? CF_PARALLEL : 0;
+    cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
+    cpu->tcg_cflags = cflags;
+}
+
 void tcg_cpus_destroy(CPUState *cpu)
 {
     cpu_thread_signal_destroyed(cpu);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0b0bfd35ab..f32df8b240 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -224,7 +224,6 @@ static void *l1_map[V_L1_MAX_SIZE];
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
 TBContext tb_ctx;
-bool parallel_cpus;
 
 static void page_table_config_init(void)
 {
@@ -1867,9 +1866,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         cflags = (cflags & ~CF_COUNT_MASK) | 1;
     }
 
-    cflags &= ~CF_CLUSTER_MASK;
-    cflags |= cpu->cluster_index << CF_CLUSTER_SHIFT;
-
     max_insns = cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff54e..4f4746dce8 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -205,6 +205,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
 
+    new_cpu->tcg_cflags = cpu->tcg_cflags;
     memcpy(new_env, env, sizeof(CPUArchState));
 
     /* Clone all break/watchpoints.
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index cc89a48ff8..29c1ee30e6 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -82,9 +82,11 @@ static abi_ulong get_sigframe(struct target_sigaction *ka,
     return (sp - frame_size) & -8ul;
 }
 
-/* Notice when we're in the middle of a gUSA region and reset.
-   Note that this will only occur for !parallel_cpus, as we will
-   translate such sequences differently in a parallel context.  */
+/*
+ * Notice when we're in the middle of a gUSA region and reset.
+ * Note that this will only occur when #CF_PARALLEL is unset, as we
+ * will translate such sequences differently in a parallel context.
+ */
 static void unwind_gusa(CPUSH4State *regs)
 {
     /* If the stack pointer is sufficiently negative, and we haven't
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 389ec09764..9522f603aa 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6481,6 +6481,16 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         /* Grab a mutex so that thread setup appears atomic.  */
         pthread_mutex_lock(&clone_lock);
 
+        /*
+         * If this is our first additional thread, we need to ensure we
+         * generate code for parallel execution and flush old translations.
+         * Do this now so that the copy gets CF_PARALLEL too.
+         */
+        if (!(cpu->tcg_cflags & CF_PARALLEL)) {
+            cpu->tcg_cflags |= CF_PARALLEL;
+            tb_flush(cpu);
+        }
+
         /* we create a new CPU instance. */
         new_env = cpu_copy(env);
         /* Init regs that differ from the parent.  */
@@ -6521,14 +6531,6 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         sigprocmask(SIG_BLOCK, &sigmask, &info.sigmask);
         cpu->random_seed = qemu_guest_random_seed_thread_part1();
 
-        /* If this is our first additional thread, we need to ensure we
-         * generate code for parallel execution and flush old translations.
-         */
-        if (!parallel_cpus) {
-            parallel_cpus = true;
-            tb_flush(cpu);
-        }
-
         ret = pthread_create(&info.thread, &attr, clone_func, &info);
         /* TODO: Free new CPU state if thread creation failed.  */
 
-- 
2.25.1


