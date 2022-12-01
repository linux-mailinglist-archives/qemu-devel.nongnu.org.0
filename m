Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF7863F1E6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 14:43:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0jqY-0007Zl-3r; Thu, 01 Dec 2022 08:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1p0jqT-0007W1-GH
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 08:43:22 -0500
Received: from [106.39.185.57] (helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1p0jqN-0004Rw-Bk
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 08:43:20 -0500
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id DB3AFFC0206;
 Thu,  1 Dec 2022 21:42:59 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [171.223.93.105])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51403T281470983467376S1669902177411342_; 
 Thu, 01 Dec 2022 21:42:59 +0800 (CST)
X-UNIQUE-TAG: <59035d89ec4c15592a618c154bffb4d8>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-block@nongnu.org
X-RCPT-COUNT: 9
X-SENDER-IP: 171.223.93.105
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 zhipeng Lu <luzhipeng@cestc.cn>
Subject: [PATCH] blockdev: add 'media=cdrom' argument to support usb cdrom
 emulated as cdrom
Date: Thu,  1 Dec 2022 21:42:27 +0800
Message-Id: <20221201134227.1983-1-luzhipeng@cestc.cn>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: zhipeng Lu <luzhipeng@cestc.cn>

The drive interface supports media=cdrom so that the usb cdrom
can be emulated as cdrom in qemu, but libvirt deprived the drive
interface, so media=cdrom is added to the blockdev interface to
support usb cdrom emulated as cdrom

Signed-off-by: zhipeng Lu <luzhipeng@cestc.cn>
---
 block.c                                     | 11 ++++++++++-
 block/block-backend.c                       | 18 ++++++++++++++++++
 hw/core/qdev-properties-system.c            |  3 +++
 hw/scsi/scsi-bus.c                          |  4 +++-
 include/block/block_int-common.h            |  1 +
 include/sysemu/block-backend-global-state.h |  2 ++
 6 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index a18f052374..d194e3039e 100644
--- a/block.c
+++ b/block.c
@@ -3787,6 +3787,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     Error *local_err = NULL;
     QDict *snapshot_options = NULL;
     int snapshot_flags = 0;
+    int media = 0;
 
     assert(!child_class || !flags);
     assert(!child_class == !parent);
@@ -3906,6 +3907,12 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
         qdict_del(bs->options, "backing");
         qdict_del(options, "backing");
     }
+    if (!g_strcmp0(qdict_get_try_str(options, "media"), "cdrom")) {
+        media = 1;
+        qdict_del(bs->explicit_options, "media");
+        qdict_del(bs->options, "media");
+        qdict_del(options, "media");
+    }
 
     /* Open image file without format layer. This BlockBackend is only used for
      * probing, the block drivers will do their own bdrv_open_child() for the
@@ -4033,7 +4040,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
         bdrv_unref(bs);
         bs = snapshot_bs;
     }
-
+    if (bs && media) {
+        bs->media_cd = true;
+    }
     return bs;
 
 fail:
diff --git a/block/block-backend.c b/block/block-backend.c
index d98a96ff37..1760079a67 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -72,6 +72,7 @@ struct BlockBackend {
     uint64_t perm;
     uint64_t shared_perm;
     bool disable_perm;
+    bool media_cd;
 
     bool allow_aio_context_change;
     bool allow_write_beyond_eof;
@@ -2634,3 +2635,20 @@ int blk_make_empty(BlockBackend *blk, Error **errp)
 
     return bdrv_make_empty(blk->root, errp);
 }
+
+bool blk_is_cdrom(BlockBackend *blk)
+{
+    if (!blk) {
+        return false;
+    }
+    return blk->media_cd;
+
+}
+
+void blk_set_cdrom(BlockBackend *blk)
+{
+    if (!blk) {
+        return ;
+    }
+    blk->media_cd = true;
+}
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index a91f60567a..99df29ccb8 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -149,6 +149,9 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
             if (ret < 0) {
                 goto fail;
             }
+            if (bs->media_cd) {
+                blk_set_cdrom(blk);
+            }
         }
     }
     if (!blk) {
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..bc2bbdc823 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -321,7 +321,9 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
         driver = "scsi-generic";
     } else {
         dinfo = blk_legacy_dinfo(blk);
-        if (dinfo && dinfo->media_cd) {
+        if ((dinfo && dinfo->media_cd)) {
+            driver = "scsi-cd";
+        } else if (blk_is_cdrom(blk)) {
             driver = "scsi-cd";
         } else {
             driver = "scsi-hd";
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 31ae91e56e..04a814ab1b 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1023,6 +1023,7 @@ struct BlockDriverState {
     bool probed;    /* if true, format was probed rather than specified */
     bool force_share; /* if true, always allow all shared permissions */
     bool implicit;  /* if true, this filter node was automatically inserted */
+    bool media_cd;
 
     BlockDriver *drv; /* NULL means no media */
     void *opaque;
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 6858e39cb6..108dfad283 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -71,6 +71,8 @@ void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
                       BlockdevOnError on_write_error);
 bool blk_supports_write_perm(BlockBackend *blk);
 bool blk_is_sg(BlockBackend *blk);
+bool blk_is_cdrom(BlockBackend *blk);
+void blk_set_cdrom(BlockBackend *blk);
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce);
 int blk_get_flags(BlockBackend *blk);
 bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp);
-- 
2.31.1




