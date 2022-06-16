Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0E54E1F1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:28:48 +0200 (CEST)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pYF-0003e3-Im
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o1pOi-0005J4-Ml
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o1pOb-0007ZV-FZ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655385527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOPisGnzq61NrxsrGIdgBT7pO374tGQlU2DhkhUYj8E=;
 b=INfzLY5LOBZdTpLOBKufPhySd+HY/j9QQoHU1GkECgcfSCZt8bgvBW7e/dQT7xxUi589Ec
 kyNNbSRDkrUbwgudxKLuQ5C3IPlGlxppJkjQtJEpyqzSZB0y7Bd311d3Bn2nZmUyKN2Au5
 YWrzIWPB+kWwK/nXRlxQhWD/VrQKhXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-hw4pvg4qMLWD4kecOTVgRg-1; Thu, 16 Jun 2022 09:18:43 -0400
X-MC-Unique: hw4pvg4qMLWD4kecOTVgRg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A623B185A7A4;
 Thu, 16 Jun 2022 13:18:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5319C40334E;
 Thu, 16 Jun 2022 13:18:42 +0000 (UTC)
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
Subject: [PATCH v7 14/18] commit and mirror: create new nodes using
 bdrv_get_aio_context, and not the job aiocontext
Date: Thu, 16 Jun 2022 09:18:31 -0400
Message-Id: <20220616131835.2004262-15-eesposit@redhat.com>
In-Reply-To: <20220616131835.2004262-1-eesposit@redhat.com>
References: <20220616131835.2004262-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We are always using the given bs AioContext, so there is no need
to take the job ones (which is identical anyways).
This also reduces the point we need to check when protecting
job.aio_context field.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/commit.c | 4 ++--
 block/mirror.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index 851d1c557a..336f799172 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -370,7 +370,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
         goto fail;
     }
 
-    s->base = blk_new(s->common.job.aio_context,
+    s->base = blk_new(bdrv_get_aio_context(bs),
                       base_perms,
                       BLK_PERM_CONSISTENT_READ
                       | BLK_PERM_WRITE_UNCHANGED);
@@ -382,7 +382,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     s->base_bs = base;
 
     /* Required permissions are already taken with block_job_add_bdrv() */
-    s->top = blk_new(s->common.job.aio_context, 0, BLK_PERM_ALL);
+    s->top = blk_new(bdrv_get_aio_context(bs), 0, BLK_PERM_ALL);
     ret = blk_insert_bs(s->top, top, errp);
     if (ret < 0) {
         goto fail;
diff --git a/block/mirror.c b/block/mirror.c
index b38676e19d..1977e25171 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1728,7 +1728,7 @@ static BlockJob *mirror_start_job(
         goto fail;
     }
 
-    s->target = blk_new(s->common.job.aio_context,
+    s->target = blk_new(bdrv_get_aio_context(bs),
                         target_perms, target_shared_perms);
     ret = blk_insert_bs(s->target, target, errp);
     if (ret < 0) {
-- 
2.31.1


