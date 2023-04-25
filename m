Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649416EE6DA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:35:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMX3-0007jL-LY; Tue, 25 Apr 2023 13:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWn-0006lO-0C
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWj-0004J0-D1
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3qzrqMHVVPdFGtgVVqCw97D0dh4S2ZmJg4JIZzvpDo=;
 b=Iza9clCDH3SCFEE35dmfo/Fk2KMGy78t3iLuYP3H/DijVSHEOhy0RmkHdCv0Yayh1z+E+T
 i2+eVyLirxq8qtDLAsWRZdcCrLRMp3aC5WdIcWLFXfPD7TjDEeGA73vqJQuBdPyHrA5YFD
 T0PN+qjHtdV12094BsNW9owKgBW6vU8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-aM7R48FYOMijLbk4d1dhsg-1; Tue, 25 Apr 2023 13:32:25 -0400
X-MC-Unique: aM7R48FYOMijLbk4d1dhsg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4F621C08787;
 Tue, 25 Apr 2023 17:32:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA8A1492B03;
 Tue, 25 Apr 2023 17:32:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 15/20] block: Mark bdrv_co_debug_event() GRAPH_RDLOCK
Date: Tue, 25 Apr 2023 19:31:53 +0200
Message-Id: <20230425173158.574203-16-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_debug_event() need to hold a reader lock for the graph.

Unfortunately we cannot use a co_wrapper_bdrv_rdlock, because the
function is called by mixed functions that run both in coroutine and
non-coroutine context (for example blkdebug_open).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 9 +++++----
 include/block/block_int-common.h | 4 ++--
 block.c                          | 2 ++
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index bba7f957e1..1f612ec5bd 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -205,10 +205,11 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
 void bdrv_enable_copy_on_read(BlockDriverState *bs);
 void bdrv_disable_copy_on_read(BlockDriverState *bs);
 
-void coroutine_fn bdrv_co_debug_event(BlockDriverState *bs,
-                                      BlkdebugEvent event);
-void co_wrapper_mixed bdrv_debug_event(BlockDriverState *bs,
-                                       BlkdebugEvent event);
+void coroutine_fn GRAPH_RDLOCK
+bdrv_co_debug_event(BlockDriverState *bs, BlkdebugEvent event);
+
+void co_wrapper_mixed_bdrv_rdlock
+bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event);
 
 #define BLKDBG_EVENT(child, evt) \
     do { \
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index ee77903f72..88ce7f9d9e 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -735,8 +735,8 @@ struct BlockDriver {
     int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_check)(
         BlockDriverState *bs, BdrvCheckResult *result, BdrvCheckMode fix);
 
-    void coroutine_fn (*bdrv_co_debug_event)(BlockDriverState *bs,
-                                             BlkdebugEvent event);
+    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_debug_event)(
+        BlockDriverState *bs, BlkdebugEvent event);
 
     /* io queue for linux-aio */
     void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_io_plug)(BlockDriverState *bs);
diff --git a/block.c b/block.c
index a6deaf8ad1..1bc766c778 100644
--- a/block.c
+++ b/block.c
@@ -6399,6 +6399,8 @@ BlockStatsSpecific *bdrv_get_specific_stats(BlockDriverState *bs)
 void coroutine_fn bdrv_co_debug_event(BlockDriverState *bs, BlkdebugEvent event)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
+
     if (!bs || !bs->drv || !bs->drv->bdrv_co_debug_event) {
         return;
     }
-- 
2.40.0


