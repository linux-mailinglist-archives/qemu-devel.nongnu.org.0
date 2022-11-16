Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48AB62C020
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:51:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIn4-0000sI-Q9; Wed, 16 Nov 2022 08:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImx-0000mI-QJ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImm-00082o-SG
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O674RGVxUBm8Idb7TTf4T44EFihJr3wsC24ssr01v7s=;
 b=YW07zA4bx7kM0qk1uhhYoVkXNPDD3uli1Ov8kFXnsPcLKnnipTtAtCtVdoHifUBRIKVr+N
 S8sWo/41SBsXIYrQaii5GM0CO+D877cr0gE67JCKcn1Z8pWr2w2+GyyLJEQRzqCsTkFwJg
 t3/HaOlnmRexFZvJP8ao3PBvyP1RUHs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-omFFKHu1NpmXtkh_LJXddg-1; Wed, 16 Nov 2022 08:48:57 -0500
X-MC-Unique: omFFKHu1NpmXtkh_LJXddg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BA90811E75;
 Wed, 16 Nov 2022 13:48:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EBB44A9266;
 Wed, 16 Nov 2022 13:48:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 15/20] block-gen: assert that {bdrv/blk}_co_flush is always
 called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:45 -0500
Message-Id: <20221116134850.3051419-16-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

This function, in addition to be called by a generated_co_wrapper,
is also called by the blk_* API.
The strategy is to always take the lock at the function called
when the coroutine is created, to avoid recursive locking.

Protecting bdrv_co_flush() implies that the following BlockDriver
callbacks always called with graph rdlock taken:
- bdrv_co_flush
- bdrv_co_flush_to_os
- bdrv_co_flush_to_disk

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c            | 3 ++-
 block/io.c                       | 1 +
 include/block/block_int-common.h | 6 ++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 083ed6009e..d660772375 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1759,8 +1759,9 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
-    blk_wait_while_drained(blk);
     IO_CODE();
+    blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
diff --git a/block/io.c b/block/io.c
index cfc201ef91..0bf3919939 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2757,6 +2757,7 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
     int ret = 0;
     IO_CODE();
 
+    assert_bdrv_graph_readable();
     bdrv_inc_in_flight(bs);
 
     if (!bdrv_is_inserted(bs) || bdrv_is_read_only(bs) ||
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 64c5bb64de..bab0521943 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -661,6 +661,8 @@ struct BlockDriver {
      * Flushes all data for all layers by calling bdrv_co_flush for underlying
      * layers, if needed. This function is needed for deterministic
      * synchronization of the flush finishing callback.
+     *
+     * Called with graph rdlock taken.
      */
     int coroutine_fn (*bdrv_co_flush)(BlockDriverState *bs);
 
@@ -671,6 +673,8 @@ struct BlockDriver {
     /*
      * Flushes all data that was already written to the OS all the way down to
      * the disk (for example file-posix.c calls fsync()).
+     *
+     * Called with graph rdlock taken.
      */
     int coroutine_fn (*bdrv_co_flush_to_disk)(BlockDriverState *bs);
 
@@ -678,6 +682,8 @@ struct BlockDriver {
      * Flushes all internal caches to the OS. The data may still sit in a
      * writeback cache of the host OS, but it will survive a crash of the qemu
      * process.
+     *
+     * Called with graph rdlock held.
      */
     int coroutine_fn (*bdrv_co_flush_to_os)(BlockDriverState *bs);
 
-- 
2.31.1


