Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951044433D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:16:47 +0100 (CET)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH4I-0007x8-Hw
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwj-0002EF-Hz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:57 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:38744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwh-00052J-HM
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:57 -0400
Received: by mail-qk1-x72a.google.com with SMTP id bi29so2378272qkb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oryq+LuMrMDBeDTMJmIY7vqQWuye0TU114y1grFNoXo=;
 b=ungcFu6dQhfohOTevkP7C98yW1WFl7MWaBtyB7uoVL8/tha02x9JJqIPU1xaXTiK6z
 dMn6TXV45AFwl0DdDRvmxc6fA60LrqzrtyPJHdgtSGHyIhUeq6x0rs8a6RBkdZ1fi2xi
 GjyZdiXlHJ6yA7pnb9rMmV7S58VPueP6alnYoW/dTpRc+KgsDW5pvdrhoI7Yd8WtBaFE
 PLIQ4hAICQtAufsEzX+seIjCZg69vCkrTsTw5CccXM22P9/cxfpYjMbYz3oZ8epGSs1I
 /w06ovvYP5SIcBMtOGJV8qx3boHy/waoUh6OhG+Rfw3k4/JXCWB8OSjv9VhqekmF1iNE
 YLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oryq+LuMrMDBeDTMJmIY7vqQWuye0TU114y1grFNoXo=;
 b=6uvQUu3QM5YV9LuVUV4CKVkDzDGuemDA7uIr5z2AeD3sRAzukbwkN1KVAEh8tev9Rt
 L4CRkLqUWz99eyROc6cuPyITHn2fKUqjqMbHPY3VcX0KyFXgmNAwcEgMox/pzd1lXUJa
 qLlAIF++LNtns9pr6vTexRa2+6Sri6umghSBSDcNuQkVSbmrJYxky4zKL5DYXPkutM6u
 W5GEaCyFxxcMlPc9iW5AlUZppHOISRekgKZeeXwyLvd5IPphaxiNpaD8PaHBsOnU29n9
 J1ZlQmtVsfwhEThud5+A1rXFkj51Gb/Dn1bczQvqdj/RfQopfTdBoeymNaIj9i2vbvna
 jYnA==
X-Gm-Message-State: AOAM530aX6t9OckK0cx6MZmQQ1S+lBFZImoElvu5KRooG/3OwsY4ozwr
 mZAvFjc4GioUKLIwfZjeTtC8jB29zNTh7Q==
X-Google-Smtp-Source: ABdhPJwtWEqjp1qa/E/fWaRce+h4bJBBlbXk0HAkxm2AsqNst0+QeSYtYJRARJAR7FIv+gwzk4lPxA==
X-Received: by 2002:a37:b0c6:: with SMTP id
 z189mr35320453qke.344.1635948534751; 
 Wed, 03 Nov 2021 07:08:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/23] linux-user/i386: Use force_sig, force_sig_fault
Date: Wed,  3 Nov 2021 10:08:33 -0400
Message-Id: <20211103140847.454070-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
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


