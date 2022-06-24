Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415AE559D92
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:46:21 +0200 (CEST)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lVk-0006IW-4n
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR0-0005zs-VQ
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lQu-0000oF-Oi
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ISxYIAalEGC/YEQrtDquurBJSikWysnYRP8QL415B0=;
 b=WhNXRjDN0VE0LJmw5laaiBDiwiwswO/2+HBpJd8n7waYN1g6FxrE0FDo4cgaKQqUHgowyT
 +bybCifRm9V0xr3VuYiqtWyvTgo2D5AaDhqrgXRSZ8ZdNQmRkdwRFrhGfvKozWKx1FtkjY
 xlU1A1Cy8NointWQro7rv3ISiC7PKmI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-hrZFPYj4N0-ZEafK7dGViA-1; Fri, 24 Jun 2022 11:41:15 -0400
X-MC-Unique: hrZFPYj4N0-ZEafK7dGViA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C3A61818801;
 Fri, 24 Jun 2022 15:41:15 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9DE5492CA5;
 Fri, 24 Jun 2022 15:41:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 01/20] block: drop unused bdrv_co_drain() API
Date: Fri, 24 Jun 2022 17:40:44 +0200
Message-Id: <20220624154103.185902-2-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

bdrv_co_drain() has not been used since commit 9a0cec664eef ("mirror:
use bdrv_drained_begin/bdrv_drained_end") in 2016. Remove it so there
are fewer drain scenarios to worry about.

Use bdrv_drained_begin()/bdrv_drained_end() instead. They are "mixed"
functions that can be called from coroutine context. Unlike
bdrv_co_drain(), these functions provide control of the length of the
drained section, which is usually the right thing.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220521122714.3837731-1-stefanha@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h |  1 -
 block/io.c               | 15 ---------------
 2 files changed, 16 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 62c84f0519..053a27141a 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -270,7 +270,6 @@ void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter);
                    cond); })
 
 void bdrv_drain(BlockDriverState *bs);
-void coroutine_fn bdrv_co_drain(BlockDriverState *bs);
 
 int generated_co_wrapper
 bdrv_truncate(BdrvChild *child, int64_t offset, bool exact,
diff --git a/block/io.c b/block/io.c
index 789e6373d5..1e9bf09a49 100644
--- a/block/io.c
+++ b/block/io.c
@@ -588,21 +588,6 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
     BDRV_POLL_WHILE(child->bs, qatomic_read(&drained_end_counter) > 0);
 }
 
-/*
- * Wait for pending requests to complete on a single BlockDriverState subtree,
- * and suspend block driver's internal I/O until next request arrives.
- *
- * Note that unlike bdrv_drain_all(), the caller must hold the BlockDriverState
- * AioContext.
- */
-void coroutine_fn bdrv_co_drain(BlockDriverState *bs)
-{
-    IO_OR_GS_CODE();
-    assert(qemu_in_coroutine());
-    bdrv_drained_begin(bs);
-    bdrv_drained_end(bs);
-}
-
 void bdrv_drain(BlockDriverState *bs)
 {
     IO_OR_GS_CODE();
-- 
2.35.3


