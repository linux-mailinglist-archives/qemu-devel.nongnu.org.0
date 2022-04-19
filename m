Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3520506544
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:01:54 +0200 (CEST)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghs1-00081B-1K
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmG-0001FO-Tj
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmD-0004Uv-5x
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id w4so20898477wrg.12
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dd2btITZAkKvbGwyXVH17qaz879vrJ3ttv8tRXEsOaY=;
 b=D93bqhNPuRtA9umnTOG4fuo0r4l77NTMo01VY9iSwnEl97glL9ZkF599FHfdChynEf
 Bdd654mhZ5Z9OXjB8TkLNhckzAluX5hFeilmhclGa7iXmCdrsWhhxQt3uzWFw+r4VhKO
 NjHGPvkIDbjiwmc/lJwyWIxDDrxkofSv/E2IkmfArSbo3Be2kHdKro1BAKNgwMeQ2w0M
 ldMCjvVn4vpbLH+ggwk9UyO7341qT7nzEwDB0mrf0rWDpYgUOhEJiiKvTtKfckx1YHAr
 lUkCuML3ct4thKjKlFcPEC1AxI4d0V66T2RJDNBpYSvMSeWNOOs3kxiIoHVPZNHRU8Ad
 uKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dd2btITZAkKvbGwyXVH17qaz879vrJ3ttv8tRXEsOaY=;
 b=jhlrMfOd1GJ5Bay0uOVXNVt4TCARwvPgqHztCmsiKS8190havoFreQlLdV4fc5FPug
 sfkepZ2Youl95LDu78NjwB77hfQhNAf5m3LpiCGmYAiV8mGfuAW8rIrjtGo5CZD+gEmN
 xjz3x1Q0T7vxTnq0LV7cAuMVTYuzlp3nDl6Z/1RJ6w6TZZ2aN4wcaPKb6+jxd8eVzKhQ
 sFzfEUal27KQJSJWvKlzlNzPHePhT/mLN/7/d3bKS2mDx8Qoj5/CKEbbpyUrqoZoUbsp
 N/JHN5y4gU68JycdztdeqmMxpboSuUfC78PfyeFbUic1TLX+o+cird2A6gl8ZLqGQDAD
 +V4w==
X-Gm-Message-State: AOAM532Yi9kxdWqfsibC/RxlQN/28/jVtb3L9FyYFHnR7QedgA4i8LjM
 m2OKQ+HwA+tSS9avMkMKCiUWOfz4iKhiyA==
X-Google-Smtp-Source: ABdhPJwtxYsDOIbagqqfoVqh7zOJ74C1y8sxRPjPPjDk8pQJ1X0iOufspcv7tGs49nQBZYhHraB9XQ==
X-Received: by 2002:a5d:588a:0:b0:204:1f46:cf08 with SMTP id
 n10-20020a5d588a000000b002041f46cf08mr10820880wrf.133.1650347507483; 
 Mon, 18 Apr 2022 22:51:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/53] thread-posix: remove the posix semaphore support
Date: Tue, 19 Apr 2022 07:50:56 +0200
Message-Id: <20220419055109.142788-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Longpeng(Mike)" <longpeng2@huawei.com>

POSIX specifies an absolute time for sem_timedwait(), it would be
affected if the system time is changing, but there is not a relative
time or monotonic clock version of sem_timedwait, so we cannot gain
from POSIX semaphore any more.

An alternative way is to use sem_trywait + usleep, maybe we can
remove CONFIG_SEM_TIMEDWAIT in this way? No, because some systems
(e.g. mac os) mark the sem_xxx API as deprecated.

So maybe remove the usage of POSIX semaphore and turn to use the
pthread variant for all systems looks better.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Message-Id: <20220222090507.2028-2-longpeng2@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/thread-posix.h |  4 ---
 meson.build                 |  1 -
 util/qemu-thread-posix.c    | 54 -------------------------------------
 3 files changed, 59 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index b792e6ef37..5466608d7c 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -27,13 +27,9 @@ struct QemuCond {
 };
 
 struct QemuSemaphore {
-#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_t lock;
     pthread_cond_t cond;
     unsigned int count;
-#else
-    sem_t sem;
-#endif
     bool initialized;
 };
 
diff --git a/meson.build b/meson.build
index 5a207ed0fb..526e9dc03b 100644
--- a/meson.build
+++ b/meson.build
@@ -1632,7 +1632,6 @@ config_host_data.set('CONFIG_MEMALIGN', cc.has_function('memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP', cc.has_function('pthread_fchdir_np'))
-config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
 config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
 config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
 config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index e1225b63bd..1ad2503607 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -219,7 +219,6 @@ void qemu_sem_init(QemuSemaphore *sem, int init)
 {
     int rc;
 
-#ifndef CONFIG_SEM_TIMEDWAIT
     rc = pthread_mutex_init(&sem->lock, NULL);
     if (rc != 0) {
         error_exit(rc, __func__);
@@ -232,12 +231,6 @@ void qemu_sem_init(QemuSemaphore *sem, int init)
         error_exit(EINVAL, __func__);
     }
     sem->count = init;
-#else
-    rc = sem_init(&sem->sem, 0, init);
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-#endif
     sem->initialized = true;
 }
 
@@ -247,7 +240,6 @@ void qemu_sem_destroy(QemuSemaphore *sem)
 
     assert(sem->initialized);
     sem->initialized = false;
-#ifndef CONFIG_SEM_TIMEDWAIT
     rc = pthread_cond_destroy(&sem->cond);
     if (rc < 0) {
         error_exit(rc, __func__);
@@ -256,12 +248,6 @@ void qemu_sem_destroy(QemuSemaphore *sem)
     if (rc < 0) {
         error_exit(rc, __func__);
     }
-#else
-    rc = sem_destroy(&sem->sem);
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-#endif
 }
 
 void qemu_sem_post(QemuSemaphore *sem)
@@ -269,7 +255,6 @@ void qemu_sem_post(QemuSemaphore *sem)
     int rc;
 
     assert(sem->initialized);
-#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_lock(&sem->lock);
     if (sem->count == UINT_MAX) {
         rc = EINVAL;
@@ -281,12 +266,6 @@ void qemu_sem_post(QemuSemaphore *sem)
     if (rc != 0) {
         error_exit(rc, __func__);
     }
-#else
-    rc = sem_post(&sem->sem);
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-#endif
 }
 
 int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
@@ -295,7 +274,6 @@ int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
     struct timespec ts;
 
     assert(sem->initialized);
-#ifndef CONFIG_SEM_TIMEDWAIT
     rc = 0;
     compute_abs_deadline(&ts, ms);
     pthread_mutex_lock(&sem->lock);
@@ -313,29 +291,6 @@ int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
     }
     pthread_mutex_unlock(&sem->lock);
     return (rc == ETIMEDOUT ? -1 : 0);
-#else
-    if (ms <= 0) {
-        /* This is cheaper than sem_timedwait.  */
-        do {
-            rc = sem_trywait(&sem->sem);
-        } while (rc == -1 && errno == EINTR);
-        if (rc == -1 && errno == EAGAIN) {
-            return -1;
-        }
-    } else {
-        compute_abs_deadline(&ts, ms);
-        do {
-            rc = sem_timedwait(&sem->sem, &ts);
-        } while (rc == -1 && errno == EINTR);
-        if (rc == -1 && errno == ETIMEDOUT) {
-            return -1;
-        }
-    }
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-    return 0;
-#endif
 }
 
 void qemu_sem_wait(QemuSemaphore *sem)
@@ -343,7 +298,6 @@ void qemu_sem_wait(QemuSemaphore *sem)
     int rc;
 
     assert(sem->initialized);
-#ifndef CONFIG_SEM_TIMEDWAIT
     pthread_mutex_lock(&sem->lock);
     while (sem->count == 0) {
         rc = pthread_cond_wait(&sem->cond, &sem->lock);
@@ -353,14 +307,6 @@ void qemu_sem_wait(QemuSemaphore *sem)
     }
     --sem->count;
     pthread_mutex_unlock(&sem->lock);
-#else
-    do {
-        rc = sem_wait(&sem->sem);
-    } while (rc == -1 && errno == EINTR);
-    if (rc < 0) {
-        error_exit(errno, __func__);
-    }
-#endif
 }
 
 #ifdef __linux__
-- 
2.35.1



