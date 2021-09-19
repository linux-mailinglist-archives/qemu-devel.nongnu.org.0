Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16941092E
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:10:14 +0200 (CEST)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmHV-0008UR-AO
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5D-0003dZ-4C
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:31 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm59-00056k-78
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:29 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w19so12794757pfn.12
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhmimCfw8NlAnwYZtRGPVFLDovkTiGEy8ba0NCac4JA=;
 b=Y0D6QoUBJHbJ5527LbcnNozIWEQenJAQLzZmNvPCTnnUN42RJ4K9lT4wp+VT6qYYWi
 QpfdGBuM2FNvvFzQFtOOFDb+wYO1EGcM7mJTsWYziMv/XckfbMV4jzDTdXLSo/M2cvs6
 n21aQFHjwSfw5qFZbtjtCkPS5tgBm4zyNSNxyd2OiwVx6RKrtZzN22Sr/U6qoftvF6pY
 DBRs+96EY2A70x/NZVDfLLgXGwpeLVm1PVziszp9vgkf+GhTUhLwmG7f7hQAjPBxIsrZ
 6g3dkIoIplBFsFSA+oqsvof+UzdxQW7g170473OdlLL16bNwQ8UHkG5kJLm9/Qm2eNqc
 R0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhmimCfw8NlAnwYZtRGPVFLDovkTiGEy8ba0NCac4JA=;
 b=kIm98j/KDITysRhAJJxzdbpLy5ycu0yoGuBKCEf7yO5SolV8bv9TZ24DUyNTgYa6z3
 F/1LlVcr+TMbTdFNIxClLQ0qHqNkp8QW5TqT1IIMAQAgNs3xA+eEK5Xs4mklUZbNSNIv
 zYSWvxUCAh+a00nqbphDrVVmRheEZ8/g7+EB/jrDNxG8wA7DR/aGU/H3M/fCXGL9fQAG
 EOMRcz/E8qSke44ZIVk+xhgCGeMFue5MmKz2QH/wqVyn1J8wtKHV2qBS5SPx3ER9Pzhd
 MN9RSIZ1lh/rn/GQoUWOsGdqY+KPvE6LxLMiQKJFK3qGEDUb4w0fgfIVyz8OxHaJLDUc
 mXTA==
X-Gm-Message-State: AOAM5339E1bC7zz6D8tVGnl9x4Ar+Sc42q8MJqv2qcXT5TPGT1a5G+Dp
 6xToGgXf0iCM5VfeXRWOJzFO9KdRBgPnww==
X-Google-Smtp-Source: ABdhPJyL2LUJ075Fw+7ECnlhuTz0TxvKEwmfgPDF52dIHMfiDdu7CjsXbjNZqQUYaFeaMlwB+1D5EA==
X-Received: by 2002:a62:b515:0:b0:438:42ab:2742 with SMTP id
 y21-20020a62b515000000b0043842ab2742mr18722679pfe.77.1632016645894; 
 Sat, 18 Sep 2021 18:57:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/25] linux-user/hppa: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:00 -0700
Message-Id: <20210919015718.466207-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
and calling queue_signal.  Fill in the missing PC for SIGTRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a6122b3594..c01ccbbdc0 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 static abi_ulong hppa_lws(CPUHPPAState *env)
 {
@@ -108,7 +110,6 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
 void cpu_loop(CPUHPPAState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -143,35 +144,20 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_b = env->gr[31] + 4;
             break;
         case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->cr[CR_IOR]);
             break;
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
         case EXCP_COND:
         case EXCP_ASSIST:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
-- 
2.25.1


