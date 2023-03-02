Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B076A82C1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8f-0003qC-IA; Thu, 02 Mar 2023 07:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6y-0002g1-BJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6v-0003Kz-3i
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IdUIlpIs8IPN6BMwzU1eu+jWD9U/sh3sma8wPlM1EBA=;
 b=g9I56g/qDbcyRi96bKP3A8bTLtjpcAYLkGr3ihGSFh0DPW7pm088WnCDKWNGCFGf5xzyfa
 3TOUG9FBtgOjgDAh9BctOU1WoC3kjb0c/gQGarr0v42R2ooV80YlKt+X/Nci08dws5r3d6
 LyCVO1QB7MbKMWRapo7mgo7xX+euirQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-vScGSOkoMT2816wzmv2T7Q-1; Thu, 02 Mar 2023 07:32:35 -0500
X-MC-Unique: vScGSOkoMT2816wzmv2T7Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so1010575wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IdUIlpIs8IPN6BMwzU1eu+jWD9U/sh3sma8wPlM1EBA=;
 b=kfGYQsCd43nCEqOlHMeiWLeJMw9873mtv4L9yv9AZKzc/QzswTRwXN5v8bKxiuS4Ph
 g7YgNaShsr56EuEx/s9fLwwWiuWc8fCIAmITEeSdd9o6sIAbLy3+xjrispV/eEhxNOf1
 9GPfO3M2l22j2YWVVS0POLpEBC64Osb0bKLbBPLBk4Bv00JTKzDhvbfyniTTQy1mhmpi
 sJJiNGlQrF8WmtcVaVvpmi3ZbgAHS3McNIJr2tYkAD7tynRqm5N8KdQur5tNj8vndqhj
 y3ZHt4hKW/L+NAsdl3ahoDcv8bGqY0m+M3KaxFhqBV+AZdpK4VrudexT/IP61IOIhHAG
 uHLA==
X-Gm-Message-State: AO0yUKXrqmL/0mD3heyaIPtmOsUCVfuAluEC+9fH2J3VEOgpQqMSFdEb
 345jC7h5VFLAdfwlKUsKVx4C565dgSNpT7TAtG/cm8tSo6bvDGUe723V/uJwmRXswZK88zkcRxK
 cALkshYIMYc1j7ZJGI8mM/e0v5OLWn2lPyqlCTY0t9G0c6aFdQV4nTVM++J71C1yXH45c8ZbwkP
 Q=
X-Received: by 2002:a5d:5651:0:b0:2c7:604:52a1 with SMTP id
 j17-20020a5d5651000000b002c7060452a1mr7338558wrw.29.1677760353816; 
 Thu, 02 Mar 2023 04:32:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9CxpDH+3WIb6HbRWDOsKWHc19TYx1GmKkJDrJ9i5NgCzKsXdz0Au16jGdVgUwmnoezONT5Qg==
X-Received: by 2002:a5d:5651:0:b0:2c7:604:52a1 with SMTP id
 j17-20020a5d5651000000b002c7060452a1mr7338543wrw.29.1677760353539; 
 Thu, 02 Mar 2023 04:32:33 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 a10-20020adfe5ca000000b002c3dc4131f5sm14842379wrn.18.2023.03.02.04.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 41/62] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_PCI_INTX callback
Date: Thu,  2 Mar 2023 13:30:08 +0100
Message-Id: <20230302123029.153265-42-pbonzini@redhat.com>
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

The guest is permitted to specify an arbitrary domain/bus/device/function
and INTX pin from which the callback IRQ shall appear to have come.

In QEMU we can only easily do this for devices that actually exist, and
even that requires us "knowing" that it's a PCMachine in order to find
the PCI root bus — although that's OK really because it's always true.

We also don't get to get notified of INTX routing changes, because we
can't do that as a passive observer; if we try to register a notifier
it will overwrite any existing notifier callback on the device.

But in practice, guests using PCI_INTX will only ever use pin A on the
Xen platform device, and won't swizzle the INTX routing after they set
it up. So this is just fine.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 80 ++++++++++++++++++++++++++++++++-------
 target/i386/kvm/xen-emu.c | 34 +++++++++++++++++
 2 files changed, 100 insertions(+), 14 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 6b0bdba65df3..f39b751ff999 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -28,6 +28,8 @@
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
 #include "hw/i386/x86.h"
+#include "hw/i386/pc.h"
+#include "hw/pci/pci.h"
 #include "hw/irq.h"
 
 #include "xen_evtchn.h"
@@ -101,6 +103,7 @@ struct XenEvtchnState {
 
     uint64_t callback_param;
     bool evtchn_in_kernel;
+    uint32_t callback_gsi;
 
     QEMUBH *gsi_bh;
 
@@ -217,11 +220,41 @@ static void xen_evtchn_register_types(void)
 
 type_init(xen_evtchn_register_types)
 
+static int set_callback_pci_intx(XenEvtchnState *s, uint64_t param)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    uint8_t pin = param & 3;
+    uint8_t devfn = (param >> 8) & 0xff;
+    uint16_t bus = (param >> 16) & 0xffff;
+    uint16_t domain = (param >> 32) & 0xffff;
+    PCIDevice *pdev;
+    PCIINTxRoute r;
+
+    if (domain || !pcms) {
+        return 0;
+    }
+
+    pdev = pci_find_device(pcms->bus, bus, devfn);
+    if (!pdev) {
+        return 0;
+    }
+
+    r = pci_device_route_intx_to_irq(pdev, pin);
+    if (r.mode != PCI_INTX_ENABLED) {
+        return 0;
+    }
+
+    /*
+     * Hm, can we be notified of INTX routing changes? Not without
+     * *owning* the device and being allowed to overwrite its own
+     * ->intx_routing_notifier, AFAICT. So let's not.
+     */
+    return r.irq;
+}
+
 void xen_evtchn_set_callback_level(int level)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
-    uint32_t param;
-
     if (!s) {
         return;
     }
@@ -260,18 +293,12 @@ void xen_evtchn_set_callback_level(int level)
         return;
     }
 
-    param = (uint32_t)s->callback_param;
-
-    switch (s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) {
-    case HVM_PARAM_CALLBACK_TYPE_GSI:
-        if (param < IOAPIC_NUM_PINS) {
-            qemu_set_irq(s->gsis[param], level);
-            if (level) {
-                /* Ensure the vCPU polls for deassertion */
-                kvm_xen_set_callback_asserted();
-            }
+    if (s->callback_gsi && s->callback_gsi < IOAPIC_NUM_PINS) {
+        qemu_set_irq(s->gsis[s->callback_gsi], level);
+        if (level) {
+            /* Ensure the vCPU polls for deassertion */
+            kvm_xen_set_callback_asserted();
         }
-        break;
     }
 }
 
@@ -283,15 +310,22 @@ int xen_evtchn_set_callback_param(uint64_t param)
         .u.vector = 0,
     };
     bool in_kernel = false;
+    uint32_t gsi = 0;
+    int type = param >> CALLBACK_VIA_TYPE_SHIFT;
     int ret;
 
     if (!s) {
         return -ENOTSUP;
     }
 
+    /*
+     * We need the BQL because set_callback_pci_intx() may call into PCI code,
+     * and because we may need to manipulate the old and new GSI levels.
+     */
+    assert(qemu_mutex_iothread_locked());
     qemu_mutex_lock(&s->port_lock);
 
-    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
+    switch (type) {
     case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
         xa.u.vector = (uint8_t)param,
 
@@ -299,10 +333,17 @@ int xen_evtchn_set_callback_param(uint64_t param)
         if (!ret && kvm_xen_has_cap(EVTCHN_SEND)) {
             in_kernel = true;
         }
+        gsi = 0;
         break;
     }
 
+    case HVM_PARAM_CALLBACK_TYPE_PCI_INTX:
+        gsi = set_callback_pci_intx(s, param);
+        ret = gsi ? 0 : -EINVAL;
+        break;
+
     case HVM_PARAM_CALLBACK_TYPE_GSI:
+        gsi = (uint32_t)param;
         ret = 0;
         break;
 
@@ -320,6 +361,17 @@ int xen_evtchn_set_callback_param(uint64_t param)
         }
         s->callback_param = param;
         s->evtchn_in_kernel = in_kernel;
+
+        if (gsi != s->callback_gsi) {
+            struct vcpu_info *vi = kvm_xen_get_vcpu_info_hva(0);
+
+            xen_evtchn_set_callback_level(0);
+            s->callback_gsi = gsi;
+
+            if (gsi && vi && vi->evtchn_upcall_pending) {
+                kvm_xen_inject_vcpu_callback_vector(0, type);
+            }
+        }
     }
 
     qemu_mutex_unlock(&s->port_lock);
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index b52617df5490..9e22c9fa025f 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -131,6 +131,38 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
         return ret;
     }
 
+    /* If called a second time, don't repeat the rest of the setup. */
+    if (s->xen_caps) {
+        return 0;
+    }
+
+    /*
+     * Event channel delivery via GSI/PCI_INTX needs to poll the vcpu_info
+     * of vCPU0 to deassert the IRQ when ->evtchn_upcall_pending is cleared.
+     *
+     * In the kernel, there's a notifier hook on the PIC/IOAPIC which allows
+     * such things to be polled at precisely the right time. We *could* do
+     * it nicely in the kernel: check vcpu_info[0]->evtchn_upcall_pending at
+     * the moment the IRQ is acked, and see if it should be reasserted.
+     *
+     * But the in-kernel irqchip is deprecated, so we're unlikely to add
+     * that support in the kernel. Insist on using the split irqchip mode
+     * instead.
+     *
+     * This leaves us polling for the level going low in QEMU, which lacks
+     * the appropriate hooks in its PIC/IOAPIC code. Even VFIO is sending a
+     * spurious 'ack' to an INTX IRQ every time there's any MMIO access to
+     * the device (for which it has to unmap the device and trap access, for
+     * some period after an IRQ!!). In the Xen case, we do it on exit from
+     * KVM_RUN, if the flag is set to say that the GSI is currently asserted.
+     * Which is kind of icky, but less so than the VFIO one. I may fix them
+     * both later...
+     */
+    if (!kvm_kernel_irqchip_split()) {
+        error_report("kvm: Xen support requires kernel-irqchip=split");
+        return -EINVAL;
+    }
+
     s->xen_caps = xen_caps;
     return 0;
 }
@@ -684,7 +716,9 @@ static bool handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
 
     switch (hp.index) {
     case HVM_PARAM_CALLBACK_IRQ:
+        qemu_mutex_lock_iothread();
         err = xen_evtchn_set_callback_param(hp.value);
+        qemu_mutex_unlock_iothread();
         xen_set_long_mode(exit->u.hcall.longmode);
         break;
     default:
-- 
2.39.1


