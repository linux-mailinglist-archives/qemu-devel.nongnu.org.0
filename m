Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B147B532
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:28:22 +0100 (CET)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQCj-0004ha-EJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:28:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPr2-0000or-5f
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:57 -0500
Received: from [2607:f8b0:4864:20::62f] (port=33358
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqz-0005ws-3c
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:55 -0500
Received: by mail-pl1-x62f.google.com with SMTP id y7so9074124plp.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xSDql4+/4hjZ41MoR3OqxD/rR+Fa1of3CAUT/0rGzk=;
 b=RDza8hKH2rUkLktsOcgLyCz0wKAiiyLMsdlbWnbAQjXUx+R0JrpJNK7C2F+fqU5/g5
 +/OAucW17UGxL3SeEfXVz8smAclF0Cv5ls3LY8Bg8odiHPjIV68/c8W5QU+d341kK8LE
 hVd05sQ5GcwQqs9IP0JYXdiwHsUk3XXcexBijFMlADYR8PtAzDqRZaqTln0j+1Daw24t
 dwFXQRYfqjxZv25f53Xn+vaiueANGLKn6TxxjIP7BzR7VVJS7JqLuQxDbRIYwAexPH5O
 toygY74h+QH/pe2BfiiTZJSIgYEeqCZHnvN5Q7wrFLtZpZjXbvuPYgDHAsaCP0xmf0V9
 /5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xSDql4+/4hjZ41MoR3OqxD/rR+Fa1of3CAUT/0rGzk=;
 b=NMDawuFn+Qt7Ydm+16g6msAJXyuPy2tiFbMqjK94Xb2Wc9E0/mMO1u99zyMz20Xyrv
 EKXkTG4+yalXr3vloP3V1Jgo5NOBhj+4Aii+N1kYyNaUREAkJTnUkIQfRJK/Ps95/2Ye
 s3O9a8giiISiEkxPQ9pFTgZtCZuWrrZn8kSx9qqXFd20XJA+CSiLiTNL5lZhzA/aAJFS
 DJJR3WKbFz7et+Wlk/2FEUj86gI0wkucYCWIXB8isl75r1iYRTglu3RwXzUoF4+4jFNU
 ggTw/w/DJGmfSsOVJg2z4IkmGvImeiLvmbTMX5ayA6qKCZbYLNomneCl+A5FOFFtqA4w
 EfoQ==
X-Gm-Message-State: AOAM533ypsJ9xQQx4yiYv5FcsQszc88LNJK/Y3bu+sUku/tA2+kjcA59
 eL1UNbTsa0peqgeJ21MYCKY0Yee/d9z8nQ==
X-Google-Smtp-Source: ABdhPJwbxNLt10X6IC5WMPvrvBXFh8v0QL6daKLkC3Hs9eyl0UOtr25wZnJX58DF35IGRW5ostEO8w==
X-Received: by 2002:a17:902:b716:b0:141:d36c:78fc with SMTP id
 d22-20020a170902b71600b00141d36c78fcmr18392948pls.59.1640034350629; 
 Mon, 20 Dec 2021 13:05:50 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/24] linux-user/xtensa: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:28 -0800
Message-Id: <20211220210529.150423-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 linux-user/xtensa/cpu_loop.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index a83490ab35..34775feb7c 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -126,7 +126,6 @@ static void xtensa_underflow12(CPUXtensaState *env)
 void cpu_loop(CPUXtensaState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -163,14 +162,12 @@ void cpu_loop(CPUXtensaState *env)
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
@@ -219,11 +216,8 @@ void cpu_loop(CPUXtensaState *env)
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
@@ -232,10 +226,8 @@ void cpu_loop(CPUXtensaState *env)
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


