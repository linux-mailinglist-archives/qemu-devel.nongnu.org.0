Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0207C6868D6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:48:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNECI-0004Oz-LD; Wed, 01 Feb 2023 09:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pNE9w-0001Vc-KD
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:24 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pNE9i-00039E-O5
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=P/qomelk/UH5MdSA+XHIcdDA/X4BK59j4DtJyIjAjbI=; b=gUTA3ZUbaBf18soLFImsAlAFmg
 Z+fE60ExpEELr5kriHY4Ip/jnWjX39tFRNIwIoMh7Kpw4c1mKcrj8L4+P9v5p9lK5wil/D8BhAnLv
 m+r8lPTVVTOjfdDMlOwBStqUucdmJxrf4x14CHKgF5+k5rqG6Ky5MWqrOKhP4RURporY81ZVxB+kd
 NflmRgLyLQ53bZtoQW+xJcsVege/nk0wZv4VvxHiOPE9gCEZXOy/agl5bdRkCKyfo8++1mZxffE76
 V/MyvMhcPz31Y8XwUK8W7LcWG8/f6ApgxXCkPUpOwvFXOevrzXyX2sn3jLTtCgGClgnj9WKB2NTtn
 35GAGwbg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pNE8r-004nyT-2u; Wed, 01 Feb 2023 14:31:22 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pNE9Q-007JsI-1Z; Wed, 01 Feb 2023 14:31:52 +0000
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
Subject: [PATCH v10 35/59] hw/xen: Implement EVTCHNOP_alloc_unbound
Date: Wed,  1 Feb 2023 14:31:24 +0000
Message-Id: <20230201143148.1744093-36-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201143148.1744093-1-dwmw2@infradead.org>
References: <20230201143148.1744093-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org;
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
---
 hw/i386/kvm/xen_evtchn.c  | 32 ++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 15 +++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index a97d6ba61d..9dc5a98d94 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -835,6 +835,38 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
     return ret;
 }
 
+int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint16_t type_val;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (alloc->dom != DOMID_SELF && alloc->dom != xen_domid) {
+        return -ESRCH;
+    }
+
+    if (alloc->remote_dom == DOMID_QEMU) {
+        type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
+    } else if (alloc->remote_dom == DOMID_SELF ||
+               alloc->remote_dom == xen_domid) {
+        type_val = 0;
+    } else {
+        return -EPERM;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = allocate_port(s, 0, EVTCHNSTAT_unbound, type_val, &alloc->port);
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
 int xen_evtchn_send_op(struct evtchn_send *send)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 500fdbe8b8..fc080138e3 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -21,11 +21,13 @@ struct evtchn_unmask;
 struct evtchn_bind_virq;
 struct evtchn_bind_ipi;
 struct evtchn_send;
+struct evtchn_alloc_unbound;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
 int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 int xen_evtchn_send_op(struct evtchn_send *send);
+int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 5299614d3c..e186dec9a9 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -918,6 +918,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_send_op(&send);
         break;
     }
+    case EVTCHNOP_alloc_unbound: {
+        struct evtchn_alloc_unbound alloc;
+
+        qemu_build_assert(sizeof(alloc) == 8);
+        if (kvm_copy_from_gva(cs, arg, &alloc, sizeof(alloc))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_alloc_unbound_op(&alloc);
+        if (!err && kvm_copy_to_gva(cs, arg, &alloc, sizeof(alloc))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.0


