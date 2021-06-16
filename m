Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F23A8E8A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:47:22 +0200 (CEST)
Received: from localhost ([::1]:46770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKeH-0005Xg-Fa
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTs-0008SU-Ti
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:37 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTp-0005bz-PS
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:36 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 i11-20020a17090a2acbb029016f0cce7c3fso564202pjg.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v2Q2PinTVeLpRWK/d/K2BOFcE5jaaej7n/lf1RcDS40=;
 b=LGkk6uSfiF4MCnhFmtSFU0MzFPsQDe8MGWudr80w2QoSOLScfH+e3Oh6oHuiSbfzWj
 0dLxTg1BuliJOJpcxvBJcDeUffpVu6nqwUDbiboPiSioph5bDCPqWAnpsmhsskROyYAK
 YgWsjU/vjTarFv5+LFYN5hS8D9YoWX01vfzFe7r+zbeib/OINbsR/cLAr+Ls3b2FPngE
 F/GYj679lcPsVnwW6St8K3Z0Mx+8NZHGpX0oJAulLfVMZiLstp8aafMVe9DYESnVagqw
 Wz5EMlhSIEtwR9RDvo24uApEOqaG1/l90tnlV5cunhJV0h73KZ8RaEt5+71UAElY9Sl6
 J8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v2Q2PinTVeLpRWK/d/K2BOFcE5jaaej7n/lf1RcDS40=;
 b=mSqvoZ74toG/fOauT9GkjU9ml0UNNE+kN7ktZ18N4GPru8/Ap0tD7yxMrCzFAC56qy
 1HNKAZSuk4Y3k+NxFgV5IV1WNjMPYjvCCdFy7kRxDZoixvTTby9DEdJZKvwhW6VpCKRm
 PJJUws07SPI2zKPM7tIda0eTbj23D53+tH1eK7qMT59c75VoLHMF/VBv7uNPoeHvN8lP
 9PRhVFtpNEcmJHXhf6o+SmhqIP4wEfhWYgJ6ibDrGh9T6lB0Df0Z5KAcYHzS67ZvuATh
 59qlqcObQ44G/+jF41dxrQE8Ul75lOFUr0VrkWVF6vZXHBhbFuAqPZ1myya04WaA4B2N
 8PEg==
X-Gm-Message-State: AOAM531Ji7gCl7U2gXIePlNKDmJu9MVEtaLNOXRAWi9G6Iv9VDs+x/TV
 cPpmA+ucX5WZNIWaKVpmFK/HMHNLByVrqQ==
X-Google-Smtp-Source: ABdhPJwmNJzI6p51BowQtlvgqkFYpW20iBL8/pbBH97tYmhuWG8j2OMWJeDZASGY+XLmbrqclvIwcw==
X-Received: by 2002:a17:902:f283:b029:10d:e7f3:725 with SMTP id
 k3-20020a170902f283b029010de7f30725mr5210996plc.45.1623807392547; 
 Tue, 15 Jun 2021 18:36:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] util: Use real functions for thread-posix QemuRecMutex
Date: Tue, 15 Jun 2021 18:36:24 -0700
Message-Id: <20210616013629.1458790-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the declarations from thread-win32.h into thread.h
and remove the macro redirection from thread-posix.h.
This will be required by following cleanups.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-4-richard.henderson@linaro.org>
---
 include/qemu/thread-posix.h |  4 ----
 include/qemu/thread-win32.h |  6 ------
 include/qemu/thread.h       |  9 ++++++---
 util/qemu-thread-posix.c    | 20 ++++++++++++++++++++
 4 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index c903525062..cf8bc90468 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -5,10 +5,6 @@
 #include <semaphore.h>
 
 typedef QemuMutex QemuRecMutex;
-#define qemu_rec_mutex_destroy qemu_mutex_destroy
-#define qemu_rec_mutex_lock_impl    qemu_mutex_lock_impl
-#define qemu_rec_mutex_trylock_impl qemu_mutex_trylock_impl
-#define qemu_rec_mutex_unlock qemu_mutex_unlock
 
 struct QemuMutex {
     pthread_mutex_t lock;
diff --git a/include/qemu/thread-win32.h b/include/qemu/thread-win32.h
index d0a1a9597e..d95af4498f 100644
--- a/include/qemu/thread-win32.h
+++ b/include/qemu/thread-win32.h
@@ -18,12 +18,6 @@ struct QemuRecMutex {
     bool initialized;
 };
 
-void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
-void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
-int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file,
-                                int line);
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
-
 struct QemuCond {
     CONDITION_VARIABLE var;
     bool initialized;
diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 5435763184..2c0d85f3bc 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -28,6 +28,12 @@ int qemu_mutex_trylock_impl(QemuMutex *mutex, const char *file, const int line);
 void qemu_mutex_lock_impl(QemuMutex *mutex, const char *file, const int line);
 void qemu_mutex_unlock_impl(QemuMutex *mutex, const char *file, const int line);
 
+void qemu_rec_mutex_init(QemuRecMutex *mutex);
+void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
+void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
+int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line);
+void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
+
 typedef void (*QemuMutexLockFunc)(QemuMutex *m, const char *f, int l);
 typedef int (*QemuMutexTrylockFunc)(QemuMutex *m, const char *f, int l);
 typedef void (*QemuRecMutexLockFunc)(QemuRecMutex *m, const char *f, int l);
@@ -129,9 +135,6 @@ static inline int (qemu_rec_mutex_trylock)(QemuRecMutex *mutex)
     return qemu_rec_mutex_trylock(mutex);
 }
 
-/* Prototypes for other functions are in thread-posix.h/thread-win32.h.  */
-void qemu_rec_mutex_init(QemuRecMutex *mutex);
-
 void qemu_cond_init(QemuCond *cond);
 void qemu_cond_destroy(QemuCond *cond);
 
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index dcff5e7c5d..8e2b6653f5 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -124,6 +124,26 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex)
     mutex->initialized = true;
 }
 
+void qemu_rec_mutex_destroy(QemuRecMutex *mutex)
+{
+    qemu_mutex_destroy(mutex);
+}
+
+void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line)
+{
+    qemu_mutex_lock_impl(mutex, file, line);
+}
+
+int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
+{
+    return qemu_mutex_trylock_impl(mutex, file, line);
+}
+
+void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+{
+    qemu_mutex_unlock(mutex);
+}
+
 void qemu_cond_init(QemuCond *cond)
 {
     int err;
-- 
2.25.1


