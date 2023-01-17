Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889A66DF74
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:53:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmNr-0000vl-52; Tue, 17 Jan 2023 08:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHmNn-0000rd-DK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHmNl-0005vV-Gr
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673963528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1JWCQ/XZDP0YzmeBm+TMTnUrDS7/1OM63fu48KSkq8=;
 b=Au993I4woZfsUPawz2nvru/43hWDPMRHhTypkY7gD5fGgEy9K84CvmErIMNiMdizQiR65d
 WIR1zpyaJ8KzzqPowtYaX1SwVOkkEc/roqy6CZzH0iRRG7nymdHZDWkGdqtAj4KsYjxwQh
 msJFbjOHcoLWJ4COXauv/nQ8xhYpsHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-Jk1u2vdfPeiKTSREOh5IQw-1; Tue, 17 Jan 2023 08:52:06 -0500
X-MC-Unique: Jk1u2vdfPeiKTSREOh5IQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54F771818E56;
 Tue, 17 Jan 2023 13:52:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FFEB112131B;
 Tue, 17 Jan 2023 13:52:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/3] util/qemu-thread-posix: use TSA_NO_TSA to suppress clang
 TSA warnings
Date: Tue, 17 Jan 2023 08:52:01 -0500
Message-Id: <20230117135203.3049709-2-eesposit@redhat.com>
In-Reply-To: <20230117135203.3049709-1-eesposit@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

QEMU does not compile when enabling clang's thread safety analysis
(TSA),
because some functions create wrappers for pthread mutexes but do
not use any TSA macro. Therefore the compiler fails.

In order to make the compiler happy and avoid adding all the
necessary macros to all callers (lock functions should use
TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to all
users of pthread_mutex_lock/pthread_mutex_unlock),
simply use TSA_NO_TSA to supppress such warnings.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/thread.h    | 14 +++++++++-----
 util/qemu-thread-posix.c |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 7c6703bce3..81ec9fc144 100644
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
2.39.0


