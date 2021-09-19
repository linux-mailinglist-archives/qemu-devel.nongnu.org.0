Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349F410920
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:03:10 +0200 (CEST)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmAf-0003Xw-FN
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm57-0003Qa-5J
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:25 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm55-00053Z-Fu
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:24 -0400
Received: by mail-pf1-x430.google.com with SMTP id s16so4622547pfk.0
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=foCZWrUsQHO9wt/Wun6aL9Kw7r/rWCCyU6/PbRx5aZE=;
 b=SLKfqUVjJOrphPzYq2EzFXmSa0614OpsRzfpbn0wOmZd6R6qzvwYqxqd2eYyqXFjut
 D5z3/gfgn1pk425V1QxdZZvXUx1mScjIDothcLRzTdRNyxX70TmQea5rjsySQJ7Ulek8
 OLvxBhzVajgVXT5S2Fhl5pDzAei7HcXVhDDgOntguJ/P9ET4Kk8xDKirWH+MoSq7vQXB
 tIeRxSv94UURLZG+p3NLfwyBIjndJ/mjzzqFL52H4FAtQyhxgYz6P6/vVb+LbOOeefy2
 3sSMXzBBXG8ygOQfLn+ApctEpNZRrYcwM860JFtzzXCF1/bh69dOu9UjbREyLaLiIeHv
 bqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=foCZWrUsQHO9wt/Wun6aL9Kw7r/rWCCyU6/PbRx5aZE=;
 b=Wrcx+MpgZ5BdE4eT6Bs4C3b3sY9IPwp8vyXqfvdzubzjVnBNPpK0ok/7fBIHqD2pvU
 4IlKIIOIoicn1fdr3O9XAImXaxuxbG7jBy6+GVfv0KAE91AugXyIyBzRIrGYg/Jv/9Zk
 r/V4mUOncYD7Wd/5Zn4YSRQ5r0A8G3SrEJA7Po7YzTcciUGdKIH0TCAtYcsee5oilgtJ
 aLVRV7v7Ondm4TXdjHcdLhgmaxxCydXzvWdVJ1aDJTN/sIME13ZUaudb1ZXr/VPLOkOg
 fRw8mvGx4g43HW79uqp/UWbAn6RiiYcdvfDknSVMJHirZ/Y30XqJcatyC3N1xEBpPGAT
 G52Q==
X-Gm-Message-State: AOAM533voRPqe/tLPvluXovUStVl8CnuYguTKd/tLjHD8yd5ed/Hgo0g
 vAg0jkWeAX1l8l+0qxHVYhjM9717AHhbgw==
X-Google-Smtp-Source: ABdhPJyuzUZBlhxdCi8E1zQO+V0iIaGxE6FNQ6Us4WJiFy/U9S4NzYhCvmDs52r6Kj4U+wJSFfmc7g==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr17301752pga.50.1632016642148; 
 Sat, 18 Sep 2021 18:57:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/25] linux-user/alpha: Set TRAP_UNK for bugchk and
 unknown gentrap
Date: Sat, 18 Sep 2021 18:56:56 -0700
Message-Id: <20210919015718.466207-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These si_codes were changed in 535906c684fca, for linux 4.17.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h   | 1 +
 linux-user/alpha/cpu_loop.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a5ce487dcc..55ccc6ae03 100644
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
index 60b650a827..13ba9bc1d4 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -91,7 +91,7 @@ void cpu_loop(CPUAlphaState *env)
                 /* BUGCHK */
                 info.si_signo = TARGET_SIGTRAP;
                 info.si_errno = 0;
-                info.si_code = 0;
+                info.si_code = TARGET_TRAP_UNK;
                 info._sifields._sigfault._addr = env->pc;
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
                 break;
@@ -160,7 +160,7 @@ void cpu_loop(CPUAlphaState *env)
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


