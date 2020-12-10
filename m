Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A5A2D5BD6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:33:40 +0100 (CET)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knM4h-0004Db-1u
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knKuq-0001jf-RN
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:19:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knKum-0000Hk-CH
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xU+UtDkhHi+iqUH4OyUnzPojKgZGi9F5kkNkLAU/HI0=;
 b=Ukteuk2+i+lyNXPaY7qy+YaBh7LVjMrLyLVUFyGhjF1VJjLCDXYByklPza4xXVzpBqCQmd
 zRJIWGj4g7fzpk+7FGRSNNigsvBngnkGiZ1UnQNiLPfmK0B/1XCROKEIsey4gZ8lShp2Mh
 cewAbdKm27Gq9pnDpwq6F+JaBhEp2Kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-IzT-9P22Pk-4K1bKKc9RCw-1; Thu, 10 Dec 2020 07:19:16 -0500
X-MC-Unique: IzT-9P22Pk-4K1bKKc9RCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F365D180A093
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:19:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B829260BF1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:19:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 002/113] target/i386: Support up to 32768 CPUs without IRQ
 remapping
Date: Thu, 10 Dec 2020 07:19:12 -0500
Message-Id: <20201210121913.531490-3-pbonzini@redhat.com>
In-Reply-To: <20201210121913.531490-1-pbonzini@redhat.com>
References: <20201210121913.531490-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Woodhouse <dwmw2@infradead.org>

The IOAPIC has an 'Extended Destination ID' field in its RTE, which maps
to bits 11-4 of the MSI address. Since those address bits fall within a
given 4KiB page they were historically non-trivial to use on real hardware.

The Intel IOMMU uses the lowest bit to indicate a remappable format MSI,
and then the remaining 7 bits are part of the index.

Where the remappable format bit isn't set, we can actually use the other
seven to allow external (IOAPIC and MSI) interrupts to reach up to 32768
CPUs instead of just the 255 permitted on bare metal.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <78097f9218300e63e751e077a0a5ca029b56ba46.camel@infradead.org>
[Fix UBSAN warning. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
---
 hw/i386/kvm/apic.c                          |  7 ++
 hw/i386/pc.c                                | 16 ++---
 include/standard-headers/asm-x86/kvm_para.h |  1 +
 target/i386/cpu.c                           |  5 +-
 target/i386/kvm.c                           | 77 ++++++++++++++++-----
 target/i386/kvm_i386.h                      |  2 +
 6 files changed, 78 insertions(+), 30 deletions(-)

diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index dd29906061..b226b674e8 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -183,6 +183,13 @@ static void kvm_send_msi(MSIMessage *msg)
 {
     int ret;
 
+    /*
+     * The message has already passed through interrupt remapping if enabled,
+     * but the legacy extended destination ID in low bits still needs to be
+     * handled.
+     */
+    msg->address = kvm_swizzle_msi_ext_dest_id(msg->address);
+
     ret = kvm_irqchip_send_msi(kvm_state, *msg);
     if (ret < 0) {
         fprintf(stderr, "KVM: injection failed, MSI lost (%s)\n",
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9e29f3792b..640fb5b0b7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -104,6 +104,7 @@ const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
 
 GlobalProperty pc_compat_5_1[] = {
     { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
+    { TYPE_X86_CPU, "kvm-msi-ext-dest-id", "off" },
 };
 const size_t pc_compat_5_1_len = G_N_ELEMENTS(pc_compat_5_1);
 
@@ -796,17 +797,12 @@ void pc_machine_done(Notifier *notifier, void *data)
         fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
     }
 
-    if (x86ms->apic_id_limit > 255 && !xen_enabled()) {
-        IntelIOMMUState *iommu = INTEL_IOMMU_DEVICE(x86_iommu_get_default());
 
-        if (!iommu || !x86_iommu_ir_supported(X86_IOMMU_DEVICE(iommu)) ||
-            iommu->intr_eim != ON_OFF_AUTO_ON) {
-            error_report("current -smp configuration requires "
-                         "Extended Interrupt Mode enabled. "
-                         "You can add an IOMMU using: "
-                         "-device intel-iommu,intremap=on,eim=on");
-            exit(EXIT_FAILURE);
-        }
+    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
+        !kvm_irqchip_in_kernel()) {
+        error_report("current -smp configuration requires kernel "
+                     "irqchip support.");
+        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/include/standard-headers/asm-x86/kvm_para.h b/include/standard-headers/asm-x86/kvm_para.h
index 07877d3295..215d01b4ec 100644
--- a/include/standard-headers/asm-x86/kvm_para.h
+++ b/include/standard-headers/asm-x86/kvm_para.h
@@ -32,6 +32,7 @@
 #define KVM_FEATURE_POLL_CONTROL	12
 #define KVM_FEATURE_PV_SCHED_YIELD	13
 #define KVM_FEATURE_ASYNC_PF_INT	14
+#define KVM_FEATURE_MSI_EXT_DEST_ID	15
 
 #define KVM_HINTS_REALTIME      0
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5a8c96072e..b90ed05897 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -799,7 +799,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "kvmclock", "kvm-nopiodelay", "kvm-mmu", "kvmclock",
             "kvm-asyncpf", "kvm-steal-time", "kvm-pv-eoi", "kvm-pv-unhalt",
             NULL, "kvm-pv-tlb-flush", NULL, "kvm-pv-ipi",
-            "kvm-poll-control", "kvm-pv-sched-yield", "kvm-asyncpf-int", NULL,
+            "kvm-poll-control", "kvm-pv-sched-yield", "kvm-asyncpf-int", "kvm-msi-ext-dest-id",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             "kvmclock-stable-bit", NULL, NULL, NULL,
@@ -4114,6 +4114,7 @@ static PropValue kvm_default_props[] = {
     { "kvm-pv-eoi", "on" },
     { "kvmclock-stable-bit", "on" },
     { "x2apic", "on" },
+    { "kvm-msi-ext-dest-id", "off" },
     { "acpi", "off" },
     { "monitor", "off" },
     { "svm", "off" },
@@ -5140,6 +5141,8 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
     if (kvm_enabled()) {
         if (!kvm_irqchip_in_kernel()) {
             x86_cpu_change_kvm_default("x2apic", "off");
+        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
+            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
         }
 
         x86_cpu_apply_props(cpu, kvm_default_props);
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index a2934dda02..bcfa4b03e0 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -416,6 +416,9 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         if (!kvm_irqchip_in_kernel()) {
             ret &= ~(1U << KVM_FEATURE_PV_UNHALT);
         }
+        if (kvm_irqchip_is_split()) {
+            ret |= 1U << KVM_FEATURE_MSI_EXT_DEST_ID;
+        }
     } else if (function == KVM_CPUID_FEATURES && reg == R_EDX) {
         ret |= 1U << KVM_HINTS_REALTIME;
     }
@@ -4589,38 +4592,74 @@ int kvm_arch_irqchip_create(KVMState *s)
     }
 }
 
+uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address)
+{
+    CPUX86State *env;
+    uint64_t ext_id;
+
+    if (!first_cpu) {
+        return address;
+    }
+    env = &X86_CPU(first_cpu)->env;
+    if (!(env->features[FEAT_KVM] & (1 << KVM_FEATURE_MSI_EXT_DEST_ID))) {
+        return address;
+    }
+
+    /*
+     * If the remappable format bit is set, or the upper bits are
+     * already set in address_hi, or the low extended bits aren't
+     * there anyway, do nothing.
+     */
+    ext_id = address & (0xff << MSI_ADDR_DEST_IDX_SHIFT);
+    if (!ext_id || (ext_id & (1 << MSI_ADDR_DEST_IDX_SHIFT)) || (address >> 32)) {
+        return address;
+    }
+
+    address &= ~ext_id;
+    address |= ext_id << 35;
+    return address;
+}
+
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
     X86IOMMUState *iommu = x86_iommu_get_default();
 
     if (iommu) {
-        int ret;
-        MSIMessage src, dst;
         X86IOMMUClass *class = X86_IOMMU_DEVICE_GET_CLASS(iommu);
 
-        if (!class->int_remap) {
-            return 0;
-        }
+        if (class->int_remap) {
+            int ret;
+            MSIMessage src, dst;
 
-        src.address = route->u.msi.address_hi;
-        src.address <<= VTD_MSI_ADDR_HI_SHIFT;
-        src.address |= route->u.msi.address_lo;
-        src.data = route->u.msi.data;
+            src.address = route->u.msi.address_hi;
+            src.address <<= VTD_MSI_ADDR_HI_SHIFT;
+            src.address |= route->u.msi.address_lo;
+            src.data = route->u.msi.data;
 
-        ret = class->int_remap(iommu, &src, &dst, dev ? \
-                               pci_requester_id(dev) : \
-                               X86_IOMMU_SID_INVALID);
-        if (ret) {
-            trace_kvm_x86_fixup_msi_error(route->gsi);
-            return 1;
-        }
+            ret = class->int_remap(iommu, &src, &dst, dev ?     \
+                                   pci_requester_id(dev) :      \
+                                   X86_IOMMU_SID_INVALID);
+            if (ret) {
+                trace_kvm_x86_fixup_msi_error(route->gsi);
+                return 1;
+            }
+
+            /*
+             * Handled untranslated compatibilty format interrupt with
+             * extended destination ID in the low bits 11-5. */
+            dst.address = kvm_swizzle_msi_ext_dest_id(dst.address);
 
-        route->u.msi.address_hi = dst.address >> VTD_MSI_ADDR_HI_SHIFT;
-        route->u.msi.address_lo = dst.address & VTD_MSI_ADDR_LO_MASK;
-        route->u.msi.data = dst.data;
+            route->u.msi.address_hi = dst.address >> VTD_MSI_ADDR_HI_SHIFT;
+            route->u.msi.address_lo = dst.address & VTD_MSI_ADDR_LO_MASK;
+            route->u.msi.data = dst.data;
+            return 0;
+        }
     }
 
+    address = kvm_swizzle_msi_ext_dest_id(address);
+    route->u.msi.address_hi = address >> VTD_MSI_ADDR_HI_SHIFT;
+    route->u.msi.address_lo = address & VTD_MSI_ADDR_LO_MASK;
     return 0;
 }
 
diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
index a4a619cebb..dc72508389 100644
--- a/target/i386/kvm_i386.h
+++ b/target/i386/kvm_i386.h
@@ -48,4 +48,6 @@ bool kvm_has_waitpkg(void);
 
 bool kvm_hv_vpindex_settable(void);
 
+uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
+
 #endif
-- 
2.26.2



