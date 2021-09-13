Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6A408AAB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:05:02 +0200 (CEST)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkhp-0003Ab-Og
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkau-0002lw-TT
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkas-0005n0-TD
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g16so14296269wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vC4CLxS3uATszG/9NMGUyh1mVGgnFuJ2ybR8crd545U=;
 b=FywgWqflrnkJzeGbYi9epTXIFsOxf2xPYFRvn8JiU9/B3Ews4id851Rup1JASLQ8t9
 wagJHYEsUvoHcpUKSPaUWjy/jb6JrmwWNwCM5VpoTCmcUNYfep+4ONCba3hk3A67ZBj5
 sPM0jOOSLlV3QZOkEjnx+C42zoW2IbhMr6G1k49/8ZjT49WwUeeXRNamiekr594uoufQ
 Kk6JYsCLNHzS7h5zGUwv2KOiiQq/NKdVJUWxmT5udoNvXB4IBZYgwN7bO8JFZPmikxNl
 7SJCntjP0XcU6R8CwcUEtXGVhVpVDS7HceXxtMC9BmiEtFM8bqGYa/e6m3P4sUk9uyTu
 uq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vC4CLxS3uATszG/9NMGUyh1mVGgnFuJ2ybR8crd545U=;
 b=h1DfqxficLA9zCQxITrUdyDcFuDhp4PQlexYbvVJiR9AnDWIeU3A1QjZQLej/jsI6k
 CUBERv3F93TyOg/tyfNIebTyffLeS0xf8DwCiPyZgjJVsiPAvHBEnn+jtfCOymBR47z7
 HKx7NgO+SyYCkVMOI3KVPnnuOaNNdsNdCJLhIsdHEeojjG/vPI45d1qLKfiQY/eAESfJ
 WsN75TghbH9xWJJCC21wz7VgOr+N7sc0EkzbW0xWmgNWdRlBrfWZ9L21U+y7aRHY16YN
 DnHDaRr6RYd/eD8WJ6ku5En9EtwvqU2OvPfWNDLbfn9sJcujcW0mov+9uXba0WnbpPPG
 G6DA==
X-Gm-Message-State: AOAM530Pz4sg+a1xUJRFSAV+UbCGh5yvR10X224p2z4hK5uWX3o0bYUg
 K4fw/DgyBA1HrXeIDmQjJ8o5a4h5iig=
X-Google-Smtp-Source: ABdhPJwjzzTC89uxCaxwB5dcpcA2KhvM1gQqJ5IRpPHmZYA3LJEWymy0goFyGYaBLttvlHOnN+SVXQ==
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr12091623wrw.33.1631534269572; 
 Mon, 13 Sep 2021 04:57:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:57:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] target/i386: Added VGIF feature
Date: Mon, 13 Sep 2021 13:57:24 +0200
Message-Id: <20210913115742.533197-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



