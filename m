Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48B6A44C6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:39:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeYk-0002UY-M8; Mon, 27 Feb 2023 09:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVh-0005nE-N7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:57 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVY-0004c0-Ma
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=8BS4x89VdG8Oqc0bEaolYm71QrBjN0YpqlpjPCKroMs=; b=g+ROBQ3kxJF9/NbP5UuFI0bFmv
 XUkCPCvFdKv4drD7P9tuiBDFHKPjaysCTFwl9nxi8BvLi2UsfSeITSp7QM2WAriV2Sgwy026IIR9p
 kMTMj/1Vae0k9r5nP6W/ba4nO09VgsACPdNLbkIhMmWIgnIntuOW1COJu1HS2CwnFLHbOyYwI/ZCv
 +0NzvqX9U+vl+sB01DeFKH4xOj15turLOzy+ibv+8HgXufppz2uACcPXK/hzb4ruq116yGY6Vg5W1
 +mlvX5HW2Gj8CVR6V8mAjxu8v9sLPfY3RFbh2i4L19zEHhylVZ+3ROk95N/D1HdsKcNpn+G/DR1A+
 lv2lLuUA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pWeV8-00EFCV-12; Mon, 27 Feb 2023 14:29:29 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV8-0027Dy-03; Mon, 27 Feb 2023 14:29:14 +0000
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
Subject: [PATCH v14 55/60] hw/xen: Implement emulated PIRQ hypercall support
Date: Mon, 27 Feb 2023 14:29:03 +0000
Message-Id: <20230227142908.503517-56-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This wires up the basic infrastructure but the actual interrupts aren't
there yet, so don't advertise it to the guest.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/trace-events  |   4 +
 hw/i386/kvm/trace.h       |   1 +
 hw/i386/kvm/xen_evtchn.c  | 306 +++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h  |   2 +
 meson.build               |   1 +
 target/i386/kvm/xen-emu.c |  15 ++
 6 files changed, 324 insertions(+), 5 deletions(-)
 create mode 100644 hw/i386/kvm/trace-events
 create mode 100644 hw/i386/kvm/trace.h

diff --git a/hw/i386/kvm/trace-events b/hw/i386/kvm/trace-events
new file mode 100644
index 0000000000..04e60c5bb8
--- /dev/null
+++ b/hw/i386/kvm/trace-events
@@ -0,0 +1,4 @@
+kvm_xen_map_pirq(int pirq, int gsi) "pirq %d gsi %d"
+kvm_xen_unmap_pirq(int pirq, int gsi) "pirq %d gsi %d"
+kvm_xen_get_free_pirq(int pirq, int type) "pirq %d type %d"
+kvm_xen_bind_pirq(int pirq, int port) "pirq %d port %d"
diff --git a/hw/i386/kvm/trace.h b/hw/i386/kvm/trace.h
new file mode 100644
index 0000000000..e55d0812fd
--- /dev/null
+++ b/hw/i386/kvm/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_i386_kvm.h"
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 7d17d5e9ec..9a625e3909 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -24,6 +24,7 @@
 #include "exec/target_page.h"
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
@@ -105,6 +106,21 @@ struct xenevtchn_handle {
 #define PORT_INFO_TYPEVAL_REMOTE_QEMU           0x8000
 #define PORT_INFO_TYPEVAL_REMOTE_PORT_MASK      0x7FFF
 
+/*
+ * These 'emuirq' values are used by Xen in the LM stream... and yes, I am
+ * insane enough to think about guest-transparent live migration from actual
+ * Xen to QEMU, and ensuring that we can convert/consume the stream.
+ */
+#define IRQ_UNBOUND -1
+#define IRQ_PT -2
+#define IRQ_MSI_EMU -3
+
+
+struct pirq_info {
+    int gsi;
+    uint16_t port;
+};
+
 struct XenEvtchnState {
     /*< private >*/
     SysBusDevice busdev;
@@ -122,8 +138,25 @@ struct XenEvtchnState {
     qemu_irq gsis[GSI_NUM_PINS];
 
     struct xenevtchn_handle *be_handles[EVTCHN_2L_NR_CHANNELS];
+
+    uint32_t nr_pirqs;
+
+    /* Bitmap of allocated PIRQs (serialized) */
+    uint16_t nr_pirq_inuse_words;
+    uint64_t *pirq_inuse_bitmap;
+
+    /* GSI → PIRQ mapping (serialized) */
+    uint16_t gsi_pirq[GSI_NUM_PINS];
+
+    /* Per-PIRQ information (rebuilt on migration) */
+    struct pirq_info *pirq;
 };
 
+#define pirq_inuse_word(s, pirq) (s->pirq_inuse_bitmap[((pirq) / 64)])
+#define pirq_inuse_bit(pirq) (1ULL << ((pirq) & 63))
+
+#define pirq_inuse(s, pirq) (pirq_inuse_word(s, pirq) & pirq_inuse_bit(pirq))
+
 struct XenEvtchnState *xen_evtchn_singleton;
 
 /* Top bits of callback_param are the type (HVM_PARAM_CALLBACK_TYPE_xxx) */
@@ -138,17 +171,45 @@ static int xen_evtchn_pre_load(void *opaque)
     /* Unbind all the backend-side ports; they need to rebind */
     unbind_backend_ports(s);
 
+    /* It'll be leaked otherwise. */
+    g_free(s->pirq_inuse_bitmap);
+    s->pirq_inuse_bitmap = NULL;
+
     return 0;
 }
 
 static int xen_evtchn_post_load(void *opaque, int version_id)
 {
     XenEvtchnState *s = opaque;
+    uint32_t i;
 
     if (s->callback_param) {
         xen_evtchn_set_callback_param(s->callback_param);
     }
 
+    /* Rebuild s->pirq[].port mapping */
+    for (i = 0; i < s->nr_ports; i++) {
+        XenEvtchnPort *p = &s->port_table[i];
+
+        if (p->type == EVTCHNSTAT_pirq) {
+            assert(p->type_val);
+            assert(p->type_val < s->nr_pirqs);
+
+            /*
+             * Set the gsi to IRQ_UNBOUND; it may be changed to an actual
+             * GSI# below, or to IRQ_MSI_EMU when the MSI table snooping
+             * catches up with it.
+             */
+            s->pirq[p->type_val].gsi = IRQ_UNBOUND;
+            s->pirq[p->type_val].port = i;
+        }
+    }
+    /* Rebuild s->pirq[].gsi mapping */
+    for (i = 0; i < GSI_NUM_PINS; i++) {
+        if (s->gsi_pirq[i]) {
+            s->pirq[s->gsi_pirq[i]].gsi = i;
+        }
+    }
     return 0;
 }
 
@@ -181,6 +242,10 @@ static const VMStateDescription xen_evtchn_vmstate = {
         VMSTATE_UINT32(nr_ports, XenEvtchnState),
         VMSTATE_STRUCT_VARRAY_UINT32(port_table, XenEvtchnState, nr_ports, 1,
                                      xen_evtchn_port_vmstate, XenEvtchnPort),
+        VMSTATE_UINT16_ARRAY(gsi_pirq, XenEvtchnState, GSI_NUM_PINS),
+        VMSTATE_VARRAY_UINT16_ALLOC(pirq_inuse_bitmap, XenEvtchnState,
+                                    nr_pirq_inuse_words, 0,
+                                    vmstate_info_uint64, uint64_t),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -221,6 +286,23 @@ void xen_evtchn_create(void)
     for (i = 0; i < GSI_NUM_PINS; i++) {
         sysbus_init_irq(SYS_BUS_DEVICE(s), &s->gsis[i]);
     }
+
+    /*
+     * We could parameterise the number of PIRQs available if needed,
+     * but for now limit it to 256. The Xen scheme for encoding PIRQ#
+     * into an MSI message is not compatible with 32-bit MSI, as it
+     * puts the high bits of the PIRQ# into the high bits of the MSI
+     * message address, instead of using the Extended Destination ID
+     * in address bits 4-11 which perhaps would have been a better
+     * choice. So to keep life simple, just stick with 256 as the
+     * default, which conveniently doesn't need to set anything
+     * outside the low 32 bits of the address.
+     */
+    s->nr_pirqs = 256;
+
+    s->nr_pirq_inuse_words = DIV_ROUND_UP(s->nr_pirqs, 64);
+    s->pirq_inuse_bitmap = g_new0(uint64_t, s->nr_pirq_inuse_words);
+    s->pirq = g_new0(struct pirq_info, s->nr_pirqs);
 }
 
 void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
@@ -929,6 +1011,10 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
     case EVTCHNSTAT_closed:
         return -ENOENT;
 
+    case EVTCHNSTAT_pirq:
+        s->pirq[p->type_val].port = 0;
+        break;
+
     case EVTCHNSTAT_virq:
         kvm_xen_set_vcpu_virq(virq_is_global(p->type_val) ? 0 : p->vcpu,
                               p->type_val, 0);
@@ -1123,6 +1209,37 @@ int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq)
     return ret;
 }
 
+int xen_evtchn_bind_pirq_op(struct evtchn_bind_pirq *pirq)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (pirq->pirq >= s->nr_pirqs) {
+        return -EINVAL;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (s->pirq[pirq->pirq].port) {
+        return -EBUSY;
+    }
+
+    ret = allocate_port(s, 0, EVTCHNSTAT_pirq, pirq->pirq,
+                        &pirq->port);
+    if (ret) {
+        return ret;
+    }
+
+    s->pirq[pirq->pirq].port = pirq->port;
+    trace_kvm_xen_bind_pirq(pirq->pirq, pirq->port);
+
+    return ret;
+}
+
 int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
@@ -1349,29 +1466,208 @@ int xen_evtchn_set_port(uint16_t port)
     return ret;
 }
 
+static int allocate_pirq(XenEvtchnState *s, int type, int gsi)
+{
+    uint16_t pirq;
+
+    /*
+     * Preserve the allocation strategy that Xen has. It looks like
+     * we *never* give out PIRQ 0-15, we give out 16-nr_irqs_gsi only
+     * to GSIs (counting up from 16), and then we count backwards from
+     * the top for MSIs or when the GSI space is exhausted.
+     */
+    if (type == MAP_PIRQ_TYPE_GSI) {
+        for (pirq = 16 ; pirq < GSI_NUM_PINS; pirq++) {
+            if (pirq_inuse(s, pirq)) {
+                continue;
+            }
+
+            /* Found it */
+            goto found;
+        }
+    }
+    for (pirq = s->nr_pirqs - 1; pirq >= GSI_NUM_PINS; pirq--) {
+        /* Skip whole words at a time when they're full */
+        if (pirq_inuse_word(s, pirq) == UINT64_MAX) {
+            pirq &= ~63ULL;
+            continue;
+        }
+        if (pirq_inuse(s, pirq)) {
+            continue;
+        }
+
+        goto found;
+    }
+    return -ENOSPC;
+
+ found:
+    pirq_inuse_word(s, pirq) |= pirq_inuse_bit(pirq);
+    if (gsi >= 0) {
+        assert(gsi <= GSI_NUM_PINS);
+        s->gsi_pirq[gsi] = pirq;
+    }
+    s->pirq[pirq].gsi = gsi;
+    return pirq;
+}
+
 int xen_physdev_map_pirq(struct physdev_map_pirq *map)
 {
-    return -ENOTSUP;
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int pirq = map->pirq;
+    int gsi = map->index;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (map->domid != DOMID_SELF && map->domid != xen_domid) {
+        return -EPERM;
+    }
+    if (map->type != MAP_PIRQ_TYPE_GSI) {
+        return -EINVAL;
+    }
+    if (gsi < 0 || gsi >= GSI_NUM_PINS) {
+        return -EINVAL;
+    }
+
+    if (pirq < 0) {
+        pirq = allocate_pirq(s, map->type, gsi);
+        if (pirq < 0) {
+            return pirq;
+        }
+        map->pirq = pirq;
+    } else if (pirq > s->nr_pirqs) {
+        return -EINVAL;
+    } else {
+        /*
+         * User specified a valid-looking PIRQ#. Allow it if it is
+         * allocated and not yet bound, or if it is unallocated
+         */
+        if (pirq_inuse(s, pirq)) {
+            if (s->pirq[pirq].gsi != IRQ_UNBOUND) {
+                return -EBUSY;
+            }
+        } else {
+            /* If it was unused, mark it used now. */
+            pirq_inuse_word(s, pirq) |= pirq_inuse_bit(pirq);
+        }
+        /* Set the mapping in both directions. */
+        s->pirq[pirq].gsi = gsi;
+        s->gsi_pirq[gsi] = pirq;
+    }
+
+    trace_kvm_xen_map_pirq(pirq, gsi);
+    return 0;
 }
 
 int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
 {
-    return -ENOTSUP;
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int pirq = unmap->pirq;
+    int gsi;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (unmap->domid != DOMID_SELF && unmap->domid != xen_domid) {
+        return -EPERM;
+    }
+    if (pirq < 0 || pirq >= s->nr_pirqs) {
+        return -EINVAL;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (!pirq_inuse(s, pirq)) {
+        return -ENOENT;
+    }
+
+    gsi = s->pirq[pirq].gsi;
+
+    /* We can only unmap GSI PIRQs */
+    if (gsi < 0) {
+        return -EINVAL;
+    }
+
+    s->gsi_pirq[gsi] = 0;
+    s->pirq[pirq].gsi = IRQ_UNBOUND; /* Doesn't actually matter because: */
+    pirq_inuse_word(s, pirq) &= ~pirq_inuse_bit(pirq);
+
+    trace_kvm_xen_unmap_pirq(pirq, gsi);
+    return 0;
 }
 
 int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
 {
-    return -ENOTSUP;
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int pirq = eoi->irq;
+    int gsi;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (!pirq_inuse(s, pirq)) {
+        return -ENOENT;
+    }
+
+    gsi = s->pirq[pirq].gsi;
+    if (gsi < 0) {
+        return -EINVAL;
+    }
+
+    /* XX: Reassert a level IRQ if needed */
+    return 0;
 }
 
 int xen_physdev_query_pirq(struct physdev_irq_status_query *query)
 {
-    return -ENOTSUP;
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int pirq = query->irq;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (!pirq_inuse(s, pirq)) {
+        return -ENOENT;
+    }
+
+    if (s->pirq[pirq].gsi >= 0) {
+        query->flags = XENIRQSTAT_needs_eoi;
+    } else {
+        query->flags = 0;
+    }
+
+    return 0;
 }
 
 int xen_physdev_get_free_pirq(struct physdev_get_free_pirq *get)
 {
-    return -ENOTSUP;
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int pirq;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    pirq = allocate_pirq(s, get->type, IRQ_UNBOUND);
+    if (pirq < 0) {
+        return pirq;
+    }
+
+    get->pirq = pirq;
+    trace_kvm_xen_get_free_pirq(pirq, get->type);
+    return 0;
 }
 
 struct xenevtchn_handle *xen_be_evtchn_open(void)
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 352c875976..a7383f760c 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -45,6 +45,7 @@ struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
 struct evtchn_bind_virq;
+struct evtchn_bind_pirq;
 struct evtchn_bind_ipi;
 struct evtchn_send;
 struct evtchn_alloc_unbound;
@@ -55,6 +56,7 @@ int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
+int xen_evtchn_bind_pirq_op(struct evtchn_bind_pirq *pirq);
 int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
diff --git a/meson.build b/meson.build
index 26b58cfcc2..657c988bed 100644
--- a/meson.build
+++ b/meson.build
@@ -2982,6 +2982,7 @@ if have_system
     'hw/i2c',
     'hw/i386',
     'hw/i386/xen',
+    'hw/i386/kvm',
     'hw/ide',
     'hw/input',
     'hw/intc',
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index fe15696cc9..0e81e5b6b1 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1267,6 +1267,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_bind_pirq: {
+        struct evtchn_bind_pirq pirq;
+
+        qemu_build_assert(sizeof(pirq) == 12);
+        if (kvm_copy_from_gva(cs, arg, &pirq, sizeof(pirq))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_bind_pirq_op(&pirq);
+        if (!err && kvm_copy_to_gva(cs, arg, &pirq, sizeof(pirq))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     case EVTCHNOP_bind_ipi: {
         struct evtchn_bind_ipi ipi;
 
-- 
2.39.0


