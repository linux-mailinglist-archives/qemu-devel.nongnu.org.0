Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0F689E13
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:24:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxuB-0007fv-Ce; Fri, 03 Feb 2023 10:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxu9-0007e4-0J
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxu7-0005PA-Iu
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675437787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaCl/tzum7v2jDGIcPwdXbJ03M5KUBTnLe5jdw5kVQA=;
 b=VkBBsPrSGGaADUoKp/Ec3R8DJDOJTapufwKOMuhx2ZeHq1FFko6160LAnFzdfNrgpNPimS
 xR5DtDXxZ0mM4ohTKwVI8tdzSpZsbeJ6zE+8lhmjc3/rVUtnYR8G+4Ursxt3uO9m1IhDXs
 DXCRT9l3LJWHerhaD/C2NnIPRsq96IA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-ZNfiBuGyM1SdTUvRKFq_lw-1; Fri, 03 Feb 2023 10:23:02 -0500
X-MC-Unique: ZNfiBuGyM1SdTUvRKFq_lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A72AD280604E;
 Fri,  3 Feb 2023 15:23:02 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD453404CD80;
 Fri,  3 Feb 2023 15:23:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 20/23] block: Mark bdrv_(un)register_buf() GRAPH_RDLOCK
Date: Fri,  3 Feb 2023 16:21:59 +0100
Message-Id: <20230203152202.49054-21-kwolf@redhat.com>
In-Reply-To: <20230203152202.49054-1-kwolf@redhat.com>
References: <20230203152202.49054-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_register_buf() and bdrv_unregister_buf() need to hold a reader lock
for the graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h |  7 ++++---
 block/io.c                       | 14 ++++++++++----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 30e6bd4909..88d9897c97 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -445,9 +445,10 @@ struct BlockDriver {
      *
      * Returns: true on success, false on failure
      */
-    bool (*bdrv_register_buf)(BlockDriverState *bs, void *host, size_t size,
-                              Error **errp);
-    void (*bdrv_unregister_buf)(BlockDriverState *bs, void *host, size_t size);
+    bool GRAPH_RDLOCK_PTR (*bdrv_register_buf)(
+        BlockDriverState *bs, void *host, size_t size, Error **errp);
+    void GRAPH_RDLOCK_PTR (*bdrv_unregister_buf)(
+        BlockDriverState *bs, void *host, size_t size);
 
     /*
      * This field is modified only under the BQL, and is part of
diff --git a/block/io.c b/block/io.c
index be350aba98..9d3db1753d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3184,13 +3184,15 @@ void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs)
 }
 
 /* Helper that undoes bdrv_register_buf() when it fails partway through */
-static void bdrv_register_buf_rollback(BlockDriverState *bs,
-                                       void *host,
-                                       size_t size,
-                                       BdrvChild *final_child)
+static void GRAPH_RDLOCK
+bdrv_register_buf_rollback(BlockDriverState *bs, void *host, size_t size,
+                           BdrvChild *final_child)
 {
     BdrvChild *child;
 
+    GLOBAL_STATE_CODE();
+    assert_bdrv_graph_readable();
+
     QLIST_FOREACH(child, &bs->children, next) {
         if (child == final_child) {
             break;
@@ -3210,6 +3212,8 @@ bool bdrv_register_buf(BlockDriverState *bs, void *host, size_t size,
     BdrvChild *child;
 
     GLOBAL_STATE_CODE();
+    GRAPH_RDLOCK_GUARD_MAINLOOP();
+
     if (bs->drv && bs->drv->bdrv_register_buf) {
         if (!bs->drv->bdrv_register_buf(bs, host, size, errp)) {
             return false;
@@ -3229,6 +3233,8 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size)
     BdrvChild *child;
 
     GLOBAL_STATE_CODE();
+    GRAPH_RDLOCK_GUARD_MAINLOOP();
+
     if (bs->drv && bs->drv->bdrv_unregister_buf) {
         bs->drv->bdrv_unregister_buf(bs, host, size);
     }
-- 
2.38.1


