Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3034D1697
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:48:49 +0100 (CET)
Received: from localhost ([::1]:59860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYKe-0003Um-QY
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7n-0007sv-Sc
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:32 -0500
Received: from [2a00:1450:4864:20::52f] (port=37707
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7k-00060w-B0
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:31 -0500
Received: by mail-ed1-x52f.google.com with SMTP id q17so24055716edd.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v75aab1hkNIdvidEEPfPKyn8HJfknHeIqC/yZyfZ3qw=;
 b=UfwzLWc3EJvXWFezP9xJBekvZ9dUL2o8xcFHFT1PBWo1L0AGU0wmMA/Ibn6MTsw9YV
 v3va2+udC5SCEDXIuHQhh5XABfO9UW8e0fP0u46zfLmSv/JSMhEeZVEDfur5knC5cy1Q
 Ekit6QDCAeSyeco1a3hRTMFQvc9g0rEssxGZxGrL3f+utYkGZTEjB5sP/i5zA/hbPz1z
 +XM8/6JEqoSt7GVMmNbLeCMfA056FaOpuMvi6wjTBS5gy2lF6a3Zy+42VFvtOZg/yI1U
 0WLbiMuh8lrqW8em54NWXHqJZNJvIyioOYCHr/WedXnQqPcMMBlhqvGrPoSLGV/ReLca
 HJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v75aab1hkNIdvidEEPfPKyn8HJfknHeIqC/yZyfZ3qw=;
 b=w5wyjUUScMqU69moVy+E8MkhMCkZ7UjqhxkkLzwOzv7ua1nczJZ78zSjx1BWjy90v7
 3WRg+oaBr/VtFVxtVdv/eXMpyYLu/LolTNe2aJxEQeCk2c5i7Jwg9pDZRZsYZxmKpeKI
 JRaFx9cGREQ4w1GSJeYCjyvUF/wDyTJ4XIR8/96rDC4z7qYlB+HzQu92tURSnO4Scxb/
 chPyBI8+o8mlU5la1Fm/f0oksUWdVzzL1wPCFnMim/kWcYIhq2EVO8FMIzD+0sOFe2up
 Q2YZ2kgTnaBUmcU5LF5yyFBjG75bpSfoF78x/FeCfQIo0omtdtPsfhtKbYx52kr5ND91
 A2cA==
X-Gm-Message-State: AOAM532IvGjYQbf6MTX3Lna+RL6kbbPenpQ9Km+2iusA4oQagbeZr1r0
 wvW6EqxuXTNq0HSGFxwuhRk+jMMz03g=
X-Google-Smtp-Source: ABdhPJy72DlzWyEkeHHORYz1ZDodjiqCdE/cOvfWawfkHxZDY5A6QM9VOz4Aa7252RCQpfTamZlADA==
X-Received: by 2002:a05:6402:17d9:b0:410:aaaf:6467 with SMTP id
 s25-20020a05640217d900b00410aaaf6467mr15726351edy.38.1646739320339; 
 Tue, 08 Mar 2022 03:35:20 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/22] x86: Support XFD and AMX xsave data migration
Date: Tue,  8 Mar 2022 12:34:42 +0100
Message-Id: <20220308113445.859669-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Zeng Guang <guang.zeng@intel.com>,
 Wei Wang <wei.w.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zeng Guang <guang.zeng@intel.com>

XFD(eXtended Feature Disable) allows to enable a
feature on xsave state while preventing specific
user threads from using the feature.

Support save and restore XFD MSRs if CPUID.D.1.EAX[4]
enumerate to be valid. Likewise migrate the MSRs and
related xsave state necessarily.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220217060434.52460-8-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h     |  9 +++++++++
 target/i386/kvm/kvm.c | 18 +++++++++++++++++
 target/i386/machine.c | 46 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8c850e74b8..efea2c78ec 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -507,6 +507,9 @@ typedef enum X86Seg {
 
 #define MSR_VM_HSAVE_PA                 0xc0010117
 
+#define MSR_IA32_XFD                    0x000001c4
+#define MSR_IA32_XFD_ERR                0x000001c5
+
 #define MSR_IA32_BNDCFGS                0x00000d90
 #define MSR_IA32_XSS                    0x00000da0
 #define MSR_IA32_UMWAIT_CONTROL         0xe1
@@ -872,6 +875,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+/* XFD Extend Feature Disabled */
+#define CPUID_D_1_EAX_XFD               (1U << 4)
 
 /* Packets which contain IP payload have LIP values */
 #define CPUID_14_0_ECX_LIP              (1U << 31)
@@ -1616,6 +1621,10 @@ typedef struct CPUX86State {
     uint64_t msr_rtit_cr3_match;
     uint64_t msr_rtit_addrs[MAX_RTIT_ADDRS];
 
+    /* Per-VCPU XFD MSRs */
+    uint64_t msr_xfd;
+    uint64_t msr_xfd_err;
+
     /* exception/interrupt handling */
     int error_code;
     int exception_is_int;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0fbdeacbb7..debac04e91 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3276,6 +3276,13 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                               env->msr_ia32_sgxlepubkeyhash[3]);
         }
 
+        if (env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD) {
+            kvm_msr_entry_add(cpu, MSR_IA32_XFD,
+                              env->msr_xfd);
+            kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR,
+                              env->msr_xfd_err);
+        }
+
         /* Note: MSR_IA32_FEATURE_CONTROL is written separately, see
          *       kvm_put_msr_feature_control. */
     }
@@ -3668,6 +3675,11 @@ static int kvm_get_msrs(X86CPU *cpu)
         kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH3, 0);
     }
 
+    if (env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD) {
+        kvm_msr_entry_add(cpu, MSR_IA32_XFD, 0);
+        kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR, 0);
+    }
+
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, cpu->kvm_msr_buf);
     if (ret < 0) {
         return ret;
@@ -3964,6 +3976,12 @@ static int kvm_get_msrs(X86CPU *cpu)
             env->msr_ia32_sgxlepubkeyhash[index - MSR_IA32_SGXLEPUBKEYHASH0] =
                            msrs[i].data;
             break;
+        case MSR_IA32_XFD:
+            env->msr_xfd = msrs[i].data;
+            break;
+        case MSR_IA32_XFD_ERR:
+            env->msr_xfd_err = msrs[i].data;
+            break;
         }
     }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 6202f47793..7c54bada81 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1483,6 +1483,48 @@ static const VMStateDescription vmstate_pdptrs = {
     }
 };
 
+static bool xfd_msrs_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return !!(env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD);
+}
+
+static const VMStateDescription vmstate_msr_xfd = {
+    .name = "cpu/msr_xfd",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xfd_msrs_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.msr_xfd, X86CPU),
+        VMSTATE_UINT64(env.msr_xfd_err, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#ifdef TARGET_X86_64
+static bool amx_xtile_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return !!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE);
+}
+
+static const VMStateDescription vmstate_amx_xtile = {
+    .name = "cpu/intel_amx_xtile",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = amx_xtile_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(env.xtilecfg, X86CPU, 64),
+        VMSTATE_UINT8_ARRAY(env.xtiledata, X86CPU, 8192),
+        VMSTATE_END_OF_LIST()
+    }
+};
+#endif
+
 const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
@@ -1622,6 +1664,10 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_tsx_ctrl,
         &vmstate_msr_intel_sgx,
         &vmstate_pdptrs,
+        &vmstate_msr_xfd,
+#ifdef TARGET_X86_64
+        &vmstate_amx_xtile,
+#endif
         NULL
     }
 };
-- 
2.35.1



