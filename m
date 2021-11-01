Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BB5441BB0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 14:27:01 +0100 (CET)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhXL2-0001tO-OF
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 09:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mhXI5-0005pG-TL
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 09:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mhXI0-0004yg-PS
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 09:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635773032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrDHr1GfYhqx6nbamyiITvnEWXK/taDrSkGlwrCriqY=;
 b=CImRpgfKsARC2OnXuCacf2TWRH2IhUFDZilMFgEtAJLSnatrSHjloQLCYgDs3Odza001z2
 +q6RN6rSEMQzuKvLU5m8zeOZlnnCXm07Kp5ai9fY3yPxgEwlAzFAOfMwjHKsjs/0ETpTJI
 g+eGHL6VEpGtILbojfQjrYN9ChD2epY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-vRCGCm8PMY2FQnZWD9XcJw-1; Mon, 01 Nov 2021 09:23:49 -0400
X-MC-Unique: vRCGCm8PMY2FQnZWD9XcJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 387B7100B3B6;
 Mon,  1 Nov 2021 13:23:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 190D360C0F;
 Mon,  1 Nov 2021 13:23:45 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] KVM: SVM: add migration support for nested TSC scaling
Date: Mon,  1 Nov 2021 15:23:00 +0200
Message-Id: <20211101132300.192584-4-mlevitsk@redhat.com>
In-Reply-To: <20211101132300.192584-1-mlevitsk@redhat.com>
References: <20211101132300.192584-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 598d451dcf..53a23ca006 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5928,6 +5928,11 @@ static void x86_cpu_reset(DeviceState *dev)
     }
 
     x86_cpu_set_sgxlepubkeyhash(env);
+
+    if (env->features[FEAT_SVM] & CPUID_SVM_TSCSCALE) {
+        env->amd_tsc_scale_msr =  MSR_AMD64_TSC_RATIO_DEFAULT;
+    }
+
 #endif
 }
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8c39e787f9..9911d7c871 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -499,6 +499,9 @@ typedef enum X86Seg {
 #define MSR_GSBASE                      0xc0000101
 #define MSR_KERNELGSBASE                0xc0000102
 #define MSR_TSC_AUX                     0xc0000103
+#define MSR_AMD64_TSC_RATIO             0xc0000104
+
+#define MSR_AMD64_TSC_RATIO_DEFAULT     0x100000000ULL
 
 #define MSR_VM_HSAVE_PA                 0xc0010117
 
@@ -1539,6 +1542,7 @@ typedef struct CPUX86State {
     uint32_t tsx_ctrl;
 
     uint64_t spec_ctrl;
+    uint64_t amd_tsc_scale_msr;
     uint64_t virt_ssbd;
 
     /* End of state preserved by INIT (dummy marker).  */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 13be6995a8..e2dad8e168 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -105,6 +105,7 @@ static bool has_msr_hv_reenlightenment;
 static bool has_msr_xss;
 static bool has_msr_umwait;
 static bool has_msr_spec_ctrl;
+static bool has_tsc_scale_msr;
 static bool has_msr_tsx_ctrl;
 static bool has_msr_virt_ssbd;
 static bool has_msr_smi_count;
@@ -2216,6 +2217,9 @@ static int kvm_get_supported_msrs(KVMState *s)
             case MSR_IA32_SPEC_CTRL:
                 has_msr_spec_ctrl = true;
                 break;
+            case MSR_AMD64_TSC_RATIO:
+                has_tsc_scale_msr = true;
+                break;
             case MSR_IA32_TSX_CTRL:
                 has_msr_tsx_ctrl = true;
                 break;
@@ -3027,6 +3031,10 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
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
@@ -3479,6 +3487,10 @@ static int kvm_get_msrs(X86CPU *cpu)
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
@@ -3890,6 +3902,9 @@ static int kvm_get_msrs(X86CPU *cpu)
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
index 14dd5ed79c..5dea1ef30d 100644
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
@@ -1586,6 +1608,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_pkru,
         &vmstate_pkrs,
         &vmstate_spec_ctrl,
+        &amd_tsc_scale_msr_ctrl,
         &vmstate_mcg_ext_ctl,
         &vmstate_msr_intel_pt,
         &vmstate_msr_virt_ssbd,
-- 
2.26.3


