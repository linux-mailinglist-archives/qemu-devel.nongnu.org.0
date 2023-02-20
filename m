Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047D69D53A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 21:50:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUD5T-0000GZ-J4; Mon, 20 Feb 2023 15:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+82aa7fb0aadd3de72584+7120+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pUD5G-0007iM-VK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:48:28 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+82aa7fb0aadd3de72584+7120+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pUD5B-0003aq-CO
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=VRCzjE9cI3al19dUScBX8PAb84Zq2eJvO7noVXU+JkU=; b=bAJNvrPjFoJ0PKwfBNoqUDe95f
 Li82XT4mFC+pRcsuDbMT9eELw9gzHSxywB4dLz0RZNEUlKhxfeC0EZr6+mmnWkpufGgHHj0ZPuBvm
 XyYlbHU1zqfs2U+b8xpBQ/PUzDEY5R0QMWKfPOUebtoWEd+PSvMUg9osAleXys0wprZbHgYq8Im/b
 J8moWhFT/uoHKMGbgzQ4yTpllm+eHenmZi6T9+ZBDs0T78UfpRma4J4tQiLiBNqMBipD4WqvqVIJZ
 KTG44ywp+B+oFYu/ThGrrz2FdpMMSGDSS6S1XXZYtGDiFSSYgeMlprbgpcSx5oqO7qmUMQSy8BKYS
 yLpr1Y8w==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pUD4X-00BvKw-10; Mon, 20 Feb 2023 20:48:05 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pUD4X-00B4uT-0b; Mon, 20 Feb 2023 20:47:41 +0000
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
Subject: [PATCH v12 57/60] hw/xen: Support MSI mapping to PIRQ
Date: Mon, 20 Feb 2023 20:47:33 +0000
Message-Id: <20230220204736.2639601-58-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230220204736.2639601-1-dwmw2@infradead.org>
References: <20230220204736.2639601-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+82aa7fb0aadd3de72584+7120+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Tested with passthrough igb and emulated e1000e + AHCI.

           CPU0       CPU1
  0:         65          0   IO-APIC   2-edge      timer
  1:          0         14  xen-pirq   1-ioapic-edge  i8042
  4:          0        846  xen-pirq   4-ioapic-edge  ttyS0
  8:          1          0  xen-pirq   8-ioapic-edge  rtc0
  9:          0          0  xen-pirq   9-ioapic-level  acpi
 12:        257          0  xen-pirq  12-ioapic-edge  i8042
 24:       9600          0  xen-percpu    -virq      timer0
 25:       2758          0  xen-percpu    -ipi       resched0
 26:          0          0  xen-percpu    -ipi       callfunc0
 27:          0          0  xen-percpu    -virq      debug0
 28:       1526          0  xen-percpu    -ipi       callfuncsingle0
 29:          0          0  xen-percpu    -ipi       spinlock0
 30:          0       8608  xen-percpu    -virq      timer1
 31:          0        874  xen-percpu    -ipi       resched1
 32:          0          0  xen-percpu    -ipi       callfunc1
 33:          0          0  xen-percpu    -virq      debug1
 34:          0       1617  xen-percpu    -ipi       callfuncsingle1
 35:          0          0  xen-percpu    -ipi       spinlock1
 36:          8          0   xen-dyn    -event     xenbus
 37:          0       6046  xen-pirq    -msi       ahci[0000:00:03.0]
 38:          1          0  xen-pirq    -msi-x     ens4
 39:          0         73  xen-pirq    -msi-x     ens4-rx-0
 40:         14          0  xen-pirq    -msi-x     ens4-rx-1
 41:          0         32  xen-pirq    -msi-x     ens4-tx-0
 42:         47          0  xen-pirq    -msi-x     ens4-tx-1

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/meson.build    |   7 +
 hw/i386/kvm/trace-events   |   1 +
 hw/i386/kvm/xen-stubs.c    |  27 ++++
 hw/i386/kvm/xen_evtchn.c   | 261 ++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h   |   8 ++
 hw/pci/msi.c               |  11 ++
 hw/pci/msix.c              |   7 +
 hw/pci/pci.c               |  17 +++
 include/hw/pci/msi.h       |   1 +
 target/i386/kvm/kvm.c      |  19 ++-
 target/i386/kvm/kvm_i386.h |   2 +
 target/i386/kvm/xen-emu.c  |   3 +-
 12 files changed, 354 insertions(+), 10 deletions(-)
 create mode 100644 hw/i386/kvm/xen-stubs.c

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 6d6981fced..82dd6ae7c6 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -12,3 +12,10 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
+
+xen_stubs_ss = ss.source_set()
+xen_stubs_ss.add(when: 'CONFIG_XEN_EMU', if_false: files(
+  'xen-stubs.c',
+))
+
+specific_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: xen_stubs_ss)
diff --git a/hw/i386/kvm/trace-events b/hw/i386/kvm/trace-events
index 04e60c5bb8..b83c3eb965 100644
--- a/hw/i386/kvm/trace-events
+++ b/hw/i386/kvm/trace-events
@@ -2,3 +2,4 @@ kvm_xen_map_pirq(int pirq, int gsi) "pirq %d gsi %d"
 kvm_xen_unmap_pirq(int pirq, int gsi) "pirq %d gsi %d"
 kvm_xen_get_free_pirq(int pirq, int type) "pirq %d type %d"
 kvm_xen_bind_pirq(int pirq, int port) "pirq %d port %d"
+kvm_xen_unmask_pirq(int pirq, char *dev, int vector) "pirq %d dev %s vector %d"
diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
new file mode 100644
index 0000000000..a95964bbac
--- /dev/null
+++ b/hw/i386/kvm/xen-stubs.c
@@ -0,0 +1,27 @@
+/*
+ * QEMU Xen emulation: QMP stubs
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "xen_evtchn.h"
+
+void xen_evtchn_snoop_msi(PCIDevice *dev, bool is_msix, unsigned int vector,
+                          uint64_t addr, uint32_t data, bool is_masked)
+{
+}
+
+void xen_evtchn_remove_pci_device(PCIDevice *dev)
+{
+}
+
+bool xen_evtchn_deliver_pirq_msi(uint64_t address, uint32_t data)
+{
+    return false;
+}
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 8df95742a7..4ec0c7af75 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -31,6 +31,8 @@
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
 #include "hw/irq.h"
 
 #include "xen_evtchn.h"
@@ -45,6 +47,9 @@
 #include "hw/xen/interface/memory.h"
 #include "hw/xen/interface/hvm/params.h"
 
+/* XX: For kvm_update_msi_routes_all() */
+#include "target/i386/kvm/kvm_i386.h"
+
 #define TYPE_XEN_EVTCHN "xen-evtchn"
 OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
 
@@ -119,6 +124,11 @@ struct xenevtchn_handle {
 struct pirq_info {
     int gsi;
     uint16_t port;
+    PCIDevice *dev;
+    int vector;
+    bool is_msix;
+    bool is_masked;
+    bool is_translated;
 };
 
 struct XenEvtchnState {
@@ -151,7 +161,7 @@ struct XenEvtchnState {
     /* Per-GSI assertion state (serialized) */
     uint32_t pirq_gsi_set;
 
-    /* Per-PIRQ information (rebuilt on migration) */
+    /* Per-PIRQ information (rebuilt on migration, protected by BQL) */
     struct pirq_info *pirq;
 };
 
@@ -1005,16 +1015,23 @@ static bool virq_is_global(uint32_t virq)
     }
 }
 
-static int close_port(XenEvtchnState *s, evtchn_port_t port)
+static int close_port(XenEvtchnState *s, evtchn_port_t port,
+                      bool *flush_kvm_routes)
 {
     XenEvtchnPort *p = &s->port_table[port];
 
+    /* Because it *might* be a PIRQ port */
+    assert(qemu_mutex_iothread_locked());
+
     switch (p->type) {
     case EVTCHNSTAT_closed:
         return -ENOENT;
 
     case EVTCHNSTAT_pirq:
         s->pirq[p->type_val].port = 0;
+        if (s->pirq[p->type_val].is_translated) {
+            *flush_kvm_routes = true;
+        }
         break;
 
     case EVTCHNSTAT_virq:
@@ -1063,6 +1080,7 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
 int xen_evtchn_soft_reset(void)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
+    bool flush_kvm_routes;
     int i;
 
     if (!s) {
@@ -1071,10 +1089,16 @@ int xen_evtchn_soft_reset(void)
 
     assert(qemu_mutex_iothread_locked());
 
-    QEMU_LOCK_GUARD(&s->port_lock);
+    qemu_mutex_lock(&s->port_lock);
 
     for (i = 0; i < s->nr_ports; i++) {
-        close_port(s, i);
+        close_port(s, i, &flush_kvm_routes);
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    if (flush_kvm_routes) {
+        kvm_update_msi_routes_all(NULL, true, 0, 0);
     }
 
     return 0;
@@ -1092,6 +1116,7 @@ int xen_evtchn_reset_op(struct evtchn_reset *reset)
 int xen_evtchn_close_op(struct evtchn_close *close)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
+    bool flush_kvm_routes = false;
     int ret;
 
     if (!s) {
@@ -1102,12 +1127,17 @@ int xen_evtchn_close_op(struct evtchn_close *close)
         return -EINVAL;
     }
 
+    QEMU_IOTHREAD_LOCK_GUARD();
     qemu_mutex_lock(&s->port_lock);
 
-    ret = close_port(s, close->port);
+    ret = close_port(s, close->port, &flush_kvm_routes);
 
     qemu_mutex_unlock(&s->port_lock);
 
+    if (flush_kvm_routes) {
+        kvm_update_msi_routes_all(NULL, true, 0, 0);
+    }
+
     return ret;
 }
 
@@ -1224,21 +1254,54 @@ int xen_evtchn_bind_pirq_op(struct evtchn_bind_pirq *pirq)
         return -EINVAL;
     }
 
-    QEMU_LOCK_GUARD(&s->port_lock);
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     if (s->pirq[pirq->pirq].port) {
         return -EBUSY;
     }
 
+    qemu_mutex_lock(&s->port_lock);
+
     ret = allocate_port(s, 0, EVTCHNSTAT_pirq, pirq->pirq,
                         &pirq->port);
     if (ret) {
+        qemu_mutex_unlock(&s->port_lock);
         return ret;
     }
 
     s->pirq[pirq->pirq].port = pirq->port;
     trace_kvm_xen_bind_pirq(pirq->pirq, pirq->port);
 
+    qemu_mutex_unlock(&s->port_lock);
+
+    /*
+     * Need to do the unmask outside port_lock because it may call
+     * back into the MSI translate function.
+     */
+    if (s->pirq[pirq->pirq].gsi == IRQ_MSI_EMU) {
+        if (s->pirq[pirq->pirq].is_masked) {
+            PCIDevice *dev = s->pirq[pirq->pirq].dev;
+            int vector = s->pirq[pirq->pirq].vector;
+            char *dev_path = qdev_get_dev_path(DEVICE(dev));
+
+            trace_kvm_xen_unmask_pirq(pirq->pirq, dev_path, vector);
+            g_free(dev_path);
+
+            if (s->pirq[pirq->pirq].is_msix) {
+                msix_set_mask(dev, vector, false);
+            } else {
+                msi_set_mask(dev, vector, false, NULL);
+            }
+        } else if (s->pirq[pirq->pirq].is_translated) {
+            /*
+             * If KVM had attempted to translate this one before, make it try
+             * again. If we unmasked, then the notifier on the MSI(-X) vector
+             * will already have had the same effect.
+             */
+            kvm_update_msi_routes_all(NULL, true, 0, 0);
+        }
+    }
+
     return ret;
 }
 
@@ -1555,6 +1618,178 @@ bool xen_evtchn_set_gsi(int gsi, int level)
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
+static void do_remove_pci_vector(XenEvtchnState *s, PCIDevice *dev, int vector,
+                                 int except_pirq)
+{
+    uint32_t pirq;
+
+    for (pirq = 0; pirq < s->nr_pirqs; pirq++) {
+        /*
+         * We could be cleverer here, but it isn't really a fast path, and
+         * this trivial optimisation is enough to let us skip the big gap
+         * in the middle a bit quicker (in terms of both loop iterations,
+         * and cache lines).
+         */
+        if (!(pirq & 63) && !(pirq_inuse_word(s, pirq))) {
+            pirq += 64;
+            continue;
+        }
+        if (except_pirq && pirq == except_pirq) {
+            continue;
+        }
+        if (s->pirq[pirq].dev != dev) {
+            continue;
+        }
+        if (vector != -1 && s->pirq[pirq].vector != vector) {
+            continue;
+        }
+
+        /* It could theoretically be bound to a port already, but that is OK. */
+        s->pirq[pirq].dev = dev;
+        s->pirq[pirq].gsi = IRQ_UNBOUND;
+        s->pirq[pirq].is_msix = false;
+        s->pirq[pirq].vector = 0;
+        s->pirq[pirq].is_masked = false;
+        s->pirq[pirq].is_translated = false;
+    }
+}
+
+void xen_evtchn_remove_pci_device(PCIDevice *dev)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+
+    if (!s) {
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+    do_remove_pci_vector(s, dev, -1, 0);
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
+    assert(qemu_mutex_iothread_locked());
+
+    pirq = msi_pirq_target(addr, data);
+
+    /*
+     * The PIRQ# must be sane, and there must be an allocated PIRQ in
+     * IRQ_UNBOUND or IRQ_MSI_EMU state to match it.
+     */
+    if (!pirq || pirq >= s->nr_pirqs || !pirq_inuse(s, pirq) ||
+        (s->pirq[pirq].gsi != IRQ_UNBOUND &&
+         s->pirq[pirq].gsi != IRQ_MSI_EMU)) {
+        pirq = 0;
+    }
+
+    if (pirq) {
+        s->pirq[pirq].dev = dev;
+        s->pirq[pirq].gsi = IRQ_MSI_EMU;
+        s->pirq[pirq].is_msix = is_msix;
+        s->pirq[pirq].vector = vector;
+        s->pirq[pirq].is_masked = is_masked;
+    }
+
+    /* Remove any (other) entries for this {device, vector} */
+    do_remove_pci_vector(s, dev, vector, pirq);
+}
+
+int xen_evtchn_translate_pirq_msi(struct kvm_irq_routing_entry *route,
+                                  uint64_t address, uint32_t data)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint32_t pirq, port;
+    CPUState *cpu;
+
+    if (!s) {
+        return 1; /* Not a PIRQ */
+    }
+
+    assert(qemu_mutex_iothread_locked());
+
+    pirq = msi_pirq_target(address, data);
+    if (!pirq || pirq >= s->nr_pirqs) {
+        return 1; /* Not a PIRQ */
+    }
+
+    if (!kvm_xen_has_cap(EVTCHN_2LEVEL)) {
+        return -ENOTSUP;
+    }
+
+    if (s->pirq[pirq].gsi != IRQ_MSI_EMU) {
+        return -EINVAL;
+    }
+
+    /* Remember that KVM tried to translate this. It might need to try again. */
+    s->pirq[pirq].is_translated = true;
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    port = s->pirq[pirq].port;
+    if (!valid_port(port)) {
+        return -EINVAL;
+    }
+
+    cpu = qemu_get_cpu(s->port_table[port].vcpu);
+    if (!cpu) {
+        return -EINVAL;
+    }
+
+    route->type = KVM_IRQ_ROUTING_XEN_EVTCHN;
+    route->u.xen_evtchn.port = port;
+    route->u.xen_evtchn.vcpu = kvm_arch_vcpu_id(cpu);
+    route->u.xen_evtchn.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
+
+    return 0; /* Handled */
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
+    assert(qemu_mutex_iothread_locked());
+
+    pirq = msi_pirq_target(address, data);
+    if (!pirq || pirq >= s->nr_pirqs) {
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
@@ -1565,6 +1800,7 @@ int xen_physdev_map_pirq(struct physdev_map_pirq *map)
         return -ENOTSUP;
     }
 
+    QEMU_IOTHREAD_LOCK_GUARD();
     QEMU_LOCK_GUARD(&s->port_lock);
 
     if (map->domid != DOMID_SELF && map->domid != xen_domid) {
@@ -1620,9 +1856,11 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
     if (pirq < 0 || pirq >= s->nr_pirqs)
         return -EINVAL;
 
-    QEMU_LOCK_GUARD(&s->port_lock);
+    QEMU_IOTHREAD_LOCK_GUARD();
+    qemu_mutex_lock(&s->port_lock);
 
     if (!pirq_inuse(s, pirq)) {
+        qemu_mutex_unlock(&s->port_lock);
         return -ENOENT;
     }
 
@@ -1630,6 +1868,7 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
 
     /* We can only unmap GSI PIRQs */
     if (gsi < 0) {
+        qemu_mutex_unlock(&s->port_lock);
         return -EINVAL;
     }
 
@@ -1638,6 +1877,12 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
     pirq_inuse_word(s, pirq) &= ~pirq_inuse_bit(pirq);
 
     trace_kvm_xen_unmap_pirq(pirq, gsi);
+    qemu_mutex_unlock(&s->port_lock);
+
+    if (gsi == IRQ_MSI_EMU) {
+        kvm_update_msi_routes_all(NULL, true, 0, 0);
+    }
+
     return 0;
 }
 
@@ -1651,6 +1896,7 @@ int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
         return -ENOTSUP;
     }
 
+    QEMU_IOTHREAD_LOCK_GUARD();
     QEMU_LOCK_GUARD(&s->port_lock);
 
     if (!pirq_inuse(s, pirq)) {
@@ -1680,6 +1926,7 @@ int xen_physdev_query_pirq(struct physdev_irq_status_query *query)
         return -ENOTSUP;
     }
 
+    QEMU_IOTHREAD_LOCK_GUARD();
     QEMU_LOCK_GUARD(&s->port_lock);
 
     if (!pirq_inuse(s, pirq)) {
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 95400b7fbf..bfb67ac2bc 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -25,6 +25,14 @@ void xen_evtchn_set_callback_level(int level);
 int xen_evtchn_set_port(uint16_t port);
 
 bool xen_evtchn_set_gsi(int gsi, int level);
+void xen_evtchn_snoop_msi(PCIDevice *dev, bool is_msix, unsigned int vector,
+                          uint64_t addr, uint32_t data, bool is_masked);
+void xen_evtchn_remove_pci_device(PCIDevice *dev);
+struct kvm_irq_routing_entry;
+int xen_evtchn_translate_pirq_msi(struct kvm_irq_routing_entry *route,
+                                  uint64_t address, uint32_t data);
+bool xen_evtchn_deliver_pirq_msi(uint64_t address, uint32_t data);
+
 
 /*
  * These functions mirror the libxenevtchn library API, providing the QEMU
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 1cadf150bc..041b0bdbec 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -24,6 +24,8 @@
 #include "qemu/range.h"
 #include "qapi/error.h"
 
+#include "hw/i386/kvm/xen_evtchn.h"
+
 /* PCI_MSI_ADDRESS_LO */
 #define PCI_MSI_ADDRESS_LO_MASK         (~0x3)
 
@@ -414,6 +416,15 @@ void msi_write_config(PCIDevice *dev, uint32_t addr, uint32_t val, int len)
     fprintf(stderr, "\n");
 #endif
 
+    if (xen_mode == XEN_EMULATE) {
+        for (vector = 0; vector < msi_nr_vectors(flags); vector++) {
+            MSIMessage msg = msi_prepare_message(dev, vector);
+
+            xen_evtchn_snoop_msi(dev, false, vector, msg.address, msg.data,
+                                 msi_is_masked(dev, vector));
+        }
+    }
+
     if (!(flags & PCI_MSI_FLAGS_ENABLE)) {
         return;
     }
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 9e70fcd6fa..ee2004b0b1 100644
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
@@ -124,6 +126,11 @@ static void msix_handle_mask_update(PCIDevice *dev, int vector, bool was_masked)
 {
     bool is_masked = msix_is_masked(dev, vector);
 
+    if (xen_mode == XEN_EMULATE) {
+        MSIMessage msg = msix_prepare_message(dev, vector);
+        xen_evtchn_snoop_msi(dev, true, vector, msg.address, msg.data, is_masked);
+    }
+
     if (is_masked == was_masked) {
         return;
     }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 208c16f450..0d2ac7f033 100644
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
@@ -319,6 +322,17 @@ static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
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
@@ -988,6 +1002,9 @@ static void do_pci_unregister_device(PCIDevice *pci_dev)
     pci_get_bus(pci_dev)->devices[pci_dev->devfn] = NULL;
     pci_config_free(pci_dev);
 
+    if (xen_mode == XEN_EMULATE) {
+        xen_evtchn_remove_pci_device(pci_dev);
+    }
     if (memory_region_is_mapped(&pci_dev->bus_master_enable_region)) {
         memory_region_del_subregion(&pci_dev->bus_master_container_region,
                                     &pci_dev->bus_master_enable_region);
diff --git a/include/hw/pci/msi.h b/include/hw/pci/msi.h
index ee8ee469a6..abcfd13925 100644
--- a/include/hw/pci/msi.h
+++ b/include/hw/pci/msi.h
@@ -33,6 +33,7 @@ extern bool msi_nonbroken;
 void msi_set_message(PCIDevice *dev, MSIMessage msg);
 MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector);
 bool msi_enabled(const PCIDevice *dev);
+void msi_set_enabled(PCIDevice *dev);
 int msi_init(struct PCIDevice *dev, uint8_t offset,
              unsigned int nr_vectors, bool msi64bit,
              bool msi_per_vector_mask, Error **errp);
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6d112ccddd..b497225fbd 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -44,6 +44,7 @@
 #include "qemu/error-report.h"
 #include "qemu/memalign.h"
 #include "hw/i386/x86.h"
+#include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
@@ -5639,6 +5640,20 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
         }
     }
 
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode == XEN_EMULATE) {
+        int handled = xen_evtchn_translate_pirq_msi(route, address, data);
+
+        /*
+         * If it was a PIRQ and successfully routed (handled == 0) or it was
+         * an error (handled < 0), return. If it wasn't a PIRQ, keep going.
+         */
+        if (handled <= 0) {
+            return handled;
+        }
+    }
+#endif
+
     address = kvm_swizzle_msi_ext_dest_id(address);
     route->u.msi.address_hi = address >> VTD_MSI_ADDR_HI_SHIFT;
     route->u.msi.address_lo = address & VTD_MSI_ADDR_LO_MASK;
@@ -5658,8 +5673,8 @@ struct MSIRouteEntry {
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
index 7e69d5659d..28eaf020a7 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -267,7 +267,8 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
                          1 << XENFEAT_auto_translated_physmap |
                          1 << XENFEAT_supervisor_mode_kernel |
                          1 << XENFEAT_hvm_callback_vector |
-                         1 << XENFEAT_hvm_safe_pvclock;
+                         1 << XENFEAT_hvm_safe_pvclock |
+                         1 << XENFEAT_hvm_pirqs;
         }
 
         err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
-- 
2.39.0


