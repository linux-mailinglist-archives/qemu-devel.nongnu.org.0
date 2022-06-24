Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C51559D82
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:43:12 +0200 (CEST)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lSh-0000d3-4y
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR0-0005zx-LM
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lQu-0000oK-BP
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+M2H+HUKutfKSfadgSOaZOxjRFUqS3xlmYZJOdOi6s=;
 b=aIg+82tFmuvoogNYsuF2B1eGmBmyS6hOPhgEa4uRmb82U4RGUKvon8q2kJjtMLzn/T5uun
 XVPBq8yXC8jIUai6JUkKkXgH/JeWhKn5ethb9Rxp5GytNv7oELfVPaZD4BDGMQtOXjjVg9
 SMQXJCvz4oTyhpdwHEJMDVcv2sHGojk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-sv6BzIkTPzGjxpGX2yikeg-1; Fri, 24 Jun 2022 11:41:16 -0400
X-MC-Unique: sv6BzIkTPzGjxpGX2yikeg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 468308032ED;
 Fri, 24 Jun 2022 15:41:16 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4A5B492C3B;
 Fri, 24 Jun 2022 15:41:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 02/20] block: get rid of blk->guest_block_size
Date: Fri, 24 Jun 2022 17:40:45 +0200
Message-Id: <20220624154103.185902-3-kwolf@redhat.com>
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

Commit 1b7fd729559c ("block: rename buffer_alignment to
guest_block_size") noted:

  At this point, the field is set by the device emulation, but completely
  ignored by the block layer.

The last time the value of buffer_alignment/guest_block_size was
actually used was before commit 339064d50639 ("block: Don't use guest
sector size for qemu_blockalign()").

This value has not been used since 2013. Get rid of it.

Cc: Xie Yongji <xieyongji@bytedance.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220518130945.2657905-1-stefanha@redhat.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/sysemu/block-backend-io.h    |  1 -
 block/block-backend.c                | 10 ----------
 block/export/vhost-user-blk-server.c |  1 -
 hw/block/virtio-blk.c                |  1 -
 hw/block/xen-block.c                 |  1 -
 hw/ide/core.c                        |  1 -
 hw/scsi/scsi-disk.c                  |  1 -
 hw/scsi/scsi-generic.c               |  1 -
 8 files changed, 17 deletions(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6517c39295..ccef514023 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -72,7 +72,6 @@ void blk_error_action(BlockBackend *blk, BlockErrorAction action,
 void blk_iostatus_set_err(BlockBackend *blk, int error);
 int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
-void blk_set_guest_block_size(BlockBackend *blk, int align);
 
 void blk_io_plug(BlockBackend *blk);
 void blk_io_unplug(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..d4abdf8faa 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -56,9 +56,6 @@ struct BlockBackend {
     const BlockDevOps *dev_ops;
     void *dev_opaque;
 
-    /* the block size for which the guest device expects atomicity */
-    int guest_block_size;
-
     /* If the BDS tree is removed, some of its options are stored here (which
      * can be used to restore those options in the new BDS on insert) */
     BlockBackendRootState root_state;
@@ -998,7 +995,6 @@ void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
     blk->dev = NULL;
     blk->dev_ops = NULL;
     blk->dev_opaque = NULL;
-    blk->guest_block_size = 512;
     blk_set_perm(blk, 0, BLK_PERM_ALL, &error_abort);
     blk_unref(blk);
 }
@@ -2100,12 +2096,6 @@ int blk_get_max_iov(BlockBackend *blk)
     return blk->root->bs->bl.max_iov;
 }
 
-void blk_set_guest_block_size(BlockBackend *blk, int align)
-{
-    IO_CODE();
-    blk->guest_block_size = align;
-}
-
 void *blk_try_blockalign(BlockBackend *blk, size_t size)
 {
     IO_CODE();
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index a129204c44..b2e458ade3 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -495,7 +495,6 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         return -EINVAL;
     }
     vexp->blk_size = logical_block_size;
-    blk_set_guest_block_size(exp->blk, logical_block_size);
 
     if (vu_opts->has_num_queues) {
         num_queues = vu_opts->num_queues;
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index cd804795c6..e9ba752f6b 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1228,7 +1228,6 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     s->change = qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s);
     blk_set_dev_ops(s->blk, &virtio_block_ops, s);
-    blk_set_guest_block_size(s->blk, s->conf.conf.logical_block_size);
 
     blk_iostatus_enable(s->blk);
 
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 674953f1ad..345b284d70 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -243,7 +243,6 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     }
 
     blk_set_dev_ops(blk, &xen_block_dev_ops, blockdev);
-    blk_set_guest_block_size(blk, conf->logical_block_size);
 
     if (conf->discard_granularity == -1) {
         conf->discard_granularity = conf->physical_block_size;
diff --git a/hw/ide/core.c b/hw/ide/core.c
index c2caa54285..7cbc0a54a7 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2548,7 +2548,6 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
     s->smart_selftest_count = 0;
     if (kind == IDE_CD) {
         blk_set_dev_ops(blk, &ide_cd_block_ops, s);
-        blk_set_guest_block_size(blk, 2048);
     } else {
         if (!blk_is_inserted(s->blk)) {
             error_setg(errp, "Device needs media, but drive is empty");
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 072686ed58..91acb5c0ce 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2419,7 +2419,6 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
     } else {
         blk_set_dev_ops(s->qdev.conf.blk, &scsi_disk_block_ops, s);
     }
-    blk_set_guest_block_size(s->qdev.conf.blk, s->qdev.blocksize);
 
     blk_iostatus_enable(s->qdev.conf.blk);
 
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 0ab00ef85c..ada24d7486 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -321,7 +321,6 @@ static void scsi_read_complete(void * opaque, int ret)
         s->blocksize = ldl_be_p(&r->buf[8]);
         s->max_lba = ldq_be_p(&r->buf[0]);
     }
-    blk_set_guest_block_size(s->conf.blk, s->blocksize);
 
     /*
      * Patch MODE SENSE device specific parameters if the BDS is opened
-- 
2.35.3


