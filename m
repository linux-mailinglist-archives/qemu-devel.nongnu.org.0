Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB68D648080
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a8E-0002eb-EI; Fri, 09 Dec 2022 04:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7M-0002SQ-3d
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:35 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7H-0006pO-P5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JGifFQIvGywZLE+kRPH7XvhHuMAWXv8etzr/e4Bx2eU=; b=qngYdmDaFAqPM6Hqc4rYccAFC2
 234r0dxg75a/Zn5LsrXro4Z/1paxwqFKQ430Mfsq1812DUOL3sR2gFwC8EylPuL97aUhmZgyQZU+3
 zwFjjANWD94eYM8cEvnm7z/GiwELXZyzI6EXqq+xbaBPxPoIKd+IR0VPBouHU5mxEroa65UrqKB+x
 8qvJe+7f/nO6S5iI8+l9NTnHq7xSrEeH+vgTXqPtbTo7B7gsgY+ETgy9RkSZpgamzTAi1qjdiT2ba
 fILpdw5VFdMgFrToDI7+mwvK5esLxWbxGeYRD2e2Hb4QXncR7Xf6BKDqBZG90ryPOnMjIvlvgfcXy
 FxxNVJ7Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a78-008l4O-Hz; Fri, 09 Dec 2022 09:56:20 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a78-002tZR-6J; Fri, 09 Dec 2022 09:56:18 +0000
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
Subject: [RFC PATCH v2 17/22] i386/xen: handle VCPUOP_register_vcpu_time_info
Date: Fri,  9 Dec 2022 09:56:07 +0000
Message-Id: <20221209095612.689243-18-dwmw2@infradead.org>
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

In order to support Linux vdso in Xen.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c |  9 ++++++
 target/i386/machine.c |  4 ++-
 target/i386/xen.c     | 70 ++++++++++++++++++++++++++++++++++++-------
 4 files changed, 72 insertions(+), 12 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 109b2e5669..96c2d0d5cb 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1790,6 +1790,7 @@ typedef struct CPUArchState {
     struct kvm_nested_state *nested_state;
     uint64_t xen_vcpu_info_gpa;
     uint64_t xen_vcpu_info_default_gpa;
+    uint64_t xen_vcpu_time_info_gpa;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index fa45e2f99a..3f19fff21f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1813,6 +1813,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     env->xen_vcpu_info_gpa = UINT64_MAX;
     env->xen_vcpu_info_default_gpa = UINT64_MAX;
+    env->xen_vcpu_time_info_gpa = UINT64_MAX;
 
     xen_version = kvm_arch_xen_version(MACHINE(qdev_get_machine()));
     if (xen_version) {
@@ -4744,6 +4745,14 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
                 return ret;
             }
         }
+
+        gpa = x86_cpu->env.xen_vcpu_time_info_gpa;
+        if (gpa != UINT64_MAX) {
+            ret = kvm_xen_set_vcpu_attr(cpu, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO, gpa);
+            if (ret < 0) {
+                return ret;
+            }
+        }
     }
 #endif
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 104cd6047c..9acef102a3 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1263,7 +1263,8 @@ static bool xen_vcpu_needed(void *opaque)
     CPUX86State *env = &cpu->env;
 
     return (env->xen_vcpu_info_gpa != UINT64_MAX ||
-            env->xen_vcpu_info_default_gpa != UINT64_MAX);
+            env->xen_vcpu_info_default_gpa != UINT64_MAX ||
+            env->xen_vcpu_time_info_gpa != UINT64_MAX);
 }
 
 static const VMStateDescription vmstate_xen_vcpu = {
@@ -1274,6 +1275,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
+        VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/target/i386/xen.c b/target/i386/xen.c
index cd816bb711..427729ab4d 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -21,28 +21,41 @@
 #include "standard-headers/xen/hvm/hvm_op.h"
 #include "standard-headers/xen/vcpu.h"
 
+static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
+                           size_t *len, bool is_write)
+{
+        struct kvm_translation tr = {
+            .linear_address = gva,
+        };
+
+        if (len) {
+                *len = TARGET_PAGE_SIZE - (gva & ~TARGET_PAGE_MASK);
+        }
+
+        if (kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr) || !tr.valid ||
+            (is_write && !tr.writeable)) {
+            return false;
+        }
+        *gpa = tr.physical_address;
+        return true;
+}
+
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
 {
     uint8_t *buf = (uint8_t *)_buf;
     size_t i = 0, len = 0;
-    int ret;
 
     for (i = 0; i < sz; i+= len) {
-        struct kvm_translation tr = {
-            .linear_address = gva + i,
-        };
+        uint64_t gpa;
 
-        len = TARGET_PAGE_SIZE - (tr.linear_address & ~TARGET_PAGE_MASK);
+        if (!kvm_gva_to_gpa(cs, gva + i, &gpa, &len, is_write)) {
+                return -EFAULT;
+        }
         if (len > sz)
             len = sz;
 
-        ret = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr);
-        if (ret || !tr.valid || (is_write && !tr.writeable)) {
-            return -EFAULT;
-        }
-
-        cpu_physical_memory_rw(tr.physical_address, buf + i, len, is_write);
+        cpu_physical_memory_rw(gpa, buf + i, len, is_write);
     }
 
     return 0;
@@ -166,6 +179,17 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
                           env->xen_vcpu_info_gpa);
 }
 
+static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_time_info_gpa = data.host_ulong;
+
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
+                          env->xen_vcpu_time_info_gpa);
+}
+
 static int xen_set_shared_info(CPUState *cs, uint64_t gfn)
 {
     uint64_t gpa = gfn << TARGET_PAGE_BITS;
@@ -258,6 +282,27 @@ static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
     return 0;
 }
 
+static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
+                                          uint64_t arg)
+{
+    struct vcpu_register_time_memory_area tma;
+    uint64_t gpa;
+    size_t len;
+
+    if (kvm_copy_from_gva(cs, arg, &tma, sizeof(*tma.addr.v))) {
+        return -EFAULT;
+    }
+
+    if (!kvm_gva_to_gpa(cs, tma.addr.p, &gpa, &len, false) ||
+        len < sizeof(tma)) {
+        return -EFAULT;
+    }
+
+    async_run_on_cpu(target, do_set_vcpu_time_info_gpa,
+                     RUN_ON_CPU_HOST_ULONG(gpa));
+    return 0;
+}
+
 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                   int cmd, int vcpu_id, uint64_t arg)
 {
@@ -266,6 +311,9 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int err;
 
     switch (cmd) {
+    case VCPUOP_register_vcpu_time_memory_area:
+            err = vcpuop_register_vcpu_time_info(cs, dest, arg);
+            break;
     case VCPUOP_register_vcpu_info:
             err = vcpuop_register_vcpu_info(cs, dest, arg);
             break;
-- 
2.35.3


