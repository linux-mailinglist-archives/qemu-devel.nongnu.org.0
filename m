Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F9301545
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 13:47:46 +0100 (CET)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3IKP-0008Ao-W2
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 07:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l3Hxy-0003a1-93
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 07:24:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:59790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l3Hxv-000772-F6
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 07:24:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8EF3AF30;
 Sat, 23 Jan 2021 12:24:18 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v13 22/22] accel: introduce new accessor functions
Date: Sat, 23 Jan 2021 13:23:59 +0100
Message-Id: <20210123122359.4147-23-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210123122359.4147-1-cfontana@suse.de>
References: <20210123122359.4147-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

avoid open coding the accesses to cpu->accel_cpu interfaces,
and instead introduce:

accel_cpu_instance_init,
accel_cpu_realizefn

to be used by the targets/ initfn code,
and by cpu_exec_realizefn respectively.

Add warnings about the use of target-specific headers.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/hw/core/accel-cpu.h | 11 +++++++----
 include/qemu/accel.h        | 13 +++++++++++++
 accel/accel-common.c        | 19 +++++++++++++++++++
 cpu.c                       |  6 +-----
 target/i386/cpu.c           |  9 ++-------
 5 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 246b3e2fcb..2edecd026a 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -1,5 +1,6 @@
 /*
  * Accelerator interface, specializes CPUClass
+ * This header is used only by target-specific code.
  *
  * Copyright 2020 SUSE LLC
  *
@@ -11,10 +12,12 @@
 #define ACCEL_CPU_H
 
 /*
- * these defines cannot be in cpu.h, because we are using
- * CPU_RESOLVING_TYPE here.
- * Use this header to define your accelerator-specific
- * cpu-specific accelerator interfaces.
+ * This header is used to define new accelerator-specific target-specific
+ * accelerator cpu subclasses.
+ * It uses CPU_RESOLVING_TYPE, so this is clearly target-specific.
+ *
+ * Do not try to use for any other purpose than the implementation of new
+ * subclasses in target/, or the accel implementation itself in accel/
  */
 
 #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index b9d6d69eb8..da0c8ab523 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -78,4 +78,17 @@ int accel_init_machine(AccelState *accel, MachineState *ms);
 void accel_setup_post(MachineState *ms);
 #endif /* !CONFIG_USER_ONLY */
 
+/**
+ * accel_cpu_instance_init:
+ * @cpu: The CPU that needs to do accel-specific object initializations.
+ */
+void accel_cpu_instance_init(CPUState *cpu);
+
+/**
+ * accel_cpu_realizefn:
+ * @cpu: The CPU that needs to call accel-specific cpu realization.
+ * @errp: currently unused.
+ */
+void accel_cpu_realizefn(CPUState *cpu, Error **errp);
+
 #endif /* QEMU_ACCEL_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 9901b0531c..0f6fb4fb66 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -89,6 +89,25 @@ void accel_init_interfaces(AccelClass *ac)
     accel_init_cpu_interfaces(ac);
 }
 
+void accel_cpu_instance_init(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->accel_cpu && cc->accel_cpu->cpu_instance_init) {
+        cc->accel_cpu->cpu_instance_init(cpu);
+    }
+}
+
+void accel_cpu_realizefn(CPUState *cpu, Error **errp)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->accel_cpu && cc->accel_cpu->cpu_realizefn) {
+        /* NB: errp parameter is unused currently */
+        cc->accel_cpu->cpu_realizefn(cpu, errp);
+    }
+}
+
 static const TypeInfo accel_cpu_type = {
     .name = TYPE_ACCEL_CPU,
     .parent = TYPE_OBJECT,
diff --git a/cpu.c b/cpu.c
index ba5d272c1e..25e6fbfa2c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -130,11 +130,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     cpu_list_add(cpu);
-
-    if (cc->accel_cpu) {
-        /* NB: errp parameter is unused currently */
-        cc->accel_cpu->cpu_realizefn(cpu, errp);
-    }
+    accel_cpu_realizefn(cpu, errp);
 
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 83c474e270..c79123811f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -28,7 +28,6 @@
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
-#include "hw/core/accel-cpu.h"
 #include "sysemu/xen.h"
 #include "sysemu/whpx.h"
 #include "kvm/kvm_i386.h"
@@ -6680,8 +6679,6 @@ static void x86_cpu_initfn(Object *obj)
 {
     X86CPU *cpu = X86_CPU(obj);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
-    CPUClass *cc = CPU_CLASS(xcc);
-
     CPUX86State *env = &cpu->env;
 
     env->nr_dies = 1;
@@ -6730,10 +6727,8 @@ static void x86_cpu_initfn(Object *obj)
         x86_cpu_load_model(cpu, xcc->model);
     }
 
-    /* if required, do the accelerator-specific cpu initialization */
-    if (cc->accel_cpu) {
-        cc->accel_cpu->cpu_instance_init(CPU(obj));
-    }
+    /* if required, do accelerator-specific cpu initializations */
+    accel_cpu_instance_init(CPU(obj));
 }
 
 static int64_t x86_cpu_get_arch_id(CPUState *cs)
-- 
2.26.2


