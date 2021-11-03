Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A341444380
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:27:26 +0100 (CET)
Received: from localhost ([::1]:53296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHEb-00013G-M4
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwn-0002Qk-Cq
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:01 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:44027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwl-00055T-9q
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:01 -0400
Received: by mail-qt1-x830.google.com with SMTP id 8so903323qty.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sVhhElrpe+4XPKy6R1NWowFrVYM3GvIonkol7qAjv2A=;
 b=OxeTtimAvRbEY5x5nVTZeQcshfaXUGeMM1uV7e3uohIn9pMTXYFD9I5J173kx2cKak
 X+jnOfGm0YPuZ0DNmFBMOJvMkrPVihK0BTemnihktfOxuJ5LbuF1j4359zxyowsSHS9E
 60aUS4ZH2Gq9KKWPS4AI7a06VYAsXnV2FU3Iz3ibLe4alGk3T7O3PvKYzmOq3R7eLxzT
 MrH6Kis7dEYjb6DoBa3pwMT3JSDWO/uBflYxn7aZ1K6qBDQljCHdb+IuE+OGurzOoV1K
 yospk1O1zK6ErY2Lxju+WRQ1RvL9svV93jJghwYAjLW45j3uQ7uCpn6PnvmHOFJfUja0
 mZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVhhElrpe+4XPKy6R1NWowFrVYM3GvIonkol7qAjv2A=;
 b=ZJJ8RqslKRQQSbQsXJQ0oSs0lOZvQY8GNa7ZJMWGQmIIwxGgi6RuJQe2TwghDhYkC3
 hboDIY4CDqEhket/ashdqJBFdTFLBrs/fkAVSqmnHf+3O5tBR7fxXWDepGrXaFqf02G6
 Iu8Q5pryDqmK7OHhYU8Rro6CdR/UhPj/BnxrEKOPUX81omXM+mcVpoZjXpllYFNHKCQh
 QoB3zAr3UpYLl7HJ1BtDp1T2GbyzdccTgfCTSAcufYAGsADttkAK1uSGQTKhPgA2uu4d
 xf478N+VmQQsAAwiaNPRXPyVGr8oXvMlfLlxeOoiW8g/6uRjgKwSamAR5NdSR965vGwZ
 C7vg==
X-Gm-Message-State: AOAM531qGbCjl0KDRBwrU4b5vrfhS0B1DVMdr94ZYSQeZJkfSpTuxl1i
 MH0qTWg/MiNFNewPtcp7nh8JkQZ8zXvb0A==
X-Google-Smtp-Source: ABdhPJzhyixmANMKaewzfvL0UiD85jHM7BJ8yj1Y8KbGbl2Q2/12d0dMuKo6ZoxlC8d12gJoBLOUig==
X-Received: by 2002:a05:622a:1010:: with SMTP id
 d16mr47949927qte.70.1635948538425; 
 Wed, 03 Nov 2021 07:08:58 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/23] linux-user/mips: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:38 -0400
Message-Id: <20211103140847.454070-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP
and SIGFPE; use force_sig (SI_KERNEL) for EXCP_DSPDIS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 7317194cc3..034b31f853 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -64,8 +64,7 @@ static void do_tr_or_bp(CPUMIPSState *env, unsigned int code, bool trap)
 void cpu_loop(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
-    int trapnr;
+    int trapnr, si_code;
     abi_long ret;
 # ifdef TARGET_ABI_MIPSO32
     unsigned int syscall_num;
@@ -156,43 +155,32 @@ done_syscall:
             break;
         case EXCP_CpU:
         case EXCP_RI:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = 0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        case EXCP_DSPDIS:
+            force_sig(TARGET_SIGILL);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
-        case EXCP_DSPDIS:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPC;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT,
+                            env->active_tc.PC);
             break;
         case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_FLTUNK;
+            si_code = TARGET_FPE_FLTUNK;
             if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_INVALID) {
-                info.si_code = TARGET_FPE_FLTINV;
+                si_code = TARGET_FPE_FLTINV;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_DIV0) {
-                info.si_code = TARGET_FPE_FLTDIV;
+                si_code = TARGET_FPE_FLTDIV;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_OVERFLOW) {
-                info.si_code = TARGET_FPE_FLTOVF;
+                si_code = TARGET_FPE_FLTOVF;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_UNDERFLOW) {
-                info.si_code = TARGET_FPE_FLTUND;
+                si_code = TARGET_FPE_FLTUND;
             } else if (GET_FP_CAUSE(env->active_fpu.fcr31) & FP_INEXACT) {
-                info.si_code = TARGET_FPE_FLTRES;
+                si_code = TARGET_FPE_FLTRES;
             }
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, si_code, env->active_tc.PC);
             break;
+
         /* The code below was inspired by the MIPS Linux kernel trap
          * handling code in arch/mips/kernel/traps.c.
          */
-- 
2.25.1


