Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317649F96B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:31:53 +0100 (CET)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQPw-00043S-3b
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmU-0004b7-Rq
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmP-0003Rk-Uw
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wX+3AwW6iYj+pDk0+pG3oFLfarjTAcAJI2uFQ6auxic=;
 b=N7MADZXrqNmSnCzWQnMgDqMFSqz2mwHfAo+tQthmIPwTUSROnr1s6YPYqmiH5BK7xVofzr
 5nXJaGEwd5wH/bh7MZX79ES61RBS2XDVCVwG7sGQ2mYTFypXtBXD4TmtyjOhCq8SEWyjF8
 Ny1BHn3BWy2s3s80Silw8CWdVkihlcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-7LBxFUP-OxatV0jfMjNJUw-1; Fri, 28 Jan 2022 06:50:52 -0500
X-MC-Unique: 7LBxFUP-OxatV0jfMjNJUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901338144E0;
 Fri, 28 Jan 2022 11:50:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 996B322DE3;
 Fri, 28 Jan 2022 11:50:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 15/19] commit and mirror: create new nodes using
 bdrv_get_aio_context, and not the job aiocontext
Date: Fri, 28 Jan 2022 06:50:27 -0500
Message-Id: <20220128115031.4061565-16-eesposit@redhat.com>
In-Reply-To: <20220128115031.4061565-1-eesposit@redhat.com>
References: <20220128115031.4061565-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are always using the given bs AioContext, so there is no need
to take the job ones (which is identical anyways).
This also reduces the point we need to check when protecting
job.aio_context field.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/commit.c | 4 ++--
 block/mirror.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index 2883a3ba52..3ea460fe4a 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -369,7 +369,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
         goto fail;
     }
 
-    s->base = blk_new(s->common.job.aio_context,
+    s->base = blk_new(bdrv_get_aio_context(bs),
                       base_perms,
                       BLK_PERM_CONSISTENT_READ
                       | BLK_PERM_WRITE_UNCHANGED);
@@ -381,7 +381,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     s->base_bs = base;
 
     /* Required permissions are already taken with block_job_add_bdrv() */
-    s->top = blk_new(s->common.job.aio_context, 0, BLK_PERM_ALL);
+    s->top = blk_new(bdrv_get_aio_context(bs), 0, BLK_PERM_ALL);
     ret = blk_insert_bs(s->top, top, errp);
     if (ret < 0) {
         goto fail;
diff --git a/block/mirror.c b/block/mirror.c
index 0a3eb712e6..28d137407c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1727,7 +1727,7 @@ static BlockJob *mirror_start_job(
         goto fail;
     }
 
-    s->target = blk_new(s->common.job.aio_context,
+    s->target = blk_new(bdrv_get_aio_context(bs),
                         target_perms, target_shared_perms);
     ret = blk_insert_bs(s->target, target, errp);
     if (ret < 0) {
-- 
2.31.1


