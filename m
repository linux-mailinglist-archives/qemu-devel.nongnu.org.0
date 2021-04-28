Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FC836DFF1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:53:28 +0200 (CEST)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqFT-0007qL-5U
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpx6-0005z4-Lk
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:28 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwu-0004er-FX
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:26 -0400
Received: by mail-pf1-x42e.google.com with SMTP id c19so8558643pfv.2
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QsjGwtPl+BBfkIl5lrH7yu7GOPcN5GtbMrNa8PNGqig=;
 b=x8IjsIadr9yYK6/prYuf35p2vPokhrmWwGPNYB2/VDm/BlbQsWB6h4eNF0TX5+HseH
 E06j3RQza/32oneAlOX7gE7IC1hTMDHfoa7DcdgRl/Oe0VmVIuWA6/YmEi+N2QUPd84R
 VTeG0K0q8sJVhCbepSt4tNnwlZ9jdprAl1NK4eFfPfc/ZpCJDJ/X3gIh36O13ABH1GkD
 ltMTp8MPiHv9H0eEhE1nAxdlRzfDlWbLh0R3BMGSrMk4JTGLw5jyNgmcnMTWRpN3WOos
 T7LLouCFpC/8Y5HAuheJS1RunDQ6UWw3cJOVYy47D7hbleGPWOaZYyGXJbYvTniDZmWs
 MSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QsjGwtPl+BBfkIl5lrH7yu7GOPcN5GtbMrNa8PNGqig=;
 b=kbfDDuz3D3mx1Sv9UCPZIRS4CfCNDGD++ksWElqLvMHcZlEFejzOzozsdePYK/3qA0
 3y+VsGDs3Pdo+d0sLyQk/km6sOIGUJWVPDYNo42Ki1wNIAWgHEdVYFTffdSPFvGiMaox
 QcBHNq8LRfD8ArCftcNxC5BxikiytPVu6YmSdCfEUk3Bi3tz3I70xmtLAzjOK+gnw/yJ
 elOBxYhEA/fIiO/uEZhxnEpycjNptd5fLpXpHvV4n2M2DHmQRydDnHu7RT0V05PGTjq9
 MwtBnPV9f7n38UAxOB7Q5AeTkARHsJRP+2eBusnm2mRTnfdg82fVLsejkKndJHBS2aZh
 kH1A==
X-Gm-Message-State: AOAM530JcwSKHT2mh4+575bV5lqAUu6I3VdR7WSMWngyqTMK5Ev3i85U
 PodYdFaXUt29qJJgZclDllcxX8CXa9B1gA==
X-Google-Smtp-Source: ABdhPJzcDbG0gxWQQGLMcmjmSwcYUq4zGMEwrY/qnPiBd8yTqLweux5gZDc71LXE3u7y+pOpo1klTA==
X-Received: by 2002:a63:ff09:: with SMTP id k9mr7500501pgi.35.1619638455178;
 Wed, 28 Apr 2021 12:34:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] linux-user/s390x: Clean up single-use gotos in
 signal.c
Date: Wed, 28 Apr 2021 12:34:02 -0700
Message-Id: <20210428193408.233706-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index eabfe4293f..64a9eab097 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -137,7 +137,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
     frame_addr = get_sigframe(ka, env, sizeof(*frame));
     trace_user_setup_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto give_sigsegv;
+        force_sigsegv(sig);
+        return;
     }
 
     __put_user(set->sig[0], &frame->sc.oldmask[0]);
@@ -174,10 +175,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Place signal number on stack to allow backtrace from handler.  */
     __put_user(env->regs[2], &frame->signo);
     unlock_user_struct(frame, frame_addr, 1);
-    return;
-
-give_sigsegv:
-    force_sigsegv(sig);
 }
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
@@ -190,7 +187,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     frame_addr = get_sigframe(ka, env, sizeof *frame);
     trace_user_setup_rt_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto give_sigsegv;
+        force_sigsegv(sig);
+        return;
     }
 
     tswap_siginfo(&frame->info, info);
@@ -222,10 +220,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
     env->regs[4] = frame_addr + offsetof(typeof(*frame), uc);
-    return;
-
-give_sigsegv:
-    force_sigsegv(sig);
 }
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
@@ -259,7 +253,8 @@ long do_sigreturn(CPUS390XState *env)
 
     trace_user_do_sigreturn(env, frame_addr);
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
+        force_sig(TARGET_SIGSEGV);
+        return -TARGET_QEMU_ESIGRETURN;
     }
     __get_user(target_set.sig[0], &frame->sc.oldmask[0]);
 
@@ -270,10 +265,6 @@ long do_sigreturn(CPUS390XState *env)
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUS390XState *env)
@@ -284,7 +275,8 @@ long do_rt_sigreturn(CPUS390XState *env)
 
     trace_user_do_rt_sigreturn(env, frame_addr);
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
+        force_sig(TARGET_SIGSEGV);
+        return -TARGET_QEMU_ESIGRETURN;
     }
     target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
 
@@ -296,9 +288,4 @@ long do_rt_sigreturn(CPUS390XState *env)
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    unlock_user_struct(frame, frame_addr, 0);
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
 }
-- 
2.25.1


