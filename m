Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788893655DB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:07:50 +0200 (CEST)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnIL-0005JY-HX
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYnFG-0003Km-Gj
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:04:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYnF7-0001nG-Tk
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618913069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5u4JVveU4wPN9ljUDLIMTGg2w9O2wvYyLwnAdertfl8=;
 b=caKfySEVd3MSCSFe2Ude2D+E/q/ZYgMFle50NMmtzUAhXR2SjvL9bhbZckPL4LuWF+k10o
 bL4pnh1cHcr4+CBCkx35Yvac0rGavStyNpWYN5Ev3A3K3y3KN9IhNABv4vaQaJ6GuQJjcu
 TTM6JNVEE5V+LCnZrYmd1RZ5BrXEWOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-GLQgPmX1M56Tzl9WzXXVBA-1; Tue, 20 Apr 2021 06:04:27 -0400
X-MC-Unique: GLQgPmX1M56Tzl9WzXXVBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A81C581744F;
 Tue, 20 Apr 2021 10:04:26 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-20.ams2.redhat.com
 [10.36.114.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E7E25C1C4;
 Tue, 20 Apr 2021 10:04:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 2/3] block-copy: add a CoMutex to the BlockCopyTask list
Date: Tue, 20 Apr 2021 12:04:15 +0200
Message-Id: <20210420100416.30713-3-eesposit@redhat.com>
In-Reply-To: <20210420100416.30713-1-eesposit@redhat.com>
References: <20210420100416.30713-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because the list of tasks is only modified by coroutine
functions, add a CoMutex in order to protect the list of tasks.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 03df50a354..e785ac57e0 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -65,7 +65,9 @@ typedef struct BlockCopyTask {
     BlockCopyState *s;
     BlockCopyCallState *call_state;
 
-    /* State */
+    /* State. These fields are protected by the tasks_lock
+     * in BlockCopyState
+     */
     int64_t offset;
     int64_t bytes;
     bool zeroes;
@@ -95,6 +97,8 @@ typedef struct BlockCopyState {
     bool use_copy_range;
     int64_t copy_size;
     uint64_t len;
+
+    CoMutex tasks_lock;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
     QLIST_HEAD(, BlockCopyCallState) calls;
 
@@ -124,6 +128,7 @@ typedef struct BlockCopyState {
     RateLimit rate_limit;
 } BlockCopyState;
 
+/* Called with lock held */
 static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
                                             int64_t offset, int64_t bytes)
 {
@@ -145,13 +150,19 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
 static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
                                              int64_t bytes)
 {
-    BlockCopyTask *task = find_conflicting_task(s, offset, bytes);
+    BlockCopyTask *task;
+
+    qemu_co_mutex_lock(&s->tasks_lock);
+    task = find_conflicting_task(s, offset, bytes);
 
     if (!task) {
+        qemu_co_mutex_unlock(&s->tasks_lock);
         return false;
     }
 
-    qemu_co_queue_wait(&task->wait_queue, NULL);
+    qemu_co_queue_wait(&task->wait_queue, &s->tasks_lock);
+
+    qemu_co_mutex_unlock(&s->tasks_lock);
 
     return true;
 }
@@ -178,7 +189,9 @@ static BlockCopyTask *coroutine_fn block_copy_task_create(BlockCopyState *s,
     bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
 
     /* region is dirty, so no existent tasks possible in it */
+    qemu_co_mutex_lock(&s->tasks_lock);
     assert(!find_conflicting_task(s, offset, bytes));
+    qemu_co_mutex_unlock(&s->tasks_lock);
 
     bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
     s->in_flight_bytes += bytes;
@@ -192,8 +205,9 @@ static BlockCopyTask *coroutine_fn block_copy_task_create(BlockCopyState *s,
         .bytes = bytes,
     };
     qemu_co_queue_init(&task->wait_queue);
+    qemu_co_mutex_lock(&s->tasks_lock);
     QLIST_INSERT_HEAD(&s->tasks, task, list);
-
+    qemu_co_mutex_unlock(&s->tasks_lock);
     return task;
 }
 
@@ -297,6 +311,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
 
     QLIST_INIT(&s->tasks);
+    qemu_co_mutex_init(&s->tasks_lock);
     QLIST_INIT(&s->calls);
 
     return s;
-- 
2.30.2


