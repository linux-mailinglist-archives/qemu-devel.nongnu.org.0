Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D66A82A5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAB-0005tQ-Ky; Thu, 02 Mar 2023 07:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6u-0002fC-C7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6s-0003KQ-Av
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7B8kC9fbTJB8WNXRcT9rQGyNOTgXhWFYATbCndhLFE=;
 b=QzAw9I04jxa+1XMulNIoT5rDqGbvBiziWTEcWIELmic83PeRu9et7HPp52LgtHUgjakRjd
 H6mHO02JZTh9ZNz9LHsDpY5ea8GNqbMGFVOeXFQ76UOXDaJohhz+BJ/HocqkjWMr9/bCZl
 1NoU00mwx63/hmnk2IfJF4AnU57skLg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-21lVMP0wPDeIplf76na6mw-1; Thu, 02 Mar 2023 07:32:32 -0500
X-MC-Unique: 21lVMP0wPDeIplf76na6mw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m7-20020a056000008700b002c7047ea429so3199691wrx.21
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7B8kC9fbTJB8WNXRcT9rQGyNOTgXhWFYATbCndhLFE=;
 b=dvtc4hDksAWoMrHEnk410xB8N5F/5pxY/qGvyF3CqiNbN5iv4/M6c5bXBDx9AbxrDt
 9qIddj/dfk4G/5X+zUkxpFojl81fE7rpBQSKUqEsw815CnnbbGkk/yTRqw4Rsx1rBxII
 VGMHL821yN3E2chwndBQZbAUxuztrvVqV4Tom726vMR2cSM+hQlr+jVLZpaKzTh5csoI
 3vOO+YBFQ4js2L2T6ZtyDz6sheceqnARGUGa6/1xoyNbT5xBQMHQhpwgTxzs61bG4bt1
 tBTXNwgB5vDf3rQqMfZd1jrjrPR+upm3UEmwPFDDtzdt4SsD3cUpGqKeogQrObOOVLaa
 VGkg==
X-Gm-Message-State: AO0yUKVt1Oq99H+FWMUYHWrqIL+1gmDgHJx9ZjLeENKzEEIqclVZJloS
 22ceyTECfkM3XKeHRGKaOAGbTkpqO4k9MjEzgO/fgC+siIHQ8f/ybomLOlc/4F8ty8LNCWwuoce
 WgyqdLffDRXLm/uVmd2F4JiLRGli17jr+0RPCLwZKugttAcaVIqfNr1Hoab/m+Wrp6rK55UiNQm
 M=
X-Received: by 2002:adf:dd0b:0:b0:2c7:bbe:456c with SMTP id
 a11-20020adfdd0b000000b002c70bbe456cmr7104484wrm.63.1677760351040; 
 Thu, 02 Mar 2023 04:32:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9Qi0LbLluQ5da7GSD4reh+6G+PiOs9KEYsBASCOFJMuDQMWD9uyDaNtOvqtJcx8eIYUR7thQ==
X-Received: by 2002:adf:dd0b:0:b0:2c7:bbe:456c with SMTP id
 a11-20020adfdd0b000000b002c70bbe456cmr7104465wrm.63.1677760350606; 
 Thu, 02 Mar 2023 04:32:30 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002c55521903bsm15013670wrr.51.2023.03.02.04.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 40/62] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback
Date: Thu,  2 Mar 2023 13:30:07 +0100
Message-Id: <20230302123029.153265-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 97 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  4 ++
 hw/i386/pc.c              |  6 +++
 include/sysemu/kvm_xen.h  |  1 +
 target/i386/cpu.h         |  1 +
 target/i386/kvm/kvm.c     | 11 +++++
 target/i386/kvm/xen-emu.c | 40 ++++++++++++++++
 target/i386/kvm/xen-emu.h |  1 +
 8 files changed, 161 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index e937de7a9358..6b0bdba65df3 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -27,6 +27,8 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+#include "hw/i386/x86.h"
+#include "hw/irq.h"
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
@@ -100,9 +102,12 @@ struct XenEvtchnState {
     uint64_t callback_param;
     bool evtchn_in_kernel;
 
+    QEMUBH *gsi_bh;
+
     QemuMutex port_lock;
     uint32_t nr_ports;
     XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
+    qemu_irq gsis[IOAPIC_NUM_PINS];
 };
 
 struct XenEvtchnState *xen_evtchn_singleton;
@@ -167,13 +172,42 @@ static const TypeInfo xen_evtchn_info = {
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
+    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
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
+    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i, system_gsis[i]);
+    }
 }
 
 static void xen_evtchn_register_types(void)
@@ -183,6 +217,64 @@ static void xen_evtchn_register_types(void)
 
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
+        if (param < IOAPIC_NUM_PINS) {
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
@@ -209,6 +301,11 @@ int xen_evtchn_set_callback_param(uint64_t param)
         }
         break;
     }
+
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+        ret = 0;
+        break;
+
     default:
         /* Xen doesn't return error even if you set something bogus */
         ret = 0;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 5d3e03553f34..b03c3108bcba 100644
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
 
 struct evtchn_status;
 struct evtchn_close;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f38e3f1be84a..71d3b8bec260 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1310,6 +1310,12 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     }
     *rtc_state = ISA_DEVICE(mc146818_rtc_init(isa_bus, 2000, rtc_irq));
 
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode == XEN_EMULATE) {
+        xen_evtchn_connect_gsis(gsi);
+    }
+#endif
+
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
     if (!xen_enabled() &&
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index fbb7414eb797..2b200302810b 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -23,6 +23,7 @@ int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
+void kvm_xen_set_callback_asserted(void);
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 4b70257db5dd..7227a8ec08d8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1808,6 +1808,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
     uint8_t xen_vcpu_callback_vector;
+    bool xen_callback_asserted;
     uint16_t xen_virq[XEN_NR_VIRQS];
     uint64_t xen_singleshot_timer_ns;
 #endif
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 5a144ec0de3a..3c3795506dbe 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4990,6 +4990,17 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
         kvm_rate_limit_on_bus_lock();
     }
 
+    /*
+     * If the callback is asserted as a GSI (or PCI INTx) then check if
+     * vcpu_info->evtchn_upcall_pending has been cleared, and deassert
+     * the callback IRQ if so. Ideally we could hook into the PIC/IOAPIC
+     * EOI and only resample then, exactly how the VFIO eventfd pairs
+     * are designed to work for level triggered interrupts.
+     */
+    if (x86_cpu->env.xen_callback_asserted) {
+        kvm_xen_maybe_deassert_callback(cpu);
+    }
+
     /* We need to protect the apic state against concurrent accesses from
      * different threads in case the userspace irqchip is used. */
     if (!kvm_irqchip_in_kernel()) {
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 821629f07765..b52617df5490 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -320,6 +320,39 @@ void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
     return X86_CPU(cs)->env.xen_vcpu_info_hva;
 }
 
+void kvm_xen_maybe_deassert_callback(CPUState *cs)
+{
+    CPUX86State *env = &X86_CPU(cs)->env;
+    struct vcpu_info *vi = env->xen_vcpu_info_hva;
+    if (!vi) {
+        return;
+    }
+
+    /* If the evtchn_upcall_pending flag is cleared, turn the GSI off. */
+    if (!vi->evtchn_upcall_pending) {
+        qemu_mutex_lock_iothread();
+        /*
+         * Check again now we have the lock, because it may have been
+         * asserted in the interim. And we don't want to take the lock
+         * every time because this is a fast path.
+         */
+        if (!vi->evtchn_upcall_pending) {
+            X86_CPU(cs)->env.xen_callback_asserted = false;
+            xen_evtchn_set_callback_level(0);
+        }
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
@@ -352,6 +385,13 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
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
index 452605699abb..fe85e0b19580 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -28,5 +28,6 @@ int kvm_xen_init_vcpu(CPUState *cs);
 int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 int kvm_put_xen_state(CPUState *cs);
 int kvm_get_xen_state(CPUState *cs);
+void kvm_xen_maybe_deassert_callback(CPUState *cs);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.39.1


