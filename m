Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F51F2C7CDE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:44:19 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZAo-0002mR-9r
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjZ2z-0001MG-9t
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:36:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:57738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjZ2r-0004qX-7v
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:36:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07F98ACC5;
 Mon, 30 Nov 2020 02:35:54 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v7 19/22] accel: introduce AccelCPUClass extending CPUClass
Date: Mon, 30 Nov 2020 03:35:32 +0100
Message-Id: <20201130023535.16689-20-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201130023535.16689-1-cfontana@suse.de>
References: <20201130023535.16689-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
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

add a new optional interface to CPUClass,
which allows accelerators to extend the CPUClass
with additional accelerator-specific initializations.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 MAINTAINERS                 |  1 +
 accel/accel-common.c        | 46 ++++++++++++++++++++++++++++++++++++-
 bsd-user/main.c             |  2 +-
 include/hw/core/accel-cpu.h | 25 ++++++++++++++++++++
 include/hw/core/cpu.h       | 13 +++++++++++
 include/qemu/accel.h        |  2 +-
 linux-user/main.c           |  2 +-
 softmmu/vl.c                | 10 ++++----
 8 files changed, 93 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/core/accel-cpu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f0e773a47..f084d73f6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -436,6 +436,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/accel.h
 F: include/sysemu/accel-ops.h
+F: include/hw/core/accel-cpu.h
 F: accel/accel-*.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 3910b7dbe0..ef73c761fc 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -26,6 +26,9 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 
+#include "cpu.h"
+#include "hw/core/accel-cpu.h"
+
 #ifndef CONFIG_USER_ONLY
 #include "accel-softmmu.h"
 #endif /* !CONFIG_USER_ONLY */
@@ -46,16 +49,57 @@ AccelClass *accel_find(const char *opt_name)
     return ac;
 }
 
-void accel_init_interfaces(AccelClass *ac, const char *cpu_type)
+static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
+{
+    CPUClass *cc = CPU_CLASS(klass);
+    AccelCPUClass *accel_cpu_interface = opaque;
+
+    cc->accel_cpu_interface = accel_cpu_interface;
+    if (accel_cpu_interface->cpu_class_init) {
+        accel_cpu_interface->cpu_class_init(cc);
+    }
+}
+
+/* initialize the arch-specific accel CpuClass interfaces */
+static void accel_init_cpu_interfaces(AccelClass *ac)
+{
+    const char *ac_name; /* AccelClass name */
+    char *acc_name;      /* AccelCPUClass name */
+    ObjectClass *acc;    /* AccelCPUClass */
+
+    ac_name = object_class_get_name(OBJECT_CLASS(ac));
+    g_assert(ac_name != NULL);
+
+    acc_name = g_strdup_printf("%s-%s", ac_name, CPU_RESOLVING_TYPE);
+    acc = object_class_by_name(acc_name);
+    g_free(acc_name);
+
+    if (acc) {
+        object_class_foreach(accel_init_cpu_int_aux,
+                             CPU_RESOLVING_TYPE, false, acc);
+    }
+}
+
+void accel_init_interfaces(AccelClass *ac)
 {
 #ifndef CONFIG_USER_ONLY
     accel_init_ops_interfaces(ac);
 #endif /* !CONFIG_USER_ONLY */
+
+    accel_init_cpu_interfaces(ac);
 }
 
+static const TypeInfo accel_cpu_type = {
+    .name = TYPE_ACCEL_CPU,
+    .parent = TYPE_OBJECT,
+    .abstract = true,
+    .class_size = sizeof(AccelCPUClass),
+};
+
 static void register_accel_types(void)
 {
     type_register_static(&accel_type);
+    type_register_static(&accel_cpu_type);
 }
 
 type_init(register_accel_types);
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 25a757c746..7ff3cc8f87 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -914,7 +914,7 @@ int main(int argc, char **argv)
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
         ac->init_machine(NULL);
-        accel_init_interfaces(ac, cpu_type);
+        accel_init_interfaces(ac);
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
new file mode 100644
index 0000000000..dce08a9100
--- /dev/null
+++ b/include/hw/core/accel-cpu.h
@@ -0,0 +1,25 @@
+/*
+ * Accelerator interface, specializes CPUClass
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef ACCEL_CPU_H
+#define ACCEL_CPU_H
+
+/*
+ * these defines cannot be in cpu.h, because we are using
+ * CPU_RESOLVING_TYPE here.
+ * Use this header to define your accelerator-specific
+ * cpu-specific accelerator interfaces.
+ */
+
+#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
+#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
+typedef struct AccelCPUClass AccelCPUClass;
+DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
+
+#endif /* ACCEL_CPU_H */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 89454c3d00..9f00c6635b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -76,6 +76,17 @@ typedef struct CPUWatchpoint CPUWatchpoint;
 
 struct TranslationBlock;
 
+/* see also accel-cpu.h */
+typedef struct AccelCPUClass {
+    /*< private >*/
+    ObjectClass parent_class;
+    /*< public >*/
+
+    void (*cpu_class_init)(CPUClass *cc);
+    void (*cpu_instance_init)(CPUState *cpu);
+    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
+} AccelCPUClass;
+
 #ifdef CONFIG_TCG
 #include "tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
@@ -209,6 +220,8 @@ struct CPUClass {
 #ifdef CONFIG_TCG
     TcgCpuOperations tcg_ops;
 #endif /* CONFIG_TCG */
+
+    AccelCPUClass *accel_cpu_interface;
 };
 
 /*
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 68a57e040f..b9d6d69eb8 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -69,7 +69,7 @@ typedef struct AccelClass {
 AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
 
-void accel_init_interfaces(AccelClass *ac, const char *cpu_type);
+void accel_init_interfaces(AccelClass *ac);
 
 #ifndef CONFIG_USER_ONLY
 int accel_init_machine(AccelState *accel, MachineState *ms);
diff --git a/linux-user/main.c b/linux-user/main.c
index 54e59fce3a..7dc8ee3aaa 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -708,7 +708,7 @@ int main(int argc, char **argv, char **envp)
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
         ac->init_machine(NULL);
-        accel_init_interfaces(ac, cpu_type);
+        accel_init_interfaces(ac);
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 8d65058ef1..742eed87c7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4321,10 +4321,12 @@ void qemu_init(int argc, char **argv, char **envp)
     if (cpu_option) {
         current_machine->cpu_type = parse_cpu_option(cpu_option);
     }
-
-    /* cpu has been chosen, initialize the accel interfaces */
-    accel_init_interfaces(ACCEL_GET_CLASS(current_machine->accelerator),
-                          current_machine->cpu_type);
+    /*
+     * warning: regardless of the code above,
+     * current_machine->cpu_type can still be NULL at this point,
+     * as machine "none" has no machine_class->default_cpu_type (NULL).
+     */
+    accel_init_interfaces(ACCEL_GET_CLASS(current_machine->accelerator));
 
     if (current_machine->ram_memdev_id) {
         Object *backend;
-- 
2.26.2


