Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479573445BF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:30:30 +0100 (CET)
Received: from localhost ([::1]:60106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKdX-0002k1-Go
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKbM-0000sF-E2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:28:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:45250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKbJ-0001jc-N5
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:28:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6577AAE57;
 Mon, 22 Mar 2021 13:28:07 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v28 09/23] i386: split off sysemu-only functionality in tcg-cpu
Date: Mon, 22 Mar 2021 14:27:46 +0100
Message-Id: <20210322132800.7470-11-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322132800.7470-1-cfontana@suse.de>
References: <20210322132800.7470-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/tcg-cpu.h          | 24 +++++++++
 target/i386/tcg/sysemu/tcg-cpu.c   | 83 ++++++++++++++++++++++++++++++
 target/i386/tcg/tcg-cpu.c          | 75 ++-------------------------
 target/i386/tcg/meson.build        |  3 ++
 target/i386/tcg/sysemu/meson.build |  3 ++
 target/i386/tcg/user/meson.build   |  2 +
 6 files changed, 119 insertions(+), 71 deletions(-)
 create mode 100644 target/i386/tcg/tcg-cpu.h
 create mode 100644 target/i386/tcg/sysemu/tcg-cpu.c
 create mode 100644 target/i386/tcg/sysemu/meson.build
 create mode 100644 target/i386/tcg/user/meson.build

diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
new file mode 100644
index 0000000000..36bd300af0
--- /dev/null
+++ b/target/i386/tcg/tcg-cpu.h
@@ -0,0 +1,24 @@
+/*
+ * i386 TCG cpu class initialization functions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef TCG_CPU_H
+#define TCG_CPU_H
+
+bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
+
+#endif /* TCG_CPU_H */
diff --git a/target/i386/tcg/sysemu/tcg-cpu.c b/target/i386/tcg/sysemu/tcg-cpu.c
new file mode 100644
index 0000000000..c223c0fe9b
--- /dev/null
+++ b/target/i386/tcg/sysemu/tcg-cpu.c
@@ -0,0 +1,83 @@
+/*
+ * i386 TCG cpu class initialization functions specific to sysemu
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "tcg/helper-tcg.h"
+
+#include "sysemu/sysemu.h"
+#include "qemu/units.h"
+#include "exec/address-spaces.h"
+
+#include "tcg/tcg-cpu.h"
+
+static void tcg_cpu_machine_done(Notifier *n, void *unused)
+{
+    X86CPU *cpu = container_of(n, X86CPU, machine_done);
+    MemoryRegion *smram =
+        (MemoryRegion *) object_resolve_path("/machine/smram", NULL);
+
+    if (smram) {
+        cpu->smram = g_new(MemoryRegion, 1);
+        memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
+                                 smram, 0, 4 * GiB);
+        memory_region_set_enabled(cpu->smram, true);
+        memory_region_add_subregion_overlap(cpu->cpu_as_root, 0,
+                                            cpu->smram, 1);
+    }
+}
+
+bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    X86CPU *cpu = X86_CPU(cs);
+
+    /*
+     * The realize order is important, since x86_cpu_realize() checks if
+     * nothing else has been set by the user (or by accelerators) in
+     * cpu->ucode_rev and cpu->phys_bits, and the memory regions
+     * initialized here are needed for the vcpu initialization.
+     *
+     * realize order:
+     * tcg_cpu -> host_cpu -> x86_cpu
+     */
+    cpu->cpu_as_mem = g_new(MemoryRegion, 1);
+    cpu->cpu_as_root = g_new(MemoryRegion, 1);
+
+    /* Outer container... */
+    memory_region_init(cpu->cpu_as_root, OBJECT(cpu), "memory", ~0ull);
+    memory_region_set_enabled(cpu->cpu_as_root, true);
+
+    /*
+     * ... with two regions inside: normal system memory with low
+     * priority, and...
+     */
+    memory_region_init_alias(cpu->cpu_as_mem, OBJECT(cpu), "memory",
+                             get_system_memory(), 0, ~0ull);
+    memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
+    memory_region_set_enabled(cpu->cpu_as_mem, true);
+
+    cs->num_ases = 2;
+    cpu_address_space_init(cs, 0, "cpu-memory", cs->memory);
+    cpu_address_space_init(cs, 1, "cpu-smm", cpu->cpu_as_root);
+
+    /* ... SMRAM with higher priority, linked from /machine/smram.  */
+    cpu->machine_done.notify = tcg_cpu_machine_done;
+    qemu_add_machine_init_done_notifier(&cpu->machine_done);
+    return true;
+}
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 23e1f5f0c3..e311f52855 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -23,11 +23,7 @@
 #include "qemu/accel.h"
 #include "hw/core/accel-cpu.h"
 
-#ifndef CONFIG_USER_ONLY
-#include "sysemu/sysemu.h"
-#include "qemu/units.h"
-#include "exec/address-spaces.h"
-#endif
+#include "tcg-cpu.h"
 
 /* Frob eflags into and out of the CPU temporary format.  */
 
@@ -78,72 +74,6 @@ static void tcg_cpu_class_init(CPUClass *cc)
     cc->tcg_ops = &x86_tcg_ops;
 }
 
-#ifndef CONFIG_USER_ONLY
-
-static void x86_cpu_machine_done(Notifier *n, void *unused)
-{
-    X86CPU *cpu = container_of(n, X86CPU, machine_done);
-    MemoryRegion *smram =
-        (MemoryRegion *) object_resolve_path("/machine/smram", NULL);
-
-    if (smram) {
-        cpu->smram = g_new(MemoryRegion, 1);
-        memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
-                                 smram, 0, 4 * GiB);
-        memory_region_set_enabled(cpu->smram, true);
-        memory_region_add_subregion_overlap(cpu->cpu_as_root, 0,
-                                            cpu->smram, 1);
-    }
-}
-
-static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
-{
-    X86CPU *cpu = X86_CPU(cs);
-
-    /*
-     * The realize order is important, since x86_cpu_realize() checks if
-     * nothing else has been set by the user (or by accelerators) in
-     * cpu->ucode_rev and cpu->phys_bits, and the memory regions
-     * initialized here are needed for the vcpu initialization.
-     *
-     * realize order:
-     * tcg_cpu -> host_cpu -> x86_cpu
-     */
-    cpu->cpu_as_mem = g_new(MemoryRegion, 1);
-    cpu->cpu_as_root = g_new(MemoryRegion, 1);
-
-    /* Outer container... */
-    memory_region_init(cpu->cpu_as_root, OBJECT(cpu), "memory", ~0ull);
-    memory_region_set_enabled(cpu->cpu_as_root, true);
-
-    /*
-     * ... with two regions inside: normal system memory with low
-     * priority, and...
-     */
-    memory_region_init_alias(cpu->cpu_as_mem, OBJECT(cpu), "memory",
-                             get_system_memory(), 0, ~0ull);
-    memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
-    memory_region_set_enabled(cpu->cpu_as_mem, true);
-
-    cs->num_ases = 2;
-    cpu_address_space_init(cs, 0, "cpu-memory", cs->memory);
-    cpu_address_space_init(cs, 1, "cpu-smm", cpu->cpu_as_root);
-
-    /* ... SMRAM with higher priority, linked from /machine/smram.  */
-    cpu->machine_done.notify = x86_cpu_machine_done;
-    qemu_add_machine_init_done_notifier(&cpu->machine_done);
-    return true;
-}
-
-#else /* CONFIG_USER_ONLY */
-
-static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
-{
-    return true;
-}
-
-#endif /* !CONFIG_USER_ONLY */
-
 /*
  * TCG-specific defaults that override all CPU models when using TCG
  */
@@ -163,7 +93,10 @@ static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
+#ifndef CONFIG_USER_ONLY
     acc->cpu_realizefn = tcg_cpu_realizefn;
+#endif /* CONFIG_USER_ONLY */
+
     acc->cpu_class_init = tcg_cpu_class_init;
     acc->cpu_instance_init = tcg_cpu_instance_init;
 }
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index 6a1a73cdbf..320bcd1e46 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -12,3 +12,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'svm_helper.c',
   'tcg-cpu.c',
   'translate.c'), if_false: files('tcg-stub.c'))
+
+subdir('sysemu')
+subdir('user')
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
new file mode 100644
index 0000000000..4ab30cc32e
--- /dev/null
+++ b/target/i386/tcg/sysemu/meson.build
@@ -0,0 +1,3 @@
+i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
+  'tcg-cpu.c',
+))
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
new file mode 100644
index 0000000000..7aecc53155
--- /dev/null
+++ b/target/i386/tcg/user/meson.build
@@ -0,0 +1,2 @@
+i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
+))
-- 
2.26.2


