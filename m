Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AC3A7282
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:33:17 +0200 (CEST)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw4y-0000bf-4K
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3a-0006GA-JV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:50 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3Y-0007iA-4Q
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:50 -0400
Received: by mail-pl1-x636.google.com with SMTP id h12so7467622plf.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1pHNOtNL853PPW0rBSNZ74Xe6wa2QgytGF7lJKr9R9U=;
 b=Q1xsAB/PJAL77MIzXurpW9tRYfk3/WAFpZt2nUnDsRESyIoz06XUHpp94kNqoQEFAC
 BHCGEKZ9jWrgLqw2C1YP282h2Jok81SlnwpyaeUhuut1P3iuiIZdBZmI7YzMTyk9XxDj
 lJ+s2s1++cMJS1mpPYM0YLrO9gHymvHCGq6u4yLvCyTpn9RGreey4wgo8jabPaji9eXK
 v4NOnrVg/u6QNtafK7407zyHmv71qeXUFD9DZNKhD70PT5IQkggL8YwYZ96/uElSNVK+
 2vFSZ8loZkfzJHMNiVkZec0YBZ0nYDed7QPGGivTQ1O+B+pyBPzE2Oxg1I9rXRxflDIC
 rHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1pHNOtNL853PPW0rBSNZ74Xe6wa2QgytGF7lJKr9R9U=;
 b=aFdSJg0/fIcgn68a1jjIXlteAhb2y2+h938og60EmfEZMT/CzmJb5vJAJDOfMVuHLU
 kRFxTDI9l5A8XSKM+wKlAn1SKn4KykwIsAxvFYFItNcJCe/d3gK+aM6SsbFCYcVUczY0
 n5FB5h96T4ioZoW5mQZek688rblhtI58F3tNqf93TN1SShfPW2V71wpmWZJbHux9lZK4
 vGJKUhLvnd24wiwFZUpVq8HEjDy0JazFQHa8CmL0sUTxW7tz232wydaMchJstnujpYnJ
 AHxpEuMS+d1WKMEFDMyM/gZkTMhJHrYM/6KIArxCRz8uv8jC5k6kbHUi9BSku9imj4mi
 rivA==
X-Gm-Message-State: AOAM5320wgFE8gOjM+AR1Np2WB8bpVL4DaGi1N87pv4nNNTBNaEGlXfD
 +6n87MtCwbA9ZP2gKW4c53qC4bmg8rjmLA==
X-Google-Smtp-Source: ABdhPJxm8l/kRRDY6gh2b+t2kEvGRD6GLrOPUmWoXRTvvcJ/xmEUI5GJh/WcxvNiyg6Xs5uSrz8Hfw==
X-Received: by 2002:a17:90a:17e7:: with SMTP id
 q94mr21347759pja.117.1623713506746; 
 Mon, 14 Jun 2021 16:31:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] util: Use real functions for thread-posix QemuRecMutex
Date: Mon, 14 Jun 2021 16:31:38 -0700
Message-Id: <20210614233143.1221879-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the declarations from thread-win32.h into thread.h
and remove the macro redirection from thread-posix.h.
This will be required by following cleanups.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/thread-posix.h |  4 ----
 include/qemu/thread-win32.h |  6 ------
 include/qemu/thread.h       |  9 ++++++---
 util/qemu-thread-posix.c    | 20 ++++++++++++++++++++
 4 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index c903525062..cf8bc90468 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -5,10 +5,6 @@
 #include <semaphore.h>
 
 typedef QemuMutex QemuRecMutex;
-#define qemu_rec_mutex_destroy qemu_mutex_destroy
-#define qemu_rec_mutex_lock_impl    qemu_mutex_lock_impl
-#define qemu_rec_mutex_trylock_impl qemu_mutex_trylock_impl
-#define qemu_rec_mutex_unlock qemu_mutex_unlock
 
 struct QemuMutex {
     pthread_mutex_t lock;
diff --git a/include/qemu/thread-win32.h b/include/qemu/thread-win32.h
index d0a1a9597e..d95af4498f 100644
--- a/include/qemu/thread-win32.h
+++ b/include/qemu/thread-win32.h
@@ -18,12 +18,6 @@ struct QemuRecMutex {
     bool initialized;
 };
 
-void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
-void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
-int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file,
-                                int line);
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
-
 struct QemuCond {
     CONDITION_VARIABLE var;
     bool initialized;
diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 5435763184..2c0d85f3bc 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -28,6 +28,12 @@ int qemu_mutex_trylock_impl(QemuMutex *mutex, const char *file, const int line);
 void qemu_mutex_lock_impl(QemuMutex *mutex, const char *file, const int line);
 void qemu_mutex_unlock_impl(QemuMutex *mutex, const char *file, const int line);
 
+void qemu_rec_mutex_init(QemuRecMutex *mutex);
+void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
+void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
+int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line);
+void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
+
 typedef void (*QemuMutexLockFunc)(QemuMutex *m, const char *f, int l);
 typedef int (*QemuMutexTrylockFunc)(QemuMutex *m, const char *f, int l);
 typedef void (*QemuRecMutexLockFunc)(QemuRecMutex *m, const char *f, int l);
@@ -129,9 +135,6 @@ static inline int (qemu_rec_mutex_trylock)(QemuRecMutex *mutex)
     return qemu_rec_mutex_trylock(mutex);
 }
 
-/* Prototypes for other functions are in thread-posix.h/thread-win32.h.  */
-void qemu_rec_mutex_init(QemuRecMutex *mutex);
-
 void qemu_cond_init(QemuCond *cond);
 void qemu_cond_destroy(QemuCond *cond);
 
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index dcff5e7c5d..8e2b6653f5 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -124,6 +124,26 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex)
     mutex->initialized = true;
 }
 
+void qemu_rec_mutex_destroy(QemuRecMutex *mutex)
+{
+    qemu_mutex_destroy(mutex);
+}
+
+void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line)
+{
+    qemu_mutex_lock_impl(mutex, file, line);
+}
+
+int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
+{
+    return qemu_mutex_trylock_impl(mutex, file, line);
+}
+
+void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+{
+    qemu_mutex_unlock(mutex);
+}
+
 void qemu_cond_init(QemuCond *cond)
 {
     int err;
-- 
2.25.1


