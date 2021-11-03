Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432F444366
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:25:32 +0100 (CET)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHCl-0006P6-72
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwl-0002JW-0D
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:59 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwj-00054i-1c
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:58 -0400
Received: by mail-qt1-x82a.google.com with SMTP id u7so944902qtc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RWV9WOum/EgcRXAB9OWJGs5V6nSAWvrKYW5XslI2s0c=;
 b=ioUvExLcJdcJ8BXkJH2ISa4o3F9qaE690mucceUqVokG/ITAprIe+LDHVmEaFIQ2Hd
 BFuSNVJ7Ep2G1uNBSozXzzdZzOP0cyYbxdjqxDeKiZKVd40pMClmd6RR/u/mwGUXMXo2
 wUYoGBoezJWRdrbhSnQpPPzhe+1TLtvhNPVlejTiCrx508HQ+UzLbRV6kMxtk5ucL6+U
 oz6lBG/tE4jRs3l/kJZKX0+q6q9IoVCrzLtdWya+CZiCXh76Dvd6hbA8j8K3OUsKeq0q
 WImV+gY+vCQIEUbUiBR8yCpUugYTT6+N3j5sAmP/DyOj80nQ7MtnIE3j6R0Oe/aEzhMm
 extA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RWV9WOum/EgcRXAB9OWJGs5V6nSAWvrKYW5XslI2s0c=;
 b=tm8akv4vhXNCrdN2JJt4BOxijsY5W1tipYHEJTdP6UNgeGgv66BpuMAWNYDIOVYswR
 QykrUKd9dkeIXcsorc3nHcbYXZ9yZmBrUW5gmiAGrL0eFkKd4mvHQNmuw8HCVpziEbsM
 W+Ca6mzSVJkfmb+iS98Ddyn7rdb3zy7wN11puyJMP+tNHq95Tp6kRlhu5/ATzBIM6797
 h73TypRqO9iMO9IGu/HfVi53kJ6N9RFOXcvcKNoH6W3XUD7VSmY+vvcTK7MbHwF67T+R
 t5qNUC1EcLPjPKxBFAjLHrckiwNKE+ezCMMlUoducrEGa2wNYLGrtjNDxbbM0EpY2erc
 af8g==
X-Gm-Message-State: AOAM530E/axXRcZK6EIfXFKenxNpGoXigfEgieCPUN0qP56zGSgIQogw
 zKirX0NkUdVisQBdWGdw3CeXJuRiVj6Vug==
X-Google-Smtp-Source: ABdhPJwUv7aIRPi2gPBq7wu3Fxh+Y5zN/rZAtIzeX78BeZy9a5AiPZ1bfGJAxXRh0TaJzguEfx6Exw==
X-Received: by 2002:a05:622a:1a1e:: with SMTP id
 f30mr3063718qtb.292.1635948536148; 
 Wed, 03 Nov 2021 07:08:56 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/23] linux-user/microblaze: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:35 -0400
Message-Id: <20211103140847.454070-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 61 +++++++++++++-------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index a94467dd2d..263b68aea1 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -27,9 +27,8 @@
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
@@ -38,8 +37,8 @@ void cpu_loop(CPUMBState *env)
 
         switch (trapnr) {
         case EXCP_INTERRUPT:
-          /* just indicate that signals should be handled asap */
-          break;
+            /* just indicate that signals should be handled asap */
+            break;
         case EXCP_SYSCALL:
             /* Return address is 4 bytes after the call.  */
             env->regs[14] += 4;
@@ -67,6 +66,7 @@ void cpu_loop(CPUMBState *env)
              */
             env->regs[14] = env->pc;
             break;
+
         case EXCP_HW_EXCP:
             env->regs[17] = env->pc + 4;
             if (env->iflags & D_FLAG) {
@@ -74,42 +74,31 @@ void cpu_loop(CPUMBState *env)
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


