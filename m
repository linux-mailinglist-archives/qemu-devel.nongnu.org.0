Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DCE242E96
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 20:36:18 +0200 (CEST)
Received: from localhost ([::1]:50988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5vbl-00056c-4M
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 14:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k5vYf-0000KV-Bj
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 14:33:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:40684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k5vYY-0002DR-7P
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 14:33:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 932EEAF0C;
 Wed, 12 Aug 2020 18:33:18 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH v5 06/14] cpus: extract out hax-specific code to target/i386/
Date: Wed, 12 Aug 2020 20:32:42 +0200
Message-Id: <20200812183250.9221-7-cfontana@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200812183250.9221-1-cfontana@suse.de>
References: <20200812183250.9221-1-cfontana@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 23:47:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

register a "CpusAccel" interface for HAX as well.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 softmmu/cpus.c            | 80 +-------------------------------------------
 target/i386/Makefile.objs |  5 +--
 target/i386/hax-all.c     |  6 +++-
 target/i386/hax-cpus.c    | 85 +++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/hax-cpus.h    | 17 ++++++++++
 target/i386/hax-i386.h    |  2 ++
 target/i386/hax-posix.c   | 12 +++++++
 target/i386/hax-windows.c | 20 +++++++++++
 8 files changed, 145 insertions(+), 82 deletions(-)
 create mode 100644 target/i386/hax-cpus.c
 create mode 100644 target/i386/hax-cpus.h

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index bd535c68e0..c314e22bd2 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -33,7 +33,6 @@
 #include "exec/gdbstub.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
-#include "sysemu/hax.h"
 #include "sysemu/hvf.h"
 #include "sysemu/whpx.h"
 #include "exec/exec-all.h"
@@ -179,9 +178,6 @@ void cpu_synchronize_state(CPUState *cpu)
     if (cpus_accel && cpus_accel->synchronize_state) {
         cpus_accel->synchronize_state(cpu);
     }
-    if (hax_enabled()) {
-        hax_cpu_synchronize_state(cpu);
-    }
     if (whpx_enabled()) {
         whpx_cpu_synchronize_state(cpu);
     }
@@ -192,9 +188,6 @@ void cpu_synchronize_post_reset(CPUState *cpu)
     if (cpus_accel && cpus_accel->synchronize_post_reset) {
         cpus_accel->synchronize_post_reset(cpu);
     }
-    if (hax_enabled()) {
-        hax_cpu_synchronize_post_reset(cpu);
-    }
     if (whpx_enabled()) {
         whpx_cpu_synchronize_post_reset(cpu);
     }
@@ -205,9 +198,6 @@ void cpu_synchronize_post_init(CPUState *cpu)
     if (cpus_accel && cpus_accel->synchronize_post_init) {
         cpus_accel->synchronize_post_init(cpu);
     }
-    if (hax_enabled()) {
-        hax_cpu_synchronize_post_init(cpu);
-    }
     if (whpx_enabled()) {
         whpx_cpu_synchronize_post_init(cpu);
     }
@@ -218,9 +208,6 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu)
     if (cpus_accel && cpus_accel->synchronize_pre_loadvm) {
         cpus_accel->synchronize_pre_loadvm(cpu);
     }
-    if (hax_enabled()) {
-        hax_cpu_synchronize_pre_loadvm(cpu);
-    }
     if (hvf_enabled()) {
         hvf_cpu_synchronize_pre_loadvm(cpu);
     }
@@ -416,35 +403,6 @@ void qemu_wait_io_event(CPUState *cpu)
     qemu_wait_io_event_common(cpu);
 }
 
-static void *qemu_hax_cpu_thread_fn(void *arg)
-{
-    CPUState *cpu = arg;
-    int r;
-
-    rcu_register_thread();
-    qemu_mutex_lock_iothread();
-    qemu_thread_get_self(cpu->thread);
-
-    cpu->thread_id = qemu_get_thread_id();
-    current_cpu = cpu;
-    hax_init_vcpu(cpu);
-    cpu_thread_signal_created(cpu);
-    qemu_guest_random_seed_thread_part2(cpu->random_seed);
-
-    do {
-        if (cpu_can_run(cpu)) {
-            r = hax_smp_cpu_exec(cpu);
-            if (r == EXCP_DEBUG) {
-                cpu_handle_guest_debug(cpu);
-            }
-        }
-
-        qemu_wait_io_event(cpu);
-    } while (!cpu->unplug || cpu_can_run(cpu));
-    rcu_unregister_thread();
-    return NULL;
-}
-
 /* The HVF-specific vCPU thread function. This one should only run when the host
  * CPU supports the VMX "unrestricted guest" feature. */
 static void *qemu_hvf_cpu_thread_fn(void *arg)
@@ -529,12 +487,6 @@ static void *qemu_whpx_cpu_thread_fn(void *arg)
     return NULL;
 }
 
-#ifdef _WIN32
-static void CALLBACK dummy_apc_func(ULONG_PTR unused)
-{
-}
-#endif
-
 void cpus_kick_thread(CPUState *cpu)
 {
 #ifndef _WIN32
@@ -553,10 +505,6 @@ void cpus_kick_thread(CPUState *cpu)
     if (!qemu_cpu_is_self(cpu)) {
         if (whpx_enabled()) {
             whpx_vcpu_kick(cpu);
-        } else if (!QueueUserAPC(dummy_apc_func, cpu->hThread, 0)) {
-            fprintf(stderr, "%s: QueueUserAPC failed with error %lu\n",
-                    __func__, GetLastError());
-            exit(1);
         }
     }
 #endif
@@ -567,14 +515,7 @@ void qemu_cpu_kick(CPUState *cpu)
     qemu_cond_broadcast(cpu->halt_cond);
     if (cpus_accel && cpus_accel->kick_vcpu_thread) {
         cpus_accel->kick_vcpu_thread(cpu);
-    } else {
-        if (hax_enabled()) {
-            /*
-             * FIXME: race condition with the exit_request check in
-             * hax_vcpu_hax_exec
-             */
-            cpu->exit_request = 1;
-        }
+    } else { /* default */
         cpus_kick_thread(cpu);
     }
 }
@@ -722,23 +663,6 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_lock_iothread();
 }
 
-static void qemu_hax_start_vcpu(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-    qemu_cond_init(cpu->halt_cond);
-
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HAX",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, qemu_hax_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-#ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
-}
-
 static void qemu_hvf_start_vcpu(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
@@ -800,8 +724,6 @@ void qemu_init_vcpu(CPUState *cpu)
     if (cpus_accel) {
         /* accelerator already implements the CpusAccel interface */
         cpus_accel->create_vcpu_thread(cpu);
-    } else if (hax_enabled()) {
-        qemu_hax_start_vcpu(cpu);
     } else if (hvf_enabled()) {
         qemu_hvf_start_vcpu(cpu);
     } else if (whpx_enabled()) {
diff --git a/target/i386/Makefile.objs b/target/i386/Makefile.objs
index 0b93143e27..ee5a8fd4b4 100644
--- a/target/i386/Makefile.objs
+++ b/target/i386/Makefile.objs
@@ -10,11 +10,12 @@ obj-y += machine.o arch_memory_mapping.o arch_dump.o monitor.o
 obj-$(CONFIG_KVM) += kvm.o
 obj-$(CONFIG_HYPERV) += hyperv.o
 obj-$(call lnot,$(CONFIG_HYPERV)) += hyperv-stub.o
+obj-$(CONFIG_HAX) += hax-all.o hax-mem.o hax-cpus.o
 ifeq ($(CONFIG_WIN32),y)
-obj-$(CONFIG_HAX) += hax-all.o hax-mem.o hax-windows.o
+obj-$(CONFIG_HAX) += hax-windows.o
 endif
 ifeq ($(CONFIG_POSIX),y)
-obj-$(CONFIG_HAX) += hax-all.o hax-mem.o hax-posix.o
+obj-$(CONFIG_HAX) += hax-posix.o
 endif
 obj-$(CONFIG_HVF) += hvf/
 obj-$(CONFIG_WHPX) += whpx-all.o
diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index c93bb23a44..b66ddeb8bf 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -32,9 +32,10 @@
 #include "sysemu/accel.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-#include "qemu/main-loop.h"
 #include "hw/boards.h"
 
+#include "hax-cpus.h"
+
 #define DEBUG_HAX 0
 
 #define DPRINTF(fmt, ...) \
@@ -374,6 +375,9 @@ static int hax_accel_init(MachineState *ms)
                 !ret ? "working" : "not working",
                 !ret ? "fast virt" : "emulation");
     }
+    if (ret == 0) {
+        cpus_register_accel(&hax_cpus);
+    }
     return ret;
 }
 
diff --git a/target/i386/hax-cpus.c b/target/i386/hax-cpus.c
new file mode 100644
index 0000000000..69a4162939
--- /dev/null
+++ b/target/i386/hax-cpus.c
@@ -0,0 +1,85 @@
+/*
+ * QEMU HAX support
+ *
+ * Copyright IBM, Corp. 2008
+ *           Red Hat, Inc. 2008
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *  Glauber Costa     <gcosta@redhat.com>
+ *
+ * Copyright (c) 2011 Intel Corporation
+ *  Written by:
+ *  Jiang Yunhong<yunhong.jiang@intel.com>
+ *  Xin Xiaohui<xiaohui.xin@intel.com>
+ *  Zhang Xiantao<xiantao.zhang@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "hax-i386.h"
+#include "sysemu/runstate.h"
+#include "sysemu/cpus.h"
+#include "qemu/guest-random.h"
+
+#include "hax-cpus.h"
+
+static void *hax_cpu_thread_fn(void *arg)
+{
+    CPUState *cpu = arg;
+    int r;
+
+    rcu_register_thread();
+    qemu_mutex_lock_iothread();
+    qemu_thread_get_self(cpu->thread);
+
+    cpu->thread_id = qemu_get_thread_id();
+    hax_init_vcpu(cpu);
+    cpu_thread_signal_created(cpu);
+    qemu_guest_random_seed_thread_part2(cpu->random_seed);
+
+    do {
+        if (cpu_can_run(cpu)) {
+            r = hax_smp_cpu_exec(cpu);
+            if (r == EXCP_DEBUG) {
+                cpu_handle_guest_debug(cpu);
+            }
+        }
+
+        qemu_wait_io_event(cpu);
+    } while (!cpu->unplug || cpu_can_run(cpu));
+    rcu_unregister_thread();
+    return NULL;
+}
+
+static void hax_start_vcpu_thread(CPUState *cpu)
+{
+    char thread_name[VCPU_THREAD_NAME_SIZE];
+
+    cpu->thread = g_malloc0(sizeof(QemuThread));
+    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    qemu_cond_init(cpu->halt_cond);
+
+    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HAX",
+             cpu->cpu_index);
+    qemu_thread_create(cpu->thread, thread_name, hax_cpu_thread_fn,
+                       cpu, QEMU_THREAD_JOINABLE);
+#ifdef _WIN32
+    cpu->hThread = qemu_thread_get_handle(cpu->thread);
+#endif
+}
+
+CpusAccel hax_cpus = {
+    .create_vcpu_thread = hax_start_vcpu_thread,
+    .kick_vcpu_thread = hax_kick_vcpu_thread,
+
+    .synchronize_post_reset = hax_cpu_synchronize_post_reset,
+    .synchronize_post_init = hax_cpu_synchronize_post_init,
+    .synchronize_state = hax_cpu_synchronize_state,
+    .synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm,
+};
diff --git a/target/i386/hax-cpus.h b/target/i386/hax-cpus.h
new file mode 100644
index 0000000000..ac3cf1f8ae
--- /dev/null
+++ b/target/i386/hax-cpus.h
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
+#ifndef HAX_CPUS_H
+#define HAX_CPUS_H
+
+#include "sysemu/cpus.h"
+
+extern CpusAccel hax_cpus;
+
+#endif /* HAX_CPUS_H */
diff --git a/target/i386/hax-i386.h b/target/i386/hax-i386.h
index ec28708185..48c4abe14e 100644
--- a/target/i386/hax-i386.h
+++ b/target/i386/hax-i386.h
@@ -60,6 +60,8 @@ int hax_inject_interrupt(CPUArchState *env, int vector);
 struct hax_vm *hax_vm_create(struct hax_state *hax, int max_cpus);
 int hax_vcpu_run(struct hax_vcpu_state *vcpu);
 int hax_vcpu_create(int id);
+void hax_kick_vcpu_thread(CPUState *cpu);
+
 int hax_sync_vcpu_state(CPUArchState *env, struct vcpu_state_t *state,
                         int set);
 int hax_sync_msr(CPUArchState *env, struct hax_msr_data *msrs, int set);
diff --git a/target/i386/hax-posix.c b/target/i386/hax-posix.c
index 5f9d1b803d..6fb7867d11 100644
--- a/target/i386/hax-posix.c
+++ b/target/i386/hax-posix.c
@@ -16,6 +16,8 @@
 
 #include "target/i386/hax-i386.h"
 
+#include "sysemu/cpus.h"
+
 hax_fd hax_mod_open(void)
 {
     int fd = open("/dev/HAX", O_RDWR);
@@ -292,3 +294,13 @@ int hax_inject_interrupt(CPUArchState *env, int vector)
 
     return ioctl(fd, HAX_VCPU_IOCTL_INTERRUPT, &vector);
 }
+
+void hax_kick_vcpu_thread(CPUState *cpu)
+{
+    /*
+     * FIXME: race condition with the exit_request check in
+     * hax_vcpu_hax_exec
+     */
+    cpu->exit_request = 1;
+    cpus_kick_thread(cpu);
+}
diff --git a/target/i386/hax-windows.c b/target/i386/hax-windows.c
index 863c2bcc19..469b48e608 100644
--- a/target/i386/hax-windows.c
+++ b/target/i386/hax-windows.c
@@ -463,3 +463,23 @@ int hax_inject_interrupt(CPUArchState *env, int vector)
         return 0;
     }
 }
+
+static void CALLBACK dummy_apc_func(ULONG_PTR unused)
+{
+}
+
+void hax_kick_vcpu_thread(CPUState *cpu)
+{
+    /*
+     * FIXME: race condition with the exit_request check in
+     * hax_vcpu_hax_exec
+     */
+    cpu->exit_request = 1;
+    if (!qemu_cpu_is_self(cpu)) {
+        if (!QueueUserAPC(dummy_apc_func, cpu->hThread, 0)) {
+            fprintf(stderr, "%s: QueueUserAPC failed with error %lu\n",
+                    __func__, GetLastError());
+            exit(1);
+        }
+    }
+}
-- 
2.16.4


