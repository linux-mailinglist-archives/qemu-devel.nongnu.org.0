Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B264D7ED3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:40:30 +0100 (CET)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThBl-0001bA-U1
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:40:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3l-0007tK-6T; Mon, 14 Mar 2022 05:32:13 -0400
Received: from [2a00:1450:4864:20::429] (port=46746
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3i-00083I-TH; Mon, 14 Mar 2022 05:32:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id x15so22778623wru.13;
 Mon, 14 Mar 2022 02:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aqoe2xQDIdZ8ROwcxmZY9KS0X3tG0W3SUg8WnOAtbho=;
 b=f6/Ss32hx4OlbwU9mrX9Kv54XF5t51jJ81jfE5/wFYBUrgnHXA05yvRvx54BzIMUpE
 Oz4ByyRRhOwx9XyfY9HQA3WlsROCvxQQUniaV900EUUK7V3D7VXjvXnL0FSmxjHZezBf
 AzkCd+Z7OMfVtRKpcswdfGGXjTERnA43s/EZW2UZgQOypRHsi23Xd0AO8qKQZVY7yE/J
 HCaoJz9pDU4b/gH9LxZPoZemjuLBsNTp77+sBi0c/V/SPaXtR6l0axNiCMwXniUVBzJZ
 G+Cuerl27vsqvngzdQh6MuRjPn95zu5J0SOWJZVe+nVb3nWw9SsA6e5NmNBtosP1jI0F
 /Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aqoe2xQDIdZ8ROwcxmZY9KS0X3tG0W3SUg8WnOAtbho=;
 b=5r69fg3ZSHvjCevncEEqLseVm4EBkiMRXjopmdzsv/2DskbOURg1suDQ49dn3zckE2
 Pzx7aHUSVKA/1x92FHj1NlZ+gf/dZCYUB+jHpi51TIOnHkyYw/Y/733hkuV0bGREHdH4
 wCzxt7x6LY8xAI6A4S2Oot/yI4wVyyB8ioFCImERyljpBzBSWi0LPNs0BBm5mUnExtUn
 8y5aMBExk8aBmb2hP8qFtqfJt1fnTW8slphGHT2ZYqFxeEuS5pNuH+MHFTbHXqheMQU5
 WFWWb0RT+LSRBhq+qpt21MdPLPWVoiZUkM+7wxoMNdprcl+9GHnP8F0MjzYXlA9xghoy
 lAyw==
X-Gm-Message-State: AOAM531PC5IROfNkeMasMTJ8NSc75Je59vtydIQ4tXd3Uj3aIgV6hYPr
 6epssQwf9K6rSOg49KCrH8AJWFskFYU=
X-Google-Smtp-Source: ABdhPJzbI2ood/RnaRwfUUmU5Q5KvsAYF23PsKh/pbnj2UfeKs7Y/xpaPpthQgGE56VKY4/dVF9hDw==
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr16406228wrm.521.1647250328440; 
 Mon, 14 Mar 2022 02:32:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 04/16] coroutine: introduce QemuCoLockable
Date: Mon, 14 Mar 2022 10:31:51 +0100
Message-Id: <20220314093203.1420404-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
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
+ * Note the speci case for void *, so that we may pass "NULL".
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
index 490fb32891..3f12b53a31 100644
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



