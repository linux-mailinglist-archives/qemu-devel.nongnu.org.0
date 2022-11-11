Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A62625E5B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVwn-000855-59; Fri, 11 Nov 2022 10:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwl-00083A-10
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwj-0000xW-J6
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668180477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hd0U4gtyaIaGU22uzmgf6PMttPPpzdkhG9V7Ia/RPHc=;
 b=UKFEgkY+YlZzQm5H8YBYEDq8BgonLiBNrR6BcFLrtq9vIbahRilLgXGeed0LsQw6bpNuib
 IFvFDzW1ED7Pm0y1hJGpf365SSMdKvAK0IBRbXBZKLXsGTSg5kQ7JcV9a3zSk7pxvNtk0w
 4sNiqrt0QTJlJRpZmM0jKVUaBggwwds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-Iknnls3uO_SSYMD9WemU6w-1; Fri, 11 Nov 2022 10:27:53 -0500
X-MC-Unique: Iknnls3uO_SSYMD9WemU6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BEE280A0AE;
 Fri, 11 Nov 2022 15:27:53 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F38DC15BA8;
 Fri, 11 Nov 2022 15:27:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/11] block/mirror: Fix NULL s->job in active writes
Date: Fri, 11 Nov 2022 16:27:36 +0100
Message-Id: <20221111152744.261358-4-kwolf@redhat.com>
In-Reply-To: <20221111152744.261358-1-kwolf@redhat.com>
References: <20221111152744.261358-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hanna Reitz <hreitz@redhat.com>

There is a small gap in mirror_start_job() before putting the mirror
filter node into the block graph (bdrv_append() call) and the actual job
being created.  Before the job is created, MirrorBDSOpaque.job is NULL.

It is possible that requests come in when bdrv_drained_end() is called,
and those requests would see MirrorBDSOpaque.job == NULL.  Have our
filter node handle that case gracefully.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221109165452.67927-4-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 5b6f42392c..251adc5ae0 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1438,11 +1438,13 @@ static int coroutine_fn bdrv_mirror_top_do_write(BlockDriverState *bs,
     MirrorOp *op = NULL;
     MirrorBDSOpaque *s = bs->opaque;
     int ret = 0;
-    bool copy_to_target;
+    bool copy_to_target = false;
 
-    copy_to_target = s->job->ret >= 0 &&
-                     !job_is_cancelled(&s->job->common.job) &&
-                     s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
+    if (s->job) {
+        copy_to_target = s->job->ret >= 0 &&
+                         !job_is_cancelled(&s->job->common.job) &&
+                         s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
+    }
 
     if (copy_to_target) {
         op = active_write_prepare(s->job, offset, bytes);
@@ -1487,11 +1489,13 @@ static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
     QEMUIOVector bounce_qiov;
     void *bounce_buf;
     int ret = 0;
-    bool copy_to_target;
+    bool copy_to_target = false;
 
-    copy_to_target = s->job->ret >= 0 &&
-                     !job_is_cancelled(&s->job->common.job) &&
-                     s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
+    if (s->job) {
+        copy_to_target = s->job->ret >= 0 &&
+                         !job_is_cancelled(&s->job->common.job) &&
+                         s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
+    }
 
     if (copy_to_target) {
         /* The guest might concurrently modify the data to write; but
-- 
2.38.1


