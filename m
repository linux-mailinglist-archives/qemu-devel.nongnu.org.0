Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1DE2CFBEB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:19:14 +0100 (CET)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klaHB-0002Zl-SG
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaDZ-0000WI-DU
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:15:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:48060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaDV-000076-A7
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:15:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2114EAD75;
 Sat,  5 Dec 2020 16:15:23 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v8 02/27] accel/tcg: split tcg_start_vcpu_thread
Date: Sat,  5 Dec 2020 17:14:53 +0100
Message-Id: <20201205161518.14365-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201205161518.14365-1-cfontana@suse.de>
References: <20201205161518.14365-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

after the initial split into 3 tcg variants, we proceed to also
split tcg_start_vcpu_thread.

We actually split it in 2 this time, since the icount variant
just uses the round robin function.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c         |  5 ++++
 accel/tcg/tcg-cpus-icount.c |  2 +-
 accel/tcg/tcg-cpus-mttcg.c  | 29 +++++++++++++++++--
 accel/tcg/tcg-cpus-mttcg.h  | 21 --------------
 accel/tcg/tcg-cpus-rr.c     | 39 +++++++++++++++++++++++--
 accel/tcg/tcg-cpus-rr.h     |  3 +-
 accel/tcg/tcg-cpus.c        | 58 -------------------------------------
 accel/tcg/tcg-cpus.h        |  1 -
 8 files changed, 71 insertions(+), 87 deletions(-)
 delete mode 100644 accel/tcg/tcg-cpus-mttcg.h

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index e42a028043..1ac0b76515 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -105,6 +105,11 @@ static int tcg_init(MachineState *ms)
     tcg_exec_init(s->tb_size * 1024 * 1024);
     mttcg_enabled = s->mttcg_enabled;
 
+    /*
+     * Initialize TCG regions
+     */
+    tcg_region_init();
+
     if (mttcg_enabled) {
         cpus_register_accel(&tcg_cpus_mttcg);
     } else if (icount_enabled()) {
diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
index d3af3afb6d..82dbe2cacf 100644
--- a/accel/tcg/tcg-cpus-icount.c
+++ b/accel/tcg/tcg-cpus-icount.c
@@ -138,7 +138,7 @@ static void icount_handle_interrupt(CPUState *cpu, int mask)
 }
 
 const CpusAccel tcg_cpus_icount = {
-    .create_vcpu_thread = tcg_start_vcpu_thread,
+    .create_vcpu_thread = rr_start_vcpu_thread,
     .kick_vcpu_thread = qemu_cpu_kick_rr_cpus,
 
     .handle_interrupt = icount_handle_interrupt,
diff --git a/accel/tcg/tcg-cpus-mttcg.c b/accel/tcg/tcg-cpus-mttcg.c
index dac724fc85..f2b892a380 100644
--- a/accel/tcg/tcg-cpus-mttcg.c
+++ b/accel/tcg/tcg-cpus-mttcg.c
@@ -33,7 +33,6 @@
 #include "hw/boards.h"
 
 #include "tcg-cpus.h"
-#include "tcg-cpus-mttcg.h"
 
 /*
  * In the multi-threaded case each vCPU has its own thread. The TLS
@@ -41,7 +40,7 @@
  * current CPUState for a given thread.
  */
 
-void *tcg_cpu_thread_fn(void *arg)
+static void *tcg_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
 
@@ -109,8 +108,32 @@ static void mttcg_kick_vcpu_thread(CPUState *cpu)
     cpu_exit(cpu);
 }
 
+static void mttcg_start_vcpu_thread(CPUState *cpu)
+{
+    char thread_name[VCPU_THREAD_NAME_SIZE];
+
+    g_assert(tcg_enabled());
+
+    parallel_cpus = (current_machine->smp.max_cpus > 1);
+
+    cpu->thread = g_malloc0(sizeof(QemuThread));
+    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    qemu_cond_init(cpu->halt_cond);
+
+    /* create a thread per vCPU with TCG (MTTCG) */
+    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
+             cpu->cpu_index);
+
+    qemu_thread_create(cpu->thread, thread_name, tcg_cpu_thread_fn,
+                       cpu, QEMU_THREAD_JOINABLE);
+
+#ifdef _WIN32
+    cpu->hThread = qemu_thread_get_handle(cpu->thread);
+#endif
+}
+
 const CpusAccel tcg_cpus_mttcg = {
-    .create_vcpu_thread = tcg_start_vcpu_thread,
+    .create_vcpu_thread = mttcg_start_vcpu_thread,
     .kick_vcpu_thread = mttcg_kick_vcpu_thread,
 
     .handle_interrupt = tcg_handle_interrupt,
diff --git a/accel/tcg/tcg-cpus-mttcg.h b/accel/tcg/tcg-cpus-mttcg.h
deleted file mode 100644
index d1bd771f49..0000000000
--- a/accel/tcg/tcg-cpus-mttcg.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * QEMU TCG Multi Threaded vCPUs implementation
- *
- * Copyright 2020 SUSE LLC
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef TCG_CPUS_MTTCG_H
-#define TCG_CPUS_MTTCG_H
-
-/*
- * In the multi-threaded case each vCPU has its own thread. The TLS
- * variable current_cpu can be used deep in the code to find the
- * current CPUState for a given thread.
- */
-
-void *tcg_cpu_thread_fn(void *arg);
-
-#endif /* TCG_CPUS_MTTCG_H */
diff --git a/accel/tcg/tcg-cpus-rr.c b/accel/tcg/tcg-cpus-rr.c
index ad50a3765f..f3b262bec7 100644
--- a/accel/tcg/tcg-cpus-rr.c
+++ b/accel/tcg/tcg-cpus-rr.c
@@ -144,7 +144,7 @@ static void deal_with_unplugged_cpus(void)
  * elsewhere.
  */
 
-void *tcg_rr_cpu_thread_fn(void *arg)
+static void *tcg_rr_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
 
@@ -262,8 +262,43 @@ void *tcg_rr_cpu_thread_fn(void *arg)
     return NULL;
 }
 
+void rr_start_vcpu_thread(CPUState *cpu)
+{
+    char thread_name[VCPU_THREAD_NAME_SIZE];
+    static QemuCond *single_tcg_halt_cond;
+    static QemuThread *single_tcg_cpu_thread;
+
+    g_assert(tcg_enabled());
+    parallel_cpus = false;
+
+    if (!single_tcg_cpu_thread) {
+        cpu->thread = g_malloc0(sizeof(QemuThread));
+        cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+        qemu_cond_init(cpu->halt_cond);
+
+        /* share a single thread for all cpus with TCG */
+        snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "ALL CPUs/TCG");
+        qemu_thread_create(cpu->thread, thread_name,
+                           tcg_rr_cpu_thread_fn,
+                           cpu, QEMU_THREAD_JOINABLE);
+
+        single_tcg_halt_cond = cpu->halt_cond;
+        single_tcg_cpu_thread = cpu->thread;
+#ifdef _WIN32
+        cpu->hThread = qemu_thread_get_handle(cpu->thread);
+#endif
+    } else {
+        /* we share the thread */
+        cpu->thread = single_tcg_cpu_thread;
+        cpu->halt_cond = single_tcg_halt_cond;
+        cpu->thread_id = first_cpu->thread_id;
+        cpu->can_do_io = 1;
+        cpu->created = true;
+    }
+}
+
 const CpusAccel tcg_cpus_rr = {
-    .create_vcpu_thread = tcg_start_vcpu_thread,
+    .create_vcpu_thread = rr_start_vcpu_thread,
     .kick_vcpu_thread = qemu_cpu_kick_rr_cpus,
 
     .handle_interrupt = tcg_handle_interrupt,
diff --git a/accel/tcg/tcg-cpus-rr.h b/accel/tcg/tcg-cpus-rr.h
index 1936fd16ab..2e5943eda9 100644
--- a/accel/tcg/tcg-cpus-rr.h
+++ b/accel/tcg/tcg-cpus-rr.h
@@ -15,6 +15,7 @@
 /* Kick all RR vCPUs. */
 void qemu_cpu_kick_rr_cpus(CPUState *unused);
 
-void *tcg_rr_cpu_thread_fn(void *arg);
+/* start the round robin vcpu thread */
+void rr_start_vcpu_thread(CPUState *cpu);
 
 #endif /* TCG_CPUS_RR_H */
diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-cpus.c
index f2b9bbf99e..86fd09545a 100644
--- a/accel/tcg/tcg-cpus.c
+++ b/accel/tcg/tcg-cpus.c
@@ -35,67 +35,9 @@
 #include "hw/boards.h"
 
 #include "tcg-cpus.h"
-#include "tcg-cpus-mttcg.h"
-#include "tcg-cpus-rr.h"
 
 /* common functionality among all TCG variants */
 
-void tcg_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-    static QemuCond *single_tcg_halt_cond;
-    static QemuThread *single_tcg_cpu_thread;
-    static int tcg_region_inited;
-
-    assert(tcg_enabled());
-    /*
-     * Initialize TCG regions--once. Now is a good time, because:
-     * (1) TCG's init context, prologue and target globals have been set up.
-     * (2) qemu_tcg_mttcg_enabled() works now (TCG init code runs before the
-     *     -accel flag is processed, so the check doesn't work then).
-     */
-    if (!tcg_region_inited) {
-        tcg_region_inited = 1;
-        tcg_region_init();
-        parallel_cpus = qemu_tcg_mttcg_enabled() && current_machine->smp.max_cpus > 1;
-    }
-
-    if (qemu_tcg_mttcg_enabled() || !single_tcg_cpu_thread) {
-        cpu->thread = g_malloc0(sizeof(QemuThread));
-        cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-        qemu_cond_init(cpu->halt_cond);
-
-        if (qemu_tcg_mttcg_enabled()) {
-            /* create a thread per vCPU with TCG (MTTCG) */
-            snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
-                 cpu->cpu_index);
-
-            qemu_thread_create(cpu->thread, thread_name, tcg_cpu_thread_fn,
-                               cpu, QEMU_THREAD_JOINABLE);
-
-        } else {
-            /* share a single thread for all cpus with TCG */
-            snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "ALL CPUs/TCG");
-            qemu_thread_create(cpu->thread, thread_name,
-                               tcg_rr_cpu_thread_fn,
-                               cpu, QEMU_THREAD_JOINABLE);
-
-            single_tcg_halt_cond = cpu->halt_cond;
-            single_tcg_cpu_thread = cpu->thread;
-        }
-#ifdef _WIN32
-        cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
-    } else {
-        /* For non-MTTCG cases we share the thread */
-        cpu->thread = single_tcg_cpu_thread;
-        cpu->halt_cond = single_tcg_halt_cond;
-        cpu->thread_id = first_cpu->thread_id;
-        cpu->can_do_io = 1;
-        cpu->created = true;
-    }
-}
-
 void qemu_tcg_destroy_vcpu(CPUState *cpu)
 {
     cpu_thread_signal_destroyed(cpu);
diff --git a/accel/tcg/tcg-cpus.h b/accel/tcg/tcg-cpus.h
index 279ba72e1f..b7ca954e13 100644
--- a/accel/tcg/tcg-cpus.h
+++ b/accel/tcg/tcg-cpus.h
@@ -18,7 +18,6 @@ extern const CpusAccel tcg_cpus_mttcg;
 extern const CpusAccel tcg_cpus_icount;
 extern const CpusAccel tcg_cpus_rr;
 
-void tcg_start_vcpu_thread(CPUState *cpu);
 void qemu_tcg_destroy_vcpu(CPUState *cpu);
 int tcg_cpu_exec(CPUState *cpu);
 void tcg_handle_interrupt(CPUState *cpu, int mask);
-- 
2.26.2


