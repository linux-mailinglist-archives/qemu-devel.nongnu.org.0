Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E31698D23
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXib-0003qd-SY; Thu, 16 Feb 2023 01:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhl-0003Ci-8k
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:20 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhe-0006v1-20
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FlyKkw6o/ODwceRRXqi5o4dJa7dt0Fg9s7lquuY7QYo=; b=ROAo+ii3qELfSzhH7cd9IyV0W/
 gjNeJ9oNdjp1bETlP08t3cxaG5FNKSx3JZyLOWGZXaXx5CZQWWZLFAQICwj+5YQLsUvPYxuM9k5v6
 y82Uu6B7TuQZhoeduB2MqboDC64YpVX1PDO3lBfKojkKwScjncWFjs6JOLiEootzcsgQxKdxBixlM
 INTGwFvNVQBOaWydx68tFQqXsAQ5xnHDnIVdQg2D5dFZIffgnRP3IDrj+ylx73YpSwry8d3pwJl71
 WWPKBJV4KZjYdxfyY2LfD7s/yfqEHFK1dNlffv0P0snLNLJieTQGHAfIyqhMY2Ug4doJYVpfAgwOn
 XkjDFCTg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pSXhI-0089xg-6J; Thu, 16 Feb 2023 06:24:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSXhI-008w8T-0h; Thu, 16 Feb 2023 06:24:48 +0000
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
Subject: [PATCH v11 36/59] hw/xen: Implement EVTCHNOP_bind_interdomain
Date: Thu, 16 Feb 2023 06:24:21 +0000
Message-Id: <20230216062444.2129371-37-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216062444.2129371-1-dwmw2@infradead.org>
References: <20230216062444.2129371-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org;
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
 hw/i386/kvm/xen_evtchn.c  | 78 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 +
 target/i386/kvm/xen-emu.c | 16 ++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 9dc5a98d94..3e6f7afcbc 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -720,6 +720,23 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
         }
         break;
 
+    case EVTCHNSTAT_interdomain:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            /* Not yet implemented. This can't happen! */
+        } else {
+            /* Loopback interdomain */
+            XenEvtchnPort *rp = &s->port_table[p->type_val];
+            if (!valid_port(p->type_val) || rp->type_val != port ||
+                rp->type != EVTCHNSTAT_interdomain) {
+                error_report("Inconsistent state for interdomain unbind");
+            } else {
+                /* Set the other end back to unbound */
+                rp->type = EVTCHNSTAT_unbound;
+                rp->type_val = 0;
+            }
+        }
+        break;
+
     default:
         break;
     }
@@ -835,6 +852,67 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
     return ret;
 }
 
+int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint16_t type_val;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (interdomain->remote_dom == DOMID_QEMU) {
+        type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
+    } else if (interdomain->remote_dom == DOMID_SELF ||
+               interdomain->remote_dom == xen_domid) {
+        type_val = 0;
+    } else {
+        return -ESRCH;
+    }
+
+    if (!valid_port(interdomain->remote_port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    /* The newly allocated port starts out as unbound */
+    ret = allocate_port(s, 0, EVTCHNSTAT_unbound, type_val,
+                        &interdomain->local_port);
+    if (ret) {
+        goto out;
+    }
+
+    if (interdomain->remote_dom == DOMID_QEMU) {
+        /* We haven't hooked up QEMU's PV drivers to this yet */
+        ret = -ENOSYS;
+    } else {
+        /* Loopback */
+        XenEvtchnPort *rp = &s->port_table[interdomain->remote_port];
+        XenEvtchnPort *lp = &s->port_table[interdomain->local_port];
+
+        if (rp->type == EVTCHNSTAT_unbound && rp->type_val == 0) {
+            /* It's a match! */
+            rp->type = EVTCHNSTAT_interdomain;
+            rp->type_val = interdomain->local_port;
+
+            lp->type = EVTCHNSTAT_interdomain;
+            lp->type_val = interdomain->remote_port;
+        } else {
+            ret = -EINVAL;
+        }
+    }
+
+    if (ret) {
+        free_port(s, interdomain->local_port);
+    }
+ out:
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+
+}
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index fc080138e3..1ebc7580eb 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -22,6 +22,7 @@ struct evtchn_bind_virq;
 struct evtchn_bind_ipi;
 struct evtchn_send;
 struct evtchn_alloc_unbound;
+struct evtchn_bind_interdomain;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
@@ -29,5 +30,6 @@ int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
 int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
+int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index e186dec9a9..a07d1d39f3 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -933,6 +933,22 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_bind_interdomain: {
+        struct evtchn_bind_interdomain interdomain;
+
+        qemu_build_assert(sizeof(interdomain) == 12);
+        if (kvm_copy_from_gva(cs, arg, &interdomain, sizeof(interdomain))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_bind_interdomain_op(&interdomain);
+        if (!err &&
+            kvm_copy_to_gva(cs, arg, &interdomain, sizeof(interdomain))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.0


