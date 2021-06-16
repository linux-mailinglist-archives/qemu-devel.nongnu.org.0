Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AD13A8E8F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:47:44 +0200 (CEST)
Received: from localhost ([::1]:47252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKeb-0005qF-Tz
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTw-0000Ej-Hu
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:40 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTr-0005cq-18
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:40 -0400
Received: by mail-pg1-x532.google.com with SMTP id n12so593528pgs.13
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/EtpcVEQvR+xKHuSj5BLnH+yGHBoGGI8vPUI0hS6/Q=;
 b=DDO4tPut9QtIhmX3hAF9slNPBHWt1we64LOXJYHf5he2Y38yLADZ2OQg10/nbWEf0b
 WgPMYiitpli78lKj0rm4TV6rkqcpOelZd6YFAQWu4sDezik2rhe3oMe+VzLhoM83qVBw
 oYD65XLFkmWwamYx2jJPTzN3dG9fj+M3B9i2s3VVhKcm3JWZz9Dpf5FNuW/AN2/tjlPT
 5HJeX7vbHyq8eiOxIKXVW39jQ8oo4Q2L/kyw+LJrozl1M8o0w6HUf65qKkZOVMaBy5Pg
 urO0G6RKZgK6mOyPUtUCBKx5SKuGz+5LHvTLhYMov27wSNeFp4Fil+m+WQ0OaKHXfCd1
 Va3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/EtpcVEQvR+xKHuSj5BLnH+yGHBoGGI8vPUI0hS6/Q=;
 b=i9TES2PB1KSIxjOxrOow5zMA/wwZWkU6YYOhFMce29nL1j0nsaPkx3j/EsUv+s19Jp
 L13Zv6VpIlXaI6SKR8oNwC3p2pgoW5ympVVqFooDxOZDYSe46OTi7TjJyM6Pk18Gu2Kt
 XK+4IDgW7KoXTMRAEsSRkLP8W276iMZmUZyD4vEik/5Dr1FZKC9gTwxmG5BHuaBGpRin
 WAjdANcggNcboqaV9wGS8MR0ySXrVRE3GA7jviItLm5wyhTIuFqqzTadlyYv3zt/jxjh
 PJrOGQnPDu0GIhOINfozsIN6g0EeQlCNL34Qyq0FMiS/4RRSrJFTZCijIv7guLENiJLx
 C8Jw==
X-Gm-Message-State: AOAM531hZB77ut4Z8wgoLNWdaUDzXhq9isUv2i5GN34ttTnBIjNUjY90
 LnadIH9KA0bPnEljweJdz6faL5t+csZjfQ==
X-Google-Smtp-Source: ABdhPJwEhiH+XEh0Hnl7RKuUpJhMZpxbqN/48dEFYSZIPVgn2Be01A+I4WbHjfH1szgDvybTuJt35Q==
X-Received: by 2002:a05:6a00:248a:b029:2f7:218b:3845 with SMTP id
 c10-20020a056a00248ab02902f7218b3845mr6781964pfv.12.1623807393750; 
 Tue, 15 Jun 2021 18:36:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] util: Use unique type for QemuRecMutex in thread-posix.h
Date: Tue, 15 Jun 2021 18:36:26 -0700
Message-Id: <20210616013629.1458790-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly convert lockable.h to _Generic, and we cannot
have two compatible types in the same expansion.  Wrap QemuMutex
in a struct, and unwrap in qemu-thread-posix.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-6-richard.henderson@linaro.org>
---
 include/qemu/thread-posix.h | 10 ++++++++--
 util/qemu-thread-posix.c    | 12 ++++++------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index cf8bc90468..b792e6ef37 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -4,8 +4,6 @@
 #include <pthread.h>
 #include <semaphore.h>
 
-typedef QemuMutex QemuRecMutex;
-
 struct QemuMutex {
     pthread_mutex_t lock;
 #ifdef CONFIG_DEBUG_MUTEX
@@ -15,6 +13,14 @@ struct QemuMutex {
     bool initialized;
 };
 
+/*
+ * QemuRecMutex cannot be a typedef of QemuMutex lest we have two
+ * compatible cases in _Generic.  See qemu/lockable.h.
+ */
+typedef struct QemuRecMutex {
+    QemuMutex m;
+} QemuRecMutex;
+
 struct QemuCond {
     pthread_cond_t cond;
     bool initialized;
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index d990826ed8..fd9d714038 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -116,32 +116,32 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex)
 
     pthread_mutexattr_init(&attr);
     pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
-    err = pthread_mutex_init(&mutex->lock, &attr);
+    err = pthread_mutex_init(&mutex->m.lock, &attr);
     pthread_mutexattr_destroy(&attr);
     if (err) {
         error_exit(err, __func__);
     }
-    mutex->initialized = true;
+    mutex->m.initialized = true;
 }
 
 void qemu_rec_mutex_destroy(QemuRecMutex *mutex)
 {
-    qemu_mutex_destroy(mutex);
+    qemu_mutex_destroy(&mutex->m);
 }
 
 void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    qemu_mutex_lock_impl(mutex, file, line);
+    qemu_mutex_lock_impl(&mutex->m, file, line);
 }
 
 int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    return qemu_mutex_trylock_impl(mutex, file, line);
+    return qemu_mutex_trylock_impl(&mutex->m, file, line);
 }
 
 void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    qemu_mutex_unlock_impl(mutex, file, line);
+    qemu_mutex_unlock_impl(&mutex->m, file, line);
 }
 
 void qemu_cond_init(QemuCond *cond)
-- 
2.25.1


