Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5E76D83BF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:31:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk62C-0005kL-1b; Wed, 05 Apr 2023 12:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk628-0005j5-R8
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk627-0006Z2-4Z
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680712249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PD1i5VlxjmCGb03EV7N5z9TRh9g2GyvKM4Zs6uY6moc=;
 b=US/2dlnvxlv8SI27uev1DEQRgnG1ccQlQsWtMIPaJREUdwnKXJ9Lmf5P+QpI+gW4hpFP7t
 5jed1JxzItbSZPCAlVnAtBc8ffFJIMuKbiZxuYCqfmcltbvOcyJsqrpPfdk6PxlGM2Gw/h
 vG5ArMWddCzrrdWIKx4sNlNW/vA9lqU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-xe5rtiMMNiqGbW7_pMIYrQ-1; Wed, 05 Apr 2023 12:30:48 -0400
X-MC-Unique: xe5rtiMMNiqGbW7_pMIYrQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 u30-20020a50c05e000000b0050299de3f82so14570790edd.10
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712246; x=1683304246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PD1i5VlxjmCGb03EV7N5z9TRh9g2GyvKM4Zs6uY6moc=;
 b=DwY4kfQYT3u/pKqaWbP/olKmdF/IcyrzgaCxsoQqhT4mB7gc1YIIritetQHhr+xs9G
 vJ4Mdy++7pJOC2tqU0vQVrXMkzuWnZNy6xmNilqDXkNcqOh486n34u7oJHC9m4CSdmxQ
 PD43i6sAZi7Bh3zYBRyS+/uIqEGyz2dxTskggaJXNahz9BdZpkESZpN/yw+/2lqGrA25
 GEWPHNE8rISF0dwQFSxCsSjN43wNThirKlIsvbJ51BvujjKl8s99sjGRL3CUjZQjHRe9
 mKMHViroFU1IxnWfBfOfZPgbHA02Dj7Ky+waT/dY0SfbSUb5lQ4n969fb95sDnloey0Y
 i+aQ==
X-Gm-Message-State: AAQBX9ewOH250jgIMkPDCFYJUAeYDGqxNAvZBvruhnOapyd5ydSVax0T
 yiY4ckjauXSagns6T+LfcCqZH/ayEWQvGJvON+HiANgiMJ5fdGI8nNkmtrdsTDr1U3T62Cx/CVa
 p13d2lfTtYvOMukylutDaTduv4s4xGNNax/cHmesXC0LKbhFEcgHf1NyD6i9vpInHNTzzrL3v4g
 g=
X-Received: by 2002:a17:906:6981:b0:932:4cbf:5bbb with SMTP id
 i1-20020a170906698100b009324cbf5bbbmr3464166ejr.19.1680712246263; 
 Wed, 05 Apr 2023 09:30:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZJHMHIUA0k9vNCjr5e4Fio2B/Tfvi6s/za+4bChc2SslvK6IeLF0QRJk5mBwI3l8szT04raw==
X-Received: by 2002:a17:906:6981:b0:932:4cbf:5bbb with SMTP id
 i1-20020a170906698100b009324cbf5bbbmr3464150ejr.19.1680712245923; 
 Wed, 05 Apr 2023 09:30:45 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a170906711000b008e53874f8d8sm7512488ejj.180.2023.04.05.09.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:30:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fiona Ebner <f.ebner@proxmox.com>
Subject: [PATCH] block-backend: delay application of request queuing
Date: Wed,  5 Apr 2023 18:30:44 +0200
Message-Id: <20230405163044.197796-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405161752.194727-1-pbonzini@redhat.com>
References: <20230405161752.194727-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Request queuing prevents new requests from being submitted to the
BlockDriverState, not allowing them to start instead of just letting
them complete before bdrv_drained_begin() returns.

The reason for this was to ensure progress and avoid a livelock
in blk_drain(), blk_drain_all_begin(), bdrv_drained_begin() or
bdrv_drain_all_begin(), if there is an endless stream of requests to
a BlockBackend.  However, this is prone to deadlocks.

In particular, IDE TRIM wants to elevate its BB's in-flight counter for a
"macro" operation that consists of several actual I/O operations.  Each of
those operations is individually started and awaited.  It does this so
that blk_drain() will drain the whole TRIM, and not just a single one
of the many discard operations it may encompass.  When request queuing
is enabled, this leads to a deadlock: The currently ongoing discard is
drained, and the next one is queued, waiting for the drain to stop.
Meanwhile, TRIM still keeps the in-flight counter elevated, waiting
for all discards to stop -- which will never happen, because with the
in-flight counter elevated, the BB is never considered drained, so the
drained section does not begin and cannot end.

Fixing the implementation of request queuing is hard to do in general,
and even harder to do without adding more hacks.  As the name suggests,
deadlocks are worse than livelocks :) so let's avoid them: turn the
request queuing on only after the BlockBackend has quiesced, and leave
the second functionality of bdrv_drained_begin() to the BQL or to the
individual BlockDevOps implementations.

In fact, devices such as IDE that run in the vCPU thread do not suffer
from this livelock because they only submit requests while they are
allowed to hold the big QEMU lock (i.e., not during bdrv_drained_begin()
or bdrv_drain_all_begin().  Other devices can avoid it through external
file descriptor (so that aio_disable_external() will prevent submission
of new requests) or with a .drained_begin callback in their BlockDevOps.

Note that this change does not affect the safety of bdrv_drained_begin(),
since the patch does not completely get away with request queuing.

Reported-by: Fiona Ebner <f.ebner@proxmox.com>
Fixes: 7e5cdb345f77 ("ide: Increment BB in-flight counter for TRIM BH")
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 10419f8be91e..acb4cb91a5ee 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -42,6 +42,12 @@ typedef struct BlockBackendAioNotifier {
     QLIST_ENTRY(BlockBackendAioNotifier) list;
 } BlockBackendAioNotifier;
 
+typedef enum {
+    BLK_QUEUE_READY,
+    BLK_QUEUE_DISABLED,
+    BLK_QUEUE_QUIESCENT,
+} BlockBackendQueueState;
+
 struct BlockBackend {
     char *name;
     int refcnt;
@@ -79,13 +85,14 @@ struct BlockBackend {
      */
     bool allow_aio_context_change;
     bool allow_write_beyond_eof;
-    bool disable_request_queuing;
 
     /* Protected by BQL */
     NotifierList remove_bs_notifiers, insert_bs_notifiers;
     QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
 
     int quiesce_counter; /* atomic: written under BQL, read by other threads */
+    BlockBackendQueueState request_queuing;
+
     QemuMutex queued_requests_lock; /* protects queued_requests */
     CoQueue queued_requests;
 
@@ -368,6 +375,7 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
     blk->shared_perm = shared_perm;
     blk_set_enable_write_cache(blk, true);
 
+    blk->request_queuing = BLK_QUEUE_READY;
     blk->on_read_error = BLOCKDEV_ON_ERROR_REPORT;
     blk->on_write_error = BLOCKDEV_ON_ERROR_ENOSPC;
 
@@ -1240,7 +1248,7 @@ void blk_allow_aio_context_change(BlockBackend *blk)
 void blk_disable_request_queuing(BlockBackend *blk)
 {
     GLOBAL_STATE_CODE();
-    blk->disable_request_queuing = true;
+    blk->request_queuing = BLK_QUEUE_DISABLED;
 }
 
 static int coroutine_fn GRAPH_RDLOCK
@@ -1279,16 +1287,18 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 {
     assert(blk->in_flight > 0);
 
-    if (qatomic_read(&blk->quiesce_counter) && !blk->disable_request_queuing) {
+    if (qatomic_read(&blk->request_queuing) == BLK_QUEUE_QUIESCENT) {
         /*
          * Take lock before decrementing in flight counter so main loop thread
          * waits for us to enqueue ourselves before it can leave the drained
          * section.
          */
         qemu_mutex_lock(&blk->queued_requests_lock);
-        blk_dec_in_flight(blk);
-        qemu_co_queue_wait(&blk->queued_requests, &blk->queued_requests_lock);
-        blk_inc_in_flight(blk);
+        if (qatomic_read(&blk->request_queuing) == BLK_QUEUE_QUIESCENT) {
+            blk_dec_in_flight(blk);
+            qemu_co_queue_wait(&blk->queued_requests, &blk->queued_requests_lock);
+            blk_inc_in_flight(blk);
+        }
         qemu_mutex_unlock(&blk->queued_requests_lock);
     }
 }
@@ -2600,7 +2610,14 @@ static bool blk_root_drained_poll(BdrvChild *child)
     if (blk->dev_ops && blk->dev_ops->drained_poll) {
         busy = blk->dev_ops->drained_poll(blk->dev_opaque);
     }
-    return busy || !!blk->in_flight;
+    if (busy || blk->in_flight) {
+        return true;
+    }
+
+    if (qatomic_read(&blk->request_queuing) == BLK_QUEUE_READY) {
+        qatomic_set(&blk->request_queuing, BLK_QUEUE_QUIESCENT);
+    }
+    return false;
 }
 
 static void blk_root_drained_end(BdrvChild *child)
@@ -2616,9 +2633,12 @@ static void blk_root_drained_end(BdrvChild *child)
             blk->dev_ops->drained_end(blk->dev_opaque);
         }
         qemu_mutex_lock(&blk->queued_requests_lock);
-        while (qemu_co_enter_next(&blk->queued_requests,
-                                  &blk->queued_requests_lock)) {
-            /* Resume all queued requests */
+        if (qatomic_read(&blk->request_queuing) != BLK_QUEUE_DISABLED) {
+            qatomic_set(&blk->request_queuing, BLK_QUEUE_READY);
+            while (qemu_co_enter_next(&blk->queued_requests,
+                                      &blk->queued_requests_lock)) {
+                /* Resume all queued requests */
+            }
         }
         qemu_mutex_unlock(&blk->queued_requests_lock);
     }
-- 
2.39.2


