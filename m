Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C926216E2C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 15:59:22 +0200 (CEST)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jso81-00051B-Cb
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 09:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jso70-0003iU-0P
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 09:58:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jso6x-0007Fr-RR
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 09:58:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 157B4AEE7;
 Tue,  7 Jul 2020 13:58:15 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC v2 3/6] cpus: extract out kvm-specific code to accel/kvm
Date: Tue,  7 Jul 2020 15:58:05 +0200
Message-Id: <20200707135808.9241-4-cfontana@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200707135808.9241-1-cfontana@suse.de>
References: <20200707135808.9241-1-cfontana@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 23:42:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Richard Henderson <rth@twiddle.net>,
 Claudio Fontana <cfontana@suse.de>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

register a "CpusAccel" interface for KVM as well.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/kvm/Makefile.objs |  2 ++
 accel/kvm/kvm-all.c     | 14 +++++++-
 accel/kvm/kvm-cpus.c    | 94 +++++++++++++++++++++++++++++++++++++++++++++++++
 accel/kvm/kvm-cpus.h    | 17 +++++++++
 accel/stubs/kvm-stub.c  |  3 +-
 include/sysemu/kvm.h    |  2 +-
 softmmu/cpus.c          | 77 ----------------------------------------
 7 files changed, 128 insertions(+), 81 deletions(-)
 create mode 100644 accel/kvm/kvm-cpus.c
 create mode 100644 accel/kvm/kvm-cpus.h

diff --git a/accel/kvm/Makefile.objs b/accel/kvm/Makefile.objs
index fdfa481578..ce0f492b8d 100644
--- a/accel/kvm/Makefile.objs
+++ b/accel/kvm/Makefile.objs
@@ -1,2 +1,4 @@
 obj-y += kvm-all.o
+obj-y += kvm-cpus.o
+
 obj-$(call lnot,$(CONFIG_SEV)) += sev-stub.o
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index d54a8701d8..0932f7cb94 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -45,6 +45,9 @@
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
 #include "sysemu/reset.h"
+#include "qemu/guest-random.h"
+#include "sysemu/hw_accel.h"
+#include "kvm-cpus.h"
 
 #include "hw/boards.h"
 
@@ -379,7 +382,7 @@ err:
     return ret;
 }
 
-int kvm_destroy_vcpu(CPUState *cpu)
+static int do_kvm_destroy_vcpu(CPUState *cpu)
 {
     KVMState *s = kvm_state;
     long mmap_size;
@@ -413,6 +416,14 @@ err:
     return ret;
 }
 
+void kvm_destroy_vcpu(CPUState *cpu)
+{
+    if (do_kvm_destroy_vcpu(cpu) < 0) {
+        error_report("kvm_destroy_vcpu failed");
+        exit(EXIT_FAILURE);
+    }
+}
+
 static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
 {
     struct KVMParkedVcpu *cpu;
@@ -2232,6 +2243,7 @@ static int kvm_init(MachineState *ms)
         qemu_balloon_inhibit(true);
     }
 
+    cpus_register_accel(&kvm_cpus);
     return 0;
 
 err:
diff --git a/accel/kvm/kvm-cpus.c b/accel/kvm/kvm-cpus.c
new file mode 100644
index 0000000000..ac6945a9e6
--- /dev/null
+++ b/accel/kvm/kvm-cpus.c
@@ -0,0 +1,94 @@
+/*
+ * QEMU KVM support
+ *
+ * Copyright IBM, Corp. 2008
+ *           Red Hat, Inc. 2008
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *  Glauber Costa     <gcosta@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "sysemu/kvm_int.h"
+#include "sysemu/runstate.h"
+#include "sysemu/cpus.h"
+#include "qemu/guest-random.h"
+
+#include "kvm-cpus.h"
+
+static void kvm_kick_vcpu_thread(CPUState *cpu)
+{
+    cpus_kick_thread(cpu);
+}
+
+static void *kvm_vcpu_thread_fn(void *arg)
+{
+    CPUState *cpu = arg;
+    int r;
+
+    rcu_register_thread();
+
+    qemu_mutex_lock_iothread();
+    qemu_thread_get_self(cpu->thread);
+    cpu->thread_id = qemu_get_thread_id();
+    cpu->can_do_io = 1;
+    current_cpu = cpu;
+
+    r = kvm_init_vcpu(cpu);
+    if (r < 0) {
+        error_report("kvm_init_vcpu failed: %s", strerror(-r));
+        exit(1);
+    }
+
+    kvm_init_cpu_signals(cpu);
+
+    /* signal CPU creation */
+    cpu_thread_signal_created(cpu);
+    qemu_guest_random_seed_thread_part2(cpu->random_seed);
+
+    do {
+        if (cpu_can_run(cpu)) {
+            r = kvm_cpu_exec(cpu);
+            if (r == EXCP_DEBUG) {
+                cpu_handle_guest_debug(cpu);
+            }
+        }
+        qemu_wait_io_event(cpu);
+    } while (!cpu->unplug || cpu_can_run(cpu));
+
+    kvm_destroy_vcpu(cpu);
+    cpu_thread_signal_destroyed(cpu);
+    qemu_mutex_unlock_iothread();
+    rcu_unregister_thread();
+    return NULL;
+}
+
+static void kvm_start_vcpu_thread(CPUState *cpu)
+{
+    char thread_name[VCPU_THREAD_NAME_SIZE];
+
+    cpu->thread = g_malloc0(sizeof(QemuThread));
+    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    qemu_cond_init(cpu->halt_cond);
+    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/KVM",
+             cpu->cpu_index);
+    qemu_thread_create(cpu->thread, thread_name, kvm_vcpu_thread_fn,
+                       cpu, QEMU_THREAD_JOINABLE);
+}
+
+CpusAccel kvm_cpus = {
+    .create_vcpu_thread = kvm_start_vcpu_thread,
+    .kick_vcpu_thread = kvm_kick_vcpu_thread,
+
+    .synchronize_post_reset = kvm_cpu_synchronize_post_reset,
+    .synchronize_post_init = kvm_cpu_synchronize_post_init,
+    .synchronize_state = kvm_cpu_synchronize_state,
+    .synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm,
+};
diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
new file mode 100644
index 0000000000..62fbc911d9
--- /dev/null
+++ b/accel/kvm/kvm-cpus.h
@@ -0,0 +1,17 @@
+/*
+ * Accelerator CPUS Interface
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef KVM_CPUS_H
+#define KVM_CPUS_H
+
+#include "sysemu/cpus.h"
+
+extern CpusAccel kvm_cpus;
+
+#endif /* KVM_CPUS_H */
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 82f118d2df..69f8a842da 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -32,9 +32,8 @@ bool kvm_readonly_mem_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
 
-int kvm_destroy_vcpu(CPUState *cpu)
+void kvm_destroy_vcpu(CPUState *cpu)
 {
-    return -ENOSYS;
 }
 
 int kvm_init_vcpu(CPUState *cpu)
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index b4174d941c..7a5f973b6f 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -218,7 +218,7 @@ int kvm_has_intx_set_mask(void);
 
 int kvm_init_vcpu(CPUState *cpu);
 int kvm_cpu_exec(CPUState *cpu);
-int kvm_destroy_vcpu(CPUState *cpu);
+void kvm_destroy_vcpu(CPUState *cpu);
 
 /**
  * kvm_arm_supports_user_irq
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index bb1e534601..9a55bd2c4e 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -192,9 +192,6 @@ void cpu_synchronize_state(CPUState *cpu)
         /* accelerator already implements the CpusAccel interface */
         cpus_accel->synchronize_state(cpu);
     }
-    if (kvm_enabled()) {
-        kvm_cpu_synchronize_state(cpu);
-    }
     if (hax_enabled()) {
         hax_cpu_synchronize_state(cpu);
     }
@@ -209,9 +206,6 @@ void cpu_synchronize_post_reset(CPUState *cpu)
         /* accelerator already implements the CpusAccel interface */
         cpus_accel->synchronize_post_reset(cpu);
     }
-    if (kvm_enabled()) {
-        kvm_cpu_synchronize_post_reset(cpu);
-    }
     if (hax_enabled()) {
         hax_cpu_synchronize_post_reset(cpu);
     }
@@ -226,9 +220,6 @@ void cpu_synchronize_post_init(CPUState *cpu)
         /* accelerator already implements the CpusAccel interface */
         cpus_accel->synchronize_post_init(cpu);
     }
-    if (kvm_enabled()) {
-        kvm_cpu_synchronize_post_init(cpu);
-    }
     if (hax_enabled()) {
         hax_cpu_synchronize_post_init(cpu);
     }
@@ -243,9 +234,6 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu)
         /* accelerator already implements the CpusAccel interface */
         cpus_accel->synchronize_pre_loadvm(cpu);
     }
-    if (kvm_enabled()) {
-        kvm_cpu_synchronize_pre_loadvm(cpu);
-    }
     if (hax_enabled()) {
         hax_cpu_synchronize_pre_loadvm(cpu);
     }
@@ -376,14 +364,6 @@ void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
     do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
 }
 
-static void qemu_kvm_destroy_vcpu(CPUState *cpu)
-{
-    if (kvm_destroy_vcpu(cpu) < 0) {
-        error_report("kvm_destroy_vcpu failed");
-        exit(EXIT_FAILURE);
-    }
-}
-
 static void qemu_cpu_stop(CPUState *cpu, bool exit)
 {
     g_assert(qemu_cpu_is_self(cpu));
@@ -429,48 +409,6 @@ void qemu_wait_io_event(CPUState *cpu)
     qemu_wait_io_event_common(cpu);
 }
 
-static void *qemu_kvm_cpu_thread_fn(void *arg)
-{
-    CPUState *cpu = arg;
-    int r;
-
-    rcu_register_thread();
-
-    qemu_mutex_lock_iothread();
-    qemu_thread_get_self(cpu->thread);
-    cpu->thread_id = qemu_get_thread_id();
-    cpu->can_do_io = 1;
-    current_cpu = cpu;
-
-    r = kvm_init_vcpu(cpu);
-    if (r < 0) {
-        error_report("kvm_init_vcpu failed: %s", strerror(-r));
-        exit(1);
-    }
-
-    kvm_init_cpu_signals(cpu);
-
-    /* signal CPU creation */
-    cpu_thread_signal_created(cpu);
-    qemu_guest_random_seed_thread_part2(cpu->random_seed);
-
-    do {
-        if (cpu_can_run(cpu)) {
-            r = kvm_cpu_exec(cpu);
-            if (r == EXCP_DEBUG) {
-                cpu_handle_guest_debug(cpu);
-            }
-        }
-        qemu_wait_io_event(cpu);
-    } while (!cpu->unplug || cpu_can_run(cpu));
-
-    qemu_kvm_destroy_vcpu(cpu);
-    cpu_thread_signal_destroyed(cpu);
-    qemu_mutex_unlock_iothread();
-    rcu_unregister_thread();
-    return NULL;
-}
-
 static void *qemu_hax_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
@@ -795,19 +733,6 @@ static void qemu_hax_start_vcpu(CPUState *cpu)
 #endif
 }
 
-static void qemu_kvm_start_vcpu(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-    qemu_cond_init(cpu->halt_cond);
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/KVM",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, qemu_kvm_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-}
-
 static void qemu_hvf_start_vcpu(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
@@ -868,8 +793,6 @@ void qemu_init_vcpu(CPUState *cpu)
     if (cpus_accel) {
         /* accelerator already implements the CpusAccel interface */
         cpus_accel->create_vcpu_thread(cpu);
-    } else if (kvm_enabled()) {
-        qemu_kvm_start_vcpu(cpu);
     } else if (hax_enabled()) {
         qemu_hax_start_vcpu(cpu);
     } else if (hvf_enabled()) {
-- 
2.16.4


