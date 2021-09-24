Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA22417983
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:14:37 +0200 (CEST)
Received: from localhost ([::1]:37122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTomS-0003kp-Fs
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY4-0002gK-2K
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:44 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXw-0006xG-OF
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:43 -0400
Received: by mail-qt1-x834.google.com with SMTP id r16so10014205qtw.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNdU6ybIJfer/a+2lnb556GEnq4khU62qRteMioxBnA=;
 b=c6rBbSE92Bl275CCX6hCTkSHXu871oEY/WrE2Ftsa1Xk9LuMFvOtrO6hao3B7CyKMQ
 vEzbOrOvLBRAoSldiepRD7SWr6DYA/7a1H+93hAmw1pgQUdeIb+oyZT1B+OVWc/IIycE
 bfUyGaSD5BvRErSXfB4Nj5ksEm+BF9ESKHWhdJV4ZJPHJ9/0OKYUt2biIU/q+SkOEuDE
 2522sgkbpORXaF2KZcgzJ0GR/xE+gtWBucbC2i8eIabCM07rLB4DyYSJzKKHAyG7tGCP
 JI/WSBydWGveNmjAhPkjJk2hPGwFpi5/PWEp83pjpzdqJ8FbH6bXLkFbX4J9C6sZqeIa
 6nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNdU6ybIJfer/a+2lnb556GEnq4khU62qRteMioxBnA=;
 b=xwNvtkJnYVT0DaKfooqlpxs+Setg58x2K4NSJDM27YGgkMrtYYo+Sy8aoqHzcoPkGF
 wmqNib1XOJBjYML8lJDimW7jiuAVEfD72ILD/KuNVHI2mRJAWlmDVjT4z8LeWWYV0CEG
 pjmgwOCME3go91cGGgbNtFrjlmKFdcK12qpdbrb1xuinzTNVFeafYTa1xNGrjYPRivpf
 GiOrxcGn53N8prVlgxxn0KPnXEJWmJmwTugmQxENj83x3QEHzeqJfXYBXG8YQHezbX48
 PveHMadMwZwlGdp9TJNSyTKi7e90VM+T/T5/TlIu7NmL/MnsYXJiQ8gBGFS2JoxUdAVX
 3WIg==
X-Gm-Message-State: AOAM533S8u32330FGRKuvqZTT4EwJEUMQTgPK+qHlcwFMgQhv0IKnnUc
 JzGHbwMAmSNns9/OXnKhfSx+SneYn4LGZQ==
X-Google-Smtp-Source: ABdhPJwjVXGATNNtNl05aJiBSzvXatslyG0KeCmZPxhdLcD0oQfdTYGDWfsloYP6Bi274aLU6RMKqA==
X-Received: by 2002:a05:622a:11ce:: with SMTP id
 n14mr5291983qtk.374.1632502775487; 
 Fri, 24 Sep 2021 09:59:35 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/27] linux-user/i386: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:09 -0400
Message-Id: <20210924165926.752809-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.
Note that x86_64 does not use this code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/target_signal.h   |  2 ++
 linux-user/x86_64/target_signal.h |  3 ++
 linux-user/i386/signal.c          | 56 +++++++++++++++++++++----------
 3 files changed, 43 insertions(+), 18 deletions(-)

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
index 3b4b55fc0a..94ab6396a0 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -310,6 +310,22 @@ get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t frame_size)
 }
 
 #ifndef TARGET_X86_64
+static void install_sigtramp(void *tramp)
+{
+    /* This is popl %eax ; movl $syscall,%eax ; int $0x80 */
+    __put_user(0xb858, (uint16_t *)(tramp + 0));
+    __put_user(TARGET_NR_sigreturn, (int *)(tramp + 2));
+    __put_user(0x80cd, (uint16_t *)(tramp + 6));
+}
+
+static void install_rt_sigtramp(void *tramp)
+{
+    /* This is movl $syscall,%eax ; int $0x80 */
+    __put_user(0xb8, (char *)(tramp + 0));
+    __put_user(TARGET_NR_rt_sigreturn, (int *)(tramp + 1));
+    __put_user(0x80cd, (uint16_t *)(tramp + 5));
+}
+
 /* compare linux/arch/i386/kernel/signal.c:setup_frame() */
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUX86State *env)
@@ -338,16 +354,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
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
+        /* This is no longer used, but is retained for ABI compatibility. */
+        install_sigtramp(frame->retcode);
+        __put_user(default_sigreturn, &frame->pretcode);
     }
 
     /* Set up registers for signal handler */
@@ -416,14 +425,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
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
+        /* This is no longer used, but is retained for ABI compatibility. */
+        install_rt_sigtramp(frame->retcode);
+        __put_user(default_rt_sigreturn, &frame->pretcode);
     }
 #else
     /* XXX: Would be slightly better to return -EFAULT here if test fails
@@ -592,3 +596,19 @@ badframe:
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
+    install_sigtramp(tramp);
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_rt_sigtramp(tramp + 8);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
+#endif
-- 
2.25.1


