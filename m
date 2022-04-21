Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6D50A4AD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:49:44 +0200 (CEST)
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ3v-00027S-Cw
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ6-0006zI-Gi
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ4-0006Dq-QM
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so8022422pjb.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4bEG59HGJHZfbQ5kmr+PsOLA5+vre80D0XgeZQKHRQ=;
 b=O3gcU9zJ3xa439ghSOfeSOcLB6F+MRh3TaBdH0F54X8Pg41wz40kMnfHbS099Iqysu
 cOdLtALo7O9XpeTOTyR60ZTg+a9Nf47pqL7yLn6+oWqKnXCeLrJGcHDL0MTNN/phy3eO
 4aIWPolZ882/0jHXSBAtJ+GbqT8Of5wXMGADRxBtkHU2XbZf9fKhRBBM6iRmIH53HYyJ
 1JYkAn1BeR5Ku5drgBhm5crHswxDsWic4T4BqphLrAccXu6w6QDUgpxx4LE3psy7A80w
 HVSwN3NqDA+7b16EtHY2pYckBPqDpRC/n9slOlcCoZ7rgChAxvgpba0yhPmNYgWiBCxb
 /dGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4bEG59HGJHZfbQ5kmr+PsOLA5+vre80D0XgeZQKHRQ=;
 b=yCDHfUHQ4BVqxcmsCp6cv06Z6JHRTvyhrzE1kEokKUxkoFHSJLMLILgRE066H+m05v
 lczBHDNJorKT9qJLWS4e0AljmfZ95wfHLcdt9kyHLY/fn8N+IAYB9N+QuudkfIMns+Ka
 DqsIFrf96bbUlK9BasfDtsFKM7YioFnSReCxuFzZG5k+H3IvQJ6Yrr6nBIq7I7TYO7Ev
 Z6yvomyIvhykgleUGXHdFapKomeXyfSc+9MGi+vRTRHdd+KflJN98Cibe16FjuLrqoin
 echGLylRInJNJ+K4zdHjidpjWsrGgeSxj9JCd6S5yk3CQRa8TgcGlvefg1wm6JYI9+8p
 maqw==
X-Gm-Message-State: AOAM532Zqmox2fh2/srubvpuaqyC/1c6+xHPoNbvK4H3UZfMxDai4qFj
 YmfBKeuRdYsMFUxEyxJJyzhfjb9nTbeXpw==
X-Google-Smtp-Source: ABdhPJw9M9WqQJFcwKGFb8UKPXaCDgiRTu+eZdA/MzZy23SEvKBatHr6v9x5zEM3HHvu8piD57jNGg==
X-Received: by 2002:a17:90b:4d81:b0:1d2:8525:5f1c with SMTP id
 oj1-20020a17090b4d8100b001d285255f1cmr147064pjb.27.1650554269367; 
 Thu, 21 Apr 2022 08:17:49 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/64] linux-user/nios2: Use QEMU_ESIGRETURN from
 do_rt_sigreturn
Date: Thu, 21 Apr 2022 08:16:38 -0700
Message-Id: <20220421151735.31996-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


