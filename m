Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358E664179
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 14:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDfR-000193-W5; Tue, 10 Jan 2023 07:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDcx-0007B0-RA
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:16 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDcs-0000UQ-9q
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vo8xKCANcU8VlOPsSOwqRfONZRa5zu45E6N+Ww5FOoc=; b=BHm3+WNUFVcfJkBdl8zL/UNmT7
 qGTorkjFkNqJ5g9CdfOiNQeo5fWz7R8hD1IOWV0Tn3hLL3yGxer92547qRAoX+zr/Cg67KmHrnfSn
 pUQhy130EUD0t6wPJ+8Rlf5hPCYC6LZ2f4Yct0Co79lE7M1ygJ70yR/FiWUHTQUdtOIdH3JIdxOBK
 kaFZ2tTV2QHyyhM2Rwkk1cfsZEtUOt9ONoZAkDx18s8qB8iR6Cp9W0UgIVlZI+HqTQwecL8HnNXBC
 ekghCMNaPhiwRFtmsQg02hHAxXjbLe+Yy/3j7+IxZH5WW35HDITRaffj3qMgj9O6xgNh3r+ORlUEg
 hz+r3poQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFDcM-0037tU-1R; Tue, 10 Jan 2023 12:20:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDcT-006Yep-1H; Tue, 10 Jan 2023 12:20:45 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [PATCH v6 27/51] i386/xen: Add support for Xen event channel delivery
 to vCPU
Date: Tue, 10 Jan 2023 12:20:18 +0000
Message-Id: <20230110122042.1562155-28-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110122042.1562155-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

The kvm_xen_inject_vcpu_callback_vector() function will either deliver
the per-vCPU local APIC vector (as an MSI), or just kick the vCPU out
of the kernel to trigger KVM's automatic delivery of the global vector.
Support for asserting the GSI/PCI_INTX callbacks will come later.

Also add kvm_xen_get_vcpu_info_hva() which returns the vcpu_info of
a given vCPU.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/sysemu/kvm_xen.h  |  2 +
 target/i386/cpu.h         |  2 +
 target/i386/kvm/xen-emu.c | 86 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 3e43cd7843..ee53294deb 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -17,6 +17,8 @@
 #define INVALID_GFN UINT64_MAX
 
 uint32_t kvm_xen_get_caps(void);
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
+void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 938a1b9c8b..c9b12e7476 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1788,6 +1788,8 @@ typedef struct CPUArchState {
 #endif
 #if defined(CONFIG_KVM)
     struct kvm_nested_state *nested_state;
+    MemoryRegion *xen_vcpu_info_mr;
+    void *xen_vcpu_info_hva;
     uint64_t xen_vcpu_info_gpa;
     uint64_t xen_vcpu_info_default_gpa;
     uint64_t xen_vcpu_time_info_gpa;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 42e65573de..eced4bce5c 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -20,6 +20,8 @@
 #include "trace.h"
 #include "sysemu/runstate.h"
 
+#include "hw/pci/msi.h"
+#include "hw/i386/apic-msidef.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 
@@ -247,6 +249,35 @@ static void do_set_vcpu_callback_vector(CPUState *cs, run_on_cpu_data data)
     }
 }
 
+static int set_vcpu_info(CPUState *cs, uint64_t gpa)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    MemoryRegionSection mrs;
+    int ret;
+
+    ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+    if (ret || gpa == INVALID_GPA) {
+    fail:
+        if (env->xen_vcpu_info_mr) {
+            memory_region_unref(env->xen_vcpu_info_mr);
+            env->xen_vcpu_info_mr = NULL;
+        }
+        env->xen_vcpu_info_hva = NULL;
+        return ret;
+    }
+
+    mrs = memory_region_find(get_system_memory(), gpa, sizeof(struct vcpu_info));
+    if (!mrs.mr || !mrs.mr->ram_block || mrs.size < sizeof(struct vcpu_info) ||
+        !(env->xen_vcpu_info_hva = qemu_map_ram_ptr(mrs.mr->ram_block,
+                                                    mrs.offset_within_region))) {
+        ret = -EINVAL;
+        goto fail;
+    }
+    env->xen_vcpu_info_mr = mrs.mr;
+    return 0;
+}
+
 static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -256,8 +287,7 @@ static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 
     /* Changing the default does nothing if a vcpu_info was explicitly set. */
     if (env->xen_vcpu_info_gpa == INVALID_GPA) {
-        kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
-                              env->xen_vcpu_info_default_gpa);
+        set_vcpu_info(cs, env->xen_vcpu_info_default_gpa);
     }
 }
 
@@ -268,8 +298,52 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
 
     env->xen_vcpu_info_gpa = data.host_ulong;
 
-    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
-                          env->xen_vcpu_info_gpa);
+    set_vcpu_info(cs, env->xen_vcpu_info_gpa);
+}
+
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
+{
+    CPUState *cs = qemu_get_cpu(vcpu_id);
+    if (!cs) {
+        return NULL;
+    }
+
+    return X86_CPU(cs)->env.xen_vcpu_info_hva;
+}
+
+void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
+{
+    CPUState *cs = qemu_get_cpu(vcpu_id);
+    uint8_t vector;
+
+    if (!cs) {
+        return;
+    }
+
+    vector = X86_CPU(cs)->env.xen_vcpu_callback_vector;
+    if (vector) {
+        /*
+         * The per-vCPU callback vector injected via lapic. Just
+         * deliver it as an MSI.
+         */
+        MSIMessage msg = {
+            .address = APIC_DEFAULT_ADDRESS | X86_CPU(cs)->apic_id,
+            .data = vector | (1UL << MSI_DATA_LEVEL_SHIFT),
+        };
+        kvm_irqchip_send_msi(kvm_state, msg);
+        return;
+    }
+
+    switch (type) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR:
+        /*
+         * If the evtchn_upcall_pending field in the vcpu_info is set, then
+         * KVM will automatically deliver the vector on entering the vCPU
+         * so all we have to do is kick it out.
+         */
+        qemu_cpu_kick(cs);
+        break;
+    }
 }
 
 static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
@@ -305,7 +379,7 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
     env->xen_vcpu_runstate_gpa = INVALID_GPA;
     env->xen_vcpu_callback_vector = 0;
 
-    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
+    set_vcpu_info(cs, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
                           INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
@@ -885,7 +959,7 @@ int kvm_put_xen_state(CPUState *cs)
     }
 
     if (gpa != INVALID_GPA) {
-        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+        ret = set_vcpu_info(cs, gpa);
         if (ret < 0) {
             return ret;
         }
-- 
2.35.3


