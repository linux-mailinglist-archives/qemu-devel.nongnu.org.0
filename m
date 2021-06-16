Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593343A8E3F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:22:35 +0200 (CEST)
Received: from localhost ([::1]:32886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKGI-0007PX-Aq
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6S-0005TQ-6M
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:24 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6M-0008Qr-Sc
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:23 -0400
Received: by mail-pg1-x536.google.com with SMTP id l184so569732pgd.8
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aMCRIj/ZF7W7IY6XN/z2aOBiqinNjqax8uyGzovEstg=;
 b=aDyr0uvSKgUvQDjvSKK2PwlhN3l3HMuJx6LYZnoy37fTwnS6vkK8I+4Jo6NmmbTHx9
 nqmmnuLFpB0oj/cK5Hegmx/n1uZ15J633Xkr2ueQeP0FmPkWWs7cKeGsVOzlfVqA5Q8q
 V9ymmCVqjPUsKFfsVMpUsGtRw3s4d2+nCiT4PmjhWrAAh3Jh9e1a8B+1PILzOjI88RPe
 76iICcguFYvgBWxjcd9lPqqftSkXy558ev5wCslhW4AAxRq76f34IT++yPrelHru39rQ
 spf5gZ8QU/o8yOgb6RdbtgtxPmb3v8WpNXLiHx5I1PWk5wPIVpUFmQlLEonViQEj+Hw4
 BgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aMCRIj/ZF7W7IY6XN/z2aOBiqinNjqax8uyGzovEstg=;
 b=Kn7P0YsiQvPDw7ZAO/scpUEgId3aPKiszyh6j5pFDZzjOTtv8JdY27Oi4uoXu6NSYn
 d1OpgvU2Okluu9FWd9xpCsRPIv6cc9qC7AFlF4ivzpa2SoOvHGOyuM08cq3iphbSYvv3
 r5w/BwjU19SBKohuRTINcvYvFBNmhvbwUTbXVg+zxgFrOmDU34OndbJ9bFPQ+zNlmXee
 o69uDv1zZspQIcz9a76k+vELEbTfkG77uPcCm79Nm2BM50Q9w0dLL6YPDRFTL4wj9ngj
 5l2nbuT91n+iEkOeDBUgXtc6yQ4HGWb9aeXiXjNQTW1pQDmqQc5J34Ws7dbgfgLs1lY2
 2Zeg==
X-Gm-Message-State: AOAM533v0KyWtz0zQ0BwxiGNcWi+QNKz+GLniZp8MLTKovGvPmiz8zH5
 BMO1tltwkgrqMl6jbgkiLayF7Et7RvAPrg==
X-Google-Smtp-Source: ABdhPJw5u5Yyrt+x077gGL7NBL1kwS2bF2XBksMrJteqpXWsRxTVGwOz0dDYBHghiFWOS+CIbJAc2g==
X-Received: by 2002:a63:2114:: with SMTP id h20mr2383686pgh.16.1623805937004; 
 Tue, 15 Jun 2021 18:12:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/21] linux-user/m68k: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:58 -0700
Message-Id: <20210616011209.1446045-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.

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
index d06230655e..b4fade1ed6 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -38,7 +38,6 @@ struct target_sigframe
     int sig;
     int code;
     abi_ulong psc;
-    char retcode[8];
     abi_ulong extramask[TARGET_NSIG_WORDS-1];
     struct target_sigcontext sc;
 };
@@ -75,7 +74,6 @@ struct target_rt_sigframe
     int sig;
     abi_ulong pinfo;
     abi_ulong puc;
-    char retcode[8];
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -129,7 +127,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
 {
     struct target_sigframe *frame;
     abi_ulong frame_addr;
-    abi_ulong retcode_addr;
     abi_ulong sc_addr;
     int i;
 
@@ -151,16 +148,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
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
@@ -287,7 +275,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 {
     struct target_rt_sigframe *frame;
     abi_ulong frame_addr;
-    abi_ulong retcode_addr;
     abi_ulong info_addr;
     abi_ulong uc_addr;
     int err = 0;
@@ -324,17 +311,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
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
@@ -410,3 +387,23 @@ badframe:
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


