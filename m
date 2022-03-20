Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D844E1C79
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 17:06:02 +0100 (CET)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVy47-0008Oh-R4
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 12:05:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyi-0005L1-LR
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:33 -0400
Received: from [2607:f8b0:4864:20::429] (port=37811
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyf-00066R-Th
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:24 -0400
Received: by mail-pf1-x429.google.com with SMTP id t5so13589066pfg.4
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYEa48pVwjRe//ZBdWWOscJh8NC2Ar8MiPWxZJD3GgU=;
 b=KpW2A/RYAGPEb/bPJifveVsgfBrdKIZdlEOq7KEZxcJ9fYzCx8c4Bn3WBjdYoCFQ5n
 421v8h30gFE2gSyn7818yNQx4yKu9P/ZAl91NHV9ykifpSQXYY5VgYmKX+BKzbda/YUf
 rMWeryhjCwUJIHRh2J4N4sqoZCWEzdnmiscm8wCG8LaHsBu8ME7zUPsN4Q7xK5ENHxxq
 zCiNCqZfWzVwqUVNr5rL7aZzLwbc/NkeI3KonX3dRpnDPqk1SxMlRlU48Mo7VOAa3oGg
 0QQ6iOD+mJJ05ezdM0wZjVEe4X7XgcFlWF96iDLHguCf85kmRub/wwiQNw0XxUR5fy1u
 CapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYEa48pVwjRe//ZBdWWOscJh8NC2Ar8MiPWxZJD3GgU=;
 b=7LIGpxspBRjxQ4y18pMpR8d56oF0JqJCyjLDYDvtu5/TdG7o2QceYmgyQhVQq6y+gf
 qgATMQ+FQWTnZFwUI3jGi7LvvoXUAQkBoEDLSmeIcfNwnP5m0uRM8Oi96D8p1JMmpL1E
 O/Yia4kEMrtToC8H0cG1lm1dAQZg7GWCekMjeQkGnYS3dfiWsjHW1gcyZMS1NMWidcar
 og25hwFJ/9oWLtkrlpueejNT79z1dKArSNCzoQMwOZDai/um9zG1xTqJQR/TjPifHKb5
 AfTFFmZb1Zu8RpEDUZcU8gWMTP8TfknIx/umOn73I+N8VZu0aWXrhfqcMzj27aBLVsoF
 EG/Q==
X-Gm-Message-State: AOAM533NZ/ThcUTt288GfTMIEv1YXpF5tvZAaOntENd4sf3iPZpmBR/q
 KZ6Oo5ATEXSzWWuG01bAwDIDVapJXYb5Fg==
X-Google-Smtp-Source: ABdhPJzKhdC6RAJnIuAS2TqOmadt+QHdEgSt44IXB3vUf+UrTaK4fldbeVdR4I7JT60pogfAgPCRig==
X-Received: by 2002:a05:6a00:1582:b0:4f7:63da:dfea with SMTP id
 u2-20020a056a00158200b004f763dadfeamr20092336pfk.27.1647792019175; 
 Sun, 20 Mar 2022 09:00:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090ae61700b001c6bb352763sm6590099pjy.52.2022.03.20.09.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:00:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] linux-user/nios2: Use QEMU_ESIGRETURN from do_rt_sigreturn
Date: Sun, 20 Mar 2022 09:00:08 -0700
Message-Id: <20220320160009.2665152-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320160009.2665152-1-richard.henderson@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the kernel-specific "pr2" code structure and use
the qemu-specific error return value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 133bc05673..4442974001 100644
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
@@ -200,12 +196,12 @@ long do_rt_sigreturn(CPUNios2State *env)
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
-- 
2.25.1


