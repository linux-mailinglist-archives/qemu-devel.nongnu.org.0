Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D074642EE9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKW-0007vo-TF; Mon, 05 Dec 2022 12:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FKN-0007qw-EI
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:27 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FJx-0007Py-N2
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RztcVTFsqDTloi5s9BjMG7FDtoQTCqx4oU4Au71HU6o=; b=KSiM/P4xCCsMuk5KgRkOc6Cq3p
 m/AavL9+EEjrAy3UdBVgLMrNSMPwuBRWfqAv0maMJsalxKcQS4eDMoGcPciLTF2gVW1LEiWvyL2GH
 0G6jnoLU165b3L/eg8+7nfOpAUo/wJVsPKDCq71YhQAdrMUsOQ4N5r1MYDDddvTgqWdE9qMfxhPjm
 e7+beJlEoI1HlYnOmS8DgNRJmm6hdouW7b5NSGBcgCLXzFcEXJytrnbxlfKMFY89LliaUY4fW9NWb
 nDbK1AjnQP5WtYijf69I2FUi0d1UljyAK7v3IhKHNncaU1MF1hzBzlJTCqePbJPehNR/khU5h+1K9
 8HZ0fSKA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJw-003Tw2-HP; Mon, 05 Dec 2022 17:32:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YJk-FA; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 03/21] i386/kvm: handle Xen HVM cpuid leaves
Date: Mon,  5 Dec 2022 17:31:19 +0000
Message-Id: <20221205173137.607044-4-dwmw2@infradead.org>
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

Introduce support for emulating CPUID for Xen HVM guests via
xen, xen_vapic as changeable params.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Obtain xen_version from machine property]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/cpu.c     |  2 ++
 target/i386/cpu.h     |  3 ++
 target/i386/kvm/kvm.c | 72 +++++++++++++++++++++++++++++++++++++++++++
 target/i386/xen.h     |  8 +++++
 4 files changed, 85 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37..45aa9e40a5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7069,6 +7069,8 @@ static Property x86_cpu_properties[] = {
      * own cache information (see x86_cpu_load_def()).
      */
     DEFINE_PROP_BOOL("legacy-cache", X86CPU, legacy_cache, true),
+    DEFINE_PROP_BOOL("xen", X86CPU, xen, false),
+    DEFINE_PROP_BOOL("xen-vapic", X86CPU, xen_vapic, false),
 
     /*
      * From "Requirements for Implementing the Microsoft
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4bc19577a..5ddd14467e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1964,6 +1964,9 @@ struct ArchCPU {
     int32_t thread_id;
 
     int32_t hv_max_vps;
+
+    bool xen;
+    bool xen_vapic;
 };
 
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ff3ea245cf..4b21d03250 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -22,6 +22,7 @@
 
 #include <linux/kvm.h>
 #include "standard-headers/asm-x86/kvm_para.h"
+#include "standard-headers/xen/arch-x86/cpuid.h"
 
 #include "cpu.h"
 #include "host-cpu.h"
@@ -34,6 +35,7 @@
 #include "xen.h"
 #include "hyperv.h"
 #include "hyperv-proto.h"
+#include "xen.h"
 
 #include "exec/gdbstub.h"
 #include "qemu/host-utils.h"
@@ -775,6 +777,12 @@ static inline bool freq_within_bounds(int freq, int target_freq)
         return false;
 }
 
+
+static bool xen_enabled_on_kvm(X86CPU *cpu)
+{
+    return cpu->xen;
+}
+
 static int kvm_arch_set_tsc_khz(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -1800,6 +1808,70 @@ int kvm_arch_init_vcpu(CPUState *cs)
         has_msr_hv_hypercall = true;
     }
 
+    if (xen_enabled_on_kvm(cpu) && kvm_base == XEN_CPUID_SIGNATURE) {
+        struct kvm_cpuid_entry2 *xen_max_leaf;
+        MachineState *ms = MACHINE(qdev_get_machine());
+        uint32_t xen_version = object_property_get_int(OBJECT(ms), "xen-version", &error_abort);
+
+        memcpy(signature, "XenVMMXenVMM", 12);
+
+        xen_max_leaf = c = &cpuid_data.entries[cpuid_i++];
+        c->function = XEN_CPUID_SIGNATURE;
+        c->eax = XEN_CPUID_TIME;
+        c->ebx = signature[0];
+        c->ecx = signature[1];
+        c->edx = signature[2];
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = XEN_CPUID_VENDOR;
+        c->eax = xen_version;
+        c->ebx = 0;
+        c->ecx = 0;
+        c->edx = 0;
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = XEN_CPUID_HVM_MSR;
+        /* Number of hypercall-transfer pages */
+        c->eax = 1;
+        /* Hypercall MSR base address */
+        c->ebx = XEN_HYPERCALL_MSR;
+        c->ecx = 0;
+        c->edx = 0;
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = XEN_CPUID_TIME;
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
+        c->function = XEN_CPUID_HVM;
+        xen_max_leaf->eax = XEN_CPUID_HVM;
+        if (xen_version >= XEN_VERSION(4,5)) {
+            c->function = XEN_CPUID_HVM;
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
+        kvm_base = KVM_CPUID_SIGNATURE_NEXT;
+    }
+
+
     if (cpu->expose_kvm) {
         memcpy(signature, "KVMKVMKVM\0\0\0", 12);
         c = &cpuid_data.entries[cpuid_i++];
diff --git a/target/i386/xen.h b/target/i386/xen.h
index 6c4f3b7822..d4903ecfa1 100644
--- a/target/i386/xen.h
+++ b/target/i386/xen.h
@@ -14,6 +14,14 @@
 
 #define XEN_HYPERCALL_MSR 0x40000000
 
+#define XEN_CPUID_SIGNATURE        0x40000000
+#define XEN_CPUID_VENDOR           0x40000001
+#define XEN_CPUID_HVM_MSR          0x40000002
+#define XEN_CPUID_TIME             0x40000003
+#define XEN_CPUID_HVM              0x40000004
+
+#define XEN_VERSION(maj, min) ((maj) << 16 | (min))
+
 int kvm_xen_init(KVMState *s, uint32_t xen_version);
 
 #endif /* QEMU_I386_XEN_H */
-- 
2.35.3


