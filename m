Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D6CFDFF2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 15:22:47 +0100 (CET)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVcUo-0002ei-Jy
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 09:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iVcNK-0004dQ-Tr
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 09:15:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iVcNJ-0001xu-QZ
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 09:15:02 -0500
Received: from relay.sw.ru ([185.231.240.75]:47416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iVcNG-0001ru-GU; Fri, 15 Nov 2019 09:14:59 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iVcNC-0006WW-Dg; Fri, 15 Nov 2019 17:14:54 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [RFC 19/24] blockjob: add set_speed to BlockJobDriver
Date: Fri, 15 Nov 2019 17:14:39 +0300
Message-Id: <20191115141444.24155-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191115141444.24155-1-vsementsov@virtuozzo.com>
References: <20191115141444.24155-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, ehabkost@redhat.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, armbru@redhat.com,
 qemu-devel@nongnu.org, jsnow@redhat.com, crosa@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to use async block-copy call in backup, so we'll need to
passthrough setting backup speed to block-copy call.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/blockjob_int.h | 2 ++
 blockjob.c                   | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index e2824a36a8..6633d83da2 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -52,6 +52,8 @@ struct BlockJobDriver {
      * besides job->blk to the new AioContext.
      */
     void (*attached_aio_context)(BlockJob *job, AioContext *new_context);
+
+    void (*set_speed)(BlockJob *job, int64_t speed);
 };
 
 /**
diff --git a/blockjob.c b/blockjob.c
index c6e20e2fcd..3b827d420d 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -255,6 +255,7 @@ static bool job_timer_pending(Job *job)
 
 void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
+    const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
 
     if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp)) {
@@ -268,6 +269,11 @@ void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
     ratelimit_set_speed(&job->limit, speed, BLOCK_JOB_SLICE_TIME);
 
     job->speed = speed;
+
+    if (drv->set_speed) {
+        drv->set_speed(job, speed);
+    }
+
     if (speed && speed <= old_speed) {
         return;
     }
-- 
2.21.0


