Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231F3AD2FA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:38:21 +0200 (CEST)
Received: from localhost ([::1]:50866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKJo-0000Nt-KB
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBo-0001bU-Ua
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:05 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBj-0001So-1j
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:04 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y15so2618818pfl.4
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kmu7xnRVWsU3eWGJbPPKgl5+mSDH//+NJHn4m15m2Pw=;
 b=dxDQX56mM5aVhbrjiqVUUXkb6eNqKNlJBK+/HRkmsWFO8tLP4HuGULYH65nB79Z2De
 /0C7UlRBE6OeFS4XflOiOdklQKzTrH2l9AJslJU2MBN3g9qJ1gaZx3u9Lha4HoBKZ4f5
 Qnm5mTXnSsZ3xNymQgkc7JtP5ZwZ7zhOl2cVaB34MkAjPfyJKTVtnvbrSi+aOWtcOzLx
 UjP4mejf9JeLreo+8DE/LgpKBjhYNiZUWa+wvpRy8Bo/gHrXjEUT+JumcGJ458n24SN+
 IWFab3XYB+4ODWTXqYqPV/soF7SUAUEa/8cmO3YVugfrEk7P90oUDUk2duZel92j9910
 vWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kmu7xnRVWsU3eWGJbPPKgl5+mSDH//+NJHn4m15m2Pw=;
 b=elE4tsTopswm4euNgv30P73eESAfyHu8vTgLOBIm1/ZSUbunf38RDuLs+3Iltx+YhR
 5drFneqdxjEGf9MWDg8TRTOPB3BZhBBxA6KTc9Yg3bRVstuCx9tR985AD7sAJSEkojpj
 CH8tkWjAIPwdfQfEmFquPLHfFf1NnUTIUQ+xP+1fbx0VYXEE0I2fa/wkxa+etSAZeGGQ
 3ImTqIixiOkJ8q2MNmX9cv/sWDafBfyIi4HypRaLWcluMRA8qEMLFV7uXe74PthlJ0bq
 tXjmSR6JxNjB3BCtlE99R4SB5ll96zIsSnkWhGlgx+Bj6ACJgAEdxGwANKCYhtcjKKpb
 Tuiw==
X-Gm-Message-State: AOAM5305+w2vAWVVe7yOwuEHEzAbagK7AU6yL15sJqehA0dMsL2ZLns/
 PgDX4uSeBBwsenf2Zn8dz7UH6cxclh/gzA==
X-Google-Smtp-Source: ABdhPJySJB2NWa+GnD7MJjv0RANhrpFtbSVIahYRmz5DIZRdtwlF0Umh5FPnnMZro5uPqp+TinNqKg==
X-Received: by 2002:a65:610c:: with SMTP id z12mr11670328pgu.453.1624044597869; 
 Fri, 18 Jun 2021 12:29:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/23] linux-user/i386: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:38 -0700
Message-Id: <20210618192951.125651-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
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


