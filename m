Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20683A8E53
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:24:52 +0200 (CEST)
Received: from localhost ([::1]:40600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKIV-0004Ab-Lh
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6R-0005Sl-Ru
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:23 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6M-0008Pe-Rb
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:23 -0400
Received: by mail-pg1-x535.google.com with SMTP id e33so591010pgm.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kmu7xnRVWsU3eWGJbPPKgl5+mSDH//+NJHn4m15m2Pw=;
 b=Ed4VtKxfh0RwqQObFFYEWcwtQraF0e+poohIOqVoKTseRN+B8jGbE6vYMrw8sgI+rU
 /5k9C404YTQ+7UT7pS0NhbRO/rAN6nUM7Fg/+TDAVSTH/ocH1Rzf01Y7fvGnYIPoB9DD
 PvnIURqL4Ylij0xeMJ8PcimDvwExgo4PdJ5XTFIa7jaXG/0GX7MKKtN/NtwnjZdaNBOF
 R6Hp6FKCs999vmwrj0HENOlNZwW7GZH2PFWtLqTm1uP0JmBYpgQjJlzqlCrmG5e9VtND
 CIMmBHHmYUj/QR4nLZFrrj+6OLpr9tf/IY/jPzarPbCg1+Y4GSYeRWTGbzB383+5mcF9
 ju7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kmu7xnRVWsU3eWGJbPPKgl5+mSDH//+NJHn4m15m2Pw=;
 b=jFkXR5ZV942zDZ8xGSmlyGyNAF9TuRDUzYyyU4shiBS67Sw432Ov0cvtSA2MIIJu1+
 sBYJKxPwWemYjbkSx1WqdAvUachkJgExbDckvox01pg4Tm7A4VcIkT9kNzSaKDT40WlL
 ARMYjz6JtMiPwvfUtMJudzJs0sCi76vm3j+qT4kgf6unF9R92SAMINCHCVpi0HKxG6oU
 WyVBu/qOHBpy3f5nc1/lkyevSyyMbvaWj9GA86qlt4fubdOs7quEhW9aY7wuUVDVNWUR
 Ne3Z7iKqA/je9ls2eHVruekB8xgrdD+h5yNVnKDN+i/65ImtMjiJB0R8Sq+vERTm67U2
 /QBA==
X-Gm-Message-State: AOAM533ZEO6MbzxyQ8OQJXhx+6fkpt446Wt/Az727aock/xGZ+vvqiIS
 RjTKyawjZxnU/IEWoYmLCwJYePNEJ1gTEw==
X-Google-Smtp-Source: ABdhPJy2LD7TrpSRxxEcpHgoGrjjwxXF08gFNMPkdAU/KKJeP3K0xM4Dd2MwN5b4OZNp5HY6039LQw==
X-Received: by 2002:aa7:9706:0:b029:2f2:4481:1e17 with SMTP id
 a6-20020aa797060000b02902f244811e17mr7224895pfg.53.1623805936370; 
 Tue, 15 Jun 2021 18:12:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/21] linux-user/i386: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:57 -0700
Message-Id: <20210616011209.1446045-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Use them when the guest does not use SA_RESTORER.
Note that x86_64 does not use this code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/target_signal.h   |  2 ++
 linux-user/x86_64/target_signal.h |  3 +++
 linux-user/i386/signal.c          | 42 ++++++++++++++++++-------------
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
index 50361af874..64d09f2e75 100644
--- a/linux-user/i386/target_signal.h
+++ b/linux-user/i386/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* I386_TARGET_SIGNAL_H */
diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
index 4ea74f20dd..4673c5a886 100644
--- a/linux-user/x86_64/target_signal.h
+++ b/linux-user/x86_64/target_signal.h
@@ -21,4 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* For x86_64, use of SA_RESTORER is mandatory. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* X86_64_TARGET_SIGNAL_H */
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 8701774e37..a83ecba54f 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -337,16 +337,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         __put_user(ka->sa_restorer, &frame->pretcode);
     } else {
-        uint16_t val16;
-        abi_ulong retcode_addr;
-        retcode_addr = frame_addr + offsetof(struct sigframe, retcode);
-        __put_user(retcode_addr, &frame->pretcode);
-        /* This is popl %eax ; movl $,%eax ; int $0x80 */
-        val16 = 0xb858;
-        __put_user(val16, (uint16_t *)(frame->retcode+0));
-        __put_user(TARGET_NR_sigreturn, (int *)(frame->retcode+2));
-        val16 = 0x80cd;
-        __put_user(val16, (uint16_t *)(frame->retcode+6));
+        __put_user(default_sigreturn, &frame->pretcode);
     }
 
     /* Set up registers for signal handler */
@@ -415,14 +406,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         __put_user(ka->sa_restorer, &frame->pretcode);
     } else {
-        uint16_t val16;
-        addr = frame_addr + offsetof(struct rt_sigframe, retcode);
-        __put_user(addr, &frame->pretcode);
-        /* This is movl $,%eax ; int $0x80 */
-        __put_user(0xb8, (char *)(frame->retcode+0));
-        __put_user(TARGET_NR_rt_sigreturn, (int *)(frame->retcode+1));
-        val16 = 0x80cd;
-        __put_user(val16, (uint16_t *)(frame->retcode+5));
+        __put_user(default_rt_sigreturn, &frame->pretcode);
     }
 #else
     /* XXX: Would be slightly better to return -EFAULT here if test fails
@@ -591,3 +575,25 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+#ifndef TARGET_X86_64
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    /* This is popl %eax ; movl $,%eax ; int $0x80 */
+    __put_user(0xb858, (uint16_t *)(tramp + 0));
+    __put_user(TARGET_NR_sigreturn, (int *)(tramp + 2));
+    __put_user(0x80cd, (uint16_t *)(tramp + 6));
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    /* This is movl $,%eax ; int $0x80 */
+    __put_user(0xb8, (char *)(tramp + 8));
+    __put_user(TARGET_NR_rt_sigreturn, (int *)(tramp + 9));
+    __put_user(0x80cd, (uint16_t *)(tramp + 13));
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
+#endif
-- 
2.25.1


