Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C144C9216
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 18:41:53 +0100 (CET)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6VU-0001jN-4r
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 12:41:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nP6TA-00005m-Uy
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:39:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nP6T7-0001v5-0d
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646156362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GBGEBKESMlyCDCqPkP6UcRnZyFDU74ruXW0RvG2HMw0=;
 b=NL3Jh8E3uaj2iTiK+6bRizdXvRbk84/tuJAotKxqSDXtOtw4xhi/79RpdTertbpncyXDwH
 y+4Y/IYwAFR1ybEEmIZ4ZO4N5uo0D7KzUJWiFi7bez//6xsYZp3HqskF6AsAPd5j3RdoWT
 vIKfJ0X1lT+9/tLrkn01o8YfFDDpU7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-ThlRZzUaMmWHEk81DexZfw-1; Tue, 01 Mar 2022 12:39:20 -0500
X-MC-Unique: ThlRZzUaMmWHEk81DexZfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04294805EE5;
 Tue,  1 Mar 2022 17:39:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C37A841CA;
 Tue,  1 Mar 2022 17:39:15 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block: Fix BB.root changing across bdrv_next()
Date: Tue,  1 Mar 2022 18:39:14 +0100
Message-Id: <20220301173914.12279-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_next() has no guarantee that its caller has stopped all block graph
operations; for example, bdrv_flush_all() does not.

The latter can actually provoke such operations, because its
bdrv_flush() call, which runs a coroutine (bdrv_co_flush()), may run
this coroutine in a different AioContext than the main one, and then
when this coroutine is done and invokes aio_wait_kick(), the monitor may
get a chance to run and start executing some graph-modifying QMP
command.

One example for this is when the VM encounters an I/O error on a block
device and stops, triggering a bdrv_flush_all(), and a blockdev-mirror
is started simultaneously on a block node in an I/O thread.  When
bdrv_flush_all() comes to that node[1] and flushes it, the
aio_wait_kick() at the end of bdrv_co_flush_entry() may cause the
monitor to process the mirror request, and mirror_start_job() will then
replace the node by a mirror filter node, before bdrv_flush_all()
resumes and can invoke bdrv_next() again to continue iterating.

[1] Say there is a BlockBackend on top of the node in question, and so
bdrv_next() finds that BB and returns the node as the BB's blk_bs().
bdrv_next() will bdrv_ref() the node such that it remains valid through
bdrv_flush_all()'s iteration, and drop the reference when it is called
the next time.

The problem is that bdrv_next() does not store to which BDS it retains a
strong reference when the BDS is a BB's child, so on the subsequent
call, it will just invoke blk_bs() again and bdrv_unref() the returned
node -- but as the example above shows, this node might be a different
one than the one that was bdrv_ref()-ed before.  This can lead to a
use-after-free (for the mirror filter node in our example), because this
negligent bdrv_unref() would steal a strong reference from someone else.

We can solve this problem by always storing the returned (and strongly
referenced) BDS in BdrvNextIterator.bs.  When we want to drop the strong
reference of a BDS previously returned, always drop BdrvNextIterator.bs
instead of using other ways of trying to figure out what that BDS was
that we returned last time.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2058457
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
Sadly, I didn't find a nice way to test this, primarily because I
believe reproducing this requires a bdrv_flush_all() to come from the
VM (without QMP command).  The only way I know that this can happen is
when the VM encounters an I/O error and responds with stopping the
guest.
It's also anything but easily reproducible, and I can't think of a way
to improve on that, because it really seems to be based on chance
whether the aio_wait_kick() wakes up the monitor and has it process an
incoming QMP command.
---
 block/block-backend.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 4ff6b4d785..c822f257dc 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -575,7 +575,7 @@ BlockBackend *blk_next(BlockBackend *blk)
  * the monitor or attached to a BlockBackend */
 BlockDriverState *bdrv_next(BdrvNextIterator *it)
 {
-    BlockDriverState *bs, *old_bs;
+    BlockDriverState *bs, *old_bs = it->bs;
 
     /* Must be called from the main loop */
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
@@ -586,8 +586,6 @@ BlockDriverState *bdrv_next(BdrvNextIterator *it)
     if (it->phase == BDRV_NEXT_BACKEND_ROOTS) {
         BlockBackend *old_blk = it->blk;
 
-        old_bs = old_blk ? blk_bs(old_blk) : NULL;
-
         do {
             it->blk = blk_all_next(it->blk);
             bs = it->blk ? blk_bs(it->blk) : NULL;
@@ -601,11 +599,12 @@ BlockDriverState *bdrv_next(BdrvNextIterator *it)
         if (bs) {
             bdrv_ref(bs);
             bdrv_unref(old_bs);
+            it->bs = bs;
             return bs;
         }
         it->phase = BDRV_NEXT_MONITOR_OWNED;
-    } else {
-        old_bs = it->bs;
+        /* Start from the first monitor-owned BDS */
+        it->bs = NULL;
     }
 
     /* Then return the monitor-owned BDSes without a BB attached. Ignore all
-- 
2.34.1


