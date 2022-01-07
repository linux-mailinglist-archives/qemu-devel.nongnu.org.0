Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5A487EAE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:57:58 +0100 (CET)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xFF-0002Gz-8z
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:57:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr5-0005D8-4D
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:59 -0500
Received: from [2607:f8b0:4864:20::1030] (port=39879
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr2-0007qd-Ot
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:58 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso11741712pjm.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JInWc8HbqwhtPM0FLPOWoh/UvMIPVblznx96Z5wDe6g=;
 b=qn/ucyFXNiIAF5wI42YerykxIPwzp41FmU2B8y7OufRN1noW8u+fNNrcAHUSn2T+0+
 jH402FIBB6uerV3GEQPKvEg7svM+G1uELRn13YeJl4NUcXjFANHs7pMev329SqleuEr9
 d99zTugBY5YBqiPvyIUyJSnYlJQpukomPNdRCPW+utZ/jWcCMlcV6DG/4txVNHRRw83n
 JXJVBgXEAmx9UcbUVkqmObO8cULDIjYw7S0Cmu8yE1W8E+QREFykU9WXv7zMAHEPsFi6
 7PHQDvcfiP3MmmzmVmyf2+q1sl4CU/mcEXKY48G9KOiuBdoBz0N/rjkrhSvrWR4AUo8v
 7d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JInWc8HbqwhtPM0FLPOWoh/UvMIPVblznx96Z5wDe6g=;
 b=IQ4NnJPUpa63XppCb/pEbZ5BbOpIQBEB6jP9h3Iie8K3NuGBIl32lati+7iqhYoE1u
 sVnv74n+eOoHKQ7eiBi3bWeR2ZNk4BpOAZ6Hz53Daa4WcrHF8E6Zf/kS5NM2pd+CTUtK
 pXAZG2hLlL++eDrDkcqJKteXgF6l7eizlig8/aQ9R11EmdKql3xK2gzwrOu2hpUCmBvi
 /wDBoON5QHPf3w9r8U7pH/Oo/U0U7iX0WI8OWIPuVMnLCn9WDkRK0RLRO7R77RYMQ7V8
 JUfJ4qOVETx5pzEGvoZITBzNGdntSVsQd2XEB+JCHoTGlgoJibTbC0qtOfOLpFwanV/+
 Njrg==
X-Gm-Message-State: AOAM531GIFLz0dK+Dl+d7hDAYZiTJz2a6CUGxWaEFk3v0PovyioWIeCR
 oJeUO28KlV0JfOnJ8HXZlDCBwZjCTVOu1g==
X-Google-Smtp-Source: ABdhPJz4K+InsokPnZD2V9OgIZ0tVgu5Sd5qnkStx299E3ulifsXAicKTeTC3Tm2quOSLLqI+oBI/A==
X-Received: by 2002:a17:90b:38c1:: with SMTP id
 nn1mr17980852pjb.65.1641591175631; 
 Fri, 07 Jan 2022 13:32:55 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/24] linux-user/openrisc: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:37 -0800
Message-Id: <20220107213243.212806-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/cpu_loop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 592901a68b..7683bea064 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -29,7 +29,6 @@ void cpu_loop(CPUOpenRISCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     for (;;) {
         cpu_exec_start(cs);
@@ -55,27 +54,16 @@ void cpu_loop(CPUOpenRISCState *env)
             }
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


