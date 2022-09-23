Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2287D5E7B46
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:03:45 +0200 (CEST)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obiLH-0004Ol-TW
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1obiBy-00040P-7t
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1obiBv-0004JS-92
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663937641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EkKRskXPzBwMCLI1Mo41jU9e8hcxjqJ8DUdjfKH7+PU=;
 b=YQBSUFjLeV0wC5HQY4l+aI/mjECkICO/RMh3Fp8+1y9n5ZWD6/1fGOUDhS6YCwI9RelxM9
 79wfoyYDA0Pqw6smHEO0Tp+tVs2SKd5N6oTBJtLND6382HzsE2UvfWPSrEaiFIvcqjRvG7
 FefFPRVHVlraHy2DD4lyIaoq1vsoZPc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-lRDh_vWmNsizgx1uk0v6bw-1; Fri, 23 Sep 2022 08:52:39 -0400
X-MC-Unique: lRDh_vWmNsizgx1uk0v6bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC737882829;
 Fri, 23 Sep 2022 12:52:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA4CB111F3BB;
 Fri, 23 Sep 2022 12:52:33 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 3/3] block: Start/end drain on correct AioContext
Date: Fri, 23 Sep 2022 14:52:27 +0200
Message-Id: <20220923125227.300202-4-hreitz@redhat.com>
In-Reply-To: <20220923125227.300202-1-hreitz@redhat.com>
References: <20220923125227.300202-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_parent_drained_{begin,end}_single() are supposed to operate on the
parent, not on the child, so they should not attempt to get the context
to poll from the child but the parent instead.  BDRV_POLL_WHILE(c->bs)
does get the context from the child, so we should replace it with
AIO_WAIT_WHILE() on the parent's context instead.

This problem becomes apparent when bdrv_replace_child_noperm() invokes
bdrv_parent_drained_end_single() after removing a child from a subgraph
that is in an I/O thread.  By the time bdrv_parent_drained_end_single()
is called, child->bs is NULL, and so BDRV_POLL_WHILE(c->bs, ...) will
poll the main loop instead of the I/O thread; but anything that
bdrv_parent_drained_end_single_no_poll() may have scheduled is going to
want to run in the I/O thread, but because we poll the main loop, the
I/O thread is never unpaused, and nothing is run, resulting in a
deadlock.

Closes: https://gitlab.com/qemu-project/qemu/-/issues/1215
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/io.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index 0a8cbefe86..7df1129b3b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -71,9 +71,10 @@ static void bdrv_parent_drained_end_single_no_poll(BdrvChild *c,
 void bdrv_parent_drained_end_single(BdrvChild *c)
 {
     int drained_end_counter = 0;
+    AioContext *ctx = bdrv_child_get_parent_aio_context(c);
     IO_OR_GS_CODE();
     bdrv_parent_drained_end_single_no_poll(c, &drained_end_counter);
-    BDRV_POLL_WHILE(c->bs, qatomic_read(&drained_end_counter) > 0);
+    AIO_WAIT_WHILE(ctx, qatomic_read(&drained_end_counter) > 0);
 }
 
 static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore,
@@ -116,13 +117,14 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
 
 void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
 {
+    AioContext *ctx = bdrv_child_get_parent_aio_context(c);
     IO_OR_GS_CODE();
     c->parent_quiesce_counter++;
     if (c->klass->drained_begin) {
         c->klass->drained_begin(c);
     }
     if (poll) {
-        BDRV_POLL_WHILE(c->bs, bdrv_parent_drained_poll_single(c));
+        AIO_WAIT_WHILE(ctx, bdrv_parent_drained_poll_single(c));
     }
 }
 
-- 
2.36.1


