Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C5424143
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:26:10 +0200 (CEST)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8o5-000232-Ld
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8i4-0001Kl-Ke
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mY8i2-0007Hv-IP
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633533594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZFNMdyBoIFfE6GFH5aVoLY9vW1bHxnJTqIyfRbh1AY=;
 b=Cei3VhHOA0QqN7nnXYNVdqAQHZc7Si0bo4tmpg4j3qQum1LZs+hq5s4P8Z9/oet22Z+Nl/
 rF3PYEgYSyjueyicXObpdDgrAX+KgchjwXMpzW9dZMN7E5eTci/H3m1t47FagVmgG1k96B
 caQqHtpQ2z3p44tBBsNqKG1U9NB4hJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-9199ZKmmOA2BppFaLa-Jbw-1; Wed, 06 Oct 2021 11:19:50 -0400
X-MC-Unique: 9199ZKmmOA2BppFaLa-Jbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF7B110168CB;
 Wed,  6 Oct 2021 15:19:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97C505D9C6;
 Wed,  6 Oct 2021 15:19:49 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 03/13] mirror: Drop s->synced
Date: Wed,  6 Oct 2021 17:19:30 +0200
Message-Id: <20211006151940.214590-4-hreitz@redhat.com>
In-Reply-To: <20211006151940.214590-1-hreitz@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of HEAD^, there is no meaning to s->synced other than whether the job
is READY or not.  job_is_ready() gives us that information, too.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index b367b29324..035106bbb4 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -56,7 +56,6 @@ typedef struct MirrorBlockJob {
     bool zero_target;
     MirrorCopyMode copy_mode;
     BlockdevOnError on_source_error, on_target_error;
-    bool synced;
     /* Set when the target is synced (dirty bitmap is clean, nothing
      * in flight) and the job is running in active mode */
     bool actively_synced;
@@ -943,7 +942,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
     if (s->bdev_length == 0) {
         /* Transition to the READY state and wait for complete. */
         job_transition_to_ready(&s->common.job);
-        s->synced = true;
         s->actively_synced = true;
         while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
@@ -1035,7 +1033,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         should_complete = false;
         if (s->in_flight == 0 && cnt == 0) {
             trace_mirror_before_flush(s);
-            if (!s->synced) {
+            if (!job_is_ready(&s->common.job)) {
                 if (mirror_flush(s) < 0) {
                     /* Go check s->ret.  */
                     continue;
@@ -1046,7 +1044,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
                  * the target in a consistent state.
                  */
                 job_transition_to_ready(&s->common.job);
-                s->synced = true;
                 if (s->copy_mode != MIRROR_COPY_MODE_BACKGROUND) {
                     s->actively_synced = true;
                 }
@@ -1090,14 +1087,15 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
 
         ret = 0;
 
-        if (s->synced && !should_complete) {
+        if (job_is_ready(&s->common.job) && !should_complete) {
             delay_ns = (s->in_flight == 0 &&
                         cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
         }
-        trace_mirror_before_sleep(s, cnt, s->synced, delay_ns);
+        trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
+                                  delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
         if (job_is_cancelled(&s->common.job) &&
-            (!s->synced || s->common.job.force_cancel))
+            (!job_is_ready(&s->common.job) || s->common.job.force_cancel))
         {
             break;
         }
@@ -1110,8 +1108,9 @@ immediate_exit:
          * or it was cancelled prematurely so that we do not guarantee that
          * the target is a copy of the source.
          */
-        assert(ret < 0 || ((s->common.job.force_cancel || !s->synced) &&
-               job_is_cancelled(&s->common.job)));
+        assert(ret < 0 ||
+               ((s->common.job.force_cancel || !job_is_ready(&s->common.job)) &&
+                job_is_cancelled(&s->common.job)));
         assert(need_drain);
         mirror_wait_for_all_io(s);
     }
@@ -1134,7 +1133,7 @@ static void mirror_complete(Job *job, Error **errp)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
 
-    if (!s->synced) {
+    if (!job_is_ready(job)) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
-- 
2.31.1


