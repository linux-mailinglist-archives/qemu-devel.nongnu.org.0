Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2240B418
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:04:16 +0200 (CEST)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAut-0008Gs-FX
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mQAkf-0002RO-Km
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:53:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mQAka-0003iQ-Pk
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631634811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y17xwD7gh8Gphu0rWKx/gyFu05AIn99CsfbWQxLhpNI=;
 b=T4k1PjvESllxsQ4ezICllqp46KXMtV5zFnBY4oqVKsByQRZT33GOkdZ9Wydh8e3HT69VTH
 c+w226oX7EiRGe20V+rVsSpgjrj5zT4boYWW2dV+hq8Mz32Cjpwda/xeTVwWYcL7gCU8qH
 gm50LPcXcDR5WG/gQxJs178OZHtYKRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-X96rCYLYPiylqr_pjJBQWQ-1; Tue, 14 Sep 2021 11:52:26 -0400
X-MC-Unique: X96rCYLYPiylqr_pjJBQWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D7BD835DE3;
 Tue, 14 Sep 2021 15:52:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AFF95D9D3;
 Tue, 14 Sep 2021 15:52:22 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] KVM: SVM: add migration support for nested TSC scaling
Date: Tue, 14 Sep 2021 18:52:14 +0300
Message-Id: <20210914155214.105415-4-mlevitsk@redhat.com>
In-Reply-To: <20210914155214.105415-1-mlevitsk@redhat.com>
References: <20210914155214.105415-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 target/i386/cpu.c     |  5 +++++
 target/i386/cpu.h     |  4 ++++
 target/i386/kvm/kvm.c | 15 +++++++++++++++
 target/i386/machine.c | 23 +++++++++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b029f1bdf..0870b53509 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5770,6 +5770,11 @@ static void x86_cpu_reset(DeviceState *dev)
     if (kvm_enabled()) {
         kvm_arch_reset_vcpu(cpu);
     }
+
+    if (env->features[FEAT_SVM] & CPUID_SVM_TSCSCALE) {
+        env->amd_tsc_scale_msr =  MSR_AMD64_TSC_RATIO_DEFAULT;
+    }
+
 #endif
 }
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9adae12426..b9e1a3b7db 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -491,6 +491,9 @@ typedef enum X86Seg {
 #define MSR_GSBASE                      0xc0000101
 #define MSR_KERNELGSBASE                0xc0000102
 #define MSR_TSC_AUX                     0xc0000103
+#define MSR_AMD64_TSC_RATIO             0xc0000104
+
+#define MSR_AMD64_TSC_RATIO_DEFAULT     0x100000000ULL
 
 #define MSR_VM_HSAVE_PA                 0xc0010117
 
@@ -1522,6 +1525,7 @@ typedef struct CPUX86State {
     uint32_t tsx_ctrl;
 
     uint64_t spec_ctrl;
+    uint64_t amd_tsc_scale_msr;
     uint64_t virt_ssbd;
 
     /* End of state preserved by INIT (dummy marker).  */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 841b3b98f7..bd53a55148 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -106,6 +106,7 @@ static bool has_msr_hv_reenlightenment;
 static bool has_msr_xss;
 static bool has_msr_umwait;
 static bool has_msr_spec_ctrl;
+static bool has_tsc_scale_msr;
 static bool has_msr_tsx_ctrl;
 static bool has_msr_virt_ssbd;
 static bool has_msr_smi_count;
@@ -2157,6 +2158,9 @@ static int kvm_get_supported_msrs(KVMState *s)
             case MSR_IA32_SPEC_CTRL:
                 has_msr_spec_ctrl = true;
                 break;
+            case MSR_AMD64_TSC_RATIO:
+                has_tsc_scale_msr = true;
+                break;
             case MSR_IA32_TSX_CTRL:
                 has_msr_tsx_ctrl = true;
                 break;
@@ -2968,6 +2972,10 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
     if (has_msr_spec_ctrl) {
         kvm_msr_entry_add(cpu, MSR_IA32_SPEC_CTRL, env->spec_ctrl);
     }
+    if (has_tsc_scale_msr) {
+        kvm_msr_entry_add(cpu, MSR_AMD64_TSC_RATIO, env->amd_tsc_scale_msr);
+    }
+
     if (has_msr_tsx_ctrl) {
         kvm_msr_entry_add(cpu, MSR_IA32_TSX_CTRL, env->tsx_ctrl);
     }
@@ -3409,6 +3417,10 @@ static int kvm_get_msrs(X86CPU *cpu)
     if (has_msr_spec_ctrl) {
         kvm_msr_entry_add(cpu, MSR_IA32_SPEC_CTRL, 0);
     }
+    if (has_tsc_scale_msr) {
+        kvm_msr_entry_add(cpu, MSR_AMD64_TSC_RATIO, 0);
+    }
+
     if (has_msr_tsx_ctrl) {
         kvm_msr_entry_add(cpu, MSR_IA32_TSX_CTRL, 0);
     }
@@ -3813,6 +3825,9 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_IA32_SPEC_CTRL:
             env->spec_ctrl = msrs[i].data;
             break;
+        case MSR_AMD64_TSC_RATIO:
+            env->amd_tsc_scale_msr = msrs[i].data;
+            break;
         case MSR_IA32_TSX_CTRL:
             env->tsx_ctrl = msrs[i].data;
             break;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 154666e7c0..39c8faf0ce 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1280,6 +1280,28 @@ static const VMStateDescription vmstate_spec_ctrl = {
     }
 };
 
+
+static bool amd_tsc_scale_msr_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->amd_tsc_scale_msr &&
+           env->amd_tsc_scale_msr != MSR_AMD64_TSC_RATIO_DEFAULT;
+}
+
+static const VMStateDescription amd_tsc_scale_msr_ctrl = {
+    .name = "cpu/amd_tsc_scale_msr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = amd_tsc_scale_msr_needed,
+    .fields = (VMStateField[]){
+        VMSTATE_UINT64(env.amd_tsc_scale_msr, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+
 static bool intel_pt_enable_needed(void *opaque)
 {
     X86CPU *cpu = opaque;
@@ -1568,6 +1590,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_pkru,
         &vmstate_pkrs,
         &vmstate_spec_ctrl,
+        &amd_tsc_scale_msr_ctrl,
         &vmstate_mcg_ext_ctl,
         &vmstate_msr_intel_pt,
         &vmstate_msr_virt_ssbd,
-- 
2.26.3


