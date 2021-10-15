Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333442E79B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:15:54 +0200 (CEST)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEdN-0006rF-DF
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYe-0006fF-H7
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYb-0008WM-Sy
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6415410pjb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xj+GBWow8u43T9kfx0pjQLSKyRLLPuU7SzICT50Nk5s=;
 b=jZuug+o019EfKoHhMGR63+bwuoHKY41oienXVmxxvQnShcmhYnHrK9qosb2utXVuRX
 Wcs2SD4/pSk2U4LDbK6L6CtwlUbyxaqFSquHQUmOVJRPswvycVVrGNTXc3MoLBwzFOz9
 XXiA7CtJddmb51ZApyb7vFMSKb8DpfnXyXUsU3EmqXKM7qPsKILVEDw3/gVmGYUwOYg9
 k1pdunAQT0TELpQRSnToNhuWwPm3Nlupq4QTlelRKfQwDVn/Ww6nocihIgOakzB+VuOY
 2rCWIB6J+3tLBIlq2ZXtBk2fzrw6PLyJIgux/FmMKdGIiN7glUIXCjbsT6YV32BrygZ5
 yJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xj+GBWow8u43T9kfx0pjQLSKyRLLPuU7SzICT50Nk5s=;
 b=q0vUc7lk3cVoJaK40305BFSjzHb+8owBA82uHerijqvD1HZUdXGp2kPFlsCuSyKreX
 ZKHMtCVn+b8mlzkNNaXAkGBrxu4GJchYgt7hOR/TKFpUDarXN48odudapsnwes+DrwRH
 Q40RmhNGVSVlGwXGmW9UBT7dp5RuAQ0+2PdhtMdwC01TIzGKf3KKaSLMyONx34TVlBZU
 O57DItiOaOx9FhSL2kAWJ7+FdBOR2vHXXj9965ThkmxFNzspsM0xfPCZan5PDgg/qohD
 07S1YPTBx5SAVkQVnxywMUheH4diRH6NWTPTkoeNgou95NorS2dSI791ipY8fZpv5vbl
 MN2w==
X-Gm-Message-State: AOAM531NOjss075MSzliKJm7aeZwsiK6vHzHrUllhcPqACsOkgnoLPyZ
 pTXuyAfL4eeyc461D59FBRWb0j3FtzNx3Q==
X-Google-Smtp-Source: ABdhPJwtSltIM4gUblocJRmcGPm4q0YdVPzA/pIJ470aDau9ErKY/ssCsQS5s8cUMeGG1DOA8wIp1w==
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr10729905pjb.111.1634271056529; 
 Thu, 14 Oct 2021 21:10:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:10:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/67] accel/tcg: Move clear_helper_retaddr to cpu loop
Date: Thu, 14 Oct 2021 21:09:48 -0700
Message-Id: <20211015041053.2769193-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
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


