Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36693F3D63
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:02:42 +0200 (CEST)
Received: from localhost ([::1]:58494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHegz-0004zR-Tr
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaI-0007l3-HB
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:46 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaG-0000c3-So
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d17so8184185plr.12
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qnzdMjgcBsPzYrCkXKkHqDyfkhXP0vzUSwft+EOabQ0=;
 b=Q0UfAH+lsheZ+rL9/EIPlLbjIhmJghjkBazqhaoQgHeNMqmFGQFAZz0KSllGnjjhWo
 Nnu6fMjAaFalx9zKoYADERsIBoh9p/dRJ8u2gVjE5vyCCpunpOCd682TCgjtpm/XWgkA
 SPXItbBXQsMPwNV8WrTUhjztC8qj6BDNaxvmy9boZYBMftvLBYaTDVbfzdzGQrgBWjCW
 +hdD2LlNqNu+CKv0GJpfTcc6h7W9EotoamT/Z9rZOdoTZAGifB2D+wmxySyYUAIQjkCd
 0x96RiqMOjeXst+t7eJAoeoPWT+HExTLAy90wy23dngQf1o/S2sdUILsdCyNUeOipCqC
 6npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qnzdMjgcBsPzYrCkXKkHqDyfkhXP0vzUSwft+EOabQ0=;
 b=Q/VyUmgVwasbdpg6RSc4Ic9uGANmk96wK2v5rEC6eZQCKG2hlEGeQVM3NeSpF/9aWF
 y0s8ERDD6pjLVBBnyuKNDdR9+77GR3/FgRzBcbkW31DZAAmCLICzfkYn/Hb2ZiwShdCs
 IrXNQqzepeIm2zMy6xE/3J+A9Y09rG+ARaV1dkm05kJAOt2SMAtDk5NfI0nJBn/q0K1p
 3eYQiZh+TVcgf+OIkctOprMBQ1g54PzsdOJc0EK+zzNSZQTBdDpkzMdUyzcCexACgFiW
 sJ1k1Uv0PuVdMQ0P6pYy98LUuE9LqZhZJ4go3j/atduTAzEm3EWBg7LcKgjuHFzghXm4
 LB2w==
X-Gm-Message-State: AOAM533K4zj3gDSk2VTsmHbQ1BPg0zD5KkiNslzQuYxGy+QX1+/HcxDD
 N7yj+arq9fSW18uGzIw8I8byTEBOo4YCUg==
X-Google-Smtp-Source: ABdhPJwu+bTJP1ngLip0kcG4Gkl/3QROvxFrBd5Seb8lqvzX8U7MoEJCwPz2NK9uBhiIIaReyXlWXA==
X-Received: by 2002:a17:90a:5583:: with SMTP id
 c3mr12634365pji.133.1629604543624; 
 Sat, 21 Aug 2021 20:55:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/30] linux-user/arm: Use force_sig_fault()
Date: Sat, 21 Aug 2021 20:55:14 -0700
Message-Id: <20210822035537.283193-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Use the new force_sig_fault() function instead of setting up
a target_siginfo_t and calling queue_signal().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210813131809.28655-7-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 53 +++++++++++----------------------------
 1 file changed, 15 insertions(+), 38 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index b8ece169f9..d4b4f0c71f 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -93,7 +93,6 @@ static void arm_kernel_cmpxchg64_helper(CPUARMState *env)
 {
     uint64_t oldval, newval, val;
     uint32_t addr, cpsr;
-    target_siginfo_t info;
 
     /* Based on the 32 bit code in do_kernel_trap */
 
@@ -142,12 +141,9 @@ segv:
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
@@ -285,8 +281,6 @@ void cpu_loop(CPUARMState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n, insn;
-    target_siginfo_t info;
-    uint32_t addr;
     abi_ulong ret;
 
     for(;;) {
@@ -321,11 +315,8 @@ void cpu_loop(CPUARMState *env)
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
@@ -393,18 +384,14 @@ void cpu_loop(CPUARMState *env)
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
@@ -435,24 +422,14 @@ void cpu_loop(CPUARMState *env)
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
2.25.1


