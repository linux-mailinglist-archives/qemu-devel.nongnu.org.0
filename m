Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF04D7EFB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:48:57 +0100 (CET)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThJw-0006G6-Lh
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:48:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3t-00088M-LL; Mon, 14 Mar 2022 05:32:23 -0400
Received: from [2a00:1450:4864:20::32f] (port=44891
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3r-00088O-Js; Mon, 14 Mar 2022 05:32:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so9212287wmb.3; 
 Mon, 14 Mar 2022 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ExEH4xtYaoZGau968X+DeYwuLSF3XzIknX+VU1gzoqc=;
 b=dYt/jm22WE+k/jM6ojixaBIheLqxpVtZ/AEdoKOerepmGm3LXo/atnhPkZQMjXDN46
 8c9iFYtjMVqUwxv/PS/WgHMXhdZ41X7kla9jQLx7NfHfEOSKXMu/sTaDKvT1R5fU1vPH
 TybINLr+yik8+16X+b3hXweXCx6JEDJnK0lwYWwN1xX8vSn+jlsiHaA0crLcaxGTAZa9
 0ZPFF73GDW4dpR51x4mg3yU3YJCDmwuJbJbhY7hFkIe/oiWBt5Ku5I1+omznRkPcgs1A
 ktiQiKupsIJ894Pkh1ovqiSYRXSembyWJ35K6CrvP9hILbNCM7/NFoYnjYx1Q73G0KW2
 bJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ExEH4xtYaoZGau968X+DeYwuLSF3XzIknX+VU1gzoqc=;
 b=e+9QBZtwL1uyJRDC0uSzSNKF2aWrFOIKCi5wVfawD6kOxuY49m5TWs7l3FR1fnXNCF
 2CDL7ll/4f0pBr/TTmb1NWYkQXPHHdjYjUBSw0ybTjMmreQI4tjHo8t+r+S+VClMhoub
 Nk6d5sV+UdLs/elD86/ux4VPEtaEzm8A8QYOmIIofGEt+SlD/L168I6sDpLnuHDTnee+
 KeSmZYVuT/jnZK+kPDW/vhYq9R6IwezAxfHKPBgVMfouzcAoCjkwi3SQlI/6LP6E3zun
 n8KHGeiqQdRqAphO5VixAJcVHkhRm1otFbgmw2Ahvpdf9996bLWkutCi+GQRWVUxfNm+
 xrJw==
X-Gm-Message-State: AOAM533bpdbpggPoG8w7jb3VxbsNuWtNbWc0IoSZuiT/r+XLxLuVL4uC
 nLpPSN38IE1DOWEg6fWwg1n3zJzZZGI=
X-Google-Smtp-Source: ABdhPJw2xDuQBqU/+PV5UvxA79cQzwQ/XamOV+xtqJOojK/TAEN1nmTdQT+KI5nInTK41WQl+BZh0Q==
X-Received: by 2002:a05:600c:508:b0:389:8dfd:7994 with SMTP id
 i8-20020a05600c050800b003898dfd7994mr17001003wmc.115.1647250337707; 
 Mon, 14 Mar 2022 02:32:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 15/16] port QemuCoLockable to C++ coroutines
Date: Mon, 14 Mar 2022 10:32:02 +0100
Message-Id: <20220314093203.1420404-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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

Convert "T coroutine_fn" annotations to the new type CoroutineFn<T>,
and add co_await as needed.

_Generic is replaced by an overloaded constructor.  C++ also does
not like & on a temporary, so that is replaced by a function
qemu_make_co_lockable_nonnull that hides it from the compiler.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/co-lockable.h | 111 ++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 58 deletions(-)

diff --git a/include/qemu/co-lockable.h b/include/qemu/co-lockable.h
index 09f4620017..13e3cc7a69 100644
--- a/include/qemu/co-lockable.h
+++ b/include/qemu/co-lockable.h
@@ -16,83 +16,78 @@
 #include "qemu/coroutine.h"
 #include "qemu/thread.h"
 
-typedef void coroutine_fn QemuCoLockUnlockFunc(void *);
+typedef CoroutineFn<void> QemuCoLockUnlockFunc(void *);
+
+extern CoroutineFn<void> qemu_mutex_co_lock(QemuMutex *m);
+extern CoroutineFn<void> qemu_mutex_co_unlock(QemuMutex *m);
 
 struct QemuCoLockable {
     void *object;
     QemuCoLockUnlockFunc *lock;
     QemuCoLockUnlockFunc *unlock;
+
+    QemuCoLockable() :
+        object{NULL},
+        lock{(QemuCoLockUnlockFunc *) NULL},
+        unlock{(QemuCoLockUnlockFunc *) NULL} {}
+    QemuCoLockable(QemuMutex *x) :
+        object{x},
+        lock{(QemuCoLockUnlockFunc *) qemu_mutex_co_lock},
+        unlock{(QemuCoLockUnlockFunc *) qemu_mutex_co_unlock} {}
+    QemuCoLockable(CoMutex *x) :
+        object{x},
+        lock{(QemuCoLockUnlockFunc *) qemu_co_mutex_lock},
+        unlock{(QemuCoLockUnlockFunc *) qemu_co_mutex_unlock} {}
 };
 
-static inline __attribute__((__always_inline__)) QemuCoLockable *
-qemu_make_co_lockable(void *x, QemuCoLockable *lockable)
+template<typename T>
+static inline QemuCoLockable qcml_obj_nonnull_(T *x)
 {
-    /*
-     * We cannot test this in a macro, otherwise we get compiler
-     * warnings like "the address of 'm' will always evaluate as 'true'".
-     */
-    return x ? lockable : NULL;
+    return QemuCoLockable{x};
 }
 
-static inline __attribute__((__always_inline__)) QemuCoLockable *
-qemu_null_co_lockable(void *x)
+static inline QemuCoLockable const *qemu_make_co_lockable_nonnull(QemuCoLockable const &x)
 {
+    return &x;
+}
+
+template<typename T>
+static inline QemuCoLockable qcml_obj_(T *x)
+{
+    return QemuCoLockable{x};
+}
+extern void build_not_reached();
+
+template<> inline
+QemuCoLockable qcml_obj_(void *x)
+{
+#ifdef __OPTIMIZE__
     if (x != NULL) {
-        qemu_build_not_reached();
+        build_not_reached();
     }
-    return NULL;
+#endif
+    return QemuCoLockable{};
 }
 
-/*
- * In C, compound literals have the lifetime of an automatic variable.
- * In C++ it would be different, but then C++ wouldn't need QemuCoLockable
- * either...
- */
-#define QMCL_OBJ_(x, name) (&(QemuCoLockable) {                         \
-        .object = (x),                                                  \
-        .lock = (QemuCoLockUnlockFunc *) qemu_ ## name ## _lock,        \
-        .unlock = (QemuCoLockUnlockFunc *) qemu_ ## name ## _unlock     \
-    })
-
-/**
- * QEMU_MAKE_CO_LOCKABLE - Make a polymorphic QemuCoLockable
- *
- * @x: a lock object (currently one of QemuMutex, CoMutex).
- *
- * Returns a QemuCoLockable object that can be passed around
- * to a function that can operate with locks of any kind, or
- * NULL if @x is %NULL.
- *
- * Note the speci case for void *, so that we may pass "NULL".
- */
-#define QEMU_MAKE_CO_LOCKABLE(x)                                            \
-    _Generic((x), QemuCoLockable *: (x),                                    \
-             void *: qemu_null_co_lockable(x),                              \
-             QemuMutex *: qemu_make_co_lockable(x, QMCL_OBJ_(x, mutex)),    \
-             CoMutex *: qemu_make_co_lockable(x, QMCL_OBJ_(x, co_mutex)))   \
-
-/**
- * QEMU_MAKE_CO_LOCKABLE_NONNULL - Make a polymorphic QemuCoLockable
- *
- * @x: a lock object (currently one of QemuMutex, QemuRecMutex,
- *     CoMutex, QemuSpin).
- *
- * Returns a QemuCoLockable object that can be passed around
- * to a function that can operate with locks of any kind.
- */
-#define QEMU_MAKE_CO_LOCKABLE_NONNULL(x)                        \
-    _Generic((x), QemuCoLockable *: (x),                        \
-                  QemuMutex *: QMCL_OBJ_(x, mutex),             \
-                  CoMutex *: QMCL_OBJ_(x, co_mutex))
-
-static inline void coroutine_fn qemu_co_lockable_lock(QemuCoLockable *x)
+static inline QemuCoLockable const *qemu_make_co_lockable(QemuCoLockable const &x)
 {
-    x->lock(x->object);
+    if (x.object)
+        return &x;
+    else
+        return NULL;
 }
 
-static inline void coroutine_fn qemu_co_lockable_unlock(QemuCoLockable *x)
+#define QEMU_MAKE_CO_LOCKABLE_NONNULL(x) qemu_make_co_lockable_nonnull(qcml_obj_nonnull_(x))
+#define QEMU_MAKE_CO_LOCKABLE(x)         qemu_make_co_lockable(qcml_obj_(x))
+
+static inline CoroutineFn<void> qemu_co_lockable_lock(const QemuCoLockable *x)
 {
-    x->unlock(x->object);
+    co_await x->lock(x->object);
+}
+
+static inline CoroutineFn<void> qemu_co_lockable_unlock(const QemuCoLockable *x)
+{
+    co_await x->unlock(x->object);
 }
 
 #endif
-- 
2.35.1



