Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4536A0FD5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhV-0006s9-QL; Thu, 23 Feb 2023 13:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhN-0006pb-D3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhL-00038z-0y
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Mgac+mvWOZl/8gjSxUCtrPRlYH1SMNILRMsDZSgyFY=;
 b=NjaJfgxQqmLPdwNIvTTkFsvgMUQKivCXjqK4si/sFYMcbArjgCjlwmZpl2QoUvsm4Am0+6
 Lu17zRGqgO91b05sDqp41WrgXPh/oZnq2xFslGD33nidHcADtkeY9B7IHmdGRiDhRqSVv1
 MCFBwrNBvV4ljzCCGt03yJ2RHEa4BAg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-Q1anvWjUO_S8soF0NuE0WQ-1; Thu, 23 Feb 2023 13:52:03 -0500
X-MC-Unique: Q1anvWjUO_S8soF0NuE0WQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFCE586C176;
 Thu, 23 Feb 2023 18:52:02 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28E4D1121314;
 Thu, 23 Feb 2023 18:52:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 12/29] block: Mark bdrv_co_pwrite_sync() and callers
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:29 +0100
Message-Id: <20230223185146.306454-13-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
bdrv_co_pwrite_sync() need to hold a reader lock for the graph.

For some places, we know that they will hold the lock, but we don't have
the GRAPH_RDLOCK annotations yet. In this case, add assume_graph_lock()
with a FIXME comment. These places will be removed once everything is
properly annotated.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-13-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h            | 2 +-
 include/block/block-io.h | 7 ++++---
 block/io.c               | 3 +--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 7487bcfcf9..c59e33c01c 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -893,7 +893,7 @@ int qcow2_inc_refcounts_imrt(BlockDriverState *bs, BdrvCheckResult *res,
 int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 BlockDriverAmendStatusCB *status_cb,
                                 void *cb_opaque, Error **errp);
-int coroutine_fn qcow2_shrink_reftable(BlockDriverState *bs);
+int coroutine_fn GRAPH_RDLOCK qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
 int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index ec26f07d60..bbe8a5659a 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -60,9 +60,10 @@ int co_wrapper_mixed_bdrv_rdlock
 bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
                  const void *buf, BdrvRequestFlags flags);
 
-int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
-                                     int64_t bytes, const void *buf,
-                                     BdrvRequestFlags flags);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
+                    const void *buf, BdrvRequestFlags flags);
+
 /*
  * Efficiently zero a region of the disk image.  Note that this is a regular
  * I/O request like read or write and should have a reasonable size.  This
diff --git a/block/io.c b/block/io.c
index ec8b317818..2593823f62 100644
--- a/block/io.c
+++ b/block/io.c
@@ -933,8 +933,7 @@ int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
 {
     int ret;
     IO_CODE();
-
-    assume_graph_lock(); /* FIXME */
+    assert_bdrv_graph_readable();
 
     ret = bdrv_co_pwrite(child, offset, bytes, buf, flags);
     if (ret < 0) {
-- 
2.39.2


