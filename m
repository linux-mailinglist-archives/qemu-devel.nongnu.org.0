Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38DA66A7BC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 01:40:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGUa7-0004i7-7Z; Fri, 13 Jan 2023 19:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+cc7f48ec5f75d1861b59+7083+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pGUZz-0004gI-0x
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:39:27 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+cc7f48ec5f75d1861b59+7083+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pGUZv-0005Mc-Lu
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=kHw7tETYwFwxNEq4tlw8FwStK2cp7IVPRKCbN8zHAro=; b=GQNCxeTXLN4PKcDwNkoHei3XI9
 hEMcSEG4B4iX2ycunjjIGfwIQu4jo+tTGK7y6Zx4l0/FAuPxqYa37fGIdV7HKKbSsY0Qj49NJX89y
 0IbwTDCFXHVY0DULuO1nXr8NNEkpnYYm4qunH1GfghKnr9k+oqTjXP6lU9gjv1M7T91DtP+YRmSHE
 6qmAmwi48y0n9LOylHghbJ0dtLutiWlxZ/gkPDYSE07XqzHooVcJBADqG/P8eDEEIRMDXeLnxK8iq
 tJy2K09YAftScSoktShoAcOv892vmGHWJSenySQgd1YTwyNnab/ieJICVKcQZKbbHRLQpz+POWtN+
 bf/oxzag==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pGUZy-006abv-Ey; Sat, 14 Jan 2023 00:39:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pGUZk-001C2S-Vu; Sat, 14 Jan 2023 00:39:13 +0000
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
 arcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [RFC PATCH 5/5] hw/xen: Support MSI mapping to PIRQ
Date: Sat, 14 Jan 2023 00:39:09 +0000
Message-Id: <20230114003909.284331-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230114003909.284331-1-dwmw2@infradead.org>
References: <20230114003909.284331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+cc7f48ec5f75d1861b59+7083+infradead.org+dwmw2@casper.srs.infradead.org;
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

The way that Xen handles MSI PIRQs is kind of awful.

There is a special MSI message which targets a PIRQ. The vector in the
low bits of data must be zero. The low 8 bits of the PIRQ# are in the
destination ID field, the extended destination ID field is unused, and
instead the high bits of the PIRQ# are in the high 32 bits of the address.

Using the high bits of the address means that we can't intercept and
translate these messages in kvm_send_msi(), because they won't be caught
by the APIC — addresses like 0x1000fee46000 aren't in the APIC's range.

So we catch them in pci_msi_trigger() instead, and deliver the event
channel directly.

That isn't even the worst part. The worst part is that Xen snoops on
writes to devices' MSI vectors while they are *masked*. When a MSI
message is written which looks like it targets a PIRQ, it remembers
the device and vector for later.

When the guest makes a hypercall to bind that PIRQ# (snooped from a
marked MSI vector) to an event channel port, Xen *unmasks* that MSI
vector on the device. Xen guests using PIRQ delivery of MSI don't
ever actually unmask the MSI for themselves.

Now that this is working we can finally enable XENFEAT_hvm_pirqs and
let the guest use it all.

  0:         36          0   IO-APIC   2-edge      timer
  1:          0         16  xen-pirq   1-ioapic-edge  i8042
  4:          0        960  xen-pirq   4-ioapic-edge  ttyS0
  8:          1          0  xen-pirq   8-ioapic-edge  rtc0
  9:          0          0  xen-pirq   9-ioapic-level  acpi
 12:        257          0  xen-pirq  12-ioapic-edge  i8042
 14:          0          0   IO-APIC  14-edge      ata_piix
 15:          0          0   IO-APIC  15-edge      ata_piix
 24:      11667          0  xen-percpu    -virq      timer0
 25:       3074          0  xen-percpu    -ipi       resched0
 26:          0          0  xen-percpu    -ipi       callfunc0
 27:          0          0  xen-percpu    -virq      debug0
 28:        488          0  xen-percpu    -ipi       callfuncsingle0
 29:          0          0  xen-percpu    -ipi       spinlock0
 30:          0      14209  xen-percpu    -virq      timer1
 31:          0      12386  xen-percpu    -ipi       resched1
 32:          0          0  xen-percpu    -ipi       callfunc1
 33:          0          0  xen-percpu    -virq      debug1
 34:          0        401  xen-percpu    -ipi       callfuncsingle1
 35:          0          0  xen-percpu    -ipi       spinlock1
 36:          8          0   xen-dyn    -event     xenbus
 37:          0       5693  xen-pirq    -msi       ahci[0000:00:04.0]

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen-stubs.c    |  11 +++
 hw/i386/kvm/xen_evtchn.c   | 141 ++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h   |   7 ++
 hw/pci/msi.c               |  13 ++++
 hw/pci/msix.c              |   7 +-
 hw/pci/pci.c               |  14 ++++
 target/i386/kvm/kvm.c      |  12 +++-
 target/i386/kvm/kvm_i386.h |   2 +
 target/i386/kvm/xen-emu.c  |   3 +-
 9 files changed, 202 insertions(+), 8 deletions(-)

diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
index 6f433dc995..8b64fcf6c5 100644
--- a/hw/i386/kvm/xen-stubs.c
+++ b/hw/i386/kvm/xen-stubs.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
+#include "xen_evtchn.h"
 
 EvtchnInfoList *qmp_xen_event_list(Error **errp)
 {
@@ -23,3 +24,13 @@ void qmp_xen_event_inject(uint32_t port, Error **errp)
 {
     error_setg(errp, "Xen event channel emulation not enabled");
 }
+
+void xen_evtchn_snoop_msi(PCIDevice *dev, bool is_msix, unsigned int vector,
+                          uint64_t addr, uint32_t data, bool is_masked)
+{
+}
+
+bool xen_evtchn_deliver_pirq_msi(uint64_t address, uint32_t data)
+{
+    return false;
+}
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index c4103ee98b..8e128ff8bc 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -30,9 +30,10 @@
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
 #include "hw/irq.h"
 #include "hw/xen/xen_backend_ops.h"
-
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
 #include "xen_xenstore.h"
@@ -45,6 +46,9 @@
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/params.h"
 
+/* XX: For kvm_update_msi_routes_all() */
+#include "target/i386/kvm/kvm_i386.h"
+
 #define TYPE_XEN_EVTCHN "xen-evtchn"
 OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
 
@@ -121,6 +125,10 @@ struct xenevtchn_handle {
 struct pirq_info {
     int gsi;
     uint16_t port;
+    PCIDevice *dev;
+    int vector;
+    bool is_msix;
+    bool is_masked;
 };
 
 struct XenEvtchnState {
@@ -289,7 +297,18 @@ static int pirq_bind_port(XenEvtchnState *s, int pirq, uint16_t port)
     s->pirq[pirq].port = port;
     trace_kvm_xen_bind_pirq(pirq, port);
 
-    /* XX: We need to unmask MSI here, when we get to that */
+    if (port && s->pirq[pirq].gsi == IRQ_MSI_EMU) {
+         if (s->pirq[pirq].is_msix) {
+            msix_set_mask(s->pirq[pirq].dev, s->pirq[pirq].vector,
+                          false);
+        } else {
+            msi_set_mask(s->pirq[pirq].dev, s->pirq[pirq].vector,
+                         false, &error_fatal);
+        }
+    }
+    if (!port) {
+        /* XX: Want to invalidate MSI routing here but we'd deadlock */
+    }
     return 0;
 }
 
@@ -1464,6 +1483,115 @@ bool xen_evtchn_set_gsi(int gsi, int level)
     return true;
 }
 
+static uint32_t msi_pirq_target(uint64_t addr, uint32_t data)
+{
+    /* The vector (in low 8 bits of data) must be zero */
+    if (data & 0xff)
+        return 0;
+
+    uint32_t pirq = (addr & 0xff000) >> 12;
+    pirq |= (addr >> 32) & 0xffffff00;
+
+    return pirq;
+}
+
+void xen_evtchn_snoop_msi(PCIDevice *dev, bool is_msix, unsigned int vector,
+                          uint64_t addr, uint32_t data, bool is_masked)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint32_t pirq;
+
+    if (!s) {
+        return;
+    }
+
+    pirq = msi_pirq_target(addr, data);
+    if (!pirq || pirq >= MAX_XEN_PIRQ) {
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (s->pirq[pirq].gsi != IRQ_UNBOUND && s->pirq[pirq].gsi != IRQ_MSI_EMU) {
+        return;
+    }
+
+    if (s->pirq[pirq].dev != dev) {
+        if (s->pirq[pirq].dev) {
+            object_unref(OBJECT(s->pirq[pirq].dev));
+        }
+        object_ref(OBJECT(dev));
+        s->pirq[pirq].dev = dev;
+    }
+
+    s->pirq[pirq].gsi = IRQ_MSI_EMU;
+    s->pirq[pirq].is_msix = is_msix;
+    s->pirq[pirq].vector = vector;
+    s->pirq[pirq].is_masked = is_masked;
+
+}
+
+bool xen_evtchn_translate_pirq_msi(struct kvm_irq_routing_entry *route,
+                                   uint64_t address, uint32_t data)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint32_t pirq, port;
+    CPUState *cpu;
+
+    if (!s) {
+        return false;
+    }
+
+    pirq = msi_pirq_target(address, data);
+    if (!pirq || pirq >= MAX_XEN_PIRQ) {
+        return false;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    port = s->pirq[pirq].port;
+    if (!valid_port(port)) {
+        return false;
+    }
+
+    cpu = qemu_get_cpu(s->port_table[port].vcpu);
+    if (!cpu) {
+        return false;
+    }
+
+    route->type = KVM_IRQ_ROUTING_XEN_EVTCHN;
+    route->u.xen_evtchn.port = port;
+    route->u.xen_evtchn.vcpu = kvm_arch_vcpu_id(cpu);
+    route->u.xen_evtchn.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
+
+    return true;
+}
+
+bool xen_evtchn_deliver_pirq_msi(uint64_t address, uint32_t data)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint32_t pirq, port;
+
+    if (!s) {
+        return false;
+    }
+
+    pirq = msi_pirq_target(address, data);
+    if (!pirq || pirq >= MAX_XEN_PIRQ) {
+        return false;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    port = s->pirq[pirq].port;
+    if (!valid_port(port)) {
+        return false;
+    }
+
+    set_port_pending(s, port);
+    return true;
+}
+
 int xen_physdev_map_pirq(struct physdev_map_pirq *map)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
@@ -1529,9 +1657,10 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
     if (pirq < 0 || pirq >= MAX_XEN_PIRQ)
         return -EINVAL;
 
-    QEMU_LOCK_GUARD(&s->port_lock);
+    qemu_mutex_lock(&s->port_lock);
 
     if (!pirq_inuse(s, pirq)) {
+        qemu_mutex_unlock(&s->port_lock);
         return -ENOENT;
     }
 
@@ -1539,6 +1668,7 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
 
     /* We can only unmap GSI PIRQs */
     if (gsi < 0) {
+        qemu_mutex_unlock(&s->port_lock);
         return -EINVAL;
     }
 
@@ -1547,6 +1677,11 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
     pirq_inuse_word(s, pirq) &= ~pirq_inuse_bit(pirq);
 
     trace_kvm_xen_unmap_pirq(pirq, gsi);
+    qemu_mutex_unlock(&s->port_lock);
+
+    if (gsi == IRQ_MSI_EMU)
+        kvm_update_msi_routes_all(NULL, true, 0, 0);
+
     return 0;
 }
 
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index dba9d6b021..3f8b757194 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -25,6 +25,13 @@ void xen_evtchn_set_callback_level(int level);
 int xen_evtchn_set_port(uint16_t port);
 
 bool xen_evtchn_set_gsi(int gsi, int level);
+void xen_evtchn_snoop_msi(PCIDevice *dev, bool is_msix, unsigned int vector,
+                          uint64_t addr, uint32_t data, bool is_masked);
+struct kvm_irq_routing_entry;
+bool xen_evtchn_translate_pirq_msi(struct kvm_irq_routing_entry *route,
+                                   uint64_t address, uint32_t data);
+bool xen_evtchn_deliver_pirq_msi(uint64_t address, uint32_t data);
+
 
 /*
  * These functions mirror the libxenevtchn library API, providing the QEMU
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 1cadf150bc..f09b7f3fca 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -24,6 +24,8 @@
 #include "qemu/range.h"
 #include "qapi/error.h"
 
+#include "hw/i386/kvm/xen_evtchn.h"
+
 /* PCI_MSI_ADDRESS_LO */
 #define PCI_MSI_ADDRESS_LO_MASK         (~0x3)
 
@@ -431,6 +433,17 @@ void msi_write_config(PCIDevice *dev, uint32_t addr, uint32_t val, int len)
      */
     pci_device_deassert_intx(dev);
 
+    if (xen_mode == XEN_EMULATE) {
+        for (vector = 0; vector < msi_nr_vectors(flags); vector++) {
+            MSIMessage msg = msi_prepare_message(dev, vector);
+
+            xen_evtchn_snoop_msi(dev, false, vector, msg.address, msg.data,
+                                 msi_is_masked(dev, vector));
+        }
+    }
+
+
+
     /*
      * nr_vectors might be set bigger than capable. So clamp it.
      * This is not legal by spec, so we can do anything we like,
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 9e70fcd6fa..afa77b8d71 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -26,6 +26,8 @@
 #include "qapi/error.h"
 #include "trace.h"
 
+#include "hw/i386/kvm/xen_evtchn.h"
+
 /* MSI enable bit and maskall bit are in byte 1 in FLAGS register */
 #define MSIX_CONTROL_OFFSET (PCI_MSIX_FLAGS + 1)
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
@@ -105,16 +107,17 @@ bool msix_is_masked(PCIDevice *dev, unsigned int vector)
 static void msix_fire_vector_notifier(PCIDevice *dev,
                                       unsigned int vector, bool is_masked)
 {
-    MSIMessage msg;
+    MSIMessage msg = msi_get_message(dev, vector);
     int ret;
 
+    xen_evtchn_snoop_msi(dev, true, vector, msg.address, msg.data, is_masked);
+
     if (!dev->msix_vector_use_notifier) {
         return;
     }
     if (is_masked) {
         dev->msix_vector_release_notifier(dev, vector);
     } else {
-        msg = msix_get_message(dev, vector);
         ret = dev->msix_vector_use_notifier(dev, vector, msg);
         assert(ret >= 0);
     }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c2fb88f9a3..fdb8d4abc9 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -49,6 +49,9 @@
 #include "qemu/cutils.h"
 #include "pci-internal.h"
 
+#include "hw/xen/xen.h"
+#include "hw/i386/kvm/xen_evtchn.h"
+
 //#define DEBUG_PCI
 #ifdef DEBUG_PCI
 # define PCI_DPRINTF(format, ...)       printf(format, ## __VA_ARGS__)
@@ -318,6 +321,17 @@ static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs = {};
 
+    /*
+     * Xen uses the high bits of the address to contain some of the bits
+     * of the PIRQ#. Therefore we can't just send the write cycle and
+     * trust that it's caught by the APIC at 0xfee00000 because the
+     * target of the write might be e.g. 0x0x1000fee46000 for PIRQ#4166.
+     * So we intercept the delivery here instead of in kvm_send_msi().
+     */
+    if (xen_mode == XEN_EMULATE &&
+        xen_evtchn_deliver_pirq_msi(msg.address, msg.data)) {
+        return;
+    }
     attrs.requester_id = pci_requester_id(dev);
     address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                          attrs, NULL);
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 76bdd9d7ea..6d307cdcad 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -43,6 +43,7 @@
 #include "qemu/error-report.h"
 #include "qemu/memalign.h"
 #include "hw/i386/x86.h"
+#include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
@@ -5640,6 +5641,13 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
         }
     }
 
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode == XEN_EMULATE &&
+        xen_evtchn_translate_pirq_msi(route, address, data)) {
+        return 0;
+    }
+#endif
+
     address = kvm_swizzle_msi_ext_dest_id(address);
     route->u.msi.address_hi = address >> VTD_MSI_ADDR_HI_SHIFT;
     route->u.msi.address_lo = address & VTD_MSI_ADDR_LO_MASK;
@@ -5659,8 +5667,8 @@ struct MSIRouteEntry {
 static QLIST_HEAD(, MSIRouteEntry) msi_route_list = \
     QLIST_HEAD_INITIALIZER(msi_route_list);
 
-static void kvm_update_msi_routes_all(void *private, bool global,
-                                      uint32_t index, uint32_t mask)
+void kvm_update_msi_routes_all(void *private, bool global,
+                               uint32_t index, uint32_t mask)
 {
     int cnt = 0, vector;
     MSIRouteEntry *entry;
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 6a5c24e3dc..e24753abfe 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -51,6 +51,8 @@ bool kvm_hv_vpindex_settable(void);
 bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
 
 uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
+void kvm_update_msi_routes_all(void *private, bool global,
+                               uint32_t index, uint32_t mask);
 
 bool kvm_enable_sgx_provisioning(KVMState *s);
 void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c956390e2c..0f1a7c8edf 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -266,7 +266,8 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
                          1 << XENFEAT_auto_translated_physmap |
                          1 << XENFEAT_supervisor_mode_kernel |
                          1 << XENFEAT_hvm_callback_vector |
-                         1 << XENFEAT_hvm_safe_pvclock;
+                         1 << XENFEAT_hvm_safe_pvclock |
+                         1 << XENFEAT_hvm_pirqs;
         }
 
         err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
-- 
2.35.3


