Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02966410927
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:06:12 +0200 (CEST)
Received: from localhost ([::1]:53394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmDb-0000n1-39
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5E-0003ky-O7
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:32 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5D-0005A5-2c
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:32 -0400
Received: by mail-pg1-x535.google.com with SMTP id e7so13753826pgk.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yKwU/najjPLz/Qvjmwc10h7jN4lkN7q52Z9b9OScyO8=;
 b=EcgpzpNqNxynH+n4BW0bNwk5LKZY2uP+L12UHowlt7JkG9D8pYM7VkE2A4hSsm38og
 Rcab7wWhdZ8PtI9RE9M5HRgZiOont4OEhTyQeDYHk4Py1e2xvCD6X+cr/gkmWJTcaV9a
 c7zA3gdLoPPhMdVjodjsmYwBP/n0g64nq626UIiVeF+hdP2WcLemoQXXgYN713YVo1mP
 Dix72tVEr2hpP380Uyq7Ws4/AaA0W72BWBPCrFzEvzptwI7obLJGn1S/8jAfX1p7iVs2
 EfK6ZLAJPVXBOz4OjkBX14p1TPXR9sjBOHU2WjhyKHRYYGW8XgfoZww/LpiS3UBiGy+h
 xfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yKwU/najjPLz/Qvjmwc10h7jN4lkN7q52Z9b9OScyO8=;
 b=INPUefGcJlFsTcBkBgC32g+yY/XGyVPSHBRAt437GblEP47kpnFBfrn/Ow0XkImQ2U
 T+O5L/lXd4NElSelDa/vXK0ahKuKkioVS5gf9buEuTK5mgBf5tYzjRFicgQduoQTQdi1
 DX9wyTI2J8UrjvbU5uMkyLNM9/jYg2ZyXZgVevFrQVwP0ddDU0UOgzZQVsvOshN+gMbI
 CpaiVt1KflJkK10ndol57MTCzZyCMDQ+VdkbkKkVqFDUpM8lFEAQnG3cNUfFXPRnEETH
 okOdTyt9RFvc1pfynYSDFTunPuIef3vljSdCkpGInjXFTagiPCxZb5QJTamzcZJiUStf
 nROg==
X-Gm-Message-State: AOAM531X+XekPaWC4mqxkaDmfqLaZMFqokAd6bY7Cw0rOvn166Pt4mwd
 sfR8uuN9rgn2V4Rk3SiXCtIULUtznd2jKg==
X-Google-Smtp-Source: ABdhPJyGtZBO5YzZk4zCjDvD+6gbhQdEyqjKMh2+Mr8Upg3K6+KJN4XlYoqnR9YUN7ifcPLfJ/kNOw==
X-Received: by 2002:a63:7211:: with SMTP id n17mr17079586pgc.456.1632016648786; 
 Sat, 18 Sep 2021 18:57:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/25] linux-user/i386: Use force_sig, force_sig_fault
Date: Sat, 18 Sep 2021 18:57:04 -0700
Message-Id: <20210919015718.466207-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Replace the local gen_signal with the generic functions that match
how the kernel raises signals. Fill in the missing PC for SIGTRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/cpu_loop.c | 48 +++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 5866e98441..cd6c2b032d 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 /***********************************************************/
 /* CPUX86 core interface */
@@ -81,17 +82,6 @@ static void set_idt(int n, unsigned int dpl)
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
@@ -104,7 +94,7 @@ static bool write_ok_or_segv(CPUX86State *env, abi_ptr addr, size_t len)
     }
 
     env->error_code = PG_ERROR_W_MASK | PG_ERROR_U_MASK;
-    gen_signal(env, TARGET_SIGSEGV, TARGET_SEGV_MAPERR, addr);
+    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, addr);
     return false;
 }
 
@@ -190,8 +180,7 @@ static void emulate_vsyscall(CPUX86State *env)
     return;
 
  sigsegv:
-    /* Like force_sig(SIGSEGV).  */
-    gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+    force_sig(TARGET_SIGSEGV);
 }
 #endif
 
@@ -263,53 +252,54 @@ void cpu_loop(CPUX86State *env)
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


