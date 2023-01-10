Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC11C664056
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 13:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDe9-0008Kt-9R; Tue, 10 Jan 2023 07:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDcy-0007DI-Cf
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:16 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDcs-0000UV-B9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2RqdxBM1XI4h+adrMEE1aQ0vw0myl+VNgyz/3prp+fk=; b=hw3St0Ln5gCrub2VsR1VmrP7Rb
 VkUIc5P4jE9lhY3F8KafRZgVeWFWzRn+4M1kalXmHLD4vxPkL52hlYBfid07/bGqiZhB5unYz8hZC
 5hR9qNVF+eFFwvVUl9d0cj9DiCh9XJN/tdeOav1abkRD7iKwKegaGmFFkB++KevlilRpT0jHV9gUG
 IsdlQNeuC1PsmylE4RcVq4qZOLcfRurRef+G3rjAJHyo/FD5fvOnjTHgB44iN90sreSS+538pSrmp
 4LByaW3kcz0smkDPOtl2yN6V9OCUjEhMKy1Y8tUn8Bm8WO8kamsfy/bU+VJKkckZdWfgwierxd8/b
 BjMNkkow==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFDcM-0037tX-2N; Tue, 10 Jan 2023 12:20:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDcS-006Yea-Sk; Tue, 10 Jan 2023 12:20:44 +0000
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
Subject: [PATCH v6 22/51] i386/xen: handle VCPUOP_register_runstate_memory_area
Date: Tue, 10 Jan 2023 12:20:13 +0000
Message-Id: <20230110122042.1562155-23-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110122042.1562155-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Allow guest to setup the vcpu runstates which is used as
steal clock.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/cpu.h         |  1 +
 target/i386/kvm/xen-emu.c | 57 +++++++++++++++++++++++++++++++++++++++
 target/i386/machine.c     |  1 +
 3 files changed, 59 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 96c2d0d5cb..bf44a87ddb 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1791,6 +1791,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_info_gpa;
     uint64_t xen_vcpu_info_default_gpa;
     uint64_t xen_vcpu_time_info_gpa;
+    uint64_t xen_vcpu_runstate_gpa;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index e47eb03cc8..7803e4a7a7 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -159,6 +159,7 @@ int kvm_xen_init_vcpu(CPUState *cs)
     env->xen_vcpu_info_gpa = INVALID_GPA;
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
+    env->xen_vcpu_runstate_gpa = INVALID_GPA;
 
     return 0;
 }
@@ -253,6 +254,17 @@ static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
                           env->xen_vcpu_time_info_gpa);
 }
 
+static void do_set_vcpu_runstate_gpa(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_runstate_gpa = data.host_ulong;
+
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
+                          env->xen_vcpu_runstate_gpa);
+}
+
 static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -261,10 +273,14 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
     env->xen_vcpu_info_gpa = INVALID_GPA;
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
+    env->xen_vcpu_runstate_gpa = INVALID_GPA;
 
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
                           INVALID_GPA);
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
+                          INVALID_GPA);
+
 }
 
 static int xen_set_shared_info(uint64_t gfn)
@@ -514,6 +530,35 @@ static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
     return 0;
 }
 
+static int vcpuop_register_runstate_info(CPUState *cs, CPUState *target,
+                                         uint64_t arg)
+{
+    struct vcpu_register_runstate_memory_area rma;
+    uint64_t gpa;
+    size_t len;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(rma) == 8);
+    /* The runstate area actually does change size, but Linux copes. */
+
+    if (!target) {
+        return -ENOENT;
+    }
+
+    if (kvm_copy_from_gva(cs, arg, &rma, sizeof(rma))) {
+        return -EFAULT;
+    }
+
+    /* As with vcpu_time_info, Xen actually uses the GVA but KVM doesn't. */
+    if (!kvm_gva_to_gpa(cs, rma.addr.p, &gpa, &len, false)) {
+        return -EFAULT;
+    }
+
+    async_run_on_cpu(target, do_set_vcpu_runstate_gpa,
+                     RUN_ON_CPU_HOST_ULONG(gpa));
+    return 0;
+}
+
 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                   int cmd, int vcpu_id, uint64_t arg)
 {
@@ -522,6 +567,9 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int err;
 
     switch (cmd) {
+    case VCPUOP_register_runstate_memory_area:
+        err = vcpuop_register_runstate_info(cs, dest, arg);
+        break;
     case VCPUOP_register_vcpu_time_memory_area:
         err = vcpuop_register_vcpu_time_info(cs, dest, arg);
         break;
@@ -720,6 +768,15 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    gpa = env->xen_vcpu_runstate_gpa;
+    if (gpa != INVALID_GPA) {
+        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
+                                    gpa);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     return 0;
 }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index eb657907ca..3f3d436aaa 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1273,6 +1273,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
+        VMSTATE_UINT64(env.xen_vcpu_runstate_gpa, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.35.3


