Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BEF32484D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:08:09 +0100 (CET)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF58R-0006Xy-QB
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF57a-0005zl-Dm
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:07:14 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF57X-0000CH-Um
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:07:14 -0500
Received: by mail-pg1-x531.google.com with SMTP id t26so2701385pgv.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHo9adXGnud/5hn4wOg5nIG1nSSsi+TxRV/RiZDFE4E=;
 b=x7u10lVR7dJNjo1Z/fW8ibHG3rNzrqzSmQbdNaeegEBm9hUVjqlRWJdVpFEhQSC69i
 r1LZ6vVsX4P8+PRMnmpJMkDM49H2rV7JH2mJC8iTlZGyNd/09Qnm9Xdpnfz8I+IaZz3E
 xW/WLCVnYaTqcb78iAbXgnKYOZDlrH587KeEGSKPlmTlXYj6l6/AWo+ACstLBdaRjgGQ
 6dSfZpk6pE7khDEbhT+0JsYZfpecFnRrqmWuieHIaSnNO0JlUQcNmhBlLD3fq0DBd5YZ
 vj0Nyl57mHhWlwe2Zhyi/SSkbMOl8j3+ISThtMe/6Is+JRvNmpMEoW7+dajuPXUWEWKi
 Pz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHo9adXGnud/5hn4wOg5nIG1nSSsi+TxRV/RiZDFE4E=;
 b=BXytZR9LJ10YNk3bDjxV+jt4Ry7ljGRIGw1MBacndtx7cMtoPfYvDRsEYWI9va1VVG
 D28xu2tBIGuUkWrTL+h0yFHBlZcWJpbBZhySOA50ZBwFF53EW/uh113m7LY42WbFjFYa
 pX63XDXxa1S6LvTc0aMXbOKrLhWzqbPspBwwOo3aoOZrG6DrznDQlFjnBoHRfdoE1AhA
 BOl8UNhMdaVHOSA1exdpeS1TZQDnFO4p8mwnnojvQe3SPUT/U1cqLHS05raKspYXbUpc
 PZc3kza7i/c2P7egkE3dJSocxjwcidx5i+VmiRqFZBpjQNY6vF39ax3Lo718lAJ5lMvk
 SUNQ==
X-Gm-Message-State: AOAM530sEFMKODvefoHddiZ32UJYxTR4QlcMTdxZuMTvgfPhq00P5Cam
 GSllaaqhWRDIgQITVuymDp4g1+6p4wiJ3A==
X-Google-Smtp-Source: ABdhPJz3O5eS8GBNbeVnP1OgIE1WxRj64qFPWYyICprV/YvfLXQu8CUKF6KmPIwiMTcyWKcfHuSjkw==
X-Received: by 2002:a62:1997:0:b029:1ed:5de5:5f1c with SMTP id
 145-20020a6219970000b02901ed5de55f1cmr720705pfz.14.1614215229949; 
 Wed, 24 Feb 2021 17:07:09 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o11sm3970821pfp.136.2021.02.24.17.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 17:07:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] accel/tcg: Replace parallel_cpus with cpu->cflags_base
Date: Wed, 24 Feb 2021 17:07:08 -0800
Message-Id: <20210225010708.288696-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Precompute the initial tb->cflags value for a cpu from its cluster
and the number of cpus live in the system.  This avoids having to
compute this constant data every time we look up a TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Based-on: <20210224165811.11567-1-alex.bennee@linaro.org>
("Experimenting with tb-lookup tweaks")
---
 accel/tcg/tcg-accel-ops.h       |  1 +
 include/exec/exec-all.h         |  5 +----
 include/hw/core/cpu.h           |  2 ++
 accel/tcg/cpu-exec.c            |  3 ---
 accel/tcg/tcg-accel-ops-mttcg.c |  3 +--
 accel/tcg/tcg-accel-ops-rr.c    |  2 +-
 accel/tcg/tcg-accel-ops.c       | 10 ++++++++++
 accel/tcg/translate-all.c       |  1 -
 linux-user/main.c               |  1 +
 linux-user/sh4/signal.c         |  2 +-
 linux-user/syscall.c            | 18 ++++++++++--------
 11 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops.h b/accel/tcg/tcg-accel-ops.h
index 48130006de..656c922a67 100644
--- a/accel/tcg/tcg-accel-ops.h
+++ b/accel/tcg/tcg-accel-ops.h
@@ -17,5 +17,6 @@
 void tcg_cpus_destroy(CPUState *cpu);
 int tcg_cpus_exec(CPUState *cpu);
 void tcg_handle_interrupt(CPUState *cpu, int mask);
+void tcg_set_cpus_cflags(uint32_t cflags_base);
 
 #endif /* TCG_CPUS_H */
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 75f8c3981a..074d88f99a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -510,8 +510,6 @@ struct TranslationBlock {
     uintptr_t jmp_dest[2];
 };
 
-extern bool parallel_cpus;
-
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
@@ -521,8 +519,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 /* current cflags for hashing/comparison */
 static inline uint32_t curr_cflags(CPUState *cpu)
 {
-    uint32_t cflags = deposit32(0, CF_CLUSTER_SHIFT, 8, cpu->cluster_index);
-    cflags |= parallel_cpus ? CF_PARALLEL : 0;
+    uint32_t cflags = cpu->cflags_base;
     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
     return cflags;
 }
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d..5fd397f37d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -282,6 +282,7 @@ struct qemu_work_item;
  *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it will
  *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
  *   QOM parent.
+ * @cflags_base: Precompute @cluster_index and #CF_PARALLEL for this cpu.
  * @nr_cores: Number of cores within this CPU package.
  * @nr_threads: Number of threads within this CPU.
  * @running: #true if CPU is currently running (lockless).
@@ -412,6 +413,7 @@ struct CPUState {
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
     int cluster_index;
+    uint32_t cflags_base;
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
index 42973fb062..6676e05182 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -114,8 +114,7 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
     g_assert(tcg_enabled());
-
-    parallel_cpus = (current_machine->smp.max_cpus > 1);
+    tcg_set_cpus_cflags(current_machine->smp.max_cpus > 1 ? CF_PARALLEL : 0);
 
     cpu->thread = g_malloc0(sizeof(QemuThread));
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 4a66055e0d..c10868f736 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -269,7 +269,7 @@ void rr_start_vcpu_thread(CPUState *cpu)
     static QemuThread *single_tcg_cpu_thread;
 
     g_assert(tcg_enabled());
-    parallel_cpus = false;
+    tcg_set_cpus_cflags(0);
 
     if (!single_tcg_cpu_thread) {
         cpu->thread = g_malloc0(sizeof(QemuThread));
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6144d9df87..6bf260acf0 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -41,6 +41,16 @@
 
 /* common functionality among all TCG variants */
 
+void tcg_set_cpus_cflags(uint32_t cflags_base)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        cpu->cflags_base = deposit32(cflags_base, CF_CLUSTER_SHIFT, 8,
+                                     cpu->cluster_index);
+    }
+}
+
 void tcg_cpus_destroy(CPUState *cpu)
 {
     cpu_thread_signal_destroyed(cpu);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0b0bfd35ab..ec46b88bfe 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -224,7 +224,6 @@ static void *l1_map[V_L1_MAX_SIZE];
 TCGContext tcg_init_ctx;
 __thread TCGContext *tcg_ctx;
 TBContext tb_ctx;
-bool parallel_cpus;
 
 static void page_table_config_init(void)
 {
diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff54e..c37040ceec 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -205,6 +205,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
 
+    new_cpu->cflags_base = cpu->cflags_base;
     memcpy(new_env, env, sizeof(CPUArchState));
 
     /* Clone all break/watchpoints.
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index cc89a48ff8..deb569babe 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -83,7 +83,7 @@ static abi_ulong get_sigframe(struct target_sigaction *ka,
 }
 
 /* Notice when we're in the middle of a gUSA region and reset.
-   Note that this will only occur for !parallel_cpus, as we will
+   Note that this will only occur for !CF_PARALLEL, as we will
    translate such sequences differently in a parallel context.  */
 static void unwind_gusa(CPUSH4State *regs)
 {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 389ec09764..83a6e51de3 100644
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
+        if (!(cpu->cflags_base & CF_PARALLEL)) {
+            cpu->cflags_base |= CF_PARALLEL;
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


