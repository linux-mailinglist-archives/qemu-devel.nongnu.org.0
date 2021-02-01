Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6CA30A56E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:36:01 +0100 (CET)
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WYq-0003Bs-Eq
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9V-0000vU-LA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:55830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9A-0005rD-JR
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66A7BB162;
 Mon,  1 Feb 2021 10:09:15 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 17/23] accel: replace struct CpusAccel with AccelOpsClass
Date: Mon,  1 Feb 2021 11:08:57 +0100
Message-Id: <20210201100903.17309-18-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201100903.17309-1-cfontana@suse.de>
References: <20210201100903.17309-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

also centralize the registration of the cpus.c module
accelerator operations in accel/accel-softmmu.c

Consequently, rename all tcg-cpus.c, kvm-cpus.c etc to
tcg-accel-ops.c, kvm-accel-ops.c etc, also matching the
object type names.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/accel-softmmu.h                         | 15 ++++++
 accel/kvm/kvm-cpus.h                          |  2 -
 ...g-cpus-icount.h => tcg-accel-ops-icount.h} |  2 +
 accel/tcg/tcg-accel-ops-mttcg.h               | 19 ++++++++
 .../tcg/{tcg-cpus-rr.h => tcg-accel-ops-rr.h} |  0
 accel/tcg/{tcg-cpus.h => tcg-accel-ops.h}     |  6 +--
 include/qemu/accel.h                          |  2 +
 include/sysemu/accel-ops.h                    | 45 ++++++++++++++++++
 include/sysemu/cpus.h                         | 26 ++--------
 .../i386/hax/{hax-cpus.h => hax-accel-ops.h}  |  2 -
 target/i386/hax/hax-windows.h                 |  2 +-
 .../i386/hvf/{hvf-cpus.h => hvf-accel-ops.h}  |  2 -
 .../whpx/{whpx-cpus.h => whpx-accel-ops.h}    |  2 -
 accel/accel-common.c                          | 11 +++++
 accel/accel-softmmu.c                         | 43 +++++++++++++++--
 accel/kvm/{kvm-cpus.c => kvm-accel-ops.c}     | 26 +++++++---
 accel/kvm/kvm-all.c                           |  2 -
 accel/qtest/qtest.c                           | 23 ++++++---
 ...g-cpus-icount.c => tcg-accel-ops-icount.c} | 21 +++------
 ...tcg-cpus-mttcg.c => tcg-accel-ops-mttcg.c} | 14 ++----
 .../tcg/{tcg-cpus-rr.c => tcg-accel-ops-rr.c} | 13 ++---
 accel/tcg/{tcg-cpus.c => tcg-accel-ops.c}     | 47 ++++++++++++++++++-
 accel/tcg/tcg-all.c                           | 12 -----
 accel/xen/xen-all.c                           | 22 ++++++---
 bsd-user/main.c                               |  3 +-
 linux-user/main.c                             |  1 +
 softmmu/cpus.c                                | 12 ++---
 softmmu/vl.c                                  |  7 ++-
 .../i386/hax/{hax-cpus.c => hax-accel-ops.c}  | 31 ++++++++----
 target/i386/hax/hax-all.c                     |  5 +-
 target/i386/hax/hax-mem.c                     |  2 +-
 target/i386/hax/hax-posix.c                   |  2 +-
 target/i386/hax/hax-windows.c                 |  2 +-
 .../i386/hvf/{hvf-cpus.c => hvf-accel-ops.c}  | 29 +++++++++---
 target/i386/hvf/hvf.c                         |  3 +-
 target/i386/hvf/x86hvf.c                      |  2 +-
 .../whpx/{whpx-cpus.c => whpx-accel-ops.c}    | 31 ++++++++----
 target/i386/whpx/whpx-all.c                   |  7 +--
 MAINTAINERS                                   |  3 +-
 accel/kvm/meson.build                         |  2 +-
 accel/tcg/meson.build                         |  8 ++--
 target/i386/hax/meson.build                   |  2 +-
 target/i386/hvf/meson.build                   |  2 +-
 target/i386/whpx/meson.build                  |  2 +-
 44 files changed, 353 insertions(+), 162 deletions(-)
 create mode 100644 accel/accel-softmmu.h
 rename accel/tcg/{tcg-cpus-icount.h => tcg-accel-ops-icount.h} (88%)
 create mode 100644 accel/tcg/tcg-accel-ops-mttcg.h
 rename accel/tcg/{tcg-cpus-rr.h => tcg-accel-ops-rr.h} (100%)
 rename accel/tcg/{tcg-cpus.h => tcg-accel-ops.h} (72%)
 create mode 100644 include/sysemu/accel-ops.h
 rename target/i386/hax/{hax-cpus.h => hax-accel-ops.h} (95%)
 rename target/i386/hvf/{hvf-cpus.h => hvf-accel-ops.h} (94%)
 rename target/i386/whpx/{whpx-cpus.h => whpx-accel-ops.h} (96%)
 rename accel/kvm/{kvm-cpus.c => kvm-accel-ops.c} (72%)
 rename accel/tcg/{tcg-cpus-icount.c => tcg-accel-ops-icount.c} (89%)
 rename accel/tcg/{tcg-cpus-mttcg.c => tcg-accel-ops-mttcg.c} (92%)
 rename accel/tcg/{tcg-cpus-rr.c => tcg-accel-ops-rr.c} (97%)
 rename accel/tcg/{tcg-cpus.c => tcg-accel-ops.c} (63%)
 rename target/i386/hax/{hax-cpus.c => hax-accel-ops.c} (69%)
 rename target/i386/hvf/{hvf-cpus.c => hvf-accel-ops.c} (84%)
 rename target/i386/whpx/{whpx-cpus.c => whpx-accel-ops.c} (71%)

diff --git a/accel/accel-softmmu.h b/accel/accel-softmmu.h
new file mode 100644
index 0000000000..5e192f1882
--- /dev/null
+++ b/accel/accel-softmmu.h
@@ -0,0 +1,15 @@
+/*
+ * QEMU System Emulation accel internal functions
+ *
+ * Copyright 2021 SUSE LLC
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
diff --git a/accel/tcg/tcg-cpus-icount.h b/accel/tcg/tcg-accel-ops-icount.h
similarity index 88%
rename from accel/tcg/tcg-cpus-icount.h
rename to accel/tcg/tcg-accel-ops-icount.h
index b695939dfa..d884aa2aaa 100644
--- a/accel/tcg/tcg-cpus-icount.h
+++ b/accel/tcg/tcg-accel-ops-icount.h
@@ -14,4 +14,6 @@ void icount_handle_deadline(void);
 void icount_prepare_for_run(CPUState *cpu);
 void icount_process_data(CPUState *cpu);
 
+void icount_handle_interrupt(CPUState *cpu, int mask);
+
 #endif /* TCG_CPUS_ICOUNT_H */
diff --git a/accel/tcg/tcg-accel-ops-mttcg.h b/accel/tcg/tcg-accel-ops-mttcg.h
new file mode 100644
index 0000000000..9fdc5a2ab5
--- /dev/null
+++ b/accel/tcg/tcg-accel-ops-mttcg.h
@@ -0,0 +1,19 @@
+/*
+ * QEMU TCG Multi Threaded vCPUs implementation
+ *
+ * Copyright 2021 SUSE LLC
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
diff --git a/accel/tcg/tcg-cpus-rr.h b/accel/tcg/tcg-accel-ops-rr.h
similarity index 100%
rename from accel/tcg/tcg-cpus-rr.h
rename to accel/tcg/tcg-accel-ops-rr.h
diff --git a/accel/tcg/tcg-cpus.h b/accel/tcg/tcg-accel-ops.h
similarity index 72%
rename from accel/tcg/tcg-cpus.h
rename to accel/tcg/tcg-accel-ops.h
index d6893a32f8..48130006de 100644
--- a/accel/tcg/tcg-cpus.h
+++ b/accel/tcg/tcg-accel-ops.h
@@ -14,12 +14,8 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel tcg_cpus_mttcg;
-extern const CpusAccel tcg_cpus_icount;
-extern const CpusAccel tcg_cpus_rr;
-
 void tcg_cpus_destroy(CPUState *cpu);
 int tcg_cpus_exec(CPUState *cpu);
-void tcg_cpus_handle_interrupt(CPUState *cpu, int mask);
+void tcg_handle_interrupt(CPUState *cpu, int mask);
 
 #endif /* TCG_CPUS_H */
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
index 0000000000..032f6979d7
--- /dev/null
+++ b/include/sysemu/accel-ops.h
@@ -0,0 +1,45 @@
+/*
+ * Accelerator OPS, used for cpus.c module
+ *
+ * Copyright 2021 SUSE LLC
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
diff --git a/target/i386/hax/hax-cpus.h b/target/i386/hax/hax-accel-ops.h
similarity index 95%
rename from target/i386/hax/hax-cpus.h
rename to target/i386/hax/hax-accel-ops.h
index ee8ab7a631..c7698519cd 100644
--- a/target/i386/hax/hax-cpus.h
+++ b/target/i386/hax/hax-accel-ops.h
@@ -12,8 +12,6 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel hax_cpus;
-
 #include "hax-interface.h"
 #include "hax-i386.h"
 
diff --git a/target/i386/hax/hax-windows.h b/target/i386/hax/hax-windows.h
index a5ce12d663..b1f5d4f32f 100644
--- a/target/i386/hax/hax-windows.h
+++ b/target/i386/hax/hax-windows.h
@@ -23,7 +23,7 @@
 #include <winioctl.h>
 #include <windef.h>
 
-#include "hax-cpus.h"
+#include "hax-accel-ops.h"
 
 #define HAX_INVALID_FD INVALID_HANDLE_VALUE
 
diff --git a/target/i386/hvf/hvf-cpus.h b/target/i386/hvf/hvf-accel-ops.h
similarity index 94%
rename from target/i386/hvf/hvf-cpus.h
rename to target/i386/hvf/hvf-accel-ops.h
index ced31b82c0..8f992da168 100644
--- a/target/i386/hvf/hvf-cpus.h
+++ b/target/i386/hvf/hvf-accel-ops.h
@@ -12,8 +12,6 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel hvf_cpus;
-
 int hvf_init_vcpu(CPUState *);
 int hvf_vcpu_exec(CPUState *);
 void hvf_cpu_synchronize_state(CPUState *);
diff --git a/target/i386/whpx/whpx-cpus.h b/target/i386/whpx/whpx-accel-ops.h
similarity index 96%
rename from target/i386/whpx/whpx-cpus.h
rename to target/i386/whpx/whpx-accel-ops.h
index bdb367d1d0..2dee6d61ea 100644
--- a/target/i386/whpx/whpx-cpus.h
+++ b/target/i386/whpx/whpx-accel-ops.h
@@ -12,8 +12,6 @@
 
 #include "sysemu/cpus.h"
 
-extern const CpusAccel whpx_cpus;
-
 int whpx_init_vcpu(CPUState *cpu);
 int whpx_vcpu_exec(CPUState *cpu);
 void whpx_destroy_vcpu(CPUState *cpu);
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
diff --git a/accel/kvm/kvm-cpus.c b/accel/kvm/kvm-accel-ops.c
similarity index 72%
rename from accel/kvm/kvm-cpus.c
rename to accel/kvm/kvm-accel-ops.c
index d809b1e74c..430d09de03 100644
--- a/accel/kvm/kvm-cpus.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -74,11 +74,25 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
-const CpusAccel kvm_cpus = {
-    .create_vcpu_thread = kvm_start_vcpu_thread,
+static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
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
+static const TypeInfo kvm_accel_ops_type = {
+    .name = ACCEL_OPS_NAME("kvm"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = kvm_accel_ops_class_init,
+    .abstract = true,
+};
+static void kvm_accel_ops_register_types(void)
+{
+    type_register_static(&kvm_accel_ops_type);
+}
+type_init(kvm_accel_ops_register_types);
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 3feb17d965..5164d838b9 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2256,8 +2256,6 @@ static int kvm_init(MachineState *ms)
         ret = ram_block_discard_disable(true);
         assert(!ret);
     }
-
-    cpus_register_accel(&kvm_cpus);
     return 0;
 
 err:
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index b4e731cb2b..edb29f6fa4 100644
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
 
+static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
+
+    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->get_virtual_clock = qtest_get_virtual_clock;
+};
+
+static const TypeInfo qtest_accel_ops_type = {
+    .name = ACCEL_OPS_NAME("qtest"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = qtest_accel_ops_class_init,
+    .abstract = true,
+};
+
 static void qtest_type_init(void)
 {
     type_register_static(&qtest_accel_type);
+    type_register_static(&qtest_accel_ops_type);
 }
 
 type_init(qtest_type_init);
diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-accel-ops-icount.c
similarity index 89%
rename from accel/tcg/tcg-cpus-icount.c
rename to accel/tcg/tcg-accel-ops-icount.c
index 9f45432275..87762b469c 100644
--- a/accel/tcg/tcg-cpus-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -32,9 +32,9 @@
 #include "exec/exec-all.h"
 #include "hw/boards.h"
 
-#include "tcg-cpus.h"
-#include "tcg-cpus-icount.h"
-#include "tcg-cpus-rr.h"
+#include "tcg-accel-ops.h"
+#include "tcg-accel-ops-icount.h"
+#include "tcg-accel-ops-rr.h"
 
 static int64_t icount_get_limit(void)
 {
@@ -93,7 +93,7 @@ void icount_prepare_for_run(CPUState *cpu)
     /*
      * These should always be cleared by icount_process_data after
      * each vCPU execution. However u16.high can be raised
-     * asynchronously by cpu_exit/cpu_interrupt/tcg_cpus_handle_interrupt
+     * asynchronously by cpu_exit/cpu_interrupt/tcg_handle_interrupt
      */
     g_assert(cpu_neg(cpu)->icount_decr.u16.low == 0);
     g_assert(cpu->icount_extra == 0);
@@ -125,23 +125,14 @@ void icount_process_data(CPUState *cpu)
     replay_mutex_unlock();
 }
 
-static void icount_handle_interrupt(CPUState *cpu, int mask)
+void icount_handle_interrupt(CPUState *cpu, int mask)
 {
     int old_mask = cpu->interrupt_request;
 
-    tcg_cpus_handle_interrupt(cpu, mask);
+    tcg_handle_interrupt(cpu, mask);
     if (qemu_cpu_is_self(cpu) &&
         !cpu->can_do_io
         && (mask & ~old_mask) != 0) {
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
diff --git a/accel/tcg/tcg-cpus-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
similarity index 92%
rename from accel/tcg/tcg-cpus-mttcg.c
rename to accel/tcg/tcg-accel-ops-mttcg.c
index 9c3767d260..42973fb062 100644
--- a/accel/tcg/tcg-cpus-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -32,7 +32,8 @@
 #include "exec/exec-all.h"
 #include "hw/boards.h"
 
-#include "tcg-cpus.h"
+#include "tcg-accel-ops.h"
+#include "tcg-accel-ops-mttcg.h"
 
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
diff --git a/accel/tcg/tcg-cpus-rr.c b/accel/tcg/tcg-accel-ops-rr.c
similarity index 97%
rename from accel/tcg/tcg-cpus-rr.c
rename to accel/tcg/tcg-accel-ops-rr.c
index 0181d2e4eb..4a66055e0d 100644
--- a/accel/tcg/tcg-cpus-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -32,9 +32,9 @@
 #include "exec/exec-all.h"
 #include "hw/boards.h"
 
-#include "tcg-cpus.h"
-#include "tcg-cpus-rr.h"
-#include "tcg-cpus-icount.h"
+#include "tcg-accel-ops.h"
+#include "tcg-accel-ops-rr.h"
+#include "tcg-accel-ops-icount.h"
 
 /* Kick all RR vCPUs */
 void rr_kick_vcpu_thread(CPUState *unused)
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
diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-accel-ops.c
similarity index 63%
rename from accel/tcg/tcg-cpus.c
rename to accel/tcg/tcg-accel-ops.c
index e335f9f155..3017f66dd7 100644
--- a/accel/tcg/tcg-cpus.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -34,7 +34,10 @@
 #include "exec/exec-all.h"
 #include "hw/boards.h"
 
-#include "tcg-cpus.h"
+#include "tcg-accel-ops.h"
+#include "tcg-accel-ops-mttcg.h"
+#include "tcg-accel-ops-rr.h"
+#include "tcg-accel-ops-icount.h"
 
 /* common functionality among all TCG variants */
 
@@ -64,7 +67,7 @@ int tcg_cpus_exec(CPUState *cpu)
 }
 
 /* mask must never be zero, except for A20 change call */
-void tcg_cpus_handle_interrupt(CPUState *cpu, int mask)
+void tcg_handle_interrupt(CPUState *cpu, int mask)
 {
     g_assert(qemu_mutex_iothread_locked());
 
@@ -80,3 +83,43 @@ void tcg_cpus_handle_interrupt(CPUState *cpu, int mask)
         qatomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
     }
 }
+
+static void tcg_accel_ops_init(AccelOpsClass *ops)
+{
+    if (qemu_tcg_mttcg_enabled()) {
+        ops->create_vcpu_thread = mttcg_start_vcpu_thread;
+        ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
+        ops->handle_interrupt = tcg_handle_interrupt;
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
+        ops->handle_interrupt = tcg_handle_interrupt;
+    }
+}
+
+static void tcg_accel_ops_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
+
+    ops->ops_init = tcg_accel_ops_init;
+};
+static const TypeInfo tcg_accel_ops_type = {
+    .name = ACCEL_OPS_NAME("tcg"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = tcg_accel_ops_class_init,
+    .abstract = true,
+};
+static void tcg_accel_ops_register_types(void)
+{
+    type_register_static(&tcg_accel_ops_type);
+}
+type_init(tcg_accel_ops_register_types);
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 642a7b94a7..e378c2db73 100644
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
 
@@ -124,14 +120,6 @@ static int tcg_init(MachineState *ms)
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
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 594aaf6b49..82fc21f1ce 100644
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
 
+static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
+
+    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+};
+static const TypeInfo xen_accel_ops_type = {
+    .name = ACCEL_OPS_NAME("xen"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = xen_accel_ops_class_init,
+    .abstract = true,
+};
+
 static void xen_type_init(void)
 {
     type_register_static(&xen_accel_type);
+    type_register_static(&xen_accel_ops_type);
 }
 
 type_init(xen_type_init);
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6501164e05..7cc08024e3 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -909,13 +909,14 @@ int main(int argc, char **argv)
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
diff --git a/linux-user/main.c b/linux-user/main.c
index 7ed23d9a29..2e3c169878 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -706,6 +706,7 @@ int main(int argc, char **argv, char **envp)
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
         ac->init_machine(NULL);
+        accel_init_interfaces(ac);
     }
     cpu = cpu_create(cpu_type);
     env = cpu->env_ptr;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 1dc20b9dc3..112eba9d54 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -128,7 +128,7 @@ void hw_error(const char *fmt, ...)
 /*
  * The chosen accelerator is supposed to register this.
  */
-static const CpusAccel *cpus_accel;
+static const AccelOpsClass *cpus_accel;
 
 void cpu_synchronize_all_states(void)
 {
@@ -594,11 +594,11 @@ void cpu_remove_sync(CPUState *cpu)
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
@@ -618,7 +618,7 @@ void qemu_init_vcpu(CPUState *cpu)
         cpu_address_space_init(cpu, 0, "cpu-memory", cpu->memory);
     }
 
-    /* accelerators all implement the CpusAccel interface */
+    /* accelerators all implement the AccelOpsClass */
     g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
     cpus_accel->create_vcpu_thread(cpu);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4f48d03d0d..77d6bd1e5a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1726,7 +1726,8 @@ static bool object_create_early(const char *type, QemuOpts *opts)
         return false;
     }
 
-    /* Allocation of large amounts of memory may delay
+    /*
+     * Allocation of large amounts of memory may delay
      * chardev initialization for too long, and trigger timeouts
      * on software that waits for a monitor socket to be created
      * (e.g. libvirt).
@@ -3497,7 +3498,7 @@ void qemu_init(int argc, char **argv, char **envp)
      *
      * Machine compat properties: object_set_machine_compat_props().
      * Accelerator compat props: object_set_accelerator_compat_props(),
-     * called from configure_accelerator().
+     * called from do_configure_accelerator().
      */
 
     machine_class = MACHINE_GET_CLASS(current_machine);
@@ -3519,6 +3520,8 @@ void qemu_init(int argc, char **argv, char **envp)
     if (cpu_option) {
         current_machine->cpu_type = parse_cpu_option(cpu_option);
     }
+    /* NB: for machine none cpu_type could STILL be NULL here! */
+    accel_init_interfaces(ACCEL_GET_CLASS(current_machine->accelerator));
 
     qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
diff --git a/target/i386/hax/hax-cpus.c b/target/i386/hax/hax-accel-ops.c
similarity index 69%
rename from target/i386/hax/hax-cpus.c
rename to target/i386/hax/hax-accel-ops.c
index f72c85bd49..f66042c61e 100644
--- a/target/i386/hax/hax-cpus.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -26,7 +26,7 @@
 #include "sysemu/cpus.h"
 #include "qemu/guest-random.h"
 
-#include "hax-cpus.h"
+#include "hax-accel-ops.h"
 
 static void *hax_cpu_thread_fn(void *arg)
 {
@@ -74,12 +74,27 @@ static void hax_start_vcpu_thread(CPUState *cpu)
 #endif
 }
 
-const CpusAccel hax_cpus = {
-    .create_vcpu_thread = hax_start_vcpu_thread,
-    .kick_vcpu_thread = hax_kick_vcpu_thread,
+static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
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
+static const TypeInfo hax_accel_ops_type = {
+    .name = ACCEL_OPS_NAME("hax"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = hax_accel_ops_class_init,
+    .abstract = true,
 };
+static void hax_accel_ops_register_types(void)
+{
+    type_register_static(&hax_accel_ops_type);
+}
+type_init(hax_accel_ops_register_types);
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index d7f4bb44a7..bf65ed6fa9 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -33,7 +33,7 @@
 #include "sysemu/runstate.h"
 #include "hw/boards.h"
 
-#include "hax-cpus.h"
+#include "hax-accel-ops.h"
 
 #define DEBUG_HAX 0
 
@@ -364,9 +364,6 @@ static int hax_accel_init(MachineState *ms)
                 !ret ? "working" : "not working",
                 !ret ? "fast virt" : "emulation");
     }
-    if (ret == 0) {
-        cpus_register_accel(&hax_cpus);
-    }
     return ret;
 }
 
diff --git a/target/i386/hax/hax-mem.c b/target/i386/hax/hax-mem.c
index 71e637cf16..35495f5e82 100644
--- a/target/i386/hax/hax-mem.c
+++ b/target/i386/hax/hax-mem.c
@@ -13,7 +13,7 @@
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
 
-#include "hax-cpus.h"
+#include "hax-accel-ops.h"
 #include "qemu/queue.h"
 
 #define DEBUG_HAX_MEM 0
diff --git a/target/i386/hax/hax-posix.c b/target/i386/hax/hax-posix.c
index 735a749d4b..ac1a51096e 100644
--- a/target/i386/hax/hax-posix.c
+++ b/target/i386/hax/hax-posix.c
@@ -15,7 +15,7 @@
 #include <sys/ioctl.h>
 
 #include "sysemu/cpus.h"
-#include "hax-cpus.h"
+#include "hax-accel-ops.h"
 
 hax_fd hax_mod_open(void)
 {
diff --git a/target/i386/hax/hax-windows.c b/target/i386/hax/hax-windows.c
index 6c82dfb54f..59afa213a6 100644
--- a/target/i386/hax/hax-windows.c
+++ b/target/i386/hax/hax-windows.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hax-cpus.h"
+#include "hax-accel-ops.h"
 
 /*
  * return 0 when success, -1 when driver not loaded,
diff --git a/target/i386/hvf/hvf-cpus.c b/target/i386/hvf/hvf-accel-ops.c
similarity index 84%
rename from target/i386/hvf/hvf-cpus.c
rename to target/i386/hvf/hvf-accel-ops.c
index 817b3d7452..cbaad238e0 100644
--- a/target/i386/hvf/hvf-cpus.c
+++ b/target/i386/hvf/hvf-accel-ops.c
@@ -55,7 +55,7 @@
 #include "target/i386/cpu.h"
 #include "qemu/guest-random.h"
 
-#include "hvf-cpus.h"
+#include "hvf-accel-ops.h"
 
 /*
  * The HVF-specific vCPU thread function. This one should only run when the host
@@ -121,11 +121,26 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
-const CpusAccel hvf_cpus = {
-    .create_vcpu_thread = hvf_start_vcpu_thread,
+static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
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
+static const TypeInfo hvf_accel_ops_type = {
+    .name = ACCEL_OPS_NAME("hvf"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = hvf_accel_ops_class_init,
+    .abstract = true,
 };
+static void hvf_accel_ops_register_types(void)
+{
+    type_register_static(&hvf_accel_ops_type);
+}
+type_init(hvf_accel_ops_register_types);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index ffc9efa40f..5b90dcdf88 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -72,7 +72,7 @@
 #include "qemu/accel.h"
 #include "target/i386/cpu.h"
 
-#include "hvf-cpus.h"
+#include "hvf-accel-ops.h"
 
 HVFState *hvf_state;
 
@@ -887,7 +887,6 @@ static int hvf_accel_init(MachineState *ms)
   
     hvf_state = s;
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
-    cpus_register_accel(&hvf_cpus);
     return 0;
 }
 
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index bbec412b6c..0d7533742e 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -32,7 +32,7 @@
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
 
-#include "hvf-cpus.h"
+#include "hvf-accel-ops.h"
 
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr)
diff --git a/target/i386/whpx/whpx-cpus.c b/target/i386/whpx/whpx-accel-ops.c
similarity index 71%
rename from target/i386/whpx/whpx-cpus.c
rename to target/i386/whpx/whpx-accel-ops.c
index f7e69881a3..2b35d6cec4 100644
--- a/target/i386/whpx/whpx-cpus.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -16,7 +16,7 @@
 
 #include "sysemu/whpx.h"
 #include "whpx-internal.h"
-#include "whpx-cpus.h"
+#include "whpx-accel-ops.h"
 
 static void *whpx_cpu_thread_fn(void *arg)
 {
@@ -83,12 +83,27 @@ static void whpx_kick_vcpu_thread(CPUState *cpu)
     }
 }
 
-const CpusAccel whpx_cpus = {
-    .create_vcpu_thread = whpx_start_vcpu_thread,
-    .kick_vcpu_thread = whpx_kick_vcpu_thread,
+static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
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
+static const TypeInfo whpx_accel_ops_type = {
+    .name = ACCEL_OPS_NAME("whpx"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = whpx_accel_ops_class_init,
+    .abstract = true,
 };
+static void whpx_accel_ops_register_types(void)
+{
+    type_register_static(&whpx_accel_ops_type);
+}
+type_init(whpx_accel_ops_register_types);
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index aa5c876138..f0a35df3bb 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -28,8 +28,11 @@
 #include "migration/blocker.h"
 #include <winerror.h>
 
-#include "whpx-cpus.h"
 #include "whpx-internal.h"
+#include "whpx-accel-ops.h"
+
+#include <WinHvPlatform.h>
+#include <WinHvEmulation.h>
 
 #define HYPERV_APIC_BUS_FREQUENCY      (200000000ULL)
 
@@ -1846,8 +1849,6 @@ static int whpx_accel_init(MachineState *ms)
 
     whpx_memory_init();
 
-    cpus_register_accel(&whpx_cpus);
-
     printf("Windows Hypervisor Platform accelerator is operational\n");
     return 0;
 
diff --git a/MAINTAINERS b/MAINTAINERS
index a37aa11870..fc611640ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -439,7 +439,8 @@ M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/accel.h
-F: accel/accel.c
+F: include/sysemu/accel-ops.h
+F: accel/accel-*.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
 
diff --git a/accel/kvm/meson.build b/accel/kvm/meson.build
index 7e9dafe24c..8d219bea50 100644
--- a/accel/kvm/meson.build
+++ b/accel/kvm/meson.build
@@ -1,7 +1,7 @@
 kvm_ss = ss.source_set()
 kvm_ss.add(files(
   'kvm-all.c',
-  'kvm-cpus.c',
+  'kvm-accel-ops.c',
 ))
 kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 424d9bb1fc..1236ac7b91 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -15,8 +15,8 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
-  'tcg-cpus.c',
-  'tcg-cpus-mttcg.c',
-  'tcg-cpus-icount.c',
-  'tcg-cpus-rr.c'
+  'tcg-accel-ops.c',
+  'tcg-accel-ops-mttcg.c',
+  'tcg-accel-ops-icount.c',
+  'tcg-accel-ops-rr.c'
 ))
diff --git a/target/i386/hax/meson.build b/target/i386/hax/meson.build
index 77ea431b30..d6c520fb6b 100644
--- a/target/i386/hax/meson.build
+++ b/target/i386/hax/meson.build
@@ -1,7 +1,7 @@
 i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
   'hax-all.c',
   'hax-mem.c',
-  'hax-cpus.c',
+  'hax-accel-ops.c',
 ))
 i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
 i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.build
index 409c9a3f14..e9eb5a5da8 100644
--- a/target/i386/hvf/meson.build
+++ b/target/i386/hvf/meson.build
@@ -1,6 +1,6 @@
 i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
   'hvf.c',
-  'hvf-cpus.c',
+  'hvf-accel-ops.c',
   'x86.c',
   'x86_cpuid.c',
   'x86_decode.c',
diff --git a/target/i386/whpx/meson.build b/target/i386/whpx/meson.build
index d8aa683999..95fc31eb81 100644
--- a/target/i386/whpx/meson.build
+++ b/target/i386/whpx/meson.build
@@ -1,5 +1,5 @@
 i386_softmmu_ss.add(when: 'CONFIG_WHPX', if_true: files(
   'whpx-all.c',
   'whpx-apic.c',
-  'whpx-cpus.c',
+  'whpx-accel-ops.c',
 ))
-- 
2.26.2


