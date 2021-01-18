Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4C2F9FEF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:37:50 +0100 (CET)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tn3-00043B-70
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1Tkc-0002Nz-1t
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1TkL-0003h8-4B
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610973298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQ4tVG8pq0628Hcg+TaGkd9efLJqsxednwFaM/YysaY=;
 b=LSLyRSQy0v3lyWy2IAiX/Z7X3ns5o9Q7u8s80QF8VqwNCVVBghMixUuJWGgrkuHVteMMEJ
 9X4tyO/ixJcjR5Xoj9huS3X8qG/gpq4D8bTNUhN2jQoELSceJFnxPc47wwbX6OsgMrlk1G
 huBOl5mgt6B+x1GDmz6xx5f+V/NlAag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-J-NVLFklOq-8nLUERAqJlA-1; Mon, 18 Jan 2021 07:34:54 -0500
X-MC-Unique: J-NVLFklOq-8nLUERAqJlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88487107ACE8;
 Mon, 18 Jan 2021 12:34:53 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4277D9CA0;
 Mon, 18 Jan 2021 12:34:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block: Separate blk_is_writable() and
 blk_supports_write_perm()
Date: Mon, 18 Jan 2021 13:34:47 +0100
Message-Id: <20210118123448.307825-2-kwolf@redhat.com>
In-Reply-To: <20210118123448.307825-1-kwolf@redhat.com>
References: <20210118123448.307825-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, alxndr@bu.edu, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, blk_is_read_only() tells whether a given BlockBackend can
only be used in read-only mode because its root node is read-only. Some
callers actually try to answer a slightly different question: Is the
BlockBackend configured to be writable, by taking write permissions on
the root node?

This can differ, for example, for CD-ROM devices which don't take write
permissions, but may be backed by a writable image file. scsi-cd allows
write requests to the drive if blk_is_read_only() returns false.
However, the write request will immediately run into an assertion
failure because the write permission is missing.

This patch introduces separate functions for both questions.
blk_supports_write_perm() answers the question whether the block
node/image file can support writable devices, whereas blk_is_writable()
tells whether the BlockBackend is currently configured to be writable.

All calls of blk_is_read_only() are converted to one of the two new
functions.

Fixes: https://bugs.launchpad.net/bugs/1906693
Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/sysemu/block-backend.h |  3 ++-
 block/block-backend.c          | 19 ++++++++++++++++---
 hw/block/dataplane/xen-block.c |  2 +-
 hw/block/fdc.c                 |  9 +++++----
 hw/block/m25p80.c              |  6 +++---
 hw/block/nand.c                |  2 +-
 hw/block/nvme-ns.c             |  7 ++++---
 hw/block/onenand.c             |  2 +-
 hw/block/pflash_cfi01.c        |  2 +-
 hw/block/pflash_cfi02.c        |  2 +-
 hw/block/swim.c                |  6 +++---
 hw/block/virtio-blk.c          |  6 +++---
 hw/block/xen-block.c           |  2 +-
 hw/ide/core.c                  |  2 +-
 hw/misc/sifive_u_otp.c         |  2 +-
 hw/ppc/pnv_pnor.c              |  2 +-
 hw/scsi/scsi-disk.c            | 10 +++++-----
 hw/scsi/scsi-generic.c         |  4 ++--
 hw/sd/sd.c                     |  6 +++---
 hw/usb/dev-storage.c           |  4 ++--
 20 files changed, 57 insertions(+), 41 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 8203d7f6f9..880e903293 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -191,7 +191,8 @@ BlockErrorAction blk_get_error_action(BlockBackend *blk, bool is_read,
                                       int error);
 void blk_error_action(BlockBackend *blk, BlockErrorAction action,
                       bool is_read, int error);
-bool blk_is_read_only(BlockBackend *blk);
+bool blk_supports_write_perm(BlockBackend *blk);
+bool blk_is_writable(BlockBackend *blk);
 bool blk_is_sg(BlockBackend *blk);
 bool blk_enable_write_cache(BlockBackend *blk);
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce);
diff --git a/block/block-backend.c b/block/block-backend.c
index ce78d30794..e493f17515 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1826,17 +1826,30 @@ void blk_error_action(BlockBackend *blk, BlockErrorAction action,
     }
 }
 
-bool blk_is_read_only(BlockBackend *blk)
+/*
+ * Returns true if the BlockBackend can support taking write permissions
+ * (because its root node is not read-only).
+ */
+bool blk_supports_write_perm(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
 
     if (bs) {
-        return bdrv_is_read_only(bs);
+        return !bdrv_is_read_only(bs);
     } else {
-        return blk->root_state.read_only;
+        return !blk->root_state.read_only;
     }
 }
 
+/*
+ * Returns true if the BlockBackend can be written to in its current
+ * configuration (i.e. if write permission have been requested)
+ */
+bool blk_is_writable(BlockBackend *blk)
+{
+    return blk->perm & BLK_PERM_WRITE;
+}
+
 bool blk_is_sg(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 71c337c7b7..f5b4f4c079 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -168,7 +168,7 @@ static int xen_block_parse_request(XenBlockRequest *request)
     };
 
     if (request->req.operation != BLKIF_OP_READ &&
-        blk_is_read_only(dataplane->blk)) {
+        !blk_is_writable(dataplane->blk)) {
         error_report("error: write req for ro device");
         goto err;
     }
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 3636874432..292ea87805 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -444,7 +444,7 @@ static void fd_revalidate(FDrive *drv)
 
     FLOPPY_DPRINTF("revalidate\n");
     if (drv->blk != NULL) {
-        drv->ro = blk_is_read_only(drv->blk);
+        drv->ro = !blk_is_writable(drv->blk);
         if (!blk_is_inserted(drv->blk)) {
             FLOPPY_DPRINTF("No disk in drive\n");
             drv->disk = FLOPPY_DRIVE_TYPE_NONE;
@@ -479,8 +479,8 @@ static void fd_change_cb(void *opaque, bool load, Error **errp)
         blk_set_perm(drive->blk, 0, BLK_PERM_ALL, &error_abort);
     } else {
         if (!blkconf_apply_backend_options(drive->conf,
-                                           blk_is_read_only(drive->blk), false,
-                                           errp)) {
+                                           !blk_supports_write_perm(drive->blk),
+                                           false, errp)) {
             return;
         }
     }
@@ -553,7 +553,8 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
          * read-only node later */
         read_only = true;
     } else {
-        read_only = !blk_bs(dev->conf.blk) || blk_is_read_only(dev->conf.blk);
+        read_only = !blk_bs(dev->conf.blk) ||
+                    !blk_supports_write_perm(dev->conf.blk);
     }
 
     if (!blkconf_blocksizes(&dev->conf, errp)) {
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 1b3f2405a1..5f37dc7421 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -506,7 +506,7 @@ static void flash_sync_page(Flash *s, int page)
 {
     QEMUIOVector *iov;
 
-    if (!s->blk || blk_is_read_only(s->blk)) {
+    if (!s->blk || !blk_is_writable(s->blk)) {
         return;
     }
 
@@ -522,7 +522,7 @@ static inline void flash_sync_area(Flash *s, int64_t off, int64_t len)
 {
     QEMUIOVector *iov;
 
-    if (!s->blk || blk_is_read_only(s->blk)) {
+    if (!s->blk || !blk_is_writable(s->blk)) {
         return;
     }
 
@@ -1379,7 +1379,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
 
     if (s->blk) {
         uint64_t perm = BLK_PERM_CONSISTENT_READ |
-                        (blk_is_read_only(s->blk) ? 0 : BLK_PERM_WRITE);
+                        (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
         ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
         if (ret < 0) {
             return;
diff --git a/hw/block/nand.c b/hw/block/nand.c
index 123020aebf..003f0e2b81 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -400,7 +400,7 @@ static void nand_realize(DeviceState *dev, Error **errp)
     pagesize = 1 << s->oob_shift;
     s->mem_oob = 1;
     if (s->blk) {
-        if (blk_is_read_only(s->blk)) {
+        if (!blk_supports_write_perm(s->blk)) {
             error_setg(errp, "Can't use a read-only drive");
             return;
         }
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 31c80cdf5b..2670787d26 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -48,13 +48,14 @@ static void nvme_ns_init(NvmeNamespace *ns)
 
 static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
+    bool read_only;
+
     if (!blkconf_blocksizes(&ns->blkconf, errp)) {
         return -1;
     }
 
-    if (!blkconf_apply_backend_options(&ns->blkconf,
-                                       blk_is_read_only(ns->blkconf.blk),
-                                       false, errp)) {
+    read_only = !blk_supports_write_perm(ns->blkconf.blk);
+    if (!blkconf_apply_backend_options(&ns->blkconf, read_only, false, errp)) {
         return -1;
     }
 
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 579a73d7f7..afc0cd3a0f 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -797,7 +797,7 @@ static void onenand_realize(DeviceState *dev, Error **errp)
         s->image = memset(g_malloc(size + (size >> 5)),
                           0xff, size + (size >> 5));
     } else {
-        if (blk_is_read_only(s->blk)) {
+        if (!blk_supports_write_perm(s->blk)) {
             error_setg(errp, "Can't use a read-only drive");
             return;
         }
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index ccf326793d..22287a1522 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -745,7 +745,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 
     if (pfl->blk) {
         uint64_t perm;
-        pfl->ro = blk_is_read_only(pfl->blk);
+        pfl->ro = !blk_supports_write_perm(pfl->blk);
         perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
         ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
         if (ret < 0) {
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2ad2f6baea..7962cff745 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -802,7 +802,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 
     if (pfl->blk) {
         uint64_t perm;
-        pfl->ro = blk_is_read_only(pfl->blk);
+        pfl->ro = !blk_supports_write_perm(pfl->blk);
         perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
         ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
         if (ret < 0) {
diff --git a/hw/block/swim.c b/hw/block/swim.c
index 20133a814c..509c2f4900 100644
--- a/hw/block/swim.c
+++ b/hw/block/swim.c
@@ -137,8 +137,8 @@ static void swim_change_cb(void *opaque, bool load, Error **errp)
         blk_set_perm(drive->blk, 0, BLK_PERM_ALL, &error_abort);
     } else {
         if (!blkconf_apply_backend_options(drive->conf,
-                                           blk_is_read_only(drive->blk), false,
-                                           errp)) {
+                                           !blk_supports_write_perm(drive->blk),
+                                           false, errp)) {
             return;
         }
     }
@@ -210,7 +210,7 @@ static void swim_drive_realize(DeviceState *qdev, Error **errp)
     dev->conf.werror = BLOCKDEV_ON_ERROR_AUTO;
 
     if (!blkconf_apply_backend_options(&dev->conf,
-                                       blk_is_read_only(dev->conf.blk),
+                                       !blk_supports_write_perm(dev->conf.blk),
                                        false, errp)) {
         return;
     }
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index bac2d6fa2b..e8600b069d 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1021,7 +1021,7 @@ static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
          virtio_has_feature(features, VIRTIO_BLK_F_CONFIG_WCE))) {
         virtio_add_feature(&features, VIRTIO_BLK_F_WCE);
     }
-    if (blk_is_read_only(s->blk)) {
+    if (!blk_is_writable(s->blk)) {
         virtio_add_feature(&features, VIRTIO_BLK_F_RO);
     }
     if (s->conf.num_queues > 1) {
@@ -1175,8 +1175,8 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     }
 
     if (!blkconf_apply_backend_options(&conf->conf,
-                                       blk_is_read_only(conf->conf.blk), true,
-                                       errp)) {
+                                       !blk_supports_write_perm(conf->conf.blk),
+                                       true, errp)) {
         return;
     }
     s->original_wce = blk_enable_write_cache(conf->conf.blk);
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 718d886e5c..0e7d66c2a7 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -567,7 +567,7 @@ static void xen_disk_realize(XenBlockDevice *blockdev, Error **errp)
         return;
     }
 
-    blockdev->info = blk_is_read_only(conf->blk) ? VDISK_READONLY : 0;
+    blockdev->info = blk_supports_write_perm(conf->blk) ? 0 : VDISK_READONLY;
 }
 
 static void xen_disk_class_init(ObjectClass *class, void *data)
diff --git a/hw/ide/core.c b/hw/ide/core.c
index b49e4cfbc6..81db2c95de 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2537,7 +2537,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
             error_setg(errp, "Device needs media, but drive is empty");
             return -1;
         }
-        if (blk_is_read_only(blk)) {
+        if (!blk_is_writable(blk)) {
             error_setg(errp, "Can't use a read-only drive");
             return -1;
         }
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 4401787a5c..3de420681f 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -219,7 +219,7 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
 
         if (s->blk) {
             perm = BLK_PERM_CONSISTENT_READ |
-                   (blk_is_read_only(s->blk) ? 0 : BLK_PERM_WRITE);
+                   (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
             ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
             if (ret < 0) {
                 return;
diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index ef8dff03e0..4b455de1ea 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -86,7 +86,7 @@ static void pnv_pnor_realize(DeviceState *dev, Error **errp)
 
     if (s->blk) {
         uint64_t perm = BLK_PERM_CONSISTENT_READ |
-                        (blk_is_read_only(s->blk) ? 0 : BLK_PERM_WRITE);
+                        (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
         ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
         if (ret < 0) {
             return;
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 29504ea081..ed52fcd49f 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1270,7 +1270,7 @@ static int scsi_disk_emulate_mode_sense(SCSIDiskReq *r, uint8_t *outbuf)
 
     if (s->qdev.type == TYPE_DISK) {
         dev_specific_param = s->features & (1 << SCSI_DISK_F_DPOFUA) ? 0x10 : 0;
-        if (blk_is_read_only(s->qdev.conf.blk)) {
+        if (!blk_is_writable(s->qdev.conf.blk)) {
             dev_specific_param |= 0x80; /* Readonly.  */
         }
     } else {
@@ -1704,7 +1704,7 @@ static void scsi_disk_emulate_unmap(SCSIDiskReq *r, uint8_t *inbuf)
         goto invalid_param_len;
     }
 
-    if (blk_is_read_only(s->qdev.conf.blk)) {
+    if (!blk_is_writable(s->qdev.conf.blk)) {
         block_acct_invalid(blk_get_stats(s->qdev.conf.blk), BLOCK_ACCT_UNMAP);
         scsi_check_condition(r, SENSE_CODE(WRITE_PROTECTED));
         return;
@@ -1795,7 +1795,7 @@ static void scsi_disk_emulate_write_same(SCSIDiskReq *r, uint8_t *inbuf)
         return;
     }
 
-    if (blk_is_read_only(s->qdev.conf.blk)) {
+    if (!blk_is_writable(s->qdev.conf.blk)) {
         scsi_check_condition(r, SENSE_CODE(WRITE_PROTECTED));
         return;
     }
@@ -2207,7 +2207,7 @@ static int32_t scsi_disk_dma_command(SCSIRequest *req, uint8_t *buf)
     case WRITE_VERIFY_10:
     case WRITE_VERIFY_12:
     case WRITE_VERIFY_16:
-        if (blk_is_read_only(s->qdev.conf.blk)) {
+        if (!blk_is_writable(s->qdev.conf.blk)) {
             scsi_check_condition(r, SENSE_CODE(WRITE_PROTECTED));
             return 0;
         }
@@ -2380,7 +2380,7 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
         }
     }
 
-    read_only = blk_is_read_only(s->qdev.conf.blk);
+    read_only = !blk_supports_write_perm(s->qdev.conf.blk);
     if (dev->type == TYPE_ROM) {
         read_only = true;
     }
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 9740f7e36a..ab220141f5 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -306,7 +306,7 @@ static void scsi_read_complete(void * opaque, int ret)
      * readonly.
      */
     if ((s->type == TYPE_DISK || s->type == TYPE_TAPE || s->type == TYPE_ZBC) &&
-        blk_is_read_only(s->conf.blk) &&
+        !blk_is_writable(s->conf.blk) &&
         (r->req.cmd.buf[0] == MODE_SENSE ||
          r->req.cmd.buf[0] == MODE_SENSE_10) &&
         (r->req.cmd.buf[1] & 0x8) == 0) {
@@ -694,7 +694,7 @@ static void scsi_generic_realize(SCSIDevice *s, Error **errp)
         return;
     }
     if (!blkconf_apply_backend_options(&s->conf,
-                                       blk_is_read_only(s->conf.blk),
+                                       !blk_supports_write_perm(s->conf.blk),
                                        true, errp)) {
         return;
     }
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4375ed5b8b..1f313e96b6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -584,7 +584,7 @@ static void sd_reset(DeviceState *dev)
     sd_set_sdstatus(sd);
 
     g_free(sd->wp_groups);
-    sd->wp_switch = sd->blk ? blk_is_read_only(sd->blk) : false;
+    sd->wp_switch = sd->blk ? !blk_is_writable(sd->blk) : false;
     sd->wpgrps_size = sect;
     sd->wp_groups = bitmap_new(sd->wpgrps_size);
     memset(sd->function_group, 0, sizeof(sd->function_group));
@@ -752,7 +752,7 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
 {
     sd->readonly_cb = readonly;
     sd->inserted_cb = insert;
-    qemu_set_irq(readonly, sd->blk ? blk_is_read_only(sd->blk) : 0);
+    qemu_set_irq(readonly, sd->blk ? !blk_is_writable(sd->blk) : 0);
     qemu_set_irq(insert, sd->blk ? blk_is_inserted(sd->blk) : 0);
 }
 
@@ -2155,7 +2155,7 @@ static void sd_realize(DeviceState *dev, Error **errp)
     if (sd->blk) {
         int64_t blk_size;
 
-        if (blk_is_read_only(sd->blk)) {
+        if (!blk_supports_write_perm(sd->blk)) {
             error_setg(errp, "Cannot use read-only drive as SD card");
             return;
         }
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index f0f005869d..c49e8b819e 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -613,8 +613,8 @@ static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
         return;
     }
 
-    if (!blkconf_apply_backend_options(&s->conf, blk_is_read_only(blk), true,
-                                       errp)) {
+    if (!blkconf_apply_backend_options(&s->conf, !blk_supports_write_perm(blk),
+                                       true, errp)) {
         return;
     }
 
-- 
2.29.2


