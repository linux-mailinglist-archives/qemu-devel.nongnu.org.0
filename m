Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814056B234E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEhL-0007pf-Hc; Thu, 09 Mar 2023 06:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1paEhJ-0007oN-Ut
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:44:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1paEhI-0005wX-Dy
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678362275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pkl3QQiULfaJeKXp0fEhDDTHTG2o8i8jjKWPXt3xGTY=;
 b=aQbBNBhA8DEqO0KuttTygBIOxz6gOcJdrp6VLCYARrxpmhIpmA27IDgGodzNYGJPSkYRA9
 UKyDvIlFWMtP79suwB4LqkBSpuVfAF19owH62VgOSKvZxZ3O2MyO9rsZ3xhjNcId3FHy4A
 W5F81CGzmHdIpDhDLPm8tfhQOQfxgrE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-WnG4tYRGOCesZnt37Q_5yA-1; Thu, 09 Mar 2023 06:44:32 -0500
X-MC-Unique: WnG4tYRGOCesZnt37Q_5yA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 360E138173D1;
 Thu,  9 Mar 2023 11:44:32 +0000 (UTC)
Received: from localhost (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B86A31121314;
 Thu,  9 Mar 2023 11:44:31 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
Date: Thu,  9 Mar 2023 12:44:30 +0100
Message-Id: <20230309114430.33684-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 7e5cdb345f77d76cb4877fe6230c4e17a7d0d0ca ("ide: Increment BB
in-flight counter for TRIM BH") fixed a problem when cancelling trims:
ide_cancel_dma_sync() drains the BB to stop a potentially ongoing
request, and then asserts that no request is active anymore.  When
trying to cancel a trim, this would only drain a single
blk_aio_pdiscard() operation, but not necessarily the trim as a whole.
Said commit fixed that by counting the whole trim as an operation,
incrementing the in-flight counter for it, so the blk_drain() in
ide_cancel_dma_sync() would wait for it.

Fiona found a problem with this, specifically that draining a BB while
an IDE trim operation is going on can produce a deadlock: An ongoing
blk_aio_pdiscard() will be settled, but any further discard in the same
trim will go into the BB's queued_request list and wait there until the
drain stops.  Meanwhile, the whole trim keeps the BB's in_flight_counter
incremented, so the BB will never be considered drained, and qemu hangs.

Therefore, we cannot keep the in-flight counter incremented throughout
the trim operation.  We should still increment it before the completion
BH (ide_trim_bh_cb()) is scheduled and decrement it there, so that the
blk_drain() in ide_cancel_dma_sync() can await completion of this
scheduled BH.  With that change, however, it can take multiple
iterations of blk_drain() to really settle the whole trim operation, and
so ide_cancel_dma_sync() must run it in a loop.

Reported-by: Fiona Ebner <f.ebner@proxmox.com>
Fixes: 7e5cdb345f77d76cb4877fe6230c4e17a7d0d0ca
       ("ide: Increment BB in-flight counter for TRIM BH")
Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
---
Tested with a small test boot sector that issues a trim operation with
any number of discards from 0 to 64.  Before this patch, doing so hangs
starting from 2 discards; and before 7e5cdb345f, doing so crashes qemu
with any number of discards.  With this patch, it always works.
---
 hw/ide/core.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 2d034731cf..54c51084d2 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -444,7 +444,7 @@ static void ide_trim_bh_cb(void *opaque)
     iocb->bh = NULL;
     qemu_aio_unref(iocb);
 
-    /* Paired with an increment in ide_issue_trim() */
+    /* Paired with an increment in ide_issue_trim_cb() */
     blk_dec_in_flight(blk);
 }
 
@@ -504,6 +504,14 @@ static void ide_issue_trim_cb(void *opaque, int ret)
 done:
     iocb->aiocb = NULL;
     if (iocb->bh) {
+        /*
+         * Paired with a decrement in ide_trim_bh_cb(): Ensure we have
+         * an in-flight count while this TrimAIOCB object lives.
+         * There is no ongoing blk_aio_pdiscard() operation anymore,
+         * so here we increment the counter manually before returning.
+         */
+        blk_inc_in_flight(s->blk);
+
         replay_bh_schedule_event(iocb->bh);
     }
 }
@@ -515,9 +523,6 @@ BlockAIOCB *ide_issue_trim(
     IDEState *s = opaque;
     TrimAIOCB *iocb;
 
-    /* Paired with a decrement in ide_trim_bh_cb() */
-    blk_inc_in_flight(s->blk);
-
     iocb = blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
     iocb->s = s;
     iocb->bh = qemu_bh_new(ide_trim_bh_cb, iocb);
@@ -737,11 +742,17 @@ void ide_cancel_dma_sync(IDEState *s)
      * In the future we'll be able to safely cancel the I/O if the
      * whole DMA operation will be submitted to disk with a single
      * aio operation with preadv/pwritev.
+     *
+     * Note that TRIM operations call blk_aio_pdiscard() multiple
+     * times (and finally increment s->blk's in-flight counter while
+     * ide_trim_bh_cb() is scheduled), so we have to loop blk_drain()
+     * until the whole operation is done.
      */
     if (s->bus->dma->aiocb) {
         trace_ide_cancel_dma_sync_remaining();
-        blk_drain(s->blk);
-        assert(s->bus->dma->aiocb == NULL);
+        while (s->bus->dma->aiocb) {
+            blk_drain(s->blk);
+        }
     }
 }
 
-- 
2.39.1


