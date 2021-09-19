Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B78941092C
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:08:58 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmGG-0006St-86
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5H-0003vT-Ct
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:35 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5F-0005CX-M1
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:35 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b7so12832439pfo.11
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o9vTFC0WOoEyqai3QW/OmyfUcnLrZGOVemPhfUbAQrw=;
 b=ZheWIfXkb1P9AHRdTg0Ch1xOT4vgpDnw9Wwmk+hB4zv9ItDd5FsToEb8PzPoreNNxk
 lXBboybK7BA+DhSVaVOBV/1l6f00IzqzycS9sbJNmEhZgQ+JrzqJeLfVyJrwfT6wz2GH
 8ZBe73U/CaLrcI+tPFf8ShjLqyHERQ0YZd1Bjn1TzjVgVt5m8TCcmwo2fs19UWvpwmCZ
 0O6HXes/OQPwotsS7hdcwst/G7iFitt5ZmjPpFQoS29pFs49NG3VRFDJ/K+MkBcj4z9P
 2pc6ztgCd455Og5/Ef7uKl5Ov8HJ+Vinbblzant97ur4pvouPU0B0bc0iVL7JzPCSWOM
 9Lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o9vTFC0WOoEyqai3QW/OmyfUcnLrZGOVemPhfUbAQrw=;
 b=Es3OhjKIDXfmGUbcUXsVhdeROBgZBM2NwmRXXgwOSA3tfO2kZPe7VraGcmqx+rKToy
 mf5E+jugqcevpgHXh7pVSM+++YOG7Ceyya1eT4Qm86hOKt3CI/POiz3oRsTdW81qEEFD
 2h8PmZVh6fYIl4XItOdG7AXyAGPu2M+wOSIk7F981NPzehIorqErE3FVtgHo3hu8Xz0d
 CajS26d6ubMcoGQSq27j9/kh/TGZLKXoe6zGJCDt2hgudXJNe3U7j4wBVJb5XhomNykx
 iLOkg8dWQbzPo+zpAYqcP2SNnQsepHTm7YJ+DZvRdaBovJd2QkiMD0ZLmcG2GsBQhcTN
 I37Q==
X-Gm-Message-State: AOAM530nWxOW1jeNQHwgt1mjmym+QFuGVLBbFW7vE9roN6A8JYSN8JbT
 /GD2apChaHyKWhz/1LDn5tghFCfqyBDdZA==
X-Google-Smtp-Source: ABdhPJzq1oYVMQkhGwdvVicca1RLhugiaWfoQRaw1ab0e0F2J6uBRttqGcgAfqiy4ngOTvhDC4XxQA==
X-Received: by 2002:a65:5cc3:: with SMTP id b3mr17099641pgt.97.1632016652339; 
 Sat, 18 Sep 2021 18:57:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/25] linux-user/mips: Improve do_break
Date: Sat, 18 Sep 2021 18:57:08 -0700
Message-Id: <20210919015718.466207-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: laurent@vivier.eu
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
index 40825ca566..a330dc03db 100644
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
@@ -203,6 +200,13 @@ done_syscall:
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
@@ -255,9 +259,7 @@ done_syscall:
                     }
                 }
 
-                if (do_break(env, &info, code) != 0) {
-                    goto error;
-                }
+                do_tr_or_bp(env, code, false);
             }
             break;
         case EXCP_TRAP:
@@ -265,6 +267,13 @@ done_syscall:
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
@@ -291,9 +300,7 @@ done_syscall:
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


