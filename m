Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546EC403790
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:09:50 +0200 (CEST)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuWb-0006ah-7O
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRk-0006NI-IA
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:48 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRg-0002t5-EY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q11so2383569wrr.9
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBf010dxB3czTGLExguHE9lNbcC2xzM9osq4hO9COOE=;
 b=FHf0PE3myyZg2p2t50MzInogsWdFdUaZgyPZbNKmv/hfBjxVss7UjrYv+tpybpZK45
 AtDJ/wWWypksNlPw4RjBg3A+6LmOg+dOMKuExtNycs2kW3Nhot+OWfUFjIKnz3eeIjGA
 7M8mGSyDjGo1IAfzR6OBITiSdVE4rn3cuEwaG0PqCH8lPfCnQFf4j38zWxOMugX6w061
 vYtX9fT6+5u3PjFq4EPf/hr+iI34ZG8QpuVb+cMu5YM3mMp6Nd2T7SAppaM/opWdBjnb
 8q9sUc/oPPP2mIg+VecSQ8sfEEsxMnvNs3+5TkPgw5VauDG7u8FAb48ZqY0knQf70uDw
 0PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IBf010dxB3czTGLExguHE9lNbcC2xzM9osq4hO9COOE=;
 b=SJHrlJ+pOX3+9zLNfo3iAiLE2CeEq18+CjH6zpnOlXm62W3P4hE0VDEtjf+4Y9DzRc
 PD5yfqCZ9jX4C32Lc1RejajlbCZbnzsUKPCb59hxA2MT9yUPu93dTcCxA7yWGCzaNbuy
 sxow3RWYOwgXvYjW1ImI1aXFlYXt9fi63tKyqiFf5AvaYWzKIPiUTCyztaRqIdKUIN6z
 WLO1lypQDk1N4RYdmaelBGlG/u+/XJI5uR1+8cTk1qdCoFyP2JZCqVl08rOV3w/h8A+K
 UuhrcAMq40OadBB0ED/3dLINohZN9diUMjrFhbg/WuEs87t5AZvbc5AAlWV8wjW1IzmH
 BPgQ==
X-Gm-Message-State: AOAM533AoRFN606nM5n/uMCDchoP3qrt3LHl/hPqLqZy6T40vsW5t1XU
 d9CZDk+gtENHTjAncdLQXikmQjSwwbw=
X-Google-Smtp-Source: ABdhPJwUkaXw9BwMTRx/9xKzPvhJyYH3ohh71b2Y4NuzEvcUNutx/2hr3p4VE5xeYuy+R2kaQET+yA==
X-Received: by 2002:a5d:4568:: with SMTP id a8mr3096572wrc.200.1631095481579; 
 Wed, 08 Sep 2021 03:04:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 08/43] target/i386: Added vVMLOAD and vVMSAVE feature
Date: Wed,  8 Sep 2021 12:03:51 +0200
Message-Id: <20210908100426.264356-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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
index 6b09b8b62f..71ae3141c3 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2261,6 +2261,8 @@ static inline bool ctl_has_irq(CPUX86State *env)
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



