Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA69D3A4B59
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:44:09 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqoq-0005AB-MR
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqf4-0004Md-0C
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:34:02 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqet-0006PY-At
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:34:01 -0400
Received: by mail-pj1-x102e.google.com with SMTP id g24so6512991pji.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OC0cZyVRPvWMo/VhnD4bd9Z7jMtR0MDDeeQWprN19Gw=;
 b=uT+H0GOg7BHQnDF2P9+Nipe3ErUxtHUccckrNMifaiYwWER7NELb1KprlJPG5fvuIz
 WIalnSx9M0/niwMiVKgebcIr8xqmJxQtjTCUQMtATszYTkevRMN5t2gjnspLAgJvUeyh
 v+BkErP1eSZ9UHAeqCx3j6PRbR/g+SuwPcam0USuU932eOnHLl1YPwJIUKDuBdeivSeW
 9xH2n5QgAMFdOpYMEd0VDd17ejwEgiHXNDyHgGwbWKaghKtoo2uXcHuGjjva93rq93To
 QvYH2TZWNdCCaw6OOlsaJhTlJQSXgJvpRSITGqSKyxgPLPZn5NEGz+JEtIC1nKctQnrL
 i1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OC0cZyVRPvWMo/VhnD4bd9Z7jMtR0MDDeeQWprN19Gw=;
 b=WS2WgPWQOhneQxVN6l3LA9qNgYcsX7KcIUOx8XF+6XaYMEndJ2ttQpJ9DaluVTkUSE
 LefVSG9tU4jOosK0wvwmZtm+JoCxdlyufODiM9nKOxOzgtYO+mXyJTW68IpCUhhmu3/e
 JQcYKm+tcdqrwqiEvX5xgfdqATezFUP2u79jYCnHwIZlT/wpbRy8Fb6bF94wGiHiff3X
 1G0wMBMpAD8UmBgQ9dW3lFX9fOQTP+XLCTiemU3NQSnV8/6jQ63WKXizmaqHMcGGVNoc
 /dPczfa9MW305lZmQstlaOtYKQ4epaC4WxD1C11RBentQaX3Nh3WY3pLFOHOAoJYOyH2
 Vp5A==
X-Gm-Message-State: AOAM530/UkkL8WylZmBg7NjgUWTj0pFvZ5Xpa3oYPEX0Q4da5X7bdcUo
 AmevX36aDGkLNLKLXzlqhRqdGs6tVr9n6w==
X-Google-Smtp-Source: ABdhPJzsTUf6QXrYdvojo8WZB6M+pjbyCSttschuIkh+GAkXFN86qLLjP7HekqDjTNLCA8n7+ZT3KQ==
X-Received: by 2002:a17:90b:46c3:: with SMTP id
 jx3mr6735079pjb.206.1623454429930; 
 Fri, 11 Jun 2021 16:33:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] util: Use real functions for thread-posix QemuRecMutex
Date: Fri, 11 Jun 2021 16:33:42 -0700
Message-Id: <20210611233347.653129-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
References: <20210611233347.653129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@liaro.org>

Move the declarations from thread-win32.h into thread.h
and remove the macro redirection from thread-posix.h.
This will be required by following cleanups.

Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
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


