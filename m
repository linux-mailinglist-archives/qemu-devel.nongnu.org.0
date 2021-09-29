Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7A441C55F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:17:28 +0200 (CEST)
Received: from localhost ([::1]:54982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZSh-0005hb-3X
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHt-0006Px-4o
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:17 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHr-00067A-Bg
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:16 -0400
Received: by mail-oi1-x22f.google.com with SMTP id y201so2808223oie.3
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9r1xAdALpfQj8Y2p7MHsD/Kt2/NgPJhspyOQqw2vSE=;
 b=h+tH8fr3/9ZC1OM8M7fvqox3Opcx7g+eogUAnhSv+qlFu8DPXMHrKZkmZ82vCDXQR4
 p97vgyx8ju6Q2cTovTpaOej7s9v7mfhom1yzYnDn0SP/3bfiIpa4YIzLXpVnqxy4pxIQ
 CycDEbKcoVyYMCxPYY/FraR8GoY8P9UgYv3eE2mN0SchepynHy8pQAaJovqsXMYvuWpP
 gpuhQboCv+l69azMoTtVYWfkBPT6G21djy9BU4H9r1nW2D157Gepbi036Nohie7dJe+i
 m94cw4gBw8PCJWf6AnCL67g9QZpbQWCar8m8gZRbjKu2SeUrCk8y2cr1ztEFXLF26XrD
 Y5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9r1xAdALpfQj8Y2p7MHsD/Kt2/NgPJhspyOQqw2vSE=;
 b=CQyETeIhere7r/OXvmCIJ1pwjw5PIgTGoUE1oFCwHXLYFiFJE/Rhr3i/Ed1HgWNvQD
 s67zdKsKXA5kuecWcWRUyq3j3zAFsIAipvsXvjK5nYXQe4d8bCEsFbNFh4XMkoopekj6
 b4uZmUTYv5iwBVoJuTKaohTkz2PLPlPBYkpB8aI7DKFbUeTxBVAoG3mpUYBB7yqHQHIB
 r1IDc15eLM5QFH8D6Nx3rN+QTU7VHyvtZap5z6y9z+f7hBY9VWgyQDihrZ3iyY1zhn78
 CfLb5KV2rISBTgzgzrGrg9AEfYAC/FI8U0icwXEBrIYtcliv2DnFz+ogSGvqtuN0IauD
 z8YQ==
X-Gm-Message-State: AOAM531xR+vzrO4OnJp1PdYP1Qik3BEuMkrftM6G8g+QnIC8P9RX88xs
 hRkmETlhOmJrcSLrYs7bY+YxY2kCPoiE+w==
X-Google-Smtp-Source: ABdhPJzPL+nSCBPYZlxCpYP7Ys9RW9bXTFMqkaxx1Ywd/epKotFBFJ9Oe/hVosi+t1gqD3JuIrMBxA==
X-Received: by 2002:aca:e004:: with SMTP id x4mr7692435oig.155.1632920772755; 
 Wed, 29 Sep 2021 06:06:12 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/26] linux-user/alpha: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:33 -0400
Message-Id: <20210929130553.121567-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
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


