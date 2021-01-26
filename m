Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8CD3040AD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:44:09 +0100 (CET)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PZg-00008A-KS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDy-0000hZ-7C
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDv-0006Ow-79
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MP9K+eNew6S6WIOGD3Wwz0DCNB53sW7w9wWwAWPS5EM=;
 b=FoHkRl4cvQLHGa99PEEUtJ735dyA8LmNojHd1NrX6Jj8dIohoye5okEMY3vEThxSSrx22Q
 COxZznMxlUNE34cCasD1DuDdUA25fi9gEPvQcaMquu+YWx+iSUFPR0TXyVyhI4Ur9TZZnA
 Q7oh5Ie6zs1zE137QR+cQ3+WXbd1n0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-scY-uCxZOEevVfXoq0zH7Q-1; Tue, 26 Jan 2021 09:21:32 -0500
X-MC-Unique: scY-uCxZOEevVfXoq0zH7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85D968143EB;
 Tue, 26 Jan 2021 14:21:31 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 269885D739;
 Tue, 26 Jan 2021 14:21:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 32/53] block/block-copy: add block_copy_cancel
Date: Tue, 26 Jan 2021 15:19:55 +0100
Message-Id: <20210126142016.806073-33-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Add function to cancel running async block-copy call. It will be used
in backup.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-8-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h | 13 +++++++++++++
 block/block-copy.c         | 24 +++++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b5a53ad59e..7821850f88 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -74,11 +74,24 @@ void block_copy_call_free(BlockCopyCallState *call_state);
 bool block_copy_call_finished(BlockCopyCallState *call_state);
 bool block_copy_call_succeeded(BlockCopyCallState *call_state);
 bool block_copy_call_failed(BlockCopyCallState *call_state);
+bool block_copy_call_cancelled(BlockCopyCallState *call_state);
 int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read);
 
 void block_copy_set_speed(BlockCopyState *s, uint64_t speed);
 void block_copy_kick(BlockCopyCallState *call_state);
 
+/*
+ * Cancel running block-copy call.
+ *
+ * Cancel leaves block-copy state valid: dirty bits are correct and you may use
+ * cancel + <run block_copy with same parameters> to emulate pause/resume.
+ *
+ * Note also, that the cancel is async: it only marks block-copy call to be
+ * cancelled. So, the call may be cancelled (block_copy_call_cancelled() reports
+ * true) but not yet finished (block_copy_call_finished() reports false).
+ */
+void block_copy_call_cancel(BlockCopyCallState *call_state);
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index fa27450b14..82cf945693 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -51,6 +51,7 @@ typedef struct BlockCopyCallState {
     int ret;
     bool finished;
     QemuCoSleepState *sleep_state;
+    bool cancelled;
 
     /* OUT parameters */
     bool error_is_read;
@@ -594,7 +595,7 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
     assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
 
-    while (bytes && aio_task_pool_status(aio) == 0) {
+    while (bytes && aio_task_pool_status(aio) == 0 && !call_state->cancelled) {
         BlockCopyTask *task;
         int64_t status_bytes;
 
@@ -707,7 +708,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     do {
         ret = block_copy_dirty_clusters(call_state);
 
-        if (ret == 0) {
+        if (ret == 0 && !call_state->cancelled) {
             ret = block_copy_wait_one(call_state->s, call_state->offset,
                                       call_state->bytes);
         }
@@ -721,7 +722,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
          * 2. We have waited for some intersecting block-copy request
          *    It may have failed and produced new dirty bits.
          */
-    } while (ret > 0);
+    } while (ret > 0 && !call_state->cancelled);
 
     call_state->finished = true;
 
@@ -801,12 +802,19 @@ bool block_copy_call_finished(BlockCopyCallState *call_state)
 
 bool block_copy_call_succeeded(BlockCopyCallState *call_state)
 {
-    return call_state->finished && call_state->ret == 0;
+    return call_state->finished && !call_state->cancelled &&
+        call_state->ret == 0;
 }
 
 bool block_copy_call_failed(BlockCopyCallState *call_state)
 {
-    return call_state->finished && call_state->ret < 0;
+    return call_state->finished && !call_state->cancelled &&
+        call_state->ret < 0;
+}
+
+bool block_copy_call_cancelled(BlockCopyCallState *call_state)
+{
+    return call_state->cancelled;
 }
 
 int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
@@ -818,6 +826,12 @@ int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
     return call_state->ret;
 }
 
+void block_copy_call_cancel(BlockCopyCallState *call_state)
+{
+    call_state->cancelled = true;
+    block_copy_kick(call_state);
+}
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
 {
     return s->copy_bitmap;
-- 
2.29.2


