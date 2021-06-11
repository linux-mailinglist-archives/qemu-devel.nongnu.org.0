Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CCB3A4B4D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:41:39 +0200 (CEST)
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqmQ-0008Q5-08
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqez-0004LS-8m
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:34:01 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqev-0006RF-5c
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:57 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j12so3661017pgh.7
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L6RrcWlgVuAFENDyacE0KjBTR0pJOEPr/5/f08fEfIA=;
 b=rUKl9EEyXQcfIHb8PvbvYX2P7HOn+W4/XI6f1tQo71ltRby3NKZ9xHWB8CJ5NbNOCq
 MxUfvQHCI/J039jUSt5Q0EfrDb4URCpKwqu8tHYV+7ErWlOamYdVozarm6v2/SSdVCbq
 +LXNDf/8hPnT9tKdbDqp/UYugZB37dZ8FhVSP0B2ANvnTUxhsgO6Irv05TCDdGBRJ8Qy
 IfAok3VPspOkdM9ft+GppkpdCgjOONQ1RoUhJh4sFHLkKwVdoa3gorqyReOaRJ9dFKD0
 U/sqwxTk3Cq4Q7PPBeUswF5Kd3XbIBG5uKfvz4TAZPOLXazwKeZ5CMowqKkyk4Bgx18H
 5e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L6RrcWlgVuAFENDyacE0KjBTR0pJOEPr/5/f08fEfIA=;
 b=Fkb0TSUJzBW5GQKdJQ4xJZ48BQHMNGZs4szMI096126OUeU3hAILvFAXxo9cxlsQ5t
 /8A1XkRHEQsBcHG5xwnte+pi4ELvZwZQAnOg0ANFPshuv0ZlNlEuvuF7hbyfOchswOU7
 iXsQt32lbj6mdKwdVfyWX/K+IBRHpG7G7cnSXEUrs12XQ9zWCnztSvSRdirR0BALvgZv
 A5YtU0e53TmbCEHH9yiQ0XFbmh/bWPCRrHlGLOhzuIBzUw+uGmu/dKEYzJ08lqNLOdcx
 1h+35tGTKI9znu2i1YJIihiHNziSabjqovHDO4elYgPC04GDZrL8pQdJANYqioXPHXly
 VOVw==
X-Gm-Message-State: AOAM531V5r41u0W7AeQpoe4qJMzwKEWEywk2sOSRxXuVwX73z4+Qjt+s
 nUK3hcxmsoTT4eIFUY7lBKQLCjUoIAUw3w==
X-Google-Smtp-Source: ABdhPJwExFhFWpnyfOLoYSy4XNCWJ+mglF9xEfC4rfmRoABBfMUrtlOhM6fWs+52ArDZEjPg0LQqCA==
X-Received: by 2002:aa7:8119:0:b029:2b5:7e51:274b with SMTP id
 b25-20020aa781190000b02902b57e51274bmr10651672pfi.32.1623454431728; 
 Fri, 11 Jun 2021 16:33:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] include/qemu/lockable: Use _Generic instead of
 QEMU_GENERIC
Date: Fri, 11 Jun 2021 16:33:45 -0700
Message-Id: <20210611233347.653129-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
References: <20210611233347.653129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

This is both more and less complicated than our expansion
using __builtin_choose_expr and __builtin_types_compatible_p.

The expansion through QEMU_MAKE_LOCKABLE_ doesn't work because
we're not emumerating all of the types within the same _Generic,
which results in errors about unhandled cases.  We must also
handle void* explicitly, so that the NULL constant can be used.

Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
---
 include/qemu/lockable.h | 85 +++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 42 deletions(-)

diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
index b620023141..9118d54200 100644
--- a/include/qemu/lockable.h
+++ b/include/qemu/lockable.h
@@ -24,19 +24,6 @@ struct QemuLockable {
     QemuLockUnlockFunc *unlock;
 };
 
-/* This function gives an error if an invalid, non-NULL pointer type is passed
- * to QEMU_MAKE_LOCKABLE.  For optimized builds, we can rely on dead-code elimination
- * from the compiler, and give the errors already at link time.
- */
-#if defined(__OPTIMIZE__) && !defined(__SANITIZE_ADDRESS__)
-void unknown_lock_type(void *);
-#else
-static inline void unknown_lock_type(void *unused)
-{
-    abort();
-}
-#endif
-
 static inline __attribute__((__always_inline__)) QemuLockable *
 qemu_make_lockable(void *x, QemuLockable *lockable)
 {
@@ -46,57 +33,71 @@ qemu_make_lockable(void *x, QemuLockable *lockable)
     return x ? lockable : NULL;
 }
 
-/* Auxiliary macros to simplify QEMU_MAKE_LOCABLE.  */
-#define QEMU_LOCK_FUNC(x) ((QemuLockUnlockFunc *)    \
-    QEMU_GENERIC(x,                                  \
-                 (QemuMutex *, qemu_mutex_lock),     \
-                 (QemuRecMutex *, qemu_rec_mutex_lock), \
-                 (CoMutex *, qemu_co_mutex_lock),    \
-                 (QemuSpin *, qemu_spin_lock),       \
-                 unknown_lock_type))
+static inline __attribute__((__always_inline__)) QemuLockable *
+qemu_null_lockable(void *x)
+{
+    if (x != NULL) {
+        qemu_build_not_reached();
+    }
+    return NULL;
+}
 
-#define QEMU_UNLOCK_FUNC(x) ((QemuLockUnlockFunc *)  \
-    QEMU_GENERIC(x,                                  \
-                 (QemuMutex *, qemu_mutex_unlock),   \
-                 (QemuRecMutex *, qemu_rec_mutex_unlock), \
-                 (CoMutex *, qemu_co_mutex_unlock),  \
-                 (QemuSpin *, qemu_spin_unlock),     \
-                 unknown_lock_type))
+/* Auxiliary macros to simplify QEMU_MAKE_LOCABLE.  */
+#define QEMU_LOCK_FUNC(x) ((QemuLockUnlockFunc *)      \
+    _Generic((x), QemuMutex *: qemu_mutex_lock,        \
+                  QemuRecMutex *: qemu_rec_mutex_lock, \
+                  CoMutex *: qemu_co_mutex_lock,       \
+                  QemuSpin *: qemu_spin_lock))
+
+#define QEMU_UNLOCK_FUNC(x) ((QemuLockUnlockFunc *)      \
+    _Generic((x), QemuMutex *: qemu_mutex_unlock,        \
+                  QemuRecMutex *: qemu_rec_mutex_unlock, \
+                  CoMutex *: qemu_co_mutex_unlock,       \
+                  QemuSpin *: qemu_spin_unlock))
 
 /* In C, compound literals have the lifetime of an automatic variable.
  * In C++ it would be different, but then C++ wouldn't need QemuLockable
  * either...
  */
-#define QEMU_MAKE_LOCKABLE_(x) (&(QemuLockable) {     \
-        .object = (x),                               \
-        .lock = QEMU_LOCK_FUNC(x),                   \
-        .unlock = QEMU_UNLOCK_FUNC(x),               \
+#define QML_OBJ_(x, name) (&(QemuLockable) {                            \
+        .object = (x),                                                  \
+        .lock = (QemuLockUnlockFunc *) qemu_ ## name ## _lock,          \
+        .unlock = (QemuLockUnlockFunc *) qemu_ ## name ## _unlock       \
     })
 
 /* QEMU_MAKE_LOCKABLE - Make a polymorphic QemuLockable
  *
- * @x: a lock object (currently one of QemuMutex, QemuRecMutex, CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex,
+ *     CoMutex, QemuSpin).
  *
  * Returns a QemuLockable object that can be passed around
  * to a function that can operate with locks of any kind, or
  * NULL if @x is %NULL.
+ *
+ * Note the special case for void *, so that we may pass "NULL".
  */
-#define QEMU_MAKE_LOCKABLE(x)                        \
-    QEMU_GENERIC(x,                                  \
-                 (QemuLockable *, (x)),              \
-                 qemu_make_lockable((x), QEMU_MAKE_LOCKABLE_(x)))
+#define QEMU_MAKE_LOCKABLE(x)                                           \
+    _Generic((x), QemuLockable *: (x),                                  \
+             void *: qemu_null_lockable(x),                             \
+             QemuMutex *: qemu_make_lockable(x, QML_OBJ_(x, mutex)),    \
+             QemuRecMutex *: qemu_make_lockable(x, QML_OBJ_(x, rec_mutex)), \
+             CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),   \
+             QemuSpin *: qemu_make_lockable(x, QML_OBJ_(x, spin)))
 
 /* QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
  *
- * @x: a lock object (currently one of QemuMutex, QemuRecMutex, CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex,
+ *     CoMutex, QemuSpin).
  *
  * Returns a QemuLockable object that can be passed around
  * to a function that can operate with locks of any kind.
  */
-#define QEMU_MAKE_LOCKABLE_NONNULL(x)                \
-    QEMU_GENERIC(x,                                  \
-                 (QemuLockable *, (x)),              \
-                 QEMU_MAKE_LOCKABLE_(x))
+#define QEMU_MAKE_LOCKABLE_NONNULL(x)                           \
+    _Generic((x), QemuLockable *: (x),                          \
+                  QemuMutex *: QML_OBJ_(x, mutex),              \
+                  QemuRecMutex *: QML_OBJ_(x, rec_mutex),       \
+                  CoMutex *: QML_OBJ_(x, co_mutex),             \
+                  QemuSpin *: QML_OBJ_(x, spin))
 
 static inline void qemu_lockable_lock(QemuLockable *x)
 {
-- 
2.25.1


