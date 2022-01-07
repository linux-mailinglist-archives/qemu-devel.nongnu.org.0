Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9B487E6B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:44:27 +0100 (CET)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5x2A-0003Rg-Vv
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:44:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr1-00059o-B8
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:55 -0500
Received: from [2607:f8b0:4864:20::42e] (port=41499
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqx-0007os-PC
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:53 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m1so6162452pfk.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TpHn0Fhs0LB5c3hIVLLK+G+3+OaCxi58Bs9uIsk1ZnQ=;
 b=uwZ/wfBhzUcC30H2TxBlD1vOXu/AZ0daelKzYm9CeH7G3pnMbemTBaA2/jLp8gtDbG
 vwmhK8x9B79/55ahED2+DfAZpoYZxZ6iRbNQRLwaKv+euWjz2PHS2pQ2XzuKaFy0Dhc8
 5aw3+YwSGvXwIhQpFf9dH97b92+c+kl9751c7Ydqecm+ShaqlWwQP1BNf8uJ1I1HK//e
 puxnC9v9czMhIplBt41J3qCp/d4AhScF0vF29fYLsjE1OG5eqaPj+cVGekwpIKXKalgG
 Ce9/iXSU1dz0MeYLM+/yIiEIBhOqEbqPqZT52pcizP2pk8jr7a/Gpl1J9Kg5pNBq9u7J
 zKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TpHn0Fhs0LB5c3hIVLLK+G+3+OaCxi58Bs9uIsk1ZnQ=;
 b=5IDkodbf55VKdG1M1B3C9ym70SN04k1zkXaX2t/+8ifGIjcnRFZey8qV3YXFUC+EuR
 Ajd/FFaTJvLIih/V5CDDOc4J3/0wPkf+nEMubUZ7ftcCCYwYEROIDhUfyywBxs8Oj0eH
 OLQGgLFSYnFms2zt8HawkgGQOD1cDK6gUNFCehRbWVmJ3uSeFEHKhXwhj3yYbuMAuBGF
 5JDtd09rhx3HnqXHjstPdeMu5tMQe2ubsXGdhooCZXyEIDnfvf1lzVqiIUpzpRd5OOVk
 Q4BZ1pBAmwtKOP1fSO/cweuQDfAhwNWRp4qTXsvmIugL8Rsty7YoCyrjn4daElHWqN4s
 qwhQ==
X-Gm-Message-State: AOAM533phWn151196bgnWEt0T1q+d4YGt92dvZwhKksg0AYR6ugOFj7N
 rdGbwLO+DS41k9Gf9ixiFxXcJVFEh7wj+w==
X-Google-Smtp-Source: ABdhPJwBEjPE/Dl0A1eu+5kR9EuwHBxyX1EscJxsM4b8dPWMqQFZNOyRNvS5O2p0GfLe5mHmGFTIdQ==
X-Received: by 2002:a63:8c09:: with SMTP id m9mr26845782pgd.138.1641591170524; 
 Fri, 07 Jan 2022 13:32:50 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/24] linux-user/i386: Use force_sig, force_sig_fault
Date: Fri,  7 Jan 2022 13:32:29 -0800
Message-Id: <20220107213243.212806-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
index ac0f4e3211..29dfd7cd0c 100644
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


