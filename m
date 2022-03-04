Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F584CD9BB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:07:24 +0100 (CET)
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBOl-0004wN-3j
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5t-0005MU-2d
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5o-0007PG-2C
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDymB1ki+7NS9oWw5v7gDNs3RvgJwVOyHJcEM7TA6/4=;
 b=K1aJHlEz/rNQEmLAhUBrhxlv49rs/Py/bG2UtiM2l8UX4UFijvgT8v8sTielQUo/HOJOvz
 4HwCMDDFD3sClatoQmTUkf6I8H50QtvlxAkTKBvqBi61sFMqxo3/uxeL76D7wkMSsZcR0v
 f9WyBEDMiEan6+4Pxo6FqN1ag6vvgfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-Tugt5xj4M--FbuMbe00arw-1; Fri, 04 Mar 2022 11:47:22 -0500
X-MC-Unique: Tugt5xj4M--FbuMbe00arw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC0C61006AA6;
 Fri,  4 Mar 2022 16:47:20 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF47183BF9;
 Fri,  4 Mar 2022 16:47:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/50] block: introduce bdrv_activate
Date: Fri,  4 Mar 2022 17:46:24 +0100
Message-Id: <20220304164711.474713-4-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This function is currently just a wrapper for bdrv_invalidate_cache(),
but in future will contain the code of bdrv_co_invalidate_cache() that
has to always be protected by BQL, and leave the rest in the I/O
coroutine.

Replace all bdrv_invalidate_cache() invokations with bdrv_activate().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220209105452.1694545-4-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h            | 1 +
 block.c                          | 7 ++++++-
 block/block-backend.c            | 2 +-
 block/export/export.c            | 2 +-
 block/parallels.c                | 2 +-
 tests/unit/test-block-iothread.c | 2 +-
 6 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index e1713ee306..18cd336911 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -494,6 +494,7 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 int generated_co_wrapper bdrv_invalidate_cache(BlockDriverState *bs,
                                                Error **errp);
 void bdrv_invalidate_cache_all(Error **errp);
+int bdrv_activate(BlockDriverState *bs, Error **errp);
 int bdrv_inactivate_all(void);
 
 /* Ensure contents are flushed to disk.  */
diff --git a/block.c b/block.c
index b54d59d1fa..7746727a47 100644
--- a/block.c
+++ b/block.c
@@ -6393,6 +6393,11 @@ void bdrv_init_with_whitelist(void)
     bdrv_init();
 }
 
+int bdrv_activate(BlockDriverState *bs, Error **errp)
+{
+    return bdrv_invalidate_cache(bs, errp);
+}
+
 int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *child, *parent;
@@ -6478,7 +6483,7 @@ void bdrv_invalidate_cache_all(Error **errp)
         int ret;
 
         aio_context_acquire(aio_context);
-        ret = bdrv_invalidate_cache(bs, errp);
+        ret = bdrv_activate(bs, errp);
         aio_context_release(aio_context);
         if (ret < 0) {
             bdrv_next_cleanup(&it);
diff --git a/block/block-backend.c b/block/block-backend.c
index 4ff6b4d785..c516113a36 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1889,7 +1889,7 @@ void blk_invalidate_cache(BlockBackend *blk, Error **errp)
         return;
     }
 
-    bdrv_invalidate_cache(bs, errp);
+    bdrv_activate(bs, errp);
 }
 
 bool blk_is_inserted(BlockBackend *blk)
diff --git a/block/export/export.c b/block/export/export.c
index 6d3b9964c8..7253af3bc3 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -139,7 +139,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
      * access since the export could be available before migration handover.
      * ctx was acquired in the caller.
      */
-    bdrv_invalidate_cache(bs, NULL);
+    bdrv_activate(bs, NULL);
 
     perm = BLK_PERM_CONSISTENT_READ;
     if (export->writable) {
diff --git a/block/parallels.c b/block/parallels.c
index 6ebad2a2bb..e58c828422 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -873,7 +873,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     s->bat_dirty_bmap =
         bitmap_new(DIV_ROUND_UP(s->header_size, s->bat_dirty_block));
 
-    /* Disable migration until bdrv_invalidate_cache method is added */
+    /* Disable migration until bdrv_activate method is added */
     error_setg(&s->migration_blocker, "The Parallels format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index aea660aeed..378a7b7869 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -282,7 +282,7 @@ static void test_sync_op_check(BdrvChild *c)
 static void test_sync_op_invalidate_cache(BdrvChild *c)
 {
     /* Early success: Image is not inactive */
-    bdrv_invalidate_cache(c->bs, NULL);
+    bdrv_activate(c->bs, NULL);
 }
 
 
-- 
2.35.1


