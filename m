Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C463A8E7E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:45:01 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKc0-0000Ku-TT
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTs-0008RT-DR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTq-0005c9-KU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:36 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso2775284pjz.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cCqC17CoPwFaX7KxGxIz9kq2bVuynqUQa02RlRXcupY=;
 b=xAJbAXqKg7S+v++P0gxg5u5wPPlL+G3Tz4FCHy5B7XauHJoClw9Iwxr0FUMECUpIis
 h+Qqao07B+iYTNRLgg21dA2Vr1MKqzDz/epmA2Zn6mpRRLXzJlDHkCn+s/KdhmQtmAxf
 PzSvTE67b6U55avin/xa9AyPmAhm1wfrSMYRe5vWCr0kgUOvqsriPKqhDEPNNNwQhyqg
 vsv3R0adxyeUxkgNIjA03dvags8ahi0oBl3jWBFX0TeE3z05Rdl3VrUv2FqOK4FAfuho
 hwFN05fbVyrMjxw5K3Z6i0x0P4CgyW+mqOj4Zmq/EI3/ZBlA1Xhl5Px+EyBRpficbdle
 YxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cCqC17CoPwFaX7KxGxIz9kq2bVuynqUQa02RlRXcupY=;
 b=jKrRi86ztziaT3tUdXbS9XOUEL/C+I1VQHsSankodniCIFkRoPnmZO/5mslgt0bVo/
 acv5REd/ibW/8gVWSw373lBMHiuYKgrqGfDMD4q7in+dfyeB94AwH1eeviHleKSflHy0
 NMi1LFr0UimCz9ttPYBp4bkFY2Bbf4fHFW7nSWdZvUb29e4Dpy8KflLGYLIaIA7XaK1X
 RVF2WeyCP5y5jNETizczFciAS74lPiuuRLVQ9VErt47/hxLVBaHji+52MnI/LbkcLk6p
 8ljcaZIAY118aqyKKFpFvPyro2GdGBI40LpjckqGWLPboyBtCOuuAbVXMyJgau8jLIq1
 O+Tw==
X-Gm-Message-State: AOAM533uQEUVx91SVyiohmfbiaI7qBHjsgonwRjeu2CEYToLvWqdo5Ip
 xEdwHQ2oguKYeWoeIeUXNQA7RKZcTUQI0w==
X-Google-Smtp-Source: ABdhPJyxOjOe+leImQ7Y1CQghWVP7xX4IkTQ5VPmrzSP6tKP0J4m2Hy5KQ5tAYqPLnkgkz1WaQ463Q==
X-Received: by 2002:a17:903:2308:b029:110:41c3:70b0 with SMTP id
 d8-20020a1709032308b029011041c370b0mr6874646plh.32.1623807393149; 
 Tue, 15 Jun 2021 18:36:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] util: Pass file+line to qemu_rec_mutex_unlock_impl
Date: Tue, 15 Jun 2021 18:36:25 -0700
Message-Id: <20210616013629.1458790-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create macros for file+line expansion in qemu_rec_mutex_unlock
like we have for qemu_mutex_unlock.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-5-richard.henderson@linaro.org>
---
 include/qemu/thread.h    | 10 +++++++++-
 util/qemu-thread-posix.c |  4 ++--
 util/qemu-thread-win32.c |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 2c0d85f3bc..460568d67d 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -32,7 +32,7 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex);
 void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
 void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
 int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line);
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line);
 
 typedef void (*QemuMutexLockFunc)(QemuMutex *m, const char *f, int l);
 typedef int (*QemuMutexTrylockFunc)(QemuMutex *m, const char *f, int l);
@@ -110,6 +110,9 @@ extern QemuCondTimedWaitFunc qemu_cond_timedwait_func;
 #define qemu_mutex_unlock(mutex) \
         qemu_mutex_unlock_impl(mutex, __FILE__, __LINE__)
 
+#define qemu_rec_mutex_unlock(mutex) \
+        qemu_rec_mutex_unlock_impl(mutex, __FILE__, __LINE__)
+
 static inline void (qemu_mutex_lock)(QemuMutex *mutex)
 {
     qemu_mutex_lock(mutex);
@@ -135,6 +138,11 @@ static inline int (qemu_rec_mutex_trylock)(QemuRecMutex *mutex)
     return qemu_rec_mutex_trylock(mutex);
 }
 
+static inline void (qemu_rec_mutex_unlock)(QemuRecMutex *mutex)
+{
+    qemu_rec_mutex_unlock(mutex);
+}
+
 void qemu_cond_init(QemuCond *cond);
 void qemu_cond_destroy(QemuCond *cond);
 
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 8e2b6653f5..d990826ed8 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -139,9 +139,9 @@ int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
     return qemu_mutex_trylock_impl(mutex, file, line);
 }
 
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    qemu_mutex_unlock(mutex);
+    qemu_mutex_unlock_impl(mutex, file, line);
 }
 
 void qemu_cond_init(QemuCond *cond)
diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index cb5aa2018c..52eb19f351 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -105,7 +105,7 @@ int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
     return !TryEnterCriticalSection(&mutex->lock);
 }
 
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
     assert(mutex->initialized);
     LeaveCriticalSection(&mutex->lock);
-- 
2.25.1


