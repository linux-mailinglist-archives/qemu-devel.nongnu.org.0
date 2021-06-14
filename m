Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24B3A5E33
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:16:26 +0200 (CEST)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshlh-0008EN-NZ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshhZ-0002Rv-R0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:12:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshhW-0000hV-M7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcjc6r/f+mn3kfy0n6RxXUHxQBUJj4DkTyKgaGZzToQ=;
 b=cd8hynZjY/jJ6WCR2Keh+gYf56wXsTmbzIdtwAGYoqnXctsA652HWnF6I38Dl3skr/Jvyg
 pgB+RcrsZcn/Yspi4bjJOtVd9saMsMg5zAMVXC32HsuWNmj1cFLykFVbx9npOY+UXRdzGz
 jYTEGTQSp5NDtjgTPvRFim6UwV28Ojc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Beyg8RgYMpyTCj_iryJdLQ-1; Mon, 14 Jun 2021 04:12:03 -0400
X-MC-Unique: Beyg8RgYMpyTCj_iryJdLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0DF08B78A8;
 Mon, 14 Jun 2021 08:12:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 919985D6A8;
 Mon, 14 Jun 2021 08:11:47 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 5/5] co-shared-resource: protect with a mutex
Date: Mon, 14 Jun 2021 10:11:30 +0200
Message-Id: <20210614081130.22134-6-eesposit@redhat.com>
In-Reply-To: <20210614081130.22134-1-eesposit@redhat.com>
References: <20210614081130.22134-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

co-shared-resource is currently not thread-safe, as also reported
in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
can also be invoked from non-coroutine context.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/co-shared-resource.h |  4 +---
 util/qemu-co-shared-resource.c    | 24 +++++++++++++++++++-----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/include/qemu/co-shared-resource.h b/include/qemu/co-shared-resource.h
index 4e4503004c..78ca5850f8 100644
--- a/include/qemu/co-shared-resource.h
+++ b/include/qemu/co-shared-resource.h
@@ -26,15 +26,13 @@
 #ifndef QEMU_CO_SHARED_RESOURCE_H
 #define QEMU_CO_SHARED_RESOURCE_H
 
-
+/* Accesses to co-shared-resource API are thread-safe */
 typedef struct SharedResource SharedResource;
 
 /*
  * Create SharedResource structure
  *
  * @total: total amount of some resource to be shared between clients
- *
- * Note: this API is not thread-safe.
  */
 SharedResource *shres_create(uint64_t total);
 
diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resource.c
index 1c83cd9d29..a66cc07e75 100644
--- a/util/qemu-co-shared-resource.c
+++ b/util/qemu-co-shared-resource.c
@@ -28,10 +28,13 @@
 #include "qemu/co-shared-resource.h"
 
 struct SharedResource {
-    uint64_t total;
-    uint64_t available;
+    uint64_t total; /* Set in shres_create() and not changed anymore */
 
+    /* State fields protected by lock */
+    uint64_t available;
     CoQueue queue;
+
+    QemuMutex lock;
 };
 
 SharedResource *shres_create(uint64_t total)
@@ -40,6 +43,7 @@ SharedResource *shres_create(uint64_t total)
 
     s->total = s->available = total;
     qemu_co_queue_init(&s->queue);
+    qemu_mutex_init(&s->lock);
 
     return s;
 }
@@ -47,10 +51,12 @@ SharedResource *shres_create(uint64_t total)
 void shres_destroy(SharedResource *s)
 {
     assert(s->available == s->total);
+    qemu_mutex_destroy(&s->lock);
     g_free(s);
 }
 
-bool co_try_get_from_shres(SharedResource *s, uint64_t n)
+/* Called with lock held. */
+static bool co_try_get_from_shres_locked(SharedResource *s, uint64_t n)
 {
     if (s->available >= n) {
         s->available -= n;
@@ -60,16 +66,24 @@ bool co_try_get_from_shres(SharedResource *s, uint64_t n)
     return false;
 }
 
+bool co_try_get_from_shres(SharedResource *s, uint64_t n)
+{
+    QEMU_LOCK_GUARD(&s->lock);
+    return co_try_get_from_shres_locked(s, n);
+}
+
 void coroutine_fn co_get_from_shres(SharedResource *s, uint64_t n)
 {
     assert(n <= s->total);
-    while (!co_try_get_from_shres(s, n)) {
-        qemu_co_queue_wait(&s->queue, NULL);
+    QEMU_LOCK_GUARD(&s->lock);
+    while (!co_try_get_from_shres_locked(s, n)) {
+        qemu_co_queue_wait(&s->queue, &s->lock);
     }
 }
 
 void coroutine_fn co_put_to_shres(SharedResource *s, uint64_t n)
 {
+    QEMU_LOCK_GUARD(&s->lock);
     assert(s->total - s->available >= n);
     s->available += n;
     qemu_co_queue_restart_all(&s->queue);
-- 
2.31.1


