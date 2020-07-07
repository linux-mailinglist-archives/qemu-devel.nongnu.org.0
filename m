Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346DA216E2E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 16:00:50 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jso9R-0007Ua-6E
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 10:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jso6z-0003iI-FH
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 09:58:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jso6x-0007Fg-Al
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 09:58:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86BCEAE2C;
 Tue,  7 Jul 2020 13:58:14 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC v2 2/6] cpus: extract out qtest-specific code to accel/qtest
Date: Tue,  7 Jul 2020 15:58:04 +0200
Message-Id: <20200707135808.9241-3-cfontana@suse.de>
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

register a "CpusAccel" interface for qtest as well.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 MAINTAINERS               |   2 +-
 accel/Makefile.objs       |   2 +-
 accel/qtest/Makefile.objs |   2 +
 accel/qtest/qtest-cpus.c  | 104 ++++++++++++++++++++++++++++++++++++++++++++++
 accel/qtest/qtest-cpus.h  |  17 ++++++++
 accel/{ => qtest}/qtest.c |   7 ++++
 softmmu/cpus.c            |  61 +--------------------------
 7 files changed, 133 insertions(+), 62 deletions(-)
 create mode 100644 accel/qtest/Makefile.objs
 create mode 100644 accel/qtest/qtest-cpus.c
 create mode 100644 accel/qtest/qtest-cpus.h
 rename accel/{ => qtest}/qtest.c (86%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d3e5dedbc..100b7489ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2380,7 +2380,7 @@ M: Laurent Vivier <lvivier@redhat.com>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: softmmu/qtest.c
-F: accel/qtest.c
+F: accel/qtest/
 F: tests/qtest/
 X: tests/qtest/bios-tables-test-allowed-diff.h
 
diff --git a/accel/Makefile.objs b/accel/Makefile.objs
index ff72f0d030..c5e58eb53d 100644
--- a/accel/Makefile.objs
+++ b/accel/Makefile.objs
@@ -1,5 +1,5 @@
 common-obj-$(CONFIG_SOFTMMU) += accel.o
-obj-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_POSIX)) += qtest.o
+obj-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_POSIX)) += qtest/
 obj-$(CONFIG_KVM) += kvm/
 obj-$(CONFIG_TCG) += tcg/
 obj-$(CONFIG_XEN) += xen/
diff --git a/accel/qtest/Makefile.objs b/accel/qtest/Makefile.objs
new file mode 100644
index 0000000000..627014200e
--- /dev/null
+++ b/accel/qtest/Makefile.objs
@@ -0,0 +1,2 @@
+obj-y += qtest.o
+obj-y += qtest-cpus.o
diff --git a/accel/qtest/qtest-cpus.c b/accel/qtest/qtest-cpus.c
new file mode 100644
index 0000000000..525bb22f16
--- /dev/null
+++ b/accel/qtest/qtest-cpus.c
@@ -0,0 +1,104 @@
+/*
+ * QTest accelerator code
+ *
+ * Copyright IBM, Corp. 2011
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/rcu.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "qemu/option.h"
+#include "qemu/config-file.h"
+#include "sysemu/accel.h"
+#include "sysemu/qtest.h"
+#include "sysemu/cpus.h"
+#include "sysemu/cpu-timers.h"
+#include "qemu/guest-random.h"
+#include "qemu/main-loop.h"
+#include "hw/core/cpu.h"
+
+#include "qtest-cpus.h"
+static void qtest_cpu_synchronize_noop(CPUState *cpu)
+{
+}
+
+static void qtest_kick_vcpu_thread(CPUState *cpu)
+{
+    cpus_kick_thread(cpu);
+}
+
+static void *qtest_cpu_thread_fn(void *arg)
+{
+#ifdef _WIN32
+    error_report("qtest is not supported under Windows");
+    exit(1);
+#else
+    CPUState *cpu = arg;
+    sigset_t waitset;
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
+    sigemptyset(&waitset);
+    sigaddset(&waitset, SIG_IPI);
+
+    /* signal CPU creation */
+    cpu_thread_signal_created(cpu);
+    qemu_guest_random_seed_thread_part2(cpu->random_seed);
+
+    do {
+        qemu_mutex_unlock_iothread();
+        do {
+            int sig;
+            r = sigwait(&waitset, &sig);
+        } while (r == -1 && (errno == EAGAIN || errno == EINTR));
+        if (r == -1) {
+            perror("sigwait");
+            exit(1);
+        }
+        qemu_mutex_lock_iothread();
+        qemu_wait_io_event(cpu);
+    } while (!cpu->unplug);
+
+    qemu_mutex_unlock_iothread();
+    rcu_unregister_thread();
+    return NULL;
+#endif
+}
+
+static void qtest_start_vcpu_thread(CPUState *cpu)
+{
+    char thread_name[VCPU_THREAD_NAME_SIZE];
+
+    cpu->thread = g_malloc0(sizeof(QemuThread));
+    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    qemu_cond_init(cpu->halt_cond);
+    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/DUMMY",
+             cpu->cpu_index);
+    qemu_thread_create(cpu->thread, thread_name, qtest_cpu_thread_fn, cpu,
+                       QEMU_THREAD_JOINABLE);
+}
+
+CpusAccel qtest_cpus = {
+    .create_vcpu_thread = qtest_start_vcpu_thread,
+    .kick_vcpu_thread = qtest_kick_vcpu_thread,
+
+    .synchronize_post_reset = qtest_cpu_synchronize_noop,
+    .synchronize_post_init = qtest_cpu_synchronize_noop,
+    .synchronize_state = qtest_cpu_synchronize_noop,
+    .synchronize_pre_loadvm = qtest_cpu_synchronize_noop,
+};
diff --git a/accel/qtest/qtest-cpus.h b/accel/qtest/qtest-cpus.h
new file mode 100644
index 0000000000..c1fab96b9e
--- /dev/null
+++ b/accel/qtest/qtest-cpus.h
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
+#ifndef QTEST_CPUS_H
+#define QTEST_CPUS_H
+
+#include "sysemu/cpus.h"
+
+extern CpusAccel qtest_cpus;
+
+#endif /* QTEST_CPUS_H */
diff --git a/accel/qtest.c b/accel/qtest/qtest.c
similarity index 86%
rename from accel/qtest.c
rename to accel/qtest/qtest.c
index 119d0f16a4..537e8b449c 100644
--- a/accel/qtest.c
+++ b/accel/qtest/qtest.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/rcu.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -20,9 +21,15 @@
 #include "sysemu/qtest.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
+#include "qemu/guest-random.h"
+#include "qemu/main-loop.h"
+#include "hw/core/cpu.h"
+
+#include "qtest-cpus.h"
 
 static int qtest_init_accel(MachineState *ms)
 {
+    cpus_register_accel(&qtest_cpus);
     return 0;
 }
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 5fadc8f34c..bb1e534601 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -40,7 +40,6 @@
 #include "qemu/thread.h"
 #include "qemu/plugin.h"
 #include "sysemu/cpus.h"
-#include "sysemu/qtest.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
 #include "qemu/bitmap.h"
@@ -472,51 +471,6 @@ static void *qemu_kvm_cpu_thread_fn(void *arg)
     return NULL;
 }
 
-static void *qemu_dummy_cpu_thread_fn(void *arg)
-{
-#ifdef _WIN32
-    error_report("qtest is not supported under Windows");
-    exit(1);
-#else
-    CPUState *cpu = arg;
-    sigset_t waitset;
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
-    sigemptyset(&waitset);
-    sigaddset(&waitset, SIG_IPI);
-
-    /* signal CPU creation */
-    cpu_thread_signal_created(cpu);
-    qemu_guest_random_seed_thread_part2(cpu->random_seed);
-
-    do {
-        qemu_mutex_unlock_iothread();
-        do {
-            int sig;
-            r = sigwait(&waitset, &sig);
-        } while (r == -1 && (errno == EAGAIN || errno == EINTR));
-        if (r == -1) {
-            perror("sigwait");
-            exit(1);
-        }
-        qemu_mutex_lock_iothread();
-        qemu_wait_io_event(cpu);
-    } while (!cpu->unplug);
-
-    qemu_mutex_unlock_iothread();
-    rcu_unregister_thread();
-    return NULL;
-#endif
-}
-
 static void *qemu_hax_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
@@ -894,19 +848,6 @@ void cpus_register_accel(CpusAccel *ca)
     cpus_accel = ca;
 }
 
-static void qemu_dummy_start_vcpu(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-    qemu_cond_init(cpu->halt_cond);
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/DUMMY",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, qemu_dummy_cpu_thread_fn, cpu,
-                       QEMU_THREAD_JOINABLE);
-}
-
 void qemu_init_vcpu(CPUState *cpu)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -936,7 +877,7 @@ void qemu_init_vcpu(CPUState *cpu)
     } else if (whpx_enabled()) {
         qemu_whpx_start_vcpu(cpu);
     } else {
-        qemu_dummy_start_vcpu(cpu);
+        assert(0);
     }
 
     while (!cpu->created) {
-- 
2.16.4


