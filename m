Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC541A528
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:13:09 +0200 (CEST)
Received: from localhost ([::1]:38048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2cG-0002gl-2Q
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QT-0004cd-CC
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:01 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QP-0005jP-19
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:56 -0400
Received: by mail-qt1-x829.google.com with SMTP id m26so7049190qtn.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UICQteUsiyVZ78cpdv1J4mwbKpxziCK3H4LazUFdv1A=;
 b=EjnPaKsg+5LlVxNjdtE6ApwD1L80lVjhlqMYXUDq+/hcjeYUxAFWKsHjpeN7EVevnx
 lriOaxi5FZ7bm1nsbpAuqPYFX4FJL+wT48f3lOBgvllr05OWjcLsMU0HLqLQrZq/XpFu
 XSBkyGAsmVVuAGWDhJJKkP2p0NC3Pb/5CnboSW6n8jE291gM46GoDmnfTWBz5RyGQjli
 hyQrKcNCx8u0hM1OKZiHSEqx7eqgSevdYI+pHosGKJ4rT84Mfd0DJhlZquBFaEsRYIB2
 0Sh59b0xWR1YM3Ju8+tqvt67nW2a11cRG7kNPcXuh1KVT2EGGINacjHhy0gwBWHwphoQ
 TrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UICQteUsiyVZ78cpdv1J4mwbKpxziCK3H4LazUFdv1A=;
 b=a9XBQFJXbRF4HFcYM1zc2ofGUKjZ2cSiz2Q+R6l+AV6IsnlF7PgkTM9HDV3A55M4r4
 Fo4arlWDcm2JkNVWxNS7tVZ9w5FuL9RAN6tixtI5nF6bWFQ9zpD7zEAKaWpFddGhTaSo
 BN/zIXh8XeyJvlKzUvigG3HuERorJQXa6qH+L9DWouB0yBj26QZ+DUkOYqACSI975d/g
 FSCawCLNEgnYt1N8AG75OmZHOJrbyf4O4vZOKoXZ7Xb8TkOhlhM4Au/gRsgDF4/OxiHd
 y3FpgQo5RZWOor+LFCAackhcJzCu9cO2JKHnwswEBHZnYILuZ47Sw1TuvhHsUhe4J60b
 6VWw==
X-Gm-Message-State: AOAM532jIFo1sGSkJrOJ0SeYFhUo7lhrKZvr+nZcoCX6aRR7BKtOUmUI
 ScPcQsgTxJKLQNP68CzDJvRvC0oMyCF/FA==
X-Google-Smtp-Source: ABdhPJz3Cqhbe7HqeFOTheAMsRj67p5nqFSgiYw2sse464eGsoW1uuHGnHaGSYJYQvodkdNGce8idQ==
X-Received: by 2002:ac8:119:: with SMTP id e25mr3129005qtg.232.1632794452205; 
 Mon, 27 Sep 2021 19:00:52 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/25] linux-user/m68k: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:26 -0400
Message-Id: <20210928020039.184412-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/target_signal.h |  2 ++
 linux-user/m68k/signal.c        | 47 +++++++++++++++------------------
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/linux-user/m68k/target_signal.h b/linux-user/m68k/target_signal.h
index d096544ef8..94157bf1f4 100644
--- a/linux-user/m68k/target_signal.h
+++ b/linux-user/m68k/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* M68K_TARGET_SIGNAL_H */
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index 4f8eb6f727..ec33482e14 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -39,7 +39,6 @@ struct target_sigframe
     int sig;
     int code;
     abi_ulong psc;
-    char retcode[8];
     abi_ulong extramask[TARGET_NSIG_WORDS-1];
     struct target_sigcontext sc;
 };
@@ -76,7 +75,6 @@ struct target_rt_sigframe
     int sig;
     abi_ulong pinfo;
     abi_ulong puc;
-    char retcode[8];
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -130,7 +128,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
 {
     struct target_sigframe *frame;
     abi_ulong frame_addr;
-    abi_ulong retcode_addr;
     abi_ulong sc_addr;
     int i;
 
@@ -152,16 +149,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     }
 
     /* Set up to return from userspace.  */
-
-    retcode_addr = frame_addr + offsetof(struct target_sigframe, retcode);
-    __put_user(retcode_addr, &frame->pretcode);
-
-    /* moveq #,d0; trap #0 */
-
-    __put_user(0x70004e40 + (TARGET_NR_sigreturn << 16),
-               (uint32_t *)(frame->retcode));
-
-    /* Set up to return from userspace */
+    __put_user(default_sigreturn, &frame->pretcode);
 
     env->aregs[7] = frame_addr;
     env->pc = ka->_sa_handler;
@@ -288,7 +276,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 {
     struct target_rt_sigframe *frame;
     abi_ulong frame_addr;
-    abi_ulong retcode_addr;
     abi_ulong info_addr;
     abi_ulong uc_addr;
     int err = 0;
@@ -325,17 +312,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     }
 
     /* Set up to return from userspace.  */
-
-    retcode_addr = frame_addr + offsetof(struct target_sigframe, retcode);
-    __put_user(retcode_addr, &frame->pretcode);
-
-    /* moveq #,d0; notb d0; trap #0 */
-
-    __put_user(0x70004600 + ((TARGET_NR_rt_sigreturn ^ 0xff) << 16),
-               (uint32_t *)(frame->retcode + 0));
-    __put_user(0x4e40, (uint16_t *)(frame->retcode + 4));
-
-    /* Set up to return from userspace */
+    __put_user(default_rt_sigreturn, &frame->pretcode);
 
     env->aregs[7] = frame_addr;
     env->pc = ka->_sa_handler;
@@ -411,3 +388,23 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    void *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 + 6, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+
+    /* moveq #,d0; trap #0 */
+    __put_user(0x70004e40 + (TARGET_NR_sigreturn << 16), (uint32_t *)tramp);
+
+    default_rt_sigreturn = sigtramp_page + 4;
+
+    /* moveq #,d0; notb d0; trap #0 */
+    __put_user(0x70004600 + ((TARGET_NR_rt_sigreturn ^ 0xff) << 16),
+               (uint32_t *)(tramp + 4));
+    __put_user(0x4e40, (uint16_t *)(tramp + 8));
+
+    unlock_user(tramp, sigtramp_page, 4 + 6);
+}
-- 
2.25.1


