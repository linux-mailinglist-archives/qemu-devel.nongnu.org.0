Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569EB547E5E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 06:11:51 +0200 (CEST)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0bQb-0004sU-RE
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 00:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o0bPC-0004Bw-VM; Mon, 13 Jun 2022 00:10:23 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o0bP9-00061R-T5; Mon, 13 Jun 2022 00:10:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d5so1476306plo.12;
 Sun, 12 Jun 2022 21:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cyWUg3HPdJc2VHLtbpLpvMAyIEOZl3Ggu+B2N8JBck8=;
 b=cHfHcPjyRURfOlYpdtlPrffQ0HgL6sqiop5/Ve1YJB8NMCvyWPWQPpM13jvXFmZma2
 I6LUPah58P0wHz9EzR2ZcEOebtp3w2EPZomYuAiyQ2RTdmO79sYpoysxPFrh9EYVZXA0
 /Gj/1JYBclTMEA+R2zooHiAYTS6BQVtDp7t9s9xAu4t3MN/BZiklT8PJFlvX1TyWGVAH
 87DTxL31WlCPDEVgS+bE/nUcBNqxx7So1QXJ9YvSt6ajX88s3YHRRDpI93nROztMRr+0
 7XWc9Qp8PX4sU969cggRigL37WWc+mEs5wfAzhq6re3T92ANLQu9DnGjVIApe+JnQEWm
 mxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cyWUg3HPdJc2VHLtbpLpvMAyIEOZl3Ggu+B2N8JBck8=;
 b=2rwgfmmIy9pVZqxR7myyJQWcv1GjVnMlEav/mOOuWe7Kt4Cfzoqxc7lhjfCZbKf1cS
 CDpTpQnI5Zq8IoH99fTnIFuwGjU7AfqOafK7JPgT6G7uWkfO2gXrOa1agsx/LYS3fHPn
 6A5Fkw+v3N/6O3izAxqjNuy65WO5fGf86X8HTUBHc6N/Jrz3Yzce80jul2sCx4K1z1/J
 MCF4ildiNxQLZQzRwwViTYS1EZthy37IMj5jSXAdLXPoqj8oNUkn1CLdpqTNYX9tr25A
 MoJMy49ZxrI76q7IT1DUEwj42Fv6a4T2UmTWnCuGwS9JiMoS9hl7PnZ6F6z/LQVO5PzM
 Bdtg==
X-Gm-Message-State: AOAM532eCjc0cl5FcdoFmlrr276RoeR+Bw6krfpGEfsIiEodi1liH4uS
 WZf5anHguzQsMDtQ+FygUSI=
X-Google-Smtp-Source: ABdhPJzQgoxoOEuR03KBrvXYj1wUAn/6F7kL4vtmC4zGOuAGPH2rPqifnrp7VfVOrJVoeVh24iD+zA==
X-Received: by 2002:a17:90b:350b:b0:1e8:46b9:5bc5 with SMTP id
 ls11-20020a17090b350b00b001e846b95bc5mr13722950pjb.100.1655093414984; 
 Sun, 12 Jun 2022 21:10:14 -0700 (PDT)
Received: from fedora.. ([101.206.167.108]) by smtp.gmail.com with ESMTPSA id
 p189-20020a62d0c6000000b0051be7ecd733sm4204419pfg.16.2022.06.12.21.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 21:10:14 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: damien.lemoal@opensource.wdc.com
Cc: qemu-devel@nongnu.org, stefanha@gmail.com, Dmitry.Fomichev@wdc.com,
 hare@suse.de, qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v1] Adding block layer APIs resembling Linux ZoneBlockDevice
 ioctls.
Date: Mon, 13 Jun 2022 12:09:47 +0800
Message-Id: <20220613040947.16266-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

By adding zone management operations in BlockDriver, storage
controller emulation can use the new block layer APIs including
zone_report, zone_reset, zone_open, zone_close, and zone_finish.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/block-backend.c             |  20 ++++
 block/coroutines.h                |   6 ++
 block/file-posix.c                | 174 ++++++++++++++++++++++++++++++
 block/io.c                        |  26 +++++
 include/block/block-common.h      |   8 ++
 include/block/block-io.h          |  11 ++
 include/block/block_int-common.h  |   6 ++
 qemu-io-cmds.c                    |  66 ++++++++++++
 tests/qemu-iotests/tests/zoned.sh |  47 ++++++++
 9 files changed, 364 insertions(+)
 create mode 100644 tests/qemu-iotests/tests/zoned.sh

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..4695e5f9fe 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
     int ret;
 } BlockBackendAIOCB;
 
+
+
 static const AIOCBInfo block_backend_aiocb_info = {
     .get_aio_context = blk_aiocb_get_aio_context,
     .aiocb_size = sizeof(BlockBackendAIOCB),
@@ -1810,6 +1812,23 @@ int blk_flush(BlockBackend *blk)
     return ret;
 }
 
+int blk_co_zone_report(BlockBackend *blk)
+{
+    int ret;
+    ret = bdrv_co_zone_report(blk->root->bs, NULL, 0, 0, 0, 0);
+
+    return ret;
+}
+
+int blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op)
+{
+    int ret;
+    ret = bdrv_co_zone_mgmt(blk->root->bs, op, 0, 100);
+
+    return ret;
+}
+
+
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
@@ -2634,3 +2653,4 @@ int blk_make_empty(BlockBackend *blk, Error **errp)
 
     return bdrv_make_empty(blk->root, errp);
 }
+
diff --git a/block/coroutines.h b/block/coroutines.h
index 830ecaa733..e29222a68a 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -81,6 +81,10 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 
 int coroutine_fn blk_co_do_flush(BlockBackend *blk);
 
+int coroutine_fn blk_co_zone_report(BlockBackend *blk);
+
+int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op);
+
 
 /*
  * "I/O or GS" API functions. These functions can run without
@@ -129,4 +133,6 @@ blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 
 int generated_co_wrapper blk_do_flush(BlockBackend *blk);
 
+
+
 #endif /* BLOCK_COROUTINES_H */
diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..42646acc4e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -73,6 +73,7 @@
 #include <linux/hdreg.h>
 #include <linux/magic.h>
 #include <scsi/sg.h>
+#include <linux/blkzoned.h>
 #ifdef __s390__
 #include <asm/dasd.h>
 #endif
@@ -178,6 +179,167 @@ typedef struct BDRVRawReopenState {
     bool check_cache_dropped;
 } BDRVRawReopenState;
 
+
+enum zone_type {
+    BLK_ZT_CONV = BLK_ZONE_TYPE_CONVENTIONAL,
+    BLK_ZT_SWR = BLK_ZONE_TYPE_SEQWRITE_REQ,
+    BLK_ZT_SWP = BLK_ZONE_TYPE_SEQWRITE_PREF,
+};
+
+enum zone_cond {
+    BLK_ZS_NOT_WP = BLK_ZONE_COND_NOT_WP,
+    BLK_ZS_EMPTY = BLK_ZONE_COND_EMPTY,
+    BLK_ZS_IOPEN = BLK_ZONE_COND_IMP_OPEN,
+    BLK_ZS_EOPEN = BLK_ZONE_COND_EXP_OPEN,
+    BLK_ZS_CLOSED = BLK_ZONE_COND_CLOSED,
+    BLK_ZS_RDONLY = BLK_ZONE_COND_READONLY,
+    BLK_ZS_FULL = BLK_ZONE_COND_FULL,
+    BLK_ZS_OFFLINE = BLK_ZONE_COND_OFFLINE,
+};
+
+/*
+ * Zone descriptor data structure.
+ * Provide information on a zone with all position and size values in bytes.
+ */
+struct BlockZoneDescriptor {
+    uint64_t start;
+    uint32_t length;
+    uint32_t cap;
+    uint64_t wp;
+    enum zone_type type;
+    enum zone_cond cond;
+};
+
+enum zone_model {
+    ZBD_HOST_MANAGED,
+    ZBD_HOST_AWARE,
+};
+
+/**
+ * Zone device information data structure.
+ * Provide information on a device.
+ */
+typedef struct zbd_dev {
+    enum zone_model model;
+    uint32_t block_size;
+    uint32_t write_granularity;
+    uint32_t nr_zones;
+    struct BlockZoneDescriptor *zones; /* array of zones */
+    uint32_t max_nr_open_zones; /* maximum number of explicitly open zones */
+    uint32_t max_nr_active_zones;
+} zbd_dev;
+
+/**
+ * zone report - Get a zone block device's information in the
+ * form of an array of zone descriptors.
+ *
+ * @param bs: passing zone block device file descriptor
+ * @param zones: Space to hold zone information on reply
+ * @param offset: the location in the zone block device
+ * @param len: the length of reported zone information*
+ * @param partial: if partial has zero value, it is the number
+ * of zones that can be reported; else, set the nr_zones to the
+ * number of fully transferred zone descriptors in the data buffer.
+ * @return 0 on success, -1 on failure
+ */
+static int raw_co_zone_report(BlockDriverState *bs,
+                       struct BlockZoneDescriptor *zones, uint32_t *nr_zones,
+                       int64_t offset, int64_t len, uint8_t partial) {
+    printf("%s\n", "start to report zone");
+    BDRVRawState *s = bs->opaque;
+
+    struct blk_zone_report *rep;
+    uint32_t rep_nr_zones = 0;
+    int ret = 0, i = 0, start_sector = 0;
+
+    if (ioctl(s->fd, BLKGETNRZONES, &rep_nr_zones)) {
+        /* Done */
+        error_report("number of zones not available");
+    }
+
+    fprintf(stdout, "Got %u zone descriptors\n", rep_nr_zones);
+    rep = malloc(sizeof(struct blk_zone_report) +
+            rep_nr_zones * sizeof(struct blk_zone));
+    if (!rep) {
+        return -1;
+    }
+
+    rep->nr_zones = rep_nr_zones;
+    rep->sector = start_sector;
+
+    while (i < rep_nr_zones) {
+        ret = ioctl(s->fd, BLKREPORTZONE, rep);
+        if (ret != 0) {
+            error_report("can't report zone");
+        }
+
+        fprintf(stdout, "start: 0x%llx, len 0x%llx, cap 0x%llx, "
+                        "wptr 0x%llx reset: %u non-seq:%u, zcond:%u, [type: %u]\n",
+                        rep->zones[i].start, rep->zones[i].len,
+                        rep->zones[i].capacity, rep->zones[i].wp,
+                        rep->zones[i].reset, rep->zones[i].non_seq,
+                        rep->zones[i].cond, rep->zones[i].type);
+        ++i;
+    }
+
+    free(rep);
+
+    return ret;
+}
+
+/**
+ * zone management operations - Execute an operation on a zone
+ */
+static int raw_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
+        int64_t offset, int64_t len) {
+    BDRVRawState *s = bs->opaque;
+    struct blk_zone_range range;
+    const char *ioctl_name;
+    uint64_t ioctl_op;
+    int ret;
+
+    switch (op) {
+    case zone_open:
+        ioctl_name = "BLKOPENZONE";
+        ioctl_op = BLKOPENZONE;
+        break;
+    case zone_close:
+        ioctl_name = "BLKCLOSEZONE";
+        ioctl_op = BLKCLOSEZONE;
+        break;
+    case zone_finish:
+        ioctl_name = "BLKFINISHZONE";
+        ioctl_op = BLKFINISHZONE;
+        break;
+    case zone_reset:
+        ioctl_name = "BLKRESETZONE";
+        ioctl_op = BLKRESETZONE;
+        break;
+    default:
+        error_report("Invalid zone operation 0x%x", op);
+        errno = -EINVAL;
+        return -1;
+    }
+
+    /* Execute the operation */
+    range.sector = 0;
+    range.nr_sectors = 100;
+    ret = ioctl(s->fd, ioctl_op, &range);
+    if (ret != 0) {
+        if (errno == ENOTTY) {
+            error_report("ioctl %s is not supported", ioctl_name);
+            errno = ENOTSUP;
+        } else {
+            error_report("ioctl %s failed %d",
+                         ioctl_name, errno);
+        }
+        return -1;
+    }
+
+    return 0;
+}
+
+
 static int fd_open(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
@@ -3324,6 +3486,9 @@ BlockDriver bdrv_file = {
     .bdrv_abort_perm_update = raw_abort_perm_update,
     .create_opts = &raw_create_opts,
     .mutable_opts = mutable_opts,
+
+    .bdrv_co_zone_report = raw_co_zone_report,
+    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
 };
 
 /***********************************************/
@@ -3697,6 +3862,9 @@ static BlockDriver bdrv_host_device = {
     .bdrv_probe_blocksizes = hdev_probe_blocksizes,
     .bdrv_probe_geometry = hdev_probe_geometry,
 
+    .bdrv_co_zone_report = raw_co_zone_report,
+    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+
     /* generic scsi device */
 #ifdef __linux__
     .bdrv_co_ioctl          = hdev_co_ioctl,
@@ -3809,6 +3977,9 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
+    .bdrv_co_zone_report = raw_co_zone_report,
+    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+
     .bdrv_co_truncate    = raw_co_truncate,
     .bdrv_getlength      = raw_getlength,
     .has_variable_length = true,
@@ -3939,6 +4110,9 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
+    .bdrv_co_zone_report = raw_co_zone_report,
+    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+
     .bdrv_co_truncate    = raw_co_truncate,
     .bdrv_getlength      = raw_getlength,
     .has_variable_length = true,
diff --git a/block/io.c b/block/io.c
index 789e6373d5..04f108c128 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3258,6 +3258,32 @@ out:
     return co.ret;
 }
 
+int bdrv_co_zone_report(BlockDriverState *bs,
+                        struct BlockZoneDescriptor *zones, uint32_t *nr_zones,
+                                int64_t offset, int64_t len, uint8_t partial)
+{
+    int ret;
+    ret = bs->drv->bdrv_co_zone_report(bs, zones, nr_zones,
+                                       offset, len, partial);
+    if (!ret) {
+        return -ENOTSUP;
+    }
+
+    return ret;
+}
+
+int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
+        int64_t offset, int64_t len)
+{
+    int ret;
+    ret = bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len);
+    if (!ret) {
+        return -ENOTSUP;
+    }
+
+    return ret;
+}
+
 void *qemu_blockalign(BlockDriverState *bs, size_t size)
 {
     IO_CODE();
diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..62eeeba8da 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -48,6 +48,14 @@
 typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
 typedef struct BdrvChildClass BdrvChildClass;
+/* zone descriptor data structure */
+typedef struct BlockZoneDescriptor BlockZoneDescriptor;
+enum zone_op {
+    zone_open,
+    zone_close,
+    zone_finish,
+    zone_reset,
+};
 
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 62c84f0519..a915b554ad 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -80,6 +80,14 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
 
+/* Report zone information of zone block device. */
+int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs,
+                                     struct BlockZoneDescriptor *zones,
+                                             uint32_t *nr_zones, int64_t offset,
+                                             int64_t len, uint8_t partial);
+int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
+        int64_t offset, int64_t len);
+
 int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
@@ -290,6 +298,9 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 int generated_co_wrapper
 bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
+int generated_co_wrapper blk_zone_report(BlockBackend *blk);
+int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op op);
+
 /**
  * bdrv_parent_drained_begin_single:
  *
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..520a733481 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -691,6 +691,12 @@ struct BlockDriver {
                                           QEMUIOVector *qiov,
                                           int64_t pos);
 
+    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
+            struct BlockZoneDescriptor *zones, uint32_t *nr_zones,
+                    int64_t offset, int64_t len, uint8_t partial);
+    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, enum zone_op op,
+            int64_t offset, int64_t len);
+
     /* removable device specific */
     bool (*bdrv_is_inserted)(BlockDriverState *bs);
     void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 2f0d8ac25a..ca02b4047e 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1706,6 +1706,67 @@ static const cmdinfo_t flush_cmd = {
     .oneline    = "flush all in-core file state to disk",
 };
 
+static int zone_report_f(BlockBackend *blk, int argc, char **argv)
+{
+    return blk_zone_report(blk);
+}
+
+static const cmdinfo_t zone_report_cmd = {
+        .name = "zone_report",
+        .altname = "f",
+        .cfunc = zone_report_f,
+        .oneline = "report zone information in zone block device",
+};
+
+static int zone_open_f(BlockBackend *blk, int argc, char **argv)
+{
+    return blk_zone_mgmt(blk, zone_open);
+}
+
+static const cmdinfo_t zone_open_cmd = {
+        .name = "zone_open",
+        .altname = "f",
+        .cfunc = zone_open_f,
+        .oneline = "explicit open a range of zones in zone block device",
+};
+
+static int zone_close_f(BlockBackend *blk, int argc, char **argv)
+{
+    return blk_zone_mgmt(blk, zone_close);
+}
+
+static const cmdinfo_t zone_close_cmd = {
+        .name = "zone_close",
+        .altname = "f",
+        .cfunc = zone_close_f,
+        .oneline = "close a range of zones in zone block device",
+};
+
+static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
+{
+    return blk_zone_mgmt(blk, zone_finish);
+}
+
+static const cmdinfo_t zone_finish_cmd = {
+        .name = "zone_finish",
+        .altname = "f",
+        .cfunc = zone_finish_f,
+        .oneline = "finish a range of zones in zone block device",
+};
+
+static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
+{
+    return blk_zone_mgmt(blk, zone_reset);
+}
+
+static const cmdinfo_t zone_reset_cmd = {
+        .name = "zone_reset",
+        .altname = "f",
+        .cfunc = zone_reset_f,
+        .oneline = "reset a zone write pointer in zone block device",
+};
+
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2498,6 +2559,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&aio_write_cmd);
     qemuio_add_command(&aio_flush_cmd);
     qemuio_add_command(&flush_cmd);
+    qemuio_add_command(&zone_report_cmd);
+    qemuio_add_command(&zone_open_cmd);
+    qemuio_add_command(&zone_close_cmd);
+    qemuio_add_command(&zone_finish_cmd);
+    qemuio_add_command(&zone_reset_cmd);
     qemuio_add_command(&truncate_cmd);
     qemuio_add_command(&length_cmd);
     qemuio_add_command(&info_cmd);
diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
new file mode 100644
index 0000000000..a1596e8340
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -0,0 +1,47 @@
+#!/usr/bin/env bash
+#
+# Test zone management operations.
+#
+
+
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1 # failure is the default!
+
+_cleanup()
+{
+  _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.pattern
+
+# much of this could be generic for any format supporting compression.
+_supported_fmt qcow qcow2
+_supported_proto file
+_supported_os Linux
+
+TEST_OFFSETS="0 1000 4000"
+TEST_LENS="1000"
+TEST_OPS="zone_report zone_open zone_close zone_finish zone_reset zone_append"
+
+
+echo "Testing a null_blk device"
+echo
+
+for offset in $TEST_OFFSETS; do
+    echo "At offset $offset:"
+    io_test "write -b" $offset $CLUSTER_SIZE 8
+    io_test "read -b" $offset $CLUSTER_SIZE 8
+    _check_test_img
+done
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
-- 
2.35.3


