Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49962B5BB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 09:57:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovE8i-0002ik-LB; Wed, 16 Nov 2022 03:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovE8V-0002YM-RL
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 03:51:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovE8P-0003p7-ED
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 03:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668588664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9oy0eVZd2AWHWE0gSeNL+AiME+JCmB8NOawj7bmt9bE=;
 b=QvEdcYr8iR8ElXovhhJMiw9Od37WSA6SiSjczrdWANmgCIEf1znsG0lRKgIc2vGsmNvyMi
 IPWuzEoVruOfXRnOeZZfFBz+3ayzQ0dVTBon0YAfbX6wPOii++S6K+h8gxD9H72g+nJ5ru
 9Qv729m3iFcMdERMgoelFokR8/Au/qs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-6VmgDbrOPWSZWQfDhV-kgA-1; Wed, 16 Nov 2022 03:51:03 -0500
X-MC-Unique: 6VmgDbrOPWSZWQfDhV-kgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3428381A733;
 Wed, 16 Nov 2022 08:51:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A862220290A5;
 Wed, 16 Nov 2022 08:51:02 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 8/8] block/dirty-bitmap: remove unnecessary
 qemu_in_coroutine() case
Date: Wed, 16 Nov 2022 03:50:50 -0500
Message-Id: <20221116085050.2295179-9-eesposit@redhat.com>
In-Reply-To: <20221116085050.2295179-1-eesposit@redhat.com>
References: <20221116085050.2295179-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Some functions check if they are running in a coroutine, calling
the coroutine callback directly if it's the case.
Except that no coroutine calls such functions, therefore that case
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


