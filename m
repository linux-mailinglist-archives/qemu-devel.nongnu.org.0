Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D2487E79
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:49:52 +0100 (CET)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5x7P-0001Sm-Pw
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:49:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr1-00059v-E7
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:55 -0500
Received: from [2607:f8b0:4864:20::530] (port=41913
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqy-0007oz-89
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:53 -0500
Received: by mail-pg1-x530.google.com with SMTP id f8so6498967pgf.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAdPMVXz8RRfjrWL+LNY6mFa7+kd1yHOj+KAK66s3KI=;
 b=BAuL9NQHOZ2ZmdlxiLg89xKvUw0OURYY92RQK1phfatJ6/FE9YmGSJljcAZRyl88hr
 t0Fxn6M3yHvU4NERzahSVsVUB7WLUfCwZAyHNZJ6JlFLVzISKWvQTc055g1G046urpXt
 riL/+Ofm1Bn06+jv4TgoFw8b1PaE37QD32m38yws+uZcVcHOtmsmePAWVDLzupP+/2M6
 tBCLrcPsGCIDWYe5tnB/bAl3F3XeV+znvTTpmeM43YarEJf34YjOOIGP1ngTbmHzgNwA
 DOLM6ukNbi6NIvqdF1jJyaFjrFws6Qg8X0kvHfhJic9eT08ZWQ7fOIYokeGAvZR+T2Dl
 zWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAdPMVXz8RRfjrWL+LNY6mFa7+kd1yHOj+KAK66s3KI=;
 b=4p3S3eL1pcBgnlx6at1+/0zNaQKMNEzfrOEYi9/U28Y5ydxSVl+Xwlknx12V2iqqYL
 /fkooJTiqegxJavGRxrIDddBgN9OOi0fdq7Lr0l1Csvc+2y4YwBtRv/+oyusYXiyA9vU
 Q9J+84aVrRSAGlxk7KApqaTgvx2PJIT+/emrQJkj4N3FwtPhBvUlihAEXaFMkC7lMi9Q
 zc3NEtm2QIXayVy2GpFtS5qKCRy90Ho1zGxksvOH07KKlIlUFLMNCP3iCly5JX233ybs
 /EKPDqR26sZaVCjOvURvVpyc6EOsHMsyR80ISPVHSZCMkAlqnmpgVMmArpFIUJCt3fi5
 gO9g==
X-Gm-Message-State: AOAM532WjnqIrj0+4dJPBrIr9ucNLWRgyX+tZBAyS/0MxcGo71QNLBWU
 VVsLOS2/Fyhm+mYoWOyMl+v4Mv3L0k6m2g==
X-Google-Smtp-Source: ABdhPJxR3dhWpF6rUP9rFSOY2p1DPHWz7bINlD8Q0Rc8R44m8V02abiNDi2PGg627ny5eRtc6Q/d6A==
X-Received: by 2002:a05:6a00:1890:b0:4ba:eac4:3d01 with SMTP id
 x16-20020a056a00189000b004baeac43d01mr65812653pfh.22.1641591171040; 
 Fri, 07 Jan 2022 13:32:51 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/24] linux-user/m68k: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:30 -0800
Message-Id: <20220107213243.212806-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
 linux-user/m68k/cpu_loop.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 3181594414..928a18e3cf 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -29,7 +29,6 @@ void cpu_loop(CPUM68KState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n;
-    target_siginfo_t info;
 
     for(;;) {
         cpu_exec_start(cs);
@@ -46,25 +45,13 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_INTOVF;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->pc);
             break;
         case EXCP_DIV0:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_INTDIV;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
         case EXCP_TRAP0:
             {
@@ -91,10 +78,7 @@ void cpu_loop(CPUM68KState *env)
             /* just indicate that signals should be handled asap */
             break;
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


