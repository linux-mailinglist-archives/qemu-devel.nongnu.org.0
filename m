Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC174D96E7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:58:13 +0100 (CET)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU30H-000728-OR
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:58:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lu-0008Rd-EP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:14 -0400
Received: from [2607:f8b0:4864:20::62b] (port=35807
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2ls-00052d-LU
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:14 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n15so15676396plh.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ERpNlhEJI6fLWZOagQ9lWdhLVUwWHMh+hWen+Y5bofU=;
 b=M9M42VU87dQ337HZOgYHvEJvqT+ba1jMjlVApTWDq2/XrlyPGZhLFajsfG/bUmB8zi
 t2HBJljsjd6p+3FeEWONgKtvsQu1QIrRdKQirgXtOlBSaKvfmfKLzooHQEKiCJ6pbwVS
 Mns5caP+mUopqbwrlXyTPqGyby7BYi1IvwhZ4cYgsd8DMUG0t1S4fMB/3kHVbRfMBSkE
 tAPhpvJ5KOebnyvXmjDy0frCRw2/jV+HyfhRj76NqFopj1B6klsmb61H3F2M2cY6ZA3M
 i2Ac+ujyk1oaxsd5o13Ohs+Z1MJHOXHuOP1jgVtJp+0SmEckDBSKvGBfnlWov770NsQp
 Bzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERpNlhEJI6fLWZOagQ9lWdhLVUwWHMh+hWen+Y5bofU=;
 b=qRas3wKg0n3HVWr0JSPNTZnARfYB3cSjufCnbJPVuWqx0b8+9oPhECi+PfN9HOajTC
 PGwypg43/Pb3Qyc9Sn+rzZr0dViC9r4gC6QVxlFJUtkzU+1lUMHNT61w2ORb1/cgY1nX
 gmd5JhvG3Zja3tGgcePUtVmilEef54hpWzaZShxW+L8HDu2OY1c/WIx0bHpKbT27Azaa
 p5w4cbzYOW8YEca03NSTZYup+4JP+ics9CglSebj9aLmZaWen07md9gzMdt0c/RsURbG
 1Hkg8gk30JNYOcD1FkzncQzMpYmOqVKx+Of7OYEcThvldMwTBHh0RAtPWRnrRE20d8Ko
 bwvQ==
X-Gm-Message-State: AOAM53381EmAKWBoW2K9fSIzYoI2usSQbou8LXJ+Y1r/g2/4bWp5DKqy
 WnmAqRmdI6hLOxE619axhZa6jox0+Fk1pw==
X-Google-Smtp-Source: ABdhPJyAkxmor4lcGc2ZaHneULMNMb+0c6PXWNqpRrtaL2oqdn0pr1DJVFvZWGvr/nLOGMlP/RvONA==
X-Received: by 2002:a17:902:7296:b0:14b:4bc6:e81 with SMTP id
 d22-20020a170902729600b0014b4bc60e81mr27028751pll.132.1647333791176; 
 Tue, 15 Mar 2022 01:43:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm2233762pjb.27.2022.03.15.01.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 01:43:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] linux-user: Split out helpers for sigsuspend
Date: Tue, 15 Mar 2022 01:43:05 -0700
Message-Id: <20220315084308.433109-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315084308.433109-1-richard.henderson@linaro.org>
References: <20220315084308.433109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two new functions: process_sigsuspend_mask and finish_sigsuspend_mask.
Move the size check and copy-from-user code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal-common.h | 26 +++++++++++++++++++++++++
 linux-user/signal.c        | 23 ++++++++++++++++++++++
 linux-user/syscall.c       | 40 ++++++++++++++++----------------------
 3 files changed, 66 insertions(+), 23 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 2113165a75..6a7e4a93fc 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -92,4 +92,30 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
  */
 int block_signals(void); /* Returns non zero if signal pending */
 
+/**
+ * process_sigsuspend_mask: read and apply syscall-local signal mask
+ *
+ * Read the guest signal mask from @sigset, length @sigsize.
+ * Convert that to a host signal mask and save it to sigpending_mask.
+ *
+ * Return value: negative target errno, or zero;
+ *               store &sigpending_mask into *pset on success.
+ */
+int process_sigsuspend_mask(sigset_t **pset, target_ulong sigset,
+                            target_ulong sigsize);
+
+/**
+ * finish_sigsuspend_mask: finish a sigsuspend-like syscall
+ *
+ * Set in_sigsuspend if we need to use the modified sigset
+ * during process_pending_signals.
+ */
+static inline void finish_sigsuspend_mask(int ret)
+{
+    if (ret != -QEMU_ERESTARTSYS) {
+        TaskState *ts = (TaskState *)thread_cpu->opaque;
+        ts->in_sigsuspend = 1;
+    }
+}
+
 #endif
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 2a3f3cc23f..092e70b80c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1199,3 +1199,26 @@ void process_pending_signals(CPUArchState *cpu_env)
     }
     ts->in_sigsuspend = 0;
 }
+
+int process_sigsuspend_mask(sigset_t **pset, target_ulong sigset,
+                            target_ulong sigsize)
+{
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    sigset_t *host_set = &ts->sigsuspend_mask;
+    target_sigset_t *target_sigset;
+
+    if (sigsize != sizeof(*target_sigset)) {
+        /* Like the kernel, we enforce correct size sigsets */
+        return -TARGET_EINVAL;
+    }
+
+    target_sigset = lock_user(VERIFY_READ, sigset, sigsize, 1);
+    if (!target_sigset) {
+        return -TARGET_EFAULT;
+    }
+    target_to_host_sigset(host_set, target_sigset);
+    unlock_user(target_sigset, sigset, 0);
+
+    *pset = host_set;
+    return 0;
+}
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ecd00382a8..154cb1c7e8 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9557,41 +9557,35 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_sigsuspend
     case TARGET_NR_sigsuspend:
         {
-            TaskState *ts = cpu->opaque;
+            sigset_t *set;
+
 #if defined(TARGET_ALPHA)
+            TaskState *ts = cpu->opaque;
             /* target_to_host_old_sigset will bswap back */
             abi_ulong mask = tswapal(arg1);
-            target_to_host_old_sigset(&ts->sigsuspend_mask, &mask);
+            set = &ts->sigsuspend_mask;
+            target_to_host_old_sigset(set, &mask);
 #else
-            if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))
-                return -TARGET_EFAULT;
-            target_to_host_old_sigset(&ts->sigsuspend_mask, p);
-            unlock_user(p, arg1, 0);
-#endif
-            ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
-                                               SIGSET_T_SIZE));
-            if (ret != -QEMU_ERESTARTSYS) {
-                ts->in_sigsuspend = 1;
+            ret = process_sigsuspend_mask(&set, arg1, sizeof(target_sigset_t));
+            if (ret != 0) {
+                return ret;
             }
+#endif
+            ret = get_errno(safe_rt_sigsuspend(set, SIGSET_T_SIZE));
+            finish_sigsuspend_mask(ret);
         }
         return ret;
 #endif
     case TARGET_NR_rt_sigsuspend:
         {
-            TaskState *ts = cpu->opaque;
+            sigset_t *set;
 
-            if (arg2 != sizeof(target_sigset_t)) {
-                return -TARGET_EINVAL;
-            }
-            if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))
-                return -TARGET_EFAULT;
-            target_to_host_sigset(&ts->sigsuspend_mask, p);
-            unlock_user(p, arg1, 0);
-            ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
-                                               SIGSET_T_SIZE));
-            if (ret != -QEMU_ERESTARTSYS) {
-                ts->in_sigsuspend = 1;
+            ret = process_sigsuspend_mask(&set, arg1, arg2);
+            if (ret != 0) {
+                return ret;
             }
+            ret = get_errno(safe_rt_sigsuspend(set, SIGSET_T_SIZE));
+            finish_sigsuspend_mask(ret);
         }
         return ret;
 #ifdef TARGET_NR_rt_sigtimedwait
-- 
2.25.1


