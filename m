Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF20440ACB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:57:10 +0200 (CEST)
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsbN-0000gd-QH
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryg-0002Ht-68
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:10 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryd-0000Ch-CQ
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:09 -0400
Received: by mail-pj1-x1033.google.com with SMTP id gn3so9425142pjb.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OmzSkk+8uZ7WQNpgJweNybw+HfMXuLaYRrksniy1sko=;
 b=tuoQPu0Y+e7m1SvdA1gP00pMkLWFBRULTMvJjHhuVyFL6Cfmh8WZDw1hRTsD2H/fgv
 qNaMLEsPaw02u09zaLTa1t5O7wdZISOqQQ9TZ9F+1SPUcL8zBWmXb6w1o8KE9SEGjBdM
 DmaSAaX65AbaiTrevca9odLdwSyXQWfs3prD8Ufl2FwO4xqtIc0N0hykaWKGhMeejS7Z
 wVstOJ9QrZkyeC/e95pSuyMFoAo19pircShNSPs3zWXl4+ITFXRGxRzX3qt6cF4TlmwW
 0WkUrfwPNoulxtU4uPPLudvnfs05/pywAtbHjA6wdlz+aAmbutm7G4AEQec9yebCgQ/w
 3E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmzSkk+8uZ7WQNpgJweNybw+HfMXuLaYRrksniy1sko=;
 b=PGN6LAHOfM1w+UbbP13fDcL0oE5L0Areec7Ywk7z/ibKbERksCY9d/P8TTOciWA73U
 +Un3T+tTwHbGBUbq1rLv8eoNQWLVPF89dZKutB3s+NS9EPzMfMO28xGvJDCiG1Xnl0y3
 PscLLEdv7hWKUyUJdQvdIF8L7AEeaO6WVnb2j14biGrFDdCUuphvxK4oZ5C1mnTMDvkc
 bWoY+gQzDUBIIxu0VrAS+lJgNxvMGFLID/GroAZfjmL4X5yIJd5CuY/4u5BqDzISj2a/
 YEBP2jh63xzZTqh+n550bdCLsGSunsBmmhGaEJr3UfkaXQ9GMPzlgmeJbNjexhKb5Pno
 ACoA==
X-Gm-Message-State: AOAM531KqlhlWDGq8SmOLyVQPxTh1w822XTzS5XaLp+hech0NOElsLe1
 yymuklmJB6Y1j46uOZc0JR0kmq29cHbXUA==
X-Google-Smtp-Source: ABdhPJwUXaT5PwRqkLIkBQSPVAWlF6KxxD9a56NoGjqQUlYg1A0lSL0dpa3E/QkZldl0j772Y1dW2w==
X-Received: by 2002:a17:90a:928a:: with SMTP id
 n10mr27076997pjo.128.1635614226168; 
 Sat, 30 Oct 2021 10:17:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 32/66] linux-user/openrisc: Abort for EXCP_RANGE, EXCP_FPE
Date: Sat, 30 Oct 2021 10:16:01 -0700
Message-Id: <20211030171635.1689530-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU does not allow the system control bits for either exception to
be enabled in linux-user, therefore both exceptions are dead code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/cpu_loop.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index f6360db47c..10b7147f68 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -56,7 +56,6 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_DPF:
         case EXCP_IPF:
-        case EXCP_RANGE:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
@@ -77,13 +76,6 @@ void cpu_loop(CPUOpenRISCState *env)
             info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_INTERRUPT:
             /* We processed the pending cpu work above.  */
             break;
@@ -96,6 +88,15 @@ void cpu_loop(CPUOpenRISCState *env)
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
+        case EXCP_RANGE:
+            /* Requires SR.OVE set, which linux-user won't do. */
+            cpu_abort(cs, "Unexpected RANGE exception");
+        case EXCP_FPE:
+            /*
+             * Requires FPSCR.FPEE set.  Writes to FPSCR from usermode not
+             * yet enabled in kernel ABI, so linux-user does not either.
+             */
+            cpu_abort(cs, "Unexpected FPE exception");
         default:
             g_assert_not_reached();
         }
-- 
2.25.1


