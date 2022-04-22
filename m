Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5850BDD2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:02:53 +0200 (CEST)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwgG-00073Q-BU
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWe-0000ME-Ne
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:56 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWd-0007EQ-2c
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:56 -0400
Received: by mail-pl1-x62f.google.com with SMTP id k4so545382plk.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXPXvIKScv4pzB3hV1PnW5pSW1FWM2CG8BhQI6zsA0g=;
 b=olbmeYTd14G88FipjuxWuaROk/GN+ho3Wf4CCzhtydti4aynjPYS+PUotkXZLHPddV
 /rhWWImQdQBbpBk+6WLY0kyOgdeUVNggN0Kzb4thamtIvrXcWByqAYmnRFzEPhAh+bkq
 c39B0xuqBdtSfa5IQjCuHvAe7TQBppkhM62NFSw4o8Y69tbw2UbvxZsZccAbSDJd1g/L
 ba7CzJqzmW9JEwq3kL3G70vtNq4I2u2E63fZUF4p6HihHH+1CFHN40B3X5RMseiR5CW/
 LX2PQA1l+RqG8jZaHJwl33j2zAmJaLYAunh03KOKuutPjGHiaqnqbVqtET4sM0aDcsTV
 +WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXPXvIKScv4pzB3hV1PnW5pSW1FWM2CG8BhQI6zsA0g=;
 b=Aag/nUJoHoBuPzEL8rxSPDeSvUqjmRRVhXsQ0r+SFEDQywp2eScbytLDI9Hytkp39w
 VZfkgnNppfLTBzNUJn+SaQ7DVyb7XY8HO2Nr00HeKXgH+cNaaRURbBn7L+MpcWWMgenM
 b9HO06reNfbWM6ppPLO6uxozRdzc1pKFoqmssgjpyw5979OrYD3GSUgYpx1BpTWdVMCL
 6vTOZ3dNhpa5bBqW+Mqn4zDvVqEqh3hBg7LLYGqxVFl4BT/SMlSsx1Cu2axXEVW2QQEB
 L+PzSlaN6e3uJoQMhmCLwf/3h7klP42/rdLX8dvG0KS/r+ir5MN4L2My8ypGqS1+B0T9
 Grpg==
X-Gm-Message-State: AOAM533dD1ZsupEiNwVmTrmWU/Gdzuqe4PO9v/x/BtiJtu+vfdRqxoAL
 uA6k5o3gCpNbEUjf5VPGn7yg5AfyboQFQtjr
X-Google-Smtp-Source: ABdhPJxagqNeQJsZRUJG2LO6eVK9ZXSj6ulvANk8EAoqU0qZmlPHm7oalSNpci2kneTbVDK2a6ucsQ==
X-Received: by 2002:a17:90a:6c64:b0:1cb:93b2:b6a9 with SMTP id
 x91-20020a17090a6c6400b001cb93b2b6a9mr17389439pjj.144.1650646373843; 
 Fri, 22 Apr 2022 09:52:53 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/68] linux-user/nios2: Use QEMU_ESIGRETURN from
 do_rt_sigreturn
Date: Fri, 22 Apr 2022 09:51:37 -0700
Message-Id: <20220422165238.1971496-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the kernel-specific "pr2" code structure and use
the qemu-specific error return value.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-8-richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 133bc05673..9aa525e723 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -77,8 +77,7 @@ static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
     __put_user(env->regs[R_SP], &gregs[28]);
 }
 
-static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
-                               int *pr2)
+static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc)
 {
     int temp;
     unsigned long *gregs = uc->tuc_mcontext.gregs;
@@ -128,8 +127,6 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_SP], &gregs[28]);
 
     target_restore_altstack(&uc->tuc_stack, env);
-
-    *pr2 = env->regs[2];
     return 0;
 }
 
@@ -191,7 +188,6 @@ long do_rt_sigreturn(CPUNios2State *env)
     abi_ulong frame_addr = env->regs[R_SP];
     struct target_rt_sigframe *frame;
     sigset_t set;
-    int rval;
 
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
         goto badframe;
@@ -200,15 +196,15 @@ long do_rt_sigreturn(CPUNios2State *env)
     target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
     set_sigmask(&set);
 
-    if (rt_restore_ucontext(env, &frame->uc, &rval)) {
+    if (rt_restore_ucontext(env, &frame->uc)) {
         goto badframe;
     }
 
     unlock_user_struct(frame, frame_addr, 0);
-    return rval;
+    return -QEMU_ESIGRETURN;
 
 badframe:
     unlock_user_struct(frame, frame_addr, 0);
     force_sig(TARGET_SIGSEGV);
-    return 0;
+    return -QEMU_ESIGRETURN;
 }
-- 
2.34.1


