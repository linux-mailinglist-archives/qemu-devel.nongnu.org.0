Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB1380F17
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:37:23 +0200 (CEST)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbkY-0003Sm-Fc
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawj-0005yQ-Ay
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawf-00060S-Cl
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZqLd9KvSqAEY8zRJwfz/tTC9Y2kJJ6YrETJBOdovhg=;
 b=A/1HDKZGr/swH1OJLWSpWC7sYVakJ8HXvcWzgPZEy6f03BWK4t4m2srLE/a+qVeWZKOOLP
 oOO4o8/VFq26PILcXNePblmyOnratXU+D/41sa59SxO5M9+szylceVGJHIE7tL+uMNBRpo
 BtkQfKQwH+yh0ygIdqkpW0D82cf/29c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-GQKQmb6MNGKwHt382YLT_A-1; Fri, 14 May 2021 12:45:44 -0400
X-MC-Unique: GQKQmb6MNGKwHt382YLT_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA041800D62;
 Fri, 14 May 2021 16:45:43 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BBAC5D9CD;
 Fri, 14 May 2021 16:45:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/19] block/write-threshold: don't use write notifiers
Date: Fri, 14 May 2021 18:45:08 +0200
Message-Id: <20210514164514.1057680-14-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

write-notifiers are used only for write-threshold. New code for such
purpose should create filters.

Let's better special-case write-threshold and drop write notifiers at
all. (Actually, write-threshold is special-cased anyway, as the only
user of write-notifiers)

So, create a new direct interface for bdrv_co_write_req_prepare() and
drop all write-notifier related logic from write-threshold.c.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210506090621.11848-2-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
[mreitz: Adjusted comment as per Eric's suggestion]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h       |  1 -
 include/block/write-threshold.h |  9 +++++
 block/io.c                      |  5 ++-
 block/write-threshold.c         | 70 +++++++--------------------------
 4 files changed, 27 insertions(+), 58 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 731ffedb27..aff948fb63 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -959,7 +959,6 @@ struct BlockDriverState {
 
     /* threshold limit for writes, in bytes. "High water mark". */
     uint64_t write_threshold_offset;
-    NotifierWithReturn write_threshold_notifier;
 
     /* Writing to the list requires the BQL _and_ the dirty_bitmap_mutex.
      * Reading from the list can be done with either the BQL or the
diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index c646f267a4..848a5dde85 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -59,4 +59,13 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
 uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
                                        const BdrvTrackedRequest *req);
 
+/*
+ * bdrv_write_threshold_check_write
+ *
+ * Check whether the specified request exceeds the write threshold.
+ * If so, send a corresponding event and disable write threshold checking.
+ */
+void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes);
+
 #endif
diff --git a/block/io.c b/block/io.c
index 35b6c56efc..3520de51bb 100644
--- a/block/io.c
+++ b/block/io.c
@@ -30,6 +30,7 @@
 #include "block/blockjob_int.h"
 #include "block/block_int.h"
 #include "block/coroutines.h"
+#include "block/write-threshold.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -2008,8 +2009,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
         } else {
             assert(child->perm & BLK_PERM_WRITE);
         }
-        return notifier_with_return_list_notify(&bs->before_write_notifiers,
-                                                req);
+        bdrv_write_threshold_check_write(bs, offset, bytes);
+        return 0;
     case BDRV_TRACKED_TRUNCATE:
         assert(child->perm & BLK_PERM_RESIZE);
         return 0;
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 85b78dc2a9..71df3c434f 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -29,14 +29,6 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
     return bs->write_threshold_offset > 0;
 }
 
-static void write_threshold_disable(BlockDriverState *bs)
-{
-    if (bdrv_write_threshold_is_set(bs)) {
-        notifier_with_return_remove(&bs->write_threshold_notifier);
-        bs->write_threshold_offset = 0;
-    }
-}
-
 uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
                                        const BdrvTrackedRequest *req)
 {
@@ -51,55 +43,9 @@ uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn before_write_notify(NotifierWithReturn *notifier,
-                                            void *opaque)
-{
-    BdrvTrackedRequest *req = opaque;
-    BlockDriverState *bs = req->bs;
-    uint64_t amount = 0;
-
-    amount = bdrv_write_threshold_exceeded(bs, req);
-    if (amount > 0) {
-        qapi_event_send_block_write_threshold(
-            bs->node_name,
-            amount,
-            bs->write_threshold_offset);
-
-        /* autodisable to avoid flooding the monitor */
-        write_threshold_disable(bs);
-    }
-
-    return 0; /* should always let other notifiers run */
-}
-
-static void write_threshold_register_notifier(BlockDriverState *bs)
-{
-    bs->write_threshold_notifier.notify = before_write_notify;
-    bdrv_add_before_write_notifier(bs, &bs->write_threshold_notifier);
-}
-
-static void write_threshold_update(BlockDriverState *bs,
-                                   int64_t threshold_bytes)
-{
-    bs->write_threshold_offset = threshold_bytes;
-}
-
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
 {
-    if (bdrv_write_threshold_is_set(bs)) {
-        if (threshold_bytes > 0) {
-            write_threshold_update(bs, threshold_bytes);
-        } else {
-            write_threshold_disable(bs);
-        }
-    } else {
-        if (threshold_bytes > 0) {
-            /* avoid multiple registration */
-            write_threshold_register_notifier(bs);
-            write_threshold_update(bs, threshold_bytes);
-        }
-        /* discard bogus disable request */
-    }
+    bs->write_threshold_offset = threshold_bytes;
 }
 
 void qmp_block_set_write_threshold(const char *node_name,
@@ -122,3 +68,17 @@ void qmp_block_set_write_threshold(const char *node_name,
 
     aio_context_release(aio_context);
 }
+
+void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes)
+{
+    int64_t end = offset + bytes;
+    uint64_t wtr = bs->write_threshold_offset;
+
+    if (wtr > 0 && end > wtr) {
+        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
+
+        /* autodisable to avoid flooding the monitor */
+        bdrv_write_threshold_set(bs, 0);
+    }
+}
-- 
2.31.1


