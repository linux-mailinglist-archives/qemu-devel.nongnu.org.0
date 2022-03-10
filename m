Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF774D4746
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:51:07 +0100 (CET)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIG2-0002CC-CH
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:51:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9Y-0006cu-Ps; Thu, 10 Mar 2022 07:44:29 -0500
Received: from [2a00:1450:4864:20::42b] (port=40785
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9W-0005A7-Jd; Thu, 10 Mar 2022 07:44:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k24so7761594wrd.7;
 Thu, 10 Mar 2022 04:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ijSTqD5Qu/0QXONMXtyJFiFkOCsxqGeZGIi83ibgBoo=;
 b=msdrB/WCOQnFpWsAgTF++dzx6VMHpv/BpGPtzo7dBEePpvwwMAl+kaDdqbgHYjyvPx
 BEARzd0L2iCqmwt1kvdtcDfD6P0amoBGQ3mHZfxrHW6JdTVGcm6PcuWPJYiFKRBBT0pv
 o1NVcNc7h4sIlnoCHB7ANo9LIm8payRFJyVyS3RnHugD5cIGTdMcQgqPXNz/KHGHFjbX
 XIj/AbUvUQ8GXVm/jW+x+aGymMaxQ74Gtam2tMQ9JmW3nMAmqgi/oyWCarauQuGKxf6J
 tTg9qYbtkrCUiPMJ5XgIfGM1KPtZruUD9VbZizDNxwrax0V1QKtG40clkmw43XLd2En7
 Yv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ijSTqD5Qu/0QXONMXtyJFiFkOCsxqGeZGIi83ibgBoo=;
 b=U3kb0DSzXvJIb68sH9aLlUgHhHO8ccdf68wxuQ6oav/6UTDusLolv6GoD825ml12GP
 zgS6gYAQk2S8GaqveI7dbeyLgVxE/2xw7HRXORDVNv7KKOb0zfp2XLP4HzGUPM6LSUWN
 tx8qheDJDikMtudapSqvLKTqpIUNIBlE0Zyn9B/myfiiHWKdU/q4A++Fk1Qmj4o/n4hs
 kGgqJbF6oQQHYqf9jrp4xZoUfYSgHatj/18n3G3+N6SvliwSx3eOv5wpqdRuahWh0dMn
 TrB3yiwyKiaYt6QjnirFO6qvepbksFG7E3OuW2zhQgKwPn3E/faWZncSl1l0Bjerg+6U
 yV5w==
X-Gm-Message-State: AOAM532y31nF1r91fPm5tGPgOmJgIPqg+/3BlVSop45skeuDdi51RvPG
 LQcH0M/ANEzCl14ursAGfYfDYqfuC1U=
X-Google-Smtp-Source: ABdhPJz0wYzAAae7uD7pskTVFiXguwPKmd06UkqR5HMXORIQ/1nvn1e03kp2q2nYITgOkEnAQkk/lg==
X-Received: by 2002:adf:f389:0:b0:1ef:5f0f:cb83 with SMTP id
 m9-20020adff389000000b001ef5f0fcb83mr3394964wro.26.1646916260745; 
 Thu, 10 Mar 2022 04:44:20 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/35] coroutine: introduce QemuCoLockable
Date: Thu, 10 Mar 2022 13:43:41 +0100
Message-Id: <20220310124413.1102441-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for splitting "from coroutine" ("awaitable" in other
languages) and "not from coroutine" functions, remove the CoMutex case
from QemuLockable---thus making qemu_lockable_lock and qemu_lockable_unlock
"not awaitable".

To satisfy the qemu_co_queue_wait use case, introduce QemuCoLockable
which can be used for both QemuMutex (which will trivially never yield)
and CoMutex.  qemu_co_lockable_lock and qemu_co_lockable_unlock are
coroutine_fns.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/co-lockable.h  | 98 +++++++++++++++++++++++++++++++++++++
 include/qemu/coroutine.h    |  5 +-
 include/qemu/lockable.h     | 13 ++---
 include/qemu/typedefs.h     |  1 +
 tests/unit/test-coroutine.c | 10 ++--
 util/qemu-coroutine-lock.c  |  6 +--
 6 files changed, 114 insertions(+), 19 deletions(-)
 create mode 100644 include/qemu/co-lockable.h

diff --git a/include/qemu/co-lockable.h b/include/qemu/co-lockable.h
new file mode 100644
index 0000000000..09f4620017
--- /dev/null
+++ b/include/qemu/co-lockable.h
@@ -0,0 +1,98 @@
+/*
+ * Polymorphic locking functions (aka poor man templates)
+ *
+ * Copyright Red Hat, Inc. 2017, 2018
+ *
+ * Author: Paolo Bonzini <pbonzini@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_CO_LOCKABLE_H
+#define QEMU_CO_LOCKABLE_H
+
+#include "qemu/coroutine.h"
+#include "qemu/thread.h"
+
+typedef void coroutine_fn QemuCoLockUnlockFunc(void *);
+
+struct QemuCoLockable {
+    void *object;
+    QemuCoLockUnlockFunc *lock;
+    QemuCoLockUnlockFunc *unlock;
+};
+
+static inline __attribute__((__always_inline__)) QemuCoLockable *
+qemu_make_co_lockable(void *x, QemuCoLockable *lockable)
+{
+    /*
+     * We cannot test this in a macro, otherwise we get compiler
+     * warnings like "the address of 'm' will always evaluate as 'true'".
+     */
+    return x ? lockable : NULL;
+}
+
+static inline __attribute__((__always_inline__)) QemuCoLockable *
+qemu_null_co_lockable(void *x)
+{
+    if (x != NULL) {
+        qemu_build_not_reached();
+    }
+    return NULL;
+}
+
+/*
+ * In C, compound literals have the lifetime of an automatic variable.
+ * In C++ it would be different, but then C++ wouldn't need QemuCoLockable
+ * either...
+ */
+#define QMCL_OBJ_(x, name) (&(QemuCoLockable) {                         \
+        .object = (x),                                                  \
+        .lock = (QemuCoLockUnlockFunc *) qemu_ ## name ## _lock,        \
+        .unlock = (QemuCoLockUnlockFunc *) qemu_ ## name ## _unlock     \
+    })
+
+/**
+ * QEMU_MAKE_CO_LOCKABLE - Make a polymorphic QemuCoLockable
+ *
+ * @x: a lock object (currently one of QemuMutex, CoMutex).
+ *
+ * Returns a QemuCoLockable object that can be passed around
+ * to a function that can operate with locks of any kind, or
+ * NULL if @x is %NULL.
+ *
+ * Note the special case for void *, so that we may pass "NULL".
+ */
+#define QEMU_MAKE_CO_LOCKABLE(x)                                            \
+    _Generic((x), QemuCoLockable *: (x),                                    \
+             void *: qemu_null_co_lockable(x),                              \
+             QemuMutex *: qemu_make_co_lockable(x, QMCL_OBJ_(x, mutex)),    \
+             CoMutex *: qemu_make_co_lockable(x, QMCL_OBJ_(x, co_mutex)))   \
+
+/**
+ * QEMU_MAKE_CO_LOCKABLE_NONNULL - Make a polymorphic QemuCoLockable
+ *
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex,
+ *     CoMutex, QemuSpin).
+ *
+ * Returns a QemuCoLockable object that can be passed around
+ * to a function that can operate with locks of any kind.
+ */
+#define QEMU_MAKE_CO_LOCKABLE_NONNULL(x)                        \
+    _Generic((x), QemuCoLockable *: (x),                        \
+                  QemuMutex *: QMCL_OBJ_(x, mutex),             \
+                  CoMutex *: QMCL_OBJ_(x, co_mutex))
+
+static inline void coroutine_fn qemu_co_lockable_lock(QemuCoLockable *x)
+{
+    x->lock(x->object);
+}
+
+static inline void coroutine_fn qemu_co_lockable_unlock(QemuCoLockable *x)
+{
+    x->unlock(x->object);
+}
+
+#endif
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 666f3ba0e0..6f4596fc5b 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -204,8 +204,8 @@ void qemu_co_queue_init(CoQueue *queue);
  * locked again afterwards.
  */
 #define qemu_co_queue_wait(queue, lock) \
-    qemu_co_queue_wait_impl(queue, QEMU_MAKE_LOCKABLE(lock))
-void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock);
+    qemu_co_queue_wait_impl(queue, QEMU_MAKE_CO_LOCKABLE(lock))
+void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuCoLockable *lock);
 
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.
@@ -342,5 +342,6 @@ void qemu_coroutine_increase_pool_batch_size(unsigned int additional_pool_size);
 void qemu_coroutine_decrease_pool_batch_size(unsigned int additional_pool_size);
 
 #include "qemu/lockable.h"
+#include "qemu/co-lockable.h"
 
 #endif /* QEMU_COROUTINE_H */
diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
index 86db7cb04c..c860f81737 100644
--- a/include/qemu/lockable.h
+++ b/include/qemu/lockable.h
@@ -13,7 +13,6 @@
 #ifndef QEMU_LOCKABLE_H
 #define QEMU_LOCKABLE_H
 
-#include "qemu/coroutine.h"
 #include "qemu/thread.h"
 
 typedef void QemuLockUnlockFunc(void *);
@@ -57,8 +56,7 @@ qemu_null_lockable(void *x)
 /**
  * QEMU_MAKE_LOCKABLE - Make a polymorphic QemuLockable
  *
- * @x: a lock object (currently one of QemuMutex, QemuRecMutex,
- *     CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex, QemuSpin).
  *
  * Returns a QemuLockable object that can be passed around
  * to a function that can operate with locks of any kind, or
@@ -71,14 +69,12 @@ qemu_null_lockable(void *x)
              void *: qemu_null_lockable(x),                             \
              QemuMutex *: qemu_make_lockable(x, QML_OBJ_(x, mutex)),    \
              QemuRecMutex *: qemu_make_lockable(x, QML_OBJ_(x, rec_mutex)), \
-             CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),   \
              QemuSpin *: qemu_make_lockable(x, QML_OBJ_(x, spin)))
 
 /**
  * QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
  *
- * @x: a lock object (currently one of QemuMutex, QemuRecMutex,
- *     CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex, QemuSpin).
  *
  * Returns a QemuLockable object that can be passed around
  * to a function that can operate with locks of any kind.
@@ -87,7 +83,6 @@ qemu_null_lockable(void *x)
     _Generic((x), QemuLockable *: (x),                          \
                   QemuMutex *: QML_OBJ_(x, mutex),              \
                   QemuRecMutex *: QML_OBJ_(x, rec_mutex),       \
-                  CoMutex *: QML_OBJ_(x, co_mutex),             \
                   QemuSpin *: QML_OBJ_(x, spin))
 
 static inline void qemu_lockable_lock(QemuLockable *x)
@@ -124,7 +119,7 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(QemuLockable, qemu_lockable_auto_unlock)
 /**
  * WITH_QEMU_LOCK_GUARD - Lock a lock object for scope
  *
- * @x: a lock object (currently one of QemuMutex, CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex, QemuSpin).
  *
  * This macro defines a lock scope such that entering the scope takes the lock
  * and leaving the scope releases the lock.  Return statements are allowed
@@ -149,7 +144,7 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(QemuLockable, qemu_lockable_auto_unlock)
 /**
  * QEMU_LOCK_GUARD - Lock an object until the end of the scope
  *
- * @x: a lock object (currently one of QemuMutex, CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex, QemuSpin).
  *
  * This macro takes a lock until the end of the scope.  Return statements
  * release the lock.
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 42f4ceb701..144ce82b8b 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -103,6 +103,7 @@ typedef struct QBool QBool;
 typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
+typedef struct QemuCoLockable QemuCoLockable;
 typedef struct QEMUFile QEMUFile;
 typedef struct QemuLockable QemuLockable;
 typedef struct QemuMutex QemuMutex;
diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index aa77a3bcb3..82e22db070 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -213,13 +213,13 @@ static void coroutine_fn mutex_fn(void *opaque)
 
 static void coroutine_fn lockable_fn(void *opaque)
 {
-    QemuLockable *x = opaque;
-    qemu_lockable_lock(x);
+    QemuCoLockable *x = opaque;
+    qemu_co_lockable_lock(x);
     assert(!locked);
     locked = true;
     qemu_coroutine_yield();
     locked = false;
-    qemu_lockable_unlock(x);
+    qemu_co_lockable_unlock(x);
     done++;
 }
 
@@ -259,9 +259,9 @@ static void test_co_mutex_lockable(void)
     CoMutex *null_pointer = NULL;
 
     qemu_co_mutex_init(&m);
-    do_test_co_mutex(lockable_fn, QEMU_MAKE_LOCKABLE(&m));
+    do_test_co_mutex(lockable_fn, QEMU_MAKE_CO_LOCKABLE(&m));
 
-    g_assert(QEMU_MAKE_LOCKABLE(null_pointer) == NULL);
+    g_assert(QEMU_MAKE_CO_LOCKABLE(null_pointer) == NULL);
 }
 
 static CoRwlock rwlock;
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 2669403839..c29cb69f5e 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -39,13 +39,13 @@ void qemu_co_queue_init(CoQueue *queue)
     QSIMPLEQ_INIT(&queue->entries);
 }
 
-void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock)
+void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuCoLockable *lock)
 {
     Coroutine *self = qemu_coroutine_self();
     QSIMPLEQ_INSERT_TAIL(&queue->entries, self, co_queue_next);
 
     if (lock) {
-        qemu_lockable_unlock(lock);
+        qemu_co_lockable_unlock(lock);
     }
 
     /* There is no race condition here.  Other threads will call
@@ -63,7 +63,7 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock)
      * other cases of QemuLockable.
      */
     if (lock) {
-        qemu_lockable_lock(lock);
+        qemu_co_lockable_lock(lock);
     }
 }
 
-- 
2.35.1



