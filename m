Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675651A263
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:39:10 +0200 (CEST)
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG9l-0001ec-Aw
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwn-0000v9-6L
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwj-0007Hh-7Q
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgJsgpcMfue21DBQk6EWb/0FL3uN14JD9qhyUMZZ3Zs=;
 b=aaP9XhIL4Vrql6lWpXcKKqqurjB9bEwTgyayrrcHZRcu3C+5bS5q8g7JBjHvjlmQDg6FY2
 v47gOpJvX7ycBcDAECkSYTd1CtlrHD+Zk9rrOfYTwy83IdwTPXK3RNFzHUiEoK1uWyNoGo
 Cy+5dEufW5rH6m8iZB2AqyM8muJ17tw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-t96ITecHMdK4Jx61H5qFIA-1; Wed, 04 May 2022 10:25:39 -0400
X-MC-Unique: t96ITecHMdK4Jx61H5qFIA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E963F1C3E983;
 Wed,  4 May 2022 14:25:38 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6972A402189;
 Wed,  4 May 2022 14:25:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 12/13] coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
Date: Wed,  4 May 2022 16:25:21 +0200
Message-Id: <20220504142522.167506-13-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Thread-Local Storage variables cannot be used directly from coroutine
code because the compiler may optimize TLS variable accesses across
qemu_coroutine_yield() calls. When the coroutine is re-entered from
another thread the TLS variables from the old thread must no longer be
used.

Use QEMU_DEFINE_STATIC_CO_TLS() for the current and leader variables.
The alloc_pool QSLIST needs a typedef so the return value of
get_ptr_alloc_pool() can be stored in a local variable.

One example of why this code is necessary: a coroutine that yields
before calling qemu_coroutine_create() to create another coroutine is
affected by the TLS issue.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220307153853.602859-3-stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/qemu-coroutine.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index c03b2422ff..f3e8300c8d 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -18,6 +18,7 @@
 #include "qemu/atomic.h"
 #include "qemu/coroutine.h"
 #include "qemu/coroutine_int.h"
+#include "qemu/coroutine-tls.h"
 #include "block/aio.h"
 
 /** Initial batch size is 64, and is increased on demand */
@@ -29,17 +30,20 @@ enum {
 static QSLIST_HEAD(, Coroutine) release_pool = QSLIST_HEAD_INITIALIZER(pool);
 static unsigned int pool_batch_size = POOL_INITIAL_BATCH_SIZE;
 static unsigned int release_pool_size;
-static __thread QSLIST_HEAD(, Coroutine) alloc_pool = QSLIST_HEAD_INITIALIZER(pool);
-static __thread unsigned int alloc_pool_size;
-static __thread Notifier coroutine_pool_cleanup_notifier;
+
+typedef QSLIST_HEAD(, Coroutine) CoroutineQSList;
+QEMU_DEFINE_STATIC_CO_TLS(CoroutineQSList, alloc_pool);
+QEMU_DEFINE_STATIC_CO_TLS(unsigned int, alloc_pool_size);
+QEMU_DEFINE_STATIC_CO_TLS(Notifier, coroutine_pool_cleanup_notifier);
 
 static void coroutine_pool_cleanup(Notifier *n, void *value)
 {
     Coroutine *co;
     Coroutine *tmp;
+    CoroutineQSList *alloc_pool = get_ptr_alloc_pool();
 
-    QSLIST_FOREACH_SAFE(co, &alloc_pool, pool_next, tmp) {
-        QSLIST_REMOVE_HEAD(&alloc_pool, pool_next);
+    QSLIST_FOREACH_SAFE(co, alloc_pool, pool_next, tmp) {
+        QSLIST_REMOVE_HEAD(alloc_pool, pool_next);
         qemu_coroutine_delete(co);
     }
 }
@@ -49,27 +53,30 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
     Coroutine *co = NULL;
 
     if (CONFIG_COROUTINE_POOL) {
-        co = QSLIST_FIRST(&alloc_pool);
+        CoroutineQSList *alloc_pool = get_ptr_alloc_pool();
+
+        co = QSLIST_FIRST(alloc_pool);
         if (!co) {
             if (release_pool_size > qatomic_read(&pool_batch_size)) {
                 /* Slow path; a good place to register the destructor, too.  */
-                if (!coroutine_pool_cleanup_notifier.notify) {
-                    coroutine_pool_cleanup_notifier.notify = coroutine_pool_cleanup;
-                    qemu_thread_atexit_add(&coroutine_pool_cleanup_notifier);
+                Notifier *notifier = get_ptr_coroutine_pool_cleanup_notifier();
+                if (!notifier->notify) {
+                    notifier->notify = coroutine_pool_cleanup;
+                    qemu_thread_atexit_add(notifier);
                 }
 
                 /* This is not exact; there could be a little skew between
                  * release_pool_size and the actual size of release_pool.  But
                  * it is just a heuristic, it does not need to be perfect.
                  */
-                alloc_pool_size = qatomic_xchg(&release_pool_size, 0);
-                QSLIST_MOVE_ATOMIC(&alloc_pool, &release_pool);
-                co = QSLIST_FIRST(&alloc_pool);
+                set_alloc_pool_size(qatomic_xchg(&release_pool_size, 0));
+                QSLIST_MOVE_ATOMIC(alloc_pool, &release_pool);
+                co = QSLIST_FIRST(alloc_pool);
             }
         }
         if (co) {
-            QSLIST_REMOVE_HEAD(&alloc_pool, pool_next);
-            alloc_pool_size--;
+            QSLIST_REMOVE_HEAD(alloc_pool, pool_next);
+            set_alloc_pool_size(get_alloc_pool_size() - 1);
         }
     }
 
@@ -93,9 +100,9 @@ static void coroutine_delete(Coroutine *co)
             qatomic_inc(&release_pool_size);
             return;
         }
-        if (alloc_pool_size < qatomic_read(&pool_batch_size)) {
-            QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
-            alloc_pool_size++;
+        if (get_alloc_pool_size() < qatomic_read(&pool_batch_size)) {
+            QSLIST_INSERT_HEAD(get_ptr_alloc_pool(), co, pool_next);
+            set_alloc_pool_size(get_alloc_pool_size() + 1);
             return;
         }
     }
-- 
2.35.1


