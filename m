Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A73B4B6E6D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:10:36 +0100 (CET)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyXK-0004Ob-LY
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:10:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nJyKv-0002Cf-RN
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nJyKt-0002LO-NH
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644933462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGU5ObzA7YY3ilaXdUBs3DO1Rkv++h0CpWXXFqPO4kc=;
 b=T+4rNWbO5PzSClVhd/spTS/Lpx+k9U9u5pDvB6tmWn9CNS0nEmocUJshkYlrr8BVOcY5Q2
 y4SHk/Y5FXM00iieN5hzB+/z8sfjxApm+VUZXI8st1+nFejX+nWbDgNjG3r7Naz6JhsXlm
 4C2uivG0XsWMAPG/tzpspJrljwdTnks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-ePb5nIUmP02EsKK6y6e8wA-1; Tue, 15 Feb 2022 08:57:38 -0500
X-MC-Unique: ePb5nIUmP02EsKK6y6e8wA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7D9C81C9A6;
 Tue, 15 Feb 2022 13:57:37 +0000 (UTC)
Received: from localhost (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7906D7314D;
 Tue, 15 Feb 2022 13:57:37 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/3] block: Make bdrv_refresh_limits() non-recursive
Date: Tue, 15 Feb 2022 14:57:25 +0100
Message-Id: <20220215135727.28521-2-hreitz@redhat.com>
In-Reply-To: <20220215135727.28521-1-hreitz@redhat.com>
References: <20220215135727.28521-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_refresh_limits() recurses down to the node's children.  That does
not seem necessary: When we refresh limits on some node, and then
recurse down and were to change one of its children's BlockLimits, then
that would mean we noticed the changed limits by pure chance.  The fact
that we refresh the parent's limits has nothing to do with it, so the
reason for the change probably happened before this point in time, and
we should have refreshed the limits then.

On the other hand, we do not have infrastructure for noticing that block
limits change after they have been initialized for the first time (this
would require propagating the change upwards to the respective node's
parents), and so evidently we consider this case impossible.

If this case is impossible, then we will not need to recurse down in
bdrv_refresh_limits().  Every node's limits are initialized in
bdrv_open_driver(), and are refreshed whenever its children change.
We want to use the childrens' limits to get some initial default, but we
can just take them, we do not need to refresh them.

The problem with recursing is that bdrv_refresh_limits() is not atomic.
It begins with zeroing BDS.bl, and only then sets proper, valid limits.
If we do not drain all nodes whose limits are refreshed, then concurrent
I/O requests can encounter invalid request_alignment values and crash
qemu.  Therefore, a recursing bdrv_refresh_limits() requires the whole
subtree to be drained, which is currently not ensured by most callers.

A non-recursive bdrv_refresh_limits() only requires the node in question
to not receive I/O requests, and this is done by most callers in some
way or another:
- bdrv_open_driver() deals with a new node with no parents yet
- bdrv_set_file_or_backing_noperm() acts on a drained node
- bdrv_reopen_commit() acts only on drained nodes
- bdrv_append() should in theory require the node to be drained; in
  practice most callers just lock the AioContext, which should at least
  be enough to prevent concurrent I/O requests from accessing invalid
  limits

So we can resolve the bug by making bdrv_refresh_limits() non-recursive.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1879437
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/io.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index 4e4cb556c5..c3e7301613 100644
--- a/block/io.c
+++ b/block/io.c
@@ -189,10 +189,6 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
     QLIST_FOREACH(c, &bs->children, next) {
         if (c->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED | BDRV_CHILD_COW))
         {
-            bdrv_refresh_limits(c->bs, tran, errp);
-            if (*errp) {
-                return;
-            }
             bdrv_merge_limits(&bs->bl, &c->bs->bl);
             have_limits = true;
         }
-- 
2.34.1


