Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355DF6F4BE7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 23:12:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptxHX-0000gM-RP; Tue, 02 May 2023 17:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptxHV-0000fh-M2
 for qemu-devel@nongnu.org; Tue, 02 May 2023 17:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptxHU-0001DM-2R
 for qemu-devel@nongnu.org; Tue, 02 May 2023 17:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683061887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fLiHrHWV0rnB9USKDmJvpUPknURVT+Sqoy6N+O8lq7g=;
 b=UkSo2S47LYCEAHbSjiV5ldeFXR+G5D4oRzaJUapRncLmYa4qqXNk3BCr/pzQQEOt1jbv2g
 HymKnD9AP/zKJcQ977NW7m+bn2PO3a4ART7Zdma96Xu75lRZcjweicuvHlME9eGsOKLCIy
 ztO9vVrUlo7erCCWQisrPGyw9YmUydo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-b7e17-kMPZWAIysQF9pLCQ-1; Tue, 02 May 2023 17:11:22 -0400
X-MC-Unique: b7e17-kMPZWAIysQF9pLCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBE362805582;
 Tue,  2 May 2023 21:11:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA982026D25;
 Tue,  2 May 2023 21:11:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] block/export: call blk_set_dev_ops(blk, NULL, NULL)
Date: Tue,  2 May 2023 17:11:19 -0400
Message-Id: <20230502211119.720647-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Most export types install BlockDeviceOps pointers. It is easy to forget
to remove them because that happens automatically via the "drive" qdev
property in hw/ but not block/export/.

Put blk_set_dev_ops(blk, NULL, NULL) calls in the core export.c code so
the export types don't need to remember.

This fixes the nbd and vhost-user-blk export types.

Fixes: fd6afc501a01 ("nbd/server: Use drained block ops to quiesce the server")
Fixes: ca858a5fe94c ("vhost-user-blk-server: notify client about disk resize")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/export.c    | 2 ++
 block/export/vduse-blk.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/export/export.c b/block/export/export.c
index e3fee60611..62c7c22d45 100644
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
index f7ae44e3ce..b53ef39da0 100644
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


