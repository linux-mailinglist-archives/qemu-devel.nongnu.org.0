Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7CC6A6DB6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:00:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMuA-0002XH-CM; Wed, 01 Mar 2023 08:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMst-0008PN-7x
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:44 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMsn-0002ot-Pn
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Lt46U8B0GRIt+YKpl9V8mU4n9VTbMETd0ZsLeZehHZo=; b=Lwbz7jcQGEGJdExP7Y32uOFrk2
 xXumsg++ixtU0LIcEjq3C0cukEe2epp4gUJBCMX/bRq3fu3HtoG82V9KeWO/ebHKFUy9DATBnHTvB
 4m3+0d1ZdY5ZNO9hVNqCMC+JpIW1KCP+JyZRvpaPA5p1zJ+IEVlyRyv/8Pjlswgfwnp4hMz6Dxfm5
 LZ4YQHa0NhGdrWIUElKvjR+9rYf+/j0YoYcteeZWGXNrAxAU8cHC/r9am1pIejWTh2CSQ1C15l0pC
 ONDv33IeWThkeiyGMignYhgkxFUfgAvy7aiTfm0pOQzDuPAAeaYBNBXHZWdnGLYnoAq1uoKQvneYE
 cEoh4P3Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXMsd-00EuVy-1d; Wed, 01 Mar 2023 13:52:32 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXMsd-0049W2-1G; Wed, 01 Mar 2023 13:52:27 +0000
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
Subject: [PATCH v15 36/60] hw/xen: Implement EVTCHNOP_bind_interdomain
Date: Wed,  1 Mar 2023 13:51:59 +0000
Message-Id: <20230301135223.988336-37-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301135223.988336-1-dwmw2@infradead.org>
References: <20230301135223.988336-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 78 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 +
 target/i386/kvm/xen-emu.c | 16 ++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index df25bf0806..e2e36d94f6 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -722,6 +722,23 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
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
@@ -837,6 +854,67 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
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
index ac04387a6a..1aff6b1042 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -936,6 +936,22 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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


