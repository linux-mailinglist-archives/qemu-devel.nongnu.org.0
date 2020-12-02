Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6C2CC659
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 20:15:59 +0100 (CET)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXba-0004eN-K6
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 14:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXQQ-0003Ad-85; Wed, 02 Dec 2020 14:04:26 -0500
Received: from mail.csgraf.de ([188.138.100.120]:56488
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXQN-0005Gi-4L; Wed, 02 Dec 2020 14:04:25 -0500
Received: from localhost.localdomain
 (dynamic-077-007-031-140.77.7.pool.telefonica.de [77.7.31.140])
 by csgraf.de (Postfix) with ESMTPSA id D030B39004F1;
 Wed,  2 Dec 2020 20:04:18 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/10] arm/hvf: Add a WFI handler
Date: Wed,  2 Dec 2020 20:04:06 +0100
Message-Id: <20201202190408.2041-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201202190408.2041-1-agraf@csgraf.de>
References: <20201202190408.2041-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
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
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Collingbourne <pcc@google.com>

Sleep on WFI until the VTIMER is due but allow ourselves to be woken
up on IPI.

Signed-off-by: Peter Collingbourne <pcc@google.com>
[agraf: Remove unused 'set' variable, always advance PC on WFX trap]
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-cpus.c     |  5 ++--
 include/sysemu/hvf_int.h |  1 +
 target/arm/hvf/hvf.c     | 55 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index e613c22ad0..a981ccde70 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -337,15 +337,14 @@ static int hvf_init_vcpu(CPUState *cpu)
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
index 5f15119184..13adf6ea77 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -62,6 +62,7 @@ extern HVFState *hvf_state;
 struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5ecce36d4a..79aeeb237b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2,6 +2,7 @@
  * QEMU Hypervisor.framework support for Apple Silicon
 
  * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ * Copyright 2020 Google LLC
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -18,6 +19,7 @@
 #include "sysemu/hw_accel.h"
 
 #include <Hypervisor/Hypervisor.h>
+#include <mach/mach_time.h>
 
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
@@ -413,6 +415,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    cpus_kick_thread(cpu);
     hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
@@ -468,6 +471,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
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
 int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -579,6 +594,46 @@ int hvf_vcpu_exec(CPUState *cpu)
         }
         case EC_WFX_TRAP:
             advance_pc = true;
+            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
+                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
+
+                uint64_t ctl;
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
+                                        &ctl);
+                assert_hvf_ok(r);
+
+                if (!(ctl & 1) || (ctl & 2)) {
+                    /* Timer disabled or masked, just wait for an IPI. */
+                    hvf_wait_for_ipi(cpu, NULL);
+                    break;
+                }
+
+                uint64_t cval;
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
+                                        &cval);
+                assert_hvf_ok(r);
+
+                int64_t ticks_to_sleep = cval - mach_absolute_time();
+                if (ticks_to_sleep < 0) {
+                    break;
+                }
+
+                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
+                uint64_t nanos =
+                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
+                    1000000000 / arm_cpu->gt_cntfrq_hz;
+
+                /*
+                 * Don't sleep for less than 2ms. This is believed to improve
+                 * latency of message passing workloads.
+                 */
+                if (!seconds && nanos < 2000000) {
+                    break;
+                }
+
+                struct timespec ts = { seconds, nanos };
+                hvf_wait_for_ipi(cpu, &ts);
+            }
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-- 
2.24.3 (Apple Git-128)


