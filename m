Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F43FDEFC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:49:15 +0200 (CEST)
Received: from localhost ([::1]:46184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSUE-0000zm-R2
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzr-0005wd-LU
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzl-000478-Eq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xUhVOmN1WapwPPD0b8Wq27caqMEL7MxhMWhZmtJDrU=;
 b=EkyCr4i0yLCFX+56ITYRbpm4w9J3OxljwTWJqseGOL24/HyW6/I9L4sIyyllk3m1ulrA0r
 RdZqgiDhl8s70XxmsUA3HlMQtLo9cXXwEQOrYpRJO66Viivsras8pgmyrwNdfLJMA5z1Dm
 bUB/Ad6RfnM5HTkawgmWEMb98eSDvXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-2jGA6PNaN6O_pp5wuVFpQw-1; Wed, 01 Sep 2021 11:17:42 -0400
X-MC-Unique: 2jGA6PNaN6O_pp5wuVFpQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E8901B2C980;
 Wed,  1 Sep 2021 15:17:41 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12EA92B3A5;
 Wed,  1 Sep 2021 15:17:40 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 37/56] block/copy-before-write: bdrv_cbw_append(): drop unused
 compress arg
Date: Wed,  1 Sep 2021 17:16:00 +0200
Message-Id: <20210901151619.689075-38-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210824083856.17408-18-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 2 +-
 block/copy-before-write.c | 7 +++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index b386fd8f01..51847e711a 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -32,7 +32,6 @@
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/block/backup.c b/block/backup.c
index 83516297cb..4869f1e5da 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -452,7 +452,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, false, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4858dcf8ff..1e7180760a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -145,7 +145,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 }
 
 static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, bool compress, Error **errp)
+                    BlockDriverState *target, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
@@ -173,7 +173,7 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, false, false, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
@@ -202,7 +202,6 @@ BlockDriver bdrv_cbw_filter = {
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -221,7 +220,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, compress, errp);
+    ret = cbw_init(top, source, target, errp);
     if (ret < 0) {
         goto fail;
     }
-- 
2.31.1


