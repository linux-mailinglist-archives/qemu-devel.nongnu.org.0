Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596C1625E56
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVwy-0008A9-6V; Fri, 11 Nov 2022 10:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwv-00089D-Tx
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:28:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwr-000100-Nm
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668180485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpO6bHceqhSFOOZ7SHjBucqbv0FfdUnBoIcUmn3dwAs=;
 b=aOu9l4knXibuoEVJ2v3FHe6k6AMdhVP2pK5rTquKh6hpf+F2RJdgkSdgLfm56e/uX38rzo
 9+90X/4Ct/0f32RYTvhiGj4gHafpCZkdDO7lZY3UaMYxhDhFPB/j0S8lmfrJrs4mMpYECk
 9sl+8XN6I4Fsa0OmeBXmI6M07Kwzm9s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-u0BvOtDTOfCLveW88xTaLQ-1; Fri, 11 Nov 2022 10:28:02 -0500
X-MC-Unique: u0BvOtDTOfCLveW88xTaLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2441282380D;
 Fri, 11 Nov 2022 15:28:01 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0C17C15BA8;
 Fri, 11 Nov 2022 15:28:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 09/11] block-backend: Update ctx immediately after root
Date: Fri, 11 Nov 2022 16:27:42 +0100
Message-Id: <20221111152744.261358-10-kwolf@redhat.com>
In-Reply-To: <20221111152744.261358-1-kwolf@redhat.com>
References: <20221111152744.261358-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

From: Hanna Reitz <hreitz@redhat.com>

blk_get_aio_context() asserts that blk->ctx is always equal to the root
BDS's context (if there is a root BDS).  Therefore,
blk_do_set_aio_context() must update blk->ctx immediately after the root
BDS's context has changed.

Without this patch, the next patch would break iotest 238, because
bdrv_drained_begin() (called by blk_do_set_aio_context()) may then
invoke bdrv_child_get_parent_aio_context() on the root child, i.e.
blk_get_aio_context().  However, by this point, blk->ctx would not have
been updated and thus differ from the root node's context.  This patch
fixes that.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221107151321.211175-3-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ed2f4b67a2..b48c91f4e1 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2158,6 +2158,11 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
                 return ret;
             }
         }
+        /*
+         * Make blk->ctx consistent with the root node before we invoke any
+         * other operations like drain that might inquire blk->ctx
+         */
+        blk->ctx = new_context;
         if (tgm->throttle_state) {
             bdrv_drained_begin(bs);
             throttle_group_detach_aio_context(tgm);
@@ -2166,9 +2171,10 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
         }
 
         bdrv_unref(bs);
+    } else {
+        blk->ctx = new_context;
     }
 
-    blk->ctx = new_context;
     return 0;
 }
 
-- 
2.38.1


