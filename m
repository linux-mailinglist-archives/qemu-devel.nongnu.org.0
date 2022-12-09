Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E4648088
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:59:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a8L-0002ev-4h; Fri, 09 Dec 2022 04:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7T-0002Su-0c
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7Q-0006qi-Gv
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QiqlBZknOhwMHXYwTPwEWGoZ8AIAVya1/JkxUcYP908=; b=D9Es1RXg+6PA1LqkT0Yz8/9GRz
 H5uLrEL9UMW3n2Ra/OSbQ/QKOROajq2zh5zIR0C7plbEAvvG+ac8eUL5iG7VUxpIgPDrisKkLUml8
 o7wihHn1BXXOIzvbvRrbx55Qa3lw/lZPxMCWqejm/uvsTtgwVnM1ijjFrfCqTgWfeVPEXVWxht3Lb
 LEg3gBil9jyHrMBXJ89sCqGvkAOUgHPXlbMqVel0V8KZuZZAYlvTxh0v+dQgSaooN0XHF9Mst3dkB
 GN+Dp3RPACpNonb2wJteXjJG+gas0b9eKB6AO01u9EjG3F9wZIswRxMYs22NrbdzWqgs+7cFO/Tng
 VLVBBO0g==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7G-007tiM-7L; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a77-002tYQ-Qs; Fri, 09 Dec 2022 09:56:17 +0000
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
Subject: [RFC PATCH v2 04/22] i386/kvm: handle Xen HVM cpuid leaves
Date: Fri,  9 Dec 2022 09:55:54 +0000
Message-Id: <20221209095612.689243-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org;
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

Introduce support for emulating CPUID for Xen HVM guests. It doesn't make
sense to advertise the KVM leaves to a Xen guest, so do it unconditionally
when the xen-version machine property is set.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Obtain xen_version from machine property, make it automatic]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  2 ++
 target/i386/kvm/kvm.c | 72 +++++++++++++++++++++++++++++++++++++++++--
 target/i386/xen.h     |  8 +++++
 4 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37..50aa95f134 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7069,6 +7069,7 @@ static Property x86_cpu_properties[] = {
      * own cache information (see x86_cpu_load_def()).
      */
     DEFINE_PROP_BOOL("legacy-cache", X86CPU, legacy_cache, true),
+    DEFINE_PROP_BOOL("xen-vapic", X86CPU, xen_vapic, false),
 
     /*
      * From "Requirements for Implementing the Microsoft
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4bc19577a..c6c57baed5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1964,6 +1964,8 @@ struct ArchCPU {
     int32_t thread_id;
 
     int32_t hv_max_vps;
+
+    bool xen_vapic;
 };
 
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0a2069b117..0d3eddf9de 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -22,6 +22,7 @@
 
 #include <linux/kvm.h>
 #include "standard-headers/asm-x86/kvm_para.h"
+#include "standard-headers/xen/arch-x86/cpuid.h"
 
 #include "cpu.h"
 #include "host-cpu.h"
@@ -1752,14 +1753,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
     uint32_t limit, i, j, cpuid_i;
-    uint32_t unused;
+    uint32_t unused, xen_version = 0;
     struct kvm_cpuid_entry2 *c;
     uint32_t signature[3];
     int kvm_base = KVM_CPUID_SIGNATURE;
     int max_nested_state_len;
     int r;
     Error *local_err = NULL;
-
     memset(&cpuid_data, 0, sizeof(cpuid_data));
 
     cpuid_i = 0;
@@ -1811,7 +1811,73 @@ int kvm_arch_init_vcpu(CPUState *cs)
         has_msr_hv_hypercall = true;
     }
 
-    if (cpu->expose_kvm) {
+    xen_version = kvm_arch_xen_version(MACHINE(qdev_get_machine()));
+    if (xen_version) {
+#ifdef CONFIG_XEN_EMU
+        struct kvm_cpuid_entry2 *xen_max_leaf;
+
+        memcpy(signature, "XenVMMXenVMM", 12);
+
+        xen_max_leaf = c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_SIGNATURE;
+        c->eax = kvm_base + XEN_CPUID_TIME;
+        c->ebx = signature[0];
+        c->ecx = signature[1];
+        c->edx = signature[2];
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_VENDOR;
+        c->eax = xen_version;
+        c->ebx = 0;
+        c->ecx = 0;
+        c->edx = 0;
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_HVM_MSR;
+        /* Number of hypercall-transfer pages */
+        c->eax = 1;
+        /* Hypercall MSR base address */
+        c->ebx = XEN_HYPERCALL_MSR;
+        c->ecx = 0;
+        c->edx = 0;
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_TIME;
+        c->eax = ((!!tsc_is_stable_and_known(env) << 1) |
+            (!!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_RDTSCP) << 2));
+        /* default=0 (emulate if necessary) */
+        c->ebx = 0;
+        /* guest tsc frequency */
+        c->ecx = env->user_tsc_khz;
+        /* guest tsc incarnation (migration count) */
+        c->edx = 0;
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_HVM;
+        xen_max_leaf->eax = kvm_base + XEN_CPUID_HVM;
+        if (xen_version >= XEN_VERSION(4,5)) {
+            c->function = kvm_base + XEN_CPUID_HVM;
+
+            if (cpu->xen_vapic) {
+                c->eax |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
+                c->eax |= XEN_HVM_CPUID_X2APIC_VIRT;
+            }
+
+            c->eax |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
+
+            if (xen_version >= XEN_VERSION(4,6)) {
+                c->eax |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
+                c->ebx = cs->cpu_index;
+            }
+        }
+
+        kvm_base += 0x100;
+#else /* CONFIG_XEN_EMU */
+        /* This should never happen as kvm_arch_init() would have died first. */
+        fprintf(stderr, "Cannot enable Xen CPUID without Xen support\n");
+        abort();
+#endif
+    } else if (cpu->expose_kvm) {
         memcpy(signature, "KVMKVMKVM\0\0\0", 12);
         c = &cpuid_data.entries[cpuid_i++];
         c->function = KVM_CPUID_SIGNATURE | kvm_base;
diff --git a/target/i386/xen.h b/target/i386/xen.h
index 6c4f3b7822..ae880c47bc 100644
--- a/target/i386/xen.h
+++ b/target/i386/xen.h
@@ -14,6 +14,14 @@
 
 #define XEN_HYPERCALL_MSR 0x40000000
 
+#define XEN_CPUID_SIGNATURE        0
+#define XEN_CPUID_VENDOR           1
+#define XEN_CPUID_HVM_MSR          2
+#define XEN_CPUID_TIME             3
+#define XEN_CPUID_HVM              4
+
+#define XEN_VERSION(maj, min) ((maj) << 16 | (min))
+
 int kvm_xen_init(KVMState *s, uint32_t xen_version);
 
 #endif /* QEMU_I386_XEN_H */
-- 
2.35.3


