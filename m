Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898EB6230C6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:56:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoMG-0005pU-Ny; Wed, 09 Nov 2022 11:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM9-0005mQ-JA
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM7-0007D0-6x
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668012914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+SaDJyh8u65L6WmNX4P9dHWfAjiiCMvWED/Ot9+1Jk=;
 b=czgkuOHcGVEiVMduiLEmtURduAiP5BLeDKgzl5FgufQwE+sHlxILlR+I85oc3O1lVTIzAL
 vZ+2+c0FkZN7Oc5SZd/782mIprmP3gmf3MslUXZarU7GiVMYg/jiB/pz+Ab7IXE2R8crNw
 B5WA9rJMr14+ywelIlObfJhuk5REljc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-9ZoWYkqiPry_qJYMsOKuhw-1; Wed, 09 Nov 2022 11:55:12 -0500
X-MC-Unique: 9ZoWYkqiPry_qJYMsOKuhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 049422823825;
 Wed,  9 Nov 2022 16:54:56 +0000 (UTC)
Received: from localhost (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B20932024CC6;
 Wed,  9 Nov 2022 16:54:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH for-7.2 1/5] block/mirror: Do not wait for active writes
Date: Wed,  9 Nov 2022 17:54:48 +0100
Message-Id: <20221109165452.67927-2-hreitz@redhat.com>
In-Reply-To: <20221109165452.67927-1-hreitz@redhat.com>
References: <20221109165452.67927-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Waiting for all active writes to settle before daring to create a
background copying operation means that we will never do background
operations while the guest does anything (in write-blocking mode), and
therefore cannot converge.  Yes, we also will not diverge, but actually
converging would be even nicer.

It is unclear why we did decide to wait for all active writes to settle
before creating a background operation, but it just does not seem
necessary.  Active writes will put themselves into the in_flight bitmap
and thus properly block actually conflicting background requests.

It is important for active requests to wait on overlapping background
requests, which we do in active_write_prepare().  However, so far it was
not documented why it is important.  Add such documentation now, and
also to the other call of mirror_wait_on_conflicts(), so that it becomes
more clear why and when requests need to actively wait for other
requests to settle.

Another thing to note is that of course we need to ensure that there are
no active requests when the job completes, but that is done by virtue of
the BDS being drained anyway, so there cannot be any active requests at
that point.

With this change, we will need to explicitly keep track of how many
bytes are in flight in active requests so that
job_progress_set_remaining() in mirror_run() can set the correct number
of remaining bytes.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2123297
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/mirror.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 1a75a47cc3..e5467b0053 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -82,6 +82,7 @@ typedef struct MirrorBlockJob {
     int max_iov;
     bool initial_zeroing_ongoing;
     int in_active_write_counter;
+    int64_t active_write_bytes_in_flight;
     bool prepared;
     bool in_drain;
 } MirrorBlockJob;
@@ -494,6 +495,13 @@ static uint64_t coroutine_fn mirror_iteration(MirrorBlockJob *s)
     }
     bdrv_dirty_bitmap_unlock(s->dirty_bitmap);
 
+    /*
+     * Wait for concurrent requests to @offset.  The next loop will limit the
+     * copied area based on in_flight_bitmap so we only copy an area that does
+     * not overlap with concurrent in-flight requests.  Still, we would like to
+     * copy something, so wait until there are at least no more requests to the
+     * very beginning of the area.
+     */
     mirror_wait_on_conflicts(NULL, s, offset, 1);
 
     job_pause_point(&s->common.job);
@@ -988,12 +996,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         int64_t cnt, delta;
         bool should_complete;
 
-        /* Do not start passive operations while there are active
-         * writes in progress */
-        while (s->in_active_write_counter) {
-            mirror_wait_for_any_operation(s, true);
-        }
-
         if (s->ret < 0) {
             ret = s->ret;
             goto immediate_exit;
@@ -1010,7 +1012,9 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         /* cnt is the number of dirty bytes remaining and s->bytes_in_flight is
          * the number of bytes currently being processed; together those are
          * the current remaining operation length */
-        job_progress_set_remaining(&s->common.job, s->bytes_in_flight + cnt);
+        job_progress_set_remaining(&s->common.job,
+                                   s->bytes_in_flight + cnt +
+                                   s->active_write_bytes_in_flight);
 
         /* Note that even when no rate limit is applied we need to yield
          * periodically with no pending I/O so that bdrv_drain_all() returns.
@@ -1071,6 +1075,10 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
 
             s->in_drain = true;
             bdrv_drained_begin(bs);
+
+            /* Must be zero because we are drained */
+            assert(s->in_active_write_counter == 0);
+
             cnt = bdrv_get_dirty_count(s->dirty_bitmap);
             if (cnt > 0 || mirror_flush(s) < 0) {
                 bdrv_drained_end(bs);
@@ -1306,6 +1314,7 @@ do_sync_target_write(MirrorBlockJob *job, MirrorMethod method,
     }
 
     job_progress_increase_remaining(&job->common.job, bytes);
+    job->active_write_bytes_in_flight += bytes;
 
     switch (method) {
     case MIRROR_METHOD_COPY:
@@ -1327,6 +1336,7 @@ do_sync_target_write(MirrorBlockJob *job, MirrorMethod method,
         abort();
     }
 
+    job->active_write_bytes_in_flight -= bytes;
     if (ret >= 0) {
         job_progress_update(&job->common.job, bytes);
     } else {
@@ -1375,6 +1385,19 @@ static MirrorOp *coroutine_fn active_write_prepare(MirrorBlockJob *s,
 
     s->in_active_write_counter++;
 
+    /*
+     * Wait for concurrent requests affecting the area.  If there are already
+     * running requests that are copying off now-to-be stale data in the area,
+     * we must wait for them to finish before we begin writing fresh data to the
+     * target so that the write operations appear in the correct order.
+     * Note that background requests (see mirror_iteration()) in contrast only
+     * wait for conflicting requests at the start of the dirty area, and then
+     * (based on the in_flight_bitmap) truncate the area to copy so it will not
+     * conflict with any requests beyond that.  For active writes, however, we
+     * cannot truncate that area.  The request from our parent must be blocked
+     * until the area is copied in full.  Therefore, we must wait for the whole
+     * area to become free of concurrent requests.
+     */
     mirror_wait_on_conflicts(op, s, offset, bytes);
 
     bitmap_set(s->in_flight_bitmap, start_chunk, end_chunk - start_chunk);
-- 
2.36.1


