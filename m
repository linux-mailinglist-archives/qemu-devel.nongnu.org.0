Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44919642EDD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:33:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKS-0007rV-NK; Mon, 05 Dec 2022 12:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKM-0007qK-1B
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:26 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PJ-O8
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fSC47nmyjrTSaGKQHjkxgQzXzg+x00q1Wt6J8R7Jcvc=; b=UlnGxCIgX30Q/FOHpvyBDxPkUB
 PwBKAs0xivDjZcIokRyhBmgRO0vK+Xy10a4XQGjkTtYTqyHjlgd4N9gv9ts7J6nLssbNMAz1SZKzz
 64Q5SL+gR5WWwTdG5maq1gvZsx6QxTpd4H0elietFLe7xKBcPlB/R4lNT31AaBwfo9tNwWaanqIrp
 t/wnSyS/HmAqwv6UAjnADw9tofOossT6lyIXCd0Pn+K/DWprdln3EIiNj2k+I80VdsTKbf+y43Phk
 N7uBEOgZ7FWR8QSV1hllwYZWiyNhbevDNyK9xbuJ5U11VxbegVmqhhzIXrv87/61uaPrE8D52mJMP
 0XKaKmPg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJp-007fzS-35; Mon, 05 Dec 2022 17:31:53 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKr-Qm; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 19/21] i386/xen: handle event channel upcall related
 hypercalls
Date: Mon,  5 Dec 2022 17:31:35 +0000
Message-Id: <20221205173137.607044-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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

Handle both HVMOP_set_param(.index = HVM_PARAM_CALLBACK_IRQ) and
HVMOP_set_evtchn_upcall_vector which set the system-wide and per-vCPU
upcall vectors respectively.

The former injects the vector directly to the vCPU, which KVM handles
for us when entering the vCPU with vcpu_info->evtchn_upcall_pending
set. The latter is injected to the local APIC just like an MSI.

The GSI and PCI_INTX delivery methods are not supported. yet; those
need to simulate a level-triggered event on the I/OAPIC.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Rework for upstream kernel changes in evtchn handling]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/kvm.c    |   1 +
 target/i386/trace-events |   1 +
 target/i386/xen.c        | 132 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 129 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6396d11f1e..8a381c2073 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -36,6 +36,7 @@
 #include "hyperv.h"
 #include "hyperv-proto.h"
 #include "xen.h"
+#include "hw/xen/xen.h"
 
 #include "exec/gdbstub.h"
 #include "qemu/host-utils.h"
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 1c6c44f291..3ff3ec6f61 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -16,3 +16,4 @@ kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIu64
 kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
 kvm_xen_set_vcpu_attr(int cpu, int type, uint64_t gpa) "vcpu attr cpu %d type %d gpa 0x%" PRIu64
+kvm_xen_set_vcpu_callback(int cpu, int vector) "callback vcpu %d vector %d"
diff --git a/target/i386/xen.c b/target/i386/xen.c
index 6f0c46c018..21146204e1 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -19,6 +19,7 @@
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
+#include "standard-headers/xen/hvm/params.h"
 #include "standard-headers/xen/vcpu.h"
 
 #define PAGE_OFFSET    0xffffffff80000000UL
@@ -34,6 +35,8 @@
 #define HCALL_ERR      0
 #endif
 
+static QemuMutex xen_global_mutex;
+
 static void *gpa_to_hva(uint64_t gpa)
 {
     MemoryRegionSection mrs;
@@ -93,6 +96,8 @@ int kvm_xen_init(KVMState *s, uint32_t xen_version)
         return ret;
     }
 
+    qemu_mutex_init(&xen_global_mutex);
+
     return 0;
 }
 
@@ -124,7 +129,8 @@ static int kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
              *   XENFEAT_memory_op_vnode_supported
              *   XENFEAT_writable_page_tables
              */
-            fi->submap = (1U << XENFEAT_auto_translated_physmap);
+            fi->submap = (1U << XENFEAT_auto_translated_physmap) |
+                         (1U << XENFEAT_hvm_callback_vector);
             break;
          }
     }
@@ -200,18 +206,131 @@ static int kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
     return err ? HCALL_ERR : 0;
 }
 
-static int kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
+static void xen_vcpu_set_callback(CPUState *cs, run_on_cpu_data data)
+{
+    struct kvm_xen_vcpu_attr xvuv;
+    uint8_t vector = data.host_int;
+    int err;
+
+    xvuv.type = KVM_XEN_VCPU_ATTR_TYPE_UPCALL_VECTOR;
+    xvuv.u.vector = vector;
+    err = kvm_vcpu_ioctl(cs, KVM_XEN_HVM_SET_ATTR, &xvuv);
+    if (err < 0) {
+        return;
+    }
+
+    trace_kvm_xen_set_vcpu_callback(cs->cpu_index, vector);
+}
+
+static int handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
+                            uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    struct xen_hvm_param *hp;
+    int err = 0, via;
+
+    hp = gva_to_hva(cs, arg);
+    if (!hp) {
+        err = -EFAULT;
+        goto out;
+    }
+
+    if (hp->domid != DOMID_SELF) {
+        err = -EINVAL;
+        goto out;
+    }
+
+#define CALLBACK_VIA_TYPE_SHIFT       56
+#define CALLBACK_VIA_TYPE_GSI         0x0
+#define CALLBACK_VIA_TYPE_PCI_INTX    0x1
+#define CALLBACK_VIA_TYPE_VECTOR      0x2
+#define CALLBACK_VIA_TYPE_EVTCHN      0x3
+    switch (hp->index) {
+    case HVM_PARAM_CALLBACK_IRQ:
+        via = hp->value >> CALLBACK_VIA_TYPE_SHIFT;
+        if (via == CALLBACK_VIA_TYPE_GSI ||
+            via == CALLBACK_VIA_TYPE_PCI_INTX) {
+            err = -ENOSYS;
+            goto out;
+        } else if (via == CALLBACK_VIA_TYPE_VECTOR) {
+            struct kvm_xen_hvm_attr xhuv;
+            xhuv.type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR;
+            xhuv.u.vector = (uint8_t)hp->value;
+            err = kvm_vm_ioctl(cs->kvm_state, KVM_XEN_HVM_SET_ATTR, &xhuv);
+        }
+        break;
+    default:
+        err = -ENOSYS;
+        goto out;
+    }
+
+
+out:
+    exit->u.hcall.result = err;
+    return err ? HCALL_ERR : 0;
+}
+
+static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
+                                              X86CPU *cpu, uint64_t arg)
+{
+    struct xen_hvm_evtchn_upcall_vector *up;
+    CPUState *target_cs;
+    int err = 0, vector;
+
+    up = gva_to_hva(CPU(cpu), arg);
+    if (!up) {
+        err = -EFAULT;
+        goto out;
+    }
+
+    vector = up->vector;
+    if (vector < 0x10) {
+        err = -EINVAL;
+        goto out;
+    }
+
+    target_cs = qemu_get_cpu(up->vcpu);
+    if (!target_cs) {
+        err = -EINVAL;
+        goto out;
+    }
+    if (X86_CPU(target_cs) == cpu) {
+        struct kvm_xen_vcpu_attr xvuv;
+
+        xvuv.type = KVM_XEN_VCPU_ATTR_TYPE_UPCALL_VECTOR;
+        xvuv.u.vector = vector;
+        err = kvm_vcpu_ioctl(target_cs, KVM_XEN_HVM_SET_ATTR, &xvuv);
+        if (err < 0) {
+            goto out;
+        }
+        trace_kvm_xen_set_vcpu_callback(target_cs->cpu_index, vector);
+    } else {
+        do_run_on_cpu(target_cs, xen_vcpu_set_callback,
+                      RUN_ON_CPU_HOST_INT(vector), &xen_global_mutex);
+    }
+
+out:
+    exit->u.hcall.result = err;
+    return err ? HCALL_ERR : 0;
+}
+
+static int kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                 int cmd, uint64_t arg)
 {
+    int ret = -ENOSYS;
     switch (cmd) {
     case HVMOP_pagetable_dying: {
             exit->u.hcall.result = -ENOSYS;
             return 0;
         }
+    case HVMOP_set_param: {
+            ret = handle_set_param(exit, cpu, arg);
+            break;
+        }
     }
 
-    exit->u.hcall.result = -ENOSYS;
-    return HCALL_ERR;
+    exit->u.hcall.result = ret;
+    return ret ? HCALL_ERR : 0;
 }
 
 static int xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa)
@@ -327,13 +446,16 @@ static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case HVMOP_set_evtchn_upcall_vector:
+        return kvm_xen_hcall_evtchn_upcall_vector(exit, cpu,
+                                                  exit->u.hcall.params[0]);
     case __HYPERVISOR_vcpu_op:
         return kvm_xen_hcall_vcpu_op(exit, cpu,
                                      exit->u.hcall.params[0],
                                      exit->u.hcall.params[1],
                                      exit->u.hcall.params[2]);
     case __HYPERVISOR_hvm_op:
-        return kvm_xen_hcall_hvm_op(exit, exit->u.hcall.params[0],
+        return kvm_xen_hcall_hvm_op(exit, cpu, exit->u.hcall.params[0],
                                     exit->u.hcall.params[1]);
     case __HYPERVISOR_memory_op:
         return kvm_xen_hcall_memory_op(exit, exit->u.hcall.params[0],
-- 
2.35.3


