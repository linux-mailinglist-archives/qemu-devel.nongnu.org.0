Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C168E6A447A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:34:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeWY-0006ti-Fe; Mon, 27 Feb 2023 09:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVQ-0005BL-US
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVM-0004WG-PP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vYX2u/WQKgA2S/6pVb7Ubqrs9y5RW1s8CK+ZHSeE71I=; b=pYCBrMHHYIpBCTk/hgFdi8tYeV
 MFST9J+hbBTnjZ7jzjbY5FAhCuP55ottJxlzjaM1rPSLcYxtiLyGh+QulxWsBhSfdhE06s6+aNeXV
 V/ALT9sdJ3LZFjUsggQFBWLpfYyJZipS+hHgbGh2w4WOPzAckDhK0baIalqOAQy2MBBaEemcMgEET
 RlLhafNviuw99kh9vZvS5f75RwDaJ0he8JWq9R2NRcm9TdPJP++fwlSjF/Hbz73UT4LyiMBPy9R8w
 CVuJF0okBGBKxu6PPQyH0rcjFnUNlDPYVrhtMtWws4Zm65roaFqmPKOmMgAWoZl6amrJyfVYdIvb/
 n0msGuBQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pWeV6-000ATn-OO; Mon, 27 Feb 2023 14:29:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV6-0027CL-2O; Mon, 27 Feb 2023 14:29:12 +0000
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
Subject: [PATCH v14 34/60] hw/xen: Implement EVTCHNOP_send
Date: Mon, 27 Feb 2023 14:28:42 +0000
Message-Id: <20230227142908.503517-35-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org;
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 180 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/kvm/xen-emu.c |  12 +++
 3 files changed, 194 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index eea80dc0f5..ce7a969234 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -490,6 +490,133 @@ static int unmask_port(XenEvtchnState *s, evtchn_port_t port, bool do_unmask)
     }
 }
 
+static int do_set_port_lm(XenEvtchnState *s, evtchn_port_t port,
+                          struct shared_info *shinfo,
+                          struct vcpu_info *vcpu_info)
+{
+    const int bits_per_word = BITS_PER_BYTE * sizeof(shinfo->evtchn_pending[0]);
+    typeof(shinfo->evtchn_pending[0]) mask;
+    int idx = port / bits_per_word;
+    int offset = port % bits_per_word;
+
+    mask = 1UL << offset;
+
+    if (idx >= bits_per_word) {
+        return -EINVAL;
+    }
+
+    /* Update the pending bit itself. If it was already set, we're done. */
+    if (qatomic_fetch_or(&shinfo->evtchn_pending[idx], mask) & mask) {
+        return 0;
+    }
+
+    /* Check if it's masked. */
+    if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+        return 0;
+    }
+
+    /* Now on to the vcpu_info evtchn_pending_sel index... */
+    mask = 1UL << idx;
+
+    /* If a port in this word was already pending for this vCPU, all done. */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_pending_sel, mask) & mask) {
+        return 0;
+    }
+
+    /* Set evtchn_upcall_pending for this vCPU */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_upcall_pending, 1)) {
+        return 0;
+    }
+
+    inject_callback(s, s->port_table[port].vcpu);
+
+    return 0;
+}
+
+static int do_set_port_compat(XenEvtchnState *s, evtchn_port_t port,
+                              struct compat_shared_info *shinfo,
+                              struct compat_vcpu_info *vcpu_info)
+{
+    const int bits_per_word = BITS_PER_BYTE * sizeof(shinfo->evtchn_pending[0]);
+    typeof(shinfo->evtchn_pending[0]) mask;
+    int idx = port / bits_per_word;
+    int offset = port % bits_per_word;
+
+    mask = 1UL << offset;
+
+    if (idx >= bits_per_word) {
+        return -EINVAL;
+    }
+
+    /* Update the pending bit itself. If it was already set, we're done. */
+    if (qatomic_fetch_or(&shinfo->evtchn_pending[idx], mask) & mask) {
+        return 0;
+    }
+
+    /* Check if it's masked. */
+    if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+        return 0;
+    }
+
+    /* Now on to the vcpu_info evtchn_pending_sel index... */
+    mask = 1UL << idx;
+
+    /* If a port in this word was already pending for this vCPU, all done. */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_pending_sel, mask) & mask) {
+        return 0;
+    }
+
+    /* Set evtchn_upcall_pending for this vCPU */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_upcall_pending, 1)) {
+        return 0;
+    }
+
+    inject_callback(s, s->port_table[port].vcpu);
+
+    return 0;
+}
+
+static int set_port_pending(XenEvtchnState *s, evtchn_port_t port)
+{
+    void *vcpu_info, *shinfo;
+
+    if (s->port_table[port].type == EVTCHNSTAT_closed) {
+        return -EINVAL;
+    }
+
+    if (s->evtchn_in_kernel) {
+        XenEvtchnPort *p = &s->port_table[port];
+        CPUState *cpu = qemu_get_cpu(p->vcpu);
+        struct kvm_irq_routing_xen_evtchn evt;
+
+        if (!cpu) {
+            return 0;
+        }
+
+        evt.port = port;
+        evt.vcpu = kvm_arch_vcpu_id(cpu);
+        evt.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
+
+        return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_EVTCHN_SEND, &evt);
+    }
+
+    shinfo = xen_overlay_get_shinfo_ptr();
+    if (!shinfo) {
+        return -ENOTSUP;
+    }
+
+    vcpu_info = kvm_xen_get_vcpu_info_hva(s->port_table[port].vcpu);
+    if (!vcpu_info) {
+        return -EINVAL;
+    }
+
+    if (xen_is_long_mode()) {
+        return do_set_port_lm(s, port, shinfo, vcpu_info);
+    } else {
+        return do_set_port_compat(s, port, shinfo, vcpu_info);
+    }
+}
+
 static int clear_port_pending(XenEvtchnState *s, evtchn_port_t port)
 {
     void *p = xen_overlay_get_shinfo_ptr();
@@ -709,3 +836,56 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
 
     return ret;
 }
+
+int xen_evtchn_send_op(struct evtchn_send *send)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *p;
+    int ret = 0;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(send->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    p = &s->port_table[send->port];
+
+    switch (p->type) {
+    case EVTCHNSTAT_interdomain:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            /*
+             * This is an event from the guest to qemu itself, which is
+             * serving as the driver domain. Not yet implemented; it will
+             * be hooked up to the qemu implementation of xenstore,
+             * console, PV net/block drivers etc.
+             */
+            ret = -ENOSYS;
+        } else {
+            /* Loopback interdomain ports; just a complex IPI */
+            set_port_pending(s, p->type_val);
+        }
+        break;
+
+    case EVTCHNSTAT_ipi:
+        set_port_pending(s, send->port);
+        break;
+
+    case EVTCHNSTAT_unbound:
+        /* Xen will silently drop these */
+        break;
+
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 107f420848..500fdbe8b8 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -20,10 +20,12 @@ struct evtchn_close;
 struct evtchn_unmask;
 struct evtchn_bind_virq;
 struct evtchn_bind_ipi;
+struct evtchn_send;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
 int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
+int xen_evtchn_send_op(struct evtchn_send *send);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index b8b439dd31..19a7f16ebe 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -909,6 +909,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_send: {
+        struct evtchn_send send;
+
+        qemu_build_assert(sizeof(send) == 4);
+        if (kvm_copy_from_gva(cs, arg, &send, sizeof(send))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_send_op(&send);
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.0


