Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A8652AFA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:28:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7na7-0004GB-PA; Tue, 20 Dec 2022 20:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7nZK-0002tc-OE
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:06:52 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7nZD-0004Cn-I4
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iTZL64aauvco8bdXJQ7ea8tp2vvTY5t6ZdaT6YLf4EQ=; b=ToQ3sXdxPAdW6/l9xp3Yhwxvu3
 zVinhNufrXqIsCHbMFTXU1RGDvzfoWxr1pmWI+v54WS2QdsK2IycC+xfZoTdCew77A0J1e5NnR66N
 tMXZYFPUQgB96SrHcTJEO2kXV3KRwfBCMgxblXU+d/n+EvJ4IJPQg+2ZcbOKqLvDKOw3qKEUbPFaO
 Ffi6VsPAoNQfPcvPv6/1xSFDJER0TQ62EJg/O85afZrKBybp2G5AHCejB2Cwm11W4CJEK6hgs1Hic
 qUBZsGrBTRrDnLzHTLA5YxTiIFWgjfz3S/ufdslq8sKav3VpDdTXkQlBei6ynr4HodiKJg82mAq23
 rP5HPUbw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p7nZ8-002Kcl-Dj; Wed, 21 Dec 2022 01:06:39 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p7nYx-004CMw-0j; Wed, 21 Dec 2022 01:06:27 +0000
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
Subject: [RFC PATCH v4 32/47] hw/xen: Implement EVTCHNOP_bind_virq
Date: Wed, 21 Dec 2022 01:06:08 +0000
Message-Id: <20221221010623.1000191-33-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221221010623.1000191-1-dwmw2@infradead.org>
References: <20221221010623.1000191-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org;
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
so tell it via KVM_XEN_VCPU_ATTR_TYPE_TIMER. Also save/restore the value
of the singleshot timer across migration, as the kernel will handle the
hypercalls automatically now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 85 +++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 +
 include/sysemu/kvm_xen.h  |  1 +
 target/i386/cpu.h         |  4 ++
 target/i386/kvm/xen-emu.c | 88 +++++++++++++++++++++++++++++++++++++++
 target/i386/machine.c     |  2 +
 6 files changed, 182 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index a3ad2ddb55..d94f38c491 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -248,6 +248,11 @@ static bool valid_port(evtchn_port_t port)
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
@@ -451,6 +456,20 @@ static int unmask_port(XenEvtchnState *s, evtchn_port_t port, bool do_unmask)
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
@@ -464,6 +483,29 @@ static void free_port(XenEvtchnState *s, evtchn_port_t port)
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
+            if (s->nr_ports < p + 1) {
+                s->nr_ports = p + 1;
+            }
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
@@ -472,6 +514,11 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
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
@@ -523,3 +570,41 @@ int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
 
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
+    ret = allocate_port(s, virq->vcpu, EVTCHNSTAT_virq, virq->virq,
+                        &virq->port);
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
index 69c6b0d743..0ea13dda3a 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -18,8 +18,10 @@ int xen_evtchn_set_callback_param(uint64_t param);
 struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
+struct evtchn_bind_virq;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
+int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index d975416f2e..e5b93b63d7 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -19,6 +19,7 @@
 uint32_t kvm_xen_get_caps(void);
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
 bool kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
+int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 938a1b9c8b..000ed2fed9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -27,6 +27,8 @@
 #include "qapi/qapi-types-common.h"
 #include "qemu/cpu-float.h"
 
+#define XEN_NR_VIRQS 24
+
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
@@ -1793,6 +1795,8 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
     uint8_t xen_vcpu_callback_vector;
+    uint16_t xen_virq[XEN_NR_VIRQS];
+    uint64_t xen_singleshot_timer_ns;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c218696fe4..fc3c0fa039 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -345,6 +345,53 @@ bool kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
     return false;
 }
 
+static int kvm_xen_set_vcpu_timer(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    struct kvm_xen_vcpu_attr va = {
+        .type = KVM_XEN_VCPU_ATTR_TYPE_TIMER,
+        .u.timer.port = env->xen_virq[VIRQ_TIMER],
+        .u.timer.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL,
+        .u.timer.expires_ns = env->xen_singleshot_timer_ns,
+    };
+
+    return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &va);
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
+    if (virq == VIRQ_TIMER && kvm_xen_has_cap(EVTCHN_SEND)) {
+        async_run_on_cpu(cs, do_set_vcpu_timer_virq,
+                         RUN_ON_CPU_HOST_INT(port));
+    }
+    return 0;
+}
+
 static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -814,6 +861,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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
@@ -1033,6 +1095,12 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    if (env->xen_virq[VIRQ_TIMER]) {
+        ret = kvm_xen_set_vcpu_timer(cs);
+        if (ret < 0) {
+            return ret;
+        }
+    }
     return 0;
 }
 
@@ -1041,6 +1109,7 @@ int kvm_get_xen_state(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
     uint64_t gpa;
+    int ret;
 
     /*
      * The kernel does not mark vcpu_info as dirty when it delivers interrupts
@@ -1062,5 +1131,24 @@ int kvm_get_xen_state(CPUState *cs)
         }
     }
 
+    if (!kvm_xen_has_cap(EVTCHN_SEND)) {
+        return 0;
+    }
+
+    /*
+     * If the kernel is accelerating timers, read out the current value of the
+     * singleshot timer deadline.
+     */
+    if (env->xen_virq[VIRQ_TIMER]) {
+        struct kvm_xen_vcpu_attr va = {
+            .type = KVM_XEN_VCPU_ATTR_TYPE_TIMER,
+        };
+        ret = kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_GET_ATTR, &va);
+        if (ret < 0) {
+            return ret;
+        }
+        env->xen_singleshot_timer_ns = va.u.timer.expires_ns;
+    }
+
     return 0;
 }
diff --git a/target/i386/machine.c b/target/i386/machine.c
index a4874eda90..603a1077e3 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1275,6 +1275,8 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_runstate_gpa, X86CPU),
         VMSTATE_UINT8(env.xen_vcpu_callback_vector, X86CPU),
+        VMSTATE_UINT16_ARRAY(env.xen_virq, X86CPU, XEN_NR_VIRQS),
+        VMSTATE_UINT64(env.xen_singleshot_timer_ns, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.35.3


