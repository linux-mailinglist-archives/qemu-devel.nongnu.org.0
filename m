Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2478380EBD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:20:11 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbTu-0002q7-S8
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawh-0005tW-V5
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawf-00060k-Ss
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65sDDuokMLdKmZuyvOn5TNNicQ0jSs2UsQ62mBgDYPE=;
 b=GCyhw1WQXOdKDoHahjiKZ45ZXahSN7Hms1GyxYtQLC8RWBGzCAEbMQQlC6/u1+TvWscGzS
 XUq6H6xULMd8KAL/fBppeYol5Gy4pHWZUIQ2EmzwCixYqeqezC6INl4v6cd/2E+9pP/tYE
 7Eae4wot3Yjipm84QfXMmeCuWRilg+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-M_cyTe87PmGVtojQ_rU8sQ-1; Fri, 14 May 2021 12:45:47 -0400
X-MC-Unique: M_cyTe87PmGVtojQ_rU8sQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE216801817;
 Fri, 14 May 2021 16:45:45 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7934F1002D71;
 Fri, 14 May 2021 16:45:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/19] block: drop write notifiers
Date: Fri, 14 May 2021 18:45:09 +0200
Message-Id: <20210514164514.1057680-15-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

They are unused now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210506090621.11848-3-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h | 12 ------------
 block.c                   |  1 -
 block/io.c                |  6 ------
 3 files changed, 19 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index aff948fb63..b2c8b09d0f 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -954,9 +954,6 @@ struct BlockDriverState {
      */
     int64_t total_sectors;
 
-    /* Callback before write request is processed */
-    NotifierWithReturnList before_write_notifiers;
-
     /* threshold limit for writes, in bytes. "High water mark". */
     uint64_t write_threshold_offset;
 
@@ -1083,15 +1080,6 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
 bool bdrv_backing_overridden(BlockDriverState *bs);
 
 
-/**
- * bdrv_add_before_write_notifier:
- *
- * Register a callback that is invoked before write requests are processed but
- * after any throttling or waiting for overlapping requests.
- */
-void bdrv_add_before_write_notifier(BlockDriverState *bs,
-                                    NotifierWithReturn *notifier);
-
 /**
  * bdrv_add_aio_context_notifier:
  *
diff --git a/block.c b/block.c
index 9ad725d205..75a82af641 100644
--- a/block.c
+++ b/block.c
@@ -400,7 +400,6 @@ BlockDriverState *bdrv_new(void)
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         QLIST_INIT(&bs->op_blockers[i]);
     }
-    notifier_with_return_list_init(&bs->before_write_notifiers);
     qemu_co_mutex_init(&bs->reqs_lock);
     qemu_mutex_init(&bs->dirty_bitmap_mutex);
     bs->refcnt = 1;
diff --git a/block/io.c b/block/io.c
index 3520de51bb..1e826ba9e8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3165,12 +3165,6 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
     return true;
 }
 
-void bdrv_add_before_write_notifier(BlockDriverState *bs,
-                                    NotifierWithReturn *notifier)
-{
-    notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
-}
-
 void bdrv_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
-- 
2.31.1


