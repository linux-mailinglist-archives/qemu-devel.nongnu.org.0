Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED43A8E81
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:45:19 +0200 (CEST)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKcI-0000ld-On
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTt-0008VZ-Qp
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:37 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTr-0005d4-MG
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id v12so278804plo.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ubpKT84c0CDe5YC8xIT/jR9IicZ4W7L/Hmhh3sXO2Cc=;
 b=ILFtozxev9FMNR5wDAoFKHVkXjZRBp6i2Do8mXlIpcPmGX53Nbrdz8uH6RU7LZGU00
 FiXzViB36Wp0FrZ1cV4oxAjMa3mGFFZAOKPlcDl+S7LjKlNzqUJKTADL+DJ8m4ofJJlG
 Ugj/GqohX/8wSS+NeauEOggsZCyzt/nOWzawrrFmAO0t4hJMnvjbOaXJAUpHEh7Zpzdn
 1ZujnVSqiQ2VCScqTDFhPOtDg1gTl0UFg7O5V97vglDNL8zrINLT8o574oH21VYYSVw8
 HnAIH8Kik/67PxOfF7BkQkMzs6WRNMOH7nM8d78TYV1NHJlXuvAEoau/Yv/5k8P13VPX
 1spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ubpKT84c0CDe5YC8xIT/jR9IicZ4W7L/Hmhh3sXO2Cc=;
 b=CYZblGARvr257QWjjnmass2ZxxPOJNfk2384dIXT6cBdAgLmDVVuVAPPx0C00tvp/B
 Hisczx8xFF0V4EIfW09rEOpAbhkGbazyhRmvAtyMv6JUfRCGPrav5whRNOLaHZ1W5hJR
 TzYx8rrzJ7fA9umPXZhebo1mxtNbZH4r38KqqUfHKI/8rrLFMwNpPLQE71ypMjWmVlI1
 2usbm39WIxQp3Ltb0KTkCbhg4AuIKWfC+hA23he6BboExWeTHG8LN/crfAu+n2PmCaj8
 Hty+sSlwk5HaOSDdyfVyaY5jV9gdPC8y+DHruZq6gX4AMcD01iJ3f5giSFST/nqfyZfc
 7byw==
X-Gm-Message-State: AOAM533+kbclZTwee1ua5avML9fe0x0LXXdquMNwvr2nbZBQeJhTQC+w
 6o9fHlqT0KdElU8N9wkB1gC4S2TJaied5g==
X-Google-Smtp-Source: ABdhPJwvwnMED2JB8nvuRskfK8TzlIb8QD2aZq6Q917MHrMbFpMawtb/7d4eBO7z9f8CvFRxAAiKTg==
X-Received: by 2002:a17:902:a70c:b029:118:7b47:e5bf with SMTP id
 w12-20020a170902a70cb02901187b47e5bfmr6444952plq.9.1623807394346; 
 Tue, 15 Jun 2021 18:36:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] include/qemu/lockable: Use _Generic instead of QEMU_GENERIC
Date: Tue, 15 Jun 2021 18:36:27 -0700
Message-Id: <20210616013629.1458790-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is both more and less complicated than our expansion
using __builtin_choose_expr and __builtin_types_compatible_p.

The expansion through QEMU_MAKE_LOCKABLE_ doesn't work because
we're not emumerating all of the types within the same _Generic,
which results in errors about unhandled cases.  We must also
handle void* explicitly, so that the NULL constant can be used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-7-richard.henderson@linaro.org>
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


