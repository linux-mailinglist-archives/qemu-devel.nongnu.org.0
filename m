Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B795065CD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:27:00 +0200 (CEST)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngiGJ-00026G-Pr
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmG-0001FP-Vm
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmF-0004Vo-41
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso755843wml.5
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w33mdIoFVNOOSPvZUAn4apdKTQAZu1kZttVw9aofvXI=;
 b=mzUy4Wle6z4dFFyHEREwh7vgGItMUFcpemubtaAdk5fUpaiToSI1DQwuE0jOopNwwj
 Cyd3xxlwWnW9PrIoAxFVIHlISD8txq1LiZLPAtk9Ls1arEpUxDSrnOkVzxfEGGeqmv1V
 IKuAiJqBA1hI15sCVIokQ5Se6iCUz2WRKHZCW5xAdBXzOTSxVmjiYLfj4sGD63CAI8cA
 Xh94zG41FDSkWJroOsyYeTJaN9J55p4UXnUYohP6GOnOrYKxdDCGaatCMwVqqU0xl0KZ
 jZUO144pqWFP0Dz0WQQYNuy9PIM1y2hJNSDo5nmPHIdk3ryruDMhVMQM4w7aQU77q9eU
 BfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w33mdIoFVNOOSPvZUAn4apdKTQAZu1kZttVw9aofvXI=;
 b=G2ySjt4gA0pT4fJWcF1ufpVxM5bsSPl41WfDzPYIqCyr7waB4CjVX0FeqL/0dRGI+p
 +Oy0CeWY2Xf9GFRCMNwtqk0PxMayBbQWPWywKUdYFpihv8gCck+jDAMHQjqRSs0zSPBb
 sqgxZXqfgL5UQrfYp3ynXnuEsNcc7mpxSDfFqVXg3MnPjklmaWhBggJROWvM5zpst1fO
 qF693Ei7M8CHT+IGL0bkTdZOOYUe3Oy9IX4mM7AUpBZAFzmV4wdsT15JF4XzZxIL6pqZ
 MhfNTXOzb/mK39YI5rrcIqIpdz82WWuhj7idOyjuW1Y//a7KRtDcoOelEHyyagq+kUHk
 CR+g==
X-Gm-Message-State: AOAM533GPfxdpS5yQ954w/fTbtAJrkJSLSPCz2LM4YAC1Bgu2aFNxgjZ
 MRFV9o0CpGThPIB73nN7D5D+C7sYJymXHg==
X-Google-Smtp-Source: ABdhPJxZz4I9uR7M7BoDgQLo9fTd5ifEvJIkHqL4rLsAFhGXO4o+VxBe7qwu7hUB76SDv/fLsyFCLA==
X-Received: by 2002:a05:600c:4313:b0:38e:b150:2f8e with SMTP id
 p19-20020a05600c431300b0038eb1502f8emr18279843wme.198.1650347509213; 
 Mon, 18 Apr 2022 22:51:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/53] thread-posix: implement Semaphore with QemuCond and
 QemuMutex
Date: Tue, 19 Apr 2022 07:50:58 +0200
Message-Id: <20220419055109.142788-43-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Longpeng(Mike)" <longpeng2@huawei.com>

Now that QemuSemaphore is implemented through pthread_cond_t only, we can use
QemuCond and QemuMutex to make the code smaller.  Features such as mutex
tracing and CLOCK_MONOTONIC timedwait are supported in qemu-sem naturally.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Message-Id: <20220222090507.2028-4-longpeng2@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/thread-posix.h |   5 +-
 util/qemu-thread-posix.c    | 105 +++++++++++-------------------------
 2 files changed, 34 insertions(+), 76 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index 5466608d7c..5f2f3d1386 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -27,10 +27,9 @@ struct QemuCond {
 };
 
 struct QemuSemaphore {
-    pthread_mutex_t lock;
-    pthread_cond_t cond;
+    QemuMutex mutex;
+    QemuCond cond;
     unsigned int count;
-    bool initialized;
 };
 
 struct QemuEvent {
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index f6a34eed2f..8505d8c60f 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -222,16 +222,15 @@ void qemu_cond_wait_impl(QemuCond *cond, QemuMutex *mutex, const char *file, con
         error_exit(err, __func__);
 }
 
-bool qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
-                              const char *file, const int line)
+static bool
+qemu_cond_timedwait_ts(QemuCond *cond, QemuMutex *mutex, struct timespec *ts,
+                       const char *file, const int line)
 {
     int err;
-    struct timespec ts;
 
     assert(cond->initialized);
     trace_qemu_mutex_unlock(mutex, file, line);
-    compute_abs_deadline(&ts, ms);
-    err = pthread_cond_timedwait(&cond->cond, &mutex->lock, &ts);
+    err = pthread_cond_timedwait(&cond->cond, &mutex->lock, ts);
     trace_qemu_mutex_locked(mutex, file, line);
     if (err && err != ETIMEDOUT) {
         error_exit(err, __func__);
@@ -239,113 +238,73 @@ bool qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
     return err != ETIMEDOUT;
 }
 
+bool qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
+                              const char *file, const int line)
+{
+    struct timespec ts;
+
+    compute_abs_deadline(&ts, ms);
+    return qemu_cond_timedwait_ts(cond, mutex, &ts, file, line);
+}
+
 void qemu_sem_init(QemuSemaphore *sem, int init)
 {
-    pthread_condattr_t attr;
-    int rc;
+    qemu_mutex_init(&sem->mutex);
+    qemu_cond_init(&sem->cond);
 
-    rc = pthread_mutex_init(&sem->lock, NULL);
-    if (rc != 0) {
-        error_exit(rc, __func__);
-    }
-    rc = pthread_condattr_init(&attr);
-    if (rc != 0) {
-        error_exit(rc, __func__);
-    }
-#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
-    rc = pthread_condattr_setclock(&attr, qemu_timedwait_clockid());
-    if (rc != 0) {
-        error_exit(rc, __func__);
-    }
-#endif
-    rc = pthread_cond_init(&sem->cond, &attr);
-    if (rc != 0) {
-        error_exit(rc, __func__);
-    }
-    rc = pthread_condattr_destroy(&attr);
-    if (rc < 0) {
-        error_exit(rc, __func__);
-    }
     if (init < 0) {
         error_exit(EINVAL, __func__);
     }
     sem->count = init;
-    sem->initialized = true;
 }
 
 void qemu_sem_destroy(QemuSemaphore *sem)
 {
-    int rc;
-
-    assert(sem->initialized);
-    sem->initialized = false;
-    rc = pthread_cond_destroy(&sem->cond);
-    if (rc < 0) {
-        error_exit(rc, __func__);
-    }
-    rc = pthread_mutex_destroy(&sem->lock);
-    if (rc < 0) {
-        error_exit(rc, __func__);
-    }
+    qemu_cond_destroy(&sem->cond);
+    qemu_mutex_destroy(&sem->mutex);
 }
 
 void qemu_sem_post(QemuSemaphore *sem)
 {
-    int rc;
-
-    assert(sem->initialized);
-    pthread_mutex_lock(&sem->lock);
+    qemu_mutex_lock(&sem->mutex);
     if (sem->count == UINT_MAX) {
-        rc = EINVAL;
+        error_exit(EINVAL, __func__);
     } else {
         sem->count++;
-        rc = pthread_cond_signal(&sem->cond);
-    }
-    pthread_mutex_unlock(&sem->lock);
-    if (rc != 0) {
-        error_exit(rc, __func__);
+        qemu_cond_signal(&sem->cond);
     }
+    qemu_mutex_unlock(&sem->mutex);
 }
 
 int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
 {
-    int rc;
+    bool rc = true;
     struct timespec ts;
 
-    assert(sem->initialized);
-    rc = 0;
     compute_abs_deadline(&ts, ms);
-    pthread_mutex_lock(&sem->lock);
+    qemu_mutex_lock(&sem->mutex);
     while (sem->count == 0) {
-        rc = pthread_cond_timedwait(&sem->cond, &sem->lock, &ts);
-        if (rc == ETIMEDOUT) {
+        rc = qemu_cond_timedwait_ts(&sem->cond, &sem->mutex, &ts,
+                                    __FILE__, __LINE__);
+        if (!rc) { /* timeout */
             break;
         }
-        if (rc != 0) {
-            error_exit(rc, __func__);
-        }
     }
-    if (rc != ETIMEDOUT) {
+    if (rc) {
         --sem->count;
     }
-    pthread_mutex_unlock(&sem->lock);
-    return (rc == ETIMEDOUT ? -1 : 0);
+    qemu_mutex_unlock(&sem->mutex);
+    return (rc ? 0 : -1);
 }
 
 void qemu_sem_wait(QemuSemaphore *sem)
 {
-    int rc;
-
-    assert(sem->initialized);
-    pthread_mutex_lock(&sem->lock);
+    qemu_mutex_lock(&sem->mutex);
     while (sem->count == 0) {
-        rc = pthread_cond_wait(&sem->cond, &sem->lock);
-        if (rc != 0) {
-            error_exit(rc, __func__);
-        }
+        qemu_cond_wait(&sem->cond, &sem->mutex);
     }
     --sem->count;
-    pthread_mutex_unlock(&sem->lock);
+    qemu_mutex_unlock(&sem->mutex);
 }
 
 #ifdef __linux__
-- 
2.35.1



