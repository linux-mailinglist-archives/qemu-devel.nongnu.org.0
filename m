Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A06305710
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 10:37:01 +0100 (CET)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hG0-0003vj-Cp
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 04:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l4hEt-0003Lj-UO
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:35:52 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l4hEn-0008Fc-Di
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:35:47 -0500
Received: by mail-ed1-x530.google.com with SMTP id j13so1620506edp.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 01:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6EvIZwvKuICXeVjgmQqOWoArIHLhLYSW11eQ+o8WJ5M=;
 b=mPmH//5BF48jzxjOqWuvcKn6ZmOYhs6/bfuqym85msA+BoI5iXqVwkZvt8GewCOGJD
 5VJMYze2yriG6n/bqB82Q5IPMVSBdE5477H0+Fc5pAnLnPs4V9FN7gFmvY6mFBNXud1u
 P/CgpXrgslsbvVUMU+veUqoZuIuwubSD2I0ooTgdckp3uOodYMeA49O94kkRmg3DBEiV
 qOUNcBJHDc7L2M81ZQqu4vSy2gMtjYm60skO2PQqgPqzKSxakXk7Kk4pppnqmAbTLLZ1
 bWu6LwCwYjkym4q7KMiSFDfo94p9QIPPiPrTmuTyCl7FcKuB6OPBm/A27ngSyQX8sLZm
 7+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6EvIZwvKuICXeVjgmQqOWoArIHLhLYSW11eQ+o8WJ5M=;
 b=P3Atwm8Uipw8+BRhC8WAFZlPwEtHWoQlG2sHnVZgJpkCMx0F3Gofgsv5j+DXiuFz6R
 G3sn65NO1hqAoxT79UY1m2e/D8KQmHgGHWuqa40djweqnYuCgmpsRq1M8bN1cd0PTy5s
 jm+kNODxlWdG24ajdSJ7yUAY1OpIHXgqDJCAw3h0t28NDBDEUfHx66BG1g5Mkkl6su6+
 mD+/AhQxieei2HMvPqeCG1QhU1rC9KwuKcsN2qrsJaxhpv3uqTTs5rwGkC8xz6XWlS9L
 bVp4BY452RuqItZ9p8OxxoaCHgTKNOJNQCA8iULP6y9cFAFVHkQetM499lcg+eD0MklF
 Wf3Q==
X-Gm-Message-State: AOAM531QiwBjrxNaE6l7vHaKUZzoFd7MHalDwhHIwLfVpgydI+/FtU27
 yb+tD+DV+ajnDHDZUIoRTwryep7hdxFqjQ==
X-Google-Smtp-Source: ABdhPJwfG6JzrpGqaKMFrlxCmAfOSgSJPBKeAfs+wvVLGfpSwVICMmDiwlSnPFwnSU/gTtNiSjbdlA==
X-Received: by 2002:aa7:c60a:: with SMTP id h10mr8050108edq.263.1611740141999; 
 Wed, 27 Jan 2021 01:35:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t11sm890732edd.1.2021.01.27.01.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 01:35:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i86: implement PKS
Date: Wed, 27 Jan 2021 10:35:40 +0100
Message-Id: <20210127093540.472624-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Protection Keys for Supervisor-mode pages is a simple extension of
the PKU feature that QEMU already implements.  For supervisor-mode
pages, protection key restrictions come from a new MSR.  The MSR
has no XSAVE state associated to it.

PKS is only respected in long mode.  However, in principle it is
possible to set the MSR even outside long mode, and in fact
even the XSAVE state for PKRU could be set outside long mode
using XRSTOR.  So do not limit the migration subsections for
PKRU and PKRS to long mode.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c             |  4 ++--
 target/i386/cpu.h             |  5 +++++
 target/i386/helper.c          |  3 +++
 target/i386/machine.c         | 24 ++++++++++++++++++++----
 target/i386/tcg/excp_helper.c | 32 ++++++++++++++++++++------------
 target/i386/tcg/misc_helper.c | 14 ++++++++++++++
 6 files changed, 64 insertions(+), 18 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a8db1b415d..cc41a9101a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -667,7 +667,7 @@ static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_7_0_EBX_RDSEED */
 #define TCG_7_0_ECX_FEATURES (CPUID_7_0_ECX_PKU | \
           /* CPUID_7_0_ECX_OSPKE is dynamic */ \
-          CPUID_7_0_ECX_LA57)
+          CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS)
 #define TCG_7_0_EDX_FEATURES 0
 #define TCG_7_1_EAX_FEATURES 0
 #define TCG_APM_FEATURES 0
@@ -964,7 +964,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "la57", NULL, NULL, NULL,
             NULL, NULL, "rdpid", NULL,
             NULL, "cldemote", NULL, "movdiri",
-            "movdir64b", NULL, NULL, NULL,
+            "movdir64b", NULL, NULL, "pks",
         },
         .cpuid = {
             .eax = 7,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b39ec505de..cc5a26f35b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -247,6 +247,7 @@ typedef enum X86Seg {
 #define CR4_SMEP_MASK   (1U << 20)
 #define CR4_SMAP_MASK   (1U << 21)
 #define CR4_PKE_MASK   (1U << 22)
+#define CR4_PKS_MASK   (1U << 24)
 
 #define DR6_BD          (1 << 13)
 #define DR6_BS          (1 << 14)
@@ -357,6 +358,7 @@ typedef enum X86Seg {
 
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
+#define MSR_IA32_PKRS                   0x6e1
 
 #define FEATURE_CONTROL_LOCKED                    (1<<0)
 #define FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX (1<<2)
@@ -772,6 +774,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_ECX_MOVDIRI           (1U << 27)
 /* Move 64 Bytes as Direct Store Instruction */
 #define CPUID_7_0_ECX_MOVDIR64B         (1U << 28)
+/* Protection Keys for Supervisor-mode Pages */
+#define CPUID_7_0_ECX_PKS               (1U << 31)
 
 /* AVX512 Neural Network Instructions */
 #define CPUID_7_0_EDX_AVX512_4VNNIW     (1U << 2)
@@ -1487,6 +1491,7 @@ typedef struct CPUX86State {
     uint64_t msr_smi_count;
 
     uint32_t pkru;
+    uint32_t pkrs;
     uint32_t tsx_ctrl;
 
     uint64_t spec_ctrl;
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 6bb0c53182..618ad1c409 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -194,6 +194,9 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4)
     if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKU)) {
         new_cr4 &= ~CR4_PKE_MASK;
     }
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKS)) {
+        new_cr4 &= ~CR4_PKS_MASK;
+    }
 
     env->cr[4] = new_cr4;
     env->hflags = hflags;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 1614e8c2f8..3768a753af 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -980,7 +980,6 @@ static const VMStateDescription vmstate_umwait = {
     }
 };
 
-#ifdef TARGET_X86_64
 static bool pkru_needed(void *opaque)
 {
     X86CPU *cpu = opaque;
@@ -999,7 +998,25 @@ static const VMStateDescription vmstate_pkru = {
         VMSTATE_END_OF_LIST()
     }
 };
-#endif
+
+static bool pkrs_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->pkrs != 0;
+}
+
+static const VMStateDescription vmstate_pkrs = {
+    .name = "cpu/pkrs",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pkrs_needed,
+    .fields = (VMStateField[]){
+        VMSTATE_UINT32(env.pkrs, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
 
 static bool tsc_khz_needed(void *opaque)
 {
@@ -1480,9 +1497,8 @@ VMStateDescription vmstate_x86_cpu = {
         &vmstate_umwait,
         &vmstate_tsc_khz,
         &vmstate_msr_smi_count,
-#ifdef TARGET_X86_64
         &vmstate_pkru,
-#endif
+        &vmstate_pkrs,
         &vmstate_spec_ctrl,
         &vmstate_mcg_ext_ctl,
         &vmstate_msr_intel_pt,
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index a0f44431fe..b7d6259e4a 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -361,6 +361,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
     uint64_t rsvd_mask = PG_HI_RSVD_MASK;
     uint32_t page_offset;
     target_ulong vaddr;
+    uint32_t pkr;
 
     is_user = mmu_idx == MMU_USER_IDX;
 #if defined(DEBUG_MMU)
@@ -588,21 +589,28 @@ do_check_protect_pse36:
          !((env->cr[4] & CR4_SMEP_MASK) && (ptep & PG_USER_MASK)))) {
         prot |= PAGE_EXEC;
     }
-    if ((env->cr[4] & CR4_PKE_MASK) && (env->hflags & HF_LMA_MASK) &&
-        (ptep & PG_USER_MASK) && env->pkru) {
+
+    if (!(env->hflags & HF_LMA_MASK)) {
+        pkr = 0;
+    } else if (ptep & PG_USER_MASK) {
+        pkr = env->cr[4] & CR4_PKE_MASK ? env->pkru : 0;
+    } else {
+        pkr = env->cr[4] & CR4_PKS_MASK ? env->pkrs : 0;
+    }
+    if (pkr) {
         uint32_t pk = (pte & PG_PKRU_MASK) >> PG_PKRU_BIT;
-        uint32_t pkru_ad = (env->pkru >> pk * 2) & 1;
-        uint32_t pkru_wd = (env->pkru >> pk * 2) & 2;
-        uint32_t pkru_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-
-        if (pkru_ad) {
-            pkru_prot &= ~(PAGE_READ | PAGE_WRITE);
-        } else if (pkru_wd && (is_user || env->cr[0] & CR0_WP_MASK)) {
-            pkru_prot &= ~PAGE_WRITE;
+        uint32_t pkr_ad = (pkr >> pk * 2) & 1;
+        uint32_t pkr_wd = (pkr >> pk * 2) & 2;
+        uint32_t pkr_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+
+        if (pkr_ad) {
+            pkr_prot &= ~(PAGE_READ | PAGE_WRITE);
+        } else if (pkr_wd && (is_user || env->cr[0] & CR0_WP_MASK)) {
+            pkr_prot &= ~PAGE_WRITE;
         }
 
-        prot &= pkru_prot;
-        if ((pkru_prot & (1 << is_write1)) == 0) {
+        prot &= pkr_prot;
+        if ((pkr_prot & (1 << is_write1)) == 0) {
             assert(is_write1 != 2);
             error_code |= PG_ERROR_PK_MASK;
             goto do_fault_protect;
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 0bd6c95749..f02e4fd400 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -244,6 +244,7 @@ void helper_rdmsr(CPUX86State *env)
 void helper_wrmsr(CPUX86State *env)
 {
     uint64_t val;
+    CPUState *cs = env_cpu(env);
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_MSR, 1, GETPC());
 
@@ -296,6 +297,13 @@ void helper_wrmsr(CPUX86State *env)
     case MSR_PAT:
         env->pat = val;
         break;
+    case MSR_IA32_PKRS:
+        if (val & 0xFFFFFFFF00000000ull) {
+            goto error;
+        }
+        env->pkrs = val;
+        tlb_flush(cs);
+        break;
     case MSR_VM_HSAVE_PA:
         env->vm_hsave = val;
         break;
@@ -399,6 +407,9 @@ void helper_wrmsr(CPUX86State *env)
         /* XXX: exception? */
         break;
     }
+    return;
+error:
+    raise_exception_err_ra(env, EXCP0D_GPF, 0, GETPC());
 }
 
 void helper_rdmsr(CPUX86State *env)
@@ -430,6 +441,9 @@ void helper_rdmsr(CPUX86State *env)
     case MSR_PAT:
         val = env->pat;
         break;
+    case MSR_IA32_PKRS:
+        val = env->pkrs;
+        break;
     case MSR_VM_HSAVE_PA:
         val = env->vm_hsave;
         break;
-- 
2.29.2


