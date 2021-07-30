Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D157A3DB444
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 09:09:29 +0200 (CEST)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Me7-0007Vg-Hf
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 03:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m9Md0-0006r6-Qv
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 03:08:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m9Mcz-0001c8-4N
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 03:08:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so5681657wmd.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 00:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hB+8MVZry6V5Lt1nx2uV1KkFV7O1ohCnR4EKedLppeE=;
 b=eENVUmZ4/kFO+go+Wo8ZppU4IJuowrInzMjJJuYDC0wQxNl5gm7N34axZJkcYAsrFY
 rWQwcKkIVZGYftAJj4egfAbc+FHNzk4lhLa8vgN5JLAn2u9dCMOmLLrC4P763zPWoRD5
 am1WBvQBslYdLMTe5cQQOnCteWw/FyvwY2uLXnKwC0IhaR2yQwF8vVfnwpSQVdwU0qrn
 boW6DfP8LgKsCNgFTuKDqRkRweNnMmr4FWjthKw6Bo8Kx6D1fyzMUrrIFqUt+16jtZ8X
 sgim1IZXwVmyd5mzjwURoO+EO0kFLNdbJT7mq0RuLlLPlOGQRYfjF3yNFweJej81NuOb
 gmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hB+8MVZry6V5Lt1nx2uV1KkFV7O1ohCnR4EKedLppeE=;
 b=kfAKmjBSFV+ajjpi7Z5B8JRP87pCdMWzM+kjSlDQaqfLagcveCQwyRgkACedzDFvoM
 lUiiWlvP/llwLu6r0UC8BBwKdjr/DpgBfOMWN/E9GL1f2LfDeKxJHZhvrPMY+Xk7PrMV
 4u9Ri7ZIKoxG0WbZNRw9KtpEhlmj9bRA+1i0Nlqjoj+shZpXWjkj24xfoDATOvywdR9Q
 9Bz9c1ACVOrd2p2Am/eonYlPpHXe1NUGW+P4VUM2xbIVWcWTLRkTg6+jkoxPDQFmNzPb
 kuAj+D4pcr1rSOsVltY//90xgD8zXRwEvvxIyC78I1CtRuesTtAkQxMY1koqUYH1Qnkf
 KCGw==
X-Gm-Message-State: AOAM5329BuqdLOWrqSPmzMsi/gsIMJMbL6zQMKEOQEvDx/g1nY+SxiNp
 RkasKYbF1CYmpOPkKN1mcwTYBxL91ARVXw==
X-Google-Smtp-Source: ABdhPJxb3dqUgqWcroJiLb9O+n1YhL9lSYJpGohgiYQiPXVCqmDLuuFvUWsYn6bHTHuVceXd3cREkg==
X-Received: by 2002:a05:600c:4651:: with SMTP id
 n17mr1258664wmo.36.1627628895003; 
 Fri, 30 Jul 2021 00:08:15 -0700 (PDT)
Received: from localhost.localdomain (93-33-64-120.ip43.fastwebnet.it.
 [93.33.64.120])
 by smtp.gmail.com with ESMTPSA id q63sm1030389wme.36.2021.07.30.00.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 00:08:14 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] target/i386: Added VGIF feature
Date: Fri, 30 Jul 2021 09:07:42 +0200
Message-Id: <20210730070742.9674-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2->v3: moved guest check into virtual_gif_enabled

VGIF allows STGI and CLGI to execute in guest mode and control virtual
interrupts in guest mode.
When the VGIF feature is enabled then:
 * executing STGI in the guest sets bit 9 of the VMCB offset 60h.
 * executing CLGI in the guest clears bit 9 of the VMCB offset 60h.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.c                   |  3 ++-
 target/i386/svm.h                   |  6 ++++++
 target/i386/tcg/sysemu/svm_helper.c | 31 +++++++++++++++++++++++++++--
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index edb97ebbbe..71d26cf1bd 100644
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
index 90a9de30f8..b6ad425cca 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -110,6 +110,17 @@ static inline bool is_efer_invalid_state (CPUX86State *env)
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
@@ -503,13 +514,29 @@ void helper_vmsave(CPUX86State *env, int aflag)
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
2.25.1


