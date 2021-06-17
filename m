Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC053AB03F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:51:20 +0200 (CEST)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltogB-0002WR-CY
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNd-0003EJ-3w
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:10 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNb-0006Q3-Ec
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:08 -0400
Received: by mail-ej1-x630.google.com with SMTP id my49so8697533ejc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNJr/AA+BlXc1zPZLzRJ8Y7azIDxrXiDPF6G2uWQRjc=;
 b=hEkuoq0tnrqsRmZtsbEJNE6inmjPOnQS34lWm2RdrqkF9aBR9NUjW/aDSmhPhitmkW
 jXttsQa0lUVesQIuhDoQzLdId64d0Z3Evexpzh7KKGp9Dsg6s9uqv4UHNQzVwTSamVFP
 DpvEvzUQkSWHa98fZxxIlRRZOK+MwKs6k5gqzv9QlPltrayKTWN82gUscBcorll8Ck9N
 ukWx4lMtHZ9PdyiPUjFLkf2OWrm4L5zTa13xWK3T1XHEtCpfcsW3s0XUiL1Jn8CLD1/x
 vViEP2jYwkP6eHQzv6vbYEe5nYW2ia/cDXY55+qvQnRuHMye1o0D9fAb5hcgjRT4zX3q
 VDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JNJr/AA+BlXc1zPZLzRJ8Y7azIDxrXiDPF6G2uWQRjc=;
 b=fK5ZvBIy7QCy5En+/O9SxxZNdxFXpe8iIgCOG50sOXrpJnStk0zaBMuiWuzk6rdQvA
 Qr8WfUXOYe4xpQ7NQEwtoNSvfWcF74Q5fy5AttcFNy3Iyv0HAYdJiMb4N0bcMu0Bv1cy
 7JXBpizDTwiTTsk6USvhLF9Sh76uXVHCwmt3bZ+LRA5IW8YqDpA4n7zA6M2UFnoDa998
 +sXB3OwACjGNkB8EsvRqLgD8nBXuimtxMYL8rslm7Pv7zJ+Txyf0l7m5E6WWncS94A1S
 dYRSfeHbibYdYHumCV12IORf7enBQiFEHUC7bSkCRildTwUeqZuqKq+MrB8xK4PSjtz0
 LTFg==
X-Gm-Message-State: AOAM532KSBMUOHRlEgte5orFyrNJW1EWApbRj/p2Jb0FuGkwp3St9iTD
 bMwtLvdQkJSw9hVIxetKvZdP7W+Pmp8=
X-Google-Smtp-Source: ABdhPJw2dIbB3J71bfR6dDDM6kgu2vqEHyCyOxKLR8BAp1pCeMJT/uYV4wEmBpjlIQYmoHXyu9DMng==
X-Received: by 2002:a17:907:1c9e:: with SMTP id
 nb30mr4278702ejc.0.1623922326208; 
 Thu, 17 Jun 2021 02:32:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/45] util: Use unique type for QemuRecMutex in thread-posix.h
Date: Thu, 17 Jun 2021 11:31:31 +0200
Message-Id: <20210617093134.900014-43-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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

We will shortly convert lockable.h to _Generic, and we cannot
have two compatible types in the same expansion.  Wrap QemuMutex
in a struct, and unwrap in qemu-thread-posix.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210614233143.1221879-6-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/thread-posix.h | 10 ++++++++--
 util/qemu-thread-posix.c    | 12 ++++++------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
index cf8bc90468..b792e6ef37 100644
--- a/include/qemu/thread-posix.h
+++ b/include/qemu/thread-posix.h
@@ -4,8 +4,6 @@
 #include <pthread.h>
 #include <semaphore.h>
 
-typedef QemuMutex QemuRecMutex;
-
 struct QemuMutex {
     pthread_mutex_t lock;
 #ifdef CONFIG_DEBUG_MUTEX
@@ -15,6 +13,14 @@ struct QemuMutex {
     bool initialized;
 };
 
+/*
+ * QemuRecMutex cannot be a typedef of QemuMutex lest we have two
+ * compatible cases in _Generic.  See qemu/lockable.h.
+ */
+typedef struct QemuRecMutex {
+    QemuMutex m;
+} QemuRecMutex;
+
 struct QemuCond {
     pthread_cond_t cond;
     bool initialized;
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index d990826ed8..fd9d714038 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -116,32 +116,32 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex)
 
     pthread_mutexattr_init(&attr);
     pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
-    err = pthread_mutex_init(&mutex->lock, &attr);
+    err = pthread_mutex_init(&mutex->m.lock, &attr);
     pthread_mutexattr_destroy(&attr);
     if (err) {
         error_exit(err, __func__);
     }
-    mutex->initialized = true;
+    mutex->m.initialized = true;
 }
 
 void qemu_rec_mutex_destroy(QemuRecMutex *mutex)
 {
-    qemu_mutex_destroy(mutex);
+    qemu_mutex_destroy(&mutex->m);
 }
 
 void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    qemu_mutex_lock_impl(mutex, file, line);
+    qemu_mutex_lock_impl(&mutex->m, file, line);
 }
 
 int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    return qemu_mutex_trylock_impl(mutex, file, line);
+    return qemu_mutex_trylock_impl(&mutex->m, file, line);
 }
 
 void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    qemu_mutex_unlock_impl(mutex, file, line);
+    qemu_mutex_unlock_impl(&mutex->m, file, line);
 }
 
 void qemu_cond_init(QemuCond *cond)
-- 
2.31.1



