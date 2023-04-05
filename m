Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5E36D83BE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:31:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk62Z-0006Gy-S9; Wed, 05 Apr 2023 12:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk62W-0006Fj-Kc
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:31:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk62U-0006ys-Tv
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680712274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PD1i5VlxjmCGb03EV7N5z9TRh9g2GyvKM4Zs6uY6moc=;
 b=Oau2BaPUkfL1hf2eeiN1tFO8cukdwQrV83dvdXy6/Gt/YrfpHv/F+DYlrMI8bDKMX4ubj3
 zXLVqfyZKgkz3kq6lu1hQOlFF/cJwQJzZq2+oQmLBTKDNmlIR6M4gNhOIMMeLBSzultuUT
 CkC/W95fOn1fAmyaGJYHzDzpQlccLss=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-XG27DRO3MNOpqDkwT2QWrA-1; Wed, 05 Apr 2023 12:31:12 -0400
X-MC-Unique: XG27DRO3MNOpqDkwT2QWrA-1
Received: by mail-ed1-f72.google.com with SMTP id
 v1-20020a50d581000000b0050291cda08aso16932340edi.15
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712271; x=1683304271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PD1i5VlxjmCGb03EV7N5z9TRh9g2GyvKM4Zs6uY6moc=;
 b=mHGjikaWagm6DFL2ZVNpLZje/0RQTn7dm21LJp/5vfd7St+kmoGPJiL5qtDF9U5sA6
 BtQNObsYCP4ZJlVtffT8EK/Gz5rqMhosma9MEsSMxyx3j5u/YBH5JKV6EncSvT14uQXj
 MFRJItBUPI8IeHFAFwaBdJeSRXjS9LJbALhmfPALpdkwho/lxcEZUOaPe1FSuJaRs4mU
 ptGtLqApCgI0sioWZZVZoCJIXgdRN6h8RieD/zVZ89ng9R0FDjQyjDKc3JwJp+iYKE9c
 Es+6bVRrYTCiZWX+Pc4pV/RJvU/YjHeSg0eNqo0kwzYwtoyQJbKrVwGyVttd78yzvKk1
 O6AQ==
X-Gm-Message-State: AAQBX9eBDW8KQ9bVvXb+4pO93aTmmIRenD3xchbhggvPICYfWQmVQSbP
 aQRan+I/ss22/vYRQ5KUg/dGBHLeFwByAU3QMset/pp3dzIpNfwefxLIV2jLwGZCaNSdHEzbX8d
 gMNaMgap6U8D7HjK0DHDURDXXbOd9NZiMBa/RQnghxRo1QsOa/6fbngu5UD+p6Hijp6gr41vmoO
 M=
X-Received: by 2002:a17:907:3201:b0:8b1:2eef:154c with SMTP id
 xg1-20020a170907320100b008b12eef154cmr3650191ejb.0.1680712270904; 
 Wed, 05 Apr 2023 09:31:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgmmrstwLM9er6whhqISlnaFTBQG3GVZsWRo5UEspLnypzmK6pqX3Tnkx5QhnCZpKUpwGWCw==
X-Received: by 2002:a17:907:3201:b0:8b1:2eef:154c with SMTP id
 xg1-20020a170907320100b008b12eef154cmr3650166ejb.0.1680712270499; 
 Wed, 05 Apr 2023 09:31:10 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a170906939000b00930d505a567sm7498234ejx.128.2023.04.05.09.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:31:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fiona Ebner <f.ebner@proxmox.com>
Subject: [PATCH 3/3] block-backend: delay application of request queuing
Date: Wed,  5 Apr 2023 18:31:09 +0200
Message-Id: <20230405163109.197876-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405161752.194727-1-pbonzini@redhat.com>
References: <20230405161752.194727-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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


