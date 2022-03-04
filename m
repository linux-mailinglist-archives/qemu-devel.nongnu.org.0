Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46334CDAC4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:33:54 +0100 (CET)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBoP-0003L3-Ns
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:33:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6m-0006oQ-7V
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6k-00081f-80
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUVf/AczgzKqbBVNtcb1mFiBGDJwDNp2kc/UHRuvOOU=;
 b=GTytEW2ujz17GgeodP28RnckoHPTIh/T41fzDCbs/B6jtR6x+W+/VJPHGFbkHMykaKVHnD
 v6jTm36M5ilPh7Wmi2Ak8+nTTEB+7xLKRwSwfa1sXOoHc1znIevKi+MjTh/Ddlf6+8kpNx
 QQjb9tE72gIoz3CCccb4B5SJvwW9Gzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-OF7HbW2JOZ6FdznVAjrfEg-1; Fri, 04 Mar 2022 11:48:42 -0500
X-MC-Unique: OF7HbW2JOZ6FdznVAjrfEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A98B21006AA5;
 Fri,  4 Mar 2022 16:48:41 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F99C83BF9;
 Fri,  4 Mar 2022 16:48:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 45/50] block: Make bdrv_refresh_limits() non-recursive
Date: Fri,  4 Mar 2022 17:47:06 +0100
Message-Id: <20220304164711.474713-46-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

bdrv_refresh_limits() recurses down to the node's children.  That does
not seem necessary: When we refresh limits on some node, and then
recurse down and were to change one of its children's BlockLimits, then
that would mean we noticed the changed limits by pure chance.  The fact
that we refresh the parent's limits has nothing to do with it, so the
reason for the change probably happened before this point in time, and
we should have refreshed the limits then.

Consequently, we should actually propagate block limits changes upwards,
not downwards.  That is a separate and pre-existing issue, though, and
so will not be addressed in this patch.

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
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20220216105355.30729-2-hreitz@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index 4b1d97c7da..efc011ce65 100644
--- a/block/io.c
+++ b/block/io.c
@@ -193,10 +193,6 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
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
2.35.1


