Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C8E5064E5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:56:25 +0200 (CEST)
Received: from localhost ([::1]:49672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghmi-00047t-BC
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmG-0001FN-R8
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmD-0004VM-M2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u3so20942174wrg.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJcfIpbebmLk32obpxOkyBXPozXzL1lD2KFjXsvEwqo=;
 b=CGeqwT+2+77SVAvLQlytgA59x8i7JnOoJ/rvjpGGj5zr9bKbdE8leQlJjrvtU1z+DD
 Kjrda4sjvhjlaBT8PFlzkfqoFVbN6ESkCl2wol8FC/PzwIeEQEsSXt38oJINTAh+RndU
 vT7td+F+T8gBw2rOp+OVxRJXdxGt0Mn1IGDPQ+XrxwDufACfufGgCHYI5i7LJqjUzbzS
 ANAU0DbX62ww+nKHTJFdjst+RcI4wh2wftXXunVrCnthQ8QETjDxZG/ZlwdiELpoICVs
 uF35aKOZrTGH4eusSeOzXOUiW5mAmMG1Ok9gEjyEVhVwb51TNARowDHVvtVYeCoj35gA
 2paA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fJcfIpbebmLk32obpxOkyBXPozXzL1lD2KFjXsvEwqo=;
 b=SLTVXKXSfD9onW3ivvycTZWVFdy1m3QPskl/DlWK55hTupQMhsuiFC0ivLn46A2DEJ
 tfRKvHhCJqoQZljT6tcjZ7YQc2VlkYCr4edm13pgMZ2X1nZI9DdBPU1tLHfL4YQTkq4A
 6+W7i/ci9ql/hIy2cxOIOCwMmc1I3PSjbV7fu1NnJ10LQOq+TQIcYWj+9DQaFA3TeKfc
 9TyzvRpgh20lZkZI+cr0bzA+jIiWb73mqHCsoa6Csk0vUUK3XJWxm8sVGt2TGoyVni/e
 ByDJMyf1MPclVUvaGJWlKVM7nQMOU0UUkL9hSiRgXhPELwa1LXHW/X9//geOiRJN8lco
 whyQ==
X-Gm-Message-State: AOAM533inkxzOgO0hGNg2lyssW8VXrqTHL2OJ8x2mI5AgU3/EX1gkdhC
 8ro66uhudv39/HFWww2e5jMUPpri/Xx9tg==
X-Google-Smtp-Source: ABdhPJxWZVV11e7rZ2us2EfvB6hQ7TuGuhXcOxFMKNIR2ojYCEXqj2YboXq8y6p4lWALMBjmVrlDMQ==
X-Received: by 2002:adf:dc0b:0:b0:20a:a549:d3a6 with SMTP id
 t11-20020adfdc0b000000b0020aa549d3a6mr1899732wri.34.1650347508453; 
 Mon, 18 Apr 2022 22:51:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/53] thread-posix: use monotonic clock for QemuCond and
 QemuSemaphore
Date: Tue, 19 Apr 2022 07:50:57 +0200
Message-Id: <20220419055109.142788-42-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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

Use CLOCK_MONOTONIC, so the timeout isn't affected by changes to
the system time. It depends on the pthread_condattr_setclock(),
while some systems(e.g. mac os) does not support it, so the behavior
won't change in these systems.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
Message-Id: <20220222090507.2028-3-longpeng2@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build              | 11 +++++++++
 util/qemu-thread-posix.c | 53 ++++++++++++++++++++++++++++++++++------
 2 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 526e9dc03b..6ba60950c8 100644
--- a/meson.build
+++ b/meson.build
@@ -1780,6 +1780,17 @@ config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links(gnu_source_pre
     pthread_create(&thread, 0, f, 0);
     return 0;
   }''', dependencies: threads))
+config_host_data.set('CONFIG_PTHREAD_CONDATTR_SETCLOCK', cc.links(gnu_source_prefix + '''
+  #include <pthread.h>
+  #include <time.h>
+
+  int main(void)
+  {
+    pthread_condattr_t attr
+    pthread_condattr_init(&attr);
+    pthread_condattr_setclock(&attr, CLOCK_MONOTONIC);
+    return 0;
+  }''', dependencies: threads))
 
 config_host_data.set('CONFIG_SIGNALFD', cc.links(gnu_source_prefix + '''
   #include <sys/signalfd.h>
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 1ad2503607..f6a34eed2f 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -38,12 +38,20 @@ static void error_exit(int err, const char *msg)
     abort();
 }
 
+static inline clockid_t qemu_timedwait_clockid(void)
+{
+#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
+    return CLOCK_MONOTONIC;
+#else
+    return CLOCK_REALTIME;
+#endif
+}
+
 static void compute_abs_deadline(struct timespec *ts, int ms)
 {
-    struct timeval tv;
-    gettimeofday(&tv, NULL);
-    ts->tv_nsec = tv.tv_usec * 1000 + (ms % 1000) * 1000000;
-    ts->tv_sec = tv.tv_sec + ms / 1000;
+    clock_gettime(qemu_timedwait_clockid(), ts);
+    ts->tv_nsec += (ms % 1000) * 1000000;
+    ts->tv_sec += ms / 1000;
     if (ts->tv_nsec >= 1000000000) {
         ts->tv_sec++;
         ts->tv_nsec -= 1000000000;
@@ -147,11 +155,27 @@ void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 
 void qemu_cond_init(QemuCond *cond)
 {
+    pthread_condattr_t attr;
     int err;
 
-    err = pthread_cond_init(&cond->cond, NULL);
-    if (err)
+    err = pthread_condattr_init(&attr);
+    if (err) {
         error_exit(err, __func__);
+    }
+#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
+    err = pthread_condattr_setclock(&attr, qemu_timedwait_clockid());
+    if (err) {
+        error_exit(err, __func__);
+    }
+#endif
+    err = pthread_cond_init(&cond->cond, &attr);
+    if (err) {
+        error_exit(err, __func__);
+    }
+    err = pthread_condattr_destroy(&attr);
+    if (err) {
+        error_exit(err, __func__);
+    }
     cond->initialized = true;
 }
 
@@ -217,16 +241,31 @@ bool qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
 
 void qemu_sem_init(QemuSemaphore *sem, int init)
 {
+    pthread_condattr_t attr;
     int rc;
 
     rc = pthread_mutex_init(&sem->lock, NULL);
     if (rc != 0) {
         error_exit(rc, __func__);
     }
-    rc = pthread_cond_init(&sem->cond, NULL);
+    rc = pthread_condattr_init(&attr);
     if (rc != 0) {
         error_exit(rc, __func__);
     }
+#ifdef CONFIG_PTHREAD_CONDATTR_SETCLOCK
+    rc = pthread_condattr_setclock(&attr, qemu_timedwait_clockid());
+    if (rc != 0) {
+        error_exit(rc, __func__);
+    }
+#endif
+    rc = pthread_cond_init(&sem->cond, &attr);
+    if (rc != 0) {
+        error_exit(rc, __func__);
+    }
+    rc = pthread_condattr_destroy(&attr);
+    if (rc < 0) {
+        error_exit(rc, __func__);
+    }
     if (init < 0) {
         error_exit(EINVAL, __func__);
     }
-- 
2.35.1



