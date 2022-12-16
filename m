Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1CC64E560
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:49:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ynj-0005RU-Nj; Thu, 15 Dec 2022 19:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynG-0005Fa-8v
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:44 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynB-0006cq-VN
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=twBCfa5ab9yvAw8qE/yZyB5yxVmEoa7bU6nINefGeSc=; b=WscDVIJqnOu5jBWGKZERe3oX0m
 XXrxxu2+ulbHRhTFbqR/GiOyUvl6sps2sKxE2p6JtXtZPwaXzxSy0gtyA4GYJK3U7sD6pmqBCvYE+
 kNz0giYHhgr46qEKTSVjuOPhM+400+epGKE2JzRWkzahuEqWgMPTT0JeyOG98kB/4YpAOYFUVlPps
 0Sek8adc9t8vTVOE+Jup6f3EXrBPGm8cK+uBww2ecoVb/OHhxKLnAX1KsiqTanpOOGFlIVZpu4ZS6
 +2L8aDurbVEED/ZxYqbwkITm52TOg1UA1BpvzXjOBToDJov23JkWqG1HHQ2tQyF77s4MjRaJJWD9e
 rzOnuH1Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymy-00Azyy-1k; Fri, 16 Dec 2022 00:41:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cQC-FP; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 33/38] hw/xen: Implement EVTCHNOP_bind_vcpu
Date: Fri, 16 Dec 2022 00:41:12 +0000
Message-Id: <20221216004117.862106-34-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org;
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
 hw/i386/kvm/xen_evtchn.c  | 40 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 12 ++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index b286bbd20e..8cdc26afb7 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -687,6 +687,46 @@ int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
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
index 4783a6f127..99d5292c1e 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -21,6 +21,7 @@ struct evtchn_bind_ipi;
 struct evtchn_send;
 struct evtchn_alloc_unbound;
 struct evtchn_bind_interdomain;
+struct evtchn_bind_vcpu;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
@@ -29,3 +30,4 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
 int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
+int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu);
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c4c595cb1a..58fa82682f 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -842,6 +842,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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
2.35.3


