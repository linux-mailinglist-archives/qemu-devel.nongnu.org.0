Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468CD3EB609
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:21:06 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEX7R-0000TZ-8k
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4m-00061h-6y
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4j-0001BH-MV
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id 6so6880892wme.5
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJIpsv1H5kq5YSGMr5mAwnnyIFFq6TrksBVoWM/ILDs=;
 b=eCR11VKxyvxY/s1Xko6dkF1JxhyzTULV3anFfycSnEX6mGtPr/tFCz2Wv9GRutP4cK
 FlP1u2jv+Pi+Omogx2TgVfOPA5tDgw/wpzZEgW08Oj5Fy8EWxzLdyrpgh24kNAuI9Nfg
 37ue0u5jMNvvTmvQ8dQxyRvWUX84yjn+5KpGFNQMiYLXmQ/5Ou58Bzc1YJYbPVNRnAbI
 4HE1Utx8fI/n8fB9LzBOnVwlfyG36RaRga2jb3CLYeYmCrLqSJDqmClJJRXwLjnb44eU
 1LLZF9HlrLTN92eTnFGHh84oKpfhSke0vPM1hmnT4XRxj9e3ZuEYsVrNFve9jXdKnU2o
 WvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJIpsv1H5kq5YSGMr5mAwnnyIFFq6TrksBVoWM/ILDs=;
 b=YRQVFknYsaHPGO8dDH9crxzaKfJIgrSn1vDnpiPw3eqeKMivivvMBSLrcoh7uTtm2C
 zYDu/dcVwH3FZU9aJWsua/NgMX3eJkshX83cE1ChxLDqXGfobo1aN7YnYSmXz1KRsNiE
 h6wLS3C0rzCod0wIf/Ii9WVpoOdwcImz6BouZF7tArps4ZnkO+mM6S+mxmOmIM4BmNDS
 027DJHM20Yh30eWbpnjmqc+1G+CFf/SY5wEoJfYp3FV6v0t9QTvEsagMu+2a13b9JjEh
 EBf0PFtH3KQhdpDGHLH9xcWW9cqJHi63pnHUMqdgcCc0PB/Y4o9TN+s/jIMFyJ91+pY+
 yGPA==
X-Gm-Message-State: AOAM530ftmqCrAbuciXS0qdTrVgBGvuP6VP0q5PiaHMaNQm1dTySbVIx
 KWVGN4m/HqvHLzfmAbiLtf/yIg==
X-Google-Smtp-Source: ABdhPJwrWwVMbShO6Kj9waS5iM74iY/68w0HA6Or7hCFlLExBdBaLeN86Dp2WhMArwxN91XYX9346w==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr2575581wmc.15.1628860696444;
 Fri, 13 Aug 2021 06:18:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 6/7] linux-user/arm: Use force_sig_fault()
Date: Fri, 13 Aug 2021 14:18:08 +0100
Message-Id: <20210813131809.28655-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new force_sig_fault() function instead of setting up
a target_siginfo_t and calling queue_signal().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I threw in a comment confirming that the si_addr value for the "bad
SWI immediate" SIGILL really is different from the PC value reported
in the ucontext_t and resumed from if the handler returns, because it
looked like a bug to me when I was reading the code...
---
 linux-user/arm/cpu_loop.c | 54 ++++++++++++---------------------------
 1 file changed, 16 insertions(+), 38 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 44324976196..d4b4f0c71fc 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
@@ -92,7 +93,6 @@ static void arm_kernel_cmpxchg64_helper(CPUARMState *env)
 {
     uint64_t oldval, newval, val;
     uint32_t addr, cpsr;
-    target_siginfo_t info;
 
     /* Based on the 32 bit code in do_kernel_trap */
 
@@ -141,12 +141,9 @@ segv:
     end_exclusive();
     /* We get the PC of the entry address - which is as good as anything,
        on a real kernel what you get depends on which mode it uses. */
-    info.si_signo = TARGET_SIGSEGV;
-    info.si_errno = 0;
     /* XXX: check env->error_code */
-    info.si_code = TARGET_SEGV_MAPERR;
-    info._sifields._sigfault._addr = env->exception.vaddress;
-    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
+                    env->exception.vaddress);
 }
 
 /* Handle a jump to the kernel code page.  */
@@ -284,8 +281,6 @@ void cpu_loop(CPUARMState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n, insn;
-    target_siginfo_t info;
-    uint32_t addr;
     abi_ulong ret;
 
     for(;;) {
@@ -320,11 +315,8 @@ void cpu_loop(CPUARMState *env)
                     break;
                 }
 
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPN;
-                info._sifields._sigfault._addr = env->regs[15];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN,
+                                env->regs[15]);
             }
             break;
         case EXCP_SWI:
@@ -392,18 +384,14 @@ void cpu_loop(CPUARMState *env)
                              * Otherwise SIGILL. This includes any SWI with
                              * immediate not originally 0x9fxxxx, because
                              * of the earlier XOR.
+                             * Like the real kernel, we report the addr of the
+                             * SWI in the siginfo si_addr but leave the PC
+                             * pointing at the insn after the SWI.
                              */
-                            info.si_signo = TARGET_SIGILL;
-                            info.si_errno = 0;
-                            info.si_code = TARGET_ILL_ILLTRP;
-                            info._sifields._sigfault._addr = env->regs[15];
-                            if (env->thumb) {
-                                info._sifields._sigfault._addr -= 2;
-                            } else {
-                                info._sifields._sigfault._addr -= 4;
-                            }
-                            queue_signal(env, info.si_signo,
-                                         QEMU_SI_FAULT, &info);
+                            abi_ulong faultaddr = env->regs[15];
+                            faultaddr -= env->thumb ? 2 : 4;
+                            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
+                                            faultaddr);
                         }
                         break;
                     }
@@ -434,24 +422,14 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            addr = env->exception.vaddress;
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = addr;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            /* XXX: check env->error_code */
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
+                            env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
         excp_debug:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            info._sifields._sigfault._addr = env->regs[15];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[15]);
             break;
         case EXCP_KERNEL_TRAP:
             if (do_kernel_trap(env))
-- 
2.20.1


