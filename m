Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE393304093
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:39:18 +0100 (CET)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PUz-0004Dt-Jy
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDr-0000bD-6T
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDm-0006Iu-Df
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cu9MwT2CdfGPrg3EMlOLRjxF2ldDYMYSvnDncq7VrkI=;
 b=Ipd3Lt4Yp6FEPCJtf5otH4OLSGRGh31w9s2fjEmGYDaFqieLrEIM6D5vF0hMAdznk007Cs
 zptEh0wNziOnmsxzpKPpo/PJ3ZT6jDEYXmWjcdp3mxN4oIs3zM9EtD5uNamnhy88g/9gQu
 IqIqxFtdBavXcYCTkjKeq8KhsZYEXOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-UO8GvGM2NJ2Jv7bQR4sbkg-1; Tue, 26 Jan 2021 09:21:23 -0500
X-MC-Unique: UO8GvGM2NJ2Jv7bQR4sbkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0D03107ACF7;
 Tue, 26 Jan 2021 14:21:22 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4076960871;
 Tue, 26 Jan 2021 14:21:22 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 28/53] block/block-copy: implement block_copy_async
Date: Tue, 26 Jan 2021 15:19:51 +0100
Message-Id: <20210126142016.806073-29-mreitz@redhat.com>
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

We'll need async block-copy invocation to use in backup directly.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-4-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h | 29 ++++++++++++++
 block/block-copy.c         | 81 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 106 insertions(+), 4 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 6397505f30..8c225ebf81 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -19,7 +19,9 @@
 #include "qemu/co-shared-resource.h"
 
 typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
+typedef void (*BlockCopyAsyncCallbackFunc)(void *opaque);
 typedef struct BlockCopyState BlockCopyState;
+typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
@@ -41,6 +43,33 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
                             bool *error_is_read);
 
+/*
+ * Run block-copy in a coroutine, create corresponding BlockCopyCallState
+ * object and return pointer to it. Never returns NULL.
+ *
+ * Caller is responsible to call block_copy_call_free() to free
+ * BlockCopyCallState object.
+ */
+BlockCopyCallState *block_copy_async(BlockCopyState *s,
+                                     int64_t offset, int64_t bytes,
+                                     BlockCopyAsyncCallbackFunc cb,
+                                     void *cb_opaque);
+
+/*
+ * Free finished BlockCopyCallState. Trying to free running
+ * block-copy will crash.
+ */
+void block_copy_call_free(BlockCopyCallState *call_state);
+
+/*
+ * Note, that block-copy call is marked finished prior to calling
+ * the callback.
+ */
+bool block_copy_call_finished(BlockCopyCallState *call_state);
+bool block_copy_call_succeeded(BlockCopyCallState *call_state);
+bool block_copy_call_failed(BlockCopyCallState *call_state);
+int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read);
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 6ea55f1f9a..74655b86f8 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -30,13 +30,19 @@
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
-    /* IN parameters */
+    /* IN parameters. Initialized in block_copy_async() and never changed. */
     BlockCopyState *s;
     int64_t offset;
     int64_t bytes;
+    BlockCopyAsyncCallbackFunc cb;
+    void *cb_opaque;
+
+    /* Coroutine where async block-copy is running */
+    Coroutine *co;
 
     /* State */
-    bool failed;
+    int ret;
+    bool finished;
 
     /* OUT parameters */
     bool error_is_read;
@@ -428,8 +434,8 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
 
     ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
                              &error_is_read);
-    if (ret < 0 && !t->call_state->failed) {
-        t->call_state->failed = true;
+    if (ret < 0 && !t->call_state->ret) {
+        t->call_state->ret = ret;
         t->call_state->error_is_read = error_is_read;
     } else {
         progress_work_done(t->s->progress, t->bytes);
@@ -679,6 +685,12 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
          */
     } while (ret > 0);
 
+    call_state->finished = true;
+
+    if (call_state->cb) {
+        call_state->cb(call_state->cb_opaque);
+    }
+
     return ret;
 }
 
@@ -700,6 +712,67 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
     return ret;
 }
 
+static void coroutine_fn block_copy_async_co_entry(void *opaque)
+{
+    block_copy_common(opaque);
+}
+
+BlockCopyCallState *block_copy_async(BlockCopyState *s,
+                                     int64_t offset, int64_t bytes,
+                                     BlockCopyAsyncCallbackFunc cb,
+                                     void *cb_opaque)
+{
+    BlockCopyCallState *call_state = g_new(BlockCopyCallState, 1);
+
+    *call_state = (BlockCopyCallState) {
+        .s = s,
+        .offset = offset,
+        .bytes = bytes,
+        .cb = cb,
+        .cb_opaque = cb_opaque,
+
+        .co = qemu_coroutine_create(block_copy_async_co_entry, call_state),
+    };
+
+    qemu_coroutine_enter(call_state->co);
+
+    return call_state;
+}
+
+void block_copy_call_free(BlockCopyCallState *call_state)
+{
+    if (!call_state) {
+        return;
+    }
+
+    assert(call_state->finished);
+    g_free(call_state);
+}
+
+bool block_copy_call_finished(BlockCopyCallState *call_state)
+{
+    return call_state->finished;
+}
+
+bool block_copy_call_succeeded(BlockCopyCallState *call_state)
+{
+    return call_state->finished && call_state->ret == 0;
+}
+
+bool block_copy_call_failed(BlockCopyCallState *call_state)
+{
+    return call_state->finished && call_state->ret < 0;
+}
+
+int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
+{
+    assert(call_state->finished);
+    if (error_is_read) {
+        *error_is_read = call_state->error_is_read;
+    }
+    return call_state->ret;
+}
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
 {
     return s->copy_bitmap;
-- 
2.29.2


