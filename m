Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB93F3D5F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 05:59:35 +0200 (CEST)
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHedt-0007tr-6S
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 23:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaT-0007u5-EZ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaO-0000jK-US
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id c4so8203147plh.7
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RYjmBhcWv8W1mWgf+iyy6mrMx77vnB1Iku9AxHwG4eY=;
 b=G6pOwZ/L4OJoJcA9EhSYMO4KGZADMKlqX0g0i7UPaWDKnJVQt43P33isawJ6KkRJCL
 iuoISLKFDkvRwwzNjFPJf4+n55Di1RnQPuka5iSUCmGuqDMr/ew5gvN7OUmq+yvJgckc
 qoFEev6wKnhoQmVgvohYteKyYnhphQAp6exEQS/77u7a7Xwh92N28I5eTXiDtHFk/k5N
 f+QXEf0xV8Jmgcorcjl9FRCZDFP8I+E64TJB2bzxbo71gHR5LAA7lJTqWUZPYkjTKLjs
 raArEil4QvCdBF8QWdhfAzdGNGz8tMZK15cN9hUoO1JQ6RRWvGMlvUmyDDbFvHax6GyW
 B8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RYjmBhcWv8W1mWgf+iyy6mrMx77vnB1Iku9AxHwG4eY=;
 b=NjV37Z434CRwLygunDTMPUnO34ya5QiaqCzGwlc4BGkciwY5wlwaNJYR8K+KAydvRC
 HUKZ90EkTmQa6Evix8OMYCmZZCKIcb+e0YP+m5FHgUTk5CkOhIJ368jDuXWkWaCplXNl
 3vdAHqVUw0GTWXw0rbUDHmfPRPX8bQfQs0Eft3315Cxh/cUbhxZLt58ZxJcZ62777Qfd
 CRoFuhNz1uLl1dBqUgqaTbWOjjfP+JD4lRvNd9MzizVlHaP9h9EI/6ETVMVcJ6h9jfd5
 T+1YTmgBtHho8c4ycrVlklfMziXmz/J1V4qtgnvKQ45iYRL/gUtfcce7GIjkj6e/jA7S
 89nQ==
X-Gm-Message-State: AOAM531uFJzyHmqND2xwxho0bLq5to0R0Q3uy+Kqfs+KvUlHDC+Dh1kd
 y9D0s+r4h/57Q/ZItdeev8LGG5Dstv3apw==
X-Google-Smtp-Source: ABdhPJweI4ZcFq7hkNZ7y/HTk6pS4zXjPkdZvCDW26V64zWeY5kONek0cbfjfkotNewLBcTRuNJGWA==
X-Received: by 2002:a17:90a:d181:: with SMTP id
 fu1mr10146545pjb.147.1629604551393; 
 Sat, 21 Aug 2021 20:55:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/30] linux-user/m68k: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:26 -0700
Message-Id: <20210822035537.283193-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 linux-user/m68k/cpu_loop.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index c7a500b58c..aa46fdcc77 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -21,13 +21,14 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 void cpu_loop(CPUM68KState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n;
-    target_siginfo_t info;
 
     for(;;) {
         cpu_exec_start(cs);
@@ -44,25 +45,13 @@ void cpu_loop(CPUM68KState *env)
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
@@ -89,20 +78,10 @@ void cpu_loop(CPUM68KState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_ACCESS:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmu.ar;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sigsegv_for_addr(env->mmu.ar);
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


