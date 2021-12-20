Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646647B4BB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:08:08 +0100 (CET)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPt9-000399-BB
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqi-00009F-PJ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:36 -0500
Received: from [2607:f8b0:4864:20::435] (port=38701
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqg-0005sy-5i
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:36 -0500
Received: by mail-pf1-x435.google.com with SMTP id b22so5023461pfb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sq/kznFGz9PWdUHHi74JU5t5d0KvsAf3BVy4yRlW1PQ=;
 b=SvVAAWTzTvjQNixITXtrJqvfFqke9G43iX2TYA+c+R9zQlIkiFjbnNJ4T3wrJONM5F
 sMJzKaX+KU5gKbEfUxuGBiDBoNJBRLAVudPrQVhTHD/N3tC0cf6UMrKTeh0M3rcxutmZ
 Lm9mgL6UpXQlbFqCVp9mm6iaNfdNbJJ1NPcGMnNU2uwYVY7kp21MWYx6Q8WNXqVJDmEQ
 wZlEr9hMvQK2X9PvjcUZwd612xuaqBlD50rvKCS5UXhVYwev3e3OQqPVxHxK6xXzw9zh
 u4GkHpKaslBFTyht6ulhcEUCYPcbiXgqSu+gyHE06Hh2GKOXGYxUVsmXTh2dFnnvcjnD
 W0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sq/kznFGz9PWdUHHi74JU5t5d0KvsAf3BVy4yRlW1PQ=;
 b=RdnbF7t8nQWmWk+1LCTyD7e0MxUV2jsc+qAILiWbPsrxpNBjFTaSyVgtYnVf55tDi3
 kKhJNby4YyEJCRC8EZ7LpkYc7Fu6kMYtPRNRpuC+HZfQ1X/CDcLjFiWS5NLVSPUJlurg
 UTLFd+IFebqUbjm6iCdhLDevMGjwUXGNxymVyqwLAzGgduwZSSZ5Ghj8rCL+2J8c3E9o
 f0p+3/AXAYN5LiwW4M2ZLSzAzNMUeVNBNJ3BwxCukiCLy0CbGNTIvTAjh+WlzE/VDv79
 CL7vSmk32OqArfA1dCfxOPpgkgxNyFy1Pu6o0jTejfTOyHb/KJGAo0xmjSeARFuW42f8
 rC/w==
X-Gm-Message-State: AOAM533KhxfIL+++P56ukAVkeL2Sr7cltDZ2l8qBi8tlrQtN0AJdW98n
 4moZ7H9LnoS94I6fDuXhSL/pHwwdefNeUw==
X-Google-Smtp-Source: ABdhPJwAqeu9IaTeVH0uBI3Wy7u9zZbDC2tEovvcDUCkrEo0oLjYKI1x1cSsE3lhNKA/f8rZvmmTDA==
X-Received: by 2002:a05:6a00:1349:b0:4ba:fd72:64da with SMTP id
 k9-20020a056a00134900b004bafd7264damr3112954pfu.69.1640034332954; 
 Mon, 20 Dec 2021 13:05:32 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/24] linux-user/alpha: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:07 -0800
Message-Id: <20211220210529.150423-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 61 ++++++++++++-------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 92de2a4424..0e4c2db462 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -27,8 +27,7 @@
 void cpu_loop(CPUAlphaState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    target_siginfo_t info;
+    int trapnr, si_code;
     abi_long sysret;
 
     while (1) {
@@ -56,18 +55,10 @@ void cpu_loop(CPUAlphaState *env)
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
@@ -76,20 +67,10 @@ void cpu_loop(CPUAlphaState *env)
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
@@ -130,47 +111,43 @@ void cpu_loop(CPUAlphaState *env)
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


