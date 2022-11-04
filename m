Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A056193FA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:59:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtSK-0005hz-4Z; Fri, 04 Nov 2022 05:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRp-0005a7-Tm
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqtRm-0000Ii-AE
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667555829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6z9lyDF0J2gq1fZQvXggcuNmz30BZSPi1TGya37k5PM=;
 b=g2WrAvp2ZAJsN5AWWZVPavp269g5BOrMcExqbpbKmW6ISXkn03zf/FWZ0GW+VEwd7uaoIJ
 EfegdMUsAhf7J3WEc891KvAeb6Sw8TX14BkvYlpzF8U1nZv8FVIPpHjRVBGA+o8+XQ+GfH
 kJSIPrQ2wHP2MTH+YUMkXYnzPrzx2sM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-6Sa7DZxzPr62gwsKG-GpEQ-1; Fri, 04 Nov 2022 05:57:05 -0400
X-MC-Unique: 6Sa7DZxzPr62gwsKG-GpEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26B11185A794;
 Fri,  4 Nov 2022 09:57:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE7C840C8459;
 Fri,  4 Nov 2022 09:57:04 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 9/9] block/dirty-bitmap: remove unnecessary
 qemu_in_coroutine() case
Date: Fri,  4 Nov 2022 05:57:00 -0400
Message-Id: <20221104095700.4117433-10-eesposit@redhat.com>
In-Reply-To: <20221104095700.4117433-1-eesposit@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

bdrv_can_store_new_dirty_bitmap and bdrv_remove_persistent_dirty_bitmap
check if they are running in a coroutine, directly calling the
coroutine callback if it's the case.
Except that no coroutine calls such functions, therefore that check
can be removed.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/dirty-bitmap.c | 66 +++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 37 deletions(-)

diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index bf3dc0512a..8092d08261 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -418,24 +418,20 @@ bdrv_co_remove_persistent_dirty_bitmap_entry(void *opaque)
 int bdrv_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
                                         Error **errp)
 {
-    if (qemu_in_coroutine()) {
-        return bdrv_co_remove_persistent_dirty_bitmap(bs, name, errp);
-    } else {
-        Coroutine *co;
-        BdrvRemovePersistentDirtyBitmapCo s = {
-            .bs = bs,
-            .name = name,
-            .errp = errp,
-            .ret = -EINPROGRESS,
-        };
-
-        co = qemu_coroutine_create(bdrv_co_remove_persistent_dirty_bitmap_entry,
-                                   &s);
-        bdrv_coroutine_enter(bs, co);
-        BDRV_POLL_WHILE(bs, s.ret == -EINPROGRESS);
-
-        return s.ret;
-    }
+    Coroutine *co;
+    BdrvRemovePersistentDirtyBitmapCo s = {
+        .bs = bs,
+        .name = name,
+        .errp = errp,
+        .ret = -EINPROGRESS,
+    };
+    assert(!qemu_in_coroutine());
+    co = qemu_coroutine_create(bdrv_co_remove_persistent_dirty_bitmap_entry,
+                                &s);
+    bdrv_coroutine_enter(bs, co);
+    BDRV_POLL_WHILE(bs, s.ret == -EINPROGRESS);
+
+    return s.ret;
 }
 
 bool
@@ -494,25 +490,21 @@ bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
                                      uint32_t granularity, Error **errp)
 {
     IO_CODE();
-    if (qemu_in_coroutine()) {
-        return bdrv_co_can_store_new_dirty_bitmap(bs, name, granularity, errp);
-    } else {
-        Coroutine *co;
-        BdrvCanStoreNewDirtyBitmapCo s = {
-            .bs = bs,
-            .name = name,
-            .granularity = granularity,
-            .errp = errp,
-            .in_progress = true,
-        };
-
-        co = qemu_coroutine_create(bdrv_co_can_store_new_dirty_bitmap_entry,
-                                   &s);
-        bdrv_coroutine_enter(bs, co);
-        BDRV_POLL_WHILE(bs, s.in_progress);
-
-        return s.ret;
-    }
+    Coroutine *co;
+    BdrvCanStoreNewDirtyBitmapCo s = {
+        .bs = bs,
+        .name = name,
+        .granularity = granularity,
+        .errp = errp,
+        .in_progress = true,
+    };
+    assert(!qemu_in_coroutine());
+    co = qemu_coroutine_create(bdrv_co_can_store_new_dirty_bitmap_entry,
+                                &s);
+    bdrv_coroutine_enter(bs, co);
+    BDRV_POLL_WHILE(bs, s.in_progress);
+
+    return s.ret;
 }
 
 void bdrv_disable_dirty_bitmap(BdrvDirtyBitmap *bitmap)
-- 
2.31.1


