Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A357410916
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 03:59:17 +0200 (CEST)
Received: from localhost ([::1]:36296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRm6u-0006E0-19
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 21:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm56-0003QQ-MA
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:24 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm54-00052E-4O
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:24 -0400
Received: by mail-pg1-x532.google.com with SMTP id w8so13741935pgf.5
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qnzdMjgcBsPzYrCkXKkHqDyfkhXP0vzUSwft+EOabQ0=;
 b=JZ23efczLLbRsKzzdnBzenJ9BsCQxMkgims96ExMd9mCZ4hiw0+bsUAP+DhLeK0I4Y
 ULAKy9cuhRfNswr5yKiCPBZQaaE8dM8qz/u0lRiMe9rAF6b6lINg2M6CV//lwvKOsqzq
 j9GFcmPDEup7Ji4eSCtL6QHusnv5AvtiUZMGvmc0oYyvxR4wXFe7eRGvtPEM0CTUe/Te
 N2uOlZetBmaGPjZPD0zL9AXi02jM+KgaJAktMgDITDEFk0rutO/C+SKUkf/mXHBoxCmo
 6C/GfU/0Mtd1rnV7MFcml6qxq8UYw1II74XAfd08p4ROurwuvDQIffoWPwNTNrTCzwEH
 OQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qnzdMjgcBsPzYrCkXKkHqDyfkhXP0vzUSwft+EOabQ0=;
 b=8Bo+JlEEAv6VDxeprikpkZH8+FgS3cl1NNvIOe+8TSaz08qMaVNBdbYlrVoWjSlls7
 6ETeArl2+WnBNFf+Zk7sa7QZNL0qC2CqRTwNHX6Ks9MMg9wNMDIZgURWMNZV7mChDL54
 eg/gej5RbabAQ9NMi/eu2BttN6JMe7iNeq5iUo5uFswFOYdpRTsMYHKeVKq850Mv917c
 Eq+Djh2qXfaoCmLC5ttxqRgXlNoUnGI8eMZnX9zUioeBOAqEFkQmmx1bJ3xj6UuEeRA/
 dLCqMjI92ULe+JjWYkD7jUsVrydRw1iiYUuZ/pUgihznV8jOjaW/P/d6J5T/qBwrhnRe
 6RHw==
X-Gm-Message-State: AOAM5306u5lM2dwq85+WUqvSBKmmeKDjlxSnITBl90rBj7vx+6S4nFDm
 a1U/WCvsS44rdHgkDOAB1XRnrhBnTWUMNQ==
X-Google-Smtp-Source: ABdhPJw3zGHGNe83bvU6WDur+i55U2TGG/aK9lJ80qE/nqEux+JZP4GuCfHggeMrcisU3Eh7Lw2bRQ==
X-Received: by 2002:a63:df06:: with SMTP id u6mr17430017pgg.148.1632016640747; 
 Sat, 18 Sep 2021 18:57:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/25] linux-user/arm: Use force_sig_fault()
Date: Sat, 18 Sep 2021 18:56:54 -0700
Message-Id: <20210919015718.466207-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
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


