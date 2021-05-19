Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E083897E0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 22:28:53 +0200 (CEST)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSoG-0007sE-5A
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 16:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSjH-0005HY-8c; Wed, 19 May 2021 16:23:43 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48284 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSjF-0003Pb-A0; Wed, 19 May 2021 16:23:43 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id 2F87560806C2;
 Wed, 19 May 2021 22:23:04 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 14/19] arm/hvf: Add a WFI handler
Date: Wed, 19 May 2021 22:22:48 +0200
Message-Id: <20210519202253.76782-15-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210519202253.76782-1-agraf@csgraf.de>
References: <20210519202253.76782-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Collingbourne <pcc@google.com>

Sleep on WFI until the VTIMER is due but allow ourselves to be woken
up on IPI.

In this implementation IPI is blocked on the CPU thread at startup and
pselect() is used to atomically unblock the signal and begin sleeping.
The signal is sent unconditionally so there's no need to worry about
races between actually sleeping and the "we think we're sleeping"
state. It may lead to an extra wakeup but that's better than missing
it entirely.

Signed-off-by: Peter Collingbourne <pcc@google.com>
[agraf: Remove unused 'set' variable, always advance PC on WFX trap]
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>

---

v6 -> v7:

  - Move WFI into function
  - Improve comment wording
---
 accel/hvf/hvf-accel-ops.c |  5 ++-
 include/sysemu/hvf_int.h  |  1 +
 target/arm/hvf/hvf.c      | 68 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 48e402ef57..63ec8a6f25 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -369,15 +369,14 @@ static int hvf_init_vcpu(CPUState *cpu)
     cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
 
     /* init cpu signals */
-    sigset_t set;
     struct sigaction sigact;
 
     memset(&sigact, 0, sizeof(sigact));
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
+    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
+    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index e52d67ed5c..6d4eef8065 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -51,6 +51,7 @@ struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
     bool vtimer_masked;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 3934c05979..67002efd36 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2,6 +2,7 @@
  * QEMU Hypervisor.framework support for Apple Silicon
 
  * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ * Copyright 2020 Google LLC
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -17,6 +18,8 @@
 #include "sysemu/hvf_int.h"
 #include "sysemu/hw_accel.h"
 
+#include <mach/mach_time.h>
+
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
 #include "qemu/main-loop.h"
@@ -457,6 +460,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    cpus_kick_thread(cpu);
     hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
@@ -536,6 +540,67 @@ static int hvf_inject_interrupts(CPUState *cpu)
     return 0;
 }
 
+static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
+{
+    /*
+     * Use pselect to sleep so that other threads can IPI us while we're
+     * sleeping.
+     */
+    qatomic_mb_set(&cpu->thread_kicked, false);
+    qemu_mutex_unlock_iothread();
+    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
+    qemu_mutex_lock_iothread();
+}
+
+static void hvf_wfi(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    hv_return_t r;
+    uint64_t ctl;
+
+    if (cpu->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
+        /* Interrupt pending, no need to wait */
+        return;
+    }
+
+    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
+                            &ctl);
+    assert_hvf_ok(r);
+
+    if (!(ctl & 1) || (ctl & 2)) {
+        /* Timer disabled or masked, just wait for an IPI. */
+        hvf_wait_for_ipi(cpu, NULL);
+        return;
+    }
+
+    uint64_t cval;
+    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
+                            &cval);
+    assert_hvf_ok(r);
+
+    int64_t ticks_to_sleep = cval - mach_absolute_time();
+    if (ticks_to_sleep < 0) {
+        return;
+    }
+
+    uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
+    uint64_t nanos =
+        (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
+        1000000000 / arm_cpu->gt_cntfrq_hz;
+
+    /*
+     * Don't sleep for less than the time a context switch would take,
+     * so that we can satisfy fast timer requests on the same CPU.
+     * Measurements on M1 show the sweet spot to be ~2ms.
+     */
+    if (!seconds && nanos < 2000000) {
+        return;
+    }
+
+    struct timespec ts = { seconds, nanos };
+    hvf_wait_for_ipi(cpu, &ts);
+}
+
 static void hvf_sync_vtimer(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -670,6 +735,9 @@ int hvf_vcpu_exec(CPUState *cpu)
     }
     case EC_WFX_TRAP:
         advance_pc = true;
+        if (!(syndrome & WFX_IS_WFE)) {
+            hvf_wfi(cpu);
+        }
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-- 
2.30.1 (Apple Git-130)


