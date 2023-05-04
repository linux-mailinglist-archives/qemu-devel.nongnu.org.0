Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B346F6AA2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:59:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXba-0003d6-EB; Thu, 04 May 2023 07:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbK-0003Ea-FB
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbH-0004E9-Bj
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i81jJMpIATmtlfBmGOPfMo/WO9M89YDrGbDRXnlDZfs=;
 b=YM48aHtXR+xwQia2OY+9stAiKLPRNyFquBFi0mhLfNUrXpYLo8Fi4pqGrxdhn13Dd5RX4T
 7571snO+VFzTk1M/sAhA11h4wq3fV4agap/u4kG9/Ty2lya/2CWLTevX51BMu+lB4aLbmF
 d/WTrLpkoxMiEFeVZ5R5fRftLWcQO3Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-U03l7DrIMMSQDySAA5fIzA-1; Thu, 04 May 2023 07:58:15 -0400
X-MC-Unique: U03l7DrIMMSQDySAA5fIzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 610B5811E7C;
 Thu,  4 May 2023 11:58:15 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40A6FC15BAD;
 Thu,  4 May 2023 11:58:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 11/20] vhdx: Require GRAPH_RDLOCK for accessing a node's
 parent list
Date: Thu,  4 May 2023 13:57:41 +0200
Message-Id: <20230504115750.54437-12-kwolf@redhat.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This adds GRAPH_RDLOCK annotations to declare that functions accessing
the parent list of a node need to hold a reader lock for the graph. As
it happens, they already do.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/vhdx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index 00777da91a..b20b1edf11 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1506,8 +1506,9 @@ exit:
  * There are 2 headers, and the highest sequence number will represent
  * the active header
  */
-static int vhdx_create_new_headers(BlockBackend *blk, uint64_t image_size,
-                                   uint32_t log_size)
+static int coroutine_fn GRAPH_RDLOCK
+vhdx_create_new_headers(BlockBackend *blk, uint64_t image_size,
+                        uint32_t log_size)
 {
     BlockDriverState *bs = blk_bs(blk);
     BdrvChild *child;
@@ -1897,8 +1898,8 @@ exit:
  *    .---- ~ ----------- ~ ------------ ~ ---------------- ~ -----------.
  *   1MB
  */
-static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
-                                       Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+vhdx_co_create(BlockdevCreateOptions *opts, Error **errp)
 {
     BlockdevCreateOptionsVhdx *vhdx_opts;
     BlockBackend *blk = NULL;
-- 
2.40.1


