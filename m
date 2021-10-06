Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB48A42451B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:45:52 +0200 (CEST)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAzH-0005G3-AV
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdc-0007DY-7r
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdM-0007tj-2i
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:26 -0400
Received: by mail-pl1-x629.google.com with SMTP id j15so2137614plh.7
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OyHcOBgqUTCNwsxC27Qhpk1QuZZ4VNwSpmcqzEg88+s=;
 b=y1s/kADxlRk5m15EEhm6/nIlA7TcBZZz+Rf5+FvEW/LSH2vpKr6a+97GBNuA+nbogR
 g4l1PFHAO4m8fyT2sCv2C76Hkrez4BQ/zXbr6TRZAMAOXyr6kdZxtVaK9qbMUkf2lZvE
 ALvJlGgGiRk88G42m5BWVOXobei0/IkjVyfOS8bh8/S9aZPBsVJon8UHAJmSuVhbaFh5
 l7IFEARa0WGEHUvrcC/exL+ZAIC8vdajXTeGp0sW8dshTvyGOHlbus+i5CxY6ESN9ykp
 ohdtcdVTdMH7ylgnesHx7UBjU3FvMPwqov+m8+oJuj55zz4zZ+G0USlTqSH5o8NOB3UK
 eVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OyHcOBgqUTCNwsxC27Qhpk1QuZZ4VNwSpmcqzEg88+s=;
 b=gYebnNiZv725SGVR3E7ULj1yK/4ZEqxLDkTIEOmlHOHtMV5t/tnZBRoO/P+Jw9VEj6
 7mZrQ5f0IpqGt2wK7ZZmkJr5wzmTPsGKjkHg7LYllIeh/0T1IwuVwr2+PcZnXW8pHUkB
 kJpT8mgCQJ6YrnkbuidmZZyWkq1DiMj8a6zufrQSNM41f33l8moDik6TQp3RBwJZ9egy
 MGdVhM+4pIiIaFtgfvzEEVRkyaZwVvR2Wdl+71pUIc1GW2kr5n1AK1kR8NqJF//pyYPe
 CUEpIrNxeTC9Of/dnV4ajU+67cVryKw1222aLjvmeAiUJDj+lch9buu3YtW+hip8RdKF
 cfdg==
X-Gm-Message-State: AOAM532xpwUgmKRhcdJxdoalbZNwNI+QaM9e/VYkXhtGUfp0HpcYUmIe
 xARMifPDy8RwikMqpQ5ZXrdYTACziTxkCg==
X-Google-Smtp-Source: ABdhPJyp22GbAVYTq0QGjxkJ8Er2MPq5xt2TuMmmRLOyJfZuIej+DMhzSr4NtIDywSHWzwYv1ZInpA==
X-Received: by 2002:a17:902:7e48:b0:13d:a58a:e9ce with SMTP id
 a8-20020a1709027e4800b0013da58ae9cemr11898085pln.21.1633540990641; 
 Wed, 06 Oct 2021 10:23:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/41] accel/tcg: Move clear_helper_retaddr to cpu loop
Date: Wed,  6 Oct 2021 10:22:28 -0700
Message-Id: <20211006172307.780893-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there are only two places that require we reset this
value before exiting to the main loop, but that will change.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c  | 3 ++-
 accel/tcg/user-exec.c | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5fd1ed3422..410588d08a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -451,6 +451,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
          * memory.
          */
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
@@ -460,7 +461,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
         qemu_plugin_disable_mem_helpers(cpu);
     }
 
-
     /*
      * As we start the exclusive region before codegen we must still
      * be in the region if we longjump out of either the codegen or
@@ -905,6 +905,7 @@ int cpu_exec(CPUState *cpu)
 #endif
 
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 9feec76fb6..6bb87faac9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -175,7 +175,6 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
              * currently executing TB was modified and must be exited
              * immediately.  Clear helper_retaddr for next execution.
              */
-            clear_helper_retaddr();
             cpu_exit_tb_from_sighandler(cpu, old_set);
             /* NORETURN */
 
@@ -193,7 +192,6 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
      * an exception.  Undo signal and retaddr state prior to longjmp.
      */
     sigprocmask(SIG_SETMASK, old_set, NULL);
-    clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
     cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
-- 
2.25.1


