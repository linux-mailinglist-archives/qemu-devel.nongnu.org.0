Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E298659852
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:41:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEHu-0001z2-Qw; Fri, 30 Dec 2022 07:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3cbd6dee458626289faf+7068+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pBEG3-00088B-CB
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:07 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3cbd6dee458626289faf+7068+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pBEFv-00052b-Uj
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=OhJOZs2pEAOWSx8CnmC5TAFG8HeCu0sbRmyIgub6xEY=; b=gZdzA8QVC7w4Lx79iu/umPi58c
 xU6jenQNKXxwZuxOsbJrrvNzf4doDl/um1hMJLn5TSSYMJx3bAgKbKGr7KwoEdyuJomEkkyeOCLld
 VS3kjGdGiyz2z06O6csDm5OpvTxc1c9HZMj+muyLJ+YfstiKy1SZEiwB8IwwOEPoY8nPx44z1krCR
 5MRWtLGK1GLNgdw5Ir9W1ZczGCU4Dqav8D7cNi74w/akaClM0A/dhAUiGsnuNqe0Pb8tIfOYetzgq
 WhC75TyICNpCjtiPNr0qMpslJyVLZum5po4AoVBZQfkfqZ4QKABHDtjVfjnAod38ATFyk+PlUX51c
 XHn5yVHQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pBEFW-00Gpjo-2x; Fri, 30 Dec 2022 12:12:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFa-005O0N-GC; Fri, 30 Dec 2022 12:12:38 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v5 47/52] i386/xen: handle PV timer hypercalls
Date: Fri, 30 Dec 2022 12:12:30 +0000
Message-Id: <20221230121235.1282915-48-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221230121235.1282915-1-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+3cbd6dee458626289faf+7068+infradead.org+dwmw2@desiato.srs.infradead.org;
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

From: Joao Martins <joao.m.martins@oracle.com>

Introduce support for one shot and periodic mode of Xen PV timers,
whereby timer interrupts come through a special virq event channel
with deadlines being set through:

1) set_timer_op hypercall (only oneshot)
2) vcpu_op hypercall for {set,stop}_{singleshot,periodic}_timer
hypercalls

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  |  31 +++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/cpu.h         |   5 +
 target/i386/kvm/xen-emu.c | 245 +++++++++++++++++++++++++++++++++++++-
 target/i386/machine.c     |   1 +
 5 files changed, 282 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 49caf69dc0..34c5199421 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1159,6 +1159,37 @@ int xen_evtchn_send_op(struct evtchn_send *send)
     return ret;
 }
 
+int xen_evtchn_set_port(uint16_t port)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *p;
+    int ret = -EINVAL;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    p = &s->port_table[port];
+
+    /* QEMU has no business sending to anything but these */
+    if (p->type == EVTCHNSTAT_virq ||
+        (p->type == EVTCHNSTAT_interdomain &&
+         (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU))) {
+            set_port_pending(s, port);
+            ret = 0;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
 static const char *type_names[] = {
     "closed",
     "unbound",
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 86f154e359..eb6ba16f72 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -20,6 +20,8 @@ int xen_evtchn_set_callback_param(uint64_t param);
 void xen_evtchn_connect_gsis(qemu_irq *system_gsis);
 void xen_evtchn_set_callback_level(int level);
 
+int xen_evtchn_set_port(uint16_t port);
+
 void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
 void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 144b1c3038..1a411e1b49 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -26,6 +26,7 @@
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
 #include "qemu/cpu-float.h"
+#include "qemu/timer.h"
 
 #define XEN_NR_VIRQS 24
 
@@ -1798,6 +1799,10 @@ typedef struct CPUArchState {
     bool xen_callback_asserted;
     uint16_t xen_virq[XEN_NR_VIRQS];
     uint64_t xen_singleshot_timer_ns;
+    QEMUTimer *xen_singleshot_timer;
+    uint64_t xen_periodic_timer_period;
+    QEMUTimer *xen_periodic_timer;
+    QemuMutex xen_timers_lock;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 0c47859980..7f13ae6a8b 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -39,6 +39,9 @@
 
 #include "xen-compat.h"
 
+static void xen_vcpu_singleshot_timer_event(void *opaque);
+static void xen_vcpu_periodic_timer_event(void *opaque);
+
 #ifdef TARGET_X86_64
 #define hypercall_compat32(longmode) (!(longmode))
 #else
@@ -170,6 +173,23 @@ int kvm_xen_init_vcpu(CPUState *cs)
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
     env->xen_vcpu_runstate_gpa = INVALID_GPA;
 
+    qemu_mutex_init(&env->xen_timers_lock);
+    env->xen_singleshot_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                             xen_vcpu_singleshot_timer_event,
+                                             cpu);
+    if (!env->xen_singleshot_timer) {
+        return -ENOMEM;
+    }
+    env->xen_singleshot_timer->opaque = cs;
+
+    env->xen_periodic_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                           xen_vcpu_periodic_timer_event,
+                                           cpu);
+    if (!env->xen_periodic_timer) {
+        return -ENOMEM;
+    }
+    env->xen_periodic_timer->opaque = cs;
+
     return 0;
 }
 
@@ -201,7 +221,8 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
                          1 << XENFEAT_writable_descriptor_tables |
                          1 << XENFEAT_auto_translated_physmap |
                          1 << XENFEAT_supervisor_mode_kernel |
-                         1 << XENFEAT_hvm_callback_vector;
+                         1 << XENFEAT_hvm_callback_vector |
+                         1 << XENFEAT_hvm_safe_pvclock;
         }
 
         err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
@@ -815,13 +836,192 @@ static int vcpuop_register_runstate_info(CPUState *cs, CPUState *target,
     return 0;
 }
 
+static uint64_t kvm_get_current_ns(void)
+{
+    struct kvm_clock_data data;
+    int ret;
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_GET_CLOCK, &data);
+    if (ret < 0) {
+        fprintf(stderr, "KVM_GET_CLOCK failed: %s\n", strerror(ret));
+                abort();
+    }
+
+    return data.clock;
+}
+
+static void xen_vcpu_singleshot_timer_event(void *opaque)
+{
+    CPUState *cpu = opaque;
+    CPUX86State *env = &X86_CPU(cpu)->env;
+    uint16_t port = env->xen_virq[VIRQ_TIMER];
+
+    if (likely(port)) {
+        xen_evtchn_set_port(port);
+    }
+
+    qemu_mutex_lock(&env->xen_timers_lock);
+    env->xen_singleshot_timer_ns = 0;
+    qemu_mutex_unlock(&env->xen_timers_lock);
+}
+
+static void xen_vcpu_periodic_timer_event(void *opaque)
+{
+    CPUState *cpu = opaque;
+    CPUX86State *env = &X86_CPU(cpu)->env;
+    uint16_t port = env->xen_virq[VIRQ_TIMER];
+    int64_t qemu_now;
+
+    if (likely(port)) {
+        xen_evtchn_set_port(port);
+    }
+
+    qemu_mutex_lock(&env->xen_timers_lock);
+
+    qemu_now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    timer_mod_ns(env->xen_periodic_timer,
+                 qemu_now + env->xen_periodic_timer_period);
+
+    qemu_mutex_unlock(&env->xen_timers_lock);
+}
+
+static int do_set_periodic_timer(CPUState *target, uint64_t period_ns)
+{
+    CPUX86State *tenv = &X86_CPU(target)->env;
+    int64_t qemu_now;
+
+    timer_del(tenv->xen_periodic_timer);
+
+    qemu_mutex_lock(&tenv->xen_timers_lock);
+
+    qemu_now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    timer_mod_ns(tenv->xen_periodic_timer, qemu_now + period_ns);
+    tenv->xen_periodic_timer_period = period_ns;
+
+    qemu_mutex_unlock(&tenv->xen_timers_lock);
+    return 0;
+}
+
+#define MILLISECS(_ms)  ((int64_t)((_ms) * 1000000ULL))
+#define MICROSECS(_us)  ((int64_t)((_us) * 1000ULL))
+#define STIME_MAX ((time_t)((int64_t)~0ull >> 1))
+/* Chosen so (NOW() + delta) wont overflow without an uptime of 200 years */
+#define STIME_DELTA_MAX ((int64_t)((uint64_t)~0ull >> 2))
+
+static int vcpuop_set_periodic_timer(CPUState *cs, CPUState *target,
+                                     uint64_t arg)
+{
+    struct vcpu_set_periodic_timer spt;
+
+    qemu_build_assert(sizeof(spt) == 8);
+    if (kvm_copy_from_gva(cs, arg, &spt, sizeof(spt))) {
+        return -EFAULT;
+    }
+
+    if (spt.period_ns < MILLISECS(1) || spt.period_ns > STIME_DELTA_MAX) {
+        return -EINVAL;
+    }
+
+    return do_set_periodic_timer(target, spt.period_ns);
+}
+
+static int vcpuop_stop_periodic_timer(CPUState *target)
+{
+    CPUX86State *tenv = &X86_CPU(target)->env;
+
+    qemu_mutex_lock(&tenv->xen_timers_lock);
+
+    timer_del(tenv->xen_periodic_timer);
+    tenv->xen_periodic_timer_period = 0;
+
+    qemu_mutex_unlock(&tenv->xen_timers_lock);
+    return 0;
+}
+
+static int do_set_singleshot_timer(CPUState *cs, uint64_t timeout_abs,
+                                   bool future, bool linux_wa)
+{
+    CPUX86State *env = &X86_CPU(cs)->env;
+    int64_t now = kvm_get_current_ns();
+    int64_t qemu_now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int64_t delta = timeout_abs - now;
+
+    if (future && timeout_abs < now) {
+        return -ETIME;
+    }
+
+    if (linux_wa && unlikely((int64_t)timeout_abs < 0 ||
+                             (delta > 0 && (uint32_t)(delta >> 50) != 0))) {
+        /*
+         * Xen has a 'Linux workaround' in do_set_timer_op() which checks
+         * for negative absolute timeout values (caused by integer
+         * overflow), and for values about 13 days in the future (2^50ns)
+         * which would be caused by jiffies overflow. For those cases, it
+         * sets the timeout 100ms in the future (not *too* soon, since if
+         * a guest really did set a long timeout on purpose we don't want
+         * to keep churning CPU time by waking it up).
+         */
+        delta = (100 * SCALE_MS);
+        timeout_abs = now + delta;
+    }
+
+    qemu_mutex_lock(&env->xen_timers_lock);
+
+    timer_mod_ns(env->xen_singleshot_timer, qemu_now + delta);
+    env->xen_singleshot_timer_ns = now + delta;
+
+    qemu_mutex_unlock(&env->xen_timers_lock);
+    return 0;
+}
+
+static int vcpuop_set_singleshot_timer(CPUState *cs, uint64_t arg)
+{
+    struct vcpu_set_singleshot_timer sst;
+
+    qemu_build_assert(sizeof(sst) == 16);
+    if (kvm_copy_from_gva(cs, arg, &sst, sizeof(sst))) {
+        return -EFAULT;
+    }
+
+    return do_set_singleshot_timer(cs, sst.timeout_abs_ns,
+                                   !!(sst.flags & VCPU_SSHOTTMR_future),
+                                   false);
+}
+
+static int vcpuop_stop_singleshot_timer(CPUState *cs)
+{
+    CPUX86State *env = &X86_CPU(cs)->env;
+
+    qemu_mutex_lock(&env->xen_timers_lock);
+
+    timer_del(env->xen_singleshot_timer);
+    env->xen_singleshot_timer_ns = 0;
+
+    qemu_mutex_unlock(&env->xen_timers_lock);
+    return 0;
+}
+
+static int kvm_xen_hcall_set_timer_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                      uint64_t timeout)
+{
+    if (unlikely(timeout == 0)) {
+        return vcpuop_stop_singleshot_timer(CPU(cpu));
+    } else {
+        return do_set_singleshot_timer(CPU(cpu), timeout, false, true);
+    }
+}
+
 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                   int cmd, int vcpu_id, uint64_t arg)
 {
-    CPUState *dest = qemu_get_cpu(vcpu_id);
     CPUState *cs = CPU(cpu);
+    CPUState *dest = cs->cpu_index == vcpu_id ? cs : qemu_get_cpu(vcpu_id);
     int err;
 
+    if (!dest) {
+        return -ENOENT;
+    }
+
     switch (cmd) {
     case VCPUOP_register_runstate_memory_area:
         err = vcpuop_register_runstate_info(cs, dest, arg);
@@ -832,6 +1032,26 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     case VCPUOP_register_vcpu_info:
         err = vcpuop_register_vcpu_info(cs, dest, arg);
         break;
+    case VCPUOP_set_singleshot_timer: {
+        if (cs->cpu_index != vcpu_id) {
+            return -EINVAL;
+        }
+        err = vcpuop_set_singleshot_timer(dest, arg);
+        break;
+    }
+    case VCPUOP_stop_singleshot_timer:
+        if (cs->cpu_index != vcpu_id) {
+            return -EINVAL;
+        }
+        err = vcpuop_stop_singleshot_timer(dest);
+        break;
+    case VCPUOP_set_periodic_timer: {
+        err = vcpuop_set_periodic_timer(cs, dest, arg);
+        break;
+    }
+    case VCPUOP_stop_periodic_timer:
+        err = vcpuop_stop_periodic_timer(dest);
+        break;
 
     default:
         return false;
@@ -1171,6 +1391,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_set_timer_op:
+        return kvm_xen_hcall_set_timer_op(exit, cpu,
+                                          exit->u.hcall.params[0]);
     case __HYPERVISOR_grant_table_op:
         return kvm_xen_hcall_gnttab_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1],
@@ -1280,7 +1503,25 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    if (env->xen_periodic_timer_period) {
+        ret = do_set_periodic_timer(cs, env->xen_periodic_timer_period);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     if (!kvm_xen_has_cap(EVTCHN_SEND)) {
+        /*
+         * If the kernel has EVTCHN_SEND support then it handles timers too,
+         * so the timer will be restored by kvm_xen_set_vcpu_timer() below.
+         */
+        if (env->xen_singleshot_timer_ns) {
+            ret = do_set_singleshot_timer(cs, env->xen_singleshot_timer_ns,
+                                    false, false);
+            if (ret < 0) {
+                return ret;
+            }
+        }
         return 0;
     }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 603a1077e3..c7ac8084b2 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1277,6 +1277,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT8(env.xen_vcpu_callback_vector, X86CPU),
         VMSTATE_UINT16_ARRAY(env.xen_virq, X86CPU, XEN_NR_VIRQS),
         VMSTATE_UINT64(env.xen_singleshot_timer_ns, X86CPU),
+        VMSTATE_UINT64(env.xen_periodic_timer_period, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.35.3


