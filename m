Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69977417936
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:06:04 +0200 (CEST)
Received: from localhost ([::1]:39462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mToeB-00039Q-Fe
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXy-0002eH-Dp
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:38 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXt-0006uP-GB
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:38 -0400
Received: by mail-qt1-x82b.google.com with SMTP id j13so10052488qtq.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9r1xAdALpfQj8Y2p7MHsD/Kt2/NgPJhspyOQqw2vSE=;
 b=ud9lf2mY1kqgyV1OUwTUDcnBBvctQRisFqCtOvkpLfvkZuAFZyOT0ocd6QCPyB/d5z
 BqEyBG7l7VGVeIwexC5E7oP5JLMrEez13+7nhB9ciddNS0dwTh/P9JatLwaCuV9I6pLS
 1+1FftaAZDdeqRlKXGMhnIUCygfUYW65vcj/pDIHLU0KHwfX67Qn7oEzhbF3I8EdUeuB
 EEKBhtm2yMGIZmRChWlr31hccJ0yIneMaNI9A82OGGJl8wuJE6yTznl4PAui1REJTace
 BGHThyj9pX3eCm0S93+8u+zJOZxjXrWswnG4uBUe80BXLJO778aC2pLb02BQ4iAEIMmz
 u8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9r1xAdALpfQj8Y2p7MHsD/Kt2/NgPJhspyOQqw2vSE=;
 b=Xs8Wg49WJHE5FM9c/oXmYZrZLIsg0q/mBFCjBudvxJInV55VYMkBOuT7ADT7Nbv3HJ
 5CEhJllcde8ovl+zVGgEysDTWivnLmtI3HQmhBKlGdoNLZnk4YmvV8GEPuaDySnI7lTa
 yN51hLSt1CvIjUQoezEUXr2REPlr6HiTIfUviZG9qnWD6Mou404f/e2ce8ftXrHA5cr9
 I62p45NeyA/q41uWm5NAShNpC0e6SdkDfv9yubzjK42Jh0yYbrYI+rXBQYUVg1ftW3t2
 ynXyEKN2Chz4gB6a532I8PeRGOTxm6xeb4fWYqO3WPPbUZ0Re6mteX7R1WgbjNkpHrsX
 QxYg==
X-Gm-Message-State: AOAM530D6W7rrk9cCtyWiI19MJhc8w1JVFNNf6+gw7U8WsLe+yubSNAe
 /55wVAbUXqAw9UHzuCDbmhngixsElM8Xeg==
X-Google-Smtp-Source: ABdhPJyykPGKRx5pp/IsyT3tpes0bN+ZMUt4yPaER/MS2arbjQ8fc2GeAm3zqozL0NqQlZ0UEnf62Q==
X-Received: by 2002:ac8:7741:: with SMTP id g1mr5283788qtu.366.1632502772511; 
 Fri, 24 Sep 2021 09:59:32 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/27] linux-user/alpha: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:05 -0400
Message-Id: <20210924165926.752809-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use ka_restorer.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/target_signal.h |  1 +
 linux-user/alpha/signal.c        | 34 +++++++++++++++++++-------------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 250642913e..0b6a39de65 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -93,6 +93,7 @@ typedef struct target_sigaltstack {
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #define TARGET_ARCH_HAS_KA_RESTORER
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 3a820f616b..bbe3dd175a 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -55,13 +55,11 @@ struct target_ucontext {
 
 struct target_sigframe {
     struct target_sigcontext sc;
-    unsigned int retcode[3];
 };
 
 struct target_rt_sigframe {
     target_siginfo_t info;
     struct target_ucontext uc;
-    unsigned int retcode[3];
 };
 
 #define INSN_MOV_R30_R16        0x47fe0410
@@ -142,12 +140,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         r26 = ka->ka_restorer;
     } else {
-        __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
-        __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn,
-                   &frame->retcode[1]);
-        __put_user(INSN_CALLSYS, &frame->retcode[2]);
-        /* imb() */
-        r26 = frame_addr + offsetof(struct target_sigframe, retcode);
+        r26 = default_sigreturn;
     }
 
     unlock_user_struct(frame, frame_addr, 1);
@@ -196,12 +189,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         r26 = ka->ka_restorer;
     } else {
-        __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
-        __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn,
-                   &frame->retcode[1]);
-        __put_user(INSN_CALLSYS, &frame->retcode[2]);
-        /* imb(); */
-        r26 = frame_addr + offsetof(struct target_rt_sigframe, retcode);
+        r26 = default_rt_sigreturn;
     }
 
     if (err) {
@@ -269,3 +257,21 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6 * 4, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(INSN_MOV_R30_R16, &tramp[0]);
+    __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn, &tramp[1]);
+    __put_user(INSN_CALLSYS, &tramp[2]);
+
+    default_rt_sigreturn = sigtramp_page + 3 * 4;
+    __put_user(INSN_MOV_R30_R16, &tramp[3]);
+    __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn, &tramp[4]);
+    __put_user(INSN_CALLSYS, &tramp[5]);
+
+    unlock_user(tramp, sigtramp_page, 6 * 4);
+}
-- 
2.25.1


