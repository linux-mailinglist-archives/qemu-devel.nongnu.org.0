Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B30487E62
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:39:16 +0100 (CET)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wx9-0005nG-1x
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:39:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqu-00057p-PF
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:50 -0500
Received: from [2607:f8b0:4864:20::52b] (port=43679
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqs-0007lf-Lw
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:48 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 8so6481096pgc.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwWk0WZDtoCdr/BQ+wy5whxmME6fmMq51sJIQEkG8UQ=;
 b=DUK9d69HZDkSgCk+JMnw4frbTHSlpGqbY7ulCAFmucA3TUpJcXkOIevnB+BO3cPmSi
 oY2V8gWMpVqBpT+pnNBsOtfO3oFCcQpUYv3TrA29VnLa8o88LXoZvlCwoFzKxH52bTcH
 bynz106HUykw7/JkMUMqWS+zP+yOD7pU/lkQdLoxL9xf4+uYCl2ZBsjiIGrFEMYTQuMH
 9c3YAilc0ElDefGWykKg9PV5oDxJvew+VeX1WbJ2J/v7IQdaQQ2tNEP73zcQGiTH0IrD
 2C7jAi0NMiep08/GEFN6Gnamh9PH1TNmJnvyornGKglq3ZDvTKVgJLsFMb7eLTnDmN9+
 wN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwWk0WZDtoCdr/BQ+wy5whxmME6fmMq51sJIQEkG8UQ=;
 b=CLmllXt2OJew+idq61rUhX9ft2j4lAOBP/RXwwgBaO9TNO0vE25R/6ha8pDh6FSf4A
 5BepId4q03gFmCiNQDws5WdINxTEyp6ZPcrQrvtXbsyDNwdctxC3HWbwyMItqVZ9fMYq
 +qle1TUs49glXyGkMzMmWilkyuaeMXR99ktmO0UzrC5HRO7rzYZlWHol8RdRK8+yrc3w
 0wqYqZ7dWPGl7h/LXytnm//GLmd/1Y/Iozwa/7do5FE+wfd1Y3RH/3UuaYYU9h9I7Rgj
 cQOcV7fDUNb8+4A+yruqhNPlxMjb2A6wGGnTs85OSBdIg/D64HzgvOW9CV8bF0aTsoO8
 Rpcg==
X-Gm-Message-State: AOAM5321UJKoN6PdClTszQFTLQuVEaV8rew8tMr3AZOzpL67pieu5WgD
 Oiw0t/hviE9fS4Uxby4tfdhmMquh6Vy4TA==
X-Google-Smtp-Source: ABdhPJw+mWchQGnmPFMUqoRaX3GMxoc6+fCAKO9ZUDBCS5MS50UqYZMbjtc3hweEj2crfj0RfCUaVQ==
X-Received: by 2002:a63:6945:: with SMTP id e66mr57320935pgc.237.1641591165392; 
 Fri, 07 Jan 2022 13:32:45 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/24] linux-user/alpha: Set TRAP_UNK for bugchk and
 unknown gentrap
Date: Fri,  7 Jan 2022 13:32:20 -0800
Message-Id: <20220107213243.212806-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

These si_codes were changed in 535906c684fca, for linux 4.17.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h   | 1 +
 linux-user/alpha/cpu_loop.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index cca561f622..18bed558fe 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -715,6 +715,7 @@ typedef struct target_siginfo {
 #define TARGET_TRAP_TRACE	(2)	/* process trace trap */
 #define TARGET_TRAP_BRANCH      (3)     /* process taken branch trap */
 #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
+#define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
 
 struct target_rlimit {
         abi_ulong   rlim_cur;
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 37c33f0ccd..96466b23f9 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -86,7 +86,7 @@ void cpu_loop(CPUAlphaState *env)
                 /* BUGCHK */
                 info.si_signo = TARGET_SIGTRAP;
                 info.si_errno = 0;
-                info.si_code = 0;
+                info.si_code = TARGET_TRAP_UNK;
                 info._sifields._sigfault._addr = env->pc;
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
                 break;
@@ -155,7 +155,7 @@ void cpu_loop(CPUAlphaState *env)
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-                    info.si_code = 0;
+                    info.si_code = TARGET_TRAP_UNK;
                     break;
                 }
                 info.si_errno = 0;
-- 
2.25.1


