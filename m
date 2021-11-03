Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3B44438F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:29:35 +0100 (CET)
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHGg-0002pP-2I
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwq-0002bg-FE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:04 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwo-0005AY-0R
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:04 -0400
Received: by mail-qt1-x835.google.com with SMTP id u7so945193qtc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKn/dn/o5/5uSJhUVusVlDHnM+Rs1ENAWdTHsonHpeI=;
 b=kcXAnrooEQjyqfcr9EKSHoTtAz8c09Jzb8Q+/E+zmwSa62s0JxLQGHgIssaHZSvQOq
 q0uWITiRaqtFSqF+VwodKm4uw19oQPFSGVfMe2qpbGo7CQndEkwqgSJlSqwo9mTxJyd1
 iQBNIrnOX9bQt4NNtLRc8dI4gK5n8CFinLj0AHT2r3z015AXmEMNcLadybxV01E9sYEE
 6R3C6unRhUR5dmJsQs0YOiebtW0va/kSs+M4/beLUD4VMnKz+CiC+cWgPOXYR4fi2GWY
 dY9Ikx62lk/x/wAB+zCaPfNJTqbfoJAdLgz5QeyxBieXtzLMWz742WF/VnomNP8AxVvZ
 HXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKn/dn/o5/5uSJhUVusVlDHnM+Rs1ENAWdTHsonHpeI=;
 b=r5RY3iJw9FK0DC1vJLYsnOtkJAhrG4NBlk644fGKVHZepEXmp4DvE44yDseeM60vcR
 FR4wdHNxasapVgnK1nNIirzAT9CfvRJgIXBn1/sL/+ZLmB4w+YLG9bqB2EgDF/8ZPaze
 3RY7B4WMM5dKEVrf4/OQIrNIcZxJwz2dLBNeaID6eyNG21iYqhMfUQ9SEYs9X/gACzmw
 y1ZlGnYDIewMnWYzYxPEDutnR3hJ0nMt89emv2gwkZ1+VLHjKcfFs4irogFXZc+QiWtK
 iwccYPD/xjopOHkRjEZmf6Ph1RLBxUaWnl2u5B5Rt+SUHJYQiwQhEljceu64Lh8wMF8p
 tc5w==
X-Gm-Message-State: AOAM533IhYbHqbC545pA8VqhvjnaEUEKt03gtdgqh2ZSgW/McpBexOgg
 tV0yiLo5gtnH/LbgnEMvuJHGQe3u4S9CXw==
X-Google-Smtp-Source: ABdhPJzp07q2OJovOoAlP5++G8zatFFhI2IhovDE73lBNMzExdLoELUF9H8ZCVFSbTtgE9G4Qz027Q==
X-Received: by 2002:a05:622a:1450:: with SMTP id
 v16mr35957117qtx.25.1635948541007; 
 Wed, 03 Nov 2021 07:09:01 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:09:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/23] linux-user/ppc: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:42 -0400
Message-Id: <20211103140847.454070-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.  Fill in the missing PC for SIGTRAP.
The fault address for POWERPC_EXCP_ISI is nip exactly, not nip - 4.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c | 136 ++++++++------------------------------
 1 file changed, 28 insertions(+), 108 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 483e669300..bb20300da9 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -76,8 +76,7 @@ int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, uint32_t val)
 void cpu_loop(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
-    int trapnr;
+    int trapnr, si_signo, si_code;
     target_ulong ret;
 
     for(;;) {
@@ -102,61 +101,10 @@ void cpu_loop(CPUPPCState *env)
                       "Aborting\n");
             break;
         case POWERPC_EXCP_DSI:      /* Data storage exception                */
-            /* XXX: check this. Seems bugged */
-            switch (env->error_code & 0xFF000000) {
-            case 0x40000000:
-            case 0x42000000:
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_MAPERR;
-                break;
-            case 0x04000000:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLADR;
-                break;
-            case 0x08000000:
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_ACCERR;
-                break;
-            default:
-                /* Let's send a regular segfault... */
-                EXCP_DUMP(env, "Invalid segfault errno (%02x)\n",
-                          env->error_code);
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_MAPERR;
-                break;
-            }
-            info._sifields._sigfault._addr = env->spr[SPR_DAR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_ISI:      /* Instruction storage exception         */
-            /* XXX: check this */
-            switch (env->error_code & 0xFF000000) {
-            case 0x40000000:
-                info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-                info.si_code = TARGET_SEGV_MAPERR;
-                break;
-            case 0x10000000:
-            case 0x08000000:
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_ACCERR;
-                break;
-            default:
-                /* Let's send a regular segfault... */
-                EXCP_DUMP(env, "Invalid segfault errno (%02x)\n",
-                          env->error_code);
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_MAPERR;
-                break;
-            }
-            info._sifields._sigfault._addr = env->nip - 4;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            /* FIXME: handle maperr in ppc_cpu_record_sigsegv. */
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
+                            env->spr[SPR_DAR]);
             break;
         case POWERPC_EXCP_EXTERNAL: /* External input                        */
             cpu_abort(cs, "External interrupt while in user mode. "
@@ -167,24 +115,23 @@ void cpu_loop(CPUPPCState *env)
             /* XXX: check this */
             switch (env->error_code & ~0xF) {
             case POWERPC_EXCP_FP:
-                info.si_signo = TARGET_SIGFPE;
-                info.si_errno = 0;
+                si_signo = TARGET_SIGFPE;
                 switch (env->error_code & 0xF) {
                 case POWERPC_EXCP_FP_OX:
-                    info.si_code = TARGET_FPE_FLTOVF;
+                    si_code = TARGET_FPE_FLTOVF;
                     break;
                 case POWERPC_EXCP_FP_UX:
-                    info.si_code = TARGET_FPE_FLTUND;
+                    si_code = TARGET_FPE_FLTUND;
                     break;
                 case POWERPC_EXCP_FP_ZX:
                 case POWERPC_EXCP_FP_VXZDZ:
-                    info.si_code = TARGET_FPE_FLTDIV;
+                    si_code = TARGET_FPE_FLTDIV;
                     break;
                 case POWERPC_EXCP_FP_XX:
-                    info.si_code = TARGET_FPE_FLTRES;
+                    si_code = TARGET_FPE_FLTRES;
                     break;
                 case POWERPC_EXCP_FP_VXSOFT:
-                    info.si_code = TARGET_FPE_FLTINV;
+                    si_code = TARGET_FPE_FLTINV;
                     break;
                 case POWERPC_EXCP_FP_VXSNAN:
                 case POWERPC_EXCP_FP_VXISI:
@@ -193,51 +140,50 @@ void cpu_loop(CPUPPCState *env)
                 case POWERPC_EXCP_FP_VXVC:
                 case POWERPC_EXCP_FP_VXSQRT:
                 case POWERPC_EXCP_FP_VXCVI:
-                    info.si_code = TARGET_FPE_FLTSUB;
+                    si_code = TARGET_FPE_FLTSUB;
                     break;
                 default:
                     EXCP_DUMP(env, "Unknown floating point exception (%02x)\n",
                               env->error_code);
+                    si_code = 0;
                     break;
                 }
                 break;
             case POWERPC_EXCP_INVAL:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
+                si_signo = TARGET_SIGILL;
                 switch (env->error_code & 0xF) {
                 case POWERPC_EXCP_INVAL_INVAL:
-                    info.si_code = TARGET_ILL_ILLOPC;
+                    si_code = TARGET_ILL_ILLOPC;
                     break;
                 case POWERPC_EXCP_INVAL_LSWX:
-                    info.si_code = TARGET_ILL_ILLOPN;
+                    si_code = TARGET_ILL_ILLOPN;
                     break;
                 case POWERPC_EXCP_INVAL_SPR:
-                    info.si_code = TARGET_ILL_PRVREG;
+                    si_code = TARGET_ILL_PRVREG;
                     break;
                 case POWERPC_EXCP_INVAL_FP:
-                    info.si_code = TARGET_ILL_COPROC;
+                    si_code = TARGET_ILL_COPROC;
                     break;
                 default:
                     EXCP_DUMP(env, "Unknown invalid operation (%02x)\n",
                               env->error_code & 0xF);
-                    info.si_code = TARGET_ILL_ILLADR;
+                    si_code = TARGET_ILL_ILLADR;
                     break;
                 }
                 break;
             case POWERPC_EXCP_PRIV:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
+                si_signo = TARGET_SIGILL;
                 switch (env->error_code & 0xF) {
                 case POWERPC_EXCP_PRIV_OPC:
-                    info.si_code = TARGET_ILL_PRVOPC;
+                    si_code = TARGET_ILL_PRVOPC;
                     break;
                 case POWERPC_EXCP_PRIV_REG:
-                    info.si_code = TARGET_ILL_PRVREG;
+                    si_code = TARGET_ILL_PRVREG;
                     break;
                 default:
                     EXCP_DUMP(env, "Unknown privilege violation (%02x)\n",
                               env->error_code & 0xF);
-                    info.si_code = TARGET_ILL_PRVOPC;
+                    si_code = TARGET_ILL_PRVOPC;
                     break;
                 }
                 break;
@@ -250,28 +196,19 @@ void cpu_loop(CPUPPCState *env)
                           env->error_code);
                 break;
             }
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(si_signo, si_code, env->nip);
             break;
         case POWERPC_EXCP_FPU:      /* Floating-point unavailable exception  */
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_COPROC;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        case POWERPC_EXCP_APU:      /* Auxiliary processor unavailable       */
+        case POWERPC_EXCP_SPEU:     /* SPE/embedded floating-point unavail.  */
+        case POWERPC_EXCP_VPU:      /* Vector unavailable exception          */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->nip);
             break;
         case POWERPC_EXCP_SYSCALL:  /* System call exception                 */
         case POWERPC_EXCP_SYSCALL_VECTORED:
             cpu_abort(cs, "Syscall exception while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_APU:      /* Auxiliary processor unavailable       */
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_COPROC;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_DECR:     /* Decrementer exception                 */
             cpu_abort(cs, "Decrementer interrupt while in user mode. "
                       "Aborting\n");
@@ -292,13 +229,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Instruction TLB exception while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_SPEU:     /* SPE/embedded floating-point unavail.  */
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_COPROC;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_EFPDI:    /* Embedded floating-point data IRQ      */
             cpu_abort(cs, "Embedded floating-point data IRQ not handled\n");
             break;
@@ -355,13 +285,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Hypervisor instruction segment exception "
                       "while in user mode. Aborting\n");
             break;
-        case POWERPC_EXCP_VPU:      /* Vector unavailable exception          */
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_COPROC;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_PIT:      /* Programmable interval timer IRQ       */
             cpu_abort(cs, "Programmable interval timer interrupt "
                       "while in user mode. Aborting\n");
@@ -444,10 +367,7 @@ void cpu_loop(CPUPPCState *env)
             env->gpr[3] = ret;
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->nip);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
-- 
2.25.1


