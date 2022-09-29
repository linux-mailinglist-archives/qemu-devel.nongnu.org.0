Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BFB5EEFBC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:55:02 +0200 (CEST)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoNp-00077I-Q6
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnkH-0004CZ-OR
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:14:12 -0400
Received: from mga04.intel.com ([192.55.52.120]:1943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnkF-0003rv-Lc
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664435647; x=1695971647;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=1HHLTf+mZEpAZdLpZzQsDowRVBDqPVQnup/F4dRvES4=;
 b=M36mFj52JVgKog7mul6OGEnj27d6vSwF4OliiydaHX9ylofyPeIfSRlX
 7PLxA7xogkGuB9+Uc+y4JaBJxm4fGyvz6go3JUNYYbCTCT6a98XFq/925
 uorX+VWiwbOl+hgIZKnDO72Tgj6nc8Oc1IO5/wMkQuUBqYvCyH0QQUPEq
 oXE0BomC0z0bw8/9FofpFs773UslDHupocTexLSc8je8OJ3YBYiTbM2sI
 ZLnGTuAbxjdzfUDVaniHgMK8dx7+9YSseJPQxwaUPygB1xeLV267tfLiL
 gAnXnOrJ5m32fKQBZtiUDp34K71Qcw3nLvsd3t4TPe7Yd83EFEJVDwti2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="300534133"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="300534133"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:14:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="655440736"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="655440736"
Received: from chenyi-pc.sh.intel.com ([10.239.159.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:14:03 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [RESEND PATCH v8 3/4] kvm: expose struct KVMState
Date: Thu, 29 Sep 2022 15:20:13 +0800
Message-Id: <20220929072014.20705-4-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929072014.20705-1-chenyi.qiang@intel.com>
References: <20220929072014.20705-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=chenyi.qiang@intel.com; helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expose struct KVMState out of kvm-all.c so that the field of struct
KVMState can be accessed when defining target-specific accelerator
properties.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 accel/kvm/kvm-all.c      | 74 ---------------------------------------
 include/sysemu/kvm_int.h | 75 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 74 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f90c5cb285..3624ed8447 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -77,86 +77,12 @@
     do { } while (0)
 #endif
 
-#define KVM_MSI_HASHTAB_SIZE    256
-
 struct KVMParkedVcpu {
     unsigned long vcpu_id;
     int kvm_fd;
     QLIST_ENTRY(KVMParkedVcpu) node;
 };
 
-enum KVMDirtyRingReaperState {
-    KVM_DIRTY_RING_REAPER_NONE = 0,
-    /* The reaper is sleeping */
-    KVM_DIRTY_RING_REAPER_WAIT,
-    /* The reaper is reaping for dirty pages */
-    KVM_DIRTY_RING_REAPER_REAPING,
-};
-
-/*
- * KVM reaper instance, responsible for collecting the KVM dirty bits
- * via the dirty ring.
- */
-struct KVMDirtyRingReaper {
-    /* The reaper thread */
-    QemuThread reaper_thr;
-    volatile uint64_t reaper_iteration; /* iteration number of reaper thr */
-    volatile enum KVMDirtyRingReaperState reaper_state; /* reap thr state */
-};
-
-struct KVMState
-{
-    AccelState parent_obj;
-
-    int nr_slots;
-    int fd;
-    int vmfd;
-    int coalesced_mmio;
-    int coalesced_pio;
-    struct kvm_coalesced_mmio_ring *coalesced_mmio_ring;
-    bool coalesced_flush_in_progress;
-    int vcpu_events;
-    int robust_singlestep;
-    int debugregs;
-#ifdef KVM_CAP_SET_GUEST_DEBUG
-    QTAILQ_HEAD(, kvm_sw_breakpoint) kvm_sw_breakpoints;
-#endif
-    int max_nested_state_len;
-    int many_ioeventfds;
-    int intx_set_mask;
-    int kvm_shadow_mem;
-    bool kernel_irqchip_allowed;
-    bool kernel_irqchip_required;
-    OnOffAuto kernel_irqchip_split;
-    bool sync_mmu;
-    uint64_t manual_dirty_log_protect;
-    /* The man page (and posix) say ioctl numbers are signed int, but
-     * they're not.  Linux, glibc and *BSD all treat ioctl numbers as
-     * unsigned, and treating them as signed here can break things */
-    unsigned irq_set_ioctl;
-    unsigned int sigmask_len;
-    GHashTable *gsimap;
-#ifdef KVM_CAP_IRQ_ROUTING
-    struct kvm_irq_routing *irq_routes;
-    int nr_allocated_irq_routes;
-    unsigned long *used_gsi_bitmap;
-    unsigned int gsi_count;
-    QTAILQ_HEAD(, KVMMSIRoute) msi_hashtab[KVM_MSI_HASHTAB_SIZE];
-#endif
-    KVMMemoryListener memory_listener;
-    QLIST_HEAD(, KVMParkedVcpu) kvm_parked_vcpus;
-
-    /* For "info mtree -f" to tell if an MR is registered in KVM */
-    int nr_as;
-    struct KVMAs {
-        KVMMemoryListener *ml;
-        AddressSpace *as;
-    } *as;
-    uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
-    uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
-    struct KVMDirtyRingReaper reaper;
-};
-
 KVMState *kvm_state;
 bool kvm_kernel_irqchip;
 bool kvm_split_irqchip;
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 1f5487d9b7..07394744ad 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -36,6 +36,81 @@ typedef struct KVMMemoryListener {
     int as_id;
 } KVMMemoryListener;
 
+#define KVM_MSI_HASHTAB_SIZE    256
+
+enum KVMDirtyRingReaperState {
+    KVM_DIRTY_RING_REAPER_NONE = 0,
+    /* The reaper is sleeping */
+    KVM_DIRTY_RING_REAPER_WAIT,
+    /* The reaper is reaping for dirty pages */
+    KVM_DIRTY_RING_REAPER_REAPING,
+};
+
+/*
+ * KVM reaper instance, responsible for collecting the KVM dirty bits
+ * via the dirty ring.
+ */
+struct KVMDirtyRingReaper {
+    /* The reaper thread */
+    QemuThread reaper_thr;
+    volatile uint64_t reaper_iteration; /* iteration number of reaper thr */
+    volatile enum KVMDirtyRingReaperState reaper_state; /* reap thr state */
+};
+struct KVMState
+{
+    AccelState parent_obj;
+
+    int nr_slots;
+    int fd;
+    int vmfd;
+    int coalesced_mmio;
+    int coalesced_pio;
+    struct kvm_coalesced_mmio_ring *coalesced_mmio_ring;
+    bool coalesced_flush_in_progress;
+    int vcpu_events;
+    int robust_singlestep;
+    int debugregs;
+#ifdef KVM_CAP_SET_GUEST_DEBUG
+    QTAILQ_HEAD(, kvm_sw_breakpoint) kvm_sw_breakpoints;
+#endif
+    int max_nested_state_len;
+    int many_ioeventfds;
+    int intx_set_mask;
+    int kvm_shadow_mem;
+    bool kernel_irqchip_allowed;
+    bool kernel_irqchip_required;
+    OnOffAuto kernel_irqchip_split;
+    bool sync_mmu;
+    uint64_t manual_dirty_log_protect;
+    /* The man page (and posix) say ioctl numbers are signed int, but
+     * they're not.  Linux, glibc and *BSD all treat ioctl numbers as
+     * unsigned, and treating them as signed here can break things */
+    unsigned irq_set_ioctl;
+    unsigned int sigmask_len;
+    GHashTable *gsimap;
+#ifdef KVM_CAP_IRQ_ROUTING
+    struct kvm_irq_routing *irq_routes;
+    int nr_allocated_irq_routes;
+    unsigned long *used_gsi_bitmap;
+    unsigned int gsi_count;
+    QTAILQ_HEAD(, KVMMSIRoute) msi_hashtab[KVM_MSI_HASHTAB_SIZE];
+#endif
+    KVMMemoryListener memory_listener;
+    QLIST_HEAD(, KVMParkedVcpu) kvm_parked_vcpus;
+
+    /* For "info mtree -f" to tell if an MR is registered in KVM */
+    int nr_as;
+    struct KVMAs {
+        KVMMemoryListener *ml;
+        AddressSpace *as;
+    } *as;
+    uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
+    uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
+    struct KVMDirtyRingReaper reaper;
+    NotifyVmexitOption notify_vmexit;
+    uint32_t notify_window;
+};
+
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
                                   AddressSpace *as, int as_id, const char *name);
 
-- 
2.17.1


