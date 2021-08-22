Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163063F3D8A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:18:20 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHew7-0005lf-2V
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaX-0007vR-42
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:56:02 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaV-0000pW-Kh
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:56:00 -0400
Received: by mail-pg1-x535.google.com with SMTP id t1so13339285pgv.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTd7GpVNfJwdpnYm/hpk5WQx19kQn+kD8ce7/pdQayk=;
 b=Yw88Rh1dIc1WlEzidobtk/THqqQiOTwl6pdI2/Hfhmf6sVvIlJS2w8NeeUOmewmWnI
 iqRQ14ZziL96vLYn8T1pBHHtbd8ZbTuUykza+iPvG6k6DJzNjdCUkLZmWnlNPxNwltXm
 K5GcWrBdLSOZus93KGMn7erJFdJuVWFq7GFsgewvZe4euVVw1gtzLqwZ60bsXhBkIStX
 081YEB/u6WJHauTMzUgN6nfhhHZvQAu1Tg0Q6o1xic/8EWdaDQKie0aIgwNAdED1GdGD
 a90Jq5tiZFpCjO4At0wRzOFJtegplsa00xxMdI3NkDZm8KWXdEUXt+VKkjx0JVrn0rou
 XZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTd7GpVNfJwdpnYm/hpk5WQx19kQn+kD8ce7/pdQayk=;
 b=NTAHyL2h3IYFjjOEOM4OIhThLos2Kmdr3s8C8Ug00JynBQnPrgxAFbB2/nKhrY2Ywx
 FmGLtGIUTBiqIzd2+Hat606NASMNs7NyM3tBCJ3wF6Q38vucqv0mMzbnUayzzhaNoLGT
 yNkwRdilbnivq4ltDdbhdPJYEqlbdEv89xQFUmxhbqfLlFWv3P/Fy1Lb9vEVKJHY88HP
 uZG6ID/T0DBeRudic5bO7qoQ3fv3cuEnMvj/uYNiAXi5+bjdt6P3n03iiuDbM024KGfP
 UdP/jQ342BFXKVeK7ZFbddSSYFtCB7J0xGvDBRnDiyabk+/+FDB8gp43pH7bNd31Yhkk
 EFzg==
X-Gm-Message-State: AOAM5305yuWKh5aAADJDLs6+QdXoqjhUD1mVaULZVxYD83nISXgw5kyJ
 Zhm7mwhFoO8ylJw/QkNEpzwXCjF3CYyCwg==
X-Google-Smtp-Source: ABdhPJyk8Tv2biTGIUuoZRFVRI11WbafDE79G5Q7RVLYZKy2gCjq7RlvtxZWgK/XofKtYDePwEkrjA==
X-Received: by 2002:a63:1a46:: with SMTP id a6mr25749522pgm.226.1629604558362; 
 Sat, 21 Aug 2021 20:55:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/30] linux-user/xtensa: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:37 -0700
Message-Id: <20210822035537.283193-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
 linux-user/xtensa/cpu_loop.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index 64831c9199..869a8501b8 100644
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
@@ -217,20 +216,13 @@ void cpu_loop(CPUXtensaState *env)
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
 
             case LOAD_PROHIBITED_CAUSE:
             case STORE_PROHIBITED_CAUSE:
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SEGV_ACCERR;
-                info._sifields._sigfault._addr = env->sregs[EXCVADDR];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sigsegv_for_addr(env->sregs[EXCVADDR]);
                 break;
 
             default:
@@ -239,10 +231,8 @@ void cpu_loop(CPUXtensaState *env)
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


