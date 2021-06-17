Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6543AB0D9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:03:30 +0200 (CEST)
Received: from localhost ([::1]:48614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltorw-0002HC-K5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNb-0003CD-MX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:07 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNa-0006P0-24
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:07 -0400
Received: by mail-ed1-x52a.google.com with SMTP id i13so3039290edb.9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JC6jDpOW9MIOT5eEE0twrZyJmHuq2x22gNqBjt+axpw=;
 b=qLtioOA0pDI271G52lPzyTkwUH5MTzpzevMcTlWT2+KT2rfJ13gcHMI/9cWdJ5puau
 3QoHPuULjmHjQPR2JE1FAmK9Dj24kCHEiU8hrHuibfVxIFMKYO4WiJpgCsiMEdYE3V1F
 QWXfGNWVCaaa4sQkjYtdSEk+l1aTqLAlyuXZyQwkmhlPJuenk0FGVtV8SJgYTQ1rYII1
 +Av4cSZXH+b/zAHpUp/+gkmYmp3xH07tF8HYAeLrzzbg1YUZBSyFPflSph8XRx1YobRs
 70WHVcXTKgixrV/nkCyiSTg0BW5YZAs76BafC3j5MC8f/qAbvRQadqg1ecNkDlm5/cZT
 bzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JC6jDpOW9MIOT5eEE0twrZyJmHuq2x22gNqBjt+axpw=;
 b=B8ZIIFQbJS6hwzKK5JXeFTrSSU208CEYWn6x67xHCnemHwTVbK1Rn/0gt4cm3szl7E
 b0tqFQeQjl8ETjGbiprsEBmdW/rd0YrpQVt7nQzPuAYsr79beoz3HQVXz9Gt2pNKTj/J
 BB+hshKcV+E76XxExHBeHlejjSJr9MX7aCZUCWdV0AVgUljeIpBAkJ7nwX1gRLqRUpx/
 ujx2p3aBU82P+fCIPhdn5LbUGqWy5r3FG2dfVKgGIQDQWua3tQvlKv1QZujEoEUDPU29
 bht+hj1wr8O5OmrKplhrRpvHKG6z6Se+TJ+0Fap9laFVqZXDn1LJFer+E3GgBkvANAEP
 ETng==
X-Gm-Message-State: AOAM530sY8xt8fWUR5vbsfRbrqm8cF4x57h/PPx/SouaaIYLNCVZLTae
 QpnwCt7sTf15mo3pTuHMDp4HnFwXjgA=
X-Google-Smtp-Source: ABdhPJzf1TKbDSYAj+DvmqyloTIjnYWEqWL7YdfZ34G702XMbRhB/eGiADtzTP6Q9uBnj3JxLci7wA==
X-Received: by 2002:a05:6402:2706:: with SMTP id
 y6mr2205053edd.330.1623922324882; 
 Thu, 17 Jun 2021 02:32:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/45] util: Use real functions for thread-posix QemuRecMutex
Date: Thu, 17 Jun 2021 11:31:29 +0200
Message-Id: <20210617093134.900014-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move the declarations from thread-win32.h into thread.h
and remove the macro redirection from thread-posix.h.
This will be required by following cleanups.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210614233143.1221879-4-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.31.1



