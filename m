Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B362CFBFE
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:26:17 +0100 (CET)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klaO0-0001Rp-Qv
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaEA-000191-Sr
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:16:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:49120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaE4-0000GF-JW
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:16:05 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E223B1C3;
 Sat,  5 Dec 2020 16:15:42 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v8 23/27] accel: introduce AccelCPUClass extending CPUClass
Date: Sat,  5 Dec 2020 17:15:14 +0100
Message-Id: <20201205161518.14365-24-cfontana@suse.de>
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

add a new optional interface to CPUClass,
which allows accelerators to extend the CPUClass
with additional accelerator-specific initializations.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 MAINTAINERS                 |  1 +
 accel/accel-common.c        | 44 +++++++++++++++++++++++++++++++++++++
 include/hw/core/accel-cpu.h | 25 +++++++++++++++++++++
 include/hw/core/cpu.h       | 13 +++++++++++
 4 files changed, 83 insertions(+)
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
index 6b59873419..ef73c761fc 100644
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
 void accel_init_interfaces(AccelClass *ac)
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
index f438abb785..fee3a68194 100644
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
-- 
2.26.2


