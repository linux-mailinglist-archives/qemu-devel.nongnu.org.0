Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2133A4B4B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:39:14 +0200 (CEST)
Received: from localhost ([::1]:38364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqk5-00047T-DG
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqey-0004Jt-5k
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:56 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqeu-0006QQ-H3
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:55 -0400
Received: by mail-pg1-x533.google.com with SMTP id q15so3633835pgg.12
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z8lCeI6CyIoQ0CotuHE5M+TRtTyS3/YGRMYX2q8e+24=;
 b=kby2S/spQhVox3R8AU7UJp27SrU3Qr5u/xqdVI55zkBDOj+mEfYe3u+z3VchWX0al/
 y+cIJREEgWGm3xvS3y0Xml7KFBQJEMqTcGOyDWEgf8w7Y0no00lqkLqJUgYVy+9nieZO
 gJvVgnDgwIbsweGSM4S9olcBT7jh+mley4QyYFA9rXnhgMiR4ZbyHf/S2ZSe8KwZ5uVY
 a8UhknRfq5aRz5GUiBvuSEbLs1xfMW/5kYw31YDxLl0ZSdYTKBtYL6xV8n0SE9QSwnkp
 NEVu4ejUwKWo3vmTIzvMMafeLB9aa34g961zl4LM0nblO/0cT0K5M7TU1jKqJqtFY0Cl
 bd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8lCeI6CyIoQ0CotuHE5M+TRtTyS3/YGRMYX2q8e+24=;
 b=mQMaNJqnMfFdy8B5KzWzkcGJZHdZkxaUdEW7jeQoi9Q6V1jqiyUFoyTYZDejAkl6Re
 fpgJKOnwDnNJ/FmFv2ltKD/6rrNVFvWev6JxxPPZUioNAf1qa5oqlcUis+awnIbbhyVt
 3G/b/7GXIjZp5o1CsvJmvg7pzMduOkIHM4jRmJCHRWcidb8QwKwx9OiFppO+oga3Bp8P
 mbSbjKN4g/4kBOiR6DVRgKYOi4LyRI80mXQZ5jd6Xj41GI96LIXsI57lOdF3dH09uC6B
 Hi1FxqP5J5Pq424yY25Yk/W1XjfQ5msxvNoFOer8Mda2TfB9dI6pSeZthtUwSI7smdY9
 gjOw==
X-Gm-Message-State: AOAM533Dzq2BDSFL8CMyRbWdPw744ht18jgsCQuVYgMnTd2K1Pvswx9j
 CbeV00R4KSbfzYgWQkVCHJXdvBwBRO12kw==
X-Google-Smtp-Source: ABdhPJzUHcZN1u5861GAtr5IKeqXHgqrzt6AXEoduG4feG3XmrkKjmy6LHNRA8Rdzg+6wxOdXZABiQ==
X-Received: by 2002:a63:c047:: with SMTP id z7mr5957626pgi.186.1623454431216; 
 Fri, 11 Jun 2021 16:33:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] util: Use unique type for QemuRecMutex in thread-posix.h
Date: Fri, 11 Jun 2021 16:33:44 -0700
Message-Id: <20210611233347.653129-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
References: <20210611233347.653129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

We will shortly convert lockable.h to _Generic, and we cannot
have two compatible types in the same expansion.  Wrap QemuMutex
in a struct, and unwrap in qemu-thread-posix.c.

Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
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


