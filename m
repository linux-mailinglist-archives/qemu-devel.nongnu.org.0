Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A584242E95
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 20:36:13 +0200 (CEST)
Received: from localhost ([::1]:50580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5vbg-0004wh-6l
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 14:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k5vYj-0000M1-IO
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 14:33:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:40778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k5vYd-0002Do-JE
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 14:33:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D98D6AF27;
 Wed, 12 Aug 2020 18:33:19 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH v5 08/14] cpus: extract out hvf-specific code to
 target/i386/hvf/
Date: Wed, 12 Aug 2020 20:32:44 +0200
Message-Id: <20200812183250.9221-9-cfontana@suse.de>
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

register a "CpusAccel" interface for HVF as well.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 softmmu/cpus.c                |  66 ---------------------
 target/i386/hvf/Makefile.objs |   2 +-
 target/i386/hvf/hvf-cpus.c    | 131 ++++++++++++++++++++++++++++++++++++++++++
 target/i386/hvf/hvf-cpus.h    |  17 ++++++
 target/i386/hvf/hvf.c         |   3 +
 5 files changed, 152 insertions(+), 67 deletions(-)
 create mode 100644 target/i386/hvf/hvf-cpus.c
 create mode 100644 target/i386/hvf/hvf-cpus.h

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index c74dae6449..f99942fd9d 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -33,7 +33,6 @@
 #include "exec/gdbstub.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
-#include "sysemu/hvf.h"
 #include "exec/exec-all.h"
 #include "qemu/thread.h"
 #include "qemu/plugin.h"
@@ -198,9 +197,6 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu)
     if (cpus_accel && cpus_accel->synchronize_pre_loadvm) {
         cpus_accel->synchronize_pre_loadvm(cpu);
     }
-    if (hvf_enabled()) {
-        hvf_cpu_synchronize_pre_loadvm(cpu);
-    }
 }
 
 int64_t cpus_get_virtual_clock(void)
@@ -390,48 +386,6 @@ void qemu_wait_io_event(CPUState *cpu)
     qemu_wait_io_event_common(cpu);
 }
 
-/* The HVF-specific vCPU thread function. This one should only run when the host
- * CPU supports the VMX "unrestricted guest" feature. */
-static void *qemu_hvf_cpu_thread_fn(void *arg)
-{
-    CPUState *cpu = arg;
-
-    int r;
-
-    assert(hvf_enabled());
-
-    rcu_register_thread();
-
-    qemu_mutex_lock_iothread();
-    qemu_thread_get_self(cpu->thread);
-
-    cpu->thread_id = qemu_get_thread_id();
-    cpu->can_do_io = 1;
-    current_cpu = cpu;
-
-    hvf_init_vcpu(cpu);
-
-    /* signal CPU creation */
-    cpu_thread_signal_created(cpu);
-    qemu_guest_random_seed_thread_part2(cpu->random_seed);
-
-    do {
-        if (cpu_can_run(cpu)) {
-            r = hvf_vcpu_exec(cpu);
-            if (r == EXCP_DEBUG) {
-                cpu_handle_guest_debug(cpu);
-            }
-        }
-        qemu_wait_io_event(cpu);
-    } while (!cpu->unplug || cpu_can_run(cpu));
-
-    hvf_vcpu_destroy(cpu);
-    cpu_thread_signal_destroyed(cpu);
-    qemu_mutex_unlock_iothread();
-    rcu_unregister_thread();
-    return NULL;
-}
-
 void cpus_kick_thread(CPUState *cpu)
 {
 #ifndef _WIN32
@@ -602,24 +556,6 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_lock_iothread();
 }
 
-static void qemu_hvf_start_vcpu(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    /* HVF currently does not support TCG, and only runs in
-     * unrestricted-guest mode. */
-    assert(hvf_enabled());
-
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-    qemu_cond_init(cpu->halt_cond);
-
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, qemu_hvf_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-}
-
 void cpus_register_accel(CpusAccel *ca)
 {
     assert(ca != NULL);
@@ -647,8 +583,6 @@ void qemu_init_vcpu(CPUState *cpu)
     if (cpus_accel) {
         /* accelerator already implements the CpusAccel interface */
         cpus_accel->create_vcpu_thread(cpu);
-    } else if (hvf_enabled()) {
-        qemu_hvf_start_vcpu(cpu);
     } else {
         assert(0);
     }
diff --git a/target/i386/hvf/Makefile.objs b/target/i386/hvf/Makefile.objs
index 927b86bc67..af9f7dcfc1 100644
--- a/target/i386/hvf/Makefile.objs
+++ b/target/i386/hvf/Makefile.objs
@@ -1,2 +1,2 @@
-obj-y += hvf.o
+obj-y += hvf.o hvf-cpus.o
 obj-y += x86.o x86_cpuid.o x86_decode.o x86_descr.o x86_emu.o x86_flags.o x86_mmu.o x86hvf.o x86_task.o
diff --git a/target/i386/hvf/hvf-cpus.c b/target/i386/hvf/hvf-cpus.c
new file mode 100644
index 0000000000..9540157f1e
--- /dev/null
+++ b/target/i386/hvf/hvf-cpus.c
@@ -0,0 +1,131 @@
+/*
+ * Copyright 2008 IBM Corporation
+ *           2008 Red Hat, Inc.
+ * Copyright 2011 Intel Corporation
+ * Copyright 2016 Veertu, Inc.
+ * Copyright 2017 The Android Open Source Project
+ *
+ * QEMU Hypervisor.framework support
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of version 2 of the GNU General Public
+ * License as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ * This file contain code under public domain from the hvdos project:
+ * https://github.com/mist64/hvdos
+ *
+ * Parts Copyright (c) 2011 NetApp, Inc.
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL NETAPP, INC OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "sysemu/hvf.h"
+#include "sysemu/runstate.h"
+#include "target/i386/cpu.h"
+#include "qemu/guest-random.h"
+
+#include "hvf-cpus.h"
+
+/*
+ * The HVF-specific vCPU thread function. This one should only run when the host
+ * CPU supports the VMX "unrestricted guest" feature.
+ */
+static void *hvf_cpu_thread_fn(void *arg)
+{
+    CPUState *cpu = arg;
+
+    int r;
+
+    assert(hvf_enabled());
+
+    rcu_register_thread();
+
+    qemu_mutex_lock_iothread();
+    qemu_thread_get_self(cpu->thread);
+
+    cpu->thread_id = qemu_get_thread_id();
+    cpu->can_do_io = 1;
+    current_cpu = cpu;
+
+    hvf_init_vcpu(cpu);
+
+    /* signal CPU creation */
+    cpu_thread_signal_created(cpu);
+    qemu_guest_random_seed_thread_part2(cpu->random_seed);
+
+    do {
+        if (cpu_can_run(cpu)) {
+            r = hvf_vcpu_exec(cpu);
+            if (r == EXCP_DEBUG) {
+                cpu_handle_guest_debug(cpu);
+            }
+        }
+        qemu_wait_io_event(cpu);
+    } while (!cpu->unplug || cpu_can_run(cpu));
+
+    hvf_vcpu_destroy(cpu);
+    cpu_thread_signal_destroyed(cpu);
+    qemu_mutex_unlock_iothread();
+    rcu_unregister_thread();
+    return NULL;
+}
+
+static void hvf_start_vcpu_thread(CPUState *cpu)
+{
+    char thread_name[VCPU_THREAD_NAME_SIZE];
+
+    /*
+     * HVF currently does not support TCG, and only runs in
+     * unrestricted-guest mode.
+     */
+    assert(hvf_enabled());
+
+    cpu->thread = g_malloc0(sizeof(QemuThread));
+    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    qemu_cond_init(cpu->halt_cond);
+
+    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
+             cpu->cpu_index);
+    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn,
+                       cpu, QEMU_THREAD_JOINABLE);
+}
+
+CpusAccel hvf_cpus = {
+    .create_vcpu_thread = hvf_start_vcpu_thread,
+
+    .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
+    .synchronize_post_init = hvf_cpu_synchronize_post_init,
+    .synchronize_state = hvf_cpu_synchronize_state,
+    .synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm,
+};
diff --git a/target/i386/hvf/hvf-cpus.h b/target/i386/hvf/hvf-cpus.h
new file mode 100644
index 0000000000..b66f4889b0
--- /dev/null
+++ b/target/i386/hvf/hvf-cpus.h
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
+#ifndef HVF_CPUS_H
+#define HVF_CPUS_H
+
+#include "sysemu/cpus.h"
+
+extern CpusAccel hvf_cpus;
+
+#endif /* HVF_CPUS_H */
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index d81f569aed..7ac6987c1b 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -72,6 +72,8 @@
 #include "sysemu/accel.h"
 #include "target/i386/cpu.h"
 
+#include "hvf-cpus.h"
+
 HVFState *hvf_state;
 
 static void assert_hvf_ok(hv_return_t ret)
@@ -894,6 +896,7 @@ static int hvf_accel_init(MachineState *ms)
     hvf_state = s;
     cpu_interrupt_handler = hvf_handle_interrupt;
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
+    cpus_register_accel(&hvf_cpus);
     return 0;
 }
 
-- 
2.16.4


