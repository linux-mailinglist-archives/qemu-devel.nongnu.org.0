Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9E44FE00
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 05:56:56 +0100 (CET)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmU36-0008MK-4W
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 23:56:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmU0b-00050E-Gz; Sun, 14 Nov 2021 23:54:21 -0500
Received: from mga17.intel.com ([192.55.52.151]:4467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmU0Y-0008Ol-Rm; Sun, 14 Nov 2021 23:54:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="214101235"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="214101235"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 20:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="644710452"
Received: from yadong-antec.sh.intel.com ([10.239.158.125])
 by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2021 20:54:14 -0800
From: yadong.qi@intel.com
To: qemu-block@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, mst@redhat.com
Subject: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Date: Mon, 15 Nov 2021 12:52:00 +0800
Message-Id: <20211115045200.3567293-3-yadong.qi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115045200.3567293-1-yadong.qi@intel.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yadong.qi@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kai.z.wang@intel.com, yadong.qi@intel.com, luhai.chen@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yadong Qi <yadong.qi@intel.com>

Add new virtio feature: VIRTIO_BLK_F_SECDISCARD.
Add new virtio command: VIRTIO_BLK_T_SECDISCARD.

This feature is disabled by default, it will check the backend
bs->open_flags & BDRV_O_SECDISCARD, enable it if BDRV_O_SECDISCARD
is supported.

Signed-off-by: Yadong Qi <yadong.qi@intel.com>
---
 hw/block/virtio-blk.c                       | 26 +++++++++++++++++----
 include/standard-headers/linux/virtio_blk.h |  4 ++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index dbc4c5a3cd..7bc3484521 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -536,7 +536,8 @@ static bool virtio_blk_sect_range_ok(VirtIOBlock *dev,
 }
 
 static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
-    struct virtio_blk_discard_write_zeroes *dwz_hdr, bool is_write_zeroes)
+    struct virtio_blk_discard_write_zeroes *dwz_hdr, bool is_write_zeroes,
+    bool is_secdiscard)
 {
     VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
@@ -577,8 +578,8 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
         goto err;
     }
 
+    int blk_aio_flags = 0;
     if (is_write_zeroes) { /* VIRTIO_BLK_T_WRITE_ZEROES */
-        int blk_aio_flags = 0;
 
         if (flags & VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP) {
             blk_aio_flags |= BDRV_REQ_MAY_UNMAP;
@@ -600,7 +601,12 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
             goto err;
         }
 
-        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes, 0,
+        if (is_secdiscard) {
+            blk_aio_flags |= BDRV_REQ_SECDISCARD;
+        }
+
+        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes,
+                         blk_aio_flags,
                          virtio_blk_discard_write_zeroes_complete, req);
     }
 
@@ -622,6 +628,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     unsigned out_num = req->elem.out_num;
     VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    bool is_secdiscard = false;
 
     if (req->elem.out_num < 1 || req->elem.in_num < 1) {
         virtio_error(vdev, "virtio-blk missing headers");
@@ -722,6 +729,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
      * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch statement,
      * so we must mask it for these requests, then we will check if it is set.
      */
+    case VIRTIO_BLK_T_SECDISCARD & ~VIRTIO_BLK_T_OUT:
+        is_secdiscard = true;
+        __attribute__((fallthrough));
     case VIRTIO_BLK_T_DISCARD & ~VIRTIO_BLK_T_OUT:
     case VIRTIO_BLK_T_WRITE_ZEROES & ~VIRTIO_BLK_T_OUT:
     {
@@ -752,7 +762,8 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         }
 
         err_status = virtio_blk_handle_discard_write_zeroes(req, &dwz_hdr,
-                                                            is_write_zeroes);
+                                                            is_write_zeroes,
+                                                            is_secdiscard);
         if (err_status != VIRTIO_BLK_S_OK) {
             virtio_blk_req_complete(req, err_status);
             virtio_blk_free_request(req);
@@ -1201,6 +1212,11 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (blk_get_flags(conf->conf.blk) & BDRV_O_SECDISCARD)
+        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_SECDISCARD);
+    else
+        virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_SECDISCARD);
+
     if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_WRITE_ZEROES) &&
         (!conf->max_write_zeroes_sectors ||
          conf->max_write_zeroes_sectors > BDRV_REQUEST_MAX_SECTORS)) {
@@ -1307,6 +1323,8 @@ static Property virtio_blk_properties[] = {
                      conf.report_discard_granularity, true),
     DEFINE_PROP_BIT64("write-zeroes", VirtIOBlock, host_features,
                       VIRTIO_BLK_F_WRITE_ZEROES, true),
+    DEFINE_PROP_BIT64("secdiscard", VirtIOBlock, host_features,
+                      VIRTIO_BLK_F_SECDISCARD, false),
     DEFINE_PROP_UINT32("max-discard-sectors", VirtIOBlock,
                        conf.max_discard_sectors, BDRV_REQUEST_MAX_SECTORS),
     DEFINE_PROP_UINT32("max-write-zeroes-sectors", VirtIOBlock,
diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
index 2dcc90826a..c55a07840c 100644
--- a/include/standard-headers/linux/virtio_blk.h
+++ b/include/standard-headers/linux/virtio_blk.h
@@ -40,6 +40,7 @@
 #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
 #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
 #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
+#define VIRTIO_BLK_F_SECDISCARD	15	/* WRITE ZEROES is supported */
 
 /* Legacy feature bits */
 #ifndef VIRTIO_BLK_NO_LEGACY
@@ -153,6 +154,9 @@ struct virtio_blk_config {
 /* Write zeroes command */
 #define VIRTIO_BLK_T_WRITE_ZEROES	13
 
+/* Secure discard command */
+#define VIRTIO_BLK_T_SECDISCARD	14
+
 #ifndef VIRTIO_BLK_NO_LEGACY
 /* Barrier before this op. */
 #define VIRTIO_BLK_T_BARRIER	0x80000000
-- 
2.25.1


