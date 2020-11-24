Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2080D2C2CEE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:30:00 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbCT-00050Z-Pb
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khb5U-0006lA-Ol
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:22:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:38356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khb5Q-0001ip-5L
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:22:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9029DAF39;
 Tue, 24 Nov 2020 16:22:22 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Emilio G . Cota" <cota@braap.org>
Subject: [RFC v5 12/12] accel: centralize initialization of CpusAccelOps
Date: Tue, 24 Nov 2020 17:22:10 +0100
Message-Id: <20201124162210.8796-13-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124162210.8796-1-cfontana@suse.de>
References: <20201124162210.8796-1-cfontana@suse.de>
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
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/kvm/kvm-all.c          |  9 -------
 accel/kvm/kvm-cpus.c         | 26 +++++++++++++-----
 accel/kvm/kvm-cpus.h         |  2 --
 accel/qtest/qtest.c          | 31 ++++++++++++----------
 accel/tcg/tcg-cpus-icount.c  | 11 +-------
 accel/tcg/tcg-cpus-icount.h  |  2 ++
 accel/tcg/tcg-cpus-mttcg.c   | 12 +++------
 accel/tcg/tcg-cpus-mttcg.h   | 19 ++++++++++++++
 accel/tcg/tcg-cpus-rr.c      |  7 -----
 accel/tcg/tcg-cpus.c         | 48 ++++++++++++++++++++++++++-------
 accel/tcg/tcg-cpus.h         |  4 ---
 accel/xen/xen-all.c          | 29 ++++++++++----------
 include/sysemu/cpus.h        | 39 ++++++++++++++++++++-------
 softmmu/cpus.c               | 51 +++++++++++++++++++++++++++++-------
 target/i386/hax/hax-all.c    |  9 -------
 target/i386/hax/hax-cpus.c   | 29 +++++++++++++++-----
 target/i386/hax/hax-cpus.h   |  2 --
 target/i386/hvf/hvf-cpus.c   | 27 ++++++++++++++-----
 target/i386/hvf/hvf-cpus.h   |  2 --
 target/i386/hvf/hvf.c        |  9 -------
 target/i386/whpx/whpx-all.c  |  9 -------
 target/i386/whpx/whpx-cpus.c | 29 +++++++++++++++-----
 target/i386/whpx/whpx-cpus.h |  2 --
 23 files changed, 251 insertions(+), 157 deletions(-)
 create mode 100644 accel/tcg/tcg-cpus-mttcg.h

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 509b249f52..33156cc4c7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3234,12 +3234,3 @@ static void kvm_type_init(void)
 }
 
 type_init(kvm_type_init);
-
-static void kvm_accel_cpu_init(void)
-{
-    if (kvm_enabled()) {
-        cpus_register_accel(&kvm_cpus);
-    }
-}
-
-accel_cpu_init(kvm_accel_cpu_init);
diff --git a/accel/kvm/kvm-cpus.c b/accel/kvm/kvm-cpus.c
index d809b1e74c..33dc8e737a 100644
--- a/accel/kvm/kvm-cpus.c
+++ b/accel/kvm/kvm-cpus.c
@@ -74,11 +74,25 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
-const CpusAccel kvm_cpus = {
-    .create_vcpu_thread = kvm_start_vcpu_thread,
+static void kvm_cpus_class_init(ObjectClass *oc, void *data)
+{
+    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
 
-    .synchronize_post_reset = kvm_cpu_synchronize_post_reset,
-    .synchronize_post_init = kvm_cpu_synchronize_post_init,
-    .synchronize_state = kvm_cpu_synchronize_state,
-    .synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm,
+    ops->create_vcpu_thread = kvm_start_vcpu_thread;
+    ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
+    ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
+    ops->synchronize_state = kvm_cpu_synchronize_state;
+    ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
 };
+static const TypeInfo kvm_cpus_type_info = {
+    .name = CPUS_ACCEL_TYPE_NAME("kvm"),
+
+    .parent = TYPE_CPUS_ACCEL_OPS,
+    .class_init = kvm_cpus_class_init,
+    .abstract = true,
+};
+static void kvm_cpus_register_types(void)
+{
+    type_register_static(&kvm_cpus_type_info);
+}
+type_init(kvm_cpus_register_types);
diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index 3df732b816..bf0bd1bee4 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -12,8 +12,6 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel kvm_cpus;
-
 int kvm_init_vcpu(CPUState *cpu, Error **errp);
 int kvm_cpu_exec(CPUState *cpu);
 void kvm_destroy_vcpu(CPUState *cpu);
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 482f89729f..8bf51689bc 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -25,11 +25,6 @@
 #include "qemu/main-loop.h"
 #include "hw/core/cpu.h"
 
-const CpusAccel qtest_cpus = {
-    .create_vcpu_thread = dummy_start_vcpu_thread,
-    .get_virtual_clock = qtest_get_virtual_clock,
-};
-
 static int qtest_init_accel(MachineState *ms)
 {
     return 0;
@@ -51,18 +46,26 @@ static const TypeInfo qtest_accel_type = {
     .class_init = qtest_accel_class_init,
 };
 
+static void qtest_cpus_class_init(ObjectClass *oc, void *data)
+{
+    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
+
+    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->get_virtual_clock = qtest_get_virtual_clock;
+};
+
+static const TypeInfo qtest_cpus_type_info = {
+    .name = CPUS_ACCEL_TYPE_NAME("qtest"),
+
+    .parent = TYPE_CPUS_ACCEL_OPS,
+    .class_init = qtest_cpus_class_init,
+    .abstract = true,
+};
+
 static void qtest_type_init(void)
 {
     type_register_static(&qtest_accel_type);
+    type_register_static(&qtest_cpus_type_info);
 }
 
 type_init(qtest_type_init);
-
-static void qtest_accel_cpu_init(void)
-{
-    if (qtest_enabled()) {
-        cpus_register_accel(&qtest_cpus);
-    }
-}
-
-accel_cpu_init(qtest_accel_cpu_init);
diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
index 9f45432275..5445b4d545 100644
--- a/accel/tcg/tcg-cpus-icount.c
+++ b/accel/tcg/tcg-cpus-icount.c
@@ -125,7 +125,7 @@ void icount_process_data(CPUState *cpu)
     replay_mutex_unlock();
 }
 
-static void icount_handle_interrupt(CPUState *cpu, int mask)
+void icount_handle_interrupt(CPUState *cpu, int mask)
 {
     int old_mask = cpu->interrupt_request;
 
@@ -136,12 +136,3 @@ static void icount_handle_interrupt(CPUState *cpu, int mask)
         cpu_abort(cpu, "Raised interrupt while not in I/O function");
     }
 }
-
-const CpusAccel tcg_cpus_icount = {
-    .create_vcpu_thread = rr_start_vcpu_thread,
-    .kick_vcpu_thread = rr_kick_vcpu_thread,
-
-    .handle_interrupt = icount_handle_interrupt,
-    .get_virtual_clock = icount_get,
-    .get_elapsed_ticks = icount_get,
-};
diff --git a/accel/tcg/tcg-cpus-icount.h b/accel/tcg/tcg-cpus-icount.h
index b695939dfa..d884aa2aaa 100644
--- a/accel/tcg/tcg-cpus-icount.h
+++ b/accel/tcg/tcg-cpus-icount.h
@@ -14,4 +14,6 @@ void icount_handle_deadline(void);
 void icount_prepare_for_run(CPUState *cpu);
 void icount_process_data(CPUState *cpu);
 
+void icount_handle_interrupt(CPUState *cpu, int mask);
+
 #endif /* TCG_CPUS_ICOUNT_H */
diff --git a/accel/tcg/tcg-cpus-mttcg.c b/accel/tcg/tcg-cpus-mttcg.c
index 9c3767d260..dabf5ed42e 100644
--- a/accel/tcg/tcg-cpus-mttcg.c
+++ b/accel/tcg/tcg-cpus-mttcg.c
@@ -33,6 +33,7 @@
 #include "hw/boards.h"
 
 #include "tcg-cpus.h"
+#include "tcg-cpus-mttcg.h"
 
 /*
  * In the multi-threaded case each vCPU has its own thread. The TLS
@@ -103,12 +104,12 @@ static void *mttcg_cpu_thread_fn(void *arg)
     return NULL;
 }
 
-static void mttcg_kick_vcpu_thread(CPUState *cpu)
+void mttcg_kick_vcpu_thread(CPUState *cpu)
 {
     cpu_exit(cpu);
 }
 
-static void mttcg_start_vcpu_thread(CPUState *cpu)
+void mttcg_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
@@ -131,10 +132,3 @@ static void mttcg_start_vcpu_thread(CPUState *cpu)
     cpu->hThread = qemu_thread_get_handle(cpu->thread);
 #endif
 }
-
-const CpusAccel tcg_cpus_mttcg = {
-    .create_vcpu_thread = mttcg_start_vcpu_thread,
-    .kick_vcpu_thread = mttcg_kick_vcpu_thread,
-
-    .handle_interrupt = tcg_cpus_handle_interrupt,
-};
diff --git a/accel/tcg/tcg-cpus-mttcg.h b/accel/tcg/tcg-cpus-mttcg.h
new file mode 100644
index 0000000000..0af91dd3b3
--- /dev/null
+++ b/accel/tcg/tcg-cpus-mttcg.h
@@ -0,0 +1,19 @@
+/*
+ * QEMU TCG Multi Threaded vCPUs implementation
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef TCG_CPUS_MTTCG_H
+#define TCG_CPUS_MTTCG_H
+
+/* kick MTTCG vCPU thread */
+void mttcg_kick_vcpu_thread(CPUState *cpu);
+
+/* start an mttcg vCPU thread */
+void mttcg_start_vcpu_thread(CPUState *cpu);
+
+#endif /* TCG_CPUS_MTTCG_H */
diff --git a/accel/tcg/tcg-cpus-rr.c b/accel/tcg/tcg-cpus-rr.c
index 0181d2e4eb..802c57bb60 100644
--- a/accel/tcg/tcg-cpus-rr.c
+++ b/accel/tcg/tcg-cpus-rr.c
@@ -296,10 +296,3 @@ void rr_start_vcpu_thread(CPUState *cpu)
         cpu->created = true;
     }
 }
-
-const CpusAccel tcg_cpus_rr = {
-    .create_vcpu_thread = rr_start_vcpu_thread,
-    .kick_vcpu_thread = rr_kick_vcpu_thread,
-
-    .handle_interrupt = tcg_cpus_handle_interrupt,
-};
diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-cpus.c
index c9e662f06e..4f3a50af2e 100644
--- a/accel/tcg/tcg-cpus.c
+++ b/accel/tcg/tcg-cpus.c
@@ -35,6 +35,9 @@
 #include "hw/boards.h"
 
 #include "tcg-cpus.h"
+#include "tcg-cpus-mttcg.h"
+#include "tcg-cpus-rr.h"
+#include "tcg-cpus-icount.h"
 
 /* common functionality among all TCG variants */
 
@@ -81,17 +84,42 @@ void tcg_cpus_handle_interrupt(CPUState *cpu, int mask)
     }
 }
 
-static void tcg_accel_cpu_init(void)
+static void tcg_cpus_accel_chosen_init(CpusAccelOps *ops)
 {
-    if (tcg_enabled()) {
-        if (qemu_tcg_mttcg_enabled()) {
-            cpus_register_accel(&tcg_cpus_mttcg);
-        } else if (icount_enabled()) {
-            cpus_register_accel(&tcg_cpus_icount);
-        } else {
-            cpus_register_accel(&tcg_cpus_rr);
-        }
+    if (qemu_tcg_mttcg_enabled()) {
+        ops->create_vcpu_thread = mttcg_start_vcpu_thread;
+        ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
+        ops->handle_interrupt = tcg_cpus_handle_interrupt;
+
+    } else if (icount_enabled()) {
+        ops->create_vcpu_thread = rr_start_vcpu_thread;
+        ops->kick_vcpu_thread = rr_kick_vcpu_thread;
+        ops->handle_interrupt = icount_handle_interrupt;
+        ops->get_virtual_clock = icount_get;
+        ops->get_elapsed_ticks = icount_get;
+
+    } else {
+        ops->create_vcpu_thread = rr_start_vcpu_thread;
+        ops->kick_vcpu_thread = rr_kick_vcpu_thread;
+        ops->handle_interrupt = tcg_cpus_handle_interrupt;
     }
 }
 
-accel_cpu_init(tcg_accel_cpu_init);
+static void tcg_cpus_class_init(ObjectClass *oc, void *data)
+{
+    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
+
+    ops->accel_chosen_init = tcg_cpus_accel_chosen_init;
+};
+static const TypeInfo tcg_cpus_type_info = {
+    .name = CPUS_ACCEL_TYPE_NAME("tcg"),
+
+    .parent = TYPE_CPUS_ACCEL_OPS,
+    .class_init = tcg_cpus_class_init,
+    .abstract = true,
+};
+static void tcg_cpus_register_types(void)
+{
+    type_register_static(&tcg_cpus_type_info);
+}
+type_init(tcg_cpus_register_types);
diff --git a/accel/tcg/tcg-cpus.h b/accel/tcg/tcg-cpus.h
index d6893a32f8..923cbace12 100644
--- a/accel/tcg/tcg-cpus.h
+++ b/accel/tcg/tcg-cpus.h
@@ -14,10 +14,6 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel tcg_cpus_mttcg;
-extern const CpusAccel tcg_cpus_icount;
-extern const CpusAccel tcg_cpus_rr;
-
 void tcg_cpus_destroy(CPUState *cpu);
 int tcg_cpus_exec(CPUState *cpu);
 void tcg_cpus_handle_interrupt(CPUState *cpu, int mask);
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index be09b6ec22..976c7806d0 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -154,10 +154,6 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
     }
 }
 
-const CpusAccel xen_cpus = {
-    .create_vcpu_thread = dummy_start_vcpu_thread,
-};
-
 static int xen_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -219,18 +215,23 @@ static const TypeInfo xen_accel_type = {
     .class_init = xen_accel_class_init,
 };
 
+static void xen_cpus_class_init(ObjectClass *oc, void *data)
+{
+    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
+
+    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+};
+static const TypeInfo xen_cpus_type_info = {
+    .name = CPUS_ACCEL_TYPE_NAME("xen"),
+
+    .parent = TYPE_CPUS_ACCEL_OPS,
+    .class_init = xen_cpus_class_init,
+    .abstract = true,
+};
+
 static void xen_type_init(void)
 {
     type_register_static(&xen_accel_type);
+    type_register_static(&xen_cpus_type_info);
 }
-
 type_init(xen_type_init);
-
-static void xen_accel_cpu_init(void)
-{
-    if (xen_enabled()) {
-        cpus_register_accel(&xen_cpus);
-    }
-}
-
-accel_cpu_init(xen_accel_cpu_init);
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index e8156728c6..9b0c5eadf3 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -1,14 +1,39 @@
+/*
+ * CPUS module (softmmu/cpus.c) Accelerator Ops
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
 #ifndef QEMU_CPUS_H
 #define QEMU_CPUS_H
 
 #include "qemu/timer.h"
+#include "qom/object.h"
+
+/* accel/dummy-cpus.c */
+
+/* Create a dummy vcpu for CpusAccelOps->create_vcpu_thread */
+void dummy_start_vcpu_thread(CPUState *);
 
 /* cpus.c */
 
-/* CPU execution threads */
+#define TYPE_CPUS_ACCEL_OPS "accel-ops"
+#define CPUS_ACCEL_TYPE_NAME(name) (name "-" TYPE_CPUS_ACCEL_OPS)
 
-typedef struct CpusAccel {
-    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY */
+typedef struct CpusAccelOps CpusAccelOps;
+DECLARE_CLASS_CHECKERS(CpusAccelOps, CPUS_ACCEL_OPS, TYPE_CPUS_ACCEL_OPS)
+
+struct CpusAccelOps {
+    ObjectClass parent_class;
+
+    /* initialization function called when accel is chosen */
+    void (*accel_chosen_init)(CpusAccelOps *ops);
+
+    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
 
     void (*synchronize_post_reset)(CPUState *cpu);
@@ -20,13 +45,7 @@ typedef struct CpusAccel {
 
     int64_t (*get_virtual_clock)(void);
     int64_t (*get_elapsed_ticks)(void);
-} CpusAccel;
-
-/* register accel-specific cpus interface implementation */
-void cpus_register_accel(const CpusAccel *i);
-
-/* Create a dummy vcpu for CpusAccel->create_vcpu_thread */
-void dummy_start_vcpu_thread(CPUState *);
+};
 
 /* interface available for cpus accelerator threads */
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index e46ac68ad0..2d2386900a 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -127,7 +127,7 @@ void hw_error(const char *fmt, ...)
 /*
  * The chosen accelerator is supposed to register this.
  */
-static const CpusAccel *cpus_accel;
+static CpusAccelOps *cpus_accel;
 
 void cpu_synchronize_all_states(void)
 {
@@ -593,13 +593,6 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_lock_iothread();
 }
 
-void cpus_register_accel(const CpusAccel *ca)
-{
-    assert(ca != NULL);
-    assert(ca->create_vcpu_thread != NULL); /* mandatory */
-    cpus_accel = ca;
-}
-
 void qemu_init_vcpu(CPUState *cpu)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -617,7 +610,7 @@ void qemu_init_vcpu(CPUState *cpu)
         cpu_address_space_init(cpu, 0, "cpu-memory", cpu->memory);
     }
 
-    /* accelerators all implement the CpusAccel interface */
+    /* accelerators all implement the CpusAccelOps */
     g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
     cpus_accel->create_vcpu_thread(cpu);
 
@@ -797,3 +790,43 @@ void qmp_inject_nmi(Error **errp)
     nmi_monitor_handle(monitor_get_cpu_index(monitor_cur()), errp);
 }
 
+static const TypeInfo cpus_accel_type_info = {
+    .name = TYPE_CPUS_ACCEL_OPS,
+    .parent = TYPE_OBJECT,
+    .abstract = true,
+    .class_size = sizeof(CpusAccelOps),
+};
+static void cpus_register_types(void)
+{
+    type_register_static(&cpus_accel_type_info);
+}
+type_init(cpus_register_types);
+
+static void cpus_accel_ops_init(void)
+{
+    const char *ac_name;
+    ObjectClass *ac;
+    char *ops_name;
+    ObjectClass *ops;
+
+    ac = object_get_class(OBJECT(current_accel()));
+    g_assert(ac != NULL);
+    ac_name = object_class_get_name(ac);
+    g_assert(ac_name != NULL);
+
+    ops_name = g_strdup_printf("%s-ops", ac_name);
+    ops = object_class_by_name(ops_name);
+    g_free(ops_name);
+
+    /*
+     * all accelerators need to define ops, providing at least a mandatory
+     * non-NULL create_vcpu_thread operation.
+     */
+    g_assert(ops != NULL);
+    cpus_accel = CPUS_ACCEL_OPS_CLASS(ops);
+    if (cpus_accel->accel_chosen_init) {
+        cpus_accel->accel_chosen_init(cpus_accel);
+    }
+}
+
+accel_cpu_init(cpus_accel_ops_init);
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 77c365311c..ec3c426223 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -1138,12 +1138,3 @@ static void hax_type_init(void)
 }
 
 type_init(hax_type_init);
-
-static void hax_accel_cpu_init(void)
-{
-    if (hax_enabled()) {
-        cpus_register_accel(&hax_cpus);
-    }
-}
-
-accel_cpu_init(hax_accel_cpu_init);
diff --git a/target/i386/hax/hax-cpus.c b/target/i386/hax/hax-cpus.c
index f72c85bd49..171b5ac1e6 100644
--- a/target/i386/hax/hax-cpus.c
+++ b/target/i386/hax/hax-cpus.c
@@ -74,12 +74,27 @@ static void hax_start_vcpu_thread(CPUState *cpu)
 #endif
 }
 
-const CpusAccel hax_cpus = {
-    .create_vcpu_thread = hax_start_vcpu_thread,
-    .kick_vcpu_thread = hax_kick_vcpu_thread,
+static void hax_cpus_class_init(ObjectClass *oc, void *data)
+{
+    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
 
-    .synchronize_post_reset = hax_cpu_synchronize_post_reset,
-    .synchronize_post_init = hax_cpu_synchronize_post_init,
-    .synchronize_state = hax_cpu_synchronize_state,
-    .synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm,
+    ops->create_vcpu_thread = hax_start_vcpu_thread;
+    ops->kick_vcpu_thread = hax_kick_vcpu_thread;
+
+    ops->synchronize_post_reset = hax_cpu_synchronize_post_reset;
+    ops->synchronize_post_init = hax_cpu_synchronize_post_init;
+    ops->synchronize_state = hax_cpu_synchronize_state;
+    ops->synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm;
+};
+static const TypeInfo hax_cpus_type_info = {
+    .name = CPUS_ACCEL_TYPE_NAME("hax"),
+
+    .parent = TYPE_CPUS_ACCEL_OPS,
+    .class_init = hax_cpus_class_init,
+    .abstract = true,
 };
+static void hax_cpus_register_types(void)
+{
+    type_register_static(&hax_cpus_type_info);
+}
+type_init(hax_cpus_register_types);
diff --git a/target/i386/hax/hax-cpus.h b/target/i386/hax/hax-cpus.h
index ee8ab7a631..c7698519cd 100644
--- a/target/i386/hax/hax-cpus.h
+++ b/target/i386/hax/hax-cpus.h
@@ -12,8 +12,6 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel hax_cpus;
-
 #include "hax-interface.h"
 #include "hax-i386.h"
 
diff --git a/target/i386/hvf/hvf-cpus.c b/target/i386/hvf/hvf-cpus.c
index 817b3d7452..124662de58 100644
--- a/target/i386/hvf/hvf-cpus.c
+++ b/target/i386/hvf/hvf-cpus.c
@@ -121,11 +121,26 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
-const CpusAccel hvf_cpus = {
-    .create_vcpu_thread = hvf_start_vcpu_thread,
+static void hvf_cpus_class_init(ObjectClass *oc, void *data)
+{
+    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
 
-    .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
-    .synchronize_post_init = hvf_cpu_synchronize_post_init,
-    .synchronize_state = hvf_cpu_synchronize_state,
-    .synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm,
+    ops->create_vcpu_thread = hvf_start_vcpu_thread;
+
+    ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
+    ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
+    ops->synchronize_state = hvf_cpu_synchronize_state;
+    ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;
+};
+static const TypeInfo hvf_cpus_type_info = {
+    .name = CPUS_ACCEL_TYPE_NAME("hvf"),
+
+    .parent = TYPE_CPUS_ACCEL_OPS,
+    .class_init = hvf_cpus_class_init,
+    .abstract = true,
 };
+static void hvf_cpus_register_types(void)
+{
+    type_register_static(&hvf_cpus_type_info);
+}
+type_init(hvf_cpus_register_types);
diff --git a/target/i386/hvf/hvf-cpus.h b/target/i386/hvf/hvf-cpus.h
index ced31b82c0..8f992da168 100644
--- a/target/i386/hvf/hvf-cpus.h
+++ b/target/i386/hvf/hvf-cpus.h
@@ -12,8 +12,6 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel hvf_cpus;
-
 int hvf_init_vcpu(CPUState *);
 int hvf_vcpu_exec(CPUState *);
 void hvf_cpu_synchronize_state(CPUState *);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 58794c35ae..bd94bb5243 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -910,12 +910,3 @@ static void hvf_type_init(void)
 }
 
 type_init(hvf_type_init);
-
-static void hvf_accel_cpu_init(void)
-{
-    if (hvf_enabled()) {
-        cpus_register_accel(&hvf_cpus);
-    }
-}
-
-accel_cpu_init(hvf_accel_cpu_init);
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 097d6f5e60..90adae9af7 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1711,12 +1711,3 @@ error:
 }
 
 type_init(whpx_type_init);
-
-static void whpx_accel_cpu_init(void)
-{
-    if (whpx_enabled()) {
-        cpus_register_accel(&whpx_cpus);
-    }
-}
-
-accel_cpu_init(whpx_accel_cpu_init);
diff --git a/target/i386/whpx/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c
index d9bd5a2d36..1e736a50b0 100644
--- a/target/i386/whpx/whpx-cpus.c
+++ b/target/i386/whpx/whpx-cpus.c
@@ -85,12 +85,27 @@ static void whpx_kick_vcpu_thread(CPUState *cpu)
     }
 }
 
-const CpusAccel whpx_cpus = {
-    .create_vcpu_thread = whpx_start_vcpu_thread,
-    .kick_vcpu_thread = whpx_kick_vcpu_thread,
+static void whpx_cpus_class_init(ObjectClass *oc, void *data)
+{
+    CpusAccelOps *ops = CPUS_ACCEL_OPS_CLASS(oc);
 
-    .synchronize_post_reset = whpx_cpu_synchronize_post_reset,
-    .synchronize_post_init = whpx_cpu_synchronize_post_init,
-    .synchronize_state = whpx_cpu_synchronize_state,
-    .synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm,
+    ops->create_vcpu_thread = whpx_start_vcpu_thread;
+    ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
+
+    ops->synchronize_post_reset = whpx_cpu_synchronize_post_reset;
+    ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
+    ops->synchronize_state = whpx_cpu_synchronize_state;
+    ops->synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm;
+};
+static const TypeInfo whpx_cpus_type_info = {
+    .name = CPUS_ACCEL_TYPE_NAME("whpx"),
+
+    .parent = TYPE_CPUS_ACCEL_OPS,
+    .class_init = whpx_cpus_class_init,
+    .abstract = true,
 };
+static void whpx_cpus_register_types(void)
+{
+    type_register_static(&whpx_cpus_type_info);
+}
+type_init(whpx_cpus_register_types);
diff --git a/target/i386/whpx/whpx-cpus.h b/target/i386/whpx/whpx-cpus.h
index bdb367d1d0..2dee6d61ea 100644
--- a/target/i386/whpx/whpx-cpus.h
+++ b/target/i386/whpx/whpx-cpus.h
@@ -12,8 +12,6 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel whpx_cpus;
-
 int whpx_init_vcpu(CPUState *cpu);
 int whpx_vcpu_exec(CPUState *cpu);
 void whpx_destroy_vcpu(CPUState *cpu);
-- 
2.26.2


