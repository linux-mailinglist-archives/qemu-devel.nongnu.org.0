Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6282B3BF371
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:18:51 +0200 (CEST)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Igk-0000xz-Ek
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKr-0002AS-Sg
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:17 -0400
Received: from mga06.intel.com ([134.134.136.31]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKp-0007Kq-MU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534897"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534897"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770034"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 14/44] i386/tdx: Frame in the call for KVM_TDX_INIT_VCPU
Date: Wed,  7 Jul 2021 17:54:44 -0700
Message-Id: <b91795422d48efad960d086cfc723b69a6458e7c.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
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
index 25dcecd60c..af6b5f350e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4122,6 +4122,14 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
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
index b1e4f27c9a..67fb03b4b5 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -38,7 +38,7 @@ bool kvm_has_tdx(KVMState *s)
     return !!(kvm_check_extension(s, KVM_CAP_VM_TYPES) & BIT(KVM_X86_TDX_VM));
 }
 
-static void __tdx_ioctl(int ioctl_no, const char *ioctl_name,
+static void __tdx_ioctl(void *state, int ioctl_no, const char *ioctl_name,
                         __u32 metadata, void *data)
 {
     struct kvm_tdx_cmd tdx_cmd;
@@ -51,17 +51,21 @@ static void __tdx_ioctl(int ioctl_no, const char *ioctl_name,
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
@@ -219,6 +223,14 @@ out:
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
2.25.1


