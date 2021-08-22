Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D78E3F3D79
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:13:02 +0200 (CEST)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHequ-0005HU-B2
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaQ-0007rb-KP
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaO-0000jA-U7
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:54 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f1so1365815plg.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KgmD/eYr3iehKDdNb5+g/qn4jDvTdLMR/PvVQX5enI=;
 b=DWTQ3qJf7dwxazOLmwmBgb3A8U/dCCP9BCCtsASL1DJsEMT45g1ENCWiUg5rgirBRw
 6LdMDAzrdv3n1n3+/j7D0QzM2lMIDploxnsOhIn8wSSnBmCOUyt2zaVle/wQU7ZECLSj
 DHTNgnnet+83mxemyVi93V78jdMi0K6ITt2YqW2u4ki02tzqGM7eRQo/WMu2wxMoZq/b
 xX1isnet37EEelqei6Ch4MXYM50+rlg9Iss5VVo60Z3iJlVeZqn5UiNjPEjR+yLQNelk
 NdT+9Z1kAEtmcSL68dExR+IwfcYCxRjSc4ds2OZF4rHoCLno9jEX5SB3p73bo4SoXDkw
 8dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KgmD/eYr3iehKDdNb5+g/qn4jDvTdLMR/PvVQX5enI=;
 b=hfwD55xYysk3+wLkM5wAJZHbVjXiMaAL0xsnvYtHsLrFoNHjQs89u1XK4lM0XI329A
 46r/zC2HUCSvz/A17C6GWZVFrTsmigKRKhGmHGZPCbOBbf7yqVhZXZUwuvAyTDnoCkEj
 +9qM32uZwmUp9DyRypARtjTu7qiU1bpRiJunE/Tn+XJx9c012s3xaEPoMbEkH83WZQga
 FCAYQHCJaY6gNr+nQx2tmPWrhGUpCs880XoWvZ1MrSndypy+w60qMo2QaHP1jq8pE7G4
 Ko2NMpczdSnmwjOQ9HelebJhL/PLcyerogGlusRVJlF7XcvK1F8T0g2nIHUkp3y36ZF+
 qw7w==
X-Gm-Message-State: AOAM530m8kBd+xnmMFCeOy70MERMmkxCmWHogMbHm4+4GMui2Kb1lywA
 WMEmKArbmy4RFLNWTeb0FuQpJGSf4GIsUQ==
X-Google-Smtp-Source: ABdhPJxBGqOtzgtR5Mk95Op8xqY77QyIxAPjzXFk01Q20CRV0E/UN2e4R17Qxs+JceOwuJGWRc8tHg==
X-Received: by 2002:a17:90a:4e8c:: with SMTP id
 o12mr12781267pjh.118.1629604550790; 
 Sat, 21 Aug 2021 20:55:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/30] linux-user/i386: Use force_sig, force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:25 -0700
Message-Id: <20210822035537.283193-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Replace the local gen_signal with the generic functions that
match how the kernel raises signals.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/cpu_loop.c | 46 +++++++++++++-------------------------
 1 file changed, 16 insertions(+), 30 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 5866e98441..787d4ccfc0 100644
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
@@ -103,8 +93,7 @@ static bool write_ok_or_segv(CPUX86State *env, abi_ptr addr, size_t len)
         return true;
     }
 
-    env->error_code = PG_ERROR_W_MASK | PG_ERROR_U_MASK;
-    gen_signal(env, TARGET_SIGSEGV, TARGET_SEGV_MAPERR, addr);
+    force_sigsegv_for_addr(addr);
     return false;
 }
 
@@ -190,8 +179,7 @@ static void emulate_vsyscall(CPUX86State *env)
     return;
 
  sigsegv:
-    /* Like force_sig(SIGSEGV).  */
-    gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+    force_sig(TARGET_SIGSEGV);
 }
 #endif
 
@@ -263,53 +251,51 @@ void cpu_loop(CPUX86State *env)
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
+            force_sigsegv_for_addr(env->cr[2]);
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


