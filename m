Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C964E55B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:47:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ynj-0005QO-0I; Thu, 15 Dec 2022 19:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5ynE-0005F6-EN
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5yn8-0006aO-5H
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=EsPQIX2Hnxlr+aH9qp05RJWdYjbfQPNm1bwxx8s6vJ0=; b=uGljoItSsrvfmDcof/3u8rDylY
 v1fSFzqiMW/pB4zT2v7nxXnE2Z4QNHMpyxi4Vkhr7HzPB2U8jmrFEOQ0EzjKtOGsPnBuIG8qiKOvf
 IsTjRmlGfWWMi6v4TaTRfNLwS9n5DXwyqcVA4Le72JalCbcyoAsdO1AyNeAEhG0qsbR40CFwpP2Mw
 JsGdWXiMhPnSHDiGus8kjJZpBsV6xnD8w1kA0Rr77CKs9XbMs+GFO2GIB8oOep+b6rcFuPd3HQIBj
 LTzZFwk+VW5I/kw50VqGjfv3brzQaWW4S3ektYIoR1LAJZGuWJJh93od2dkepuv0Rfav5Wxh2nLQr
 YuTUmYWQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5yn6-00EvV2-6x; Fri, 16 Dec 2022 00:41:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cP6-64; Fri, 16 Dec 2022 00:41:22 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v3 21/38] i386/xen: implement
 HVMOP_set_evtchn_upcall_vector
Date: Fri, 16 Dec 2022 00:41:00 +0000
Message-Id: <20221216004117.862106-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
---
 target/i386/cpu.h            |  1 +
 target/i386/kvm/kvm.c        |  7 ++++
 target/i386/kvm/trace-events |  1 +
 target/i386/kvm/xen-emu.c    | 67 +++++++++++++++++++++++++++++++++---
 target/i386/kvm/xen-emu.h    |  1 +
 target/i386/machine.c        |  4 ++-
 6 files changed, 76 insertions(+), 5 deletions(-)

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
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 8aee95d4c1..cbf41d6f81 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4757,6 +4757,13 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
                 return ret;
             }
         }
+
+        if (x86_cpu->env.xen_vcpu_callback_vector) {
+            ret = kvm_xen_set_vcpu_callback_vector(cpu);
+            if (ret < 0) {
+                return ret;
+            }
+        }
     }
 #endif
 
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index 14e54dfca5..6133f6dd9e 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -10,3 +10,4 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
 kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
 kvm_xen_set_vcpu_attr(int cpu, int type, uint64_t gpa) "vcpu attr cpu %d type %d gpa 0x%" PRIx64
+kvm_xen_set_vcpu_callback(int cpu, int vector) "callback vcpu %d vector %d"
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 1297b37ee8..d35609563c 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -23,6 +23,7 @@
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
+#include "standard-headers/xen/hvm/params.h"
 #include "standard-headers/xen/vcpu.h"
 
 #include "xen-compat.h"
@@ -145,7 +146,8 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
             fi.submap |= 1 << XENFEAT_writable_page_tables |
                          1 << XENFEAT_writable_descriptor_tables |
                          1 << XENFEAT_auto_translated_physmap |
-                         1 << XENFEAT_supervisor_mode_kernel;
+                         1 << XENFEAT_supervisor_mode_kernel |
+                         1 << XENFEAT_hvm_callback_vector;
         }
 
         err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
@@ -172,6 +174,29 @@ int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa)
     return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &xhsi);
 }
 
+int kvm_xen_set_vcpu_callback_vector(CPUState *cs)
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
+    kvm_xen_set_vcpu_callback_vector(cs);
+}
+
 static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -385,17 +410,51 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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
+    async_run_on_cpu(target_cs, do_set_vcpu_callback_vector, RUN_ON_CPU_HOST_INT(up.vector));
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
     case HVMOP_pagetable_dying:
-            exit->u.hcall.result = -ENOSYS;
-            return true;
+        ret = -ENOSYS;
+        break;
 
     default:
-            return false;
+        return false;
     }
+
+    exit->u.hcall.result = ret;
+    return true;
 }
 
 static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 20da62d39f..58e4748d80 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -26,5 +26,6 @@
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
 int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa);
+int kvm_xen_set_vcpu_callback_vector(CPUState *cs);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 6a510e5cbd..09e13cf716 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1265,7 +1265,8 @@ static bool xen_vcpu_needed(void *opaque)
     return (env->xen_vcpu_info_gpa != UINT64_MAX ||
             env->xen_vcpu_info_default_gpa != UINT64_MAX ||
             env->xen_vcpu_time_info_gpa != UINT64_MAX ||
-            env->xen_vcpu_runstate_gpa != UINT64_MAX);
+            env->xen_vcpu_runstate_gpa != UINT64_MAX ||
+            env->xen_vcpu_callback_vector != 0);
 }
 
 static const VMStateDescription vmstate_xen_vcpu = {
@@ -1278,6 +1279,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_runstate_gpa, X86CPU),
+        VMSTATE_UINT8(env.xen_vcpu_callback_vector, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.35.3


