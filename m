Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477EE47B4E6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:16:19 +0100 (CET)
Received: from localhost ([::1]:54776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ14-0003km-CO
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqz-0000nW-Bt
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:53 -0500
Received: from [2607:f8b0:4864:20::1035] (port=35815
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqt-0005w4-0M
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:48 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso424538pji.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RaLycKVdfV0ekqtdy8hAK0du2MJDBZ+dYKE4BFXj/j0=;
 b=QpyvjN8bafi0+zjhL9sWtkBMGJKyZvxKtw5C4o3t2Ydt5pzfa1J/QUXwDOXh44AA1O
 WPIVAXcLfX6S7LBkiYYR2PFuPTSK2lDP0q3kRI09aUU2U5cVY49Yjytngg2rqZ/RvI7n
 2RlqRuKJ8/DBCJNH+4M81vWTuqQRfbWAaRdu0L/xb767upDMbOfiGFvGHK2cqz6O5PHA
 D1D69+cXgjPwEzWJ5Vn+Cc0NoXr6zV/eKAET8yG1XX972iEN1xKLCwnm6QJ+fl8gUN8d
 CwZzf/6aVZp+4/TfD75RItiZI5LH7lZ3pSwxjrO7OpBzEPnnYH1VLjTy//TADmReYynB
 5zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RaLycKVdfV0ekqtdy8hAK0du2MJDBZ+dYKE4BFXj/j0=;
 b=p+xIHLs8otw3iccYjWZbSxaRuJimpW4MGyYqaMYWeKV+3UewSPCgFR0CDPdQIo63OP
 tLmIVf5hIIdoQNPjJITV8f1NramE5ixvb/TTQNtU/T6EJFbwvai6PPG+mn0HFiYQmMZ/
 c/gSIO5gQgN8tQfxw7A8Spw+r6PfRqGvXSPvZYdMpsrIiLmbd+YWBSRod5Me+2ye7R7Q
 WTEROEP7ai4HRZQdqteoFDdQErwL/OgwyiGmN46mC3xfwJjcwH8rGeZcqN2QNvIQOXBY
 vXU+p1lwJwqmBxyfWTPwIejPP7fnRnODcPUCSpBH9+RlU3aEcluB95LIjelAoHxfI3Vl
 DI/A==
X-Gm-Message-State: AOAM531JXOqPUS5QE9kGFhIf6E/lY11IYvahaeCmNRp+sFngM7e8jRX3
 FgCnpbE1IF5spV+hk6rQzQqTDn1vxNer5A==
X-Google-Smtp-Source: ABdhPJx/TUwO6XaBF5kwmYce/r/3DQZQxaA1PL74zz8Vbr5Tn2wZw/9hTOQ05yr5+3YRomRswt5Pjg==
X-Received: by 2002:a17:90b:350c:: with SMTP id
 ls12mr920976pjb.197.1640034345132; 
 Mon, 20 Dec 2021 13:05:45 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/24] linux-user/openrisc: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:22 -0800
Message-Id: <20211220210529.150423-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index 3cfdbbf037..9b3d6743d2 100644
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


