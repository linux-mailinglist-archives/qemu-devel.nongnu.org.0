Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2552510770
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:48:01 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQED-0005O0-2G
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmX-0002WG-7q
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:25 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmU-0004LK-LI
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so3278001pjm.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXPXvIKScv4pzB3hV1PnW5pSW1FWM2CG8BhQI6zsA0g=;
 b=XGnGgcqEnse3mYaZwhjIk1RGa+eg3yiutr9BcAWf+wNCA05c/r1WU6XGYszmafg6Qp
 0QHPYlQwr9bpY59xzcs7darGTN2uwSGILybGLsH1DJdTK2XwX/1Ux8JNbEBmH0mhMfBu
 VeekxF0HSSLJuaPLvTKw0oEnrP63+LOYqz1kWO/Q2UUIzPDsjBPEKDV8ZISDRmpRZrLQ
 3fwdYGs+0p1kwEU/Y7qYgkKMRYtbUJHrUoI1/+ugmq+lfohBFTUPFkOiA5Kk7CXF7J3n
 +ZjmxV+mruaFHKHPIK2TwkEPf/bnwWKYF7dn7bwdZWr2DJaFkP15BQiPxPg61fVSdel6
 lbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXPXvIKScv4pzB3hV1PnW5pSW1FWM2CG8BhQI6zsA0g=;
 b=XVCx/ZUgCjNHwUVuj9FjomyIHpljj4SRi0g2tYOWkfjJ7UjJd+LshnNZiGeKdi9XtP
 Ztv12PDdv5clOTBltEVOvwk6/WV8rfEU4OLj1s+ulQaVeWWlze9eh7vSujMbkwgbdMmF
 OTEof7PMfvVwxXdZcitzJyuGz5ACRmd2WtErRLiL1q/l6PyhEiMxUAoRv9+CEP9j1N9X
 TAYMsEtbsEc2atN853sulFJq/XEyzLiPgRH4D57IoE7IlMHat/8v+snt3KH2MkGcv6J+
 88wpOv6mofmnyY0aZbeB5Nz+dw1sdwPbv8txAi++YNfmBf2LgKINun7MpIMb6Uf0153w
 ruOw==
X-Gm-Message-State: AOAM533mBITE24Wc5weM9YFWTfGsDfiRHDriY4XfZSoBOZrsDQF07bSR
 j/OePGHeB6c2AhV7mdfxUZQB2z/QKI8uyw==
X-Google-Smtp-Source: ABdhPJxyIGlilSDA3JerpkeeQsEZ2WGkblBvV0LpKTLqmy2GWjVTQkf6HD2TT8NwFQwosDzlNfEvhA==
X-Received: by 2002:a17:90a:638e:b0:1d2:b6e3:6e9d with SMTP id
 f14-20020a17090a638e00b001d2b6e36e9dmr39344180pjj.74.1650997154955; 
 Tue, 26 Apr 2022 11:19:14 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/68] linux-user/nios2: Use QEMU_ESIGRETURN from
 do_rt_sigreturn
Date: Tue, 26 Apr 2022 11:18:06 -0700
Message-Id: <20220426181907.103691-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


