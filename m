Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D3A6A6DBB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:04:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMxD-0000gO-6R; Wed, 01 Mar 2023 08:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMt7-0000Fq-Po
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:58 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMsv-0002pk-MU
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hh8qs4ZID+MJzUutgvUrkXP2KyxEsgLqkUTsF/ngXmY=; b=ampyKuP/diIz1P8IMIkZRRQK1L
 8QTcxafjLsOd1XwHivhWTQeGA3cYdYMpBWMebxfykgj88x+GGjNiVIlSNn6W/Eqsya5E9IdC4EmER
 VGKN6ODcGWV2bawxZKywjbsL3a0ee7pwhIjDArj1F9b5n8SXbc+LSInmeL3RXonXCJjR8KKvml7bn
 hOIym2iJgb3aL47mWRg0ebMk27jWaXFAVRq5Xl4vSJavXkIIRvSIZSA1NfFB3vMLP/5Aesxi69Chf
 uBuDL6UzNK7Ea/NhEWwJE9b4cVnkeE2yt3fvhFvvIU09K4if7Un3kG6/FcgkzRRElvU1Nldfasfgp
 i2o8rsuA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXMsd-00EuVo-07; Wed, 01 Mar 2023 13:52:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXMsc-0049VS-2w; Wed, 01 Mar 2023 13:52:26 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v15 28/60] i386/xen: Add support for Xen event channel
 delivery to vCPU
Date: Wed,  1 Mar 2023 13:51:51 +0000
Message-Id: <20230301135223.988336-29-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301135223.988336-1-dwmw2@infradead.org>
References: <20230301135223.988336-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org;
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 include/sysemu/kvm_xen.h  |  2 +
 target/i386/cpu.h         |  2 +
 target/i386/kvm/xen-emu.c | 94 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 92 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index cec21c8fab..644c7d889c 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -21,6 +21,8 @@
 
 int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
+void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e882c4e251..1c7603221d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1799,6 +1799,8 @@ typedef struct CPUArchState {
 #endif
 #if defined(CONFIG_KVM)
     struct kvm_nested_state *nested_state;
+    MemoryRegion *xen_vcpu_info_mr;
+    void *xen_vcpu_info_hva;
     uint64_t xen_vcpu_info_gpa;
     uint64_t xen_vcpu_info_default_gpa;
     uint64_t xen_vcpu_time_info_gpa;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 435c51f625..1b319e8bad 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -21,6 +21,8 @@
 #include "trace.h"
 #include "sysemu/runstate.h"
 
+#include "hw/pci/msi.h"
+#include "hw/i386/apic-msidef.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 
@@ -248,6 +250,43 @@ static void do_set_vcpu_callback_vector(CPUState *cs, run_on_cpu_data data)
     }
 }
 
+static int set_vcpu_info(CPUState *cs, uint64_t gpa)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    MemoryRegionSection mrs = { .mr = NULL };
+    void *vcpu_info_hva = NULL;
+    int ret;
+
+    ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+    if (ret || gpa == INVALID_GPA) {
+        goto out;
+    }
+
+    mrs = memory_region_find(get_system_memory(), gpa,
+                             sizeof(struct vcpu_info));
+    if (mrs.mr && mrs.mr->ram_block &&
+        !int128_lt(mrs.size, int128_make64(sizeof(struct vcpu_info)))) {
+        vcpu_info_hva = qemu_map_ram_ptr(mrs.mr->ram_block,
+                                         mrs.offset_within_region);
+    }
+    if (!vcpu_info_hva) {
+        if (mrs.mr) {
+            memory_region_unref(mrs.mr);
+            mrs.mr = NULL;
+        }
+        ret = -EINVAL;
+    }
+
+ out:
+    if (env->xen_vcpu_info_mr) {
+        memory_region_unref(env->xen_vcpu_info_mr);
+    }
+    env->xen_vcpu_info_hva = vcpu_info_hva;
+    env->xen_vcpu_info_mr = mrs.mr;
+    return ret;
+}
+
 static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -257,8 +296,7 @@ static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 
     /* Changing the default does nothing if a vcpu_info was explicitly set. */
     if (env->xen_vcpu_info_gpa == INVALID_GPA) {
-        kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
-                              env->xen_vcpu_info_default_gpa);
+        set_vcpu_info(cs, env->xen_vcpu_info_default_gpa);
     }
 }
 
@@ -269,8 +307,52 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
 
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
@@ -306,7 +388,7 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
     env->xen_vcpu_runstate_gpa = INVALID_GPA;
     env->xen_vcpu_callback_vector = 0;
 
-    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
+    set_vcpu_info(cs, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
                           INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
@@ -903,7 +985,7 @@ int kvm_put_xen_state(CPUState *cs)
     }
 
     if (gpa != INVALID_GPA) {
-        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+        ret = set_vcpu_info(cs, gpa);
         if (ret < 0) {
             return ret;
         }
-- 
2.39.0


