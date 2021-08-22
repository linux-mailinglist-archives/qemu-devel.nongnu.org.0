Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011B13F3D8E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:22:59 +0200 (CEST)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHf0X-00032A-2R
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaV-0007vN-HB
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:56:01 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaT-0000ms-Qg
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id j187so12285048pfg.4
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3QatqUyjS7CHgCtyFONtgHEY/7FxQllE+nDg9ups7ko=;
 b=iz8vs1+PcWM8L1AkElUcu+f1PNDJWq2iaAi+VwNiRvK5JNUUyFhQ7M1Dp8lZ0l5NdK
 lqZxN+jbc/h7x69ASlur86PmgiCJZRSEXtrAytkYR9oNtO8UvNZd1VZy6C7Q8wfjC1t6
 deor9HdXZww/KRGt0o7PcaFs/rV2SWgCee2XGHWEW57YeJuc2MKilJXd8edUc8DhPXeJ
 GEv5r8aMaWjv3dMrmaPyMUDfQNwlESSNUAXEPXNOCciCDJB0fWudNZ6oqcn53RMtRYGY
 kk4gIy6bkd6syoLZF0m60b9R2oqjqv06o7P6T7B6lZvSw1RTMvVen5UzMTnYvtl5lJsO
 ME8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3QatqUyjS7CHgCtyFONtgHEY/7FxQllE+nDg9ups7ko=;
 b=DVEK7TbLsqOV3Aqp4sV/ftEo9Th7K66Sm+w64lvN5KlfrnuWlBwvJK3fkvd5Q/HVCm
 9qvQQs1j3uZGiPlEYYL35WtavFY1wNlKPTCmKvN8DrQ3qt5asbW1YavdcUzgJYENEWVE
 wNd5aJXf/epE3dQxGUVUoFdLpOzmzcNuYz751ccDw58TKqXLkOBKVxRlt2qs6beNUMMI
 wimx38vpFkEhY3kR8SM+ztHmj5l3IfulkKjrW4m3WQ2Kzc4mhqau5Cn+E1AmlACjFfbC
 /SnwGozJw9upAzoJFyKa4mLvg/xqO1pDdDysv6ROouVwuXMzpwRRB9P1tPHpwHwfZjMQ
 0+BA==
X-Gm-Message-State: AOAM5337mm1NvLLMeND9EzFpfvDk6QMZWSNtsmoUul57xkPf30OULfJz
 3FgRAlLylpGAEJdjmXDr2FCmYZ0ubLZshA==
X-Google-Smtp-Source: ABdhPJyS8imLASxHg9LuMcsvv5g+ukGPl0sEQNyPNZMf8Wixo4RzUgCtn4Ro9pvdK/6Gk4qog46UXw==
X-Received: by 2002:a63:6705:: with SMTP id b5mr26238575pgc.69.1629604556350; 
 Sat, 21 Aug 2021 20:55:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/30] linux-user/s390x: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:34 -0700
Message-Id: <20210822035537.283193-28-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/cpu_loop.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 6a69a6dd26..8287d3dfe8 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -21,6 +21,8 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 /* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
 #define S390X_FAIL_ADDR_MASK -4096LL
@@ -58,7 +60,6 @@ void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, n, sig;
-    target_siginfo_t info;
     target_ulong addr;
     abi_long ret;
 
@@ -110,11 +111,8 @@ void cpu_loop(CPUS390XState *env)
                 goto do_signal_pc;
             case PGM_PROTECTION:
             case PGM_ADDRESSING:
-                sig = TARGET_SIGSEGV;
-                /* XXX: check env->error_code */
-                n = TARGET_SEGV_MAPERR;
-                addr = env->__excp_addr & S390X_FAIL_ADDR_MASK;
-                goto do_signal;
+                force_sigsegv_for_addr(env->__excp_addr & S390X_FAIL_ADDR_MASK);
+                break;
             case PGM_EXECUTE:
             case PGM_SPECIFICATION:
             case PGM_SPECIAL_OP:
@@ -157,11 +155,7 @@ void cpu_loop(CPUS390XState *env)
              */
             env->psw.addr += env->int_pgm_ilen;
         do_signal:
-            info.si_signo = sig;
-            info.si_errno = 0;
-            info.si_code = n;
-            info._sifields._sigfault._addr = addr;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(sig, n, addr);
             break;
 
         case EXCP_ATOMIC:
-- 
2.25.1


