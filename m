Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062ED3875CB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:55:00 +0200 (CEST)
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwRH-0001Xo-1v
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liwE9-0002x8-Tx
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liwE8-000846-4k
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o29XndGUfRwY0P3peJ9TK4DE+Rh+I26/FbueKykjyy8=;
 b=HhT6Oxk/nyKJYmhTnTfx/FJbZtMthkHZ2HhC3ALM8UzwkVYLoQ+FDbm8VZI/Dmj18tUH5m
 +CMiNINyf4pfOkQG2AqWQgQF6kcvm8HvJ8pk1REsS+RWivSEOcezDvPFePDZ4j7oJ2ZYPL
 vdTY8fCu+Bcdryms/EUDwQUrb3GPGR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-d7yA4pt3PviZvUvUeGGipw-1; Tue, 18 May 2021 05:41:21 -0400
X-MC-Unique: d7yA4pt3PviZvUvUeGGipw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC138101371E;
 Tue, 18 May 2021 09:41:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-236.ams2.redhat.com
 [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F7742ED6F;
 Tue, 18 May 2021 09:41:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 5/5] co-shared-resource: protect with a mutex
Date: Tue, 18 May 2021 11:40:58 +0200
Message-Id: <20210518094058.25952-6-eesposit@redhat.com>
In-Reply-To: <20210518094058.25952-1-eesposit@redhat.com>
References: <20210518094058.25952-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/co-shared-resource.h |  4 +---
 util/qemu-co-shared-resource.c    | 27 ++++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 8 deletions(-)

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
index 1c83cd9d29..bb875a86be 100644
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
@@ -60,16 +66,27 @@ bool co_try_get_from_shres(SharedResource *s, uint64_t n)
     return false;
 }
 
+bool co_try_get_from_shres(SharedResource *s, uint64_t n)
+{
+    bool res;
+    QEMU_LOCK_GUARD(&s->lock);
+    res = co_try_get_from_shres_locked(s, n);
+
+    return res;
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
2.30.2


