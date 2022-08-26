Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A665A2897
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:31:18 +0200 (CEST)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZQa-0002Q6-Qd
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZH7-00011O-Pk
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGx-0003zO-1I
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJMEDRs6Y5f7Uh0a9VV4p2JYN9JIvhqSQDPRyxh/dQ0=;
 b=dy3bqMgFWP1cfHEgQ+keX3ZiaUxJ7nsfL5ZJPZfOJJYteTORYsmYp/5MLf08cGPwu3qGmy
 9qpJ9igMid1abFW7DE+js6OgxLbdGgNdiLk/4JLel9LsLO/2dC64tgTQX1xYBsoRIFK1WD
 7pi0SbagKsgc5Ms0zROLYNFtG2dovhA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-KucgsLEeMjGWpWGo1-pQ-g-1; Fri, 26 Aug 2022 09:21:14 -0400
X-MC-Unique: KucgsLEeMjGWpWGo1-pQ-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8F6B3810D39;
 Fri, 26 Aug 2022 13:21:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98329492C3B;
 Fri, 26 Aug 2022 13:21:13 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v11 16/21] blockjob: protect iostatus field in BlockJob struct
Date: Fri, 26 Aug 2022 09:20:59 -0400
Message-Id: <20220826132104.3678958-17-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

iostatus is the only field (together with .job) that needs
protection using the job mutex.

It is set in the main loop (GLOBAL_STATE functions) but read
in I/O code (block_job_error_action).

In order to protect it, change block_job_iostatus_set_err
to block_job_iostatus_set_err_locked(), always called under
job lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 7 +++++--
 blockjob.c     | 5 +++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index c6bf7f40ce..7e32ee1d31 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -893,7 +893,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *bs = s->mirror_top_bs->backing->bs;
     BlockDriverState *target_bs = blk_bs(s->target);
-    bool need_drain = true;
+    bool need_drain = true, iostatus;
     int64_t length;
     int64_t target_length;
     BlockDriverInfo bdi;
@@ -1016,8 +1016,11 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
          * We do so every BLKOCK_JOB_SLICE_TIME nanoseconds, or when there is
          * an error, or when the source is clean, whichever comes first. */
         delta = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) - s->last_pause_ns;
+        WITH_JOB_LOCK_GUARD() {
+            iostatus = s->common.iostatus;
+        }
         if (delta < BLOCK_JOB_SLICE_TIME &&
-            s->common.iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
+            iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
             if (s->in_flight >= MAX_IN_FLIGHT || s->buf_free_count == 0 ||
                 (cnt == 0 && s->in_flight > 0)) {
                 trace_mirror_yield(s, cnt, s->buf_free_count, s->in_flight);
diff --git a/blockjob.c b/blockjob.c
index d8fb5311c7..d04f804001 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -363,7 +363,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     return block_job_query_locked(job, errp);
 }
 
-static void block_job_iostatus_set_err(BlockJob *job, int error)
+/* Called with job lock held */
+static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
 {
     if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
         job->iostatus = error == ENOSPC ? BLOCK_DEVICE_IO_STATUS_NOSPACE :
@@ -577,8 +578,8 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                  */
                 job->job.user_paused = true;
             }
+            block_job_iostatus_set_err_locked(job, error);
         }
-        block_job_iostatus_set_err(job, error);
     }
     return action;
 }
-- 
2.31.1


