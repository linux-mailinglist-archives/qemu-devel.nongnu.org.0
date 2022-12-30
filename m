Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1724265983A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEGm-0000Km-Es; Fri, 30 Dec 2022 07:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFv-0007oh-Or
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:12:59 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFo-0004xv-Qq
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XYusV/FXSZTAazwHt/zbhFspZMyFm6JhPKqLWm0XfT0=; b=No/Vi8CRZ9TUD1NMX2j7CAnodd
 odyA+3Pp52e4fSWToE+gbh7L+8gEIhv5spGAJ22kW9YUwIk6BAKi2oZB7kNKHc6QVg6MJ4IjJDNdm
 LXlBevXtecHsXdftPhAQjr4vV2SxzeIZEj8asdJzEUUduIibIZ0a1kfApqX7AN8f7sLxjfh/UtMM4
 UtFHhkZsRdEw6UYtvKIC98cHOAEA/awmbz5ZU3d77r5OSxHxM9TDbU/CojJ2LB7oQLXdQ+sHVZqCI
 MDyzvJ5k2xrRvhKLV0rxGfiu6OGlmBKdzy1ZDnW+QBo311Zc996ZnWiNJL1ZEkLpRjK+fFlMcSEot
 6q/Fa8Lg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pBEFl-00Ac8H-4a; Fri, 30 Dec 2022 12:12:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFZ-005NxB-Th; Fri, 30 Dec 2022 12:12:37 +0000
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
Subject: [RFC PATCH v5 28/52] i386/xen: Add support for Xen event channel
 delivery to vCPU
Date: Fri, 30 Dec 2022 12:12:11 +0000
Message-Id: <20221230121235.1282915-29-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221230121235.1282915-1-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

The kvm_xen_inject_vcpu_callback_vector() function will either deliver
the per-vCPU local APIC vector (as an MSI), or just kick the vCPU out
of the kernel to trigger KVM's automatic delivery of the global vector.
Support for asserting the GSI/PCI_INTX callbacks will come later.

Also add kvm_xen_get_vcpu_info_hva() which returns the vcpu_info of
a given vCPU.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/sysemu/kvm_xen.h  |  2 ++
 target/i386/kvm/xen-emu.c | 68 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

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
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 87fcfc636c..11a6fe4164 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -22,6 +22,8 @@
 #include "trace.h"
 #include "sysemu/runstate.h"
 
+#include "hw/pci/msi.h"
+#include "hw/i386/apic-msidef.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 
@@ -274,6 +276,72 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
                           env->xen_vcpu_info_gpa);
 }
 
+static void *gpa_to_hva(uint64_t gpa)
+{
+    MemoryRegionSection mrs;
+
+    mrs = memory_region_find(get_system_memory(), gpa, 1);
+    return !mrs.mr ? NULL : qemu_map_ram_ptr(mrs.mr->ram_block,
+                                             mrs.offset_within_region);
+}
+
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
+{
+    CPUState *cs = qemu_get_cpu(vcpu_id);
+    CPUX86State *env;
+    uint64_t gpa;
+
+    if (!cs) {
+        return NULL;
+    }
+    env = &X86_CPU(cs)->env;
+
+    gpa = env->xen_vcpu_info_gpa;
+    if (gpa == INVALID_GPA) {
+        gpa = env->xen_vcpu_info_default_gpa;
+    }
+    if (gpa == INVALID_GPA) {
+        return NULL;
+    }
+
+    return gpa_to_hva(gpa);
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
+}
+
 static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
-- 
2.35.3


