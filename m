Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3A41092D
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:09:05 +0200 (CEST)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmGO-0006f4-9J
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5K-00042j-Kf
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:40 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5J-0005F3-2q
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:38 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so12899702pff.3
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uagdci1N1+7PPBzUsN0twzD+fJNph41iqYW8v+b0TiA=;
 b=uGzRtUPidbNDZvsyY5KOPOXGIuZBIOq0wAcLFGquDGbRoZagGvtChqB1ilhfdi+kCg
 //VmteJkATboUoHsXfbca99VrlC9CDzKuRMEDTXcD3Lz1EaRbkde3DlV5Z6z5/NqpF4i
 /W+Lhiv4KnlxVTh0/FU5HuZAyeF4DjmvJd0fKDwQ6ER2xCABDoBNR9h0UfyzKEZfMg5f
 09hm677wP8huGF2UYzj6+APFMPb5EQE6l/mJlhOb8+6hPokcfYw+j4DN0Rpx3ViDmTGU
 Db84mLKs2OVJ4rcEoLfneBxCKtpSUFNAxdIE6arX3UvbAPG/+bTZ8EF3cBho/xVsnMQ/
 y9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uagdci1N1+7PPBzUsN0twzD+fJNph41iqYW8v+b0TiA=;
 b=b5D3moGfVvky8Kydb6oXNdcmT2iL3u3kSoNgeqiJ0wPj7bFkdlYKW9FsTPmBNxBpqX
 16h3NKFlefL3Y2+KijtHsuQym+tRdJY7vXPm/1ciEHzssyjiwNe1MbIMI5IH2c1UxeBv
 B7ObgR6QXqsSP7TK8a9iA+nYuAOTWtzDuNQP/lJRuRjWn0K3DPRsUta78bcVe50RWhFM
 g7Isw8+RENJL2I2mIDiMEVmft5cN3dyQZYIeWdkQRv0ohqTLSc+MSxJj2XrGf9VIKv67
 CauvO9SUG3Py5dBnYE8zlCmKq34QIVhvaAFkIOcX7zauTeP1NiTiTOXgbYT4cAE67zvt
 rfuw==
X-Gm-Message-State: AOAM532+MTQ2hPaUyU17mpF6QBsv1OgIDbrjXogyOyf0h4z7hKQG7UTj
 J5J2bsrWEKrjMdmwkgTvjIApZ4obKsSEjg==
X-Google-Smtp-Source: ABdhPJw1lDxlbXtZJRaOcfgl3lvK+hp+W66ZbBIyNj9DkTN9pJcSnQZQWzHDpq2FxtK4PxFIDdPh9A==
X-Received: by 2002:a62:d41e:0:b0:447:53ac:9e39 with SMTP id
 a30-20020a62d41e000000b0044753ac9e39mr3410910pfh.72.1632016655746; 
 Sat, 18 Sep 2021 18:57:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/25] linux-user/openrisc: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:12 -0700
Message-Id: <20210919015718.466207-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
 linux-user/openrisc/cpu_loop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 5e50c0d743..9f8dd0afd6 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -28,7 +28,6 @@ void cpu_loop(CPUOpenRISCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     for (;;) {
         cpu_exec_start(cs);
@@ -59,27 +58,16 @@ void cpu_loop(CPUOpenRISCState *env)
             force_sig(TARGET_SIGSEGV);
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


