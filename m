Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B262C063
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:03:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIrH-0007Ud-6a; Wed, 16 Nov 2022 08:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrF-0007Pq-6s
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrD-0002hy-63
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmIaFsLSCEXhvHzxeUI8wryLJNEgtrYu1PgD6PMFDew=;
 b=KeRVNPh/A3sxqKMJD+9/nHAjISO/GXUyH7XZu9bR+ATIBu/cba1a2+heqdSQBnYYALt6s2
 gsV7mhqsiUOwDQ4ofOqUU4IYk4m5bSSPgp7DO5Hix2RQT1gG/FXvK+6DM65Rnv/bJf+Wfp
 B//fZxJgG4N8zhp0vfFIk2Dz4DkOghk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-4q-QmLdYOhOZcDcL7g6rqQ-1; Wed, 16 Nov 2022 08:53:37 -0500
X-MC-Unique: 4q-QmLdYOhOZcDcL7g6rqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5A9F857F92;
 Wed, 16 Nov 2022 13:53:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A63E40E80E3;
 Wed, 16 Nov 2022 13:53:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 5/6] block/io: assert that BlockDriver->bdrv_co_*_snapshot_*
 are always called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:53:30 -0500
Message-Id: <20221116135331.3052923-6-eesposit@redhat.com>
In-Reply-To: <20221116135331.3052923-1-eesposit@redhat.com>
References: <20221116135331.3052923-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The only callers are other callback functions that already run with the
graph rdlock taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c                       | 2 ++
 include/block/block_int-common.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/block/io.c b/block/io.c
index 62c0b3a390..7d1d0c48b0 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3449,6 +3449,7 @@ bdrv_co_preadv_snapshot(BdrvChild *child, int64_t offset, int64_t bytes,
     BlockDriver *drv = bs->drv;
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
@@ -3474,6 +3475,7 @@ bdrv_co_snapshot_block_status(BlockDriverState *bs,
     BlockDriver *drv = bs->drv;
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 3064822508..03bd28e3c9 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -652,9 +652,12 @@ struct BlockDriver {
      * - be able to select a specific snapshot
      * - receive the snapshot's actual length (which may differ from bs's
      *   length)
+     *
+     * Called with graph rdlock taken.
      */
     int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
+    /* Called with graph rdlock taken. */
     int coroutine_fn (*bdrv_co_snapshot_block_status)(BlockDriverState *bs,
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);
-- 
2.31.1


