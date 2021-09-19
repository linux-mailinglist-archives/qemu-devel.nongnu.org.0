Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FFB41092A
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:08:44 +0200 (CEST)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmG3-0006N4-RY
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5G-0003sc-M1
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:34 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5D-0005AP-Og
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:34 -0400
Received: by mail-pg1-x531.google.com with SMTP id m21so4540638pgu.13
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d24uau7hAvhoR31DfETZUAFtZ6VzNOXKXU3xmJHN0Yo=;
 b=M0+L3boMqUJsFaR8Z5BUbs/NeXNMGiXh39aJqgiFGJzamV4O/SOLlw8hbzqUx+ZRBF
 Byz/QJ1SghZ7VyX2zzJjLDlzssROuw3oRE2QuRqtjQD2zWcR/OPKH5xL6E6dk/J6jg81
 3lZpUZLC5pe4PhgByIwnAZSn0vxnFb46i/eG/UGtDxvEDDeC5et3IvOKZv3mU/ivlqgu
 y3B8ENkEeh2+3cD+YKkgXZrqvnhnvvoXDf5jx7gk3MeY7+4HsaJUri+D14CFL8i86AL/
 FG2JwP49ju+9+5eCSQT5bbRFNXGPF5PgxUy2Cr0YlwqZhaHPxEMQw7xSwx/rr1A/+pnR
 iEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d24uau7hAvhoR31DfETZUAFtZ6VzNOXKXU3xmJHN0Yo=;
 b=uPJMJV4f2qSqf75Ih8Y9zns9umzM8KFsl1LdF4GHLBXinXujNNmGxdYOLmzzpMUCot
 sUvABNJ86hPPDVGGRB1GgQgY2VJlGS6N8GvsDhcoB7GZMGZAwQB2KDpI364rDruj/Qa+
 29pzUSGWzs1oNo3mxqayK7ipFVauqX2TwM4A3dU3cSHGLPLe6ldN0GpjPTQef0beZD/T
 CtWK+Yq3rh/MHiqeXOTL8BiUEG1ixAWP/4ngbBCSxvnozwhypiW1N6W/t3MUMD3yWUNH
 ZP8959Ct3TyubrjKq899BKavgJj5ORaBLzroaSBusJZETvHpzbnnD5PbsSIW+pP9OOuk
 hDUA==
X-Gm-Message-State: AOAM532hqixfauiQlKc31LG0PDDmsebaTGHaUJ2Qkmx4eA1ibWSl4IUn
 s5okNbN44a7DrmJgOg3ocBIxXLxW/Bm1Pw==
X-Google-Smtp-Source: ABdhPJy4DzSnV21c98yefT2LwtDZ3Bbee0jCUBGkmj23BqOmHzo1abD0kAZktoYKF3cFMiwnqLcbZw==
X-Received: by 2002:a63:ac43:: with SMTP id z3mr17086857pgn.402.1632016650434; 
 Sat, 18 Sep 2021 18:57:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/25] linux-user/microblaze: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:06 -0700
Message-Id: <20210919015718.466207-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 63 ++++++++++++++------------------
 1 file changed, 27 insertions(+), 36 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 0b889a04a7..c527d21889 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -21,13 +21,14 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 void cpu_loop(CPUMBState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ret;
-    target_siginfo_t info;
-    
+    int trapnr, ret, si_code;
+
     while (1) {
         cpu_exec_start(cs);
         trapnr = cpu_exec(cs);
@@ -36,8 +37,8 @@ void cpu_loop(CPUMBState *env)
 
         switch (trapnr) {
         case EXCP_INTERRUPT:
-          /* just indicate that signals should be handled asap */
-          break;
+            /* just indicate that signals should be handled asap */
+            break;
         case EXCP_SYSCALL:
             /* Return address is 4 bytes after the call.  */
             env->regs[14] += 4;
@@ -65,6 +66,7 @@ void cpu_loop(CPUMBState *env)
              */
             env->regs[14] = env->pc;
             break;
+
         case EXCP_HW_EXCP:
             env->regs[17] = env->pc + 4;
             if (env->iflags & D_FLAG) {
@@ -72,42 +74,31 @@ void cpu_loop(CPUMBState *env)
                 env->pc -= 4;
                 /* FIXME: if branch was immed, replay the imm as well.  */
             }
-
             env->iflags &= ~(IMM_FLAG | D_FLAG);
-
             switch (env->esr & 31) {
-                case ESR_EC_DIVZERO:
-                    info.si_signo = TARGET_SIGFPE;
-                    info.si_errno = 0;
-                    info.si_code = TARGET_FPE_FLTDIV;
-                    info._sifields._sigfault._addr = 0;
-                    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                    break;
-                case ESR_EC_FPU:
-                    info.si_signo = TARGET_SIGFPE;
-                    info.si_errno = 0;
-                    if (env->fsr & FSR_IO) {
-                        info.si_code = TARGET_FPE_FLTINV;
-                    }
-                    if (env->fsr & FSR_DZ) {
-                        info.si_code = TARGET_FPE_FLTDIV;
-                    }
-                    info._sifields._sigfault._addr = 0;
-                    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-                    break;
-                default:
-                    fprintf(stderr, "Unhandled hw-exception: 0x%x\n",
-                            env->esr & ESR_EC_MASK);
-                    cpu_dump_state(cs, stderr, 0);
-                    exit(EXIT_FAILURE);
-                    break;
+            case ESR_EC_DIVZERO:
+                si_code = TARGET_FPE_FLTDIV;
+                break;
+            case ESR_EC_FPU:
+                si_code = 0;
+                if (env->fsr & FSR_IO) {
+                    si_code = TARGET_FPE_FLTINV;
+                }
+                if (env->fsr & FSR_DZ) {
+                    si_code = TARGET_FPE_FLTDIV;
+                }
+                break;
+            default:
+                fprintf(stderr, "Unhandled hw-exception: 0x%x\n",
+                        env->esr & ESR_EC_MASK);
+                cpu_dump_state(cs, stderr, 0);
+                exit(EXIT_FAILURE);
             }
+            force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
             break;
+
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.25.1


