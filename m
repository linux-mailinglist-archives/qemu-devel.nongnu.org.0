Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1234BF468
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:10:04 +0100 (CET)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRBJ-0006tQ-3E
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:10:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMR6x-0004pU-Ie
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:05:31 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMR6h-0001fu-HC
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:05:23 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K2tW51zYLz9snB;
 Tue, 22 Feb 2022 17:03:29 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:05:11 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:05:11 +0800
To: <pbonzini@redhat.com>, <berrange@redhat.com>, <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, <arei.gonglei@huawei.com>,
 <wangxinxin.wang@huawei.com>, "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: [PATCH v2 2/3] sem-posix: use monotonic clock instead
Date: Tue, 22 Feb 2022 17:05:05 +0800
Message-ID: <20220222090507.2028-3-longpeng2@huawei.com>
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

Use CLOCK_MONOTONIC, so the timeout isn't affected by changes to
the system time. It depends on the pthread_condattr_setclock(),
while some systems(e.g. mac os) does not support it, so the behavior
won't change in these systems.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 meson.build              | 11 +++++++++++
 util/qemu-thread-posix.c | 49 +++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 3ccb110..2bab94f 100644
--- a/meson.build
+++ b/meson.build
@@ -1688,6 +1688,17 @@ config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links(gnu_source_pre
     pthread_create(&thread, 0, f, 0);
     return 0;
   }''', dependencies: threads))
+config_host_data.set('CONFIG_PTHREAD_CONDATTR_SETCLOCK', cc.links(gnu_source_prefix + '''
+  #include <pthread.h>
+  #include <time.h>
+
+  int main(void)
+  {
+    pthread_condattr_t attr
+    pthread_condattr_init(&attr);
+    pthread_condattr_setclock(&attr, CLOCK_MONOTONIC);
+    return 0;
+  }''', dependencies: threads))
 
 config_host_data.set('CONFIG_SIGNALFD', cc.links(gnu_source_prefix + '''
   #include <sys/signalfd.h>
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 1ad2503..44446ce 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -38,12 +38,20 @@ static void error_exit(int err, const char *msg)
     abort();
 }
 
+static inline clockid_t qemu_timedwait_clockid(void)
+{
+#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
+    return CLOCK_MONOTONIC;
+#else
+    return CLOCK_REALTIME;
+#endif
+}
+
 static void compute_abs_deadline(struct timespec *ts, int ms)
 {
-    struct timeval tv;
-    gettimeofday(&tv, NULL);
-    ts->tv_nsec = tv.tv_usec * 1000 + (ms % 1000) * 1000000;
-    ts->tv_sec = tv.tv_sec + ms / 1000;
+    clock_gettime(qemu_timedwait_clockid(), ts);
+    ts->tv_nsec += (ms % 1000) * 1000000;
+    ts->tv_sec += ms / 1000;
     if (ts->tv_nsec >= 1000000000) {
         ts->tv_sec++;
         ts->tv_nsec -= 1000000000;
@@ -147,11 +155,25 @@ void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 
 void qemu_cond_init(QemuCond *cond)
 {
+    pthread_condattr_t attr;
     int err;
 
-    err = pthread_cond_init(&cond->cond, NULL);
-    if (err)
+    err = pthread_condattr_init(&attr);
+    if (err) {
+        error_exit(err, __func__);
+    }
+    err = pthread_condattr_setclock(&attr, qemu_timedwait_clockid());
+    if (err) {
+        error_exit(err, __func__);
+    }
+    err = pthread_cond_init(&cond->cond, &attr);
+    if (err) {
         error_exit(err, __func__);
+    }
+    err = pthread_condattr_destroy(&attr);
+    if (err) {
+        error_exit(err, __func__);
+    }
     cond->initialized = true;
 }
 
@@ -217,16 +239,29 @@ bool qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
 
 void qemu_sem_init(QemuSemaphore *sem, int init)
 {
+    pthread_condattr_t attr;
     int rc;
 
     rc = pthread_mutex_init(&sem->lock, NULL);
     if (rc != 0) {
         error_exit(rc, __func__);
     }
-    rc = pthread_cond_init(&sem->cond, NULL);
+    rc = pthread_condattr_init(&attr);
+    if (rc != 0) {
+        error_exit(rc, __func__);
+    }
+    rc = pthread_condattr_setclock(&attr, qemu_timedwait_clockid());
     if (rc != 0) {
         error_exit(rc, __func__);
     }
+    rc = pthread_cond_init(&sem->cond, &attr);
+    if (rc != 0) {
+        error_exit(rc, __func__);
+    }
+    rc = pthread_condattr_destroy(&attr);
+    if (rc < 0) {
+        error_exit(rc, __func__);
+    }
     if (init < 0) {
         error_exit(EINVAL, __func__);
     }
-- 
1.8.3.1


