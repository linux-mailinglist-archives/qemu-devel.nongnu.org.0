Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6C76868D5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEBC-0002fw-Fz; Wed, 01 Feb 2023 09:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNE9p-0001TJ-QX
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:24 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNE9g-00038G-R2
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ZCc7qIJ/wT7rTd24BHFkQ5oeg1hLCvGeZgiWgsXCPbE=; b=cnN833QzBnQBxSuxshyG1V24Y4
 injgI+xGXi0zJ1tX13FAatdmd6FV0D5bhwTiMbPw05Pgy7f4FkIKoK1jUWF0+qxrW4Z3ozPFgEKnV
 xNct/5Htj8+J4qZRTPnApQ4ZedPymxZFXeiiA3yyYz05+CR44mkZIAVjCWh6hhP4cIOsNfcfocj56
 VmWrG2eK5gdeD+IFeuHa5bXy7+0zPlDkeowr6TUW3YyPESgH1pwfhV9E2KR2ga1apNMxkFOP/xOT4
 crQE1Yqyi/JQh8yBpT0i2XKX90U76ly2jZ57RIN3FdULXWI8uue0vm3azk6+ELBguydpowIN/bGZO
 Km9MWNGg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pNE9Q-00CMb7-8u; Wed, 01 Feb 2023 14:31:55 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pNE9Q-007Js2-0r; Wed, 01 Feb 2023 14:31:52 +0000
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
Subject: [PATCH v10 31/59] hw/xen: Implement EVTCHNOP_unmask
Date: Wed,  1 Feb 2023 14:31:20 +0000
Message-Id: <20230201143148.1744093-32-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201143148.1744093-1-dwmw2@infradead.org>
References: <20230201143148.1744093-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org;
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

This finally comes with a mechanism for actually injecting events into
the guest vCPU, with all the atomic-test-and-set that's involved in
setting the bit in the shinfo, then the index in the vcpu_info, and
injecting either the lapic vector as MSI, or letting KVM inject the
bare vector.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 175 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/kvm/xen-emu.c |  12 +++
 3 files changed, 189 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 08c6fac357..deea7de027 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -224,6 +224,13 @@ int xen_evtchn_set_callback_param(uint64_t param)
     return ret;
 }
 
+static void inject_callback(XenEvtchnState *s, uint32_t vcpu)
+{
+    int type = s->callback_param >> CALLBACK_VIA_TYPE_SHIFT;
+
+    kvm_xen_inject_vcpu_callback_vector(vcpu, type);
+}
+
 static bool valid_port(evtchn_port_t port)
 {
     if (!port) {
@@ -294,6 +301,152 @@ int xen_evtchn_status_op(struct evtchn_status *status)
     return 0;
 }
 
+/*
+ * Never thought I'd hear myself say this, but C++ templates would be
+ * kind of nice here.
+ *
+ * template<class T> static int do_unmask_port(T *shinfo, ...);
+ */
+static int do_unmask_port_lm(XenEvtchnState *s, evtchn_port_t port,
+                             bool do_unmask, struct shared_info *shinfo,
+                             struct vcpu_info *vcpu_info)
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
+    if (do_unmask) {
+        /*
+         * If this is a true unmask operation, clear the mask bit. If
+         * it was already unmasked, we have nothing further to do.
+         */
+        if (!((qatomic_fetch_and(&shinfo->evtchn_mask[idx], ~mask) & mask))) {
+            return 0;
+        }
+    } else {
+        /*
+         * This is a pseudo-unmask for affinity changes. We don't
+         * change the mask bit, and if it's *masked* we have nothing
+         * else to do.
+         */
+        if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+            return 0;
+        }
+    }
+
+    /* If the event was not pending, we're done. */
+    if (!(qatomic_fetch_or(&shinfo->evtchn_pending[idx], 0) & mask)) {
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
+static int do_unmask_port_compat(XenEvtchnState *s, evtchn_port_t port,
+                                 bool do_unmask,
+                                 struct compat_shared_info *shinfo,
+                                 struct compat_vcpu_info *vcpu_info)
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
+    if (do_unmask) {
+        /*
+         * If this is a true unmask operation, clear the mask bit. If
+         * it was already unmasked, we have nothing further to do.
+         */
+        if (!((qatomic_fetch_and(&shinfo->evtchn_mask[idx], ~mask) & mask))) {
+            return 0;
+        }
+    } else {
+        /*
+         * This is a pseudo-unmask for affinity changes. We don't
+         * change the mask bit, and if it's *masked* we have nothing
+         * else to do.
+         */
+        if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+            return 0;
+        }
+    }
+
+    /* If the event was not pending, we're done. */
+    if (!(qatomic_fetch_or(&shinfo->evtchn_pending[idx], 0) & mask)) {
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
+static int unmask_port(XenEvtchnState *s, evtchn_port_t port, bool do_unmask)
+{
+    void *vcpu_info, *shinfo;
+
+    if (s->port_table[port].type == EVTCHNSTAT_closed) {
+        return -EINVAL;
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
+        return do_unmask_port_lm(s, port, do_unmask, shinfo, vcpu_info);
+    } else {
+        return do_unmask_port_compat(s, port, do_unmask, shinfo, vcpu_info);
+    }
+}
+
 static int clear_port_pending(XenEvtchnState *s, evtchn_port_t port)
 {
     void *p = xen_overlay_get_shinfo_ptr();
@@ -378,3 +531,25 @@ int xen_evtchn_close_op(struct evtchn_close *close)
 
     return ret;
 }
+
+int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(unmask->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = unmask_port(s, unmask->port, true);
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index cb3924941a..69c6b0d743 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -17,7 +17,9 @@ int xen_evtchn_set_callback_param(uint64_t param);
 
 struct evtchn_status;
 struct evtchn_close;
+struct evtchn_unmask;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
+int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c54372700a..418028b04f 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -814,6 +814,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_close_op(&close);
         break;
     }
+    case EVTCHNOP_unmask: {
+        struct evtchn_unmask unmask;
+
+        qemu_build_assert(sizeof(unmask) == 4);
+        if (kvm_copy_from_gva(cs, arg, &unmask, sizeof(unmask))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_unmask_op(&unmask);
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.0


