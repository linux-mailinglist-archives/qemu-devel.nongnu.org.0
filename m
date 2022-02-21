Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B64BD8F9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:16:16 +0100 (CET)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5jr-0001vZ-5L
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:16:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nM5R0-0008OH-2t
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:56:46 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nM5Qx-0005SH-DS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:56:45 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4K2Hdl6JPbz1FDP5;
 Mon, 21 Feb 2022 17:52:11 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 17:56:26 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Feb 2022 17:56:25 +0800
To: <pbonzini@redhat.com>, <berrange@redhat.com>, <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, <arei.gonglei@huawei.com>, "Longpeng(Mike)"
 <longpeng2@huawei.com>
Subject: [RFC 2/2] sem-posix: use monotonic clock instead
Date: Mon, 21 Feb 2022 17:56:17 +0800
Message-ID: <20220221095617.1974-3-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220221095617.1974-1-longpeng2@huawei.com>
References: <20220221095617.1974-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use CLOCK_MONOTONIC, so the timeout isn't affected by changes
to the system time. It depends on the pthread_condattr_setclock(),
while some systems(e.g. mac os) do not support it,  the behavior
won't change in these systems.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 include/qemu/thread-posix.h |  1 +
 meson.build                 | 11 +++++++++++
 util/qemu-thread-posix.c    | 32 +++++++++++++++++++++++++++++---
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index 5466608..cc77000 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -29,6 +29,7 @@ struct QemuCond {
 struct QemuSemaphore {
     pthread_mutex_t lock;
     pthread_cond_t cond;
+    pthread_condattr_t attr;
     unsigned int count;
     bool initialized;
 };
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
index 1ad2503..d3a7c54 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -40,10 +40,22 @@ static void error_exit(int err, const char *msg)
 
 static void compute_abs_deadline(struct timespec *ts, int ms)
 {
+    time_t now_sec;
+    long now_nsec;
+#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
+    struct timespec now;
+    clock_gettime(CLOCK_MONOTONIC, &now);
+    now_sec = now.tv_sec;
+    now_nsec = now.tv_nsec;
+#else
     struct timeval tv;
     gettimeofday(&tv, NULL);
-    ts->tv_nsec = tv.tv_usec * 1000 + (ms % 1000) * 1000000;
-    ts->tv_sec = tv.tv_sec + ms / 1000;
+    now_sec = tv.tv_sec;
+    now_nsec = tv.tv_usec * 1000;
+#endif
+
+    ts->tv_nsec = now_nsec + (ms % 1000) * 1000000;
+    ts->tv_sec = now_sec + ms / 1000;
     if (ts->tv_nsec >= 1000000000) {
         ts->tv_sec++;
         ts->tv_nsec -= 1000000000;
@@ -223,7 +235,17 @@ void qemu_sem_init(QemuSemaphore *sem, int init)
     if (rc != 0) {
         error_exit(rc, __func__);
     }
-    rc = pthread_cond_init(&sem->cond, NULL);
+    rc = pthread_condattr_init(&sem->attr);
+    if (rc != 0) {
+        error_exit(rc, __func__);
+    }
+#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
+    rc = pthread_condattr_setclock(&sem->attr, CLOCK_MONOTONIC);
+    if (rc != 0) {
+        error_exit(rc, __func__);
+    }
+#endif
+    rc = pthread_cond_init(&sem->cond, &sem->attr);
     if (rc != 0) {
         error_exit(rc, __func__);
     }
@@ -248,6 +270,10 @@ void qemu_sem_destroy(QemuSemaphore *sem)
     if (rc < 0) {
         error_exit(rc, __func__);
     }
+    rc = pthread_condattr_destroy(&sem->attr);
+    if (rc < 0) {
+        error_exit(rc, __func__);
+    }
 }
 
 void qemu_sem_post(QemuSemaphore *sem)
-- 
1.8.3.1


