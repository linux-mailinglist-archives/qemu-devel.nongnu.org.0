Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940AA686877
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEBC-0002fu-Gd; Wed, 01 Feb 2023 09:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNE9m-0001Rz-Ev
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:14 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+8c5eeea0684575598b25+7101+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pNE9g-00036q-Qz
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Hi/G5qLBuuT3IgQZTtEGEPCw977It6w5tenALXQ4eMU=; b=OeuOxxLLmEjRX2bPAM8a8okhEu
 mNADN7ceVnfGtH9Pwbv0lh12DGhJxDW/A1kf/oydqqVdm1rVBW574sXUIPmNIT5wU0TaWZ2GCiqcg
 jaO4s35EUT6sFsjXwzfZwNSD+MoKYBihj8WCXMmJ6qY84iJTCiLH7V7M6uvvbNt6A20ov8eMVQtD9
 oawTPxfLcgZzNzWBzAzt26Zfdb33ZgVRbG8a5WUUZP9TZgIPF3O3tq9LlWcQ0CwsIT4ZHoE9q/E5S
 vESWkT062YtfZYI14YOg9WBT3OrChKTA9ro3pKZ1/79wUQ8fx9f/pH+cPc7Vguou2Tasj0Tx2kx5/
 mRVE/9dg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pNE9Q-00CMbG-Kl; Wed, 01 Feb 2023 14:31:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pNE9Q-007JsQ-1v; Wed, 01 Feb 2023 14:31:52 +0000
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
Subject: [PATCH v10 37/59] hw/xen: Implement EVTCHNOP_bind_vcpu
Date: Wed,  1 Feb 2023 14:31:26 +0000
Message-Id: <20230201143148.1744093-38-dwmw2@infradead.org>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 40 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 12 ++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 3e6f7afcbc..f87b6a3b23 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -789,6 +789,46 @@ int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
     return ret;
 }
 
+int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *p;
+    int ret = -EINVAL;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(vcpu->port)) {
+        return -EINVAL;
+    }
+
+    if (!valid_vcpu(vcpu->vcpu)) {
+        return -ENOENT;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    p = &s->port_table[vcpu->port];
+
+    if (p->type == EVTCHNSTAT_interdomain ||
+        p->type == EVTCHNSTAT_unbound ||
+        p->type == EVTCHNSTAT_pirq ||
+        (p->type == EVTCHNSTAT_virq && virq_is_global(p->type_val))) {
+        /*
+         * unmask_port() with do_unmask==false will just raise the event
+         * on the new vCPU if the port was already pending.
+         */
+        p->vcpu = vcpu->vcpu;
+        unmask_port(s, vcpu->port, false);
+        ret = 0;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 1ebc7580eb..486b031c82 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -23,6 +23,7 @@ struct evtchn_bind_ipi;
 struct evtchn_send;
 struct evtchn_alloc_unbound;
 struct evtchn_bind_interdomain;
+struct evtchn_bind_vcpu;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
@@ -31,5 +32,6 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
 int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
+int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index a07d1d39f3..ec7aefadfc 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -949,6 +949,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_bind_vcpu: {
+        struct evtchn_bind_vcpu vcpu;
+
+        qemu_build_assert(sizeof(vcpu) == 8);
+        if (kvm_copy_from_gva(cs, arg, &vcpu, sizeof(vcpu))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_bind_vcpu_op(&vcpu);
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.0


