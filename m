Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65E86A0938
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:00:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVB2E-0001If-6j; Thu, 23 Feb 2023 07:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pVAzr-0004p0-Su
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:52 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pVAzc-0004lZ-Ts
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=SdVERYL2TrUxHEKiZnPCDUaH70Wj7r5yFAnIQGMGK/I=; b=f+4K8UkhLfks1IyF5563FxXj6A
 1pl+QVso+pTKv7UY5jYxfBpw86OUCpuHhwH2z+t1j+vVbg06THSkJFvlqWp0AmH05yE1LIUrzC0Te
 LNPmlnqUv/4UjWRXYuxBm+2BIcrlJm0LL8MBUlhPZG7PaaUYLluTOVVmwfEl5lnqA6zQeouRBqaez
 BcPqWJ1jdk8QW9ilaInfoBFd6w7KZg5rsiTZZMTxy9AAZ0TjaY7qCW0xpOFxnR8/ookvikolwMJWd
 WrbOXFbQ5TOu/yjS3IEAaN8B5ZRDYZiltcNq5Jwl0yCkbdwVXzf/vWpF/2TG8YNSPDMGcEokYLCl6
 OJRtFmbw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pVAzK-00Cujs-1v; Thu, 23 Feb 2023 12:46:19 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pVAzK-00DYsl-1Y; Thu, 23 Feb 2023 12:46:18 +0000
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
Subject: [PATCH v13 56/60] hw/xen: Support GSI mapping to PIRQ
Date: Thu, 23 Feb 2023 12:46:09 +0000
Message-Id: <20230223124613.3231331-57-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223124613.3231331-1-dwmw2@infradead.org>
References: <20230223124613.3231331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org;
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c | 56 +++++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h |  2 ++
 hw/i386/x86.c            | 16 ++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index f5e835ff70..8df95742a7 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -148,6 +148,9 @@ struct XenEvtchnState {
     /* GSI → PIRQ mapping (serialized) */
     uint16_t gsi_pirq[GSI_NUM_PINS];
 
+    /* Per-GSI assertion state (serialized) */
+    uint32_t pirq_gsi_set;
+
     /* Per-PIRQ information (rebuilt on migration) */
     struct pirq_info *pirq;
 };
@@ -246,6 +249,7 @@ static const VMStateDescription xen_evtchn_vmstate = {
         VMSTATE_VARRAY_UINT16_ALLOC(pirq_inuse_bitmap, XenEvtchnState,
                                     nr_pirq_inuse_words, 0,
                                     vmstate_info_uint64, uint64_t),
+        VMSTATE_UINT32(pirq_gsi_set, XenEvtchnState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1506,6 +1510,51 @@ static int allocate_pirq(XenEvtchnState *s, int type, int gsi)
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
@@ -1612,8 +1661,13 @@ int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
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
index eaff4227bd..594fd25c55 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -62,6 +62,11 @@
 #include CONFIG_DEVICES
 #include "kvm/kvm_i386.h"
 
+#ifdef CONFIG_XEN_EMU
+#include "hw/xen/xen.h"
+#include "hw/i386/kvm/xen_evtchn.h"
+#endif
+
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
@@ -609,6 +614,17 @@ void gsi_handler(void *opaque, int n, int level)
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


