Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C030406A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:35:39 +0100 (CET)
Received: from localhost ([::1]:44550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PRS-0000Fh-I9
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDZ-000064-BS
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDQ-00067h-R9
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gUQ20ql6ShadmhmheKzCZU4Llt1nLykVGW8nByQvVms=;
 b=FQlP0bdfw3y5HzA7V9oGCkoohmI3/Or13KrnY2JApYe9WChiCJC05+PLRW1hIhXEweKBf0
 Tr8ZdGa47CPXgvpArxjZKacL7Jndon/lQbcrG1nQoWIYFX8kM51Tc36lNBR9eLxI0Cq2x4
 kihvCr5neRCUnEjWFkPl12OiGx57Xuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-xUrCRdbsMLiXoXPIaaThFQ-1; Tue, 26 Jan 2021 09:21:02 -0500
X-MC-Unique: xUrCRdbsMLiXoXPIaaThFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A1E800592;
 Tue, 26 Jan 2021 14:20:41 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FB6510023AB;
 Tue, 26 Jan 2021 14:20:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/53] stream: rework backing-file changing
Date: Tue, 26 Jan 2021 15:19:33 +0100
Message-Id: <20210126142016.806073-11-mreitz@redhat.com>
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Stream in stream_prepare calls bdrv_change_backing_file() to change
backing-file in the metadata of bs.

It may use either backing-file parameter given by user or just take
filename of base on job start.

Backing file format is determined by base on job finish.

There are some problems with this design, we solve only two by this
patch:

1. Consider scenario with backing-file unset. Current concept of stream
supports changing of the base during the job (we don't freeze link to
the base). So, we should not save base filename at job start,

  - let's determine name of the base on job finish.

2. Using direct base to determine filename and format is not very good:
base node may be a filter, so its filename may be JSON, and format_name
is not good for storing into qcow2 metadata as backing file format.

  - let's use unfiltered_base

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  [vsementsov: change commit subject, change logic in stream_prepare]
Message-Id: <20201216061703.70908-10-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/stream.c | 9 +++++----
 blockdev.c     | 8 +-------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 6e281c71ac..6a525a5edf 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -65,6 +65,7 @@ static int stream_prepare(Job *job)
     BlockDriverState *bs = blk_bs(bjob->blk);
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
     BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
+    BlockDriverState *unfiltered_base = bdrv_skip_filters(base);
     Error *local_err = NULL;
     int ret = 0;
 
@@ -73,10 +74,10 @@ static int stream_prepare(Job *job)
 
     if (bdrv_cow_child(unfiltered_bs)) {
         const char *base_id = NULL, *base_fmt = NULL;
-        if (base) {
-            base_id = s->backing_file_str;
-            if (base->drv) {
-                base_fmt = base->drv->format_name;
+        if (unfiltered_base) {
+            base_id = s->backing_file_str ?: unfiltered_base->filename;
+            if (unfiltered_base->drv) {
+                base_fmt = unfiltered_base->drv->format_name;
             }
         }
         bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
diff --git a/blockdev.c b/blockdev.c
index e496356e10..8c03de582c 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2511,7 +2511,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     BlockDriverState *base_bs = NULL;
     AioContext *aio_context;
     Error *local_err = NULL;
-    const char *base_name = NULL;
     int job_flags = JOB_DEFAULT;
 
     if (!has_on_error) {
@@ -2539,7 +2538,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
             goto out;
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
-        base_name = base;
     }
 
     if (has_base_node) {
@@ -2554,7 +2552,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
         bdrv_refresh_filename(base_bs);
-        base_name = base_bs->filename;
     }
 
     /* Check for op blockers in the whole chain between bs and base */
@@ -2574,9 +2571,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         goto out;
     }
 
-    /* backing_file string overrides base bs filename */
-    base_name = has_backing_file ? backing_file : base_name;
-
     if (has_auto_finalize && !auto_finalize) {
         job_flags |= JOB_MANUAL_FINALIZE;
     }
@@ -2584,7 +2578,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         job_flags |= JOB_MANUAL_DISMISS;
     }
 
-    stream_start(has_job_id ? job_id : NULL, bs, base_bs, base_name,
+    stream_start(has_job_id ? job_id : NULL, bs, base_bs, backing_file,
                  job_flags, has_speed ? speed : 0, on_error,
                  filter_node_name, &local_err);
     if (local_err) {
-- 
2.29.2


