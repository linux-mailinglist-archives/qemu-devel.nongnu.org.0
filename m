Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9EC6FEDC5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:17:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Id-0006Pd-9s; Thu, 11 May 2023 04:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IN-0006JN-HH
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:05 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IK-0000xZ-N5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc3088b7aso15607527a12.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792299; x=1686384299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hyQISceXBTNv4jbNz8lrHn9gEvFfSgtE9qQIEmFUjw=;
 b=RRNAyJGaIQBp3zD24OeFGwldIYE4juIJo5o/Jq7LDYVSFNw9w2V+Xr7GnGAmB9uBIV
 FVHZF4FDdoRKyg6LEl7IJw71I1XqcQaY9zZm7FXK9ZHzHzqelM9y1Uxb6wpVDxJN/p2C
 eG6eSINA4b26RYHlNsWecA7zKBtvhk4c13IiKj7fpn9S5ATKvwFbjZ6xAb+DI5NoarAS
 PEBcF/MVSHmuDq9JAVniciZl8Yu1zvqWG8r4tZkLj735LmvGRmFi0w5TZlGxp+mjvy8k
 z5XrdHk3PmdmPYw2Z+rXv51vgMf9He3sb+DK15WTvhTuUkuTJDPZ3qVdaPat+KeKWwOv
 1fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792299; x=1686384299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6hyQISceXBTNv4jbNz8lrHn9gEvFfSgtE9qQIEmFUjw=;
 b=PBQHkEfuS9+OtnRfFOf9wakbsyz3nnO7scmWd+nybHkJRNxOhzx+MxpERtkTKpldSE
 O2fP4GvfXTUhnqhcGYJXOE23r6OULwXKiq0b3lpIiW3CGry08C3RnV48G9Gqbkkd1/vO
 D0KQNGjUCN8tgFzqXrC5bLD80naPorHISgeYkvs7cXq0jveDJ+xtwKwRhx6L+/pnfUqj
 jNGHdgq8+DrCd/8Den4wi55rmRZqG0aOX4H1CeOnSRhlvxTwx9iXpUAclQCs/0A3A613
 VNNqdAMnrLIepxiuZ/y+3X+35HKo0M6O1L2HKT+I+7QOBcbGusqoKJxDu+PanPLYlYnm
 eSVg==
X-Gm-Message-State: AC+VfDxqVV4sQsF1nlfdrvxMfe1/omvnf6PebgOcnSgPwV2gKW31enY9
 VgHnnk/g3Uu1Kl9dj3vVRTkgZ54JMAynNXCt0hCy6w==
X-Google-Smtp-Source: ACHHUZ7SJ3KmkBl5lSMMpUgJMjlzQ/5B8t05kpXZpuuTGZPybDkMUAYUwINAStVAL74R6tIbe/Juog==
X-Received: by 2002:aa7:c84c:0:b0:50b:fb49:39c9 with SMTP id
 g12-20020aa7c84c000000b0050bfb4939c9mr14983412edt.34.1683792299238; 
 Thu, 11 May 2023 01:04:59 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jamie Iles <quic_jiles@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/53] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
Date: Thu, 11 May 2023 09:04:07 +0100
Message-Id: <20230511080450.860923-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52f.google.com
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

From: Jamie Iles <quic_jiles@quicinc.com>

The round-robin scheduler will iterate over the CPU list with an
assigned budget until the next timer expiry and may exit early because
of a TB exit.  This is fine under normal operation but with icount
enabled and SMP it is possible for a CPU to be starved of run time and
the system live-locks.

For example, booting a riscv64 platform with '-icount
shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
has timers enabled and starts performing TLB shootdowns.  In this case
we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
1.  As we enter the TCG loop, we assign the icount budget to next timer
interrupt to CPU 0 and begin executing where the guest is sat in a busy
loop exhausting all of the budget before we try to execute CPU 1 which
is the target of the IPI but CPU 1 is left with no budget with which to
execute and the process repeats.

We try here to add some fairness by splitting the budget across all of
the CPUs on the thread fairly before entering each one.  The CPU count
is cached on CPU list generation ID to avoid iterating the list on each
loop iteration.  With this change it is possible to boot an SMP rv64
guest with icount enabled and no hangs.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230427020925.51003-3-quic_jiles@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops-icount.h |  3 ++-
 accel/tcg/tcg-accel-ops-icount.c | 21 ++++++++++++++----
 accel/tcg/tcg-accel-ops-rr.c     | 37 +++++++++++++++++++++++++++++++-
 replay/replay.c                  |  3 +--
 4 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.h b/accel/tcg/tcg-accel-ops-icount.h
index 1b6fd9c607..16a301b6dc 100644
--- a/accel/tcg/tcg-accel-ops-icount.h
+++ b/accel/tcg/tcg-accel-ops-icount.h
@@ -11,7 +11,8 @@
 #define TCG_ACCEL_OPS_ICOUNT_H
 
 void icount_handle_deadline(void);
-void icount_prepare_for_run(CPUState *cpu);
+void icount_prepare_for_run(CPUState *cpu, int64_t cpu_budget);
+int64_t icount_percpu_budget(int cpu_count);
 void icount_process_data(CPUState *cpu);
 
 void icount_handle_interrupt(CPUState *cpu, int mask);
diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 84cc7421be..3d2cfbbc97 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -89,7 +89,20 @@ void icount_handle_deadline(void)
     }
 }
 
-void icount_prepare_for_run(CPUState *cpu)
+/* Distribute the budget evenly across all CPUs */
+int64_t icount_percpu_budget(int cpu_count)
+{
+    int64_t limit = icount_get_limit();
+    int64_t timeslice = limit / cpu_count;
+
+    if (timeslice == 0) {
+        timeslice = limit;
+    }
+
+    return timeslice;
+}
+
+void icount_prepare_for_run(CPUState *cpu, int64_t cpu_budget)
 {
     int insns_left;
 
@@ -101,13 +114,13 @@ void icount_prepare_for_run(CPUState *cpu)
     g_assert(cpu_neg(cpu)->icount_decr.u16.low == 0);
     g_assert(cpu->icount_extra == 0);
 
-    cpu->icount_budget = icount_get_limit();
+    replay_mutex_lock();
+
+    cpu->icount_budget = MIN(icount_get_limit(), cpu_budget);
     insns_left = MIN(0xffff, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
 
-    replay_mutex_lock();
-
     if (cpu->icount_budget == 0) {
         /*
          * We're called without the iothread lock, so must take it while
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 290833a37f..5788efa5ff 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/lockable.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpu-timers.h"
@@ -139,6 +140,33 @@ static void rr_force_rcu(Notifier *notify, void *data)
     rr_kick_next_cpu();
 }
 
+/*
+ * Calculate the number of CPUs that we will process in a single iteration of
+ * the main CPU thread loop so that we can fairly distribute the instruction
+ * count across CPUs.
+ *
+ * The CPU count is cached based on the CPU list generation ID to avoid
+ * iterating the list every time.
+ */
+static int rr_cpu_count(void)
+{
+    static unsigned int last_gen_id = ~0;
+    static int cpu_count;
+    CPUState *cpu;
+
+    QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
+
+    if (cpu_list_generation_id_get() != last_gen_id) {
+        cpu_count = 0;
+        CPU_FOREACH(cpu) {
+            ++cpu_count;
+        }
+        last_gen_id = cpu_list_generation_id_get();
+    }
+
+    return cpu_count;
+}
+
 /*
  * In the single-threaded case each vCPU is simulated in turn. If
  * there is more than a single vCPU we create a simple timer to kick
@@ -185,11 +213,16 @@ static void *rr_cpu_thread_fn(void *arg)
     cpu->exit_request = 1;
 
     while (1) {
+        /* Only used for icount_enabled() */
+        int64_t cpu_budget = 0;
+
         qemu_mutex_unlock_iothread();
         replay_mutex_lock();
         qemu_mutex_lock_iothread();
 
         if (icount_enabled()) {
+            int cpu_count = rr_cpu_count();
+
             /* Account partial waits to QEMU_CLOCK_VIRTUAL.  */
             icount_account_warp_timer();
             /*
@@ -197,6 +230,8 @@ static void *rr_cpu_thread_fn(void *arg)
              * waking up the I/O thread and waiting for completion.
              */
             icount_handle_deadline();
+
+            cpu_budget = icount_percpu_budget(cpu_count);
         }
 
         replay_mutex_unlock();
@@ -218,7 +253,7 @@ static void *rr_cpu_thread_fn(void *arg)
 
                 qemu_mutex_unlock_iothread();
                 if (icount_enabled()) {
-                    icount_prepare_for_run(cpu);
+                    icount_prepare_for_run(cpu, cpu_budget);
                 }
                 r = tcg_cpus_exec(cpu);
                 if (icount_enabled()) {
diff --git a/replay/replay.c b/replay/replay.c
index c39156c522..0f7d766efe 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -74,7 +74,7 @@ uint64_t replay_get_current_icount(void)
 int replay_get_instructions(void)
 {
     int res = 0;
-    replay_mutex_lock();
+    g_assert(replay_mutex_locked());
     if (replay_next_event_is(EVENT_INSTRUCTION)) {
         res = replay_state.instruction_count;
         if (replay_break_icount != -1LL) {
@@ -85,7 +85,6 @@ int replay_get_instructions(void)
             }
         }
     }
-    replay_mutex_unlock();
     return res;
 }
 
-- 
2.34.1


