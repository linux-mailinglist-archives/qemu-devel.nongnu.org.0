Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D2B3F3D69
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:06:42 +0200 (CEST)
Received: from localhost ([::1]:38668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHekr-0002AZ-2d
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaL-0007ph-0A
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:50 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaJ-0000eM-A8
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:48 -0400
Received: by mail-pf1-x436.google.com with SMTP id y11so12287632pfl.13
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RXyNVnKqczOF3zQ3IizA0BEApi83sp6PDrOKK0oyLMQ=;
 b=U+ETfGt/RXBkTWmiZ88zrYtFcLjGQXvms465QbgBK7FfsVVmz47qSA+gSeFhUehYYi
 a9iFVayxCryuyJzpVXbroy4llGepDRzMrx7jH7r3HlBAK7Xri1xPDbZzhFY1JyLhFSJW
 YGiUKH7A1LVIkkA6xXW697Wr6kfoXgSEH2jaDvDxajbKfSbQKsVLyzILumGD/gKt1PQP
 bq/ocqQj7+Ki3/+KtU9Z01ieMR4421XJ4IPo//l9TLf5m7p6uONEBeWS4nEQB+6/pHp+
 4hTqR3fIPKipz/WgbHKjlhbEqCdx6qaYdIAgyTFVeUdCIFMQoXDn3xeQDGDhbKwRoaac
 mitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RXyNVnKqczOF3zQ3IizA0BEApi83sp6PDrOKK0oyLMQ=;
 b=mlRvyV96QEN6yz1kKNyvKQu76+GsU+XnmH10XRKb+IiTAfsXy/ZHf72RFG3Ybat7LJ
 1KCa3uxOjOnt4iWRNnWRnBdvI18aeZa7Sl/NibSdE4+598dDAVXPYjczlcHMp+91QBLy
 qWw5408DfF5UAEFA/thqLuS+OZr+U4s5iZQU/8iVUhX9bwjGKZ/e2e4mUMnCecHciZoW
 gNGHqbGM+yyxAVEnSPC1l0wQVxLZ0RqsS8SPxXprzdAgrvmpjuVd1sBW04INm4t4OB6b
 LzNGM48/M2LnZM/L6HSGsVGfYX8ZC6gdweJ/nrv6LSu3xx0ecq7r3R5fhIKo3nSPN2Mn
 68eg==
X-Gm-Message-State: AOAM533SUZXeNs2u7Yb4fj/nYgl6RywwZYAHLZzA4L5EV8hG8P4fHSy9
 6NNoYdenJNmJYa1CXWmlh6NvLDEJOn8Okw==
X-Google-Smtp-Source: ABdhPJy+T2RPxI49UCGIJV2I8VSgDESLdaSdV4u41vfLyaFlNMfyO02dVI3b5B1o6llVB/ZBjmh8Uw==
X-Received: by 2002:a05:6a00:2405:b0:3e1:9f65:9703 with SMTP id
 z5-20020a056a00240500b003e19f659703mr27504036pfh.6.1629604546037; 
 Sat, 21 Aug 2021 20:55:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/30] linux-user/alpha: Use force_sig_fault,
 force_sigsegv_code
Date: Sat, 21 Aug 2021 20:55:18 -0700
Message-Id: <20210822035537.283193-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Use the new functions instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 76 +++++++++++--------------------------
 1 file changed, 23 insertions(+), 53 deletions(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index e5f78a439a..b624311a5f 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -21,12 +21,13 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 void cpu_loop(CPUAlphaState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    target_siginfo_t info;
+    int trapnr, si_code;
     abi_long sysret;
 
     while (1) {
@@ -53,34 +54,17 @@ void cpu_loop(CPUAlphaState *env)
             exit(EXIT_FAILURE);
             break;
         case EXCP_MMFAULT:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = (page_get_flags(env->trap_arg0) & PAGE_VALID
-                            ? TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR);
-            info._sifields._sigfault._addr = env->trap_arg0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sigsegv_for_addr(env->trap_arg0);
             break;
         case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->trap_arg0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->trap_arg0);
             break;
         case EXCP_OPCDEC:
         do_sigill:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPC;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_ARITH:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_FLTINV;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_FLTINV, env->pc);
             break;
         case EXCP_FEN:
             /* No-op.  Linux simply re-enables the FPU.  */
@@ -89,20 +73,10 @@ void cpu_loop(CPUAlphaState *env)
             switch (env->error_code) {
             case 0x80:
                 /* BPT */
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                break;
+                goto do_sigtrap_brkpt;
             case 0x81:
                 /* BUGCHK */
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_UNK;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                break;
+                goto do_sigtrap_unk;
             case 0x83:
                 /* CALLSYS */
                 trapnr = env->ir[IR_V0];
@@ -143,47 +117,43 @@ void cpu_loop(CPUAlphaState *env)
                 abort();
             case 0xAA:
                 /* GENTRAP */
-                info.si_signo = TARGET_SIGFPE;
                 switch (env->ir[IR_A0]) {
                 case TARGET_GEN_INTOVF:
-                    info.si_code = TARGET_FPE_INTOVF;
+                    si_code = TARGET_FPE_INTOVF;
                     break;
                 case TARGET_GEN_INTDIV:
-                    info.si_code = TARGET_FPE_INTDIV;
+                    si_code = TARGET_FPE_INTDIV;
                     break;
                 case TARGET_GEN_FLTOVF:
-                    info.si_code = TARGET_FPE_FLTOVF;
+                    si_code = TARGET_FPE_FLTOVF;
                     break;
                 case TARGET_GEN_FLTUND:
-                    info.si_code = TARGET_FPE_FLTUND;
+                    si_code = TARGET_FPE_FLTUND;
                     break;
                 case TARGET_GEN_FLTINV:
-                    info.si_code = TARGET_FPE_FLTINV;
+                    si_code = TARGET_FPE_FLTINV;
                     break;
                 case TARGET_GEN_FLTINE:
-                    info.si_code = TARGET_FPE_FLTRES;
+                    si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = TARGET_FPE_FLTUNK;
+                    si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
-                    info.si_signo = TARGET_SIGTRAP;
-                    info.si_code = TARGET_TRAP_UNK;
-                    break;
+                    goto do_sigtrap_unk;
                 }
-                info.si_errno = 0;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
                 break;
             default:
                 goto do_sigill;
             }
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        do_sigtrap_brkpt:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
+            break;
+        do_sigtrap_unk:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_UNK, env->pc);
             break;
         case EXCP_INTERRUPT:
             /* Just indicate that signals should be handled asap.  */
-- 
2.25.1


