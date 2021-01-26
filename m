Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09083040B9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:45:27 +0100 (CET)
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Par-0001Qd-IW
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:45:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDm-0000VP-NQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDg-0006F4-Dl
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1KBTKHs1kHUVcLFlCgIusIHOg+6ge+gUiafMJnm3ts=;
 b=MftzlLFnsfMjNPzI5XSqwY8NzR2saIsXUZcEokVCFB4SL8nsAgF3nzil61G//qV1TxM215
 2v5RGlBHzHvXZCfYV00ZidEOa+JZiNO2ftRHYWfXfRTcZkuz7sf0HIhN8ru7Bu4j9AJiXA
 8/esr3tOx7PDrLEOV0SR32Ee6rPGDfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-MxbQGsMBMlCYMRSXbgYqaA-1; Tue, 26 Jan 2021 09:21:21 -0500
X-MC-Unique: MxbQGsMBMlCYMRSXbgYqaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CFFD107ACE6;
 Tue, 26 Jan 2021 14:21:20 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F6A5D9C2;
 Tue, 26 Jan 2021 14:21:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/53] block/block-copy: More explicit call_state
Date: Tue, 26 Jan 2021 15:19:50 +0100
Message-Id: <20210126142016.806073-28-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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

Refactor common path to use BlockCopyCallState pointer as parameter, to
prepare it for use in asynchronous block-copy (at least, we'll need to
run block-copy in a coroutine, passing the whole parameters as one
pointer).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-3-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 51 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 63398a171c..6ea55f1f9a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -30,7 +30,15 @@
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
+    /* IN parameters */
+    BlockCopyState *s;
+    int64_t offset;
+    int64_t bytes;
+
+    /* State */
     bool failed;
+
+    /* OUT parameters */
     bool error_is_read;
 } BlockCopyCallState;
 
@@ -544,15 +552,17 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
  * Returns 1 if dirty clusters found and successfully copied, 0 if no dirty
  * clusters found and -errno on failure.
  */
-static int coroutine_fn block_copy_dirty_clusters(BlockCopyState *s,
-                                                  int64_t offset, int64_t bytes,
-                                                  bool *error_is_read)
+static int coroutine_fn
+block_copy_dirty_clusters(BlockCopyCallState *call_state)
 {
+    BlockCopyState *s = call_state->s;
+    int64_t offset = call_state->offset;
+    int64_t bytes = call_state->bytes;
+
     int ret = 0;
     bool found_dirty = false;
     int64_t end = offset + bytes;
     AioTaskPool *aio = NULL;
-    BlockCopyCallState call_state = {false, false};
 
     /*
      * block_copy() user is responsible for keeping source and target in same
@@ -568,7 +578,7 @@ static int coroutine_fn block_copy_dirty_clusters(BlockCopyState *s,
         BlockCopyTask *task;
         int64_t status_bytes;
 
-        task = block_copy_task_create(s, &call_state, offset, bytes);
+        task = block_copy_task_create(s, call_state, offset, bytes);
         if (!task) {
             /* No more dirty bits in the bitmap */
             trace_block_copy_skip_range(s, offset, bytes);
@@ -633,15 +643,12 @@ out:
 
         aio_task_pool_free(aio);
     }
-    if (error_is_read && ret < 0) {
-        *error_is_read = call_state.error_is_read;
-    }
 
     return ret < 0 ? ret : found_dirty;
 }
 
 /*
- * block_copy
+ * block_copy_common
  *
  * Copy requested region, accordingly to dirty bitmap.
  * Collaborate with parallel block_copy requests: if they succeed it will help
@@ -649,16 +656,16 @@ out:
  * it means that some I/O operation failed in context of _this_ block_copy call,
  * not some parallel operation.
  */
-int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool *error_is_read)
+static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
 
     do {
-        ret = block_copy_dirty_clusters(s, offset, bytes, error_is_read);
+        ret = block_copy_dirty_clusters(call_state);
 
         if (ret == 0) {
-            ret = block_copy_wait_one(s, offset, bytes);
+            ret = block_copy_wait_one(call_state->s, call_state->offset,
+                                      call_state->bytes);
         }
 
         /*
@@ -675,6 +682,24 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
     return ret;
 }
 
+int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
+                            bool *error_is_read)
+{
+    BlockCopyCallState call_state = {
+        .s = s,
+        .offset = start,
+        .bytes = bytes,
+    };
+
+    int ret = block_copy_common(&call_state);
+
+    if (error_is_read && ret < 0) {
+        *error_is_read = call_state.error_is_read;
+    }
+
+    return ret;
+}
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
 {
     return s->copy_bitmap;
-- 
2.29.2


