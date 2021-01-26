Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC83040C7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:47:45 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PdA-00044Y-1E
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDz-0000kJ-3P
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDv-0006Ps-Kw
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8I343F87SzldhtZBHfZ7D5Rzx/JIzGMENX5Sv8eWw9I=;
 b=L2oifpi4rgPNjWaSEM1Dz4pGOeRIEDAX/l0dlZLLC61RvOuU9bY3MjvXdIzbj7nFQTGNGt
 zqvtbrIeqPXSfVO6US4VujjgOBkaxgR/o1j6BohBVc6h65TEO5QrFVMvoWCvHewEiiT7/s
 ng5KIdevlIa3vMS9PUfGkZjiUCx23Cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-1_w8jU9PNliMcJZzllVtcQ-1; Tue, 26 Jan 2021 09:21:34 -0500
X-MC-Unique: 1_w8jU9PNliMcJZzllVtcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEEE81823DCE;
 Tue, 26 Jan 2021 14:21:33 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F9C419726;
 Tue, 26 Jan 2021 14:21:33 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 33/53] blockjob: add set_speed to BlockJobDriver
Date: Tue, 26 Jan 2021 15:19:56 +0100
Message-Id: <20210126142016.806073-34-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We are going to use async block-copy call in backup, so we'll need to
passthrough setting backup speed to block-copy call.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-9-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
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
index 98ac8af982..db3a21699c 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -256,6 +256,7 @@ static bool job_timer_pending(Job *job)
 
 void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
+    const BlockJobDriver *drv = block_job_driver(job);
     int64_t old_speed = job->speed;
 
     if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp)) {
@@ -270,6 +271,11 @@ void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
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
2.29.2


