Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EE66A7B9
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 01:40:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGUaH-0004jD-7o; Fri, 13 Jan 2023 19:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3a1a5416dcf0d1877a74+7083+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pGUa1-0004hR-HX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:39:29 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3a1a5416dcf0d1877a74+7083+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pGUZy-0005NM-FH
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8hNGFMyfTFAFgJuKdemn2tiMcclWhMauUWQBow9Js6M=; b=g/uP+I6LsToSzpRfzg+8OHWCpO
 PTWVT6hIIHudgtSDG5pLmufz6okx8uZyUPpoKJ1wBi29uPt+DIfShkdSafBlljAqrZ8krN51nfE83
 Klb9KamI5aN82UsiuBwavRPIAogXIFc5PsOUW9jP1HksFeGOlQvTVb/jW+gvZ9d+Nq9lCZnYp4u2+
 dC7f+3uztzNTh994HPS3VnPazkTbxYOm/bMbrgb6Fe7dvfkp5d+F4lhpzHbnWUqgAySHHp+tdyJty
 XBvzyNgfBy4wpJWdcKuOmnsLwZBL+hAq1m9/P3KTeTACFponFdSNq37nyJBpXqhJ8UGaReN6MQkTL
 +K6kzUCA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pGUZf-004X3t-2C; Sat, 14 Jan 2023 00:39:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pGUZk-001C2K-Tf; Sat, 14 Jan 2023 00:39:12 +0000
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
Subject: [RFC PATCH 3/5] hw/xen: Support GSI mapping to PIRQ
Date: Sat, 14 Jan 2023 00:39:07 +0000
Message-Id: <20230114003909.284331-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230114003909.284331-1-dwmw2@infradead.org>
References: <20230114003909.284331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+3a1a5416dcf0d1877a74+7083+infradead.org+dwmw2@desiato.srs.infradead.org;
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
 hw/i386/kvm/xen_evtchn.c | 38 +++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h |  2 ++
 hw/i386/x86.c            | 15 +++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 82250daecb..18c88229ab 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -143,6 +143,7 @@ struct XenEvtchnState {
     uint16_t gsi_pirq[GSI_NUM_PINS];
     /* Bitmap of allocated PIRQs (serialized) */
     uint64_t pirq_inuse[DIV_ROUND_UP(MAX_XEN_PIRQ, 64)];
+    uint32_t pirq_gsi_set;
 
     /* Per-PIRQ information (rebuilt on migration) */
     struct pirq_info pirq[MAX_XEN_PIRQ];
@@ -208,6 +209,7 @@ static const VMStateDescription xen_evtchn_vmstate = {
         VMSTATE_UINT16_ARRAY(gsi_pirq, XenEvtchnState, GSI_NUM_PINS),
         VMSTATE_UINT64_ARRAY(pirq_inuse, XenEvtchnState,
                              DIV_ROUND_UP(MAX_XEN_PIRQ, 64)),
+        VMSTATE_UINT32(pirq_gsi_set, XenEvtchnState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1425,6 +1427,35 @@ static int allocate_pirq(XenEvtchnState *s, int type, int gsi)
     return pirq;
 }
 
+bool xen_evtchn_set_gsi(int gsi, int level)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int pirq;
+
+    if (!s || gsi < 0 || gsi > GSI_NUM_PINS) {
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
@@ -1531,8 +1562,13 @@ int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
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
index 2c12506cc2..dba9d6b021 100644
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
index 78cc131926..201fd5626c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -61,6 +61,10 @@
 #include CONFIG_DEVICES
 #include "kvm/kvm_i386.h"
 
+#ifdef CONFIG_XEN_EMU
+#include "hw/i386/kvm/xen_evtchn.h"
+#endif
+
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
@@ -608,6 +612,17 @@ void gsi_handler(void *opaque, int n, int level)
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
+        if (xen_evtchn_set_gsi(n, level)) {
+            break;
+        }
+#endif
         qemu_set_irq(s->ioapic_irq[n], level);
         break;
     case IO_APIC_SECONDARY_IRQBASE
-- 
2.35.3


