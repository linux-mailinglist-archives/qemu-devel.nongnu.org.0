Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B867F5EE
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 09:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLgJb-0005tb-PJ; Sat, 28 Jan 2023 03:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJN-0005sV-Qj
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:45 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJK-0007pD-3Y
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=IANzV6UpBmIlexlsXHbP8iyC/6CwuDNuqrIMqsSOEW8=; b=ARkVQRXZPhsQF5e5zUz/dx0lwm
 0CuxHdk+lw19LKOkEnDWVnkr5LImKvnO/8q2crZWHYPKdrH86xu0xm4EI7To0qJP+1RKo9l2/J1Lf
 cb6phKPLZc95uAGpGU/iego3EmetYFsp7wu1IF7MwuLxdqAp/8+5QRBOyf8qS+GZeWopQRXf8aSj1
 4lTCJ+YfderVXg8ev9pF8LXPG67SPnd47cqQc1w0RXGl3YCW2wuuPo7otdzalROYcOAaDL7tPF9Oa
 216bpHIzTDa5+p+g8uQve3STyE04YnYlUXy0eqp1BN6QlluLuiKZwuukwkd6LPdnbiKF7mJituIy9
 byLicGgg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pLgIR-0039wK-1R; Sat, 28 Jan 2023 08:10:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pLgIx-006mJ3-03; Sat, 28 Jan 2023 08:11:19 +0000
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
Subject: [PATCH v9 21/58] i386/xen: handle VCPUOP_register_vcpu_time_info
Date: Sat, 28 Jan 2023 08:10:36 +0000
Message-Id: <20230128081113.1615111-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128081113.1615111-1-dwmw2@infradead.org>
References: <20230128081113.1615111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org;
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/cpu.h         |   1 +
 target/i386/kvm/xen-emu.c | 100 +++++++++++++++++++++++++++++++++-----
 target/i386/machine.c     |   1 +
 3 files changed, 90 insertions(+), 12 deletions(-)

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
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index cdb2166a67..735ccc3869 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -37,28 +37,41 @@
 #define hypercall_compat32(longmode) (false)
 #endif
 
-static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
-                      bool is_write)
+static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
+                           size_t *len, bool is_write)
 {
-    uint8_t *buf = (uint8_t *)_buf;
-    int ret;
-
-    while (sz) {
         struct kvm_translation tr = {
             .linear_address = gva,
         };
 
-        size_t len = TARGET_PAGE_SIZE - (tr.linear_address & ~TARGET_PAGE_MASK);
-        if (len > sz) {
-            len = sz;
+        if (len) {
+            *len = TARGET_PAGE_SIZE - (gva & ~TARGET_PAGE_MASK);
+        }
+
+        if (kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr) || !tr.valid ||
+            (is_write && !tr.writeable)) {
+            return false;
         }
+        *gpa = tr.physical_address;
+        return true;
+}
+
+static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
+                      bool is_write)
+{
+    uint8_t *buf = (uint8_t *)_buf;
+    uint64_t gpa;
+    size_t len;
 
-        ret = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr);
-        if (ret || !tr.valid || (is_write && !tr.writeable)) {
+    while (sz) {
+        if (!kvm_gva_to_gpa(cs, gva, &gpa, &len, is_write)) {
             return -EFAULT;
         }
+        if (len > sz) {
+            len = sz;
+        }
 
-        cpu_physical_memory_rw(tr.physical_address, buf, len, is_write);
+        cpu_physical_memory_rw(gpa, buf, len, is_write);
 
         buf += len;
         sz -= len;
@@ -146,6 +159,7 @@ int kvm_xen_init_vcpu(CPUState *cs)
 
     env->xen_vcpu_info_gpa = INVALID_GPA;
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
+    env->xen_vcpu_time_info_gpa = INVALID_GPA;
 
     return 0;
 }
@@ -229,6 +243,17 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
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
 static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -236,8 +261,11 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
 
     env->xen_vcpu_info_gpa = INVALID_GPA;
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
+    env->xen_vcpu_time_info_gpa = INVALID_GPA;
 
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
+                          INVALID_GPA);
 }
 
 static int xen_set_shared_info(uint64_t gfn)
@@ -453,6 +481,42 @@ static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
     return 0;
 }
 
+static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
+                                          uint64_t arg)
+{
+    struct vcpu_register_time_memory_area tma;
+    uint64_t gpa;
+    size_t len;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(tma) == 8);
+    qemu_build_assert(sizeof(struct vcpu_time_info) == 32);
+
+    if (!target) {
+        return -ENOENT;
+    }
+
+    if (kvm_copy_from_gva(cs, arg, &tma, sizeof(tma))) {
+        return -EFAULT;
+    }
+
+    /*
+     * Xen actually uses the GVA and does the translation through the guest
+     * page tables each time. But Linux/KVM uses the GPA, on the assumption
+     * that guests only ever use *global* addresses (kernel virtual addresses)
+     * for it. If Linux is changed to redo the GVA→GPA translation each time,
+     * it will offer a new vCPU attribute for that, and we'll use it instead.
+     */
+    if (!kvm_gva_to_gpa(cs, tma.addr.p, &gpa, &len, false) ||
+        len < sizeof(struct vcpu_time_info)) {
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
@@ -461,6 +525,9 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int err;
 
     switch (cmd) {
+    case VCPUOP_register_vcpu_time_memory_area:
+        err = vcpuop_register_vcpu_time_info(cs, dest, arg);
+        break;
     case VCPUOP_register_vcpu_info:
         err = vcpuop_register_vcpu_info(cs, dest, arg);
         break;
@@ -654,6 +721,15 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    gpa = env->xen_vcpu_time_info_gpa;
+    if (gpa != INVALID_GPA) {
+        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
+                                    gpa);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     return 0;
 }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 1215e616c8..eb657907ca 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1272,6 +1272,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
+        VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.39.0


