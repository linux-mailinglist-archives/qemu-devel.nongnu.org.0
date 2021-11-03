Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EC44447D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:16:56 +0100 (CET)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI0V-0008HT-N9
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpA-0003Ue-Iq
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp4-0000jv-75
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso2116314wmf.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0tfk0gJAuF3KXIQCo2baIJgYDepCtxvL/ieGv9NV1vg=;
 b=f3uNZkk128APUYbeDJYR8Jw85YBkGaNxlUlaQD2UAKF9z1RQzKbBeHIktbThoJDBss
 DCjWmuHsQlbsU+kduSnVGuZOzwYoe8mi5ggdLZmqy+oFQCxyIa2dxdhD2gZ5VaD07FF3
 JvFqvK7tBTyfuuqCGFwUkkUzN2yWiSRHqRbh+Y0dBn916sxJ4HkXN8LQvdX8vUVbmB5e
 1jgfa/YGnkXEerk0nqTaQCDjWSjNEpNvzSE0BVjHKK5h0H0OEjB0n13R8Fy50BHGZt3F
 26sDhuomDBM8hv/jdLdSIQlWZBrTioRB1Sq6UPrZLt4sV7bLPxXMLrAAaKYB8UZw8GQH
 3b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0tfk0gJAuF3KXIQCo2baIJgYDepCtxvL/ieGv9NV1vg=;
 b=GkGLv7apsLuTTbdzcXMJanzbbl2G9OU3zq5xNTwyGLEO3abrQxBKE4P4N1zruVvCQj
 zbZ3WFlYCVZO6uUIBsQHO4Ahm9W/StFCohD1v5dbSVXW7DdVbxgNekh7BGzQpU4Kg/ZY
 xIpcVdK8TGX4YW0X/RyQOY/SBUfycEcA2F/v71WHPIVTTWmon5PuLh9Sej67A0VKUie6
 PTC2PwLzdFKsUXluR5mPYURs6KbwfSBRmor2732fPXGgq+EUXk6WrICAUWfBkTK/3mvX
 H5yRcVVt0/lZnd+KTnYqOENo5lRGP+8Rx8FQ1dQIax9hRJwyTPH0ZhTH2rhGxFZmoT+3
 qoqw==
X-Gm-Message-State: AOAM533TejBoIPWujlMvbWzrdN/RnLzP9jMhPtQQX/1Zdg9MCYwurFCK
 fiWlYaBwuSR6blh2KD9mFkrVnb850FY=
X-Google-Smtp-Source: ABdhPJxFBQpRuf0KrGophIOZLsVQHw11h1GqexsOi4zodKn5MGZVPm4eCx+M+mUGqcym7mnTgqs8LA==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr15872190wmj.65.1635951904761; 
 Wed, 03 Nov 2021 08:05:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/27] KVM: SVM: add migration support for nested TSC scaling
Date: Wed,  3 Nov 2021 16:04:33 +0100
Message-Id: <20211103150442.387121-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20211101132300.192584-4-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c     |  5 +++++
 target/i386/cpu.h     |  4 ++++
 target/i386/kvm/kvm.c | 15 +++++++++++++++
 target/i386/machine.c | 22 ++++++++++++++++++++++
 4 files changed, 46 insertions(+)

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
index 3edaad7688..04f2b790c9 100644
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
 
@@ -1536,6 +1539,7 @@ typedef struct CPUX86State {
     uint32_t tsx_ctrl;
 
     uint64_t spec_ctrl;
+    uint64_t amd_tsc_scale_msr;
     uint64_t virt_ssbd;
 
     /* End of state preserved by INIT (dummy marker).  */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0eb7a0340c..5a698bde19 100644
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
@@ -2972,6 +2976,10 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
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
@@ -3377,6 +3385,10 @@ static int kvm_get_msrs(X86CPU *cpu)
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
@@ -3788,6 +3800,9 @@ static int kvm_get_msrs(X86CPU *cpu)
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
index 4367931623..83c2b91529 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1280,6 +1280,27 @@ static const VMStateDescription vmstate_spec_ctrl = {
     }
 };
 
+
+static bool amd_tsc_scale_msr_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return (env->features[FEAT_SVM] & CPUID_SVM_TSCSCALE);
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
@@ -1558,6 +1579,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_pkru,
         &vmstate_pkrs,
         &vmstate_spec_ctrl,
+        &amd_tsc_scale_msr_ctrl,
         &vmstate_mcg_ext_ctl,
         &vmstate_msr_intel_pt,
         &vmstate_msr_virt_ssbd,
-- 
2.31.1



