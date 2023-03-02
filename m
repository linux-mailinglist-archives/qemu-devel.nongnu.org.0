Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E26A825B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:36:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi7D-0002ec-T1; Thu, 02 Mar 2023 07:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6X-0002Tu-Jb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6V-0003G1-L3
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pw9fO1sLqyUroktc4FbV7fzqXom90HdSf+/2Lgsk5I=;
 b=CCr+JEqw/ouU/CUOqpUTfU5eTwfNRFkUNr21iQtucIrN9vuro3ZGSs6JLRv2x28BXe2rC0
 H/Bb/BWOtIr6n8ww5qLG1tkndGI1GDZxs4lN4Ce73kJ+Ha7gTfAPqtz90MMzMj72+w7j55
 HIOOmOwufQKB0+skzAuldXpm53M2qmw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-OQqTlGD8O_ij0g3_P6zRhg-1; Thu, 02 Mar 2023 07:32:10 -0500
X-MC-Unique: OQqTlGD8O_ij0g3_P6zRhg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i18-20020a05600011d200b002c94d861113so3141978wrx.16
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3pw9fO1sLqyUroktc4FbV7fzqXom90HdSf+/2Lgsk5I=;
 b=AsBypl9xYn/Z5NwelptDPkg82tZjYX8Og489wva8HsP2llYubx9rdYk4BKYhHCn7qV
 gVC2Qj13uySu2CxFf5gyGqHa/GP7OYJJmaf8CEnGU+D2UAktQOnHfva/BMZ9ChKnpx7c
 LR8JxlU1lbu3t4VWTyZixCcVV6+LLQoCr06nrWBrvJWkjGwSW/ba5WuuCTHBM82QMAI1
 AEzPAP9PT5U8BXnpRycViuBKfU++CudeMrcXBrajLfM3FUc422WBJVVV7HYWOTeHIXhN
 hFgjIyQttQeh/isduKx3H0Jn7cjh2jlWZLpWpQTBU3mPLvJJW4swNuITYAte1lUqtuTG
 boXw==
X-Gm-Message-State: AO0yUKU6NSuekxvdkqVb25ik/YUNCS8aKVimhgIVR+UL/G10lRvjuKTl
 PFlRxngKVWs++3dWTHSpo8lWoeZ1Xn9UYG8bjltbln4VmaODyubJbyrqaZFglfV/OoaYTliogVV
 uSxBmiMu1vJiMSU9rHoYKMgEZDTy/n5svs6vh74syJlEAfn9OLat17890pF9rsfT8ChPFr6Nycn
 4=
X-Received: by 2002:adf:e945:0:b0:2c7:17a0:c6b5 with SMTP id
 m5-20020adfe945000000b002c717a0c6b5mr6734931wrn.34.1677760328362; 
 Thu, 02 Mar 2023 04:32:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8vBGW4Dybl840vBkTaNpcaKuLCjQjAcQvnmvS/Xd9VIGuwOHy3mnCSobENI6oJy64exT3DxA==
X-Received: by 2002:adf:e945:0:b0:2c7:17a0:c6b5 with SMTP id
 m5-20020adfe945000000b002c717a0c6b5mr6734907wrn.34.1677760327778; 
 Thu, 02 Mar 2023 04:32:07 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h16-20020adff4d0000000b002c70851fdd8sm15274112wrp.75.2023.03.02.04.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 32/62] hw/xen: Implement EVTCHNOP_bind_virq
Date: Thu,  2 Mar 2023 13:29:59 +0100
Message-Id: <20230302123029.153265-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 85 ++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 +
 include/sysemu/kvm_xen.h  |  1 +
 target/i386/cpu.h         |  4 ++
 target/i386/kvm/xen-emu.c | 91 +++++++++++++++++++++++++++++++++++++++
 target/i386/machine.c     |  2 +
 6 files changed, 185 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 54707f1f9fe1..a3202d39abca 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -244,6 +244,11 @@ static bool valid_port(evtchn_port_t port)
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
@@ -496,6 +501,43 @@ static void free_port(XenEvtchnState *s, evtchn_port_t port)
     clear_port_pending(s, port);
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
 static int close_port(XenEvtchnState *s, evtchn_port_t port)
 {
     XenEvtchnPort *p = &s->port_table[port];
@@ -504,6 +546,11 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
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
@@ -555,3 +602,41 @@ int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
 
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
index 69c6b0d743ae..0ea13dda3a25 100644
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
index 644c7d889c6b..fbb7414eb797 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -23,6 +23,7 @@ int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
+int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1c7603221dc6..4b70257db5dd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -27,6 +27,8 @@
 #include "qapi/qapi-types-common.h"
 #include "qemu/cpu-float.h"
 
+#define XEN_NR_VIRQS 24
+
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
@@ -1806,6 +1808,8 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
     uint8_t xen_vcpu_callback_vector;
+    uint16_t xen_virq[XEN_NR_VIRQS];
+    uint64_t xen_singleshot_timer_ns;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 884e1c9c11d1..e0417f3d1359 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -355,6 +355,53 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
     }
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
@@ -387,6 +434,8 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
     env->xen_vcpu_runstate_gpa = INVALID_GPA;
     env->xen_vcpu_callback_vector = 0;
+    env->xen_singleshot_timer_ns = 0;
+    memset(env->xen_virq, 0, sizeof(env->xen_virq));
 
     set_vcpu_info(cs, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
@@ -395,6 +444,7 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
                           INVALID_GPA);
     if (kvm_xen_has_cap(EVTCHN_SEND)) {
         kvm_xen_set_vcpu_callback_vector(cs);
+        kvm_xen_set_vcpu_timer(cs);
     }
 
 }
@@ -829,6 +879,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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
@@ -1060,6 +1125,12 @@ int kvm_put_xen_state(CPUState *cs)
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
 
@@ -1068,6 +1139,7 @@ int kvm_get_xen_state(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
     uint64_t gpa;
+    int ret;
 
     /*
      * The kernel does not mark vcpu_info as dirty when it delivers interrupts
@@ -1090,5 +1162,24 @@ int kvm_get_xen_state(CPUState *cs)
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
index a4874eda9041..603a1077e34a 100644
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
2.39.1


