Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBB764E55D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:47:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ypJ-0007Un-Lw; Thu, 15 Dec 2022 19:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5yny-0005a8-Qj
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:42:26 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynw-0006pJ-MD
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xNDBz0dz9aaRz4gtLDKk7jjwVAWCuOnXemhrtJukk0w=; b=n/cQvUIzRxWnWtxbvJPxrj7ffR
 T7+8qWAWJf5+58R2kqL6fEqIG2wiOOqfscijb8AwDlVLZSC2OwoTqdK8h/1RyO0D2nkB9ux/4fgic
 QYz7RS4GoMENNIIlQShXZljbzwYzML7MhQqzN7XtAunGGjJco2Bq9Yk6Hz9unBkNQ7qy6gEaNZYeZ
 PDM4XFsPOFXWftKHVSQSFNRMnA+VvZsVsubfTlxFLZVLorOJfayQb5XcAF+UdCkcdPPTRs7XHwdHn
 MkLgUeHrF3/qmfWJecx5f5J4pcV6+dZXl1MZpi4wlRjm3hue+M44qAoZMYTg0VYTwRZgDJyjnHczn
 oK9tV5wA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymz-00Azyo-9M; Fri, 16 Dec 2022 00:42:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cOx-3Q; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 18/38] i386/xen: handle VCPUOP_register_vcpu_info
Date: Fri, 16 Dec 2022 00:40:57 +0000
Message-Id: <20221216004117.862106-19-dwmw2@infradead.org>
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

From: Joao Martins <joao.m.martins@oracle.com>

Handle the hypercall to set a per vcpu info, and also wire up the default
vcpu_info in the shared_info page for the first 32 vCPUs.

To avoid deadlock within KVM a vCPU thread must set its *own* vcpu_info
rather than it being set from the context in which the hypercall is
invoked.

Add the vcpu_info (and default) GPA to the vmstate_x86_cpu for migration,
and restore it in kvm_arch_put_registers() appropriately.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/cpu.h            |  2 +
 target/i386/kvm/kvm.c        | 19 +++++++++
 target/i386/kvm/trace-events |  1 +
 target/i386/kvm/xen-emu.c    | 78 ++++++++++++++++++++++++++++++++++--
 target/i386/kvm/xen-emu.h    |  1 +
 target/i386/machine.c        | 21 ++++++++++
 6 files changed, 119 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c6c57baed5..109b2e5669 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1788,6 +1788,8 @@ typedef struct CPUArchState {
 #endif
 #if defined(CONFIG_KVM)
     struct kvm_nested_state *nested_state;
+    uint64_t xen_vcpu_info_gpa;
+    uint64_t xen_vcpu_info_default_gpa;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index c37e44d88f..8affe1eeae 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1802,6 +1802,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
         has_msr_hv_hypercall = true;
     }
 
+    env->xen_vcpu_info_gpa = UINT64_MAX;
+    env->xen_vcpu_info_default_gpa = UINT64_MAX;
+
     if (cs->kvm_state->xen_version) {
 #ifdef CONFIG_XEN_EMU
         struct kvm_cpuid_entry2 *xen_max_leaf;
@@ -4723,6 +4726,22 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
         kvm_arch_set_tsc_khz(cpu);
     }
 
+#ifdef CONFIG_XEN_EMU
+    if (level == KVM_PUT_FULL_STATE) {
+        uint64_t gpa = x86_cpu->env.xen_vcpu_info_gpa;
+        if (gpa == UINT64_MAX) {
+            gpa = x86_cpu->env.xen_vcpu_info_default_gpa;
+        }
+
+        if (gpa != UINT64_MAX) {
+            ret = kvm_xen_set_vcpu_attr(cpu, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+            if (ret < 0) {
+                return ret;
+            }
+        }
+    }
+#endif
+
     ret = kvm_getput_regs(x86_cpu, 1);
     if (ret < 0) {
         return ret;
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index 0a47c26e80..14e54dfca5 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -9,3 +9,4 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
 # xen-emu.c
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
 kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
+kvm_xen_set_vcpu_attr(int cpu, int type, uint64_t gpa) "vcpu attr cpu %d type %d gpa 0x%" PRIx64
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 83d98cbfd9..25c48248ce 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -147,10 +147,47 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa)
+{
+    struct kvm_xen_vcpu_attr xhsi;
+
+    xhsi.type = type;
+    xhsi.u.gpa = gpa;
+
+    trace_kvm_xen_set_vcpu_attr(cs->cpu_index, type, gpa);
+
+    return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &xhsi);
+}
+
+static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_info_default_gpa = data.host_ulong;
+
+    /* Changing the default does nothing if a vcpu_info was explicitly set. */
+    if (env->xen_vcpu_info_gpa == UINT64_MAX) {
+        kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
+                              env->xen_vcpu_info_default_gpa);
+    }
+}
+
+static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_info_gpa = data.host_ulong;
+
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
+                          env->xen_vcpu_info_gpa);
+}
+
 static int xen_set_shared_info(uint64_t gfn)
 {
     uint64_t gpa = gfn << TARGET_PAGE_BITS;
-    int err;
+    int i, err;
 
     /* The xen_overlay device tells KVM about it too, since it had to
      * do that on migration load anyway (unless we're going to jump
@@ -162,6 +199,14 @@ static int xen_set_shared_info(uint64_t gfn)
 
     trace_kvm_xen_set_shared_info(gfn);
 
+    for (i = 0; i < XEN_LEGACY_MAX_VCPUS; i++) {
+        CPUState *cpu = qemu_get_cpu(i);
+        if (cpu) {
+            async_run_on_cpu(cpu, do_set_vcpu_info_default_gpa, RUN_ON_CPU_HOST_ULONG(gpa));
+        }
+        gpa += sizeof(vcpu_info_t);
+    }
+
     return err;
 }
 
@@ -318,15 +363,42 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     }
 }
 
+static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
+                                     uint64_t arg)
+{
+    struct vcpu_register_vcpu_info rvi;
+    uint64_t gpa;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(rvi) == 16);
+    qemu_build_assert(sizeof(struct vcpu_info) == 64);
+
+    if (!target)
+        return -ENOENT;
+
+    if (kvm_copy_from_gva(cs, arg, &rvi, sizeof(rvi))) {
+        return -EFAULT;
+    }
+
+    if (rvi.offset > TARGET_PAGE_SIZE - sizeof(struct vcpu_info)) {
+        return -EINVAL;
+    }
+
+    gpa = ((rvi.mfn << TARGET_PAGE_BITS) + rvi.offset);
+    async_run_on_cpu(target, do_set_vcpu_info_gpa, RUN_ON_CPU_HOST_ULONG(gpa));
+    return 0;
+}
+
 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                   int cmd, int vcpu_id, uint64_t arg)
 {
+    CPUState *dest = qemu_get_cpu(vcpu_id);
+    CPUState *cs = CPU(cpu);
     int err;
 
     switch (cmd) {
     case VCPUOP_register_vcpu_info:
-        /* no vcpu info placement for now */
-        err = -ENOSYS;
+        err = vcpuop_register_vcpu_info(cs, dest, arg);
         break;
 
     default:
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 76a3de6c4d..20da62d39f 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -25,5 +25,6 @@
 
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
 int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
+int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 310b125235..104cd6047c 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1257,6 +1257,26 @@ static const VMStateDescription vmstate_nested_state = {
     }
 };
 
+static bool xen_vcpu_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return (env->xen_vcpu_info_gpa != UINT64_MAX ||
+            env->xen_vcpu_info_default_gpa != UINT64_MAX);
+}
+
+static const VMStateDescription vmstate_xen_vcpu = {
+    .name = "cpu/xen_vcpu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_vcpu_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
+        VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
 #endif
 
 static bool mcg_ext_ctl_needed(void *opaque)
@@ -1716,6 +1736,7 @@ const VMStateDescription vmstate_x86_cpu = {
 #endif
 #ifdef CONFIG_KVM
         &vmstate_nested_state,
+        &vmstate_xen_vcpu,
 #endif
         &vmstate_msr_tsx_ctrl,
         &vmstate_msr_intel_sgx,
-- 
2.35.3


