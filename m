Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E0487E97
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:54:04 +0100 (CET)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xBT-0003KW-Ow
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:54:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wrA-0005LH-5I
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:04 -0500
Received: from [2607:f8b0:4864:20::102e] (port=41882
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr8-0007rs-4i
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:03 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so7635375pjp.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7IWt5TJpvIuMjQ2ZoKSDzqbrC2a4qCP2oWszVzq9gw=;
 b=ru9I+D9JMi63GzrYSwMY7LHzN2JQACOxaFfcI4CfVigxlkFqOlrLHLGoVlf588Os+s
 umDno+vLBqvXxqOMWhqMo5kXRy/sFy04/QcWxfMLSc9q11TeKqBUAbzwxBEddtM+kX1X
 cwoTi5LVRlWtYbaQW8HfwxsA4ShsByTLfZIkD42hx1cuHLSR9x9n59cXOCEICeKTu+cD
 +0gMgjIit1hTLVawdFhW3E86iMXV0Cl5NFQeIHdGcMSaLddt6q7RV3421Q7pbRbFzgKA
 a93E0+IaXcbVHicJlhGC/K+3gJTwaT+7haJoxgMPqSf9sD20ZWSf+f1KE2i7a6QtrQaB
 KKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7IWt5TJpvIuMjQ2ZoKSDzqbrC2a4qCP2oWszVzq9gw=;
 b=p3bbDXwiCov0ZDdQFqZO+GGxydYE6szXHmyaPxBTgebll4EGRdtFNI8R2xtHzl1JRC
 W3Sc6CvQ0kDkdOun+W7dRPxW4vw3X3LHG1WVz281qh232vpF2c3tqmZKSMSc3JUSMHcg
 mQ0jQAMY8gUN+JmtBpozDErOrmTZyXKH+k1nlvq/EyL+OAd12NlH3MIY+EkVYbRX0JQe
 EWigFbM0SbYMnT5f49Z2rDMgMrC9YRWpOqpp2mq/r9YLTEEce3HG0doF07MwoFa/XNeg
 5gHqC2uuxp/kky+En8hm/YupX+NFc+fBvBUp0tvQcwYJhBHuI1xeoIpHl+JXhf8nSFTW
 zzUg==
X-Gm-Message-State: AOAM5303qNZAVYcVtbkWVrpKL3Nu14d3n+Myq2QO7zYftF30upa8/y1r
 0vp8Moz6aiGBQH7IZLxCXMKMlpMt08QuAw==
X-Google-Smtp-Source: ABdhPJw3yqot5nOurnDPRSRLXC0zY7x3hWemRguO0CjrHhFWSwevD8dRmsn8VjnMSTjC6sGzZXm2sA==
X-Received: by 2002:a17:90b:1c88:: with SMTP id
 oo8mr16986428pjb.212.1641591179208; 
 Fri, 07 Jan 2022 13:32:59 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/24] linux-user/xtensa: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:43 -0800
Message-Id: <20220107213243.212806-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
index 6bc6d6dee6..d51ce05392 100644
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


