Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F92332BAF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:14:34 +0100 (CET)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJf0D-0001e1-WD
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJefD-00048K-3Z
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeey-0000zV-4P
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72blwyRSZcGO+RvnOk6g8brAdoEJrFJiLZcbHhLJgEM=;
 b=SONMPr4Z+ST1QfmxQiTwtPo4epkuRDTc0jPsdgq9aZNtwTPEJk9Di5rEr6ODwb0kKhOrWK
 lMz/PDj9MWhvOwd6Yn10/9aQvjreh9goWJh/xZcSjuwY99YtIieoRTWT/sFar7ZuTuXxQh
 fCi2n8xdd6vIyOQ4MaTVUL/HWZZVd4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-k5gMDpqbOV-sNyaFFDVcUg-1; Tue, 09 Mar 2021 10:52:30 -0500
X-MC-Unique: k5gMDpqbOV-sNyaFFDVcUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A46DB804334;
 Tue,  9 Mar 2021 15:52:28 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0862F19C46;
 Tue,  9 Mar 2021 15:52:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/17] blockjob: return status from block_job_set_speed()
Date: Tue,  9 Mar 2021 09:51:55 -0600
Message-Id: <20210309155202.1312571-11-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "open list:Block Jobs" <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Better to return status together with setting errp. It allows to avoid
error propagation in the caller.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210202124956.63146-8-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/blockjob.h |  2 +-
 blockjob.c               | 18 ++++++++----------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 35faa3aa2687..d200f33c1029 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -139,7 +139,7 @@ bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs);
  * Set a rate-limiting parameter for the job; the actual meaning may
  * vary depending on the job type.
  */
-void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
+bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);

 /**
  * block_job_query:
diff --git a/blockjob.c b/blockjob.c
index f2feff051d7e..9e0ffd8dc9c5 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -258,18 +258,18 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }

-void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
     const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;

-    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp)) {
-        return;
+    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
+        return false;
     }
     if (speed < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "speed",
                    "a non-negative value");
-        return;
+        return false;
     }

     ratelimit_set_speed(&job->limit, speed, BLOCK_JOB_SLICE_TIME);
@@ -281,11 +281,13 @@ void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     }

     if (speed && speed <= old_speed) {
-        return;
+        return true;
     }

     /* kick only if a timer is pending */
     job_enter_cond(&job->job, job_timer_pending);
+
+    return true;
 }

 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
@@ -458,12 +460,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,

     /* Only set speed when necessary to avoid NotSupported error */
     if (speed != 0) {
-        Error *local_err = NULL;
-
-        block_job_set_speed(job, speed, &local_err);
-        if (local_err) {
+        if (!block_job_set_speed(job, speed, errp)) {
             job_early_fail(&job->job);
-            error_propagate(errp, local_err);
             return NULL;
         }
     }
-- 
2.30.1


