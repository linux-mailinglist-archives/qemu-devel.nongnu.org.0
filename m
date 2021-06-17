Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4B3AB0ED
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:06:49 +0200 (CEST)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltovA-00085X-Gq
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNf-0003Fr-00
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:11 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNc-0006RS-8e
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:09 -0400
Received: by mail-ej1-x634.google.com with SMTP id g20so8826890ejt.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xNQYL3e/qOseQC5VO9f224envW8cvgsN2R0SpAwLVbk=;
 b=OjAj1GuOTJ6Yp1FgleT7b4Jeq69OVbocUmu4HzW4sVfhNszU4p4KT1R+86QaiYMclw
 T9qUe4nStfUjMwExmPrgc59Gy2gw+iSI9gVhdHVKkpBCPSX26wrnmheYCH8836DUSQTZ
 hnEfwA8jD0RuV5yS1C9XLeGa0dCGUWSQ9GkgG5uqVO32AT1su4Xzgu74IXjYH/QJD7jr
 Y6LIxLMHIJWFywxv030oyX86t06szGbtTpvSXf/DFSKlFzlD+crjLDcpNSeyj1JjVKap
 UmIg7yvxSFFDZ/tvUclHAI67omwywswlGP8PSmQgXFI3zdfxDcGKN/Rc0CXkL60DsiaU
 Ka6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xNQYL3e/qOseQC5VO9f224envW8cvgsN2R0SpAwLVbk=;
 b=tg776WiErbHjiuQVghWcT9xqrhsilYyIoiOPpaDUhzoeVzdqJVZeqV6m7KHPNTZV7C
 YyIgmSKNGRa0gDZ6CHVTDnmcAfMimnH2lUzBaLvY33HhvzZh13iZqMtSjwixuzRbD3sQ
 YxgTLPu6ngDlDz9U1N0rzCtZ4/l7j7jm2BQ14676mmWMoYq1uO9mnzxoqX5NcvZfd9N/
 JFtRHeNXK/5JstgxuTSA5d1wOebV/e/zKEj13Gx88XSn6AM/jAQwackMZ8G8DmONJpRz
 fedNYY2i7yCOxugRdA9/PH9S6NEKD56rQV6oMVtosgW+0vz6tMAXdvGrCvuWihSoDic/
 baBw==
X-Gm-Message-State: AOAM531PqCZlaDjBqi37vdxCg5wQueNJ2wsSiS6R/V/Bs1DdsnZSLeeU
 Cs7/YkV7kvWOrJMo9Lb17HoOqy6Q/GE=
X-Google-Smtp-Source: ABdhPJx3bIFzZ9Ts20mZSRraK73qFOIAsldEmyyXUav8SkceSqwgzHkj5ygfmzQ0J9eBTt/dtknv1A==
X-Received: by 2002:a17:906:eb17:: with SMTP id
 mb23mr4269825ejb.239.1623922326921; 
 Thu, 17 Jun 2021 02:32:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/45] include/qemu/lockable: Use _Generic instead of
 QEMU_GENERIC
Date: Thu, 17 Jun 2021 11:31:32 +0200
Message-Id: <20210617093134.900014-44-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is both more and less complicated than our expansion
using __builtin_choose_expr and __builtin_types_compatible_p.

The expansion through QEMU_MAKE_LOCKABLE_ doesn't work because
we're not emumerating all of the types within the same _Generic,
which results in errors about unhandled cases.  We must also
handle void* explicitly, so that the NULL constant can be used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-7-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.31.1



