Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210156F5ECD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:03:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHkR-0001tI-Q1; Wed, 03 May 2023 15:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puHkP-0001sz-Uq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 15:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puHkO-0004wA-F5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 15:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683140559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IHGxrm/Xp0lBQuQRwa1E6vZgFCzDQjnRyAKec7RbHk=;
 b=LO2YxD5oLWzwue5KOiofswXktxNQTEM/JEDtjiyPGIIYkvY5rxxHLgpZzwPuu/bqqGItn4
 IIx1E5Hm0nYxEGrywFKH/KnrcmxxXoEZ7VzELa9bYwAssQuSjuwuBGkRq5bJOuGnYmsXnY
 6uip262ODdEmQoX/jWf1fCHtWXTCgw8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-_CsLVcBANFGSeA6tRlnRHw-1; Wed, 03 May 2023 15:02:36 -0400
X-MC-Unique: _CsLVcBANFGSeA6tRlnRHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 342BEA0F381;
 Wed,  3 May 2023 19:02:36 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6698A1410F2A;
 Wed,  3 May 2023 19:02:35 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PULL 2/2] block/export: call blk_set_dev_ops(blk, NULL, NULL)
Date: Wed,  3 May 2023 14:02:32 -0500
Message-Id: <20230503190232.362022-3-eblake@redhat.com>
In-Reply-To: <20230503190232.362022-1-eblake@redhat.com>
References: <20230503190232.362022-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Most export types install BlockDeviceOps pointers. It is easy to forget
to remove them because that happens automatically via the "drive" qdev
property in hw/ but not block/export/.

Put blk_set_dev_ops(blk, NULL, NULL) calls in the core export.c code so
the export types don't need to remember.

This fixes the nbd and vhost-user-blk export types.

Fixes: fd6afc501a01 ("nbd/server: Use drained block ops to quiesce the server")
Fixes: ca858a5fe94c ("vhost-user-blk-server: notify client about disk resize")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20230502211119.720647-1-stefanha@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/export/export.c    | 2 ++
 block/export/vduse-blk.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/export/export.c b/block/export/export.c
index e3fee606116..62c7c22d45d 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -192,6 +192,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
     return exp;

 fail:
+    blk_set_dev_ops(exp->blk, NULL, NULL);
     blk_unref(blk);
     aio_context_release(ctx);
     if (exp) {
@@ -219,6 +220,7 @@ static void blk_exp_delete_bh(void *opaque)
     assert(exp->refcount == 0);
     QLIST_REMOVE(exp, next);
     exp->drv->delete(exp);
+    blk_set_dev_ops(exp->blk, NULL, NULL);
     blk_unref(exp->blk);
     qapi_event_send_block_export_deleted(exp->id);
     g_free(exp->id);
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index f7ae44e3cea..b53ef39da02 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -346,7 +346,6 @@ static void vduse_blk_exp_delete(BlockExport *exp)

     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vblk_exp);
-    blk_set_dev_ops(exp->blk, NULL, NULL);
     ret = vduse_dev_destroy(vblk_exp->dev);
     if (ret != -EBUSY) {
         unlink(vblk_exp->recon_file);
-- 
2.40.1


