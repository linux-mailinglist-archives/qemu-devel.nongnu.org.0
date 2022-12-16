Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C864E55E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5yoi-00062k-G9; Thu, 15 Dec 2022 19:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5ynC-0005Do-E5
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:40 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5yn5-0006aR-IQ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xjCxkaobxLl3nRt5VtDNl1KNusMd8/F4iusKJDVqbAo=; b=CreJ0gjko2M4jBLgwV9gD4LBz3
 ok35TS4NEx5voQDqqcjWfLtdz6TVNpD2Qu4TTz2qHOzwKkd0dnI3NHHI7WEgrR+ZYTTHKofUoHLRM
 8bvsR2JRMfJZln95jYRzndXjQXQNoLxw3xpSWgtJwZyXM2zYFNuUcVXcJAp0+Va7NYeYu8Li6JWsn
 a4ZhGoBhXUMusIIIR7qPH3UshXh8oVACiYPr+Bk3aZ2pQhtZoN5khJze264jcXLsVUFzKUAflssnf
 DNged98C9MSojm0P32g8B4RfPNR+eFIVSZiikBrqYqv/HetBzHpV6bGJW7UM5BvVao20PmBE4ESm6
 OmyyMYbw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5yn6-00EvVF-Bw; Fri, 16 Dec 2022 00:41:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cQ0-DI; Fri, 16 Dec 2022 00:41:22 +0000
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
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v3 30/38] hw/xen: Implement EVTCHNOP_send
Date: Fri, 16 Dec 2022 00:41:09 +0000
Message-Id: <20221216004117.862106-31-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org;
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
---
 hw/i386/kvm/xen_evtchn.c  | 162 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/kvm/xen-emu.c |  12 +++
 3 files changed, 176 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 2e35812b32..d90a92a25a 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -441,6 +441,117 @@ static int unmask_port(XenEvtchnState *s, evtchn_port_t port, bool do_unmask)
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
+    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
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
+    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
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
+    shinfo = xen_overlay_page_ptr(XENMAPSPACE_shared_info, 0);
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
 static bool virq_is_global(uint32_t virq)
 {
     switch (virq) {
@@ -620,3 +731,54 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
 
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
+    switch(p->type) {
+    case EVTCHNSTAT_interdomain:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            /* This is an event from the guest to qemu itself, which is
+             * serving as the driver domain. Not yet implemented; it will
+             * be hooked up to the qemu implementation of xenstore,
+             * console, PV net/block drivers etc. */
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
index 52ade5a64e..c27b9e8096 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -18,8 +18,10 @@ struct evtchn_close;
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
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index b5f8f30d62..300b0d75bc 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -800,6 +800,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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
2.35.3


