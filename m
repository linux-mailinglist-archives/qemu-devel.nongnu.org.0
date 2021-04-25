Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D037836A825
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 17:59:36 +0200 (CEST)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahAV-0000p2-St
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 11:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8v-0007qx-Ot
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:57 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8q-00039o-P6
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:57 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso3743370pjb.4
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m1XPgsGFLSBeMhD9gxrYKvEpAYHWWlmlzUSgBmaIZRg=;
 b=qguwD2UtgcGxcKg8kqD3Vxq96DRc1jEMFm2hNGZRma9Vx1BARHi78swrHbA1z3GOl2
 SvE5auHnnyxcLw6MhSxzbZdo8oEAYv+o0e12rfkqCDlhULp2B63PpLIxgpP8ybceTgGq
 dKRhf4cHN0Th5WlgoENfpgF3SZe6/FCkG4rZZFnxrp+BT52rw86RN7Dpf4bt2q6uTUYg
 XzjDis/rXJQFxh5tJP6DIzmWxQPBG0rzAr+GYCK+uixx2/FOxjv2V5j0OraFZlOh7FIR
 MFbrhlcmOrkyGzxsIRUNW5MEFPDk69C/Rg8nHQQidS8DZHKJEfJ7M8VhoiKE2lrfv7sb
 FSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m1XPgsGFLSBeMhD9gxrYKvEpAYHWWlmlzUSgBmaIZRg=;
 b=N8DjElZu/SFDN54lKiQJO9lW0QxyHWrRl3rigex+WJbFD8w35F3tKazy3BgqRAgpQ2
 e2KZiXLR4d14brxbJOGRjOp/emQGtUViUwb7PDnw3L4uHeoSRlCoKplOTj1F50dJ92eo
 10Bu5AqLf4IMPFZU1PkGFke2xueidZZNDlyTUQGQVhei/+ZG08oXj6wfFD5BVLsInkZc
 gFrla3GR9Yq4dp0XnAt5/DrS89CGzJJcoklAgYPtPeOtAT4EJNjy1qbCepFY+xPuT6H/
 HFJqmogv/oW/cF4tuR0QNJYyTxjF7jMhfKDRUGkD/9t2eKaQC6VgxNwgUVTD4/0Q8fev
 M6nw==
X-Gm-Message-State: AOAM533j/ipGYl1z+lAZ6IeVmZ6b53xMl2KPqnE0ODylfX7S8aOMd5oI
 oVCx8TwxLS1eIO1o8lTH0rdYhXCaxQdRTg==
X-Google-Smtp-Source: ABdhPJz5HNMMfBtYjwzBsL8y+f7ytyNUj6FClh3q354U+qTLTL1QnYVDPyS4tHkdpC2s40mRtI+0Mg==
X-Received: by 2002:a17:902:6946:b029:e9:4dcc:9966 with SMTP id
 k6-20020a1709026946b02900e94dcc9966mr13940772plt.6.1619366271420; 
 Sun, 25 Apr 2021 08:57:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] linux-user: Split out target_restore_altstack
Date: Sun, 25 Apr 2021 08:57:42 -0700
Message-Id: <20210425155749.896330-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425155749.896330-1-richard.henderson@linaro.org>
References: <20210425155749.896330-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a function to match target_save_altstack.
Fix some style and unlock issues in do_sigaltstack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal-common.h |   1 +
 linux-user/signal.c        | 115 +++++++++++++++++++++----------------
 2 files changed, 66 insertions(+), 50 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 1df1068552..34b963af9a 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -24,6 +24,7 @@ int on_sig_stack(unsigned long sp);
 int sas_ss_flags(unsigned long sp);
 abi_ulong target_sigsp(abi_ulong sp, struct target_sigaction *ka);
 void target_save_altstack(target_stack_t *uss, CPUArchState *env);
+abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp);
 
 static inline void target_sigemptyset(target_sigset_t *set)
 {
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 44a5012930..306f3edec5 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -297,6 +297,50 @@ void target_save_altstack(target_stack_t *uss, CPUArchState *env)
     __put_user(ts->sigaltstack_used.ss_size, &uss->ss_size);
 }
 
+abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp)
+{
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    size_t minstacksize = TARGET_MINSIGSTKSZ;
+    target_stack_t ss;
+
+#if defined(TARGET_PPC64)
+    /* ELF V2 for PPC64 has a 4K minimum stack size for signal handlers */
+    struct image_info *image = ts->info;
+    if (get_ppc64_abi(image) > 1) {
+        minstacksize = 4096;
+    }
+#endif
+
+    __get_user(ss.ss_sp, &uss->ss_sp);
+    __get_user(ss.ss_size, &uss->ss_size);
+    __get_user(ss.ss_flags, &uss->ss_flags);
+
+    if (on_sig_stack(sp)) {
+        return -TARGET_EPERM;
+    }
+
+    switch (ss.ss_flags) {
+    default:
+        return -TARGET_EINVAL;
+
+    case TARGET_SS_DISABLE:
+        ss.ss_size = 0;
+        ss.ss_sp = 0;
+        break;
+
+    case TARGET_SS_ONSTACK:
+    case 0:
+        if (ss.ss_size < minstacksize) {
+            return -TARGET_ENOMEM;
+        }
+        break;
+    }
+
+    ts->sigaltstack_used.ss_sp = ss.ss_sp;
+    ts->sigaltstack_used.ss_size = ss.ss_size;
+    return 0;
+}
+
 /* siginfo conversion */
 
 static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
@@ -758,73 +802,44 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
 /* compare linux/kernel/signal.c:do_sigaltstack() */
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
 {
-    int ret;
-    struct target_sigaltstack oss;
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    target_stack_t oss, *uoss = NULL;
+    abi_long ret = -TARGET_EFAULT;
 
-    /* XXX: test errors */
-    if(uoss_addr)
-    {
+    if (uoss_addr) {
+        TaskState *ts = (TaskState *)thread_cpu->opaque;
+
+        /* Verify writability now, but do not alter user memory yet. */
+        if (!lock_user_struct(VERIFY_WRITE, uoss, uoss_addr, 0)) {
+            goto out;
+        }
         __put_user(ts->sigaltstack_used.ss_sp, &oss.ss_sp);
         __put_user(ts->sigaltstack_used.ss_size, &oss.ss_size);
         __put_user(sas_ss_flags(sp), &oss.ss_flags);
     }
 
-    if(uss_addr)
-    {
-        struct target_sigaltstack *uss;
-        struct target_sigaltstack ss;
-        size_t minstacksize = TARGET_MINSIGSTKSZ;
+    if (uss_addr) {
+        target_stack_t *uss;
 
-#if defined(TARGET_PPC64)
-        /* ELF V2 for PPC64 has a 4K minimum stack size for signal handlers */
-        struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
-        if (get_ppc64_abi(image) > 1) {
-            minstacksize = 4096;
-        }
-#endif
-
-        ret = -TARGET_EFAULT;
         if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
             goto out;
         }
-        __get_user(ss.ss_sp, &uss->ss_sp);
-        __get_user(ss.ss_size, &uss->ss_size);
-        __get_user(ss.ss_flags, &uss->ss_flags);
-        unlock_user_struct(uss, uss_addr, 0);
-
-        ret = -TARGET_EPERM;
-        if (on_sig_stack(sp))
+        ret = target_restore_altstack(uss, sp);
+        if (ret) {
             goto out;
-
-        ret = -TARGET_EINVAL;
-        if (ss.ss_flags != TARGET_SS_DISABLE
-            && ss.ss_flags != TARGET_SS_ONSTACK
-            && ss.ss_flags != 0)
-            goto out;
-
-        if (ss.ss_flags == TARGET_SS_DISABLE) {
-            ss.ss_size = 0;
-            ss.ss_sp = 0;
-        } else {
-            ret = -TARGET_ENOMEM;
-            if (ss.ss_size < minstacksize) {
-                goto out;
-            }
         }
-
-        ts->sigaltstack_used.ss_sp = ss.ss_sp;
-        ts->sigaltstack_used.ss_size = ss.ss_size;
     }
 
     if (uoss_addr) {
-        ret = -TARGET_EFAULT;
-        if (copy_to_user(uoss_addr, &oss, sizeof(oss)))
-            goto out;
+        memcpy(uoss, &oss, sizeof(oss));
+        unlock_user_struct(uoss, uoss_addr, 1);
+        uoss = NULL;
     }
-
     ret = 0;
-out:
+
+ out:
+    if (uoss) {
+        unlock_user_struct(uoss, uoss_addr, 0);
+    }
     return ret;
 }
 
-- 
2.25.1


