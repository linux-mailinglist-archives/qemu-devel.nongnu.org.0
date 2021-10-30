Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE8440A98
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:28:01 +0200 (CEST)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs9A-0005hO-Ci
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryH-0001sh-Ob
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:45 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryE-0008V1-27
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:45 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so13109531pje.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXlHj7GOOQFwxbMfswRsUIWuGeJ1kP2ehgRt9eaYqEQ=;
 b=s0S/jWRu8Pj5oWxf7M0nEyC716sKfzTEa0Sr9mUwr2ga0dI74xTwqSGOGzXlrtrp/j
 BPyW3fTkyXDD7n1W/cidvNWmmVQwtj4DOpgVfjV9CHmrLBsR6YZ8NOmE5YB2pQxUjzYq
 3NAB/2ElwpkuWN6QsWua8Bf59dwQ0eOlDXZvX7ys8mf6Er/TPpV2Cci99GUq0vfZVNNx
 jL6uNTlkm3/KMQM4sUHniTwXLIYv9LgoZmHCGxghgdJBjpVlGDYvgfLOP/8NBCx9u3DB
 tIkWoAZn9afHGwgR5C8nvx5OE/XGTSWgtFSV6rkiYFZvTYsEyiYba23rLDy95H8DaTK4
 vx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXlHj7GOOQFwxbMfswRsUIWuGeJ1kP2ehgRt9eaYqEQ=;
 b=HaWVOaT+0DfYCUeI8h0eU7YuYUwBuqcPinyOV7V20lg0i9ZsECLkQiW1pbI2lN3GmL
 jE2wapn5lVG0DNv6fQrc+kIsy/I3JK0Zi+O4VOmpZbGmfGr9LNrFvxvR1g/DqqSuczAF
 Ht3SFp+/u8WLeKvV9udR8WP88xXcEFIepIZSfwZ/jcL8iBhtaMzaEn0UlgMAtKjXFl32
 rvDeCK/os4NoYd+7jrZN4A/0mC+KCq0kEzk/Qc3rKgDSpASjV6vmgWgbbkE95ZxBPvDT
 fK1AqY6J06gVRPRI48b8w7fAyUgNzw+IP2RgKrrQPj39owTQyK0yUWnly/P2sIjl6Sfb
 dB8w==
X-Gm-Message-State: AOAM53237y9GU4qXmWnH1RdersUFTHAvpK2A1R4dyjt7wL8N5tqgK+j9
 Kn6SroJ7lAYBMVfIx3iqjtRnFV2RxY+czA==
X-Google-Smtp-Source: ABdhPJxRcpm6ziSRKI5pcxPN7JfOfbR7x3JWMBXebUATuIiW5k53RP+SrOzmQ6jpkYexCt6p2337fQ==
X-Received: by 2002:a17:90b:1c02:: with SMTP id
 oc2mr19358731pjb.52.1635614199066; 
 Sat, 30 Oct 2021 10:16:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/66] accel/tcg: Move clear_helper_retaddr to cpu loop
Date: Sat, 30 Oct 2021 10:15:31 -0700
Message-Id: <20211030171635.1689530-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Currently there are only two places that require we reset this
value before exiting to the main loop, but that will change.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c  | 3 ++-
 accel/tcg/user-exec.c | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c9764c1325..bba4672632 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -462,6 +462,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
          * memory.
          */
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
@@ -471,7 +472,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
         qemu_plugin_disable_mem_helpers(cpu);
     }
 
-
     /*
      * As we start the exclusive region before codegen we must still
      * be in the region if we longjump out of either the codegen or
@@ -916,6 +916,7 @@ int cpu_exec(CPUState *cpu)
 #endif
 
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c02d509ec6..3f3e793b7b 100644
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


