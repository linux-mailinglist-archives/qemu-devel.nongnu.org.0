Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E763164E574
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:54:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5yoY-0005r1-6S; Thu, 15 Dec 2022 19:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynW-0005MF-R5
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:58 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynU-0006lq-06
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=LcaHmF/kMWTSEEQrkziKUiBG3ngCO21Jl2sYwAz7qyA=; b=iDQzcuzUnmYf4XX1hS3BfziiWN
 5ZcShCcUyQEhP4t7zOvNrE9tE0Q3hf3VAR5GBIKFhHs8GIQOrF1TRP6FiVnXRjuv0D2DUyfGkMlG6
 iVBXmw312Dp/Be/SZ48im2Bgzhiw5X1uZsS8mxWC5ojRJn9xMFgrRtrE6JOtOwCulNvpL4bDSuS9A
 fAovesr/Q7sNwI76EEEjZaesAml3Yz+pZDAwq9mBOVxGUnJosZRnRAkh3JDfKQ96Quh/pDEB3gATk
 CmWj2XuFgQ9ndX+XE8Bu8/7xRW88oEkJNyBseXzYn23U7WlLbRiyAdUSyi/Kij41dzWm2eB6+rhYR
 /m9xPlKA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymx-00Azz1-9b; Fri, 16 Dec 2022 00:41:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cQS-IA; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 37/38] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI
 callback
Date: Fri, 16 Dec 2022 00:41:16 +0000
Message-Id: <20221216004117.862106-38-dwmw2@infradead.org>
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

The GSI callback (and later PCI_INTX) is a level triggered interrupt. It
is asserted when an event channel is delivered to vCPU0, and is supposed
to be cleared when the vcpu_info->evtchn_upcall_pending field for vCPU0
is cleared again.

Thankfully, Xen does *not* assert the GSI if the guest sets its own
evtchn_upcall_pending field; we only need to assert the GSI when we
have delivered an event for ourselves. So that's the easy part.

However, we *do* need to poll for the evtchn_upcall_pending flag being
cleared. In an ideal world we would poll that when the EOI happens on
the PIC/IOAPIC. That's how it works in the kernel with the VFIO eventfd
pairs — one is used to trigger the interrupt, and the other works in the
other direction to 'resample' on EOI, and trigger the first eventfd
again if the line is still active.

However, QEMU doesn't seem to do that. Even VFIO level interrupts seem
to be supported by temporarily unmapping the device's BARs from the
guest when an interrupt happens, then trapping *all* MMIO to the device
and sending the 'resample' event on *every* MMIO access until the IRQ
is cleared! Maybe in future we'll plumb the 'resample' concept through
QEMU's irq framework but for now we'll do what Xen itself does: just
check the flag on every vmexit if the upcall GSI is known to be
asserted.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 88 +++++++++++++++++++++++++++++++++++----
 hw/i386/kvm/xen_evtchn.h  |  3 ++
 hw/i386/pc.c              | 10 ++++-
 include/sysemu/kvm_xen.h  |  2 +-
 target/i386/cpu.h         |  1 +
 target/i386/kvm/kvm.c     | 13 ++++++
 target/i386/kvm/xen-emu.c | 64 ++++++++++++++++++++--------
 target/i386/kvm/xen-emu.h |  1 +
 8 files changed, 154 insertions(+), 28 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 9292602c09..8ea8cf550e 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -24,6 +24,8 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+#include "hw/i386/x86.h"
+#include "hw/irq.h"
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
@@ -102,6 +104,7 @@ struct XenEvtchnState {
     QemuMutex port_lock;
     uint32_t nr_ports;
     XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
+    qemu_irq gsis[GSI_NUM_PINS];
 };
 
 struct XenEvtchnState *xen_evtchn_singleton;
@@ -166,9 +169,29 @@ static const TypeInfo xen_evtchn_info = {
 void xen_evtchn_create(void)
 {
     XenEvtchnState *s = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN, -1, NULL));
+    int i;
+
     xen_evtchn_singleton = s;
 
     qemu_mutex_init(&s->port_lock);
+
+    for (i = 0; i < GSI_NUM_PINS; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(s), &s->gsis[i]);
+    }
+}
+
+void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int i;
+
+    if (!s) {
+        return;
+    }
+
+    for (i = 0; i < GSI_NUM_PINS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i, system_gsis[i]);
+    }
 }
 
 static void xen_evtchn_register_types(void)
@@ -178,26 +201,75 @@ static void xen_evtchn_register_types(void)
 
 type_init(xen_evtchn_register_types)
 
-
 #define CALLBACK_VIA_TYPE_SHIFT       56
 
 int xen_evtchn_set_callback_param(uint64_t param)
 {
+    XenEvtchnState *s = xen_evtchn_singleton;
     int ret = -ENOSYS;
 
-    if (param >> CALLBACK_VIA_TYPE_SHIFT == HVM_PARAM_CALLBACK_TYPE_VECTOR) {
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
         struct kvm_xen_hvm_attr xa = {
             .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
             .u.vector = (uint8_t)param,
         };
 
         ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
-        if (!ret && xen_evtchn_singleton)
-            xen_evtchn_singleton->callback_param = param;
+        break;
+    }
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+        ret = 0;
+        break;
     }
+
+    if (!ret) {
+        s->callback_param = param;
+    }
+
     return ret;
 }
 
+static void xen_evtchn_set_callback_level(XenEvtchnState *s, int level)
+{
+    uint32_t param = (uint32_t)s->callback_param;
+
+    switch (s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) {
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+        if (param < GSI_NUM_PINS) {
+            qemu_set_irq(s->gsis[param], level);
+        }
+        break;
+    }
+}
+
+static void inject_callback(XenEvtchnState *s, uint32_t vcpu)
+{
+    if (kvm_xen_inject_vcpu_callback_vector(vcpu, s->callback_param)) {
+        return;
+    }
+
+    /* GSI or PCI_INTX delivery is only for events on vCPU 0 */
+    if (vcpu) {
+        return;
+    }
+
+    xen_evtchn_set_callback_level(s, 1);
+}
+
+void xen_evtchn_deassert_callback(void)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+
+    if (s) {
+        xen_evtchn_set_callback_level(s, 0);
+    }
+}
+
 static void deassign_kernel_port(evtchn_port_t port)
 {
     struct kvm_xen_hvm_attr ha;
@@ -359,7 +431,7 @@ static int do_unmask_port_lm(XenEvtchnState *s, evtchn_port_t port,
         return 0;
     }
 
-    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+    inject_callback(s, s->port_table[port].vcpu);
 
     return 0;
 }
@@ -413,7 +485,7 @@ static int do_unmask_port_compat(XenEvtchnState *s, evtchn_port_t port,
         return 0;
     }
 
-    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+    inject_callback(s, s->port_table[port].vcpu);
 
     return 0;
 }
@@ -481,7 +553,7 @@ static int do_set_port_lm(XenEvtchnState *s, evtchn_port_t port,
         return 0;
     }
 
-    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+    inject_callback(s, s->port_table[port].vcpu);
 
     return 0;
 }
@@ -524,7 +596,7 @@ static int do_set_port_compat(XenEvtchnState *s, evtchn_port_t port,
         return 0;
     }
 
-    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+    inject_callback(s, s->port_table[port].vcpu);
 
     return 0;
 }
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 2acbaeabaa..1176b67b91 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -9,9 +9,12 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "hw/sysbus.h"
 
 void xen_evtchn_create(void);
 int xen_evtchn_set_callback_param(uint64_t param);
+void xen_evtchn_connect_gsis(qemu_irq *system_gsis);
+void xen_evtchn_deassert_callback(void);
 
 void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
 void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 427f79e6a8..1c4941de8f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1303,6 +1303,12 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     }
     *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
 
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode == XEN_EMULATE) {
+        xen_evtchn_connect_gsis(gsi);
+    }
+#endif
+
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
     if (!xen_enabled() &&
@@ -1848,8 +1854,8 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
 {
 #ifdef CONFIG_XEN_EMU
     if (xen_mode == XEN_EMULATE) {
-            xen_overlay_create();
-            xen_evtchn_create();
+        xen_overlay_create();
+        xen_evtchn_create();
     }
 #endif
     return 0;
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index e5b14ffe8d..73fe5969b8 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -13,7 +13,7 @@
 #define QEMU_SYSEMU_KVM_XEN_H
 
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
-void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id);
+bool kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, uint64_t callback_param);
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
 
 #endif /* QEMU_SYSEMU_KVM_XEN_H */
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 846c738fd7..9330eb83fd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1795,6 +1795,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
     uint8_t xen_vcpu_callback_vector;
+    bool xen_callback_asserted;
     uint16_t xen_virq[XEN_NR_VIRQS];
 #endif
 #if defined(CONFIG_HVF)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index cbf41d6f81..32d808da37 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5431,6 +5431,19 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     char str[256];
     KVMState *state;
 
+#ifdef CONFIG_XEN_EMU
+    /*
+     * If the callback is asserted as a GSI (or PCI INTx) then check if
+     * vcpu_info->evtchn_upcall_pending has been cleared, and deassert
+     * the callback IRQ if so. Ideally we could hook into the PIC/IOAPIC
+     * EOI and only resample then, exactly how the VFIO eventfd pairs
+     * are designed to work for level triggered interrupts.
+     */
+    if (cpu->env.xen_callback_asserted) {
+        kvm_xen_maybe_deassert_callback(cs);
+    }
+#endif
+
     switch (run->exit_reason) {
     case KVM_EXIT_HLT:
         DPRINTF("handle_hlt\n");
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index a8c953e3ca..48ae47809a 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -240,18 +240,11 @@ static void *gpa_to_hva(uint64_t gpa)
                                              mrs.offset_within_region);
 }
 
-void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
+static void *vcpu_info_hva_from_cs(CPUState *cs)
 {
-    CPUState *cs = qemu_get_cpu(vcpu_id);
-    CPUX86State *env;
-    uint64_t gpa;
-
-    if (!cs) {
-        return NULL;
-    }
-    env = &X86_CPU(cs)->env;
+    CPUX86State *env = &X86_CPU(cs)->env;
+    uint64_t gpa = env->xen_vcpu_info_gpa;
 
-    gpa = env->xen_vcpu_info_gpa;
     if (gpa == UINT64_MAX)
         gpa = env->xen_vcpu_info_default_gpa;
     if (gpa == UINT64_MAX)
@@ -260,13 +253,38 @@ void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
     return gpa_to_hva(gpa);
 }
 
-void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id)
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
+{
+    CPUState *cs = qemu_get_cpu(vcpu_id);
+
+    if (!cs) {
+            return NULL;
+    }
+
+    return vcpu_info_hva_from_cs(cs);
+}
+
+void kvm_xen_maybe_deassert_callback(CPUState *cs)
+{
+    struct vcpu_info *vi = vcpu_info_hva_from_cs(cs);
+    if (!vi) {
+            return;
+    }
+
+    /* If the evtchn_upcall_pending flag is cleared, turn the GSI off. */
+    if (!vi->evtchn_upcall_pending) {
+        X86_CPU(cs)->env.xen_callback_asserted = false;
+        xen_evtchn_deassert_callback();
+    }
+}
+
+bool kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, uint64_t callback_param)
 {
     CPUState *cs = qemu_get_cpu(vcpu_id);
     uint8_t vector;
 
     if (!cs) {
-        return;
+        return false;
     }
     vector = X86_CPU(cs)->env.xen_vcpu_callback_vector;
 
@@ -278,13 +296,25 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id)
             .data = vector | (1UL << MSI_DATA_LEVEL_SHIFT),
         };
         kvm_irqchip_send_msi(kvm_state, msg);
-        return;
+        return true;
     }
 
-    /* If the evtchn_upcall_pending field in the vcpu_info is set, then
-     * KVM will automatically deliver the vector on entering the vCPU
-     * so all we have to do is kick it out. */
-    qemu_cpu_kick(cs);
+    switch(callback_param >> 56) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR:
+            /* If the evtchn_upcall_pending field in the vcpu_info is set, then
+             * KVM will automatically deliver the vector on entering the vCPU
+             * so all we have to do is kick it out. */
+            qemu_cpu_kick(cs);
+            return true;
+
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+    case HVM_PARAM_CALLBACK_TYPE_PCI_INTX:
+            if (vcpu_id == 0) {
+                X86_CPU(cs)->env.xen_callback_asserted = true;
+            }
+            return false;
+    }
+    return false;
 }
 
 static int kvm_xen_set_vcpu_timer(CPUState *cs)
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 58e4748d80..0ff8bed350 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -27,5 +27,6 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
 int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa);
 int kvm_xen_set_vcpu_callback_vector(CPUState *cs);
+void kvm_xen_maybe_deassert_callback(CPUState *cs);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.35.3


