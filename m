Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED82D340E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:44:48 +0100 (CET)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjqp-0002ZK-SI
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmizK-0001gw-Af
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:44280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmiz9-000118-B8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19389AD8A;
 Tue,  8 Dec 2020 19:49:08 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v9 27/32] accel: replace struct CpusAccel with AccelOpsClass
Date: Tue,  8 Dec 2020 20:48:34 +0100
Message-Id: <20201208194839.31305-28-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208194839.31305-1-cfontana@suse.de>
References: <20201208194839.31305-1-cfontana@suse.de>
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

centralize the registration of the cpus.c module
accelerator operations in accel/accel-softmmu.c

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 MAINTAINERS                  |  3 ++-
 accel/accel-common.c         | 11 +++++++++
 accel/accel-softmmu.c        | 43 +++++++++++++++++++++++++++++++---
 accel/accel-softmmu.h        | 15 ++++++++++++
 accel/kvm/kvm-all.c          |  2 --
 accel/kvm/kvm-cpus.c         | 26 ++++++++++++++++-----
 accel/kvm/kvm-cpus.h         |  2 --
 accel/qtest/qtest.c          | 23 +++++++++++++-----
 accel/tcg/tcg-all.c          | 12 ----------
 accel/tcg/tcg-cpus-icount.c  | 11 +--------
 accel/tcg/tcg-cpus-icount.h  |  2 ++
 accel/tcg/tcg-cpus-mttcg.c   | 12 +++-------
 accel/tcg/tcg-cpus-mttcg.h   | 19 +++++++++++++++
 accel/tcg/tcg-cpus-rr.c      |  7 ------
 accel/tcg/tcg-cpus.c         | 43 ++++++++++++++++++++++++++++++++++
 accel/tcg/tcg-cpus.h         |  4 ----
 accel/xen/xen-all.c          | 22 ++++++++++++------
 bsd-user/main.c              |  3 ++-
 include/qemu/accel.h         |  2 ++
 include/sysemu/accel-ops.h   | 45 ++++++++++++++++++++++++++++++++++++
 include/sysemu/cpus.h        | 26 ++++-----------------
 linux-user/main.c            |  1 +
 softmmu/cpus.c               | 12 +++++-----
 softmmu/vl.c                 |  6 +++--
 target/i386/hax/hax-all.c    |  3 ---
 target/i386/hax/hax-cpus.c   | 29 +++++++++++++++++------
 target/i386/hax/hax-cpus.h   |  2 --
 target/i386/hvf/hvf-cpus.c   | 27 +++++++++++++++++-----
 target/i386/hvf/hvf-cpus.h   |  2 --
 target/i386/hvf/hvf.c        |  1 -
 target/i386/whpx/whpx-all.c  |  2 --
 target/i386/whpx/whpx-cpus.c | 29 +++++++++++++++++------
 target/i386/whpx/whpx-cpus.h |  2 --
 33 files changed, 318 insertions(+), 131 deletions(-)
 create mode 100644 accel/accel-softmmu.h
 create mode 100644 accel/tcg/tcg-cpus-mttcg.h
 create mode 100644 include/sysemu/accel-ops.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6235dd3a9f..8f0e773a47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -435,7 +435,8 @@ M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/accel.h
-F: accel/accel.c
+F: include/sysemu/accel-ops.h
+F: accel/accel-*.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index ddec8cb5ae..6b59873419 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -26,6 +26,10 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 
+#ifndef CONFIG_USER_ONLY
+#include "accel-softmmu.h"
+#endif /* !CONFIG_USER_ONLY */
+
 static const TypeInfo accel_type = {
     .name = TYPE_ACCEL,
     .parent = TYPE_OBJECT,
@@ -42,6 +46,13 @@ AccelClass *accel_find(const char *opt_name)
     return ac;
 }
 
+void accel_init_interfaces(AccelClass *ac)
+{
+#ifndef CONFIG_USER_ONLY
+    accel_init_ops_interfaces(ac);
+#endif /* !CONFIG_USER_ONLY */
+}
+
 static void register_accel_types(void)
 {
     type_register_static(&accel_type);
diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index f89da8f9d1..2d15d3f2f4 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -26,9 +26,9 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 #include "hw/boards.h"
-#include "sysemu/arch_init.h"
-#include "sysemu/sysemu.h"
-#include "qom/object.h"
+#include "sysemu/cpus.h"
+
+#include "accel-softmmu.h"
 
 int accel_init_machine(AccelState *accel, MachineState *ms)
 {
@@ -60,3 +60,40 @@ void accel_setup_post(MachineState *ms)
         acc->setup_post(ms, accel);
     }
 }
+
+/* initialize the arch-independent accel operation interfaces */
+void accel_init_ops_interfaces(AccelClass *ac)
+{
+    const char *ac_name;
+    char *ops_name;
+    AccelOpsClass *ops;
+
+    ac_name = object_class_get_name(OBJECT_CLASS(ac));
+    g_assert(ac_name != NULL);
+
+    ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
+    ops = ACCEL_OPS_CLASS(object_class_by_name(ops_name));
+    g_free(ops_name);
+
+    /*
+     * all accelerators need to define ops, providing at least a mandatory
+     * non-NULL create_vcpu_thread operation.
+     */
+    g_assert(ops != NULL);
+    if (ops->ops_init) {
+        ops->ops_init(ops);
+    }
+    cpus_register_accel(ops);
+}
+
+static const TypeInfo accel_ops_type_info = {
+    .name = TYPE_ACCEL_OPS,
+    .parent = TYPE_OBJECT,
+    .abstract = true,
+    .class_size = sizeof(AccelOpsClass),
+};
+static void accel_softmmu_register_types(void)
+{
+    type_register_static(&accel_ops_type_info);
+}
+type_init(accel_softmmu_register_types);
diff --git a/accel/accel-softmmu.h b/accel/accel-softmmu.h
new file mode 100644
index 0000000000..2877b5c234
--- /dev/null
+++ b/accel/accel-softmmu.h
@@ -0,0 +1,15 @@
+/*
+ * QEMU System Emulation accel internal functions
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef ACCEL_SOFTMMU_H
+#define ACCEL_SOFTMMU_H
+
+void accel_init_ops_interfaces(AccelClass *ac);
+
+#endif /* ACCEL_SOFTMMU_H */
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index baaa54249d..18be3cd113 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2253,8 +2253,6 @@ static int kvm_init(MachineState *ms)
         ret = ram_block_discard_disable(true);
         assert(!ret);
     }
-
-    cpus_register_accel(&kvm_cpus);
     return 0;
 
 err:
diff --git a/accel/kvm/kvm-cpus.c b/accel/kvm/kvm-cpus.c
index d809b1e74c..fc9dda46ae 100644
--- a/accel/kvm/kvm-cpus.c
+++ b/accel/kvm/kvm-cpus.c
@@ -74,11 +74,25 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
-const CpusAccel kvm_cpus = {
-    .create_vcpu_thread = kvm_start_vcpu_thread,
+static void kvm_cpus_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
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
+    .name = ACCEL_OPS_NAME("kvm"),
+
+    .parent = TYPE_ACCEL_OPS,
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
index b4e731cb2b..68d86de30f 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -25,14 +25,8 @@
 #include "qemu/main-loop.h"
 #include "hw/core/cpu.h"
 
-const CpusAccel qtest_cpus = {
-    .create_vcpu_thread = dummy_start_vcpu_thread,
-    .get_virtual_clock = qtest_get_virtual_clock,
-};
-
 static int qtest_init_accel(MachineState *ms)
 {
-    cpus_register_accel(&qtest_cpus);
     return 0;
 }
 
@@ -52,9 +46,26 @@ static const TypeInfo qtest_accel_type = {
     .class_init = qtest_accel_class_init,
 };
 
+static void qtest_cpus_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
+
+    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->get_virtual_clock = qtest_get_virtual_clock;
+};
+
+static const TypeInfo qtest_cpus_type_info = {
+    .name = ACCEL_OPS_NAME("qtest"),
+
+    .parent = TYPE_ACCEL_OPS,
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
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 7125d0cc29..f0d97b4b21 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -33,10 +33,6 @@
 #include "qemu/accel.h"
 #include "qapi/qapi-builtin-visit.h"
 
-#ifndef CONFIG_USER_ONLY
-#include "tcg-cpus.h"
-#endif /* CONFIG_USER_ONLY */
-
 struct TCGState {
     AccelState parent_obj;
 
@@ -116,14 +112,6 @@ static int tcg_init(MachineState *ms)
      */
 #ifndef CONFIG_USER_ONLY
     tcg_region_init();
-
-    if (mttcg_enabled) {
-        cpus_register_accel(&tcg_cpus_mttcg);
-    } else if (icount_enabled()) {
-        cpus_register_accel(&tcg_cpus_icount);
-    } else {
-        cpus_register_accel(&tcg_cpus_rr);
-    }
 #endif /* !CONFIG_USER_ONLY */
 
     return 0;
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
index e335f9f155..38a58ab271 100644
--- a/accel/tcg/tcg-cpus.c
+++ b/accel/tcg/tcg-cpus.c
@@ -35,6 +35,9 @@
 #include "hw/boards.h"
 
 #include "tcg-cpus.h"
+#include "tcg-cpus-mttcg.h"
+#include "tcg-cpus-rr.h"
+#include "tcg-cpus-icount.h"
 
 /* common functionality among all TCG variants */
 
@@ -80,3 +83,43 @@ void tcg_cpus_handle_interrupt(CPUState *cpu, int mask)
         qatomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
     }
 }
+
+static void tcg_cpus_ops_init(AccelOpsClass *ops)
+{
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
+    }
+}
+
+static void tcg_cpus_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
+
+    ops->ops_init = tcg_cpus_ops_init;
+};
+static const TypeInfo tcg_cpus_type_info = {
+    .name = ACCEL_OPS_NAME("tcg"),
+
+    .parent = TYPE_ACCEL_OPS,
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
index 594aaf6b49..cd5aa2b96e 100644
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
@@ -185,9 +181,6 @@ static int xen_init(MachineState *ms)
      * opt out of system RAM being allocated by generic code
      */
     mc->default_ram_id = NULL;
-
-    cpus_register_accel(&xen_cpus);
-
     return 0;
 }
 
@@ -222,9 +215,24 @@ static const TypeInfo xen_accel_type = {
     .class_init = xen_accel_class_init,
 };
 
+static void xen_cpus_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
+
+    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+};
+static const TypeInfo xen_cpus_type_info = {
+    .name = ACCEL_OPS_NAME("xen"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = xen_cpus_class_init,
+    .abstract = true,
+};
+
 static void xen_type_init(void)
 {
     type_register_static(&xen_accel_type);
+    type_register_static(&xen_cpus_type_info);
 }
 
 type_init(xen_type_init);
diff --git a/bsd-user/main.c b/bsd-user/main.c
index ff295bcb29..a68ce5f446 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -908,13 +908,14 @@ int main(int argc, char **argv)
 #endif
     }
 
+    cpu_type = parse_cpu_option(cpu_model);
     /* init tcg before creating CPUs and to get qemu_host_page_size */
     {
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
         ac->init_machine(NULL);
+        accel_init_interfaces(ac);
     }
-    cpu_type = parse_cpu_option(cpu_model);
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
 #if defined(TARGET_SPARC) || defined(TARGET_PPC)
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index fac4a18703..b9d6d69eb8 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -69,6 +69,8 @@ typedef struct AccelClass {
 AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
 
+void accel_init_interfaces(AccelClass *ac);
+
 #ifndef CONFIG_USER_ONLY
 int accel_init_machine(AccelState *accel, MachineState *ms);
 
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
new file mode 100644
index 0000000000..6102d2f80d
--- /dev/null
+++ b/include/sysemu/accel-ops.h
@@ -0,0 +1,45 @@
+/*
+ * Accelerator OPS, used for cpus.c module
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef ACCEL_OPS_H
+#define ACCEL_OPS_H
+
+#include "qom/object.h"
+
+#define ACCEL_OPS_SUFFIX "-ops"
+#define TYPE_ACCEL_OPS "accel" ACCEL_OPS_SUFFIX
+#define ACCEL_OPS_NAME(name) (name "-" TYPE_ACCEL_OPS)
+
+typedef struct AccelOpsClass AccelOpsClass;
+DECLARE_CLASS_CHECKERS(AccelOpsClass, ACCEL_OPS, TYPE_ACCEL_OPS)
+
+/* cpus.c operations interface */
+struct AccelOpsClass {
+    /*< private >*/
+    ObjectClass parent_class;
+    /*< public >*/
+
+    /* initialization function called when accel is chosen */
+    void (*ops_init)(AccelOpsClass *ops);
+
+    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
+    void (*kick_vcpu_thread)(CPUState *cpu);
+
+    void (*synchronize_post_reset)(CPUState *cpu);
+    void (*synchronize_post_init)(CPUState *cpu);
+    void (*synchronize_state)(CPUState *cpu);
+    void (*synchronize_pre_loadvm)(CPUState *cpu);
+
+    void (*handle_interrupt)(CPUState *cpu, int mask);
+
+    int64_t (*get_virtual_clock)(void);
+    int64_t (*get_elapsed_ticks)(void);
+};
+
+#endif /* ACCEL_OPS_H */
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index e8156728c6..2cd74392e0 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -2,30 +2,14 @@
 #define QEMU_CPUS_H
 
 #include "qemu/timer.h"
+#include "sysemu/accel-ops.h"
 
-/* cpus.c */
+/* register accel-specific operations */
+void cpus_register_accel(const AccelOpsClass *i);
 
-/* CPU execution threads */
+/* accel/dummy-cpus.c */
 
-typedef struct CpusAccel {
-    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY */
-    void (*kick_vcpu_thread)(CPUState *cpu);
-
-    void (*synchronize_post_reset)(CPUState *cpu);
-    void (*synchronize_post_init)(CPUState *cpu);
-    void (*synchronize_state)(CPUState *cpu);
-    void (*synchronize_pre_loadvm)(CPUState *cpu);
-
-    void (*handle_interrupt)(CPUState *cpu, int mask);
-
-    int64_t (*get_virtual_clock)(void);
-    int64_t (*get_elapsed_ticks)(void);
-} CpusAccel;
-
-/* register accel-specific cpus interface implementation */
-void cpus_register_accel(const CpusAccel *i);
-
-/* Create a dummy vcpu for CpusAccel->create_vcpu_thread */
+/* Create a dummy vcpu for AccelOpsClass->create_vcpu_thread */
 void dummy_start_vcpu_thread(CPUState *);
 
 /* interface available for cpus accelerator threads */
diff --git a/linux-user/main.c b/linux-user/main.c
index 5c059a8445..e28d016c6f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -708,6 +708,7 @@ int main(int argc, char **argv, char **envp)
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
         ac->init_machine(NULL);
+        accel_init_interfaces(ac);
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index e46ac68ad0..659617e7ef 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -127,7 +127,7 @@ void hw_error(const char *fmt, ...)
 /*
  * The chosen accelerator is supposed to register this.
  */
-static const CpusAccel *cpus_accel;
+static const AccelOpsClass *cpus_accel;
 
 void cpu_synchronize_all_states(void)
 {
@@ -593,11 +593,11 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_lock_iothread();
 }
 
-void cpus_register_accel(const CpusAccel *ca)
+void cpus_register_accel(const AccelOpsClass *ops)
 {
-    assert(ca != NULL);
-    assert(ca->create_vcpu_thread != NULL); /* mandatory */
-    cpus_accel = ca;
+    assert(ops != NULL);
+    assert(ops->create_vcpu_thread != NULL); /* mandatory */
+    cpus_accel = ops;
 }
 
 void qemu_init_vcpu(CPUState *cpu)
@@ -617,7 +617,7 @@ void qemu_init_vcpu(CPUState *cpu)
         cpu_address_space_init(cpu, 0, "cpu-memory", cpu->memory);
     }
 
-    /* accelerators all implement the CpusAccel interface */
+    /* accelerators all implement the AccelOpsClass */
     g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
     cpus_accel->create_vcpu_thread(cpu);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index bc20c526d2..b97708300e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2558,7 +2558,7 @@ static bool object_create_initial(const char *type, QemuOpts *opts)
     }
 
     /* Memory allocation by backends needs to be done
-     * after configure_accelerator() (due to the tcg_enabled()
+     * after do_configure_accelerator() (due to the tcg_enabled()
      * checks at memory_region_init_*()).
      *
      * Also, allocation of large amounts of memory may delay
@@ -4186,7 +4186,7 @@ void qemu_init(int argc, char **argv, char **envp)
      *
      * Machine compat properties: object_set_machine_compat_props().
      * Accelerator compat props: object_set_accelerator_compat_props(),
-     * called from configure_accelerator().
+     * called from do_configure_accelerator().
      */
 
     if (!qtest_enabled() && machine_class->deprecation_reason) {
@@ -4321,6 +4321,8 @@ void qemu_init(int argc, char **argv, char **envp)
     if (cpu_option) {
         current_machine->cpu_type = parse_cpu_option(cpu_option);
     }
+    /* NB: for machine none cpu_type could STILL be NULL here! */
+    accel_init_interfaces(ACCEL_GET_CLASS(current_machine->accelerator));
 
     if (current_machine->ram_memdev_id) {
         Object *backend;
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index d7f4bb44a7..ec3c426223 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -364,9 +364,6 @@ static int hax_accel_init(MachineState *ms)
                 !ret ? "working" : "not working",
                 !ret ? "fast virt" : "emulation");
     }
-    if (ret == 0) {
-        cpus_register_accel(&hax_cpus);
-    }
     return ret;
 }
 
diff --git a/target/i386/hax/hax-cpus.c b/target/i386/hax/hax-cpus.c
index f72c85bd49..2f8424388d 100644
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
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
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
+    .name = ACCEL_OPS_NAME("hax"),
+
+    .parent = TYPE_ACCEL_OPS,
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
index 817b3d7452..dd022a84c4 100644
--- a/target/i386/hvf/hvf-cpus.c
+++ b/target/i386/hvf/hvf-cpus.c
@@ -121,11 +121,26 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
-const CpusAccel hvf_cpus = {
-    .create_vcpu_thread = hvf_start_vcpu_thread,
+static void hvf_cpus_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
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
+    .name = ACCEL_OPS_NAME("hvf"),
+
+    .parent = TYPE_ACCEL_OPS,
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
index ffc9efa40f..bd94bb5243 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -887,7 +887,6 @@ static int hvf_accel_init(MachineState *ms)
   
     hvf_state = s;
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
-    cpus_register_accel(&hvf_cpus);
     return 0;
 }
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index ee6b606194..90adae9af7 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1642,8 +1642,6 @@ static int whpx_accel_init(MachineState *ms)
 
     whpx_memory_init();
 
-    cpus_register_accel(&whpx_cpus);
-
     printf("Windows Hypervisor Platform accelerator is operational\n");
     return 0;
 
diff --git a/target/i386/whpx/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c
index d9bd5a2d36..8e82974de7 100644
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
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
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
+    .name = ACCEL_OPS_NAME("whpx"),
+
+    .parent = TYPE_ACCEL_OPS,
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


