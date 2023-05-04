Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE56F6AB7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:01:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXbc-0003in-IR; Thu, 04 May 2023 07:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbR-0003K4-7G
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbP-0004Fw-9b
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZKCrqmNhgsnPTeK1gszRIdl4QSE8RZXAWYHCpXnO8E=;
 b=g7auOgBYJTLLM6Iu71sy9EOh/cBXeTWjZca4pvQtThq6ui6wcqZiLJ38k9/w9vEROeGJVJ
 NyCqPcA+uQ2isG3IhUNoeYCjp5GMXXbpHqxjXrzjdMB3J6VJQDGkjj9xC1ssb+JO4QNKAg
 xysphDR/lJV0acll1let2YQBs0nnzpY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-AaLk_xOVMfSrE8ecPWbKyw-1; Thu, 04 May 2023 07:58:24 -0400
X-MC-Unique: AaLk_xOVMfSrE8ecPWbKyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDF6C280BC47;
 Thu,  4 May 2023 11:58:23 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37981C15BAD;
 Thu,  4 May 2023 11:58:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 17/20] block: Mark bdrv_query_bds_stats() and callers
 GRAPH_RDLOCK
Date: Thu,  4 May 2023 13:57:47 +0200
Message-Id: <20230504115750.54437-18-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_query_bds_stats() need to hold a reader lock for the graph because
it accesses the children list of a node.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/qapi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index c84147849d..71f2751257 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -604,8 +604,8 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
         = bdrv_latency_histogram_stats(&hgram[BLOCK_ACCT_FLUSH]);
 }
 
-static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
-                                        bool blk_level)
+static BlockStats * GRAPH_RDLOCK
+bdrv_query_bds_stats(BlockDriverState *bs, bool blk_level)
 {
     BdrvChild *parent_child;
     BlockDriverState *filter_or_cow_bs;
@@ -713,6 +713,8 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
     BlockBackend *blk;
     BlockDriverState *bs;
 
+    GRAPH_RDLOCK_GUARD_MAINLOOP();
+
     /* Just to be safe if query_nodes is not always initialized */
     if (has_query_nodes && query_nodes) {
         for (bs = bdrv_next_node(NULL); bs; bs = bdrv_next_node(bs)) {
-- 
2.40.1


