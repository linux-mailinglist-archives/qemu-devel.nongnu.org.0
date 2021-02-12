Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D19F31A614
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:33:09 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf7k-0006Qr-ET
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerq-0004QG-Rz
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerm-0003vE-SL
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh3v1M6YI7AQnqOodrG3tI7MkQ7UyPMVC1DxfFVpaO0=;
 b=GPP0kTTFRwfLa57LwV8OBniND3bODKf2xPLEwKlgpIbrnsHMiu0yfwFzrXXs62KlSySdNn
 foy1auIfp7x+AfhhzybXu4Y+ZqlGDaoFTGRIh81p8s8RnBC6pPXieIV/JkhJVJzYP/Ro98
 q93KzNS/iOH0cgg93EiITB/VCI+xoWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-8JvHjRc4MzKoLZQ25PlQfA-1; Fri, 12 Feb 2021 15:16:35 -0500
X-MC-Unique: 8JvHjRc4MzKoLZQ25PlQfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C213107ACFB;
 Fri, 12 Feb 2021 20:16:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F97C6B8E5;
 Fri, 12 Feb 2021 20:16:34 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/14] block/backup: implement .cancel job handler
Date: Fri, 12 Feb 2021 14:16:18 -0600
Message-Id: <20210212201619.1388255-14-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 John Snow <jsnow@redhat.com>, "open list:Block Jobs" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Cancel in-flight io on target to not waste the time.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210205163720.887197-10-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/backup.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/backup.c b/block/backup.c
index cc525d55445e..94e6dcd72e33 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -35,6 +35,7 @@ typedef struct BackupBlockJob {
     BlockJob common;
     BlockDriverState *backup_top;
     BlockDriverState *source_bs;
+    BlockDriverState *target_bs;

     BdrvDirtyBitmap *sync_bitmap;

@@ -329,6 +330,13 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
     }
 }

+static void backup_cancel(Job *job)
+{
+    BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
+
+    bdrv_cancel_in_flight(s->target_bs);
+}
+
 static const BlockJobDriver backup_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(BackupBlockJob),
@@ -340,6 +348,7 @@ static const BlockJobDriver backup_job_driver = {
         .abort                  = backup_abort,
         .clean                  = backup_clean,
         .pause                  = backup_pause,
+        .cancel                 = backup_cancel,
     },
     .set_speed = backup_set_speed,
 };
@@ -528,6 +537,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,

     job->backup_top = backup_top;
     job->source_bs = bs;
+    job->target_bs = target;
     job->on_source_error = on_source_error;
     job->on_target_error = on_target_error;
     job->sync_mode = sync_mode;
-- 
2.30.1


