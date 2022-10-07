Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0D5F780A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:39:24 +0200 (CEST)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmdP-0008CI-Er
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuO-0005y1-7O
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuM-0003JW-IM
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eN7TGtlCeGpaR7gIw93tHCnGlJGEy5lfCRCdxpl8RA=;
 b=JTFC8P77NsMZKbuBfkhwEkyxMoQV2cg4XMAjGcl9xrrx0LgZlb7eNcE8Lrbe8tyHPBNn7a
 ULlpDAsewgDjUwYsdrY8LPFmGhyl237pyZr2KmvYvJOu9ZwlBvxhhwZzmLXcX7UDe32IHx
 UnY8JV7L1Zy/ycuKKzWqO5Gg6iR6zic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-cldxWwbjNtyGqW4zYlK3vA-1; Fri, 07 Oct 2022 06:48:44 -0400
X-MC-Unique: cldxWwbjNtyGqW4zYlK3vA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D11F85A583;
 Fri,  7 Oct 2022 10:48:44 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A3A9200C0DE;
 Fri,  7 Oct 2022 10:48:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 44/50] blockjob: protect iostatus field in BlockJob struct
Date: Fri,  7 Oct 2022 12:47:46 +0200
Message-Id: <20221007104752.141361-45-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

iostatus is the only field (together with .job) that needs
protection using the job mutex.

It is set in the main loop (GLOBAL_STATE functions) but read
in I/O code (block_job_error_action).

In order to protect it, change block_job_iostatus_set_err
to block_job_iostatus_set_err_locked(), always called under
job lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220926093214.506243-17-eesposit@redhat.com>
[kwolf: Fixed up type of iostatus]
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 6 +++++-
 blockjob.c     | 5 +++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index c6bf7f40ce..80c0109d39 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -894,6 +894,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
     BlockDriverState *bs = s->mirror_top_bs->backing->bs;
     BlockDriverState *target_bs = blk_bs(s->target);
     bool need_drain = true;
+    BlockDeviceIoStatus iostatus;
     int64_t length;
     int64_t target_length;
     BlockDriverInfo bdi;
@@ -1016,8 +1017,11 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
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
2.37.3


