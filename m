Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5E2CE346
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 00:58:49 +0100 (CET)
Received: from localhost ([::1]:43338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkyUq-0006eh-OE
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 18:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLr-0003Iw-Kz; Thu, 03 Dec 2020 18:49:31 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57584
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLp-0003Q5-MT; Thu, 03 Dec 2020 18:49:31 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id 36AB0390051A;
 Fri,  4 Dec 2020 00:49:03 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/11] arm/hvf: Add a WFI handler
Date: Fri,  4 Dec 2020 00:48:55 +0100
Message-Id: <20201203234857.21051-10-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201203234857.21051-1-agraf@csgraf.de>
References: <20201203234857.21051-1-agraf@csgraf.de>
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

In this implementation IPI is blocked on the CPU thread at startup and
pselect() is used to atomically unblock the signal and begin sleeping.
The signal is sent unconditionally so there's no need to worry about
races between actually sleeping and the "we think we're sleeping"
state. It may lead to an extra wakeup but that's better than missing
it entirely.

Signed-off-by: Peter Collingbourne <pcc@google.com>
[agraf: Remove unused 'set' variable, always advance PC on WFX trap]
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-cpus.c     |  5 ++--
 include/sysemu/hvf_int.h |  1 +
 target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index ef18f01a7d..3414c190c3 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -322,15 +322,14 @@ static int hvf_init_vcpu(CPUState *cpu)
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
index c2ac6c8f97..7a397fe85a 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -51,6 +51,7 @@ extern HVFState *hvf_state;
 struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8f5e2b0bd0..979008e188 100644
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
@@ -411,6 +414,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    cpus_kick_thread(cpu);
     hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
@@ -466,6 +470,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
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
@@ -577,6 +593,46 @@ int hvf_vcpu_exec(CPUState *cpu)
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


