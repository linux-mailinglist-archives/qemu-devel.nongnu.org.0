Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E366D1D2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:37:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHY5w-0000Wb-6m; Mon, 16 Jan 2023 17:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY5t-0000PQ-87
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:45 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY5r-0001MF-L1
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:45 -0500
Received: by mail-pl1-x629.google.com with SMTP id k12so9586595plk.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 14:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVoQ+dZBxCCrOAQkIYFBP0Uz5/oWgbT60mps7v3rv5w=;
 b=kjQPhh7y6UmxHQT083q4jKpXzCOGnRVkRlBOiQfevp+dtKPpMRseWca1yXPQ9ZMx64
 SuYh4/KLFO1mnSrjdjaxsKZSNDXRKrQk5qdfyqIz9kJf8jf3czzLieFL0pOmYAMtZzHq
 mE3pdJLo9z7dOpAoNGs9k3+GsE1Ts0ZLh1hxNGL/BLn9MzqrZZuoNPV44dxOLxdNR6di
 E4YE7Dt013/1JyU04xjOSmTvHxFn4rX04waA1K2cQ2KkzaMmg6e0HKcwCyKyTX5NDyGk
 lyH13LW0g22dcZk332w8tD/SPRFXqEZj7u9SVOMmkGevc3f1F+MS6XbJmdaITnBTHvr5
 N94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVoQ+dZBxCCrOAQkIYFBP0Uz5/oWgbT60mps7v3rv5w=;
 b=o574qI2VOXx3Nmi1e+HExI308A5VRMqAoc/3qwWs9HN0M7gtv/M075anxePo7jfCHN
 ob65yXePOKXGFk0js7Fs7UMjIMHV9jEbrfEO1JZYu81w7kjbfnoFkmoFMu7aiqzzvtGE
 ulglzcoi6wr+AdbbbRKxwqzHHXrGFji+5twdBf1q8pxKDtNcwxdzUmRo+XllZcnQ4nA3
 /0sA/IRKpwhB4tmCJzXzSSJpapl/sHD5WvzW/8Cn+S6SjYGUvsMF0r7l0SAG+8++2yIb
 fpaUKnvuop+YvfK8b3XMGYJWgDP3QOgmLIkvg6Uy7LMJ2Alr6qsGSz16BFoONWgeO0ZV
 OkSQ==
X-Gm-Message-State: AFqh2krHjIaY+vqyC+bCbUhdBAj+HOv5mV1hB6FPV4rcDptZMk332byb
 FdWc/3j5qOjanahxDwJHQ+BYyqkXNtQO/jox
X-Google-Smtp-Source: AMrXdXutWcFq9uL5iHxqxYiGQUf3tYGyYfG6dxDiQivgkbE2jygMwjHwNsHuSvVhEJoOE5xqejQb8g==
X-Received: by 2002:a17:902:d50e:b0:191:4378:ec06 with SMTP id
 b14-20020a170902d50e00b001914378ec06mr30669211plg.61.1673908602048; 
 Mon, 16 Jan 2023 14:36:42 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170903110300b00189f2fdbdd0sm19742492plh.234.2023.01.16.14.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:36:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 1/5] linux-user: Clean up when exiting due to a signal
Date: Mon, 16 Jan 2023 12:36:33 -1000
Message-Id: <20230116223637.3512814-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116223637.3512814-1-richard.henderson@linaro.org>
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

When exiting due to an exit() syscall, qemu-user calls
preexit_cleanup(), but this is currently not the case when exiting due
to a signal. This leads to various buffers not being flushed (e.g.,
for gprof, for gcov, and for the upcoming perf support).

Add the missing call.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112152013.125680-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 61c6fa3fcf..098f3a787d 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -695,7 +695,7 @@ void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
 
 /* abort execution with signal */
 static G_NORETURN
-void dump_core_and_abort(int target_sig)
+void dump_core_and_abort(CPUArchState *cpu_env, int target_sig)
 {
     CPUState *cpu = thread_cpu;
     CPUArchState *env = cpu->env_ptr;
@@ -724,6 +724,8 @@ void dump_core_and_abort(int target_sig)
             target_sig, strsignal(host_sig), "core dumped" );
     }
 
+    preexit_cleanup(cpu_env, 128 + target_sig);
+
     /* The proper exit code for dying from an uncaught signal is
      * -<signal>.  The kernel doesn't allow exit() or _exit() to pass
      * a negative value.  To get the proper exit code we need to
@@ -1058,12 +1060,12 @@ static void handle_pending_signal(CPUArchState *cpu_env, int sig,
                    sig != TARGET_SIGURG &&
                    sig != TARGET_SIGWINCH &&
                    sig != TARGET_SIGCONT) {
-            dump_core_and_abort(sig);
+            dump_core_and_abort(cpu_env, sig);
         }
     } else if (handler == TARGET_SIG_IGN) {
         /* ignore sig */
     } else if (handler == TARGET_SIG_ERR) {
-        dump_core_and_abort(sig);
+        dump_core_and_abort(cpu_env, sig);
     } else {
         /* compute the blocked signals during the handler execution */
         sigset_t *blocked_set;
-- 
2.34.1


