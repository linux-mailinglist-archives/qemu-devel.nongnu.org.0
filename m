Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1033F3D65
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:02:52 +0200 (CEST)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHeh4-0005CC-8a
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaU-0007u7-It
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaR-0000lk-P8
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:58 -0400
Received: by mail-pl1-x635.google.com with SMTP id j2so3795438pll.1
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y84dl2fafIHncS6Y/RS/Ptnx8qYyRhYz7fzOuToVOxw=;
 b=Bt3LwJ6vyI56XOGZ5kAZh2DV4rbLYWS1GM6Dxt9Qq4Qe5Qi/H0a6JzsmrxKq7zbJPm
 igHRtzx7uu2Jg26fbuaGoa/+5fa0AQ8oI76c3cY1xut2+LYhXHK/kFM2AtT3bCbhfAdr
 CseML3Ib2yMhb9fuM5z//5jQ0dHqnXAcgpZoxOBAzMXV090TGLwyMdMIjhrj/Vp45HWB
 v23gCdM+zRaEaAtlmyD2Kn+mN4yoAPJHUmXo0rqC6Mmf6wDVEwQEZXSX2QT5SLjJiN/d
 eP8dvwvl7IcFDcSN+z1qdf3sluPfy5hNX3w3vUC1o5iVGZXuEjFBtSo88pemyclK3IdU
 e93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y84dl2fafIHncS6Y/RS/Ptnx8qYyRhYz7fzOuToVOxw=;
 b=dICZ1iQ2ImgiFkSAFaZ4ue1FRj30gj7McFAhG4n1ygdhMSRTOK3mE7KK4ZkLQ9azmn
 x6Bk27Wd9GcuISjJIck7TpQqhVHVmeFZWYFgYOsgu4DjP3Acizcndj7hVU9CSu4TGXTk
 6o/wrp76z+UeQEzLwptBhciOyV5pInPO5ti5VsRnmTSyLRH06JeXeHu5kLhAlluGAV/6
 0jnqeCy0eme62l5aQFEoPi2xQWwFoBu4hrLi50dzEJWvUvm3aPkmylorOEMpl6VQDFyF
 wzcJrNkq/v5GH7BWIRP58pvVhTprRt4UGdfU+8LBaE9lGxSO24sGCKXfOYOIAeKhudeG
 CjnQ==
X-Gm-Message-State: AOAM530ahV3zi6rySGuXx7vjtpl8lmq7H56pR3aFmj0S8IX9dkP9TAxk
 EcKkI9oCdU7Lytpjnpf2McaiEHPsqg2y2A==
X-Google-Smtp-Source: ABdhPJzgO4D+R7J7dp5bVBtkCvEdwcXUqL1pud9xNirVyXXYlNxcDzBOg4l62uIo8T+x7hz90QWSgw==
X-Received: by 2002:a17:902:a710:b029:12b:9b9f:c461 with SMTP id
 w16-20020a170902a710b029012b9b9fc461mr22639734plq.59.1629604554442; 
 Sat, 21 Aug 2021 20:55:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/30] linux-user/openrisc: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:31 -0700
Message-Id: <20210822035537.283193-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
 linux-user/openrisc/cpu_loop.c | 37 +++++++++-------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index b33fa77718..d2632ce6a3 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -21,13 +21,14 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 void cpu_loop(CPUOpenRISCState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     for (;;) {
         cpu_exec_start(cs);
@@ -54,42 +55,24 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_DPF:
         case EXCP_IPF:
+            force_sigsegv_for_addr(env->eear);
+            break;
         case EXCP_RANGE:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_MAPERR;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        case EXCP_FPE:
+            /* ??? The kernel vectors both of these to unhandled_exception. */
+            force_sig(TARGET_SIGSEGV);
             break;
         case EXCP_ALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->eear);
             break;
         case EXCP_ILLEGAL:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPC;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
-        case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_INTERRUPT:
             /* We processed the pending cpu work above.  */
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


