Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF163F3D78
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:12:57 +0200 (CEST)
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHequ-0005Gh-A4
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaR-0007u0-U0
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:56198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaQ-0000jz-DE
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:55 -0400
Received: by mail-pj1-x102a.google.com with SMTP id mq3so9789198pjb.5
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nExu9rWHCS7f7+CKti5VQfpmql22KtPSQqzBYFW5vis=;
 b=vRlVtLkDQeuUGXNOwTJq9XxLxmc85rhdmXv+WPiq95+z9Iinopw2EkRLV/CudT6+Ak
 8cb+LW7qJ2TNEogxyg6p+YA4+RUAw8QYaEZzwS4j7mNiBL0B0wzdSY+V/1FsS9G9w3JX
 6fLb0O3a7rPwL7ST/O0ZyGpzeCEZ117+kGUNCncWxL+2CjTRWcXqv6Ya2Dcvqn3PWVat
 xBfbClHekNWiivLTrUFQQotIFNGlqjdvWalukBdZwAHnwR7qtab4tPml1VaIvQobnPUT
 DkodglcctHweytH5/U4lLbKnQkaF8bWadq5wIibjFrscaJlFl3GwND/lNgC1etc5mTrn
 xBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nExu9rWHCS7f7+CKti5VQfpmql22KtPSQqzBYFW5vis=;
 b=PKgtg/nlk+vCqWEEyzJP2qZLmVKHihgHQcdSrEVU9Id1ZQ1P9tsGhwrMr3JbbB4AaI
 rnIoyqRuoFxa6aWUzm5z65D+UBkfydVNivrtZwr9C2a53uW8LpyteNfAlMyQ541gKKSr
 ny3rhcWsYtpnzuM2dQmsjOapZU+bWtv+qC7J3AlDo9GT8x5VkAhT7tMjbfbFL2kGh93B
 JNAvGYCBCYf8s+wpRcdcKF6qONFJpbAEbXELB6UHtvLmwMdChvmpUoWmulRKdpgerk25
 cX5TphQQu7G2tlxRtPQw4yrbAJB/ECX4V/ikZWZSbzqhIDBVxzGJT4XaR035Ca1uYgjw
 jbcw==
X-Gm-Message-State: AOAM533v5PFz2a/8ECvBBhT4618cpYNFINRw77AIMOo2AQ9fTPaTODgY
 nqVeosHKkalnwV08l4h6zitzHD8pxfZgmQ==
X-Google-Smtp-Source: ABdhPJwaffrm455YIMlgCK6FFFnFtlZhmGBPgK3bgwa2gD9NRsjiVhtiA8qsezzc1oCDmGiWpayCLQ==
X-Received: by 2002:a17:90a:86cc:: with SMTP id
 y12mr1572317pjv.127.1629604553213; 
 Sat, 21 Aug 2021 20:55:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/30] linux-user/mips: Improve do_break
Date: Sat, 21 Aug 2021 20:55:29 -0700
Message-Id: <20210822035537.283193-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Rename to do_tr_or_bp, as per the kernel function.
Add a 'trap' argument, akin to the kernel's si_code, but clearer.
The return value is always 0, so change the return value to void.
Use force_sig and force_sig_fault.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c | 47 ++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9d813ece4e..797b6bf659 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "elf.h"
 #include "internal.h"
 #include "fpu_helper.h"
@@ -38,29 +39,25 @@ enum {
     BRK_DIVZERO = 7
 };
 
-static int do_break(CPUMIPSState *env, target_siginfo_t *info,
-                    unsigned int code)
+static void do_tr_or_bp(CPUMIPSState *env, unsigned int code, bool trap)
 {
-    int ret = -1;
+    target_ulong pc = env->active_tc.PC;
 
     switch (code) {
     case BRK_OVERFLOW:
+        force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, pc);
+        break;
     case BRK_DIVZERO:
-        info->si_signo = TARGET_SIGFPE;
-        info->si_errno = 0;
-        info->si_code = (code == BRK_OVERFLOW) ? FPE_INTOVF : FPE_INTDIV;
-        queue_signal(env, info->si_signo, QEMU_SI_FAULT, &*info);
-        ret = 0;
+        force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, pc);
         break;
     default:
-        info->si_signo = TARGET_SIGTRAP;
-        info->si_errno = 0;
-        queue_signal(env, info->si_signo, QEMU_SI_FAULT, &*info);
-        ret = 0;
+        if (trap) {
+            force_sig(TARGET_SIGTRAP);
+        } else {
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, pc);
+        }
         break;
     }
-
-    return ret;
 }
 
 void cpu_loop(CPUMIPSState *env)
@@ -214,6 +211,13 @@ done_syscall:
                 abi_ulong trap_instr;
                 unsigned int code;
 
+                /*
+                 * FIXME: It would be better to decode the trap number
+                 * during translate, and store it in error_code while
+                 * raising the exception.  We should not be re-reading
+                 * the opcode here.
+                 */
+
                 if (env->hflags & MIPS_HFLAG_M16) {
                     if (env->insn_flags & ASE_MICROMIPS) {
                         /* microMIPS mode */
@@ -266,9 +270,7 @@ done_syscall:
                     }
                 }
 
-                if (do_break(env, &info, code) != 0) {
-                    goto error;
-                }
+                do_tr_or_bp(env, code, false);
             }
             break;
         case EXCP_TRAP:
@@ -276,6 +278,13 @@ done_syscall:
                 abi_ulong trap_instr;
                 unsigned int code = 0;
 
+                /*
+                 * FIXME: It would be better to decode the trap number
+                 * during translate, and store it in error_code while
+                 * raising the exception.  We should not be re-reading
+                 * the opcode here.
+                 */
+
                 if (env->hflags & MIPS_HFLAG_M16) {
                     /* microMIPS mode */
                     abi_ulong instr[2];
@@ -302,9 +311,7 @@ done_syscall:
                     }
                 }
 
-                if (do_break(env, &info, code) != 0) {
-                    goto error;
-                }
+                do_tr_or_bp(env, code, true);
             }
             break;
         case EXCP_ATOMIC:
-- 
2.25.1


