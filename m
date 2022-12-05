Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21703642EEA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKr-00087i-GV; Mon, 05 Dec 2022 12:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FKT-0007vi-AZ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:33 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FJx-0007Q5-O7
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=slFRTUYOXFgBh+Qg3a3yRROw9OELve76Od3d649yiGg=; b=X2/OIB14/ltDFHnR4v2W0hsja3
 Yl3esTIGQyIx3CX4WSbxhIf9p9jQuZ5PCl6y2CjhX3b/RoTm+o6s3AOnT5MvYJuUIz5a6wULZ7V2Q
 JrBv0Vw9gDACoXPiVhdwkwwiS2H3CMq7pQGRYejLHKhU0dY0nAwAwutTVfJAJuH+mzn1QWX2oCk0q
 jDF/osXbjIhIbycwlWg3CS13eGS18N7puXUvi06qxOJp9tmGzNIUz6H418QQclVrPZj5htdZ+0zr8
 GEMgBjkU8xusFr/Wtb7Ntqzkn7d2v+/cwtyaupyYdEy1YXitgDJKjIxgDOdFZfvHOy460luQw/sbw
 b12qeNkA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJw-003TwW-Rw; Mon, 05 Dec 2022 17:32:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKb-Nw; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 15/21] i386/xen: handle register_vcpu_info
Date: Mon,  5 Dec 2022 17:31:31 +0000
Message-Id: <20221205173137.607044-16-dwmw2@infradead.org>
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

From: Joao Martins <joao.m.martins@oracle.com>

Handle the hypercall to set a per vcpu info, as opposed to using
shared_info equivalent. Also, Guests may not call
VCPUOP_register_vcpu_info and will fail in event channel operations if a
proper one isn't set in Qemu.

So derive the hva from shared_info which is where these are located when
guest doesn't seed an additional pointer.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/cpu.h        |  1 +
 target/i386/trace-events |  1 +
 target/i386/xen-proto.h  |  4 +++
 target/i386/xen.c        | 72 ++++++++++++++++++++++++++++++++++------
 4 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 09c0281b8b..db152d6902 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1801,6 +1801,7 @@ typedef struct CPUArchState {
     HVFX86LazyFlags hvf_lflags;
     void *hvf_mmio_buf;
 #endif
+    struct XenCPUState xen_vcpu;
 
     uint64_t mcg_cap;
     uint64_t mcg_ctl;
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 2bf732ee07..1c6c44f291 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -15,3 +15,4 @@ kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data
 # target/i386/xen.c
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIu64
 kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
+kvm_xen_set_vcpu_attr(int cpu, int type, uint64_t gpa) "vcpu attr cpu %d type %d gpa 0x%" PRIu64
diff --git a/target/i386/xen-proto.h b/target/i386/xen-proto.h
index c394909f54..8f6ee4c17b 100644
--- a/target/i386/xen-proto.h
+++ b/target/i386/xen-proto.h
@@ -15,5 +15,9 @@ typedef struct XenState {
     struct shared_info *shared_info;
 } XenState;
 
+typedef struct XenCPUState {
+   struct vcpu_info *info;
+} XenCPUState;
+
 #endif
 
diff --git a/target/i386/xen.c b/target/i386/xen.c
index 61c9959981..59aca2ad19 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -14,6 +14,7 @@
 #include "exec/address-spaces.h"
 #include "xen.h"
 #include "trace.h"
+#include "sysemu/sysemu.h"
 
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
@@ -133,13 +134,24 @@ static int xen_set_shared_info(CPUState *cs, struct shared_info *shi,
     struct kvm_xen_hvm_attr xhsi;
     XenState *xen = cs->xen_state;
     KVMState *s = cs->kvm_state;
-    int err;
+    XenCPUState *xcpu;
+    CPUState *cpu;
+    int i, err;
 
     xhsi.type = KVM_XEN_ATTR_TYPE_SHARED_INFO;
     xhsi.u.shared_info.gfn = gfn;
     err = kvm_vm_ioctl(s, KVM_XEN_HVM_SET_ATTR, &xhsi);
     trace_kvm_xen_set_shared_info(gfn);
     xen->shared_info = shi;
+
+    for (i = 0; i < XEN_LEGACY_MAX_VCPUS; i++) {
+        cpu = qemu_get_cpu(i);
+        if (cpu) {
+                xcpu = &X86_CPU(cpu)->env.xen_vcpu;
+                xcpu->info = &shi->vcpu_info[cpu->cpu_index];
+        }
+    }
+
     return err;
 }
 
@@ -197,19 +209,57 @@ static int kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
     return HCALL_ERR;
 }
 
-static int kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit,
-                                 int cmd, uint64_t arg)
+static int xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa)
+{
+    struct kvm_xen_vcpu_attr xhsi;
+
+    xhsi.type = type;
+    xhsi.u.gpa = gpa;
+
+    trace_kvm_xen_set_vcpu_attr(cs->cpu_index, type, gpa);
+
+    return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &xhsi);
+}
+
+static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
+                                     uint64_t arg)
 {
+    XenCPUState *xt = &X86_CPU(target)->env.xen_vcpu;
+    struct vcpu_register_vcpu_info *rvi;
+    uint64_t gpa;
+    void *hva;
+
+    rvi = gva_to_hva(cs, arg);
+    if (!rvi) {
+        return -EFAULT;
+    }
+
+    gpa = ((rvi->mfn << PAGE_SHIFT) + rvi->offset);
+    hva = gpa_to_hva(gpa);
+    if (!hva) {
+        return -EFAULT;
+    }
+
+    xt->info = hva;
+    return xen_set_vcpu_attr(target, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+}
+
+static int kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                 int cmd, int vcpu_id, uint64_t arg)
+{
+    CPUState *dest = qemu_get_cpu(vcpu_id);
+    CPUState *cs = CPU(cpu);
+    int err = -ENOSYS;
+
     switch (cmd) {
     case VCPUOP_register_vcpu_info: {
-            /* no vcpu info placement for now */
-            exit->u.hcall.result = -ENOSYS;
-            return 0;
+            err = vcpuop_register_vcpu_info(cs, dest, arg);
+            break;
         }
     }
 
-    exit->u.hcall.result = -ENOSYS;
-    return HCALL_ERR;
+    exit->u.hcall.result = err;
+    return err ? HCALL_ERR : 0;
 }
 
 static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
@@ -223,8 +273,10 @@ static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 
     switch (code) {
     case __HYPERVISOR_vcpu_op:
-        return kvm_xen_hcall_vcpu_op(exit, exit->u.hcall.params[0],
-                                     exit->u.hcall.params[1]);
+        return kvm_xen_hcall_vcpu_op(exit, cpu,
+                                     exit->u.hcall.params[0],
+                                     exit->u.hcall.params[1],
+                                     exit->u.hcall.params[2]);
     case __HYPERVISOR_hvm_op:
         return kvm_xen_hcall_hvm_op(exit, exit->u.hcall.params[0],
                                     exit->u.hcall.params[1]);
-- 
2.35.3


