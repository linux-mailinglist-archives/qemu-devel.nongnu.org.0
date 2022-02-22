Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B84BF48D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:20:38 +0100 (CET)
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRLZ-00047v-Bx
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMR7A-0004yr-Hu
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:05:46 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMR74-0001jF-7Z
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:05:43 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K2tWj22GFzcn1L;
 Tue, 22 Feb 2022 17:04:01 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:05:12 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:05:11 +0800
To: <pbonzini@redhat.com>, <berrange@redhat.com>, <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, <arei.gonglei@huawei.com>,
 <wangxinxin.wang@huawei.com>, "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: [PATCH v2 3/3] sem-posix: refactor qemu-sem with qemu-cond and
 qemu-mutex
Date: Tue, 22 Feb 2022 17:05:06 +0800
Message-ID: <20220222090507.2028-4-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220222090507.2028-1-longpeng2@huawei.com>
References: <20220222090507.2028-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

Now, qemu-sem is based on the pthread_cond only, we can use
qemu-cond and qemu-mutex to make the code neater and the mutex
trace can be supported in qemu-sem naturally.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 include/qemu/thread-posix.h |   5 +--
 util/qemu-thread-posix.c    | 103 ++++++++++++++------------------------------
 2 files changed, 34 insertions(+), 74 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index 5466608..5f2f3d1 100644
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
index 44446ce..f2ce47d 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -220,16 +220,15 @@ void qemu_cond_wait_impl(QemuCond *cond, QemuMutex *mutex, const char *file, con
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
@@ -237,111 +236,73 @@ bool qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
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
-    rc = pthread_condattr_setclock(&attr, qemu_timedwait_clockid());
-    if (rc != 0) {
-        error_exit(rc, __func__);
-    }
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
1.8.3.1


