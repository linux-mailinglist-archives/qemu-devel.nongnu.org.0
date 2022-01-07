Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADD4487E71
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:44:44 +0100 (CET)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5x2S-0003sE-1Y
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqw-00057u-C1
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:50 -0500
Received: from [2607:f8b0:4864:20::432] (port=43911
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqu-0007nI-Su
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:50 -0500
Received: by mail-pf1-x432.google.com with SMTP id 196so6161795pfw.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ca53GjQ9RuhRXPL4DhHW76qKdYdJSEjrupmNQVoTgGw=;
 b=bvalEP/lzTB9fFpx8FUPn9tBqvZimS2X6a+6CsFKZUzus6kg1CZyDiqREy0GJKYygv
 k4RvgfDqgxmB/wdsNtXRWTzCX4Lu/DPq00Chir3KumghAzmbhIPg0AuEC/mfroLyBRTM
 Z6Sdp2DB/652+tHHdJJagcE4xNtP5Awac7xiR0mTNr7VgYMrDhB1KoO1y++PFT5ftlNE
 fCBDN1RuEGuLQtawAe84sCwhY434LBPnXAXuahXh1i6U/1WxC5maSYn1rLQry9ih01Yk
 YvKEi03DctGsAbNhO3JPj7wVUW+exoc4US+T2f3scYGOTBasIoKnK4FlT+Q7dN4CDJ63
 7csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ca53GjQ9RuhRXPL4DhHW76qKdYdJSEjrupmNQVoTgGw=;
 b=p78SmeI7lxZ4gi3+U9itdCHJF4PnlSpzdC7t2hTjEyXz2ZVC4QG4nRm2N0LBUAgarB
 tD1ajZrHEzAObWd3Lil+jvyCAF8IDHr3mKA/vxXVzwLdqduREFQbz1ifVm2RqfwK24F/
 U8EwYQMQmrAtiSkyMRP2jaYhMkyhyCJesgIjuX8AIhZXnRhna9jrRK9eq9bRaVOCZnvY
 X+1vY51fSJQZx6zlKhDNZ8vE7C1w5IlWteZOXqIuIF6FV5oVNxlzShbzez4KSFdfecUT
 oZjWuVptQHIA2/Semi+zgFEHWWKWiOZEqfsVnCpCQkpCQzNpnTa1+WXTRtDQI0nF6aKt
 PaGg==
X-Gm-Message-State: AOAM531KPY7LyjeCO95JMB5kDhLohWbf1EHG4qzhXodWDBSKOTQ1J+I1
 Mn809J0QisDqXZYhoMmGZyfFAi07NtaeuQ==
X-Google-Smtp-Source: ABdhPJzEYuFy+VeX+xSGqrkaixn71ucMfYP6pKwE2xoB1hwlWJ0ZI/yeL3rYxY3rUCkutWJlLOYvUQ==
X-Received: by 2002:a63:905:: with SMTP id 5mr58455024pgj.485.1641591167640;
 Fri, 07 Jan 2022 13:32:47 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/24] linux-user/hppa: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:24 -0800
Message-Id: <20220107213243.212806-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
and calling queue_signal.  Fill in the missing PC for SIGTRAP
and missing si_code for SIGBUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a47a63176b..4740da1b7a 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -110,7 +110,6 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
 void cpu_loop(CPUHPPAState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -147,26 +146,15 @@ void cpu_loop(CPUHPPAState *env)
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


