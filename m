Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4CD444360
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:24:50 +0100 (CET)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHC6-0005Hq-0m
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwp-0002Xk-Fq
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:03 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:45598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwn-00056u-Cn
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:03 -0400
Received: by mail-qt1-x834.google.com with SMTP id g13so488577qtk.12
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g1qaOZHLXK14ZfaZ8YTeXXSLRoUxo2kF1DzkBRJBkhg=;
 b=FVC018KH8EOYDysCdqIUaDCV/C0bjH4xCKo5gFEoPFqxRJYPlYGEygPNkDbmqair26
 9Umj0mrbV77J3mFR4R+TdfNJVYUX5vzFLLqNieazieOB2w6n6dBEXoSNvinn0Sb34FIm
 m+BYYqaFwEAMyKTAgVtZs7FbsNcNbWotcu13wVct6TVMfVNYOK4pvrcKz0rwvewkHTyG
 39ZLMIxECVvB+3pp9Ce8UeBw7N4/gnQDdF8haljtUhVLTZzKTWJnIld8Da+HwITBAsg0
 fTobW2tfWJWyz8nqHelpH6N7mTcgVTvVPtfy9xObMer56LybBki8eKjbO9f1HZUmVa07
 HLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g1qaOZHLXK14ZfaZ8YTeXXSLRoUxo2kF1DzkBRJBkhg=;
 b=smg+sQLK++9PZ1FBcj1wRBpTJkXyak+b1mEFgZZwfgzgsGNcdvm60L0fHeeekTSX/z
 8nvlveda+EfSF9m6jQZEW8iK2dWiuFddGKWsxjUSNMu03fGpes+24pnW6EHYFGr+k28z
 q4zftUHovemy+u81c/UOWy9NVNseN7A/djM8lJcJo4sLQuCLz0O824S+AxTqCzvB8yfI
 Sn/rlvjXiEIVLuOk4pjSqtv1ziNJ7aFvu1BIu10UAobVf/uvQ0GAKFX+r4tjntjL76+s
 OA2qtUx/HyP4XOrhGJBDYgPEa0bvbwswvKHvpWtpLXuRcyr2mMq5Ats9KjzZkcudYtcS
 V4pw==
X-Gm-Message-State: AOAM530CjrRBdrTp+h78tc6XDP1k1JuzNqWTCotCStBn0yHzM3ZcPQJs
 BwQDCmPvTbHo+MygHVr9v8FEGYMUcDUabg==
X-Google-Smtp-Source: ABdhPJzacQc9qqXoX8ZRE72jmVUvwhsrHY5tlSDuqgUSBN1rD+1rXAb69SE5rOPM4rztjWnUZzkOCw==
X-Received: by 2002:ac8:4e94:: with SMTP id 20mr30320059qtp.150.1635948540411; 
 Wed, 03 Nov 2021 07:09:00 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:09:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/23] linux-user/openrisc: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:41 -0400
Message-Id: <20211103140847.454070-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

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


