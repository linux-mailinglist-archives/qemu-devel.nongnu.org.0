Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C13876D3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:44:16 +0200 (CEST)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixCx-0008CU-TI
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweY-00031O-OF
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweR-0007nq-4U
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmjkdb0+ERHWohcq8Mm7mZ2buw4kA6iUKxv1ovZ4H2g=;
 b=JDlZGzeJPcOm4lWti0VBHo9n88XxEWlBIPkJ8LAITXCJU1YVAPeQYrmTlC9Kviy6YBvGf1
 4z8EWrVSKk2MrVPu+AKmXgiHe6+h0ky5+F2A2y0klDu1W9ZvuwoydfntYuq3qbgJhjAz66
 7SX29TairvXwKm+6fYWYpfszTLhY1XI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-7KsAzXWJPF-n56WG2qJj_A-1; Tue, 18 May 2021 06:08:31 -0400
X-MC-Unique: 7KsAzXWJPF-n56WG2qJj_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1D80107ACC7;
 Tue, 18 May 2021 10:08:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-236.ams2.redhat.com
 [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D17E5687D4;
 Tue, 18 May 2021 10:08:27 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 5/7] block-copy: add QemuMutex lock for BlockCopyCallState
 list
Date: Tue, 18 May 2021 12:07:55 +0200
Message-Id: <20210518100757.31243-6-eesposit@redhat.com>
In-Reply-To: <20210518100757.31243-1-eesposit@redhat.com>
References: <20210518100757.31243-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

As for BlockCopyTask, add a lock to protect BlockCopyCallState
ret and sleep_state fields. Also move ret, finished and cancelled
in the OUT fields of BlockCopyCallState.

Here a QemuMutex is used to protect QemuCoSleep field, since it
can be concurrently invoked also from outside threads.

.finished, .cancelled and reads to .ret and .error_is_read will be
protected in the following patch.

.sleep state is handled in the series "coroutine: new sleep/wake API"

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 3a949fab64..d5ed5932b0 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -55,13 +55,14 @@ typedef struct BlockCopyCallState {
     QLIST_ENTRY(BlockCopyCallState) list;
 
     /* State */
-    int ret;
     bool finished;
-    QemuCoSleep sleep;
-    bool cancelled;
+    QemuCoSleep sleep; /* TODO: protect API with a lock */
 
     /* OUT parameters */
+    bool cancelled;
+    /* Fields protected by calls_lock in BlockCopyState */
     bool error_is_read;
+    int ret;
 } BlockCopyCallState;
 
 typedef struct BlockCopyTask {
@@ -110,6 +111,7 @@ typedef struct BlockCopyState {
     BlockCopyMethod method;
     CoMutex tasks_lock;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
+    QemuMutex calls_lock;
     QLIST_HEAD(, BlockCopyCallState) calls;
     /* State fields that use a thread-safe API */
     BdrvDirtyBitmap *copy_bitmap;
@@ -289,6 +291,7 @@ void block_copy_state_free(BlockCopyState *s)
     }
 
     ratelimit_destroy(&s->rate_limit);
+    qemu_mutex_destroy(&s->calls_lock);
     bdrv_release_dirty_bitmap(s->copy_bitmap);
     shres_destroy(s->mem);
     g_free(s);
@@ -349,6 +352,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->tasks_lock);
+    qemu_mutex_init(&s->calls_lock);
     QLIST_INIT(&s->tasks);
     QLIST_INIT(&s->calls);
 
@@ -492,11 +496,14 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
 
     ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
                              &error_is_read);
-    if (ret < 0 && !t->call_state->ret) {
-        t->call_state->ret = ret;
-        t->call_state->error_is_read = error_is_read;
-    } else {
-        progress_work_done(t->s->progress, t->bytes);
+
+    WITH_QEMU_LOCK_GUARD(&t->s->calls_lock) {
+        if (ret < 0 && !t->call_state->ret) {
+            t->call_state->ret = ret;
+            t->call_state->error_is_read = error_is_read;
+        } else {
+            progress_work_done(t->s->progress, t->bytes);
+        }
     }
     co_put_to_shres(t->s->mem, t->bytes);
     block_copy_task_end(t, ret);
@@ -740,7 +747,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
 
+    qemu_mutex_lock(&call_state->s->calls_lock);
     QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
+    qemu_mutex_unlock(&call_state->s->calls_lock);
 
     do {
         ret = block_copy_dirty_clusters(call_state);
@@ -767,7 +776,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
         call_state->cb(call_state->cb_opaque);
     }
 
+    qemu_mutex_lock(&call_state->s->calls_lock);
     QLIST_REMOVE(call_state, list);
+    qemu_mutex_unlock(&call_state->s->calls_lock);
 
     return ret;
 }
-- 
2.30.2


