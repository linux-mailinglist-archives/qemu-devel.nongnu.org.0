Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E337747B4CD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:10:36 +0100 (CET)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPvY-0000UY-0y
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:10:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqp-0000Tt-74
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:43 -0500
Received: from [2607:f8b0:4864:20::436] (port=33584
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqm-0005ua-Lz
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:42 -0500
Received: by mail-pf1-x436.google.com with SMTP id 205so5608599pfu.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QjcTOyfouWebLv6OWxrEWdluQ6cixLMqNIiFZ1J5dvA=;
 b=c1U4eSTw+mV2Ce0rQDWfiyKEXY6vSAJco4vuqyM30mRdJ74JkatyH1iSRpx9LL35TS
 nuwldtnT0Y1D5kX2EiwZxk134FR/pvknrwzKjopTjAt7DRbwTzY4fVvz4jD87Hw48ZTK
 3D1wFFC2w4fHJyTzVMW7WMCBQSvdj8BG1LD2iBWWfecrzwCNebtmACCaJXZDMTq2aArm
 BGMCGZmrp94TsCtO/k3pqt0RgejBuBaD77R/zG64qkDgKlyeSNztd5j/JILxKHz8qLk+
 1yWltpj9c/fFafOHRpJjsKkYEIL9Qft8altjV+9GNbSmbp18bjebo3+KfC/bTwjtZ3NX
 VhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjcTOyfouWebLv6OWxrEWdluQ6cixLMqNIiFZ1J5dvA=;
 b=K2GW9QbcddNGscjsa2St97y614ho/kKzfAS2vQsKrfavLE4jmoRC+KqPlbAurz5FZJ
 rv7L9lVKxqR23xY8CxcJqYiJxdFRu85brNMSqtSXyZ68W5p4b3Ep06ENAb1rU9+nNlcw
 CSvfY1NREwQs8E0FfyRp9fLN0yc/jDkqqqbi8WYQVUjC/czDlG/bsx/CLliWF9FN+Ln3
 UJr7AIZ782hE7+/uwnhUrZo7JEnzK5DeomYepBPUwyv1SBugNegZ7HVYWC2tki/0w3Uk
 O76OMZmw2rTsJPYWT3AbrV/vwOXlLZOGsJubZyox0EedhEoARa2djuSAX3+OFvaPzoym
 ReKQ==
X-Gm-Message-State: AOAM532wLHZ+djPIFihn9ZHEX98188LzJfz0wOoQPtAKFKoYF4QfzXQt
 yzMYDPMXx2VLoxnPldFGR/+x88CAjFfhbQ==
X-Google-Smtp-Source: ABdhPJxwld0SHOM581uyxIsSrYlBBGdUr4mLu9SCaYQwSRQOlnObMg6sq7LpbqiIbPJPdFIc21Os0Q==
X-Received: by 2002:a05:6a00:2405:b0:4a8:3294:743e with SMTP id
 z5-20020a056a00240500b004a83294743emr18004289pfh.61.1640034339535; 
 Mon, 20 Dec 2021 13:05:39 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/24] linux-user/m68k: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:15 -0800
Message-Id: <20211220210529.150423-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
 linux-user/m68k/cpu_loop.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 790bd558c3..f6ea3b97ec 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -29,7 +29,6 @@ void cpu_loop(CPUM68KState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n;
-    target_siginfo_t info;
 
     for(;;) {
         cpu_exec_start(cs);
@@ -46,25 +45,13 @@ void cpu_loop(CPUM68KState *env)
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
@@ -91,10 +78,7 @@ void cpu_loop(CPUM68KState *env)
             /* just indicate that signals should be handled asap */
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


