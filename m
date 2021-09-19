Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EC6410939
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:16:35 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmNe-0000sf-PE
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5Q-00046R-Ke
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:45 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5N-0005Hj-QK
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id k23so9586931pji.0
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dG8D726sLCXCL5Zfb1IUY8jWTYav0TmVZuH4s8Ps4fo=;
 b=LJX2tj0AWPA628j6fXMjCZPvAJ8rNgZvDGPjlQ8BKprcYAAWkJKTmh2kmnjPy7UgfE
 wwf8WcSg/oaVahcVexOeZ0nCTvM28p54e/dBVCK5GVYBCWwt53YTbs6GStAayYb1qPHi
 35CGV1aTPGLg+4aK+8u6uoinllsoB1R4yCVAhgJmIQ9mRk+KVQR8XH1Yme04D3hKdlKq
 ODHIxouRERAYuNvbhJO1tc248GtkjngVBQdOkwle77tgBELZSqW7p7rkSNO32hpVsOYd
 Yv+YpjciCY7mgEp0Spv32IZa+7yeOD2kE3Pr7p/4BSFrLhhZFMVGS3G9HpS8xVRC6WJZ
 SJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dG8D726sLCXCL5Zfb1IUY8jWTYav0TmVZuH4s8Ps4fo=;
 b=DOHYRgY8dYB3OEDBHkdbr+bQkW1vWQBblhf0HMTqToEGnvrAekfz2f8n0ce/cYaWLm
 AeW7Z7oqw/X82vf6jFy9QeD4ZtKsqkg5SZXldh+m9nJH1JXbT9KWMXifRdHoWtzfgaVE
 8R2B4AEBeCAuwYQJ8Lex8CsJPnC3eJ7DXo7wNR/wAI+DeMwoZKHmglgwTJF553XJT0yF
 di/AohUXFpxEcSbU8jJPTsUPrnHC+w3rP35Hi2nbL8dbCsYDppVVjCiSxf8zc5sUfEyW
 ZbgHM6MjykLStaliGr8rFNnYQfWSn+7LsMmMvBrkzhs4nQptubVodnh5yy0jRPPkTJOg
 L6Jg==
X-Gm-Message-State: AOAM532COuP5SpA2mDHBfzMYZtv8P2iFiT4c5O0M1CwjemWoIWza3Fqx
 Ug6HQ39IzBAR9Lmid9zs4gcC5ZzcIHGaSA==
X-Google-Smtp-Source: ABdhPJwLhoSdlFJiU0yK1QRdUcioyEv7jmuse7wFiKeb3pyIP83hfDRYAPXrVjjdy+cHhuVFmBWNKw==
X-Received: by 2002:a17:90a:578e:: with SMTP id
 g14mr30382899pji.184.1632016660245; 
 Sat, 18 Sep 2021 18:57:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/25] linux-user/xtensa: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:18 -0700
Message-Id: <20210919015718.466207-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/xtensa/cpu_loop.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index b48781c6e8..7392e83c9b 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 static void xtensa_rfw(CPUXtensaState *env)
 {
@@ -124,7 +126,6 @@ static void xtensa_underflow12(CPUXtensaState *env)
 void cpu_loop(CPUXtensaState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -161,14 +162,12 @@ void cpu_loop(CPUXtensaState *env)
         case EXC_USER:
             switch (env->sregs[EXCCAUSE]) {
             case ILLEGAL_INSTRUCTION_CAUSE:
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC,
+                                env->sregs[EPC1]);
+                break;
             case PRIVILEGED_CAUSE:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code =
-                    env->sregs[EXCCAUSE] == ILLEGAL_INSTRUCTION_CAUSE ?
-                    TARGET_ILL_ILLOPC : TARGET_ILL_PRVOPC;
-                info._sifields._sigfault._addr = env->sregs[EPC1];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC,
+                                env->sregs[EPC1]);
                 break;
 
             case SYSCALL_CAUSE:
@@ -217,11 +216,8 @@ void cpu_loop(CPUXtensaState *env)
                 break;
 
             case INTEGER_DIVIDE_BY_ZERO_CAUSE:
-                info.si_signo = TARGET_SIGFPE;
-                info.si_errno = 0;
-                info.si_code = TARGET_FPE_INTDIV;
-                info._sifields._sigfault._addr = env->sregs[EPC1];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV,
+                                env->sregs[EPC1]);
                 break;
 
             default:
@@ -230,10 +226,8 @@ void cpu_loop(CPUXtensaState *env)
             }
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT,
+                            env->sregs[EPC1]);
             break;
         case EXC_DEBUG:
         default:
-- 
2.25.1


