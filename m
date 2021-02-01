Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C856330A541
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:23:13 +0100 (CET)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WMS-0006VX-RR
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9R-0000uO-PM
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:55902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9C-0005rn-3c
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D32ADB008;
 Mon,  1 Feb 2021 10:09:18 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 23/23] accel-cpu: make cpu_realizefn return a bool
Date: Mon,  1 Feb 2021 11:09:03 +0100
Message-Id: <20210201100903.17309-24-cfontana@suse.de>
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

overall, all devices' realize functions take an Error **errp, but return void.

hw/core/qdev.c code, which realizes devices, therefore does:

local_err = NULL;
dc->realize(dev, &local_err);
if (local_err != NULL) {
    goto fail;
}

However, we can improve at least accel_cpu to return a meaningful bool value.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/hw/core/accel-cpu.h |  2 +-
 include/qemu/accel.h        |  2 +-
 target/i386/host-cpu.h      |  2 +-
 accel/accel-common.c        |  6 +++---
 cpu.c                       |  5 +++--
 target/i386/host-cpu.c      | 25 ++++++++++++++-----------
 target/i386/kvm/kvm-cpu.c   |  4 ++--
 target/i386/tcg/tcg-cpu.c   |  6 ++++--
 8 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
index 24a6697412..5dbfd79955 100644
--- a/include/hw/core/accel-cpu.h
+++ b/include/hw/core/accel-cpu.h
@@ -32,7 +32,7 @@ typedef struct AccelCPUClass {
 
     void (*cpu_class_init)(CPUClass *cc);
     void (*cpu_instance_init)(CPUState *cpu);
-    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
+    bool (*cpu_realizefn)(CPUState *cpu, Error **errp);
 } AccelCPUClass;
 
 #endif /* ACCEL_CPU_H */
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index da0c8ab523..4f4c283f6f 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -89,6 +89,6 @@ void accel_cpu_instance_init(CPUState *cpu);
  * @cpu: The CPU that needs to call accel-specific cpu realization.
  * @errp: currently unused.
  */
-void accel_cpu_realizefn(CPUState *cpu, Error **errp);
+bool accel_cpu_realizefn(CPUState *cpu, Error **errp);
 
 #endif /* QEMU_ACCEL_H */
diff --git a/target/i386/host-cpu.h b/target/i386/host-cpu.h
index b47bc0943f..6a9bc918ba 100644
--- a/target/i386/host-cpu.h
+++ b/target/i386/host-cpu.h
@@ -12,7 +12,7 @@
 
 void host_cpu_instance_init(X86CPU *cpu);
 void host_cpu_max_instance_init(X86CPU *cpu);
-void host_cpu_realizefn(CPUState *cs, Error **errp);
+bool host_cpu_realizefn(CPUState *cs, Error **errp);
 
 void host_cpu_vendor_fms(char *vendor, int *family, int *model, int *stepping);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 0f6fb4fb66..d77c09d7b5 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -98,14 +98,14 @@ void accel_cpu_instance_init(CPUState *cpu)
     }
 }
 
-void accel_cpu_realizefn(CPUState *cpu, Error **errp)
+bool accel_cpu_realizefn(CPUState *cpu, Error **errp)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (cc->accel_cpu && cc->accel_cpu->cpu_realizefn) {
-        /* NB: errp parameter is unused currently */
-        cc->accel_cpu->cpu_realizefn(cpu, errp);
+        return cc->accel_cpu->cpu_realizefn(cpu, errp);
     }
+    return true;
 }
 
 static const TypeInfo accel_cpu_type = {
diff --git a/cpu.c b/cpu.c
index 25e6fbfa2c..34a0484bf4 100644
--- a/cpu.c
+++ b/cpu.c
@@ -130,8 +130,9 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     cpu_list_add(cpu);
-    accel_cpu_realizefn(cpu, errp);
-
+    if (!accel_cpu_realizefn(cpu, errp)) {
+        return;
+    }
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
index 9cfe56ce41..4ea9e354ea 100644
--- a/target/i386/host-cpu.c
+++ b/target/i386/host-cpu.c
@@ -50,7 +50,7 @@ static void host_cpu_enable_cpu_pm(X86CPU *cpu)
     env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
 }
 
-static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
+static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu)
 {
     uint32_t host_phys_bits = host_cpu_phys_bits();
     uint32_t phys_bits = cpu->phys_bits;
@@ -77,18 +77,10 @@ static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
         }
     }
 
-    if (phys_bits &&
-        (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
-         phys_bits < 32)) {
-        error_setg(errp, "phys-bits should be between 32 and %u "
-                   " (but is %u)",
-                   TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);
-    }
-
     return phys_bits;
 }
 
-void host_cpu_realizefn(CPUState *cs, Error **errp)
+bool host_cpu_realizefn(CPUState *cs, Error **errp)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -97,8 +89,19 @@ void host_cpu_realizefn(CPUState *cs, Error **errp)
         host_cpu_enable_cpu_pm(cpu);
     }
     if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
-        cpu->phys_bits = host_cpu_adjust_phys_bits(cpu, errp);
+        uint32_t phys_bits = host_cpu_adjust_phys_bits(cpu);
+
+        if (phys_bits &&
+            (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
+             phys_bits < 32)) {
+            error_setg(errp, "phys-bits should be between 32 and %u "
+                       " (but is %u)",
+                       TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);
+            return false;
+        }
+        cpu->phys_bits = phys_bits;
     }
+    return true;
 }
 
 #define CPUID_MODEL_ID_SZ 48
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index c23bbe6c50..c660ad4293 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -18,7 +18,7 @@
 #include "kvm_i386.h"
 #include "hw/core/accel-cpu.h"
 
-static void kvm_cpu_realizefn(CPUState *cs, Error **errp)
+static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -41,7 +41,7 @@ static void kvm_cpu_realizefn(CPUState *cs, Error **errp)
                                                    MSR_IA32_UCODE_REV);
         }
     }
-    host_cpu_realizefn(cs, errp);
+    return host_cpu_realizefn(cs, errp);
 }
 
 /*
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 1d3d6d1c6a..23e1f5f0c3 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -96,7 +96,7 @@ static void x86_cpu_machine_done(Notifier *n, void *unused)
     }
 }
 
-static void tcg_cpu_realizefn(CPUState *cs, Error **errp)
+static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
 {
     X86CPU *cpu = X86_CPU(cs);
 
@@ -132,12 +132,14 @@ static void tcg_cpu_realizefn(CPUState *cs, Error **errp)
     /* ... SMRAM with higher priority, linked from /machine/smram.  */
     cpu->machine_done.notify = x86_cpu_machine_done;
     qemu_add_machine_init_done_notifier(&cpu->machine_done);
+    return true;
 }
 
 #else /* CONFIG_USER_ONLY */
 
-static void tcg_cpu_realizefn(CPUState *cs, Error **errp)
+static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
 {
+    return true;
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.26.2


