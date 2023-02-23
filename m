Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C216A093A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVB23-0000nE-Lt; Thu, 23 Feb 2023 07:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pVAzp-0004gC-C3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:49 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pVAzb-0004l0-Pa
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=WuECcGxy1ppCAdEq+3AOGWsBlwtShiHQo3ajsHO0Pdc=; b=mrN07DV2huTO5JwXtHBJJ+XVhv
 hBzKttLFEoTlytwGGl0D65lM6juFYny6Lfay5I0kLz6fzDlEGaJkQwxTB+ehjOkqDBq3b/XAAyGOd
 gr0Ny9I6E9y2fgJFYinPOjWK7gBM+OMSPvBlF6UshuM7Kgf8NeYdAYF+jY3aG3YTWiroEfyTbuoXZ
 k+dpM1anBHRWi8LT826Hw8J5Fla3xzwn9H5iL+zSkfX27RbiXyVzSPbWrM5KIDC5u709FPrEGDXHv
 gxux+7wZEKgHqcuwjPcbNXC3xBbRqWzBApm4VyRBHo06yMO8ZST/ZafF9LuiNdf5CseftszIjXuJN
 uxtObRBw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pVAzJ-00EMjB-JW; Thu, 23 Feb 2023 12:46:18 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pVAzJ-00DYre-1u; Thu, 23 Feb 2023 12:46:17 +0000
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
Subject: [PATCH v13 41/60] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_PCI_INTX
 callback
Date: Thu, 23 Feb 2023 12:45:54 +0000
Message-Id: <20230223124613.3231331-42-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223124613.3231331-1-dwmw2@infradead.org>
References: <20230223124613.3231331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org;
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
index ecc93da172..5d5996641d 100644
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
-        if (param < GSI_NUM_PINS) {
-            qemu_set_irq(s->gsis[param], level);
-            if (level) {
-                /* Ensure the vCPU polls for deassertion */
-                kvm_xen_set_callback_asserted();
-            }
+    if (s->callback_gsi && s->callback_gsi < GSI_NUM_PINS) {
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
index 5be3c5a2c2..c13d97ef69 100644
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
@@ -681,7 +713,9 @@ static bool handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
 
     switch (hp.index) {
     case HVM_PARAM_CALLBACK_IRQ:
+        qemu_mutex_lock_iothread();
         err = xen_evtchn_set_callback_param(hp.value);
+        qemu_mutex_unlock_iothread();
         xen_set_long_mode(exit->u.hcall.longmode);
         break;
     default:
-- 
2.39.0


