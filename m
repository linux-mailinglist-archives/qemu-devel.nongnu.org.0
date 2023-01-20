Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645A675550
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:15:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrDe-0006bO-Dv; Fri, 20 Jan 2023 08:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+010e331da30354bf639d+7089+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pIrDV-0006YP-M4
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:14:01 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+010e331da30354bf639d+7089+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pIrDR-0000fr-1V
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=Sk7SeOwm57E9WmJLyP90Zisf+vZYk/Yq6ngofcaRl28=; b=malyLqD7MaVHs8aYg4ZNdb/L7b
 rgt/aIWda47eXSJOWoGSNi95A2qnKkS9pVDsgkMi7QR6Yh5W4KjefJILBBdESbsgLoFJXki9pGvPU
 NezQxtvN3rfxyBWZrPM1WtDRvQFNBz2eNXmWvSR19+COZypW4Kwfh2JLvQkQlp1qw++Bybv5aJZFN
 SWE23rC7XPXwRsqb8UNRFNjCU4KWgNhy1rxJ0QoJGH8IcIVy5AedVb9hKRvXNkG+AGKWz4rsiyGCp
 gfqQDgKqPMeeiwMfHgDbafJQSludhXSAlaIWeK2YO8npUpWrt/uqaS/tYP9yE87CW4p0MzKTB7Ri4
 rRH7MvBg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIrDK-001yFd-LH; Fri, 20 Jan 2023 13:13:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pIrDK-0063Gu-26; Fri, 20 Jan 2023 13:13:50 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v8 56/58] hw/xen: Support GSI mapping to PIRQ
Date: Fri, 20 Jan 2023 13:13:41 +0000
Message-Id: <20230120131343.1441939-57-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120131343.1441939-1-dwmw2@infradead.org>
References: <20230120131343.1441939-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+010e331da30354bf639d+7089+infradead.org+dwmw2@casper.srs.infradead.org;
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

If I advertise XENFEAT_hvm_pirqs then a guest now boots successfully as
long as I tell it 'pci=nomsi'.

[root@localhost ~]# cat /proc/interrupts
           CPU0
  0:         52   IO-APIC   2-edge      timer
  1:         16  xen-pirq   1-ioapic-edge  i8042
  4:       1534  xen-pirq   4-ioapic-edge  ttyS0
  8:          1  xen-pirq   8-ioapic-edge  rtc0
  9:          0  xen-pirq   9-ioapic-level  acpi
 11:       5648  xen-pirq  11-ioapic-level  ahci[0000:00:04.0]
 12:        257  xen-pirq  12-ioapic-edge  i8042
...

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 56 +++++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h |  2 ++
 hw/i386/x86.c            | 16 ++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 4ee275c371..8de10a8c5e 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -147,6 +147,9 @@ struct XenEvtchnState {
     /* GSI → PIRQ mapping (serialized) */
     uint16_t gsi_pirq[GSI_NUM_PINS];
 
+    /* Per-GSI assertion state (serialized) */
+    uint32_t pirq_gsi_set;
+
     /* Per-PIRQ information (rebuilt on migration) */
     struct pirq_info *pirq;
 };
@@ -245,6 +248,7 @@ static const VMStateDescription xen_evtchn_vmstate = {
         VMSTATE_VARRAY_UINT16_ALLOC(pirq_inuse_bitmap, XenEvtchnState,
                                     nr_pirq_inuse_words, 0,
                                     vmstate_info_uint64, uint64_t),
+        VMSTATE_UINT32(pirq_gsi_set, XenEvtchnState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1505,6 +1509,51 @@ static int allocate_pirq(XenEvtchnState *s, int type, int gsi)
     return pirq;
 }
 
+bool xen_evtchn_set_gsi(int gsi, int level)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int pirq;
+
+    assert(qemu_mutex_iothread_locked());
+
+    if (!s || gsi < 0 || gsi > GSI_NUM_PINS) {
+        return false;
+    }
+
+    /*
+     * Check that that it *isn't* the event channel GSI, and thus
+     * that we are not recursing and it's safe to take s->port_lock.
+     *
+     * Locking aside, it's perfectly sane to bail out early for that
+     * special case, as it would make no sense for the event channel
+     * GSI to be routed back to event channels, when the delivery
+     * method is to raise the GSI... that recursion wouldn't *just*
+     * be a locking issue.
+     */
+    if (gsi && gsi == s->callback_gsi) {
+        return false;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    pirq = s->gsi_pirq[gsi];
+    if (!pirq) {
+        return false;
+    }
+
+    if (level) {
+        int port = s->pirq[pirq].port;
+
+        s->pirq_gsi_set |= (1U << gsi);
+        if (port) {
+            set_port_pending(s, port);
+        }
+    } else {
+        s->pirq_gsi_set &= ~(1U << gsi);
+    }
+    return true;
+}
+
 int xen_physdev_map_pirq(struct physdev_map_pirq *map)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
@@ -1611,8 +1660,13 @@ int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
     if (gsi < 0) {
         return -EINVAL;
     }
+    if (s->pirq_gsi_set & (1U << gsi)) {
+        int port = s->pirq[pirq].port;
+        if (port) {
+            set_port_pending(s, port);
+        }
+    }
 
-    // XX: Reassert a level IRQ if needed */
     return 0;
 }
 
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index a7383f760c..95400b7fbf 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -24,6 +24,8 @@ void xen_evtchn_set_callback_level(int level);
 
 int xen_evtchn_set_port(uint16_t port);
 
+bool xen_evtchn_set_gsi(int gsi, int level);
+
 /*
  * These functions mirror the libxenevtchn library API, providing the QEMU
  * backend side of "interdomain" event channels.
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78cc131926..242ddba852 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -61,6 +61,11 @@
 #include CONFIG_DEVICES
 #include "kvm/kvm_i386.h"
 
+#ifdef CONFIG_XEN_EMU
+#include "hw/xen/xen.h"
+#include "hw/i386/kvm/xen_evtchn.h"
+#endif
+
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
@@ -608,6 +613,17 @@ void gsi_handler(void *opaque, int n, int level)
         }
         /* fall through */
     case ISA_NUM_IRQS ... IOAPIC_NUM_PINS - 1:
+#ifdef CONFIG_XEN_EMU
+        /*
+         * Xen delivers the GSI to the Legacy PIC (not that Legacy PIC
+         * routing actually works properly under Xen). And then to
+         * *either* the PIRQ handling or the I/OAPIC depending on
+         * whether the former wants it.
+         */
+        if (xen_mode == XEN_EMULATE && xen_evtchn_set_gsi(n, level)) {
+            break;
+        }
+#endif
         qemu_set_irq(s->ioapic_irq[n], level);
         break;
     case IO_APIC_SECONDARY_IRQBASE
-- 
2.39.0


