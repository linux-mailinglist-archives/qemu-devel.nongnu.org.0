Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417A4E7A8C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:58:53 +0100 (CET)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq5E-0003yk-D5
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:58:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzd-0001vs-13
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:05 -0400
Received: from [2607:f8b0:4864:20::22f] (port=37609
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpza-0008Oq-Ib
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:04 -0400
Received: by mail-oi1-x22f.google.com with SMTP id q129so9304906oif.4
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYuWaRD3BVfH07lx10ciC+hnANbY9oKSD0sVPEBlcEQ=;
 b=pZSGMNLP/tWoXcVpzbBHlBPWZJJehBhdxlrrGpISpY0187NYlN5l0fv46kHe9VZfcc
 iCkAYCf816U1HhY9AeoQNidQPbq0mPO+Wb1tcF/3g1oMvlO9N66F6vFWxg69KvXhBonB
 CYekMQNgzYsq9JM+eTF0eImCbmZcJ1am3pcEVeDIBSz/KL7sgCJN5qzIgLz2pXeQvpeE
 1FofhVrSZQHmujqw+t/7zfpvZ25tUtZ7K4XLcBlRPlTpZOGf0N/HhdCURaezj7S++6Ee
 BKBATZ83BUvg3ieXS3nRYPwaxeyNawjvZoUDildX0dJPRRbIyejgNHISHJrdCs81FeQX
 3Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYuWaRD3BVfH07lx10ciC+hnANbY9oKSD0sVPEBlcEQ=;
 b=TKN7U00MPkBQC7yhExH6MqjKzyWsyBHM7pMGO4vLZtA8CK7UeOr81aCoo6eh0/Ek68
 nKjjy2KKrr8ct/gkrDYnzTMvOCCS/+9C8nxHT5qEg3qI1HbYe3JEXrd9iusSwCi55u0u
 +SGe2b9dFrBdMr18uaT0GEE3lP426M14X6/o0/pbUADDN+KVfXchKmwuiwoNSM8aN8vs
 1Usr6K3dlprj45vnIXGLvBUtfEkqPjnwl4Wt1YsIfMuG7flB1PMaptQNl8utrrngup/C
 JXNjQM/2fNm5oeZcKpc7qjxe/YLr3Mf9bFnkNiIypFJSv7OEaxYDYr0rW+19ATxletqf
 4hsw==
X-Gm-Message-State: AOAM531LhxAzYbuR3n4t4xgGA85RN7xBnU1cVJ3tVJ0Z1QI3ZTKCEy5O
 MryiRo9CXRviMkm+sBPxDxJx5zx0DvVepqYd/to=
X-Google-Smtp-Source: ABdhPJwo4MoZZtoXFia4uXwVZNKGm3nggt4xhg0vwd0PCr6cSXeK3kvC8e11F20rYHHJ2KNJkXWXxQ==
X-Received: by 2002:aca:6704:0:b0:2ef:2e32:b67 with SMTP id
 z4-20020aca6704000000b002ef2e320b67mr6068921oix.155.1648237981160; 
 Fri, 25 Mar 2022 12:53:01 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:53:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] linux-user/nios2: Use QEMU_ESIGRETURN from
 do_rt_sigreturn
Date: Fri, 25 Mar 2022 13:52:49 -0600
Message-Id: <20220325195250.386071-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325195250.386071-1-richard.henderson@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the kernel-specific "pr2" code structure and use
the qemu-specific error return value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


