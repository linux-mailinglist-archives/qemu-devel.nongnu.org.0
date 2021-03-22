Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB6344630
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:49:53 +0100 (CET)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKwK-0006pM-7V
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKbg-0001PY-LZ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:28:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:45488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKba-0001of-0X
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:28:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D32C5AECE;
 Mon, 22 Mar 2021 13:28:14 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v28 23/23] XXX RFC accel: add cpu_reset
Date: Mon, 22 Mar 2021 14:28:00 +0100
Message-Id: <20210322132800.7470-25-cfontana@suse.de>
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

XXX this surprisingly works without moving cpu_reset() to a
specific_ss module, even though

accel-common.c is specific_ss,
hw/core/cpu.c  is common_ss.

How come the call to accel_reset_cpu works, and passes all tests?

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/hw/core/accel-cpu.h | 2 ++
 include/qemu/accel.h        | 6 ++++++
 accel/accel-common.c        | 9 +++++++++
 hw/core/cpu.c               | 3 ++-
 target/i386/cpu.c           | 4 ----
 target/i386/kvm/kvm-cpu.c   | 6 ++++++
 6 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 5dbfd79955..700a5bd266 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -33,6 +33,8 @@ typedef struct AccelCPUClass {
     void (*cpu_class_init)(CPUClass *cc);
     void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_realizefn)(CPUState *cpu, Error **errp);
+    void (*cpu_reset)(CPUState *cpu);
+
 } AccelCPUClass;
 
 #endif /* ACCEL_CPU_H */
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6f..8d3a15b916 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -91,4 +91,10 @@ void accel_cpu_instance_init(CPUState *cpu);
  */
 bool accel_cpu_realizefn(CPUState *cpu, Error **errp);
 
+/**
+ * accel_cpu_reset:
+ * @cpu: The CPU that needs to call accel-specific reset.
+ */
+void accel_cpu_reset(CPUState *cpu);
+
 #endif /* QEMU_ACCEL_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index cf07f78421..3331a9dcfd 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -121,6 +121,15 @@ bool accel_cpu_realizefn(CPUState *cpu, Error **errp)
     return true;
 }
 
+void accel_cpu_reset(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->accel_cpu && cc->accel_cpu->cpu_reset) {
+        cc->accel_cpu->cpu_reset(cpu);
+    }
+}
+
 static const TypeInfo accel_cpu_type = {
     .name = TYPE_ACCEL_CPU,
     .parent = TYPE_OBJECT,
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07d..590a0d934f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -35,6 +35,7 @@
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
 #include "sysemu/hw_accel.h"
+#include "qemu/accel.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
@@ -230,7 +231,7 @@ void cpu_dump_statistics(CPUState *cpu, int flags)
 void cpu_reset(CPUState *cpu)
 {
     device_cold_reset(DEVICE(cpu));
-
+    accel_cpu_reset(cpu);
     trace_guest_cpu_reset(cpu);
 }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 36fd4bb0ba..634845c473 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5780,10 +5780,6 @@ static void x86_cpu_reset(DeviceState *dev)
     apic_designate_bsp(cpu->apic_state, s->cpu_index == 0);
 
     s->halted = !cpu_is_bsp(cpu);
-
-    if (kvm_enabled()) {
-        kvm_arch_reset_vcpu(cpu);
-    }
 #endif
 }
 
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index c660ad4293..ffdc9afddb 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -130,12 +130,18 @@ static void kvm_cpu_instance_init(CPUState *cs)
     }
 }
 
+static void kvm_cpu_reset(CPUState *cpu)
+{
+    kvm_arch_reset_vcpu(X86_CPU(cpu));
+}
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
     acc->cpu_realizefn = kvm_cpu_realizefn;
     acc->cpu_instance_init = kvm_cpu_instance_init;
+    acc->cpu_reset = kvm_cpu_reset;
 }
 static const TypeInfo kvm_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("kvm"),
-- 
2.26.2


