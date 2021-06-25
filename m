Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08893B41A6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:27:38 +0200 (CEST)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwj3g-0000V8-1B
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8031d3708=sidcha@amazon.de>)
 id 1lwj0x-0007Fb-98
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 06:24:47 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:18770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8031d3708=sidcha@amazon.de>)
 id 1lwj0q-0005RO-0z
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 06:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1624616680; x=1656152680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=92xTIyz5g5W9oyuktdQVwvkkdrVToLiu7+iyaniqZKg=;
 b=Axc5HTJvE77t/vyKZu+k2KCTBYbIkfDptM/KFlcCabmAi0gXs0EfwNJH
 qGcxcayO//xM3FDTdfP4HHhGbRjpCVTM8YP7TAThL1pm7nbZpmCePbVGz
 caXoVZ04VQl1BGQ4KskgxsjY8ru4g4P4ZCouqhNovAvfP9oWrbO79Ltbk 4=;
X-IronPort-AV: E=Sophos;i="5.83,298,1616457600"; d="scan'208";a="121287971"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 25 Jun 2021 10:24:38 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4AB96A1D20; Fri, 25 Jun 2021 10:24:37 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.161.183) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 25 Jun 2021 10:24:32 +0000
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha@amazon.de>, Siddharth Chandrasekaran
 <sidcha.dev@gmail.com>, Alexander Graf <graf@amazon.com>, Evgeny Iakovlev
 <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis Aslanidis
 <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: [PATCH v2 6/6] hyper-v: Handle hypercall code page as an overlay page
Date: Fri, 25 Jun 2021 12:23:31 +0200
Message-ID: <451360b22145157b660802af9ff8beb67440b4cd.1624615713.git.sidcha@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624615713.git.sidcha@amazon.de>
References: <cover.1624615713.git.sidcha@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.183]
X-ClientProxiedBy: EX13D05UWC004.ant.amazon.com (10.43.162.223) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=8031d3708=sidcha@amazon.de; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Hypercall code page is specified in the Hyper-V TLFS to be an overlay
page, ie., guest chooses a GPA and the host _places_ a page at that
location, making it visible to the guest and the existing page becomes
inaccessible. Similarly when disabled, the host should _remove_ the
overlay and the old page should become visible to the guest.

Until now, KVM patched the hypercall code directly into the guest
chosen GPA which is incorrect; instead, use the new user space MSR
filtering feature to trap hypercall page MSR writes, overlay it as
requested and then invoke a KVM_SET_MSR from user space to bounce back
control KVM. This bounce back is needed as KVM may have to write data
into the newly overlaid page.

Signed-off-by: Siddharth Chandrasekaran <sidcha@amazon.de>
---
 hw/hyperv/hyperv.c         | 10 ++++-
 include/hw/hyperv/hyperv.h |  5 +++
 target/i386/kvm/hyperv.c   | 91 ++++++++++++++++++++++++++++++++++++++
 target/i386/kvm/hyperv.h   |  4 ++
 target/i386/kvm/kvm.c      | 49 +++++++++++++++++++-
 5 files changed, 156 insertions(+), 3 deletions(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index ac45e8e139..aa5ac5226e 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -36,6 +36,7 @@ struct SynICState {
 OBJECT_DECLARE_SIMPLE_TYPE(SynICState, SYNIC)
 
 static bool synic_enabled;
+struct hyperv_overlay_page hcall_page;
 
 static void alloc_overlay_page(struct hyperv_overlay_page *overlay,
                                Object *owner, const char *name)
@@ -50,7 +51,7 @@ static void alloc_overlay_page(struct hyperv_overlay_page *overlay,
  * This method must be called with iothread lock taken as it modifies
  * the memory hierarchy.
  */
-static void hyperv_overlay_update(struct hyperv_overlay_page *overlay, hwaddr addr)
+void hyperv_overlay_update(struct hyperv_overlay_page *overlay, hwaddr addr)
 {
     if (addr != HYPERV_INVALID_OVERLAY_GPA) {
         /* check if overlay page is enabled */
@@ -70,6 +71,13 @@ static void hyperv_overlay_update(struct hyperv_overlay_page *overlay, hwaddr ad
     }
 }
 
+void hyperv_overlay_init(void)
+{
+    memory_region_init_ram(&hcall_page.mr, NULL, "hyperv.hcall_page",
+                           qemu_real_host_page_size, &error_abort);
+    hcall_page.addr = HYPERV_INVALID_OVERLAY_GPA;
+}
+
 static void synic_update(SynICState *synic, bool enable,
                          hwaddr msg_page_addr, hwaddr event_page_addr)
 {
diff --git a/include/hw/hyperv/hyperv.h b/include/hw/hyperv/hyperv.h
index d989193e84..f444431a81 100644
--- a/include/hw/hyperv/hyperv.h
+++ b/include/hw/hyperv/hyperv.h
@@ -85,6 +85,11 @@ static inline uint32_t hyperv_vp_index(CPUState *cs)
     return cs->cpu_index;
 }
 
+extern struct hyperv_overlay_page hcall_page;
+
+void hyperv_overlay_init(void);
+void hyperv_overlay_update(struct hyperv_overlay_page *page, hwaddr addr);
+
 void hyperv_synic_add(CPUState *cs);
 void hyperv_synic_reset(CPUState *cs);
 void hyperv_synic_update(CPUState *cs, bool enable,
diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c
index f49ed2621d..d5eb47b8b0 100644
--- a/target/i386/kvm/hyperv.c
+++ b/target/i386/kvm/hyperv.c
@@ -16,6 +16,83 @@
 #include "hyperv.h"
 #include "hw/hyperv/hyperv.h"
 #include "hyperv-proto.h"
+#include "kvm_i386.h"
+
+struct x86_hv_overlay {
+    struct hyperv_overlay_page *page;
+    uint32_t msr;
+    hwaddr gpa;
+};
+
+static void async_overlay_update(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    struct x86_hv_overlay *overlay = data.host_ptr;
+
+    qemu_mutex_lock_iothread();
+    hyperv_overlay_update(overlay->page, overlay->gpa);
+    qemu_mutex_unlock_iothread();
+
+    /**
+     * Call KVM so it can keep a copy of the MSR data and do other post-overlay
+     * actions such as filling the overlay page contents before returning to
+     * guest. This works because MSR filtering is inactive for KVM_SET_MSRS
+     */
+    kvm_put_one_msr(cpu, overlay->msr, overlay->gpa);
+
+    g_free(overlay);
+}
+
+static void do_overlay_update(X86CPU *cpu, struct hyperv_overlay_page *page,
+                              uint32_t msr, uint64_t data)
+{
+    struct x86_hv_overlay *overlay = g_malloc(sizeof(struct x86_hv_overlay));
+
+    *overlay = (struct x86_hv_overlay) {
+        .page = page,
+        .msr = msr,
+        .gpa = data
+    };
+
+    /**
+     * This will run in this cpu thread before it returns to KVM, but in a
+     * safe environment (i.e. when all cpus are quiescent) -- this is
+     * necessary because memory hierarchy is being changed
+     */
+    async_safe_run_on_cpu(CPU(cpu), async_overlay_update,
+                          RUN_ON_CPU_HOST_PTR(overlay));
+}
+
+static void overlay_update(X86CPU *cpu, uint32_t msr, uint64_t data)
+{
+    CPUX86State *env = &cpu->env;
+
+    switch (msr) {
+    case HV_X64_MSR_GUEST_OS_ID:
+        /**
+         * When GUEST_OS_ID is cleared, hypercall overlay should be removed;
+         * otherwise it is a NOP. We still need to do a SET_MSR here as the
+         * kernel need to keep a copy of data.
+         */
+        env->msr_hv_guest_os_id = data;
+        if (data != 0) {
+            kvm_put_one_msr(cpu, msr, data);
+            return;
+        }
+        /* Fake a zero write to the overlay page hcall to invalidate the mapping */
+        do_overlay_update(cpu, &hcall_page, msr, 0);
+        break;
+    case HV_X64_MSR_HYPERCALL:
+        if (env->msr_hv_guest_os_id == 0) {
+            /* This is a NOP in KVM too so we don't need to write back the MSR */
+            return;
+        }
+        do_overlay_update(cpu, &hcall_page, msr, data);
+        break;
+    default:
+        return;
+    }
+}
 
 int hyperv_x86_synic_add(X86CPU *cpu)
 {
@@ -44,6 +121,20 @@ static void async_synic_update(CPUState *cs, run_on_cpu_data data)
     qemu_mutex_unlock_iothread();
 }
 
+int kvm_hv_handle_wrmsr(X86CPU *cpu, uint32_t msr, uint64_t data)
+{
+    switch (msr) {
+    case HV_X64_MSR_GUEST_OS_ID:
+    case HV_X64_MSR_HYPERCALL:
+        overlay_update(cpu, msr, data);
+        break;
+    default:
+        return 1;
+    }
+
+    return 0;
+}
+
 int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
 {
     CPUX86State *env = &cpu->env;
diff --git a/target/i386/kvm/hyperv.h b/target/i386/kvm/hyperv.h
index 67543296c3..8e90fa949f 100644
--- a/target/i386/kvm/hyperv.h
+++ b/target/i386/kvm/hyperv.h
@@ -20,8 +20,12 @@
 
 #ifdef CONFIG_KVM
 int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit);
+int kvm_hv_handle_wrmsr(X86CPU *cpu, uint32_t msr, uint64_t data);
+
 #endif
 
+void hyperv_x86_hcall_page_update(X86CPU *cpu);
+
 int hyperv_x86_synic_add(X86CPU *cpu);
 void hyperv_x86_synic_reset(X86CPU *cpu);
 void hyperv_x86_synic_update(X86CPU *cpu);
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index b89b343acc..c279c13437 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2207,11 +2207,30 @@ static void kvm_set_msr_filter_range(struct kvm_msr_filter_range *range, uint32_
 
 static int kvm_set_msr_filters(KVMState *s)
 {
-    int r;
+    int r, nmsrs, nfilt = 0, bitmap_pos = 0;
     struct kvm_msr_filter filter = { };
+    struct kvm_msr_filter_range *range;
+    uint8_t bitmap_buf[KVM_MSR_FILTER_MAX_RANGES * 8] = {0};
 
     filter.flags = KVM_MSR_FILTER_DEFAULT_ALLOW;
 
+    if (has_hyperv) {
+        /*
+         * Set filter on WRMSR to trap HV_X64_MSR_GUEST_OS_ID and
+         * HV_X64_MSR_HYPERCALL to userspace. These will be used to
+         * handle overlay requests.
+         */
+        nmsrs = 2;
+        range = &filter.ranges[nfilt++];
+        range->bitmap = &bitmap_buf[bitmap_pos];
+        kvm_set_msr_filter_range(range, KVM_MSR_FILTER_WRITE,
+                                 HV_X64_MSR_GUEST_OS_ID, nmsrs,
+                                 true, /* HV_X64_MSR_GUEST_OS_ID */
+                                 true  /* HV_X64_MSR_HYPERCALL */);
+        bitmap_pos += ROUND_UP(nmsrs, 8) / 8;
+        assert(bitmap_pos < sizeof(bitmap_buf));
+    }
+
     r = kvm_vm_ioctl(s, KVM_X86_SET_MSR_FILTER, &filter);
     if (r != 0) {
         error_report("kvm: failed to set MSR filters");
@@ -2363,6 +2382,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (has_hyperv && msr_filters_active) {
+        hyperv_overlay_init();
+    }
+
     return 0;
 }
 
@@ -4644,7 +4667,29 @@ static int kvm_handle_rdmsr(X86CPU *cpu, struct kvm_run *run)
 
 static int kvm_handle_wrmsr(X86CPU *cpu, struct kvm_run *run)
 {
-    run->msr.error = 1;
+    int r = 1;
+    uint32_t msr;
+    uint64_t data;
+
+    if (run->msr.reason != KVM_MSR_EXIT_REASON_FILTER) {
+        error_report("MSR exit without exit reason FILTER");
+        goto error;
+    }
+
+    msr = run->msr.index;
+    data = run->msr.data;
+
+    switch (msr) {
+    case HV_X64_MSR_GUEST_OS_ID:
+    case HV_X64_MSR_HYPERCALL:
+        r = kvm_hv_handle_wrmsr(cpu, msr, data);
+        break;
+    default:
+        error_report("Unknown MSR exit");
+    }
+
+error:
+    run->msr.error = r;
     return 0;
 }
 
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




