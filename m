Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1056CBAC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 11:19:02 +0200 (CEST)
Received: from localhost ([::1]:35750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho2Z3-000143-8w
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 05:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38999)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1ho2Y5-0005ki-IZ
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:18:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1ho2Y4-00084u-5L
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:18:01 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:43464)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yury-kotov@yandex-team.ru>)
 id 1ho2Y3-00081y-Cx
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 05:18:00 -0400
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id A7DD52E12B0;
 Thu, 18 Jul 2019 12:17:53 +0300 (MSK)
Received: from smtpcorp1p.mail.yandex.net (smtpcorp1p.mail.yandex.net
 [2a02:6b8:0:1472:2741:0:8b6:10])
 by mxbackcorp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 vNo3OBwvUM-HriODf4s; Thu, 18 Jul 2019 12:17:53 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1563441473; bh=pdYBsi4yOtIzET/6XmZ1Glh9q8tSBBe6AsJssWPKHrM=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=rUyMfSn3ht1o6mwQSyIkDnHG4Rni5F2Ms/WdxG50B7DYBrufy0V8/wS1cFJQJ3bF6
 gEHvyjeyJ2fHfxfCG0qpimyaTKcRZzqEXirw9byX/meC/HNx6uIlAwx+T6y/K/kq7P
 rErICUQtf5GE2RIQzrdP8a0Mh7oxuIJc3BJny6FQ=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:9028:49c4:6359:9be1])
 by smtpcorp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 JhNdbP5MZj-HrwqmOHI; Thu, 18 Jul 2019 12:17:53 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Date: Thu, 18 Jul 2019 12:17:24 +0300
Message-Id: <20190718091726.9874-2-yury-kotov@yandex-team.ru>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190718091726.9874-1-yury-kotov@yandex-team.ru>
References: <20190718091726.9874-1-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1a2d::193
Subject: [Qemu-devel] [PATCH v3 1/3] qemu-thread: Add qemu_cond_timedwait
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:Overall" <qemu-devel@nongnu.org>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
---
 include/qemu/thread.h    | 18 ++++++++++++++++++
 util/qemu-thread-posix.c | 40 ++++++++++++++++++++++++++++------------
 util/qemu-thread-win32.c | 16 ++++++++++++++++
 util/qsp.c               | 18 ++++++++++++++++++
 4 files changed, 80 insertions(+), 12 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 55d83a907c..d0cd7b9ae0 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -34,6 +34,8 @@ typedef void (*QemuRecMutexLockFunc)(QemuRecMutex *m, c=
onst char *f, int l);
 typedef int (*QemuRecMutexTrylockFunc)(QemuRecMutex *m, const char *f, i=
nt l);
 typedef void (*QemuCondWaitFunc)(QemuCond *c, QemuMutex *m, const char *=
f,
                                  int l);
+typedef void (*QemuCondTimedWaitFunc)(QemuCond *c, QemuMutex *m, int ms,
+                                      const char *f, int l);
=20
 extern QemuMutexLockFunc qemu_bql_mutex_lock_func;
 extern QemuMutexLockFunc qemu_mutex_lock_func;
@@ -41,6 +43,7 @@ extern QemuMutexTrylockFunc qemu_mutex_trylock_func;
 extern QemuRecMutexLockFunc qemu_rec_mutex_lock_func;
 extern QemuRecMutexTrylockFunc qemu_rec_mutex_trylock_func;
 extern QemuCondWaitFunc qemu_cond_wait_func;
+extern QemuCondTimedWaitFunc qemu_cond_timedwait_func;
=20
 /* convenience macros to bypass the profiler */
 #define qemu_mutex_lock__raw(m)                         \
@@ -63,6 +66,8 @@ extern QemuCondWaitFunc qemu_cond_wait_func;
             qemu_rec_mutex_trylock_impl(m, __FILE__, __LINE__);
 #define qemu_cond_wait(c, m)                                            =
\
             qemu_cond_wait_impl(c, m, __FILE__, __LINE__);
+#define qemu_cond_timedwait(c, m, ms)                                   =
\
+            qemu_cond_wait_impl(c, m, ms, __FILE__, __LINE__);
 #else
 #define qemu_mutex_lock(m) ({                                           =
\
             QemuMutexLockFunc _f =3D atomic_read(&qemu_mutex_lock_func);=
  \
@@ -89,6 +94,11 @@ extern QemuCondWaitFunc qemu_cond_wait_func;
             QemuCondWaitFunc _f =3D atomic_read(&qemu_cond_wait_func);  =
  \
             _f(c, m, __FILE__, __LINE__);                               =
\
         })
+
+#define qemu_cond_timedwait(c, m, ms) ({                                =
       \
+            QemuCondTimedWaitFunc _f =3D atomic_read(&qemu_cond_timedwai=
t_func); \
+            _f(c, m, ms, __FILE__, __LINE__);                           =
       \
+        })
 #endif
=20
 #define qemu_mutex_unlock(mutex) \
@@ -134,12 +144,20 @@ void qemu_cond_signal(QemuCond *cond);
 void qemu_cond_broadcast(QemuCond *cond);
 void qemu_cond_wait_impl(QemuCond *cond, QemuMutex *mutex,
                          const char *file, const int line);
+void qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
+                              const char *file, const int line);
=20
 static inline void (qemu_cond_wait)(QemuCond *cond, QemuMutex *mutex)
 {
     qemu_cond_wait(cond, mutex);
 }
=20
+static inline void (qemu_cond_timedwait)(QemuCond *cond, QemuMutex *mute=
x,
+                                         int ms)
+{
+    qemu_cond_timedwait(cond, mutex, ms);
+}
+
 void qemu_sem_init(QemuSemaphore *sem, int init);
 void qemu_sem_post(QemuSemaphore *sem);
 void qemu_sem_wait(QemuSemaphore *sem);
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 1bf5e65dea..eed777d9ec 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -36,6 +36,18 @@ static void error_exit(int err, const char *msg)
     abort();
 }
=20
+static void compute_abs_deadline(struct timespec *ts, int ms)
+{
+    struct timeval tv;
+    gettimeofday(&tv, NULL);
+    ts->tv_nsec =3D tv.tv_usec * 1000 + (ms % 1000) * 1000000;
+    ts->tv_sec =3D tv.tv_sec + ms / 1000;
+    if (ts->tv_nsec >=3D 1000000000) {
+        ts->tv_sec++;
+        ts->tv_nsec -=3D 1000000000;
+    }
+}
+
 void qemu_mutex_init(QemuMutex *mutex)
 {
     int err;
@@ -164,6 +176,22 @@ void qemu_cond_wait_impl(QemuCond *cond, QemuMutex *=
mutex, const char *file, con
         error_exit(err, __func__);
 }
=20
+void qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
+                              const char *file, const int line)
+{
+    int err;
+    struct timespec ts;
+
+    assert(cond->initialized);
+    trace_qemu_mutex_unlock(mutex, file, line);
+    compute_abs_deadline(&ts, ms);
+    err =3D pthread_cond_timedwait(&cond->cond, &mutex->lock, &ts);
+    trace_qemu_mutex_locked(mutex, file, line);
+    if (err && err !=3D ETIMEDOUT) {
+        error_exit(err, __func__);
+    }
+}
+
 void qemu_sem_init(QemuSemaphore *sem, int init)
 {
     int rc;
@@ -238,18 +266,6 @@ void qemu_sem_post(QemuSemaphore *sem)
 #endif
 }
=20
-static void compute_abs_deadline(struct timespec *ts, int ms)
-{
-    struct timeval tv;
-    gettimeofday(&tv, NULL);
-    ts->tv_nsec =3D tv.tv_usec * 1000 + (ms % 1000) * 1000000;
-    ts->tv_sec =3D tv.tv_sec + ms / 1000;
-    if (ts->tv_nsec >=3D 1000000000) {
-        ts->tv_sec++;
-        ts->tv_nsec -=3D 1000000000;
-    }
-}
-
 int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
 {
     int rc;
diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index 572f88535d..5faa01cb61 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -145,6 +145,22 @@ void qemu_cond_wait_impl(QemuCond *cond, QemuMutex *=
mutex, const char *file, con
     qemu_mutex_post_lock(mutex, file, line);
 }
=20
+void qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
+                              const char *file, const int line)
+{
+    int rc =3D 0;
+
+    assert(cond->initialized);
+    trace_qemu_mutex_unlock(mutex, file, line);
+    if (!SleepConditionVariableSRW(&cond->var, &mutex->lock, ms, 0)) {
+        rc =3D GetLastError();
+    }
+    trace_qemu_mutex_locked(mutex, file, line);
+    if (rc && rc !=3D ERROR_TIMEOUT) {
+        error_exit(rc, __func__);
+    }
+}
+
 void qemu_sem_init(QemuSemaphore *sem, int init)
 {
     /* Manual reset.  */
diff --git a/util/qsp.c b/util/qsp.c
index 5264c97342..904dcb7436 100644
--- a/util/qsp.c
+++ b/util/qsp.c
@@ -131,6 +131,7 @@ QemuRecMutexLockFunc qemu_rec_mutex_lock_func =3D qem=
u_rec_mutex_lock_impl;
 QemuRecMutexTrylockFunc qemu_rec_mutex_trylock_func =3D
     qemu_rec_mutex_trylock_impl;
 QemuCondWaitFunc qemu_cond_wait_func =3D qemu_cond_wait_impl;
+QemuCondTimedWaitFunc qemu_cond_timedwait_func =3D qemu_cond_timedwait_i=
mpl;
=20
 /*
  * It pays off to _not_ hash callsite->file; hashing a string is slow, a=
nd
@@ -412,6 +413,21 @@ qsp_cond_wait(QemuCond *cond, QemuMutex *mutex, cons=
t char *file, int line)
     qsp_entry_record(e, t1 - t0);
 }
=20
+static void
+qsp_cond_timedwait(QemuCond *cond, QemuMutex *mutex, int ms,
+                   const char *file, int line)
+{
+    QSPEntry *e;
+    int64_t t0, t1;
+
+    t0 =3D get_clock();
+    qemu_cond_timedwait_impl(cond, mutex, ms, file, line);
+    t1 =3D get_clock();
+
+    e =3D qsp_entry_get(cond, file, line, QSP_CONDVAR);
+    qsp_entry_record(e, t1 - t0);
+}
+
 bool qsp_is_enabled(void)
 {
     return atomic_read(&qemu_mutex_lock_func) =3D=3D qsp_mutex_lock;
@@ -425,6 +441,7 @@ void qsp_enable(void)
     atomic_set(&qemu_rec_mutex_lock_func, qsp_rec_mutex_lock);
     atomic_set(&qemu_rec_mutex_trylock_func, qsp_rec_mutex_trylock);
     atomic_set(&qemu_cond_wait_func, qsp_cond_wait);
+    atomic_set(&qemu_cond_timedwait_func, qsp_cond_timedwait);
 }
=20
 void qsp_disable(void)
@@ -435,6 +452,7 @@ void qsp_disable(void)
     atomic_set(&qemu_rec_mutex_lock_func, qemu_rec_mutex_lock_impl);
     atomic_set(&qemu_rec_mutex_trylock_func, qemu_rec_mutex_trylock_impl=
);
     atomic_set(&qemu_cond_wait_func, qemu_cond_wait_impl);
+    atomic_set(&qemu_cond_timedwait_func, qemu_cond_timedwait_impl);
 }
=20
 static gint qsp_tree_cmp(gconstpointer ap, gconstpointer bp, gpointer up=
)
--=20
2.22.0


