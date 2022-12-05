Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF2642EE5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKm-00081v-9b; Mon, 05 Dec 2022 12:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FKS-0007uX-4a
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:33 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FJx-0007Pz-O0
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=huSPvy++pdFPGgGZFGH7ARg4GGWvzd2ie+EjBNhIWv0=; b=X4X/uTxc3Ro31Z9LclWYM0mfC9
 bRm9Dy3fmsnBssn2AOno226T2P7KYnFRMkKeSwd6MkDJgbzTBgb0uYrSt0NMIWLRGObHEv3FcQC9y
 Mn6qodjB44XV2b05j6mM8h1UfFpH0aPv3Tb075ZPRplBw0HLbAeAY8sxk/C+LjZeH9oz24JfF/BCb
 c6BhV86/0RrH5vb4TbedCE8WHtRpYES4UYuCaPIu9PkbRGPWP6qPTaHnO0NCrdu7k7+QG4OlqR4Qr
 OScHyhgiPfG/aaOqHPDzRs1ws+hl10m9lI5KGR2KSHriGVErK6wQLc41i5M9PPLulRi9XgX+m3WLz
 aCPGcb+g==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJw-003TwT-QH; Mon, 05 Dec 2022 17:32:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKP-Le; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 12/21] i386/xen: set shared_info page
Date: Mon,  5 Dec 2022 17:31:28 +0000
Message-Id: <20221205173137.607044-13-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: Joao Martins <joao.m.martins@oracle.com>

This is done by implementing HYPERVISOR_memory_op specifically
XENMEM_add_to_physmap with space XENMAPSPACE_shared_info. While
Xen removes the page with its own, we instead use the gfn passed
by the guest.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/kvm/kvm-all.c      |  6 ++++
 include/hw/core/cpu.h    |  2 ++
 include/sysemu/kvm.h     |  2 ++
 include/sysemu/kvm_int.h |  3 ++
 target/i386/cpu.h        |  8 ++++++
 target/i386/trace-events |  1 +
 target/i386/xen-proto.h  | 19 +++++++++++++
 target/i386/xen.c        | 61 ++++++++++++++++++++++++++++++++++++++++
 8 files changed, 102 insertions(+)
 create mode 100644 target/i386/xen-proto.h

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0becd8..8a227515b7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -172,6 +172,11 @@ void kvm_resample_fd_notify(int gsi)
     }
 }
 
+struct XenState *kvm_get_xen_state(KVMState *s)
+{
+    return &s->xen;
+}
+
 int kvm_get_max_memslots(void)
 {
     KVMState *s = KVM_STATE(current_accel());
@@ -405,6 +410,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
     cpu->vcpu_dirty = true;
     cpu->dirty_pages = 0;
     cpu->throttle_us_per_full = 0;
+    cpu->xen_state = &s->xen;
 
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
     if (mmap_size < 0) {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8830546121..e57b693528 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -443,6 +443,8 @@ struct CPUState {
 
     /* track IOMMUs whose translations we've cached in the TCG TLB */
     GArray *iommu_notifiers;
+
+    struct XenState *xen_state;
 };
 
 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index e9a97eda8c..8e882fbe96 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -582,4 +582,6 @@ bool kvm_arch_cpu_check_are_resettable(void);
 bool kvm_dirty_ring_enabled(void);
 
 uint32_t kvm_dirty_ring_size(void);
+
+struct XenState *kvm_get_xen_state(KVMState *s);
 #endif
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 3b4adcdc10..0d89cfe273 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -110,6 +110,9 @@ struct KVMState
     struct KVMDirtyRingReaper reaper;
     NotifyVmexitOption notify_vmexit;
     uint32_t notify_window;
+
+    /* xen guest state */
+    struct XenState xen;
 };
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5ddd14467e..09c0281b8b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -23,6 +23,14 @@
 #include "sysemu/tcg.h"
 #include "cpu-qom.h"
 #include "kvm/hyperv-proto.h"
+#include "xen-proto.h"
+
+#ifdef TARGET_X86_64
+#define TARGET_LONG_BITS 64
+#else
+#define TARGET_LONG_BITS 32
+#endif
+
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
 #include "qemu/cpu-float.h"
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 3fb9ee3add..2bf732ee07 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -14,3 +14,4 @@ kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data
 
 # target/i386/xen.c
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIu64
+kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
diff --git a/target/i386/xen-proto.h b/target/i386/xen-proto.h
new file mode 100644
index 0000000000..c394909f54
--- /dev/null
+++ b/target/i386/xen-proto.h
@@ -0,0 +1,19 @@
+/*
+ * Definitions for Xen guest/hypervisor interaction - x86-specific part
+ *
+ * Copyright (c) 2019 Oracle and/or its affiliates. All rights reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef TARGET_I386_XEN_PROTO_H
+#define TARGET_I386_XEN_PROTO_H
+
+typedef struct XenState {
+    struct shared_info *shared_info;
+} XenState;
+
+#endif
+
diff --git a/target/i386/xen.c b/target/i386/xen.c
index ee6f99523d..5d2d8a7e00 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -16,8 +16,10 @@
 #include "trace.h"
 
 #include "standard-headers/xen/version.h"
+#include "standard-headers/xen/memory.h"
 
 #define PAGE_OFFSET    0xffffffff80000000UL
+#define PAGE_SHIFT     12
 
 /*
  * Unhandled hypercalls error:
@@ -123,6 +125,62 @@ static int kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return err ? HCALL_ERR : 0;
 }
 
+static int xen_set_shared_info(CPUState *cs, struct shared_info *shi,
+                               uint64_t gfn)
+{
+    struct kvm_xen_hvm_attr xhsi;
+    XenState *xen = cs->xen_state;
+    KVMState *s = cs->kvm_state;
+    int err;
+
+    xhsi.type = KVM_XEN_ATTR_TYPE_SHARED_INFO;
+    xhsi.u.shared_info.gfn = gfn;
+    err = kvm_vm_ioctl(s, KVM_XEN_HVM_SET_ATTR, &xhsi);
+    trace_kvm_xen_set_shared_info(gfn);
+    xen->shared_info = shi;
+    return err;
+}
+
+static int kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
+                                   int cmd, uint64_t arg, X86CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    int err = 0;
+
+    switch (cmd) {
+    case XENMEM_add_to_physmap: {
+            struct xen_add_to_physmap *xatp;
+            struct shared_info *shi;
+
+            xatp = gva_to_hva(cs, arg);
+            if (!xatp) {
+                err = -EFAULT;
+                break;
+            }
+
+            switch (xatp->space) {
+            case XENMAPSPACE_shared_info:
+                break;
+            default:
+                err = -ENOSYS;
+                break;
+            }
+
+            shi = gpa_to_hva(xatp->gpfn << PAGE_SHIFT);
+            if (!shi) {
+                err = -EFAULT;
+                break;
+            }
+
+            err = xen_set_shared_info(cs, shi, xatp->gpfn);
+            break;
+         }
+    }
+
+    exit->u.hcall.result = err;
+    return err ? HCALL_ERR : 0;
+}
+
 static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -133,6 +191,9 @@ static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_memory_op:
+        return kvm_xen_hcall_memory_op(exit, exit->u.hcall.params[0],
+                                       exit->u.hcall.params[1], cpu);
     case __HYPERVISOR_xen_version:
         return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
                                          exit->u.hcall.params[1]);
-- 
2.35.3


