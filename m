Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C46480AB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:12:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a81-0002cH-CE; Fri, 09 Dec 2022 04:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7M-0002SP-3N
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:35 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7H-0006pS-P5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MF4497m/tYuzIfSVVLhuBnjvA3EVbpWnpCviyRALjbM=; b=SY3OTWNkvuqgF84PgNR81XosUC
 HS6Ub5Gj89DeSMkdgIcmhMWCASMJEA06IJm/mpQY9NHxTVgJeddMDqVbmlT+jOhcS946hga3GmKpn
 Mm+UXr+O48tX+kW5GYF4CdlZuG5pA8ZBF3ZLGKPvCDWbulEjdoRINc3F7BEwiQ1NfHi5IKYTiQNvI
 O08YPA+zpONkYoMwe8OoWIh5LjTt7IXen5IgYEQz/hFZwyYZ8h+Ypdj5C9K6XpTBvFqoQEyd8uuiT
 7CqwuEOcvSvq2rv+QpbnGlgpJiHNk/g56wihnhzK40u9QXL7kgxQ73PDa8suOomf+H3fjloGwUxSS
 /kHHWvuw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a78-008l4P-Hx; Fri, 09 Dec 2022 09:56:20 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a78-002tZV-7B; Fri, 09 Dec 2022 09:56:18 +0000
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
Subject: [RFC PATCH v2 18/22] i386/xen: handle
 VCPUOP_register_runstate_memory_area
Date: Fri,  9 Dec 2022 09:56:08 +0000
Message-Id: <20221209095612.689243-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org;
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
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c |  9 +++++++++
 target/i386/machine.c |  4 +++-
 target/i386/xen.c     | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)

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
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 3f19fff21f..a5e67a3119 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1814,6 +1814,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     env->xen_vcpu_info_gpa = UINT64_MAX;
     env->xen_vcpu_info_default_gpa = UINT64_MAX;
     env->xen_vcpu_time_info_gpa = UINT64_MAX;
+    env->xen_vcpu_runstate_gpa = UINT64_MAX;
 
     xen_version = kvm_arch_xen_version(MACHINE(qdev_get_machine()));
     if (xen_version) {
@@ -4753,6 +4754,14 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
                 return ret;
             }
         }
+
+        gpa = x86_cpu->env.xen_vcpu_runstate_gpa;
+        if (gpa != UINT64_MAX) {
+            ret = kvm_xen_set_vcpu_attr(cpu, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR, gpa);
+            if (ret < 0) {
+                return ret;
+            }
+        }
     }
 #endif
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 9acef102a3..6a510e5cbd 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1264,7 +1264,8 @@ static bool xen_vcpu_needed(void *opaque)
 
     return (env->xen_vcpu_info_gpa != UINT64_MAX ||
             env->xen_vcpu_info_default_gpa != UINT64_MAX ||
-            env->xen_vcpu_time_info_gpa != UINT64_MAX);
+            env->xen_vcpu_time_info_gpa != UINT64_MAX ||
+            env->xen_vcpu_runstate_gpa != UINT64_MAX);
 }
 
 static const VMStateDescription vmstate_xen_vcpu = {
@@ -1276,6 +1277,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
+        VMSTATE_UINT64(env.xen_vcpu_runstate_gpa, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/target/i386/xen.c b/target/i386/xen.c
index 427729ab4d..97032049e6 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -190,6 +190,17 @@ static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
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
 static int xen_set_shared_info(CPUState *cs, uint64_t gfn)
 {
     uint64_t gpa = gfn << TARGET_PAGE_BITS;
@@ -303,6 +314,27 @@ static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
     return 0;
 }
 
+static int vcpuop_register_runstate_info(CPUState *cs, CPUState *target,
+                                         uint64_t arg)
+{
+    struct vcpu_register_runstate_memory_area rma;
+    uint64_t gpa;
+    size_t len;
+
+    if (kvm_copy_from_gva(cs, arg, &rma, sizeof(*rma.addr.v))) {
+        return -EFAULT;
+    }
+
+    if (!kvm_gva_to_gpa(cs, rma.addr.p, &gpa, &len, false) ||
+        len < sizeof(struct vcpu_time_info)) {
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
@@ -311,6 +343,9 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int err;
 
     switch (cmd) {
+    case VCPUOP_register_runstate_memory_area:
+            err = vcpuop_register_runstate_info(cs, dest, arg);
+            break;
     case VCPUOP_register_vcpu_time_memory_area:
             err = vcpuop_register_vcpu_time_info(cs, dest, arg);
             break;
-- 
2.35.3


