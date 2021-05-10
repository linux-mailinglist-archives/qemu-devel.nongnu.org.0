Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD23F377EF8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:08:24 +0200 (CEST)
Received: from localhost ([::1]:37464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1to-0007Iw-08
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1mG-0004CN-Jr
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1mF-00068x-3c
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620637234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6kPlDFfZY6SAUMlloEcSFKJbzHvBXzvBVlEynO4IUQ=;
 b=R67uKwNAY+rhzkSpd6QVWZlQw6AHM7caH29PjNWykcXz0PoZt/F58guT2jMQdPQDisdGI/
 mX6ajGo/an4yltyG9iF0yqTJtsEMIaMxvJ2tSIM4achOnImNNlluNJsc4jLVRdKTU5ap7y
 y0uj7smTFRbiyf6sQUbinZfMOupVPtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-dnpzblSOPEKQ2W4AVhWGNg-1; Mon, 10 May 2021 05:00:02 -0400
X-MC-Unique: dnpzblSOPEKQ2W4AVhWGNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5200B107ACE3;
 Mon, 10 May 2021 09:00:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-184.ams2.redhat.com
 [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CF91627DC;
 Mon, 10 May 2021 08:59:59 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/6] co-shared-resource: protect with a mutex
Date: Mon, 10 May 2021 10:59:40 +0200
Message-Id: <20210510085941.22769-6-eesposit@redhat.com>
In-Reply-To: <20210510085941.22769-1-eesposit@redhat.com>
References: <20210510085941.22769-1-eesposit@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 util/qemu-co-shared-resource.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resource.c
index 1c83cd9d29..c455d02a1e 100644
--- a/util/qemu-co-shared-resource.c
+++ b/util/qemu-co-shared-resource.c
@@ -32,6 +32,7 @@ struct SharedResource {
     uint64_t available;
 
     CoQueue queue;
+    QemuMutex lock;
 };
 
 SharedResource *shres_create(uint64_t total)
@@ -40,17 +41,23 @@ SharedResource *shres_create(uint64_t total)
 
     s->total = s->available = total;
     qemu_co_queue_init(&s->queue);
+    qemu_mutex_init(&s->lock);
 
     return s;
 }
 
 void shres_destroy(SharedResource *s)
 {
-    assert(s->available == s->total);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        assert(s->available == s->total);
+    }
+
+    qemu_mutex_destroy(&s->lock);
     g_free(s);
 }
 
-bool co_try_get_from_shres(SharedResource *s, uint64_t n)
+/* Called with lock held */
+static bool co_try_get_from_shres_unlocked(SharedResource *s, uint64_t n)
 {
     if (s->available >= n) {
         s->available -= n;
@@ -60,16 +67,27 @@ bool co_try_get_from_shres(SharedResource *s, uint64_t n)
     return false;
 }
 
+bool co_try_get_from_shres(SharedResource *s, uint64_t n)
+{
+    bool res;
+    QEMU_LOCK_GUARD(&s->lock);
+    res = co_try_get_from_shres_unlocked(s, n);
+
+    return res;
+}
+
 void coroutine_fn co_get_from_shres(SharedResource *s, uint64_t n)
 {
+    QEMU_LOCK_GUARD(&s->lock);
     assert(n <= s->total);
-    while (!co_try_get_from_shres(s, n)) {
-        qemu_co_queue_wait(&s->queue, NULL);
+    while (!co_try_get_from_shres_unlocked(s, n)) {
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


