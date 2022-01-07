Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B74487E70
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:44:43 +0100 (CET)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5x2Q-0003nR-HD
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:44:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr1-00059p-C8
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:55 -0500
Received: from [2607:f8b0:4864:20::42b] (port=37565
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqy-0007pJ-Qe
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:54 -0500
Received: by mail-pf1-x42b.google.com with SMTP id p37so6184028pfh.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQuAVj83D8N41Enr2c/2Fh+V+6HnjoMfetVUSJ6+wqw=;
 b=HrZz7LhmSSESR/al+1nE/tCJwsc5gH56GywVZ3Ctzog8Djx90F6nsM/cHEYfZMtNjs
 xJCz4LkrA749DGBQCcgmSNg93ll6YaORATCDla1RYNaf3lONByL6zpoID59gpxNI6oMV
 Km8KJLiyUcmJ7ZOKU9enthRQETbmI3t8w6UqC4W1sbaSW9nY1HKjh3OTziZH+UzNhuDa
 EDbCp0r8F0s8+VyrO4+/x/eEFHWviA4yTiJrFctx2gLwOVUKZQXHHfCuKeUFfgV1nmBa
 WEEuVBaMd+VL1M6UBDalTOOfMGC6AV9QWyPEOlRYzhm+Rzja7Dzcjv6axuHtwSAb68kx
 c98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQuAVj83D8N41Enr2c/2Fh+V+6HnjoMfetVUSJ6+wqw=;
 b=jDKJCQTio8xLecnKLs47PkjBcBRya1fJjnl6s6eiPYkmvdRKI0DgM0iX42BxL0pNZI
 aEmHjCVYfnI4zvYa1jjxcXlgpTzmXEWeNrY+PXPms9XPJmrh2dfp4ADnn7TKVswWVyhQ
 Ib7NNH/FZiDKba1WxyorVD8gTOmAZc8xa0T4SzBX7nPKSgE8dDlDgakp8+aJzx9flknf
 zboQRI0kmc1PDl/WXVXdDMqlBl62NgLykS4y2O0nQMMqtK8+Q5kGDTX5gDbivpaOm2HY
 QzD9dYlh99PJWnIGPU5Wm6fLJTuuERwA4+pmlKx/ftfPQHF7eaa1zwPhpWLx6uPrscgV
 yjvQ==
X-Gm-Message-State: AOAM532KAPQAqC2wUS/VA+6VdSite8kRBxHyWVsuIZ/9SagOm3um/HTp
 Fn7cofe0F5GyzjyVU9t6LG40e9agYXszHA==
X-Google-Smtp-Source: ABdhPJyVErM9lGaL72xYiNe5eYNk8cYn6HBedwbG7b/n+rE1b7RHqVkjWQPqeTSX0cThgVJWN6npzA==
X-Received: by 2002:a63:87c3:: with SMTP id
 i186mr57808222pge.507.1641591171616; 
 Fri, 07 Jan 2022 13:32:51 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/24] linux-user/microblaze: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:31 -0800
Message-Id: <20220107213243.212806-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 61 +++++++++++++-------------------
 1 file changed, 25 insertions(+), 36 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index ff1fb26c8b..08620d4e68 100644
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


