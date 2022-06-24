Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD4559D86
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:43:53 +0200 (CEST)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lTM-0002kL-Dm
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR6-0006J7-2i
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR1-0000rD-Gl
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/xkwsXp5pBDorvsuPFgfjpFzMQWzB6ZHuuuHlZ9KSw=;
 b=Zd5zzyW6eMXKCZyZl3LLL092sACKVRzuZiGMAdAca57Jzz0JtRqLjsZqU0biytdRrWruIx
 gg1hRxhDUQlOZQC3iYbuXGnITrU0/jjYss81Ibq3kgpw2Z4ogvPm8BzFQacJLuaZlcxB3b
 LSMaP1Kq6aItSRFhuk7CRIUeLc4+Xxc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-kM9HM1kNMz-4p2r4AfxVxA-1; Fri, 24 Jun 2022 11:41:25 -0400
X-MC-Unique: kM9HM1kNMz-4p2r4AfxVxA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38EFC3C10163;
 Fri, 24 Jun 2022 15:41:25 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99058492CA5;
 Fri, 24 Jun 2022 15:41:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 12/20] vduse-blk: Add vduse-blk resize support
Date: Fri, 24 Jun 2022 17:40:55 +0200
Message-Id: <20220624154103.185902-13-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@bytedance.com>

To support block resize, this uses vduse_dev_update_config()
to update the capacity field in configuration space and inject
config interrupt on the block resize callback.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220523084611.91-8-xieyongji@bytedance.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vduse-blk.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 04be16c133..cab1904234 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -204,6 +204,23 @@ static void blk_aio_detach(void *opaque)
     vblk_exp->export.ctx = NULL;
 }
 
+static void vduse_blk_resize(void *opaque)
+{
+    BlockExport *exp = opaque;
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+    struct virtio_blk_config config;
+
+    config.capacity =
+            cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BITS);
+    vduse_dev_update_config(vblk_exp->dev, sizeof(config.capacity),
+                            offsetof(struct virtio_blk_config, capacity),
+                            (char *)&config.capacity);
+}
+
+static const BlockDevOps vduse_block_ops = {
+    .resize_cb = vduse_blk_resize,
+};
+
 static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                                 Error **errp)
 {
@@ -299,6 +316,8 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vblk_exp);
 
+    blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);
+
     return 0;
 }
 
@@ -308,6 +327,7 @@ static void vduse_blk_exp_delete(BlockExport *exp)
 
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vblk_exp);
+    blk_set_dev_ops(exp->blk, NULL, NULL);
     vduse_dev_destroy(vblk_exp->dev);
 }
 
-- 
2.35.3


