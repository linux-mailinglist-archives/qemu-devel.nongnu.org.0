Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98887322B42
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 14:13:36 +0100 (CET)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEXVP-0008In-Lu
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 08:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lEXTt-0007PC-8N
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lEXTq-0001UT-BJ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614085916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f0/PsLBk2wEVuk6NbmpKoLxmaQzlHbB8iYcGMlXa3Sw=;
 b=bJTwCaMd08mPMPa8KJsX6fFB2rBPI3OTpOnGaqrEQTBSsm43pVxuST/rS2ZiI0I8aSW201
 bCN6QgR7c+XVo27HnckVdoKyXxgd3NO3VF8TzsQeUtyFP55ZSn2oHUOYUBXV8E3Lhj2kNa
 M6UjdZDaeGdPvyLnDiktO4ZIEpEx+m0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-KMixxfaLPVWaOy35A9o1gw-1; Tue, 23 Feb 2021 08:11:54 -0500
X-MC-Unique: KMixxfaLPVWaOy35A9o1gw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48104801975;
 Tue, 23 Feb 2021 13:11:53 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-230.ams2.redhat.com
 [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D94AD5D6AB;
 Tue, 23 Feb 2021 13:11:51 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] blockjob: report a better error message
Date: Tue, 23 Feb 2021 14:11:50 +0100
Message-Id: <20210223131150.124867-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a block job fails, we report 'strerror(-job->job.ret)' error
message, also if the job set an error object.
Let's report a better error message using 'error_get_pretty(job->job.err)'.

If an error object was not set, strerror(-job->ret) is used as fallback,
as explained in include/qemu/job.h:

typedef struct Job {
    ...
    /**
     * Error object for a failed job.
     * If job->ret is nonzero and an error object was not set, it will be set
     * to strerror(-job->ret) during job_completed.
     */
    Error *err;
}

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 blockjob.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index f2feff051d..a696f3408d 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -319,7 +319,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
     info->auto_finalize = job->job.auto_finalize;
     info->auto_dismiss  = job->job.auto_dismiss;
     info->has_error = job->job.ret != 0;
-    info->error     = job->job.ret ? g_strdup(strerror(-job->job.ret)) : NULL;
+    info->error     = job->job.ret ?
+                        g_strdup(error_get_pretty(job->job.err)) : NULL;
     return info;
 }
 
@@ -356,7 +357,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
     }
 
     if (job->job.ret < 0) {
-        msg = strerror(-job->job.ret);
+        msg = error_get_pretty(job->job.err);
     }
 
     qapi_event_send_block_job_completed(job_type(&job->job),
-- 
2.29.2


