Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BCE401C2D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:19:49 +0200 (CEST)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEXM-0006ad-39
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPA-0000gY-Re
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEP8-0007Sk-It
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4981201wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iSNQrYrhZkJQvNWNc9Yo2OXojP0OjdX2UjBKeHwrwGg=;
 b=pgYoFrJFOiMS+ubtBvPibkAta91ko5pCw/7JLEIwJqcYs9ceKmnDJDwnQyW3aTo2T6
 9p0a9iRknjiSYTPdKTUL4AhJb6YQu5UuLvImZe/H1QFACV43iF6912yg/kPXCGyCPcWE
 3Ej2GD7GZW1mt7LzYF7cprhI/xj+nQvo/0t9wvp3DeENaColtJPckHITxK3kGFsORfL0
 kyxbELWcFZoMDwalgbkqWZi0fRIa5vzF72Oq7O1cVqo32NOq1fK1kB3qDUIUoueyQL7F
 tN3A/akuoAce8363I5oUDDAQyB9vVYWAMJdFISvfsS8By1fT+/7KUzOUhLv+YIh098RV
 mXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iSNQrYrhZkJQvNWNc9Yo2OXojP0OjdX2UjBKeHwrwGg=;
 b=RgQrTHBUOcQdPrSFfPCNlz5jPS4yX1OCoYUYEie0YypWtOL9gyL75bDy+XIRCaTSiE
 CU3OAvB6Fy3hG0j1QEKzePbMqpghTrHu/EpyMRiU0PHHV1gyJIyo9n2rZBjRC4oYjrrR
 fwD68tz1GX4Ye5ItSLcrqTt5u3R7ocespWv36JbdXZO+qFGJVfaw75MiM6NS7kZcomdY
 7CU9NNssnj0DhYivk8MCvGUyO9FCtJR45lrX2J6tt1J+6AReA6hcdrgmjEg8NXSS5vmQ
 n9zDon1+LVfh6YugP4Nfr/ic4L40gCLH1JA+advXTQC/tJAVIlSiGorSUa0wFVGkBZo7
 kIOA==
X-Gm-Message-State: AOAM532CAONMBKYdEfnl81TKj3nPGBOuMJydrBnHLrZZ6/L92zeDZb5J
 myVQvgZXUU2CDgC7thb9BQVAhWJb3rQ=
X-Google-Smtp-Source: ABdhPJw7aQG3mpxaC+mTjs59DZwFebnzgY7zzD7OFf2l6JiwxJ8Jhi0xx/ZGJmP3joLPA1847UOcQw==
X-Received: by 2002:a1c:acc2:: with SMTP id v185mr11375993wme.71.1630933877167; 
 Mon, 06 Sep 2021 06:11:17 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/36] target/i386: Added vVMLOAD and vVMSAVE feature
Date: Mon,  6 Sep 2021 15:10:30 +0200
Message-Id: <20210906131059.55234-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

The feature allows the VMSAVE and VMLOAD instructions to execute in guest mode without
causing a VMEXIT. (APM2 15.33.1)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                    |  2 ++
 target/i386/svm.h                    |  2 ++
 target/i386/tcg/sysemu/excp_helper.c |  2 +-
 target/i386/tcg/sysemu/svm_helper.c  | 29 ++++++++++++++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 69e722253d..573adc8c22 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2260,6 +2260,8 @@ static inline bool ctl_has_irq(CPUX86State *env)
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
+hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
+                        int *prot);
 #if defined(TARGET_X86_64) && \
     defined(CONFIG_USER_ONLY) && \
     defined(CONFIG_LINUX)
diff --git a/target/i386/svm.h b/target/i386/svm.h
index 036597a2ff..f9a785489d 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -24,6 +24,8 @@
 #define V_INTR_MASKING_SHIFT 24
 #define V_INTR_MASKING_MASK (1 << V_INTR_MASKING_SHIFT)
 
+#define V_VMLOAD_VMSAVE_ENABLED_MASK (1 << 1)
+
 #define SVM_INTERRUPT_SHADOW_MASK 1
 
 #define SVM_IOIO_STR_SHIFT 2
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index b6d940e04e..7af887be4d 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -358,7 +358,7 @@ do_check_protect_pse36:
     return error_code;
 }
 
-static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
+hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
                         int *prot)
 {
     CPUX86State *env = &X86_CPU(cs)->env;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 7bbd3a18c9..6d39611eb6 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -120,6 +120,25 @@ static inline bool virtual_gif_enabled(CPUX86State *env)
     return false;
 }
 
+static inline bool virtual_vm_load_save_enabled(CPUX86State *env, uint32_t exit_code, uintptr_t retaddr)
+{
+    uint64_t lbr_ctl;
+
+    if (likely(env->hflags & HF_GUEST_MASK)) {
+        if (likely(!(env->hflags2 & HF2_NPT_MASK)) || !(env->efer & MSR_EFER_LMA)) {
+            cpu_vmexit(env, exit_code, 0, retaddr);
+        }
+
+        lbr_ctl = x86_ldl_phys(env_cpu(env), env->vm_vmcb + offsetof(struct vmcb,
+                                                  control.lbr_ctl));
+        return (env->features[FEAT_SVM] & CPUID_SVM_V_VMSAVE_VMLOAD)
+                && (lbr_ctl & V_VMLOAD_VMSAVE_ENABLED_MASK);
+
+    }
+
+    return false;
+}
+
 static inline bool virtual_gif_set(CPUX86State *env)
 {
     return !virtual_gif_enabled(env) || (env->int_ctl & V_GIF_MASK);
@@ -431,6 +450,7 @@ void helper_vmload(CPUX86State *env, int aflag)
 {
     CPUState *cs = env_cpu(env);
     target_ulong addr;
+    int prot;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMLOAD, 0, GETPC());
 
@@ -440,6 +460,10 @@ void helper_vmload(CPUX86State *env, int aflag)
         addr = (uint32_t)env->regs[R_EAX];
     }
 
+    if (virtual_vm_load_save_enabled(env, SVM_EXIT_VMLOAD, GETPC())) {
+        addr = get_hphys(cs, addr, MMU_DATA_LOAD, &prot);
+    }
+
     qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmload! " TARGET_FMT_lx
                   "\nFS: %016" PRIx64 " | " TARGET_FMT_lx "\n",
                   addr, x86_ldq_phys(cs, addr + offsetof(struct vmcb,
@@ -473,6 +497,7 @@ void helper_vmsave(CPUX86State *env, int aflag)
 {
     CPUState *cs = env_cpu(env);
     target_ulong addr;
+    int prot;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMSAVE, 0, GETPC());
 
@@ -482,6 +507,10 @@ void helper_vmsave(CPUX86State *env, int aflag)
         addr = (uint32_t)env->regs[R_EAX];
     }
 
+    if (virtual_vm_load_save_enabled(env, SVM_EXIT_VMSAVE, GETPC())) {
+        addr = get_hphys(cs, addr, MMU_DATA_STORE, &prot);
+    }
+
     qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmsave! " TARGET_FMT_lx
                   "\nFS: %016" PRIx64 " | " TARGET_FMT_lx "\n",
                   addr, x86_ldq_phys(cs,
-- 
2.31.1



