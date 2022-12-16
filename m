Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440F64E55A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:45:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5yne-0005NH-FY; Thu, 15 Dec 2022 19:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5ynE-0005F5-EV
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5yn8-0006aJ-57
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GBOWYyuWKdYysrZ+j4MeLrWFq/GKTS0ZAHS+vvkBe24=; b=C+AIMhV3ErZdRRVanVTFo6Vz2D
 gHqAnpjqx5iuJYyuRuTIAb1uSd73Jb9doVob/AnkAlYUKtt+zfkr/Hy+lq5vqbfV0iVM9+3No44++
 XO1asMn73Ls7e5Y0dHagCGMa3iGwPjq8gQh/pARsehJ51eWrp5yQUdtLIuuBtVOfoF+gwsmNTPV+a
 kyW6KkupbqVBefqU2WtfjJEdr32aAmjBGVlyA+XOxv+8UIt01NrHw7MDy9bPdV5tCEkfz3VceTJSW
 gKJsp0WmL5Qk7oZTeQYZndYSBH5HSm7JjxAE2DqANfMEfRSuuoJPTLKyuPYOzCPKVfolUKsKGHaeb
 eyvVTp8g==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5yn6-00EvVC-AK; Fri, 16 Dec 2022 00:41:33 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cPs-Bo; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 28/38] hw/xen: Implement EVTCHNOP_bind_virq
Date: Fri, 16 Dec 2022 00:41:07 +0000
Message-Id: <20221216004117.862106-29-dwmw2@infradead.org>
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

Add the array of virq ports to each vCPU so that we can deliver timers,
debug ports, etc. Global virqs are allocated against vCPU 0 initially,
but can be migrated to other vCPUs (when we implement that).

The kernel needs to know about VIRQ_TIMER in order to accelerate timers,
so tell it via KVM_XEN_VCPU_ATTR_TYPE_TIMER.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 83 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 +
 include/sysemu/kvm_xen.h  |  1 +
 target/i386/cpu.h         |  3 ++
 target/i386/kvm/xen-emu.c | 61 ++++++++++++++++++++++++++++
 target/i386/machine.c     |  1 +
 6 files changed, 151 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 50adef0864..19b8eb7a6f 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -208,6 +208,11 @@ static bool valid_port(evtchn_port_t port)
     }
 }
 
+static bool valid_vcpu(uint32_t vcpu)
+{
+    return !!qemu_get_cpu(vcpu);
+}
+
 int xen_evtchn_status_op(struct evtchn_status *status)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
@@ -398,6 +403,20 @@ static int unmask_port(XenEvtchnState *s, evtchn_port_t port, bool do_unmask)
     }
 }
 
+static bool virq_is_global(uint32_t virq)
+{
+    switch (virq) {
+    case VIRQ_TIMER:
+    case VIRQ_DEBUG:
+    case VIRQ_XENOPROF:
+    case VIRQ_XENPMU:
+        return false;
+
+    default:
+        return true;
+    }
+}
+
 static void free_port(XenEvtchnState *s, evtchn_port_t port)
 {
     s->port_table[port].type = EVTCHNSTAT_closed;
@@ -411,6 +430,28 @@ static void free_port(XenEvtchnState *s, evtchn_port_t port)
     }
 }
 
+static int allocate_port(XenEvtchnState *s, uint32_t vcpu, uint16_t type,
+                         uint16_t val, evtchn_port_t *port)
+{
+    evtchn_port_t p = 1;
+
+    for (p = 1; valid_port(p); p++) {
+        if (s->port_table[p].type == EVTCHNSTAT_closed) {
+            s->port_table[p].vcpu = vcpu;
+            s->port_table[p].type = type;
+            s->port_table[p].type_val = val;
+
+            *port = p;
+
+            if (s->nr_ports < p + 1)
+                s->nr_ports = p + 1;
+
+            return 0;
+        }
+    }
+    return -ENOSPC;
+}
+
 static int close_port(XenEvtchnState *s, evtchn_port_t port)
 {
     XenEvtchnPort *p = &s->port_table[port];
@@ -419,6 +460,11 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
     case EVTCHNSTAT_closed:
         return -ENOENT;
 
+    case EVTCHNSTAT_virq:
+        kvm_xen_set_vcpu_virq(virq_is_global(p->type_val) ? 0 : p->vcpu,
+                              p->type_val, 0);
+        break;
+
     default:
         break;
     }
@@ -470,3 +516,40 @@ int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
 
     return ret;
 }
+
+int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (virq->virq >= NR_VIRQS) {
+        return -EINVAL;
+    }
+
+    /* Global VIRQ must be allocated on vCPU0 first */
+    if (virq_is_global(virq->virq) && virq->vcpu != 0) {
+        return -EINVAL;
+    }
+
+    if (!valid_vcpu(virq->vcpu)) {
+        return -ENOENT;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = allocate_port(s, virq->vcpu, EVTCHNSTAT_virq, virq->virq, &virq->port);
+    if (!ret) {
+        ret = kvm_xen_set_vcpu_virq(virq->vcpu, virq->virq, virq->port);
+        if (ret) {
+            free_port(s, virq->port);
+        }
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 2fb7d70043..ffddd87bdc 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -16,6 +16,8 @@ int xen_evtchn_set_callback_param(uint64_t param);
 struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
+struct evtchn_bind_virq;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
+int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index ab629feb13..e5b14ffe8d 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -14,5 +14,6 @@
 
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id);
+int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
 
 #endif /* QEMU_SYSEMU_KVM_XEN_H */
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 938a1b9c8b..846c738fd7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -27,6 +27,8 @@
 #include "qapi/qapi-types-common.h"
 #include "qemu/cpu-float.h"
 
+#define XEN_NR_VIRQS 24
+
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
@@ -1793,6 +1795,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
     uint8_t xen_vcpu_callback_vector;
+    uint16_t xen_virq[XEN_NR_VIRQS];
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 51cb6bf052..d6b26c59e1 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -287,6 +287,52 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id)
     qemu_cpu_kick(cs);
 }
 
+static int kvm_xen_set_vcpu_timer(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    struct kvm_xen_vcpu_attr va = {
+        .type = KVM_XEN_VCPU_ATTR_TYPE_TIMER,
+        .u.timer.port = env->xen_virq[VIRQ_TIMER],
+	.u.timer.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL,
+	.u.timer.expires_ns = 0,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_XEN_VCPU_SET_ATTR, &va);
+}
+
+static void do_set_vcpu_timer_virq(CPUState *cs, run_on_cpu_data data)
+{
+    kvm_xen_set_vcpu_timer(cs);
+}
+
+int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port)
+{
+    CPUState *cs = qemu_get_cpu(vcpu_id);
+
+    if (!cs) {
+        return -ENOENT;
+    }
+
+    /* cpu.h doesn't include the actual Xen header. */
+    qemu_build_assert(NR_VIRQS == XEN_NR_VIRQS);
+
+    if (virq >= NR_VIRQS) {
+        return -EINVAL;
+    }
+
+    if (port && X86_CPU(cs)->env.xen_virq[virq]) {
+        return -EEXIST;
+    }
+
+    X86_CPU(cs)->env.xen_virq[virq] = port;
+    if (virq == VIRQ_TIMER) {
+        async_run_on_cpu(cs, do_set_vcpu_timer_virq, RUN_ON_CPU_HOST_INT(port));
+    }
+    return 0;
+}
+
 static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -724,6 +770,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_unmask_op(&unmask);
         break;
     }
+    case EVTCHNOP_bind_virq: {
+        struct evtchn_bind_virq virq;
+
+        qemu_build_assert(sizeof(virq) == 12);
+        if (kvm_copy_from_gva(cs, arg, &virq, sizeof(virq))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_bind_virq_op(&virq);
+        if (!err && kvm_copy_to_gva(cs, arg, &virq, sizeof(virq))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 09e13cf716..e04d64913c 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1280,6 +1280,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_runstate_gpa, X86CPU),
         VMSTATE_UINT8(env.xen_vcpu_callback_vector, X86CPU),
+        VMSTATE_UINT16_ARRAY(env.xen_virq, X86CPU, XEN_NR_VIRQS),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.35.3


