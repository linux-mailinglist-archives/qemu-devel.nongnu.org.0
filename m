Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA5A3F3D6C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:06:47 +0200 (CEST)
Received: from localhost ([::1]:39206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHekw-0002WF-OZ
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaW-0007vP-37
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:56:01 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaT-0000mb-5n
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id i21so12288367pfd.8
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+v1YogFzFLNFD/zLNDkuHoAqiRV8XrYV0MsKRyjw4WM=;
 b=jjwb8KG+wTi5FZskcK3CLLa9etTJ5kMoYZp5tV4EPJ4FP3DdagOfd3UD4MMOVesJ60
 /Ph8L48o9/Y9FBiXB6X6YYaLG75KRzdTf/m4iqw322nZHwUj0DPBMyuAi2e6H56fnrXW
 37xjxtVSIXEeiqVedbcx3xUVZ7FSszAObnqW4mHAdV9rT3+L9jVYQ/bS3JWlLp5ZOVU3
 F8IxEOVjD/nYI8XSUxR+wDQyfg7JA3h1f0AFm02hhOby5G+MFbqKqNggOyLkNVUAIjuF
 FDVDHvQrXwPErO4Qmwe+Zpcxbk2FqywqLPjiQVgj+bPuCdBfaLUc26VkyTwEWm/B4XLm
 uirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+v1YogFzFLNFD/zLNDkuHoAqiRV8XrYV0MsKRyjw4WM=;
 b=HvXYhvVF/c6I+yIb8zZuP2fF/eFkvGJzztdG7RKyye0TVJ13cBEvOe5AvbNwXKvI0D
 eSucH5H10kzDtzRAlFMbUUhnXITsHYu3HfsdWC3x/7bMuk5WZtv4Z/FnKhtoNDjw6L/l
 SwSUpirestT6oGiK8u1VmAOaP9l1NO2iTR42sUnpcoSO20z1kBW8JWqRThBn1gS5SDbC
 zxlMVpoIdfE/wP0RouQMiXzr8BoD1I8ePQ6Eu5yiCggov2O2yOP1iozwlN/W9MM5+KNo
 ix7MlgceycmQjxKodjXOdCr9M/uKsqM6z3js7DScTflSjI46tePxczoBzWNEm+3SzGto
 MQAA==
X-Gm-Message-State: AOAM530DSrRK4Op7PBRvb0Lnegyku8X9GbJgRaHzzV+mR3C0r3J26PDZ
 QrEUbaHnT8FQhsW1x1qZS348Lu0t3i3q5A==
X-Google-Smtp-Source: ABdhPJxgMslY+FyagtGyPmE5oAmPHnO/kj6NRFKWw8/qcDGzZO8+2akrE6PWAJHnZyaQX90OCrDCsA==
X-Received: by 2002:a63:480a:: with SMTP id v10mr25791903pga.113.1629604555001; 
 Sat, 21 Aug 2021 20:55:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/30] linux-user/ppc: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:32 -0700
Message-Id: <20210822035537.283193-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

The user-only version of ppc_cpu_tlb_fill does not distinguish
between the various hw codes.  Drop all of that and just use
the new force_sigsegv_for_addr function.  The fault address for
POWERPC_EXCP_ISI is nip exactly, not nip - 4.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c | 142 ++++++++------------------------------
 1 file changed, 30 insertions(+), 112 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index fa91ea0eed..4893bbd021 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -21,6 +21,8 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 static inline uint64_t cpu_ppc_get_tb(CPUPPCState *env)
 {
@@ -74,8 +76,7 @@ int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, uint32_t val)
 void cpu_loop(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
-    int trapnr;
+    int trapnr, si_signo, si_code;
     target_ulong ret;
 
     for(;;) {
@@ -100,61 +101,10 @@ void cpu_loop(CPUPPCState *env)
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
+            force_sigsegv_for_addr(env->spr[SPR_DAR]);
             break;
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
+            force_sigsegv_for_addr(env->nip);
             break;
         case POWERPC_EXCP_EXTERNAL: /* External input                        */
             cpu_abort(cs, "External interrupt while in user mode. "
@@ -162,35 +112,30 @@ void cpu_loop(CPUPPCState *env)
             break;
         case POWERPC_EXCP_ALIGN:    /* Alignment exception                   */
             /* XXX: check this */
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->nip);
             break;
         case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
         case POWERPC_EXCP_HV_EMU:   /* HV emulation                          */
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
@@ -199,51 +144,50 @@ void cpu_loop(CPUPPCState *env)
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
@@ -256,28 +200,19 @@ void cpu_loop(CPUPPCState *env)
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
@@ -298,13 +233,6 @@ void cpu_loop(CPUPPCState *env)
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
@@ -361,13 +289,6 @@ void cpu_loop(CPUPPCState *env)
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
@@ -450,10 +371,7 @@ void cpu_loop(CPUPPCState *env)
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


