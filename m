Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA669AF25
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2NI-0004h0-M2; Fri, 17 Feb 2023 10:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NG-0004dQ-3a
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NE-0007Lq-53
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxaHVwWhx7B2+54ehzp6pMbskzB/avGF6gBOlmmXxsE=;
 b=HOrWGpOpZGLnKhQ9YJtkpDn9s8wzrh9Srudwkxf/6pf/2NcYsleID9w2+UEhXEMC1aUuy7
 jlVMWjcIgMZ4CdorOu5EG9b97Y7LxFSza1xZGX4YAz7i298vWRtyM/MfK4EagMkYlGadlx
 owfXTSk+cIr2ddHMbX6wyelL4oNO9Hk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-JPlo-zouOmiSLooV4jZdFQ-1; Fri, 17 Feb 2023 10:10:01 -0500
X-MC-Unique: JPlo-zouOmiSLooV4jZdFQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F5F818E0A63;
 Fri, 17 Feb 2023 15:10:01 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E345492C14;
 Fri, 17 Feb 2023 15:10:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/22] util/qemu-thread-posix: use TSA_NO_TSA to suppress clang
 TSA warnings in FreeBSD
Date: Fri, 17 Feb 2023 16:09:33 +0100
Message-Id: <20230217150954.283920-1-kwolf@redhat.com>
In-Reply-To: <20230217150829.283583-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

FreeBSD implements pthread headers using TSA (thread safety analysis)
annotations, therefore when an application is compiled with
-Wthread-safety there are some locking/annotation requirements that the
user of the pthread API has to follow.

This will also be the case in QEMU, since util/qemu-thread-posix.c uses
the pthread API. Therefore when building it with -Wthread-safety, the
compiler will throw warnings because the functions are not properly
annotated. We need TSA to be enabled because it ensures that the
critical sections of an annotated variable are properly locked.

In order to make the compiler happy and avoid adding all the necessary
macros to all callers (lock functions should use TSA_ACQUIRE, while
unlock TSA_RELEASE, and this applies to all users of pthread_mutex_lock
and pthread_mutex_unlock), simply use TSA_NO_TSA to supppress such
warnings.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20230117135203.3049709-2-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/thread.h    | 14 +++++++++-----
 util/qemu-thread-posix.c |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 7841084199..dd3822d7ce 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -3,6 +3,7 @@
 
 #include "qemu/processor.h"
 #include "qemu/atomic.h"
+#include "qemu/clang-tsa.h"
 
 typedef struct QemuCond QemuCond;
 typedef struct QemuSemaphore QemuSemaphore;
@@ -24,9 +25,12 @@ typedef struct QemuThread QemuThread;
 
 void qemu_mutex_init(QemuMutex *mutex);
 void qemu_mutex_destroy(QemuMutex *mutex);
-int qemu_mutex_trylock_impl(QemuMutex *mutex, const char *file, const int line);
-void qemu_mutex_lock_impl(QemuMutex *mutex, const char *file, const int line);
-void qemu_mutex_unlock_impl(QemuMutex *mutex, const char *file, const int line);
+int TSA_NO_TSA qemu_mutex_trylock_impl(QemuMutex *mutex, const char *file,
+                                       const int line);
+void TSA_NO_TSA qemu_mutex_lock_impl(QemuMutex *mutex, const char *file,
+                                     const int line);
+void TSA_NO_TSA qemu_mutex_unlock_impl(QemuMutex *mutex, const char *file,
+                                       const int line);
 
 void qemu_rec_mutex_init(QemuRecMutex *mutex);
 void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
@@ -153,8 +157,8 @@ void qemu_cond_destroy(QemuCond *cond);
  */
 void qemu_cond_signal(QemuCond *cond);
 void qemu_cond_broadcast(QemuCond *cond);
-void qemu_cond_wait_impl(QemuCond *cond, QemuMutex *mutex,
-                         const char *file, const int line);
+void TSA_NO_TSA qemu_cond_wait_impl(QemuCond *cond, QemuMutex *mutex,
+                                    const char *file, const int line);
 bool qemu_cond_timedwait_impl(QemuCond *cond, QemuMutex *mutex, int ms,
                               const char *file, const int line);
 
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index bae938c670..2dd1069cd3 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -223,7 +223,7 @@ void qemu_cond_wait_impl(QemuCond *cond, QemuMutex *mutex, const char *file, con
         error_exit(err, __func__);
 }
 
-static bool
+static bool TSA_NO_TSA
 qemu_cond_timedwait_ts(QemuCond *cond, QemuMutex *mutex, struct timespec *ts,
                        const char *file, const int line)
 {
-- 
2.39.2


