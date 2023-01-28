Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF067F634
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 09:21:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLgKm-0000Ki-O8; Sat, 28 Jan 2023 03:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5966041548699f31a8b8+7097+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pLgJS-0005v9-Jr
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:52 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5966041548699f31a8b8+7097+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pLgJK-0007oz-Ag
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tUu26qPjMvaoJgnU8Wve0V6uXvs2qBIsljApL7tO9II=; b=Ag8BDh6lryJGq3yW/7xYdrh9oX
 2eqOYjgIUP9A3JUK+g4RvQXJ/+ueAY374sfBTzc6kLfFssKhxEIYZvgNmuhjq0q9/8yq0TssTFK4l
 d4rJjTqsJHYTPeOVnCdPicP93CadugxO6VeorS71Yrrrf/QbZVybpZIQb+nvgizlwYQi+LdFkaVNP
 4oPMuIgL9t0xCF6R/5RaEjGhE+wOA5UbyJHT9j87uDsfK91cmoOB0EON7v8bOfKb7Wn5rC9v892gY
 zdEIiMIG3CRUjbQXqWrI1WmlzM6xw1JPDf5898AMag3MOe/dJZbOTzUrfGWM6FIUa8o8cLGGn+fjH
 tf6jbf5g==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pLgIx-008RKX-5Y; Sat, 28 Jan 2023 08:11:19 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pLgIx-006mJF-0a; Sat, 28 Jan 2023 08:11:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v9 24/58] i386/xen: implement HVMOP_set_evtchn_upcall_vector
Date: Sat, 28 Jan 2023 08:10:39 +0000
Message-Id: <20230128081113.1615111-25-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128081113.1615111-1-dwmw2@infradead.org>
References: <20230128081113.1615111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+5966041548699f31a8b8+7097+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ankur Arora <ankur.a.arora@oracle.com>

The HVMOP_set_evtchn_upcall_vector hypercall sets the per-vCPU upcall
vector, to be delivered to the local APIC just like an MSI (with an EOI).

This takes precedence over the system-wide delivery method set by the
HVMOP_set_param hypercall with HVM_PARAM_CALLBACK_IRQ. It's used by
Windows and Xen (PV shim) guests but normally not by Linux.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Rework for upstream kernel changes and split from HVMOP_set_param]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/cpu.h            |  1 +
 target/i386/kvm/trace-events |  1 +
 target/i386/kvm/xen-emu.c    | 84 ++++++++++++++++++++++++++++++++++--
 target/i386/machine.c        |  1 +
 4 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index bf44a87ddb..938a1b9c8b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1792,6 +1792,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_info_default_gpa;
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
+    uint8_t xen_vcpu_callback_vector;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index a840e0333d..b365a8e8e2 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -11,3 +11,4 @@ kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1
 kvm_xen_soft_reset(void) ""
 kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
 kvm_xen_set_vcpu_attr(int cpu, int type, uint64_t gpa) "vcpu attr cpu %d type %d gpa 0x%" PRIx64
+kvm_xen_set_vcpu_callback(int cpu, int vector) "callback vcpu %d vector %d"
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 7ef3d8e520..709f5d52cb 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -27,6 +27,7 @@
 #include "standard-headers/xen/sched.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
+#include "standard-headers/xen/hvm/params.h"
 #include "standard-headers/xen/vcpu.h"
 #include "standard-headers/xen/event_channel.h"
 
@@ -193,7 +194,8 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
             fi.submap |= 1 << XENFEAT_writable_page_tables |
                          1 << XENFEAT_writable_descriptor_tables |
                          1 << XENFEAT_auto_translated_physmap |
-                         1 << XENFEAT_supervisor_mode_kernel;
+                         1 << XENFEAT_supervisor_mode_kernel |
+                         1 << XENFEAT_hvm_callback_vector;
         }
 
         err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
@@ -220,6 +222,31 @@ static int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa)
     return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &xhsi);
 }
 
+static int kvm_xen_set_vcpu_callback_vector(CPUState *cs)
+{
+    uint8_t vector = X86_CPU(cs)->env.xen_vcpu_callback_vector;
+    struct kvm_xen_vcpu_attr xva;
+
+    xva.type = KVM_XEN_VCPU_ATTR_TYPE_UPCALL_VECTOR;
+    xva.u.vector = vector;
+
+    trace_kvm_xen_set_vcpu_callback(cs->cpu_index, vector);
+
+    return kvm_vcpu_ioctl(cs, KVM_XEN_HVM_SET_ATTR, &xva);
+}
+
+static void do_set_vcpu_callback_vector(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_callback_vector = data.host_int;
+
+    if (kvm_xen_has_cap(EVTCHN_SEND)) {
+        kvm_xen_set_vcpu_callback_vector(cs);
+    }
+}
+
 static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -276,12 +303,16 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
     env->xen_vcpu_runstate_gpa = INVALID_GPA;
+    env->xen_vcpu_callback_vector = 0;
 
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
                           INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
                           INVALID_GPA);
+    if (kvm_xen_has_cap(EVTCHN_SEND)) {
+        kvm_xen_set_vcpu_callback_vector(cs);
+    }
 
 }
 
@@ -458,17 +489,53 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
+                                              X86CPU *cpu, uint64_t arg)
+{
+    struct xen_hvm_evtchn_upcall_vector up;
+    CPUState *target_cs;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(up) == 8);
+
+    if (kvm_copy_from_gva(CPU(cpu), arg, &up, sizeof(up))) {
+        return -EFAULT;
+    }
+
+    if (up.vector < 0x10) {
+        return -EINVAL;
+    }
+
+    target_cs = qemu_get_cpu(up.vcpu);
+    if (!target_cs) {
+        return -EINVAL;
+    }
+
+    async_run_on_cpu(target_cs, do_set_vcpu_callback_vector,
+                     RUN_ON_CPU_HOST_INT(up.vector));
+    return 0;
+}
+
 static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                  int cmd, uint64_t arg)
 {
+    int ret = -ENOSYS;
     switch (cmd) {
+    case HVMOP_set_evtchn_upcall_vector:
+        ret = kvm_xen_hcall_evtchn_upcall_vector(exit, cpu,
+                                                 exit->u.hcall.params[0]);
+        break;
+
     case HVMOP_pagetable_dying:
-        exit->u.hcall.result = -ENOSYS;
-        return true;
+        ret = -ENOSYS;
+        break;
 
     default:
         return false;
     }
+
+    exit->u.hcall.result = ret;
+    return true;
 }
 
 static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
@@ -812,6 +879,17 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    if (!kvm_xen_has_cap(EVTCHN_SEND)) {
+        return 0;
+    }
+
+    if (env->xen_vcpu_callback_vector) {
+        ret = kvm_xen_set_vcpu_callback_vector(cs);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     return 0;
 }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 3f3d436aaa..a4874eda90 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1274,6 +1274,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_runstate_gpa, X86CPU),
+        VMSTATE_UINT8(env.xen_vcpu_callback_vector, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.39.0


