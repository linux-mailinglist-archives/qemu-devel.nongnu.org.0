Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42614BF472
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:14:51 +0100 (CET)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRFz-0000vs-1W
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:14:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMR6y-0004pW-Fq
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:05:32 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMR6i-0001ft-5Z
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:05:22 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K2tW45crPz9sxw;
 Tue, 22 Feb 2022 17:03:28 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:05:11 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:05:10 +0800
To: <pbonzini@redhat.com>, <berrange@redhat.com>, <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, <arei.gonglei@huawei.com>,
 <wangxinxin.wang@huawei.com>, "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: [PATCH v2 1/3] sem-posix: remove the posix semaphore support
Date: Tue, 22 Feb 2022 17:05:04 +0800
Message-ID: <20220222090507.2028-2-longpeng2@huawei.com>
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
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

POSIX specifies an absolute time for sem_timedwait(), it would be
affected if the system time is changing, but there is not a relative
time or monotonic clock version of sem_timedwait, so we cannot gain
from POSIX semaphore any more.

An alternative way is to use sem_trywait + usleep, maybe we can
remove CONFIG_SEM_TIMEDWAIT in this way? No, because some systems
(e.g. mac os) mark the sem_xxx API as deprecated.

So maybe remove the usage of POSIX semaphore and turn to use the
pthread variant for all systems looks better.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 include/qemu/thread-posix.h |  4 ----
 meson.build                 |  1 -
 util/qemu-thread-posix.c    | 54 ---------------------------------------------
 3 files changed, 59 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index b792e6e..5466608 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -27,13 +27,9 @@ struct QemuCond {
 };
 
 struct QemuSemaphore {
-#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_t lock;
     pthread_cond_t cond;
     unsigned int count;
-#else
-    sem_t sem;
-#endif
     bool initialized;
 };
 
diff --git a/meson.build b/meson.build
index 762d7ce..3ccb110 100644
--- a/meson.build
+++ b/meson.build
@@ -1557,7 +1557,6 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
-config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
 config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
 config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
 config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index e1225b6..1ad2503 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -219,7 +219,6 @@ void qemu_sem_init(QemuSemaphore *sem, int init)
 {
     int rc;
 
-#ifndef CONFIG_SEM_TIMEDWAIT
     rc = pthread_mutex_init(&sem->lock, NULL);
     if (rc != 0) {
         error_exit(rc, __func__);
@@ -232,12 +231,6 @@ void qemu_sem_init(QemuSemaphore *sem, int init)
         error_exit(EINVAL, __func__);
     }
     sem->count = init;
-#else
-    rc = sem_init(&sem->sem, 0, init);
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-#endif
     sem->initialized = true;
 }
 
@@ -247,7 +240,6 @@ void qemu_sem_destroy(QemuSemaphore *sem)
 
     assert(sem->initialized);
     sem->initialized = false;
-#ifndef CONFIG_SEM_TIMEDWAIT
     rc = pthread_cond_destroy(&sem->cond);
     if (rc < 0) {
         error_exit(rc, __func__);
@@ -256,12 +248,6 @@ void qemu_sem_destroy(QemuSemaphore *sem)
     if (rc < 0) {
         error_exit(rc, __func__);
     }
-#else
-    rc = sem_destroy(&sem->sem);
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-#endif
 }
 
 void qemu_sem_post(QemuSemaphore *sem)
@@ -269,7 +255,6 @@ void qemu_sem_post(QemuSemaphore *sem)
     int rc;
 
     assert(sem->initialized);
-#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_lock(&sem->lock);
     if (sem->count == UINT_MAX) {
         rc = EINVAL;
@@ -281,12 +266,6 @@ void qemu_sem_post(QemuSemaphore *sem)
     if (rc != 0) {
         error_exit(rc, __func__);
     }
-#else
-    rc = sem_post(&sem->sem);
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-#endif
 }
 
 int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
@@ -295,7 +274,6 @@ int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
     struct timespec ts;
 
     assert(sem->initialized);
-#ifndef CONFIG_SEM_TIMEDWAIT
     rc = 0;
     compute_abs_deadline(&ts, ms);
     pthread_mutex_lock(&sem->lock);
@@ -313,29 +291,6 @@ int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
     }
     pthread_mutex_unlock(&sem->lock);
     return (rc == ETIMEDOUT ? -1 : 0);
-#else
-    if (ms <= 0) {
-        /* This is cheaper than sem_timedwait.  */
-        do {
-            rc = sem_trywait(&sem->sem);
-        } while (rc == -1 && errno == EINTR);
-        if (rc == -1 && errno == EAGAIN) {
-            return -1;
-        }
-    } else {
-        compute_abs_deadline(&ts, ms);
-        do {
-            rc = sem_timedwait(&sem->sem, &ts);
-        } while (rc == -1 && errno == EINTR);
-        if (rc == -1 && errno == ETIMEDOUT) {
-            return -1;
-        }
-    }
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-    return 0;
-#endif
 }
 
 void qemu_sem_wait(QemuSemaphore *sem)
@@ -343,7 +298,6 @@ void qemu_sem_wait(QemuSemaphore *sem)
     int rc;
 
     assert(sem->initialized);
-#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_lock(&sem->lock);
     while (sem->count == 0) {
         rc = pthread_cond_wait(&sem->cond, &sem->lock);
@@ -353,14 +307,6 @@ void qemu_sem_wait(QemuSemaphore *sem)
     }
     --sem->count;
     pthread_mutex_unlock(&sem->lock);
-#else
-    do {
-        rc = sem_wait(&sem->sem);
-    } while (rc == -1 && errno == EINTR);
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-#endif
 }
 
 #ifdef __linux__
-- 
1.8.3.1


