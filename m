Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F540295A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:06:21 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNans-0005W5-E8
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRG-0005hR-76
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNaRE-0006Fk-Ip
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631018575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xvGHdrGHk6gfvbdNBhRwO+DXUzUVmFMkZFi5yV+iz8=;
 b=fHRUuNWO9vf1ZaFE7lm29tbKClA15yiybh3croE9B9CdAjPNfWiJcnhwrpuEtbwzWU3roC
 4DpWCg5BKkxQgEytA+VMu3q0ezr4r+VxiHWrv4GxAnomoJZRaeKwcc2jhXFUW+cNtoGLR5
 DPnT50hkCrDGoWL9ff/1aTxs7Cc1/vA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-AtI-scmGMZam_y1qMbPDXw-1; Tue, 07 Sep 2021 08:42:54 -0400
X-MC-Unique: AtI-scmGMZam_y1qMbPDXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDBA4100CD0D;
 Tue,  7 Sep 2021 12:42:53 +0000 (UTC)
Received: from localhost (unknown [10.39.193.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 867DE60BE5;
 Tue,  7 Sep 2021 12:42:53 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 03/12] mirror: Drop s->synced
Date: Tue,  7 Sep 2021 14:42:36 +0200
Message-Id: <20210907124245.143492-4-hreitz@redhat.com>
In-Reply-To: <20210907124245.143492-1-hreitz@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
index d73b704473..fcb7b65f93 100644
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
@@ -936,7 +935,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
     if (s->bdev_length == 0) {
         /* Transition to the READY state and wait for complete. */
         job_transition_to_ready(&s->common.job);
-        s->synced = true;
         s->actively_synced = true;
         while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
@@ -1028,7 +1026,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         should_complete = false;
         if (s->in_flight == 0 && cnt == 0) {
             trace_mirror_before_flush(s);
-            if (!s->synced) {
+            if (!job_is_ready(&s->common.job)) {
                 if (mirror_flush(s) < 0) {
                     /* Go check s->ret.  */
                     continue;
@@ -1039,7 +1037,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
                  * the target in a consistent state.
                  */
                 job_transition_to_ready(&s->common.job);
-                s->synced = true;
                 if (s->copy_mode != MIRROR_COPY_MODE_BACKGROUND) {
                     s->actively_synced = true;
                 }
@@ -1083,14 +1080,15 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
 
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
@@ -1103,8 +1101,9 @@ immediate_exit:
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
@@ -1127,7 +1126,7 @@ static void mirror_complete(Job *job, Error **errp)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
 
-    if (!s->synced) {
+    if (!job_is_ready(job)) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
-- 
2.31.1


