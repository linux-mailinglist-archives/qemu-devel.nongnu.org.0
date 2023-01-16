Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530166D14B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:06:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXV1-0006rE-Hf; Mon, 16 Jan 2023 16:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUq-0006iI-Pw
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:28 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUm-0003ZJ-MH
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=3pJacrtGk8HsrsY4V6VrJDP2p4XkfHWiGZISHMBu7eQ=; b=OOPia32tvCo/33ytInP/13m4cp
 3WxY2CFCz2H7wxbl8igrKbnB3vaA1BeL6LiT3StKZer+aILQp1rBmyEm7IslInP1+NJ+5OJ3jzotr
 Gj/TK5Mry1tDNfYl/Sh0zzgzjEQncyu8lztxiTJqlOcef78Q7qXVEUPQdpzc2ca4JFSBO6cajmT8C
 tFZtcuv8pNsg+K7uGkni7Jv6ShM4/bSmfq0WXQdBxBIk9mjh8cWd3zs5Iw1ba6RlbYX6bl8AROgCU
 Q7OAcECxVxhk6ORFRChRjiFD9lpqVHmQ0ys1TvqsasvmcwG2BcHsGts9sBxxAGL5kcEEYj4gXJ7/3
 wCTnKbQA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHXUl-0097VZ-9A; Mon, 16 Jan 2023 21:58:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUX-004iQG-1n; Mon, 16 Jan 2023 21:58:09 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 39/51] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback
Date: Mon, 16 Jan 2023 21:57:53 +0000
Message-Id: <20230116215805.1123514-40-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org;
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

The GSI callback (and later PCI_INTX) is a level triggered interrupt. It
is asserted when an event channel is delivered to vCPU0, and is supposed
to be cleared when the vcpu_info->evtchn_upcall_pending field for vCPU0
is cleared again.

Thankfully, Xen does *not* assert the GSI if the guest sets its own
evtchn_upcall_pending field; we only need to assert the GSI when we
have delivered an event for ourselves. So that's the easy part, kind of.

There's a slight complexity in that we need to hold the BQL before we
can call qemu_set_irq(), and we definitely can't do that while holding
our own port_lock (because we'll need to take that from the qemu-side
functions that the PV backend drivers will call). So if we end up
wanting to set the IRQ in a context where we *don't* already hold the
BQL, defer to a BH.

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
 hw/i386/kvm/xen_evtchn.c  | 97 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  4 ++
 hw/i386/pc.c              |  6 +++
 include/sysemu/kvm_xen.h  |  1 +
 target/i386/cpu.h         |  1 +
 target/i386/kvm/kvm.c     | 13 ++++++
 target/i386/kvm/xen-emu.c | 32 +++++++++++++
 target/i386/kvm/xen-emu.h |  1 +
 8 files changed, 155 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index a73db5d2bc..e2ecee9a6f 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -26,6 +26,8 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+#include "hw/i386/x86.h"
+#include "hw/irq.h"
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
@@ -99,9 +101,12 @@ struct XenEvtchnState {
     uint64_t callback_param;
     bool evtchn_in_kernel;
 
+    QEMUBH *gsi_bh;
+
     QemuMutex port_lock;
     uint32_t nr_ports;
     XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
+    qemu_irq gsis[GSI_NUM_PINS];
 };
 
 struct XenEvtchnState *xen_evtchn_singleton;
@@ -166,13 +171,42 @@ static const TypeInfo xen_evtchn_info = {
     .class_init    = xen_evtchn_class_init,
 };
 
+static void gsi_assert_bh(void *opaque)
+{
+    struct vcpu_info *vi = kvm_xen_get_vcpu_info_hva(0);
+    if (vi) {
+        xen_evtchn_set_callback_level(!!vi->evtchn_upcall_pending);
+    }
+}
+
 void xen_evtchn_create(void)
 {
     XenEvtchnState *s = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN,
                                                         -1, NULL));
+    int i;
+
     xen_evtchn_singleton = s;
 
     qemu_mutex_init(&s->port_lock);
+    s->gsi_bh = aio_bh_new(qemu_get_aio_context(), gsi_assert_bh, s);
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
@@ -182,6 +216,64 @@ static void xen_evtchn_register_types(void)
 
 type_init(xen_evtchn_register_types)
 
+void xen_evtchn_set_callback_level(int level)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint32_t param;
+
+    if (!s) {
+        return;
+    }
+
+    /*
+     * We get to this function in a number of ways:
+     *
+     *  • From I/O context, via PV backend drivers sending a notification to
+     *    the guest.
+     *
+     *  • From guest vCPU context, via loopback interdomain event channels
+     *    (or theoretically even IPIs but guests don't use those with GSI
+     *    delivery because that's pointless. We don't want a malicious guest
+     *    to be able to trigger a deadlock though, so we can't rule it out.)
+     *
+     *  • From guest vCPU context when the HVM_PARAM_CALLBACK_IRQ is being
+     *    configured.
+     *
+     *  • From guest vCPU context in the KVM exit handler, if the upcall
+     *    pending flag has been cleared and the GSI needs to be deasserted.
+     *
+     *  • Maybe in future, in an interrupt ack/eoi notifier when the GSI has
+     *    been acked in the irqchip.
+     *
+     * Whichever context we come from if we aren't already holding the BQL
+     * then e can't take it now, as we may already hold s->port_lock. So
+     * trigger the BH to set the IRQ for us instead of doing it immediately.
+     *
+     * In the HVM_PARAM_CALLBACK_IRQ and KVM exit handler cases, the caller
+     * will deliberately take the BQL because they want the change to take
+     * effect immediately. That just leaves interdomain loopback as the case
+     * which uses the BH.
+     */
+    if (!qemu_mutex_iothread_locked()) {
+        qemu_bh_schedule(s->gsi_bh);
+        return;
+    }
+
+    param = (uint32_t)s->callback_param;
+
+    switch (s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) {
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+        if (param < GSI_NUM_PINS) {
+            qemu_set_irq(s->gsis[param], level);
+            if (level) {
+                /* Ensure the vCPU polls for deassertion */
+                kvm_xen_set_callback_asserted();
+            }
+        }
+        break;
+    }
+}
+
 int xen_evtchn_set_callback_param(uint64_t param)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
@@ -207,6 +299,11 @@ int xen_evtchn_set_callback_param(uint64_t param)
         }
         break;
     }
+
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+        ret = 0;
+        break;
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 670f8b3f7d..1f9ffc3f94 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -12,9 +12,13 @@
 #ifndef QEMU_XEN_EVTCHN_H
 #define QEMU_XEN_EVTCHN_H
 
+#include "hw/sysbus.h"
+
 void xen_evtchn_create(void);
 int xen_evtchn_soft_reset(void);
 int xen_evtchn_set_callback_param(uint64_t param);
+void xen_evtchn_connect_gsis(qemu_irq *system_gsis);
+void xen_evtchn_set_callback_level(int level);
 
 void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
 void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8f668a5138..61a90c9e5b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1308,6 +1308,12 @@ void pc_basic_device_init(struct PCMachineState *pcms,
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
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index b2bcacd761..a32ee58852 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -22,6 +22,7 @@
 uint32_t kvm_xen_get_caps(void);
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
+void kvm_xen_set_callback_asserted(void);
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index dba8732fc6..e8718c31e5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1797,6 +1797,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
     uint8_t xen_vcpu_callback_vector;
+    bool xen_callback_asserted;
     uint16_t xen_virq[XEN_NR_VIRQS];
     uint64_t xen_singleshot_timer_ns;
 #endif
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index fa08cb6574..51ddf4bfa2 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5415,6 +5415,19 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
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
index bc7426b90f..27e0555baf 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -311,6 +311,31 @@ void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
     return X86_CPU(cs)->env.xen_vcpu_info_hva;
 }
 
+void kvm_xen_maybe_deassert_callback(CPUState *cs)
+{
+    CPUX86State *env = &X86_CPU(cs)->env;
+    struct vcpu_info *vi = env->xen_vcpu_info_hva;
+    if (!vi) {
+            return;
+    }
+
+    /* If the evtchn_upcall_pending flag is cleared, turn the GSI off. */
+    if (!vi->evtchn_upcall_pending) {
+        qemu_mutex_lock_iothread();
+        xen_evtchn_set_callback_level(0);
+        qemu_mutex_unlock_iothread();
+    }
+}
+
+void kvm_xen_set_callback_asserted(void)
+{
+    CPUState *cs = qemu_get_cpu(0);
+
+    if (cs) {
+        X86_CPU(cs)->env.xen_callback_asserted = true;
+    }
+}
+
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
 {
     CPUState *cs = qemu_get_cpu(vcpu_id);
@@ -343,6 +368,13 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
          */
         qemu_cpu_kick(cs);
         break;
+
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+    case HVM_PARAM_CALLBACK_TYPE_PCI_INTX:
+        if (vcpu_id == 0) {
+            xen_evtchn_set_callback_level(1);
+        }
+        break;
     }
 }
 
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 452605699a..fe85e0b195 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -28,5 +28,6 @@ int kvm_xen_init_vcpu(CPUState *cs);
 int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 int kvm_put_xen_state(CPUState *cs);
 int kvm_get_xen_state(CPUState *cs);
+void kvm_xen_maybe_deassert_callback(CPUState *cs);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.39.0


