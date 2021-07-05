Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4A3BB8DE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:20:40 +0200 (CEST)
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JqJ-00008w-TQ
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jo3-0006MK-Vp
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:19 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jo1-0005b7-Km
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id l1so10770809wme.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7CagZ6K0MtLBhw9uGydgN1M2pP4f5ZiE6fG19o2njqY=;
 b=NbQ8wvkabs9XB6xoLDTm8i7ghhDY5ZcyuN3/NGELh8oHsNbj8d8bWjYLxXYOqZUPtS
 niZ59s9cyOnZRhPEZeZCp/xQ2xKdqrwSiQ4lMVkUj6OdQM3/APbW/S5BAe+vNqO2Z8tx
 smu7enfhcTQ6K628ILgg663y4CO7cLNlj2+BOPP8TK+syIztQiYbuSWUpQt3Xtd7WXpR
 fSZdoCgo6vNeIQyycgHMxJWuj01mo6/L5Pu96nHd8P/rDgkbIcKSRzKL+TdbG8alYwlB
 NWF8oAOLrX45ANws7DLSGU/ksL2VqufpqEJnkK6chvaRRJ+53rbpVxO2Vh3N5L7p5NQ2
 JWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7CagZ6K0MtLBhw9uGydgN1M2pP4f5ZiE6fG19o2njqY=;
 b=i9C1Okt7346k30dARwf952ZBfZy/up69x6YOd1SgBuJdNoDJJwRFxBk/+o3oeZhwYK
 f7bsqi9cAJ9mCNx4Bmuh0gTmzZdyd+TOKCJL0Ks4yQKmp+mSeUntju+3ZQOh78WmOFsT
 zsjUUVbCZgkF+noKWVyMzzJCAJocLUR+KM5a5LFlPDxdHaq8MT6a+d57EVzkKe+kS/wj
 yQEC96BkMIpm8nxgeO9Pk4UApPgbXhe5B3eN5lNMm28oVbKBjoBCdn3onM0w28Tei3NJ
 IIekGtW/gyTpUA62p1rLPjL8OZMFIKr4tdEQ9FpWYqZemjnaWzenPd02W0M5GbB4madN
 oV+w==
X-Gm-Message-State: AOAM531tMiqm/Y4JT4frlIkHteTHtOGSM4cGP8DybHS5dT0SriIQdX7f
 9EqqfEDZ4iopd7orpW2UqSAh+XV6hylfxw==
X-Google-Smtp-Source: ABdhPJy3AUkJEGKs/Ff0dCD8GQm6lemYD4gmGmGRWfNAQNpcsEeSKM1DqVlYYzRqxUgE5mqFM+l47A==
X-Received: by 2002:a05:600c:4ba9:: with SMTP id
 e41mr13505991wmp.72.1625473093956; 
 Mon, 05 Jul 2021 01:18:13 -0700 (PDT)
Received: from localhost.localdomain ([37.160.151.142])
 by smtp.gmail.com with ESMTPSA id n5sm3662014wri.31.2021.07.05.01.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:18:13 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/i386: Added VMRUN consistency checks for CR3 and
 CR4
Date: Mon,  5 Jul 2021 10:18:02 +0200
Message-Id: <20210705081802.18960-5-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705081802.18960-1-laramglazier@gmail.com>
References: <20210705081802.18960-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All MBZ bits in CR3 and CR4 must be zero. (APM2 15.5)
Added reserved bitmask for CR4 and added checks in both
helper_vmrun and helper_write_crN.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                    | 29 ++++++++++++++++++++++++++++
 target/i386/tcg/sysemu/misc_helper.c |  6 ++++++
 target/i386/tcg/sysemu/svm_helper.c  | 18 +++++++++++------
 3 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f5280b2951..0368551a66 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -240,6 +240,7 @@ typedef enum X86Seg {
 #define CR4_OSFXSR_SHIFT 9
 #define CR4_OSFXSR_MASK (1U << CR4_OSFXSR_SHIFT)
 #define CR4_OSXMMEXCPT_MASK  (1U << 10)
+#define CR4_UMIP_MASK   (1U << 11)
 #define CR4_LA57_MASK   (1U << 12)
 #define CR4_VMXE_MASK   (1U << 13)
 #define CR4_SMXE_MASK   (1U << 14)
@@ -251,6 +252,34 @@ typedef enum X86Seg {
 #define CR4_PKE_MASK   (1U << 22)
 #define CR4_PKS_MASK   (1U << 24)
 
+#define CR4_RESERVED_MASK \
+(~(unsigned long)(CR4_VME_MASK | CR4_PVI_MASK | CR4_TSD_MASK \
+                | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
+                | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
+                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
+                | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
+                | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK))
+
+#define cr4_reserved_bits(env) \
+({ \
+    uint64_t __reserved_bits = CR4_RESERVED_MASK; \
+    if (!env->features[FEAT_XSAVE]) \
+        __reserved_bits |= CR4_OSXSAVE_MASK; \
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SMEP)) \
+        __reserved_bits |= CR4_SMEP_MASK; \
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SMAP)) \
+        __reserved_bits |= CR4_SMAP_MASK; \
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FSGSBASE)) \
+        __reserved_bits |= CR4_FSGSBASE_MASK; \
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKU)) \
+        __reserved_bits |= CR4_PKE_MASK; \
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_LA57)) \
+        __reserved_bits |= CR4_LA57_MASK; \
+    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_UMIP)) \
+        __reserved_bits |= CR4_UMIP_MASK; \
+    __reserved_bits; \
+})
+
 #define DR6_BD          (1 << 13)
 #define DR6_BS          (1 << 14)
 #define DR6_BT          (1 << 15)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index db0d8a9d79..cdb4826987 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -96,9 +96,15 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
         cpu_x86_update_cr0(env, t0);
         break;
     case 3:
+        if (t0 & ((~0UL) << env_archcpu(env)->phys_bits)) {
+            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+        }
         cpu_x86_update_cr3(env, t0);
         break;
     case 4:
+        if (t0 & cr4_reserved_bits(env)) {
+            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+        }
         if (((t0 ^ env->cr[4]) & CR4_LA57_MASK) &&
             (env->hflags & HF_CS64_MASK)) {
             raise_exception_ra(env, EXCP0D_GPF, GETPC());
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index d652d6f9da..e3a4fa74d2 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -110,6 +110,8 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     uint32_t int_ctl;
     uint32_t asid;
     uint64_t new_cr0;
+    uint64_t new_cr3;
+    uint64_t new_cr4;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
 
@@ -250,17 +252,21 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     if ((new_cr0 & CR0_NW_MASK) && !(new_cr0 & CR0_CD_MASK)) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
+    new_cr3 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr3));
+    if (new_cr3 & ((~0UL) << cpu->phys_bits)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+    new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
+    if (new_cr4 & cr4_reserved_bits(env)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
     /* clear exit_info_2 so we behave like the real hardware */
     x86_stq_phys(cs,
              env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2), 0);
 
     cpu_x86_update_cr0(env, new_cr0);
-    cpu_x86_update_cr4(env, x86_ldq_phys(cs,
-                                     env->vm_vmcb + offsetof(struct vmcb,
-                                                             save.cr4)));
-    cpu_x86_update_cr3(env, x86_ldq_phys(cs,
-                                     env->vm_vmcb + offsetof(struct vmcb,
-                                                             save.cr3)));
+    cpu_x86_update_cr4(env, new_cr4);
+    cpu_x86_update_cr3(env, new_cr3);
     env->cr[2] = x86_ldq_phys(cs,
                           env->vm_vmcb + offsetof(struct vmcb, save.cr2));
     int_ctl = x86_ldl_phys(cs,
-- 
2.25.1


