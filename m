Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1A47B4E7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:19 +0100 (CET)
Received: from localhost ([::1]:54724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ15-0003j2-0T
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:16:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqn-0000Pk-I8
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:41 -0500
Received: from [2607:f8b0:4864:20::436] (port=40715
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPql-0005uO-UB
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:41 -0500
Received: by mail-pf1-x436.google.com with SMTP id z6so9792091pfe.7
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oryq+LuMrMDBeDTMJmIY7vqQWuye0TU114y1grFNoXo=;
 b=nP5Z9l9VHulFIBNRYSElE9KBVIGj+lJk4C+aZNcPfrw+B8VRYoFZodYOgNog0bC3PP
 yxyvMyeo/502IDZY+BTzvSnfJCD0OJK5WUqWfBLsMDGraa+lh8VStgD/5VJa70VyqFvg
 s/LP0crL67waByxk8uoUzmnUzPnfxzIGv0bZMfsULMeJHZzsOI3gC9k6m/ThbcTUgood
 lquriqqcbXDpWYiuq5TGwdAIhNf6LcJqKedc+A45FOg5AgJX52VQTrE+FTDuVMAt1djN
 SSc9UxiJL5x/jUKwvEpgVmiBjw3G8gFKERpjAUTYw+E1Vda6fHNlSIdKezxH5wwVWfN7
 dHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oryq+LuMrMDBeDTMJmIY7vqQWuye0TU114y1grFNoXo=;
 b=DJxYcCAMknpvPH3NgtpyFgUYvKyfc+LoT4d5o283awKjwazYQBp3Lm/VQu8W4RGbmr
 aiV/LDtTRj7hfE1xWVjrJbPI3eHGGugD2PgGbew9X8AMp5ITG5NDOQq8LscJpHKu9ub3
 nvEdccd6rp78JhFTIwSh4nMeoyvb0FcG46luGgjX8Re3u0IgBYv/MlEnKun2RcSM7EWO
 TBZrgoSnvKbT0yhVMpOrig909RZrTQpZnOK+z6d8hHtPExFqHtx7KfVrLyQ8QgOsgw8A
 yc9zLg/01IAemUqaYTdQE0lCQP2UwKfW6+7A4L13/HqkjZ9fNpux5FrvwXd3fvmQzucl
 6akQ==
X-Gm-Message-State: AOAM531ABSHprhnjxOy4LjyXFmSF06JYIcXXhXbe6xe41gaUj6XYVULw
 pcRb8dpO1eSeCwlkOuQNLXliohikNYyqGw==
X-Google-Smtp-Source: ABdhPJxXCOEZF9BQg1/4RvG+5hgVIn06CMDNbAxslce3nBb75ZyfSxm4+ii59VtBdEJ3pKWh1WCs5A==
X-Received: by 2002:a05:6a00:10cf:b0:4a3:124d:bb81 with SMTP id
 d15-20020a056a0010cf00b004a3124dbb81mr18145444pfu.75.1640034338654; 
 Mon, 20 Dec 2021 13:05:38 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/24] linux-user/i386: Use force_sig, force_sig_fault
Date: Mon, 20 Dec 2021 13:05:14 -0800
Message-Id: <20211220210529.150423-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the local gen_signal with the generic functions that match
how the kernel raises signals. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/cpu_loop.c | 47 +++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index a372cfe1b2..879d44b490 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -84,17 +84,6 @@ static void set_idt(int n, unsigned int dpl)
 }
 #endif
 
-static void gen_signal(CPUX86State *env, int sig, int code, abi_ptr addr)
-{
-    target_siginfo_t info = {
-        .si_signo = sig,
-        .si_code = code,
-        ._sifields._sigfault._addr = addr
-    };
-
-    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-}
-
 #ifdef TARGET_X86_64
 static bool write_ok_or_segv(CPUX86State *env, abi_ptr addr, size_t len)
 {
@@ -107,7 +96,7 @@ static bool write_ok_or_segv(CPUX86State *env, abi_ptr addr, size_t len)
     }
 
     env->error_code = PG_ERROR_W_MASK | PG_ERROR_U_MASK;
-    gen_signal(env, TARGET_SIGSEGV, TARGET_SEGV_MAPERR, addr);
+    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, addr);
     return false;
 }
 
@@ -193,8 +182,7 @@ static void emulate_vsyscall(CPUX86State *env)
     return;
 
  sigsegv:
-    /* Like force_sig(SIGSEGV).  */
-    gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+    force_sig(TARGET_SIGSEGV);
 }
 #endif
 
@@ -266,53 +254,54 @@ void cpu_loop(CPUX86State *env)
 #endif
         case EXCP0B_NOSEG:
         case EXCP0C_STACK:
-            gen_signal(env, TARGET_SIGBUS, TARGET_SI_KERNEL, 0);
+            force_sig(TARGET_SIGBUS);
             break;
         case EXCP0D_GPF:
             /* XXX: potential problem if ABI32 */
             if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-            gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+            force_sig(TARGET_SIGSEGV);
             break;
         case EXCP0E_PAGE:
-            gen_signal(env, TARGET_SIGSEGV,
-                       (env->error_code & 1 ?
-                        TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR),
-                       env->cr[2]);
+            force_sig_fault(TARGET_SIGSEGV,
+                            (env->error_code & PG_ERROR_P_MASK ?
+                             TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR),
+                            env->cr[2]);
             break;
         case EXCP00_DIVZ:
             if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-            gen_signal(env, TARGET_SIGFPE, TARGET_FPE_INTDIV, env->eip);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->eip);
             break;
         case EXCP01_DB:
+            if (maybe_handle_vm86_trap(env, trapnr)) {
+                break;
+            }
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
+            break;
         case EXCP03_INT3:
             if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-            if (trapnr == EXCP01_DB) {
-                gen_signal(env, TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
-            } else {
-                gen_signal(env, TARGET_SIGTRAP, TARGET_SI_KERNEL, 0);
-            }
+            force_sig(TARGET_SIGTRAP);
             break;
         case EXCP04_INTO:
         case EXCP05_BOUND:
             if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-            gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+            force_sig(TARGET_SIGSEGV);
             break;
         case EXCP06_ILLOP:
-            gen_signal(env, TARGET_SIGILL, TARGET_ILL_ILLOPN, env->eip);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->eip);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            gen_signal(env, TARGET_SIGTRAP, TARGET_TRAP_BRKPT, 0);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.25.1


