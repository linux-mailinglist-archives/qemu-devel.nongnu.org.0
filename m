Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4A31C57F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:25:44 +0100 (CET)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq3b-0001f8-U6
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpte-0006RB-S5
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:27 -0500
Received: from mga17.intel.com ([192.55.52.151]:25646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptS-0001e2-Tb
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:26 -0500
IronPort-SDR: 5tfXCO3XpCz1YMvYgVKUjC2mopMNqTGH0SbCZX1oMiOHwuA7TECX8niJlXcY2BhD13XqTbb2B+
 g7eQQhGLkaNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558766"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558766"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:52 -0800
IronPort-SDR: Y6imeHbdVjt4iWTEtlhYSAY/R8lUn0PatpDmvm2NovtK0pGt/ubFeuhTG21WBjzITGlRdpAbt3
 IhudWp4Evskw==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705426"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:52 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 14/23] i386/tdx: Frame in the call for KVM_TDX_INIT_VCPU
Date: Mon, 15 Feb 2021 18:13:10 -0800
Message-Id: <623e79930a5a49734676f9aeb17e32aa737e7fbd.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 include/sysemu/tdx.h       |  1 +
 target/i386/kvm/kvm.c      |  8 ++++++++
 target/i386/kvm/tdx-stub.c |  4 ++++
 target/i386/kvm/tdx.c      | 20 ++++++++++++++++----
 4 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/tdx.h b/include/sysemu/tdx.h
index 36a901e723..03461b6ae8 100644
--- a/include/sysemu/tdx.h
+++ b/include/sysemu/tdx.h
@@ -8,5 +8,6 @@ bool kvm_has_tdx(KVMState *s);
 #endif
 
 void tdx_pre_create_vcpu(CPUState *cpu);
+void tdx_post_init_vcpu(CPUState *cpu);
 
 #endif
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e6f7015be8..52dbccedb5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4034,6 +4034,14 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
+    /*
+     * level == KVM_PUT_FULL_STATE is only set by
+     * kvm_cpu_synchronize_post_init() after initialization
+     */
+    if (vm_type == KVM_X86_TDX_VM && level == KVM_PUT_FULL_STATE) {
+        tdx_post_init_vcpu(cpu);
+    }
+
     /* TODO: Allow accessing guest state for debug TDs. */
     if (vm_type == KVM_X86_TDX_VM) {
         return 0;
diff --git a/target/i386/kvm/tdx-stub.c b/target/i386/kvm/tdx-stub.c
index 93d5913c89..93afe07ddb 100644
--- a/target/i386/kvm/tdx-stub.c
+++ b/target/i386/kvm/tdx-stub.c
@@ -12,3 +12,7 @@ bool kvm_has_tdx(KVMState *s)
 void tdx_pre_create_vcpu(CPUState *cpu)
 {
 }
+
+void tdx_post_init_vcpu(CPUState *cpu)
+{
+}
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 9d4195a705..d095dab662 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -36,7 +36,7 @@ bool kvm_has_tdx(KVMState *s)
     return !!(kvm_check_extension(s, KVM_CAP_VM_TYPES) & BIT(KVM_X86_TDX_VM));
 }
 
-static void __tdx_ioctl(int ioctl_no, const char *ioctl_name,
+static void __tdx_ioctl(void *state, int ioctl_no, const char *ioctl_name,
                         __u32 metadata, void *data)
 {
     struct kvm_tdx_cmd tdx_cmd;
@@ -49,17 +49,21 @@ static void __tdx_ioctl(int ioctl_no, const char *ioctl_name,
     tdx_cmd.data = (__u64)(unsigned long)data;
 
     if (ioctl_no == KVM_TDX_CAPABILITIES) {
-        r = kvm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+        r = kvm_ioctl(state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+    } else if (ioctl_no == KVM_TDX_INIT_VCPU) {
+        r = kvm_vcpu_ioctl(state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
     } else {
-        r = kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+        r = kvm_vm_ioctl(state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
     }
     if (r) {
         error_report("%s failed: %s", ioctl_name, strerror(-r));
         exit(1);
     }
 }
+#define _tdx_ioctl(cpu, ioctl_no, metadata, data) \
+        __tdx_ioctl(cpu, ioctl_no, stringify(ioctl_no), metadata, data)
 #define tdx_ioctl(ioctl_no, metadata, data) \
-        __tdx_ioctl(ioctl_no, stringify(ioctl_no), metadata, data)
+        _tdx_ioctl(kvm_state, ioctl_no, metadata, data)
 
 static void tdx_finalize_vm(Notifier *notifier, void *unused)
 {
@@ -202,6 +206,14 @@ out:
     qemu_mutex_unlock(&tdx->lock);
 }
 
+void tdx_post_init_vcpu(CPUState *cpu)
+{
+    CPUX86State *env = &X86_CPU(cpu)->env;
+
+    _tdx_ioctl(cpu, KVM_TDX_INIT_VCPU, 0,
+               (void *)(unsigned long)env->regs[R_ECX]);
+}
+
 static bool tdx_guest_get_debug(Object *obj, Error **errp)
 {
     TdxGuest *tdx = TDX_GUEST(obj);
-- 
2.17.1


