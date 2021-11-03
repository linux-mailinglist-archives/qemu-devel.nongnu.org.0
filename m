Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B0444323
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:11:11 +0100 (CET)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGyq-0005RK-Ob
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwn-0002SD-R5
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:01 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:40614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwk-00055I-LC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:01 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id b11so3033129qvm.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNhSgXJTgMGZWBsS+vqzx7SqW7s/rfAY63sPF+SkLf0=;
 b=AdQIIOTgJ0iiEYecUpn/1TCMf6xHUtKaqEKumxWNbrsOJwQOlq45zhLaf4mLUNaP98
 3+Frh4j2DfuYuWj7A75g8G9s/Dd+2kfIIabhgKO7khIk7/gyJRqz6BFpUIUcS6aDJpdM
 UYv6AR6RbOW0meKg6qcA+BpSLEdLUPKO214PGgZ3T+ga8xs451Z6nPSrYiSCLaVl95Oq
 HRV0jHf/igyCxTIpbiHg1XuEPc4uN9w10ZTFA4SA20ZxzLfJx7r0gfXnF5G3RmuF1rL4
 QR9/O3+cJrATEBaq4drfrljfAiNIj5NQOEh8xZHYVuvPMW13ZMbasjsMgSIdjBrIgHJh
 Qokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNhSgXJTgMGZWBsS+vqzx7SqW7s/rfAY63sPF+SkLf0=;
 b=NHbe7Vu+f0/ux2+hRBvf3n/6FAglqy5l3MERoWt8FOtEBu1SciZlynO1uZo2ISOPjO
 RtR4FlIr3Dk1m9ORV8tCq5q6/FbVFnjjwKn/sg3TnfFrp10lX56AESWctQOMV2cUKAV4
 w1aGP6/Fp3nxpVQRnA+olPyCkfglQh6/8FUGUALdU54HO0DI5m5UDivRek7HvSTljs8M
 oRPDd3mNEDx3iitieCwsgnQUnuKpmFprtjcdPSH69GdRWKTaE13eOK6h0dEv4Cy22rlH
 uDAGwO/yAR7JQooi2/Ti0XNFOxl62qvCbq8eeY8HFN8Y3Klwkfxqip7030afQtuoBf8u
 zFxA==
X-Gm-Message-State: AOAM532ZHSeW662S5qdXUPb8qzOP63cHZ5aoU8wNHvArUGoH7jIMi4VO
 3AOHDndIQHDGpMAYQDtn3F4fflpjDbxUgw==
X-Google-Smtp-Source: ABdhPJwjV9qQuGpJpYBla8SWS0rLz6UY0nbtn3ZZTcEi8kXQkRvu3NUwAzNbUUryaty0CJbjTBYHcg==
X-Received: by 2002:ad4:5f88:: with SMTP id jp8mr39896296qvb.57.1635948537836; 
 Wed, 03 Nov 2021 07:08:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/23] linux-user/mips: Improve do_break
Date: Wed,  3 Nov 2021 10:08:37 -0400
Message-Id: <20211103140847.454070-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Rename to do_tr_or_bp, as per the kernel function.
Add a 'trap' argument, akin to the kernel's si_code, but clearer.
The return value is always 0, so change the return value to void.
Use force_sig and force_sig_fault.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c | 46 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index b735c99a24..7317194cc3 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -40,29 +40,25 @@ enum {
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
@@ -205,6 +201,13 @@ done_syscall:
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
@@ -257,9 +260,7 @@ done_syscall:
                     }
                 }
 
-                if (do_break(env, &info, code) != 0) {
-                    goto error;
-                }
+                do_tr_or_bp(env, code, false);
             }
             break;
         case EXCP_TRAP:
@@ -267,6 +268,13 @@ done_syscall:
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
@@ -293,9 +301,7 @@ done_syscall:
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


