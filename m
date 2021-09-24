Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A0417933
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:05:54 +0200 (CEST)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mToe1-0003AR-CL
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXx-0002dw-2T
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:38 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:47096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXt-0006tc-Fz
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:36 -0400
Received: by mail-qv1-xf30.google.com with SMTP id gs10so6621211qvb.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ix3gXlqnervNFIKDwCYoxZx+7RHohDod9PWp4e0JtEc=;
 b=CNvJ3/MsUGCgoyu/DfdaXe5WtCXORRd+leVdiKK8yh9MRBeX2Kplbflijtd4dlTjuU
 +TYc7Et+MVtZT8flopOOyyNfnwZqDNQZ6kVHCpWpchsKDm0uBA8nzmKH804t8xhW7ICD
 XU6anPWeYSgVzTv491HK+N/q76I8ApcDU+d9SPKcVlh1q0cTyBy3/9m9TPR7eZiECkoK
 9CG6VEKsYHF6TOvRwB18jFzcNU5eJjd5SLLdzk4YPSL2RejOKTFHlJewBzoAo2Q7mmhd
 f6Z46t8WVHDy1xgF4ZkMJBhpyXjmdEOE9RWhdAXG6XLu2wRPXvCgRkskpODNnMGYh44I
 Q4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ix3gXlqnervNFIKDwCYoxZx+7RHohDod9PWp4e0JtEc=;
 b=6zUK6Jp6M+7uUvYsaiT1FOOlPi5THu2IPK2qmymnkIbNeT6hZcuRA01VbEEJrLAaF/
 /pQuQzSY7QJf5iJyuvLSurE7BD1XPV/8bTua1tpUT1w4FAfdx687LMRO5XFWo7D8Ni3Y
 IYZz9z8b/FBe0NIX5SnkWeeKrSSeau4vW7fYTPqP/VXOHHWVLDtUT9cQ5fVaPV1G/H34
 sVahIkCe+s1HWCjQEQnMs5HUa5BLAl0J2u50iMV6lXuadKSOMqRGbtuvaLKpVCK1vpzV
 tDHwHNvnWHEYJqYx5wAc+FCqB0jemQ4tGvSOu315gsLUkJqBMCCxz3MPpwg+TIz2xXt2
 HJDw==
X-Gm-Message-State: AOAM5335emqMvbJ1Krteik7VvIFiPkpk3gPVUkP3ojExFux3oWPw3iHM
 AKMUpTQlOyCklKXVTBwDxr2GGrm3XbJrYg==
X-Google-Smtp-Source: ABdhPJx0cwDx/KCohLgI6M+NxwXmPD9FH3fOq0XlGoyIAXjHXWpG50ZwqW72YltK2e2iZMm7+b86vQ==
X-Received: by 2002:a0c:c293:: with SMTP id b19mr2799216qvi.22.1632502771245; 
 Fri, 24 Sep 2021 09:59:31 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/27] linux-user/arm: Drop "_v2" from symbols in signal.c
Date: Fri, 24 Sep 2021 12:59:03 -0400
Message-Id: <20210924165926.752809-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we no longer support "v1", there's no need to distinguish "v2".

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/signal.c | 155 +++++++++++++++++-----------------------
 1 file changed, 65 insertions(+), 90 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index d0940bab47..ed7d1d80bb 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -46,7 +46,7 @@ struct target_sigcontext {
     abi_ulong fault_address;
 };
 
-struct target_ucontext_v2 {
+struct target_ucontext {
     abi_ulong tuc_flags;
     abi_ulong tuc_link;
     target_stack_t tuc_stack;
@@ -90,16 +90,16 @@ struct target_iwmmxt_sigframe {
 #define TARGET_VFP_MAGIC 0x56465001
 #define TARGET_IWMMXT_MAGIC 0x12ef842a
 
-struct sigframe_v2
+struct sigframe
 {
-    struct target_ucontext_v2 uc;
+    struct target_ucontext uc;
     abi_ulong retcode[4];
 };
 
-struct rt_sigframe_v2
+struct rt_sigframe
 {
     struct target_siginfo info;
-    struct target_ucontext_v2 uc;
+    struct target_ucontext uc;
     abi_ulong retcode[4];
 };
 
@@ -270,7 +270,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     return 0;
 }
 
-static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
+static abi_ulong *setup_sigframe_vfp(abi_ulong *regspace, CPUARMState *env)
 {
     int i;
     struct target_vfp_sigframe *vfpframe;
@@ -287,8 +287,7 @@ static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
     return (abi_ulong*)(vfpframe+1);
 }
 
-static abi_ulong *setup_sigframe_v2_iwmmxt(abi_ulong *regspace,
-                                           CPUARMState *env)
+static abi_ulong *setup_sigframe_iwmmxt(abi_ulong *regspace, CPUARMState *env)
 {
     int i;
     struct target_iwmmxt_sigframe *iwmmxtframe;
@@ -307,15 +306,15 @@ static abi_ulong *setup_sigframe_v2_iwmmxt(abi_ulong *regspace,
     return (abi_ulong*)(iwmmxtframe+1);
 }
 
-static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
-                              target_sigset_t *set, CPUARMState *env)
+static void setup_sigframe(struct target_ucontext *uc,
+                           target_sigset_t *set, CPUARMState *env)
 {
     struct target_sigaltstack stack;
     int i;
     abi_ulong *regspace;
 
     /* Clear all the bits of the ucontext we don't use.  */
-    memset(uc, 0, offsetof(struct target_ucontext_v2, tuc_mcontext));
+    memset(uc, 0, offsetof(struct target_ucontext, tuc_mcontext));
 
     memset(&stack, 0, sizeof(stack));
     target_save_altstack(&stack, env);
@@ -325,10 +324,10 @@ static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
     /* Save coprocessor signal frame.  */
     regspace = uc->tuc_regspace;
     if (cpu_isar_feature(aa32_vfp_simd, env_archcpu(env))) {
-        regspace = setup_sigframe_v2_vfp(regspace, env);
+        regspace = setup_sigframe_vfp(regspace, env);
     }
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
-        regspace = setup_sigframe_v2_iwmmxt(regspace, env);
+        regspace = setup_sigframe_iwmmxt(regspace, env);
     }
 
     /* Write terminating magic word */
@@ -339,10 +338,10 @@ static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
     }
 }
 
-static void setup_frame_v2(int usig, struct target_sigaction *ka,
-                           target_sigset_t *set, CPUARMState *regs)
+void setup_frame(int usig, struct target_sigaction *ka,
+                 target_sigset_t *set, CPUARMState *regs)
 {
-    struct sigframe_v2 *frame;
+    struct sigframe *frame;
     abi_ulong frame_addr = get_sigframe(ka, regs, sizeof(*frame));
 
     trace_user_setup_frame(regs, frame_addr);
@@ -350,10 +349,10 @@ static void setup_frame_v2(int usig, struct target_sigaction *ka,
         goto sigsegv;
     }
 
-    setup_sigframe_v2(&frame->uc, set, regs);
+    setup_sigframe(&frame->uc, set, regs);
 
     if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v2, retcode))) {
+                     frame_addr + offsetof(struct sigframe, retcode))) {
         goto sigsegv;
     }
 
@@ -364,51 +363,38 @@ sigsegv:
     force_sigsegv(usig);
 }
 
-void setup_frame(int usig, struct target_sigaction *ka,
-                 target_sigset_t *set, CPUARMState *regs)
-{
-    setup_frame_v2(usig, ka, set, regs);
-}
-
-static void setup_rt_frame_v2(int usig, struct target_sigaction *ka,
-                              target_siginfo_t *info,
-                              target_sigset_t *set, CPUARMState *env)
-{
-    struct rt_sigframe_v2 *frame;
-    abi_ulong frame_addr = get_sigframe(ka, env, sizeof(*frame));
-    abi_ulong info_addr, uc_addr;
-
-    trace_user_setup_rt_frame(env, frame_addr);
-    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto sigsegv;
-    }
-
-    info_addr = frame_addr + offsetof(struct rt_sigframe_v2, info);
-    uc_addr = frame_addr + offsetof(struct rt_sigframe_v2, uc);
-    tswap_siginfo(&frame->info, info);
-
-    setup_sigframe_v2(&frame->uc, set, env);
-
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v2, retcode))) {
-        goto sigsegv;
-    }
-
-    env->regs[1] = info_addr;
-    env->regs[2] = uc_addr;
-
-    unlock_user_struct(frame, frame_addr, 1);
-    return;
-sigsegv:
-    unlock_user_struct(frame, frame_addr, 1);
-    force_sigsegv(usig);
-}
-
 void setup_rt_frame(int usig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUARMState *env)
 {
-    setup_rt_frame_v2(usig, ka, info, set, env);
+    struct rt_sigframe *frame;
+    abi_ulong frame_addr = get_sigframe(ka, env, sizeof(*frame));
+    abi_ulong info_addr, uc_addr;
+
+    trace_user_setup_rt_frame(env, frame_addr);
+    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
+        goto sigsegv;
+    }
+
+    info_addr = frame_addr + offsetof(struct rt_sigframe, info);
+    uc_addr = frame_addr + offsetof(struct rt_sigframe, uc);
+    tswap_siginfo(&frame->info, info);
+
+    setup_sigframe(&frame->uc, set, env);
+
+    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
+                     frame_addr + offsetof(struct rt_sigframe, retcode))) {
+        goto sigsegv;
+    }
+
+    env->regs[1] = info_addr;
+    env->regs[2] = uc_addr;
+
+    unlock_user_struct(frame, frame_addr, 1);
+    return;
+sigsegv:
+    unlock_user_struct(frame, frame_addr, 1);
+    force_sigsegv(usig);
 }
 
 static int
@@ -441,7 +427,7 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     return err;
 }
 
-static abi_ulong *restore_sigframe_v2_vfp(CPUARMState *env, abi_ulong *regspace)
+static abi_ulong *restore_sigframe_vfp(CPUARMState *env, abi_ulong *regspace)
 {
     int i;
     abi_ulong magic, sz;
@@ -471,8 +457,8 @@ static abi_ulong *restore_sigframe_v2_vfp(CPUARMState *env, abi_ulong *regspace)
     return (abi_ulong*)(vfpframe + 1);
 }
 
-static abi_ulong *restore_sigframe_v2_iwmmxt(CPUARMState *env,
-                                             abi_ulong *regspace)
+static abi_ulong *restore_sigframe_iwmmxt(CPUARMState *env,
+                                          abi_ulong *regspace)
 {
     int i;
     abi_ulong magic, sz;
@@ -496,9 +482,9 @@ static abi_ulong *restore_sigframe_v2_iwmmxt(CPUARMState *env,
     return (abi_ulong*)(iwmmxtframe + 1);
 }
 
-static int do_sigframe_return_v2(CPUARMState *env,
-                                 target_ulong context_addr,
-                                 struct target_ucontext_v2 *uc)
+static int do_sigframe_return(CPUARMState *env,
+                              target_ulong context_addr,
+                              struct target_ucontext *uc)
 {
     sigset_t host_set;
     abi_ulong *regspace;
@@ -506,19 +492,20 @@ static int do_sigframe_return_v2(CPUARMState *env,
     target_to_host_sigset(&host_set, &uc->tuc_sigmask);
     set_sigmask(&host_set);
 
-    if (restore_sigcontext(env, &uc->tuc_mcontext))
+    if (restore_sigcontext(env, &uc->tuc_mcontext)) {
         return 1;
+    }
 
     /* Restore coprocessor signal frame */
     regspace = uc->tuc_regspace;
     if (cpu_isar_feature(aa32_vfp_simd, env_archcpu(env))) {
-        regspace = restore_sigframe_v2_vfp(env, regspace);
+        regspace = restore_sigframe_vfp(env, regspace);
         if (!regspace) {
             return 1;
         }
     }
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
-        regspace = restore_sigframe_v2_iwmmxt(env, regspace);
+        regspace = restore_sigframe_iwmmxt(env, regspace);
         if (!regspace) {
             return 1;
         }
@@ -535,10 +522,10 @@ static int do_sigframe_return_v2(CPUARMState *env,
     return 0;
 }
 
-static long do_sigreturn_v2(CPUARMState *env)
+long do_sigreturn(CPUARMState *env)
 {
     abi_ulong frame_addr;
-    struct sigframe_v2 *frame = NULL;
+    struct sigframe *frame = NULL;
 
     /*
      * Since we stacked the signal on a 64-bit boundary,
@@ -555,10 +542,9 @@ static long do_sigreturn_v2(CPUARMState *env)
         goto badframe;
     }
 
-    if (do_sigframe_return_v2(env,
-                              frame_addr
-                              + offsetof(struct sigframe_v2, uc),
-                              &frame->uc)) {
+    if (do_sigframe_return(env,
+                           frame_addr + offsetof(struct sigframe, uc),
+                           &frame->uc)) {
         goto badframe;
     }
 
@@ -571,15 +557,10 @@ badframe:
     return -TARGET_QEMU_ESIGRETURN;
 }
 
-long do_sigreturn(CPUARMState *env)
-{
-    return do_sigreturn_v2(env);
-}
-
-static long do_rt_sigreturn_v2(CPUARMState *env)
+long do_rt_sigreturn(CPUARMState *env)
 {
     abi_ulong frame_addr;
-    struct rt_sigframe_v2 *frame = NULL;
+    struct rt_sigframe *frame = NULL;
 
     /*
      * Since we stacked the signal on a 64-bit boundary,
@@ -596,10 +577,9 @@ static long do_rt_sigreturn_v2(CPUARMState *env)
         goto badframe;
     }
 
-    if (do_sigframe_return_v2(env,
-                              frame_addr
-                              + offsetof(struct rt_sigframe_v2, uc),
-                              &frame->uc)) {
+    if (do_sigframe_return(env,
+                           frame_addr + offsetof(struct rt_sigframe, uc),
+                           &frame->uc)) {
         goto badframe;
     }
 
@@ -611,8 +591,3 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
-
-long do_rt_sigreturn(CPUARMState *env)
-{
-    return do_rt_sigreturn_v2(env);
-}
-- 
2.25.1


