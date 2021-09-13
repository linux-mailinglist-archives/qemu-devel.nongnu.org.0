Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C443409F77
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:09:02 +0200 (CEST)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPu8H-0004oC-ES
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5T-0001tF-0j
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5P-0007O1-Gm
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id q22so10216041pfu.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=umKm8x6alVt7RG9Jn6P6NNWTmAl/oVeCyIb/D+Q+Mok=;
 b=U1mLbPyUisTneV51DA5y5ejNESCCW+py0H0deZKzMfZRWIyuUqgbrWhiJ7gWUlTw/4
 HQPM++BiahAqvOnwSwa7sjgE8dWmHYfBi7+QXtnEBc0RNCsCXipGR/4rMCaHIHmct6ML
 dA5Ejw3m6dmIcQqNuaf+hZXb/qg/6206y6OD/MQdBXEKp2OPZY6P3bgtcd4fsgTBDxGo
 f0aiDyH0IlAi4hco3QoWPG+VNh3c43AEQh1FfiZf5HzYE3XM2VNbmuygC4yy2JmUzgMi
 5xWiBLVVk85sdEWkZ/E0/emmSpYyhnWNtbVqEsvrN8JA08c0LcD0eSxIegwPKdQHXiZg
 WFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umKm8x6alVt7RG9Jn6P6NNWTmAl/oVeCyIb/D+Q+Mok=;
 b=IpknZVAvaMTYibpRUBawy1OyZ7vCcbE2fvjUDMj5BYrDc9rnE26V0Qz7TE6YhG6Xul
 rsZ7jlrv0CtV0K7vZN4CJX8pxV6vh/3Kwf/I28BPYvsHkVR1qV5RieeyHLw4sHb1YBiP
 4J92b8rDPY5l8rSJmnpghr50Gg5K9HK+8vEu8MMLIvWBdE+N281KjHLZHNfQ7gBzJZhR
 xadz8u9WhRSdY6zwqHw/co/BGWVZOGek4a0WLckavcdve7QZEOfmIwkpe8YEKew1qk8M
 nZuJ0SqWN2Yez2qTmFzwKYY2zXaGDfRHjcSYwW4NbqZOdLT+gZdyrz+AM3FlgjD1twE4
 JixQ==
X-Gm-Message-State: AOAM530Hutxus+CP6JwXwYzNqroV1X/iA1V9KX+F+F/5g6ZHu0wNVrIY
 gFQDCFZdAv7B6NJ6Wxs3QdqSx4nQoyi1Yg==
X-Google-Smtp-Source: ABdhPJzuO6ABf5pw3M82TQmOZhhydfXIpILRsB1fY6kQNpBE3SLT7LteHD7rperq5PeI7yRTb47Zyg==
X-Received: by 2002:a62:2703:0:b0:42b:5319:cbbc with SMTP id
 n3-20020a622703000000b0042b5319cbbcmr1480093pfn.66.1631570757676; 
 Mon, 13 Sep 2021 15:05:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 17sm7721404pfx.167.2021.09.13.15.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 15:05:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/7] accel/tcg: Move clear_helper_retaddr to cpu loop
Date: Mon, 13 Sep 2021 15:05:49 -0700
Message-Id: <20210913220552.604064-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913220552.604064-1-richard.henderson@linaro.org>
References: <20210913220552.604064-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there are only two places that require we reset this
value before exiting to the main loop, but that will change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c  | 3 ++-
 accel/tcg/user-exec.c | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 75dbc1e4e3..13c4436e5d 100644
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
@@ -903,6 +903,7 @@ int cpu_exec(CPUState *cpu)
 #endif
 
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index daef34a426..83351db719 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -157,7 +157,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
          * currently executing TB was modified and must be exited
          * immediately.  Clear helper_retaddr for next execution.
          */
-        clear_helper_retaddr();
         cpu_exit_tb_from_sighandler(cpu, old_set);
         /* NORETURN */
 
@@ -222,7 +221,6 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
      * an exception.  Undo signal and retaddr state prior to longjmp.
      */
     sigprocmask(SIG_SETMASK, old_set, NULL);
-    clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
     cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
-- 
2.25.1


