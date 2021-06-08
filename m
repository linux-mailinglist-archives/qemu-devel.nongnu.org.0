Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5339EFBD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 09:36:59 +0200 (CEST)
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqWIE-0001Of-Lb
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 03:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFS-0003Vc-Ls
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFQ-0005GI-Ot
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623137644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kh0KqmdCWNV7x5VvloIjB4t8//cjeCMhlFWcIJ19HY=;
 b=R6EyrcYOgP97TASXnXjdO59nHKwgNm/xgCK0t89GlwEySTaj7jFhgVf3T1vYEwMPry5XId
 W0+rCKVqPmzbCs5tByB00GMjo+reN2ShfRLRvfASUia76n0ZFG/FMor/8b/Jzfb37m1dP/
 Le3sUxeW4vAX1zaIP7r9u6zWrFMNB38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-vn1hwRGYPzKIhsFDNHCRrQ-1; Tue, 08 Jun 2021 03:34:02 -0400
X-MC-Unique: vn1hwRGYPzKIhsFDNHCRrQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B5FB107ACCA;
 Tue,  8 Jun 2021 07:34:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-225.ams2.redhat.com
 [10.36.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC604608BA;
 Tue,  8 Jun 2021 07:33:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 5/5] block-copy: atomic .cancelled and .finished fields in
 BlockCopyCallState
Date: Tue,  8 Jun 2021 09:33:44 +0200
Message-Id: <20210608073344.53637-6-eesposit@redhat.com>
In-Reply-To: <20210608073344.53637-1-eesposit@redhat.com>
References: <20210608073344.53637-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By adding acquire/release pairs, we ensure that .ret and .error_is_read
fields are written by block_copy_dirty_clusters before .finished is true.

The atomic here are necessary because the fields are concurrently modified
also outside coroutines.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 56f62913e4..55b6ce6a57 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -56,11 +56,11 @@ typedef struct BlockCopyCallState {
     QLIST_ENTRY(BlockCopyCallState) list;
 
     /* State */
-    bool finished;
+    bool finished; /* atomic */
     QemuCoSleep sleep; /* TODO: protect API with a lock */
 
     /* OUT parameters */
-    bool cancelled;
+    bool cancelled; /* atomic */
     /* Fields protected by lock in BlockCopyState */
     bool error_is_read;
     int ret;
@@ -648,7 +648,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
     assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
 
-    while (bytes && aio_task_pool_status(aio) == 0 && !call_state->cancelled) {
+    while (bytes && aio_task_pool_status(aio) == 0 &&
+           !qatomic_read(&call_state->cancelled)) {
         BlockCopyTask *task;
         int64_t status_bytes;
 
@@ -758,7 +759,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     do {
         ret = block_copy_dirty_clusters(call_state);
 
-        if (ret == 0 && !call_state->cancelled) {
+        if (ret == 0 && !qatomic_read(&call_state->cancelled)) {
             ret = block_copy_wait_one(call_state->s, call_state->offset,
                                       call_state->bytes);
         }
@@ -772,9 +773,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
          * 2. We have waited for some intersecting block-copy request
          *    It may have failed and produced new dirty bits.
          */
-    } while (ret > 0 && !call_state->cancelled);
+    } while (ret > 0 && !qatomic_read(&call_state->cancelled));
 
-    call_state->finished = true;
+    qatomic_store_release(&call_state->finished, true);
 
     if (call_state->cb) {
         call_state->cb(call_state->cb_opaque);
@@ -837,35 +838,37 @@ void block_copy_call_free(BlockCopyCallState *call_state)
         return;
     }
 
-    assert(call_state->finished);
+    assert(qatomic_load_acquire(&call_state->finished));
     g_free(call_state);
 }
 
 bool block_copy_call_finished(BlockCopyCallState *call_state)
 {
-    return call_state->finished;
+    return qatomic_load_acquire(&call_state->finished);
 }
 
 bool block_copy_call_succeeded(BlockCopyCallState *call_state)
 {
-    return call_state->finished && !call_state->cancelled &&
-        call_state->ret == 0;
+    return qatomic_load_acquire(&call_state->finished) &&
+           !qatomic_read(&call_state->cancelled) &&
+           call_state->ret == 0;
 }
 
 bool block_copy_call_failed(BlockCopyCallState *call_state)
 {
-    return call_state->finished && !call_state->cancelled &&
-        call_state->ret < 0;
+    return qatomic_load_acquire(&call_state->finished) &&
+           !qatomic_read(&call_state->cancelled) &&
+           call_state->ret < 0;
 }
 
 bool block_copy_call_cancelled(BlockCopyCallState *call_state)
 {
-    return call_state->cancelled;
+    return qatomic_read(&call_state->cancelled);
 }
 
 int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
 {
-    assert(call_state->finished);
+    assert(qatomic_load_acquire(&call_state->finished));
     if (error_is_read) {
         *error_is_read = call_state->error_is_read;
     }
@@ -874,7 +877,7 @@ int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
 
 void block_copy_call_cancel(BlockCopyCallState *call_state)
 {
-    call_state->cancelled = true;
+    qatomic_set(&call_state->cancelled, true);
     block_copy_kick(call_state);
 }
 
-- 
2.30.2


