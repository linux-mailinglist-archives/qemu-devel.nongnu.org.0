Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD4666D152
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:06:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXUx-0006nc-OF; Mon, 16 Jan 2023 16:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUo-0006hX-AH
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:26 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUm-0003Yy-MQ
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1vEnu08S742Qjn/s4tIm7Ka9uVANQ30Qt3sLgZIsVK4=; b=PsxIHAp95SNfWr7fqYr91P2+en
 gReabVjAnoS20rPW1AhieILtJZRGiGn9swpSPUVS9NfES9s2SAvBwnp6f32jmFSz7ooGgSIhyD+hU
 p0+a5DewQamwNliDgocUiCu1YoekxEjGyJKUWN3/puMvC6b13ihJvFGEfqUuxCyBZj2GQ2VANnyMS
 +93fHhciPPNhVIJVzNH1EX6C5XJtPshWjvZpJIj92y3l+9eWn2oKSYLVEZVw6cw9pFrKXQafHz1JG
 sd7jTjksfBIWt+OqZ5WClbvB82wrkUjrK4gOmWRHSxSOk0lYFwEFdmLT0n4aEMkfhSCetOgQb+5Lx
 GGFGevAA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHXUl-0097VW-5n; Mon, 16 Jan 2023 21:58:25 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUX-004iQ7-1R; Mon, 16 Jan 2023 21:58:09 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 37/51] hw/xen: Implement EVTCHNOP_reset
Date: Mon, 16 Jan 2023 21:57:51 +0000
Message-Id: <20230116215805.1123514-38-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org;
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
 hw/i386/kvm/xen_evtchn.c  | 29 +++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  3 +++
 target/i386/kvm/xen-emu.c | 17 +++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index ad75cddc5e..6b6df39978 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -738,6 +738,35 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
     return 0;
 }
 
+int xen_evtchn_soft_reset(void)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int i;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    for (i = 0; i < s->nr_ports; i++) {
+        close_port(s, i);
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return 0;
+}
+
+int xen_evtchn_reset_op(struct evtchn_reset *reset)
+{
+    if (reset->dom != DOMID_SELF && reset->dom != xen_domid) {
+        return -ESRCH;
+    }
+
+    return xen_evtchn_soft_reset();
+}
+
 int xen_evtchn_close_op(struct evtchn_close *close)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 486b031c82..5d3e03553f 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -13,6 +13,7 @@
 #define QEMU_XEN_EVTCHN_H
 
 void xen_evtchn_create(void);
+int xen_evtchn_soft_reset(void);
 int xen_evtchn_set_callback_param(uint64_t param);
 
 struct evtchn_status;
@@ -24,6 +25,7 @@ struct evtchn_send;
 struct evtchn_alloc_unbound;
 struct evtchn_bind_interdomain;
 struct evtchn_bind_vcpu;
+struct evtchn_reset;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
@@ -33,5 +35,6 @@ int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
 int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
 int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu);
+int xen_evtchn_reset_op(struct evtchn_reset *reset);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index a032a75f3a..bc7426b90f 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -953,6 +953,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_bind_vcpu_op(&vcpu);
         break;
     }
+    case EVTCHNOP_reset: {
+        struct evtchn_reset reset;
+
+        qemu_build_assert(sizeof(reset) == 2);
+        if (kvm_copy_from_gva(cs, arg, &reset, sizeof(reset))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_reset_op(&reset);
+        break;
+    }
     default:
         return false;
     }
@@ -966,6 +978,11 @@ static int kvm_xen_soft_reset(void)
     CPUState *cpu;
     int err;
 
+    err = xen_evtchn_soft_reset();
+    if (err) {
+            return err;
+    }
+
     err = xen_evtchn_set_callback_param(0);
     if (err) {
         return err;
-- 
2.39.0


