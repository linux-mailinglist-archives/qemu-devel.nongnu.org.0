Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774973F3D8B
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:18:20 +0200 (CEST)
Received: from localhost ([::1]:40910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHew7-0005mQ-IR
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaR-0007sY-5W
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaP-0000jP-95
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:54 -0400
Received: by mail-pj1-x102e.google.com with SMTP id h1so3973065pjs.2
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dr8YFAi1pWZfR1DWEP4KGLo0RnLMDZepAc49PU2qFmg=;
 b=vMuzBMlqCx/9oLnvwIRAReqBvERb4fj/ZWZyQhS5wUecWJvNEku7suBaIlsm8al4aB
 JFhSdQBikOk0hAd/BgD0bwWxqNXyB40jORcX8k0uXhO4Qx+MlPZpWMFaJwKW4aqPGGrO
 ZZfkgd6X6jkGC65GiPKS5nZPyFhEZ92rVU5Yb6YEQ6GgfduBcFIupTIylUdb6j/nzlmR
 zk/yrcxNDobf2P4yeutaWs12v23fQ9+P5zjx0oKYuLZmIGciKyGRISP66b3ityVSZK8I
 pzunGrxBIIVY+6T1F99ClxzMENjmKWbp+/6pLa/BSqh02rvWa9NK/lzKOh6MSzDyuYoZ
 2few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dr8YFAi1pWZfR1DWEP4KGLo0RnLMDZepAc49PU2qFmg=;
 b=FptA7nxmPKgDRb+qL46CgRaoUTmmwXOl33QgGZbJoFCLAYmWoWhDBwTU4W5KhhhSuV
 VejwhosNwdzPdhwPBSTMkoionwAfvOS8BxfIMdCuws31qNEet0/FUy4Y0o5+r8M/ReEz
 aNMaguFAa0rd1jAlV65V/qbAxJNw1FZ6wsiHAdRMlwOKgTZ4VQ3Iih8bdq6mwxagfBvi
 PqvWvHtd8hhhflBEdCT2C/SEQhjlSdbfawb3QD1CSZMkGziYWMIj8R2hQcxjQTCuoiHP
 /DeoncqSy/loe/LAHi6RFp/qDjVdcrdivJ3EP4mS5TUUjKFfej8lC2eXakjsoa2dYfqG
 JcRg==
X-Gm-Message-State: AOAM5339dLR1pTiQ7njk4x+xadgEnReEX5EPuBx8kVRjOx4ibQZfRX+C
 7mQ2n+6xav7kwzhgFfdD/tLwsDYh7InObw==
X-Google-Smtp-Source: ABdhPJwwCDhnDq+FcFqRPBqXcv6/de3VSX+jDOFY2jsItqCfjVNPCWcZeasqLGq3MzU2+qZkztkCHQ==
X-Received: by 2002:a17:902:e54e:b029:12d:76cd:6744 with SMTP id
 n14-20020a170902e54eb029012d76cd6744mr23023566plf.0.1629604552015; 
 Sat, 21 Aug 2021 20:55:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/30] linux-user/microblaze: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:27 -0700
Message-Id: <20210822035537.283193-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 linux-user/microblaze/cpu_loop.c | 73 +++++++++++++-------------------
 1 file changed, 29 insertions(+), 44 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index c3396a6e09..9e07e52573 100644
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
@@ -36,18 +37,12 @@ void cpu_loop(CPUMBState *env)
 
         switch (trapnr) {
         case 0xaa:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = 0;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            /* FIXME: save vaddr in tlb_fill */
+            force_sigsegv_for_addr(0);
             break;
         case EXCP_INTERRUPT:
-          /* just indicate that signals should be handled asap */
-          break;
+            /* just indicate that signals should be handled asap */
+            break;
         case EXCP_SYSCALL:
             /* Return address is 4 bytes after the call.  */
             env->regs[14] += 4;
@@ -75,6 +70,7 @@ void cpu_loop(CPUMBState *env)
              */
             env->regs[14] = env->pc;
             break;
+
         case EXCP_HW_EXCP:
             env->regs[17] = env->pc + 4;
             if (env->iflags & D_FLAG) {
@@ -82,42 +78,31 @@ void cpu_loop(CPUMBState *env)
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


