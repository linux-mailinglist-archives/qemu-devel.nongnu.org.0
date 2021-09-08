Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543DB40379F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:12:55 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuZa-0006On-CP
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRe-0006J1-Q1
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:42 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRb-0002oy-GI
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so1101884wmq.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vC4CLxS3uATszG/9NMGUyh1mVGgnFuJ2ybR8crd545U=;
 b=Ci4rfq40KHsI+VeX6B3eJlLruNF7Dj5F1jbUKs/SceTHwJ5rZfTAFpgMomyUOskvlA
 QE4VkR3ac4hyXuR5vq+1JzkWdAP/VvomBks9iGfe9AokKE/uiMFwcrSGddcD6cx1sSAm
 dZVRwPu3+nMo/jUU0UNWACw8iJa+yCVX1T/U60xR8jKiQC552W2S5xIYKqTfuPqqN61v
 668GRI15elll7BvWfZjj0lYQICoTnh5wHVSWP0dJqkalGMbCG41JurGgBOjlBbEKMGc0
 IsapZ3zWfnJXKA1FubIR4C/Gvt8T2bFhPIY8dnV75JFaq+qnzXMg87IceefFW7w687Tn
 mxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vC4CLxS3uATszG/9NMGUyh1mVGgnFuJ2ybR8crd545U=;
 b=MqwD+xI7hXidMZy2hSQQc0o5nHrj538KKjuShtkQVpT8Xev/l1ljwGK+sVtgo0xJmh
 asChoSLPIXW531wwKuaob+cmko2kIPXNvlRDgys4qHLoC8CRHyRxOFA2zzTQel8bDVFb
 SgMNTTFiMarmh+54Cm0qoFUnaVegqFKLKJ0As8kgZp/HmOksBnOAetGhDUckyn0TdI2B
 2Cnu9wVAKf17LMCNSShJHuWYhauVXpWa0FmnB0NhQEUezBledEqoAMc2yXdXCM5jMOlR
 WlS+ApoQBojl2R602Xvuzv0DSUkN9t7DAMqKMxGqx6f//X8PXda39W9bjYZa9kqB0eFM
 HcUA==
X-Gm-Message-State: AOAM5303JEVdZihqoAdW1TShELCFGYq5k1g5+Jv5Fy3VmLuFKlGtJd9y
 ZBeqcvw4FkgpSAFoIyP83kXMPeQ514U=
X-Google-Smtp-Source: ABdhPJzwcrrkwWrh9l2G3lLMfonPGbiwd4MSFqJd3c9wRx5t+ZDDxLuFaKJkAYdoilIvYIWs1wfJXg==
X-Received: by 2002:a1c:ac05:: with SMTP id v5mr2753744wme.13.1631095478119;
 Wed, 08 Sep 2021 03:04:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 03/43] target/i386: Added VGIF feature
Date: Wed,  8 Sep 2021 12:03:46 +0200
Message-Id: <20210908100426.264356-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Lara Lazier <laramglazier@gmail.com>

VGIF allows STGI and CLGI to execute in guest mode and control virtual
interrupts in guest mode.
When the VGIF feature is enabled then:
 * executing STGI in the guest sets bit 9 of the VMCB offset 60h.
 * executing CLGI in the guest clears bit 9 of the VMCB offset 60h.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210730070742.9674-1-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c                   |  3 ++-
 target/i386/svm.h                   |  6 ++++++
 target/i386/tcg/sysemu/svm_helper.c | 31 +++++++++++++++++++++++++++--
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fbca4e5860..86064ea1f9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -631,7 +631,8 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_EXT3_FEATURES (CPUID_EXT3_LAHF_LM | CPUID_EXT3_SVM | \
           CPUID_EXT3_CR8LEG | CPUID_EXT3_ABM | CPUID_EXT3_SSE4A)
 #define TCG_EXT4_FEATURES 0
-#define TCG_SVM_FEATURES CPUID_SVM_NPT
+#define TCG_SVM_FEATURES (CPUID_SVM_NPT | CPUID_SVM_VGIF | \
+          CPUID_SVM_SVME_ADDR_CHK)
 #define TCG_KVM_FEATURES 0
 #define TCG_7_0_EBX_FEATURES (CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_SMAP | \
           CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ADX | \
diff --git a/target/i386/svm.h b/target/i386/svm.h
index adc058dc76..036597a2ff 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -9,6 +9,12 @@
 #define V_IRQ_SHIFT 8
 #define V_IRQ_MASK (1 << V_IRQ_SHIFT)
 
+#define V_GIF_ENABLED_SHIFT 25
+#define V_GIF_ENABLED_MASK (1 << V_GIF_ENABLED_SHIFT)
+
+#define V_GIF_SHIFT 9
+#define V_GIF_MASK (1 << V_GIF_SHIFT)
+
 #define V_INTR_PRIO_SHIFT 16
 #define V_INTR_PRIO_MASK (0x0f << V_INTR_PRIO_SHIFT)
 
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 0e7de4e054..66c2c1e61f 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -121,6 +121,17 @@ static inline bool is_efer_invalid_state (CPUX86State *env)
     return false;
 }
 
+static inline bool virtual_gif_enabled(CPUX86State *env, uint32_t *int_ctl)
+{
+    if (likely(env->hflags & HF_GUEST_MASK)) {
+        *int_ctl = x86_ldl_phys(env_cpu(env),
+                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
+        return (env->features[FEAT_SVM] & CPUID_SVM_VGIF)
+                    && (*int_ctl & V_GIF_ENABLED_MASK);
+    }
+    return false;
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -510,13 +521,29 @@ void helper_vmsave(CPUX86State *env, int aflag)
 void helper_stgi(CPUX86State *env)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_STGI, 0, GETPC());
-    env->hflags2 |= HF2_GIF_MASK;
+
+    CPUState *cs = env_cpu(env);
+    uint32_t int_ctl;
+    if (virtual_gif_enabled(env, &int_ctl)) {
+        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
+                        int_ctl | V_GIF_MASK);
+    } else {
+        env->hflags2 |= HF2_GIF_MASK;
+    }
 }
 
 void helper_clgi(CPUX86State *env)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_CLGI, 0, GETPC());
-    env->hflags2 &= ~HF2_GIF_MASK;
+
+    CPUState *cs = env_cpu(env);
+    uint32_t int_ctl;
+    if (virtual_gif_enabled(env, &int_ctl)) {
+        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
+                        int_ctl & ~V_GIF_MASK);
+    } else {
+        env->hflags2 &= ~HF2_GIF_MASK;
+    }
 }
 
 bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
-- 
2.31.1



