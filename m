Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF073A7285
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:34:38 +0200 (CEST)
Received: from localhost ([::1]:38488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw6I-00058j-02
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3b-0006Kp-OK
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3Z-0007jT-Ew
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id 11so7458672plk.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pW4vETrqc6vHHQQeDLIC4JkQ5JSGQVmq8K1PVvelvVs=;
 b=fC5chCgjtyEPdxs3f7NQIt9C8v+qsruTIFbZCkQWc8+uzbYgEcSgV7U0WQxGReKft9
 /qURAbldLZJmQExJFUfh3aPDu7vVUFX0C1yuBWxdEQaiLFCOmPCSmL+vgPQ7ia4hM54s
 bHLJsOAI6GRQY4sEy1tzNrUXSUyweD+5QyOL3c/rTrS+AXyt0tCzHX9PudEH2TZ5gs6m
 7UPFJyid5Z0KWejQhbIZ33u86yyGBxskASD42X1zjTh9VG0Et7jCJtNPVTk2ZlTPe7pt
 3vkLKdTDnXiejDsjnn6B4RuEiyBVCYRvUsADWuAIfh4lRL7TrwsObGja5SYy8zjDqfb4
 iEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pW4vETrqc6vHHQQeDLIC4JkQ5JSGQVmq8K1PVvelvVs=;
 b=aOJSAlg+MST/nEoTtNV+uLgurJgyIYLw0HgQnrfX4plm6FmFWrarsvn6auvTx46nl+
 BhfB1z1CMj4yMT9mq8gAl5YMnQO47TrPAXDhhTeiwXHXf09yY7s59KYtbVjoSaAcXQlA
 ZCdlHthIdgnY6XWvGcIrM2fDUf3/PohEK0i+Brb3GI3cWpy1//7U0BiWmR9uLQ9f28nB
 MWUWXY3vG7Kqt9figQsps4EWSzZIXrFRJBX2JKSbwBk8oJypxnPApSrkRvfLpLGfR40F
 pVPrVQSKPb+qUG9b61XlL8R7UgG1zac0kZpKyHH69ykraGpk8jb0/x/ZWTw+VXnMrQiP
 atIg==
X-Gm-Message-State: AOAM533kP2QRR+dwqDwEKGWY2PZGwTZUHfIqGJMYvdMS/L/egY7BrEmS
 rdxBx0H4D7UnXbcKbqkDkEImCdfwpjpCvw==
X-Google-Smtp-Source: ABdhPJzdQpwqUWMUsPlzi9bEL/6MjsbcTZskreiL90S74TNErGH91/DkhVqGfTKPUTiRxqktg0OSJg==
X-Received: by 2002:a17:90a:c08f:: with SMTP id
 o15mr1646022pjs.166.1623713507946; 
 Mon, 14 Jun 2021 16:31:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] util: Use unique type for QemuRecMutex in
 thread-posix.h
Date: Mon, 14 Jun 2021 16:31:40 -0700
Message-Id: <20210614233143.1221879-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

We will shortly convert lockable.h to _Generic, and we cannot
have two compatible types in the same expansion.  Wrap QemuMutex
in a struct, and unwrap in qemu-thread-posix.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


