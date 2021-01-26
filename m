Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC73040F5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:53:51 +0100 (CET)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pj4-00042F-RL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDs-0000cD-ET
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDk-0006Hl-RZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRqC4s10jkycvPt4J93XiUzxO7GZtvCvUaejSY6/48k=;
 b=cRs1z0KliDySPR5ZWCt3cdeBToKpepEvHswA58QfHJbkJBxOiXjCv43QWN7i0gaqI8GNCp
 pR73zODU1k4gOnDmIHUss8Q8IwzsmwGSYoym6X7y5Gph5T6h4vjuigsd4pUix2vMkAJ8Sc
 +ku2CNddHy0KZJW/OYQL0K9pCMpOtXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-HpxqmpmXNb2m_BTA2km1Jg-1; Tue, 26 Jan 2021 09:21:25 -0500
X-MC-Unique: HpxqmpmXNb2m_BTA2km1Jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C48F1180E46E;
 Tue, 26 Jan 2021 14:21:24 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A0960871;
 Tue, 26 Jan 2021 14:21:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/53] block/block-copy: add max_chunk and max_workers
 parameters
Date: Tue, 26 Jan 2021 15:19:52 +0100
Message-Id: <20210126142016.806073-30-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

They will be used for backup.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-5-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  6 ++++++
 block/block-copy.c         | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 8c225ebf81..22372aa375 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -49,9 +49,15 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
  *
  * Caller is responsible to call block_copy_call_free() to free
  * BlockCopyCallState object.
+ *
+ * @max_workers means maximum of parallel coroutines to execute sub-requests,
+ * must be > 0.
+ *
+ * @max_chunk means maximum length for one IO operation. Zero means unlimited.
  */
 BlockCopyCallState *block_copy_async(BlockCopyState *s,
                                      int64_t offset, int64_t bytes,
+                                     int max_workers, int64_t max_chunk,
                                      BlockCopyAsyncCallbackFunc cb,
                                      void *cb_opaque);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 74655b86f8..35213bd832 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -34,6 +34,8 @@ typedef struct BlockCopyCallState {
     BlockCopyState *s;
     int64_t offset;
     int64_t bytes;
+    int max_workers;
+    int64_t max_chunk;
     BlockCopyAsyncCallbackFunc cb;
     void *cb_opaque;
 
@@ -148,10 +150,11 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
                                              int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
+    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, call_state->max_chunk);
 
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
-                                           s->copy_size, &offset, &bytes))
+                                           max_chunk, &offset, &bytes))
     {
         return NULL;
     }
@@ -623,7 +626,7 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         bytes = end - offset;
 
         if (!aio && bytes) {
-            aio = aio_task_pool_new(BLOCK_COPY_MAX_WORKERS);
+            aio = aio_task_pool_new(call_state->max_workers);
         }
 
         ret = block_copy_task_run(aio, task);
@@ -701,6 +704,7 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
         .s = s,
         .offset = start,
         .bytes = bytes,
+        .max_workers = BLOCK_COPY_MAX_WORKERS,
     };
 
     int ret = block_copy_common(&call_state);
@@ -719,6 +723,7 @@ static void coroutine_fn block_copy_async_co_entry(void *opaque)
 
 BlockCopyCallState *block_copy_async(BlockCopyState *s,
                                      int64_t offset, int64_t bytes,
+                                     int max_workers, int64_t max_chunk,
                                      BlockCopyAsyncCallbackFunc cb,
                                      void *cb_opaque)
 {
@@ -728,6 +733,8 @@ BlockCopyCallState *block_copy_async(BlockCopyState *s,
         .s = s,
         .offset = offset,
         .bytes = bytes,
+        .max_workers = max_workers,
+        .max_chunk = max_chunk,
         .cb = cb,
         .cb_opaque = cb_opaque,
 
-- 
2.29.2


