Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311183040EE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:52:36 +0100 (CET)
Received: from localhost ([::1]:57936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Phr-0001nB-6g
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDy-0000gs-10
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDp-0006Lq-J8
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Te0Bnw0h6LemAUq1Xba7rXi2PY/Z+dGtn8tO2ZVRfyQ=;
 b=EAgv8RL7I79eGM5vVLKYtfHSANVUGZssqo0fVTSxlbr2yFBCwiPAUCX9yN2IMbRYZz22Tl
 rsd5fJ4B2c/oBn97JG+0jk5Cr8DredjQPEcAgCpjonJ75on45vV8AWpbz4rwjbYttu88t9
 tZqA9nVpxoI+eKTdzB7dHqrXbsl/N88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-U_dlHRVZNYqzK14x-nKTkA-1; Tue, 26 Jan 2021 09:21:30 -0500
X-MC-Unique: U_dlHRVZNYqzK14x-nKTkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75153180E461;
 Tue, 26 Jan 2021 14:21:29 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBE5110023B2;
 Tue, 26 Jan 2021 14:21:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 31/53] block/block-copy: add ratelimit to block-copy
Date: Tue, 26 Jan 2021 15:19:54 +0100
Message-Id: <20210126142016.806073-32-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to directly use one async block-copy operation for backup
job, so we need rate limiter.

We want to maintain current backup behavior: only background copying is
limited and copy-before-write operations only participate in limit
calculation. Therefore we need one rate limiter for block-copy state
and boolean flag for block-copy call state for actual limitation.

Note, that we can't just calculate each chunk in limiter after
successful copying: it will not save us from starting a lot of async
sub-requests which will exceed limit too much. Instead let's use the
following scheme on sub-request creation:
1. If at the moment limit is not exceeded, create the request and
account it immediately.
2. If at the moment limit is already exceeded, drop create sub-request
and handle limit instead (by sleep).
With this approach we'll never exceed the limit more than by one
sub-request (which pretty much matches current backup behavior).

Note also, that if there is in-flight block-copy async call,
block_copy_kick() should be used after set-speed to apply new setup
faster. For that block_copy_kick() published in this patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-7-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  5 ++++-
 block/backup-top.c         |  2 +-
 block/backup.c             |  2 +-
 block/block-copy.c         | 46 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 22372aa375..b5a53ad59e 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -41,7 +41,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool *error_is_read);
+                            bool ignore_ratelimit, bool *error_is_read);
 
 /*
  * Run block-copy in a coroutine, create corresponding BlockCopyCallState
@@ -76,6 +76,9 @@ bool block_copy_call_succeeded(BlockCopyCallState *call_state);
 bool block_copy_call_failed(BlockCopyCallState *call_state);
 int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read);
 
+void block_copy_set_speed(BlockCopyState *s, uint64_t speed);
+void block_copy_kick(BlockCopyCallState *call_state);
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
diff --git a/block/backup-top.c b/block/backup-top.c
index 789acf6965..779956ddc2 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -61,7 +61,7 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     off = QEMU_ALIGN_DOWN(offset, s->cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, s->cluster_size);
 
-    return block_copy(s->bcs, off, end - off, NULL);
+    return block_copy(s->bcs, off, end - off, true, NULL);
 }
 
 static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
diff --git a/block/backup.c b/block/backup.c
index 4b07e9115d..09ff5a92ef 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -72,7 +72,7 @@ static int coroutine_fn backup_do_cow(BackupBlockJob *job,
 
     trace_backup_do_cow_enter(job, start, offset, bytes);
 
-    ret = block_copy(job->bcs, start, end - start, error_is_read);
+    ret = block_copy(job->bcs, start, end - start, true, error_is_read);
 
     trace_backup_do_cow_return(job, offset, bytes, ret);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 6bf1735b93..fa27450b14 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -26,6 +26,7 @@
 #define BLOCK_COPY_MAX_BUFFER (1 * MiB)
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
+#define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
 
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
@@ -36,6 +37,7 @@ typedef struct BlockCopyCallState {
     int64_t bytes;
     int max_workers;
     int64_t max_chunk;
+    bool ignore_ratelimit;
     BlockCopyAsyncCallbackFunc cb;
     void *cb_opaque;
 
@@ -48,6 +50,7 @@ typedef struct BlockCopyCallState {
     /* State */
     int ret;
     bool finished;
+    QemuCoSleepState *sleep_state;
 
     /* OUT parameters */
     bool error_is_read;
@@ -111,6 +114,9 @@ typedef struct BlockCopyState {
     void *progress_opaque;
 
     SharedResource *mem;
+
+    uint64_t speed;
+    RateLimit rate_limit;
 } BlockCopyState;
 
 static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
@@ -623,6 +629,21 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         }
         task->zeroes = ret & BDRV_BLOCK_ZERO;
 
+        if (s->speed) {
+            if (!call_state->ignore_ratelimit) {
+                uint64_t ns = ratelimit_calculate_delay(&s->rate_limit, 0);
+                if (ns > 0) {
+                    block_copy_task_end(task, -EAGAIN);
+                    g_free(task);
+                    qemu_co_sleep_ns_wakeable(QEMU_CLOCK_REALTIME, ns,
+                                              &call_state->sleep_state);
+                    continue;
+                }
+            }
+
+            ratelimit_calculate_delay(&s->rate_limit, task->bytes);
+        }
+
         trace_block_copy_process(s, task->offset);
 
         co_get_from_shres(s->mem, task->bytes);
@@ -661,6 +682,13 @@ out:
     return ret < 0 ? ret : found_dirty;
 }
 
+void block_copy_kick(BlockCopyCallState *call_state)
+{
+    if (call_state->sleep_state) {
+        qemu_co_sleep_wake(call_state->sleep_state);
+    }
+}
+
 /*
  * block_copy_common
  *
@@ -707,12 +735,13 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 }
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
-                            bool *error_is_read)
+                            bool ignore_ratelimit, bool *error_is_read)
 {
     BlockCopyCallState call_state = {
         .s = s,
         .offset = start,
         .bytes = bytes,
+        .ignore_ratelimit = ignore_ratelimit,
         .max_workers = BLOCK_COPY_MAX_WORKERS,
     };
 
@@ -798,3 +827,18 @@ void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 {
     s->skip_unallocated = skip;
 }
+
+void block_copy_set_speed(BlockCopyState *s, uint64_t speed)
+{
+    s->speed = speed;
+    if (speed > 0) {
+        ratelimit_set_speed(&s->rate_limit, speed, BLOCK_COPY_SLICE_TIME);
+    }
+
+    /*
+     * Note: it's good to kick all call states from here, but it should be done
+     * only from a coroutine, to not crash if s->calls list changed while
+     * entering one call. So for now, the only user of this function kicks its
+     * only one call_state by hand.
+     */
+}
-- 
2.29.2


