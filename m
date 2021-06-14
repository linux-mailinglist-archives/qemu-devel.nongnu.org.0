Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A6A3A7287
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:35:13 +0200 (CEST)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw6q-0007IN-2k
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3d-0006Mf-Nw
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:53 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3a-0007jg-1b
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:53 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g6so11824835pfq.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvdjZgFZFfm4oQoQRp06efUQQ5Zx0jR2BlqzQO6yoMI=;
 b=S0yy9HEFNzdHPoRHvObzR9/m7qb1FWkyNY9ZLHOVwKuAiik1F7l170aX+oy3f7inAH
 MhI764sbjUGieaqP+WR8BEqcicq0gwtJ8gDDXs4rYOLOvL3IfXkVD7uRewHue5bUuzpW
 r0EcJNcwz4zV8C0ZBtsdAR+6nuHU8JvmOMBdVVDSP50EMCfKX4vUFQSk1GbyReGxltrf
 0xbA1jirKL1DHStbvc3W4tVzEelLo5SKWzcOUcQ9s03tS7UFpOJjjhk2MDkrrcqeJjNq
 UdR4MryxP4VeM5ERg4h2H1cd56DR0X5zahc/ytNkuNXR/GNzJUbQiMGOR+OjACXkhTfr
 +IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvdjZgFZFfm4oQoQRp06efUQQ5Zx0jR2BlqzQO6yoMI=;
 b=SXX8RpLiQ3rTSeao+iqk1YIKupytTm0/GwkZEs8Rp4Vq3n4rjXqzlP6/JJa+CZSP7B
 jGr60Q1e+2ptRITWk1PQ4+3KjOTofFyot4jSlOhfJuJ5MYV2okEKD7Vt564ePYE+13C8
 ERu82y0dwMOfOrUiMwfLZcVapf4MfifJnDZ7Uu7Jg8t9Y4L8caxEcoRn3mjfksScxZuV
 3/4y/8k+ZF+jl7KcrREGzy5tHLb9RrKKHwX1fpqV+x9pwlnHt1Q7gaB51mKYhPu3pQq8
 L+J8RBRzZdT+8kDhYUz7BkC7CmGY0zojDI14emrSFM931OROzggPI790d7xL1xxHLft7
 lUCg==
X-Gm-Message-State: AOAM531AigN9kLmgtp4whN3I6CgyeReEgY6utr3wFIh4exmht829Qvjg
 6IlfKl+Ug2uT+BujS2ASuX1FuHRHafMA2g==
X-Google-Smtp-Source: ABdhPJzvB7mgRhXOjcCU7UA4XWOMI1NVWj9Kvx+BvNsxHWpzIWYwkOrYjxKgg7i7PmR0tjzyGUmWgQ==
X-Received: by 2002:a62:5547:0:b029:2ec:8f20:4e2 with SMTP id
 j68-20020a6255470000b02902ec8f2004e2mr1342049pfb.71.1623713508589; 
 Mon, 14 Jun 2021 16:31:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] include/qemu/lockable: Use _Generic instead of
 QEMU_GENERIC
Date: Mon, 14 Jun 2021 16:31:41 -0700
Message-Id: <20210614233143.1221879-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is both more and less complicated than our expansion
using __builtin_choose_expr and __builtin_types_compatible_p.

The expansion through QEMU_MAKE_LOCKABLE_ doesn't work because
we're not emumerating all of the types within the same _Generic,
which results in errors about unhandled cases.  We must also
handle void* explicitly, so that the NULL constant can be used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/lockable.h | 90 +++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 49 deletions(-)

diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
index b620023141..86db7cb04c 100644
--- a/include/qemu/lockable.h
+++ b/include/qemu/lockable.h
@@ -24,79 +24,71 @@ struct QemuLockable {
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
-    /* We cannot test this in a macro, otherwise we get compiler
+    /*
+     * We cannot test this in a macro, otherwise we get compiler
      * warnings like "the address of 'm' will always evaluate as 'true'".
      */
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
-
-/* In C, compound literals have the lifetime of an automatic variable.
+/*
+ * In C, compound literals have the lifetime of an automatic variable.
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
 
-/* QEMU_MAKE_LOCKABLE - Make a polymorphic QemuLockable
+/**
+ * QEMU_MAKE_LOCKABLE - Make a polymorphic QemuLockable
  *
- * @x: a lock object (currently one of QemuMutex, QemuRecMutex, CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex,
+ *     CoMutex, QemuSpin).
  *
  * Returns a QemuLockable object that can be passed around
  * to a function that can operate with locks of any kind, or
  * NULL if @x is %NULL.
- */
-#define QEMU_MAKE_LOCKABLE(x)                        \
-    QEMU_GENERIC(x,                                  \
-                 (QemuLockable *, (x)),              \
-                 qemu_make_lockable((x), QEMU_MAKE_LOCKABLE_(x)))
-
-/* QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
  *
- * @x: a lock object (currently one of QemuMutex, QemuRecMutex, CoMutex, QemuSpin).
+ * Note the special case for void *, so that we may pass "NULL".
+ */
+#define QEMU_MAKE_LOCKABLE(x)                                           \
+    _Generic((x), QemuLockable *: (x),                                  \
+             void *: qemu_null_lockable(x),                             \
+             QemuMutex *: qemu_make_lockable(x, QML_OBJ_(x, mutex)),    \
+             QemuRecMutex *: qemu_make_lockable(x, QML_OBJ_(x, rec_mutex)), \
+             CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),   \
+             QemuSpin *: qemu_make_lockable(x, QML_OBJ_(x, spin)))
+
+/**
+ * QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
+ *
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


