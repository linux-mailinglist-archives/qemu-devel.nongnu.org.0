Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1159664E562
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5yon-0006n7-BH; Thu, 15 Dec 2022 19:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynW-0005MH-S3
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:58 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynU-0006lr-0l
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=woARrJmRgiliWU/s2kD+HXuiJgoIfPM64yxExCX209A=; b=GsdkGRX7Q96KTPLIvL58h+qCBY
 v9jbqWd1j/QZ75NrbcDwgUjLA77AOjXDB2vDoZ4kFr+7Heas4B+fqw0vrBLEqOYPQPS6o8GB/XFrQ
 p/OXGQa2ZbWdId7DgfFN00BfsBGBFX7jHsejnmmHm+GRxsfOEvCJFYhU9g3nNc9JE/FZ9tMjbyL5w
 IWcU6ZZHLmz7L+wEWJfVGRY2PWBulkU0GgaO9sAPQgTBzX093OqR9r57R0/JwtNmDrssvnsS9jvwc
 vBFPf3tNOw3yrTdldO7Epp3fcq/1nVbyrKlC5jcFD797LU4RH9WAurq0fAz+UJwyp2JC5OinSprYO
 Cvx8+jOQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymz-00Azyx-9H; Fri, 16 Dec 2022 00:41:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cPn-As; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 27/38] hw/xen: Implement EVTCHNOP_unmask
Date: Fri, 16 Dec 2022 00:41:06 +0000
Message-Id: <20221216004117.862106-28-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This finally comes with a mechanism for actually injecting events into
the guest vCPU, with all the atomic-test-and-set that's involved in
setting the bit in the shinfo, then the index in the vcpu_info, and
injecting either the lapic vector as MSI, or letting KVM inject the
bare vector.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 198 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 include/sysemu/kvm_xen.h  |  18 ++++
 target/i386/kvm/xen-emu.c |  72 ++++++++++++++
 4 files changed, 290 insertions(+)
 create mode 100644 include/sysemu/kvm_xen.h

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index d4008e7ee1..50adef0864 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -21,10 +21,13 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
 
 #include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+
 #include <linux/kvm.h>
 
 #include "standard-headers/xen/memory.h"
@@ -39,6 +42,41 @@ typedef struct XenEvtchnPort {
     uint16_t type_val;  /* pirq# / virq# / remote port according to type */
 } XenEvtchnPort;
 
+/* 32-bit compatibility definitions, also used natively in 32-bit build */
+struct compat_arch_vcpu_info {
+    unsigned int cr2;
+    unsigned int pad[5];
+};
+
+struct compat_vcpu_info {
+    uint8_t evtchn_upcall_pending;
+    uint8_t evtchn_upcall_mask;
+    uint16_t pad;
+    uint32_t evtchn_pending_sel;
+    struct compat_arch_vcpu_info arch;
+    struct vcpu_time_info time;
+}; /* 64 bytes (x86) */
+
+struct compat_arch_shared_info {
+    unsigned int max_pfn;
+    unsigned int pfn_to_mfn_frame_list_list;
+    unsigned int nmi_reason;
+    unsigned int p2m_cr3;
+    unsigned int p2m_vaddr;
+    unsigned int p2m_generation;
+    uint32_t wc_sec_hi;
+};
+
+struct compat_shared_info {
+    struct compat_vcpu_info vcpu_info[XEN_LEGACY_MAX_VCPUS];
+    uint32_t evtchn_pending[32];
+    uint32_t evtchn_mask[32];
+    uint32_t wc_version;      /* Version counter: see vcpu_time_info_t. */
+    uint32_t wc_sec;
+    uint32_t wc_nsec;
+    struct compat_arch_shared_info arch;
+};
+
 #define COMPAT_EVTCHN_2L_NR_CHANNELS            1024
 
 /*
@@ -222,6 +260,144 @@ int xen_evtchn_status_op(struct evtchn_status *status)
     return 0;
 }
 
+/*
+ * Never thought I'd hear myself say this, but C++ templates would be
+ * kind of nice here.
+ *
+ * template<class T> static int do_unmask_port(T *shinfo, ...);
+ */
+static int do_unmask_port_lm(XenEvtchnState *s, evtchn_port_t port,
+                             bool do_unmask, struct shared_info *shinfo,
+                             struct vcpu_info *vcpu_info)
+{
+    const int bits_per_word = BITS_PER_BYTE * sizeof(shinfo->evtchn_pending[0]);
+    typeof(shinfo->evtchn_pending[0]) mask;
+    int idx = port / bits_per_word;
+    int offset = port % bits_per_word;
+
+    mask = 1UL << offset;
+
+    if (idx >= bits_per_word) {
+        return -EINVAL;
+    }
+
+    if (do_unmask) {
+        /* If this is a true unmask operation, clear the mask bit. If
+         * it was already unmasked, we have nothing further to do. */
+        if (!((qatomic_fetch_and(&shinfo->evtchn_mask[idx], ~mask) & mask))) {
+            return 0;
+        }
+    } else {
+        /* This is a pseudo-unmask for affinity changes. We don't
+         * change the mask bit, and if it's *masked* we have nothing
+         * else to do. */
+        if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+            return 0;
+        }
+    }
+
+    /* If the event was not pending, we're done. */
+    if (!(qatomic_fetch_or(&shinfo->evtchn_pending[idx], 0) & mask)) {
+        return 0;
+    }
+
+    /* Now on to the vcpu_info evtchn_pending_sel index... */
+    mask = 1UL << idx;
+
+    /* If a port in this word was already pending for this vCPU, all done. */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_pending_sel, mask) & mask) {
+        return 0;
+    }
+
+    /* Set evtchn_upcall_pending for this vCPU */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_upcall_pending, 1)) {
+        return 0;
+    }
+
+    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+
+    return 0;
+}
+
+static int do_unmask_port_compat(XenEvtchnState *s, evtchn_port_t port,
+                                 bool do_unmask,
+                                 struct compat_shared_info *shinfo,
+                                 struct compat_vcpu_info *vcpu_info)
+{
+    const int bits_per_word = BITS_PER_BYTE * sizeof(shinfo->evtchn_pending[0]);
+    typeof(shinfo->evtchn_pending[0]) mask;
+    int idx = port / bits_per_word;
+    int offset = port % bits_per_word;
+
+    mask = 1UL << offset;
+
+    if (idx >= bits_per_word) {
+        return -EINVAL;
+    }
+
+    if (do_unmask) {
+        /* If this is a true unmask operation, clear the mask bit. If
+         * it was already unmasked, we have nothing further to do. */
+        if (!((qatomic_fetch_and(&shinfo->evtchn_mask[idx], ~mask) & mask))) {
+            return 0;
+        }
+    } else {
+        /* This is a pseudo-unmask for affinity changes. We don't
+         * change the mask bit, and if it's *masked* we have nothing
+         * else to do. */
+        if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+            return 0;
+        }
+    }
+
+    /* If the event was not pending, we're done. */
+    if (!(qatomic_fetch_or(&shinfo->evtchn_pending[idx], 0) & mask)) {
+        return 0;
+    }
+
+    /* Now on to the vcpu_info evtchn_pending_sel index... */
+    mask = 1UL << idx;
+
+    /* If a port in this word was already pending for this vCPU, all done. */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_pending_sel, mask) & mask) {
+        return 0;
+    }
+
+    /* Set evtchn_upcall_pending for this vCPU */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_upcall_pending, 1)) {
+        return 0;
+    }
+
+    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+
+    return 0;
+}
+
+static int unmask_port(XenEvtchnState *s, evtchn_port_t port, bool do_unmask)
+{
+    void *vcpu_info, *shinfo;
+
+    if (s->port_table[port].type == EVTCHNSTAT_closed) {
+        return -EINVAL;
+    }
+
+    shinfo = xen_overlay_page_ptr(XENMAPSPACE_shared_info, 0);
+    if (!shinfo) {
+        return -ENOTSUP;
+    }
+
+    vcpu_info = kvm_xen_get_vcpu_info_hva(s->port_table[port].vcpu);
+    if (!vcpu_info) {
+        return -EINVAL;
+    }
+
+    if (xen_is_long_mode()) {
+        return do_unmask_port_lm(s, port, do_unmask, shinfo, vcpu_info);
+    } else {
+        return do_unmask_port_compat(s, port, do_unmask, shinfo, vcpu_info);
+    }
+}
+
 static void free_port(XenEvtchnState *s, evtchn_port_t port)
 {
     s->port_table[port].type = EVTCHNSTAT_closed;
@@ -272,3 +448,25 @@ int xen_evtchn_close_op(struct evtchn_close *close)
 
     return ret;
 }
+
+int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(unmask->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = unmask_port(s, unmask->port, true);
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 4c00000315..2fb7d70043 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -15,5 +15,7 @@ int xen_evtchn_set_callback_param(uint64_t param);
 
 struct evtchn_status;
 struct evtchn_close;
+struct evtchn_unmask;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
+int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
new file mode 100644
index 0000000000..ab629feb13
--- /dev/null
+++ b/include/sysemu/kvm_xen.h
@@ -0,0 +1,18 @@
+/*
+ * Xen HVM emulation support in KVM
+ *
+ * Copyright © 2019 Oracle and/or its affiliates. All rights reserved.
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_SYSEMU_KVM_XEN_H
+#define QEMU_SYSEMU_KVM_XEN_H
+
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
+void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id);
+
+#endif /* QEMU_SYSEMU_KVM_XEN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index f57d99f9d6..51cb6bf052 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -15,10 +15,13 @@
 #include "qemu/log.h"
 #include "hw/xen/xen.h"
 #include "sysemu/kvm_int.h"
+#include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
 #include "exec/address-spaces.h"
 #include "xen-emu.h"
 #include "trace.h"
+#include "hw/pci/msi.h"
+#include "hw/i386/apic-msidef.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "sysemu/runstate.h"
@@ -227,6 +230,63 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
                           env->xen_vcpu_info_gpa);
 }
 
+
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
+    if (gpa == UINT64_MAX)
+        gpa = env->xen_vcpu_info_default_gpa;
+    if (gpa == UINT64_MAX)
+        return NULL;
+
+    return gpa_to_hva(gpa);
+}
+
+void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id)
+{
+    CPUState *cs = qemu_get_cpu(vcpu_id);
+    uint8_t vector;
+
+    if (!cs) {
+        return;
+    }
+    vector = X86_CPU(cs)->env.xen_vcpu_callback_vector;
+
+    if (vector) {
+        /* The per-vCPU callback vector injected via lapic. Just
+         * deliver it as an MSI. */
+        MSIMessage msg = {
+            .address = APIC_DEFAULT_ADDRESS | X86_CPU(cs)->apic_id,
+            .data = vector | (1UL << MSI_DATA_LEVEL_SHIFT),
+        };
+        kvm_irqchip_send_msi(kvm_state, msg);
+        return;
+    }
+
+    /* If the evtchn_upcall_pending field in the vcpu_info is set, then
+     * KVM will automatically deliver the vector on entering the vCPU
+     * so all we have to do is kick it out. */
+    qemu_cpu_kick(cs);
+}
+
 static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -652,6 +712,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_close_op(&close);
         break;
     }
+    case EVTCHNOP_unmask: {
+        struct evtchn_unmask unmask;
+
+        qemu_build_assert(sizeof(unmask) == 4);
+        if (kvm_copy_from_gva(cs, arg, &unmask, sizeof(unmask))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_unmask_op(&unmask);
+        break;
+    }
     default:
         return false;
     }
-- 
2.35.3


