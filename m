Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182955B4A3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 02:24:16 +0200 (CEST)
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5cY3-0004pQ-HA
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 20:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTk-0007Nq-3Z; Sun, 26 Jun 2022 20:19:48 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTg-0000b5-Rm; Sun, 26 Jun 2022 20:19:47 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 dw10-20020a17090b094a00b001ed00a16eb4so7855188pjb.2; 
 Sun, 26 Jun 2022 17:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sl1KHg62VRe4mTaNOmkTdlZXTww6q+Ij1RaqgrCOyHQ=;
 b=EDtSjqC0AuANIyUN7HjzDpjB4V+5XYxSbUzkb8DqUgP4zWnljcdr0nxzD47qfDiSsL
 wuofdVMnshmndwj5v0BzUVaNtBxlfFQXLOgV65sOmwCHSvA9OcEXTcEVZAnD6NradGSO
 numr8wdGOrv0Rv8Hop8oyJLY6qa9Ofv8DO9a1T+pxSvFYov/Sm6CsRzt9NCeG3bJXnPr
 Ss78Z3K/mjdOsUYRxQuGWRUyp4p+8OiWYi6KnXB+0vw3LSqtSu55ByPsBNZBL7Yhk57s
 0nZKMHAyi8lGtbBdctNqWPt9a3t7uRYWFDrbcQXD2Ir88inv1ZUObGVYF1O01CV1nj7S
 7sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sl1KHg62VRe4mTaNOmkTdlZXTww6q+Ij1RaqgrCOyHQ=;
 b=J0OwZT09PmXYnmAjNyhEtyLByh+oapsXVZ39azhbSQMr0hPLJSVDUQe61C63tJ0oS1
 JSk5DczLQjWGvxoARKAwjkXQcXLAmzZscYK33k/fzKDUFL3knXEaaJXzFYj6/308+edT
 f7leLP3Rrb2ymxkqgy3vuaB1YFI4wmGH00QDM1U4O74O6E1x6QMZ+CWqdSBwNW5N6giy
 p1pWEe1ZuwojPdzkv75dl6RHLwJl3t71Sz35zcgFWZhjXiVKbte6JhgVgAN7W7Et1GPU
 5rYavWmW7rRyiVGJ1iFFCWbz5yPcKsmh8UOt2TezjLiXGfkgeNODThmfXSNaFc4FV0bK
 /dDw==
X-Gm-Message-State: AJIora+Psch35axhH1TBMiYxCKW+D9DUeD+GxZufFOHHC/B7BuWS7D+s
 pos1pJrFVj8ZHa4HU/IR1yDHJ0L2SvfUFA==
X-Google-Smtp-Source: AGRyM1vzu5dz3vo+8+6ktSKPu6cUSq7ci10oWEAtL/15cs4c/Ct81K8sC5wyFYCyVp7MEUOLW60AEQ==
X-Received: by 2002:a17:902:c948:b0:16a:58f4:c142 with SMTP id
 i8-20020a170902c94800b0016a58f4c142mr12038497pla.103.1656289182885; 
 Sun, 26 Jun 2022 17:19:42 -0700 (PDT)
Received: from fedora.. ([106.84.130.34]) by smtp.gmail.com with ESMTPSA id
 e11-20020a6558cb000000b00408b89e4282sm5715294pgu.47.2022.06.26.17.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 17:19:42 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Date: Mon, 27 Jun 2022 08:19:13 +0800
Message-Id: <20220627001917.9417-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627001917.9417-1-faithilikerun@gmail.com>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102e.google.com
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
zone_report and zone_mgmt(open, close, finish, reset).
---
 block/block-backend.c            |  56 ++++++++
 block/coroutines.h               |   5 +
 block/file-posix.c               | 238 +++++++++++++++++++++++++++++++
 include/block/block-common.h     |  43 +++++-
 include/block/block_int-common.h |  20 +++
 5 files changed, 361 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..786f964d02 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1810,6 +1810,62 @@ int blk_flush(BlockBackend *blk)
     return ret;
 }
 
+/*
+ * Return zone_report from BlockDriver. Offset can be any number within
+ * the zone size. No alignment for offset and len.
+ */
+int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
+                       int64_t len, int64_t *nr_zones,
+                       BlockZoneDescriptor *zones)
+{
+    int ret;
+    BlockDriverState *bs;
+    IO_CODE();
+
+    blk_inc_in_flight(blk); /* increase before waiting */
+    blk_wait_while_drained(blk);
+    bs = blk_bs(blk);
+
+    ret = blk_check_byte_request(blk, offset, len);
+    if (ret < 0) {
+        return ret;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = bdrv_co_zone_report(blk->root->bs, offset, len,
+                              nr_zones, zones);
+    bdrv_dec_in_flight(bs);
+    blk_dec_in_flight(blk);
+    return ret;
+}
+
+/*
+ * Return zone_mgmt from BlockDriver.
+ * Offset is the start of a zone and len is aligned to zones.
+ */
+int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
+        int64_t offset, int64_t len)
+{
+    int ret;
+    BlockDriverState *bs;
+    IO_CODE();
+
+    blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
+    bs = blk_bs(blk);
+
+    ret = blk_check_byte_request(blk, offset, len);
+    if (ret < 0) {
+        return ret;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
+    bdrv_dec_in_flight(bs);
+    blk_dec_in_flight(blk);
+    return ret;
+}
+
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
diff --git a/block/coroutines.h b/block/coroutines.h
index 830ecaa733..a114d7bc30 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -80,6 +80,11 @@ int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 
 int coroutine_fn blk_co_do_flush(BlockBackend *blk);
+int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
+                                    int64_t len, int64_t *nr_zones,
+                                    BlockZoneDescriptor *zones);
+int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
+        int64_t offset, int64_t len);
 
 
 /*
diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..1b8b0d351f 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -67,6 +67,7 @@
 #include <sys/param.h>
 #include <sys/syscall.h>
 #include <sys/vfs.h>
+#include <linux/blkzoned.h>
 #include <linux/cdrom.h>
 #include <linux/fd.h>
 #include <linux/fs.h>
@@ -216,6 +217,11 @@ typedef struct RawPosixAIOData {
             PreallocMode prealloc;
             Error **errp;
         } truncate;
+        struct {
+            int64_t *nr_zones;
+            BlockZoneDescriptor *zones;
+        } zone_report;
+        zone_op op;
     };
 } RawPosixAIOData;
 
@@ -1801,6 +1807,135 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
 }
 #endif
 
+/*
+ * parse_zone - Fill a zone descriptor
+ */
+static inline void parse_zone(struct BlockZoneDescriptor *zone,
+                              struct blk_zone *blkz) {
+    zone->start = blkz->start;
+    zone->length = blkz->len;
+    zone->cap = blkz->capacity;
+    zone->wp = blkz->wp - blkz->start;
+    zone->type = blkz->type;
+    zone->cond = blkz->cond;
+}
+
+static int handle_aiocb_zone_report(void *opaque) {
+    RawPosixAIOData *aiocb = opaque;
+    int fd = aiocb->aio_fildes;
+    int64_t *nr_zones = aiocb->zone_report.nr_zones;
+    BlockZoneDescriptor *zones = aiocb->zone_report.zones;
+    int64_t offset = aiocb->aio_offset;
+    int64_t len = aiocb->aio_nbytes;
+
+    struct blk_zone *blkz;
+    int64_t rep_size, nrz;
+    int ret, n = 0, i = 0;
+
+    nrz = *nr_zones;
+    if (len == -1) {
+        return -errno;
+    }
+    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
+    g_autofree struct blk_zone_report *rep = g_new(struct blk_zone_report, nrz);
+    offset = offset / 512; /* get the unit of the start sector: sector size is 512 bytes. */
+    printf("start to report zone with offset: 0x%lx\n", offset);
+
+    blkz = (struct blk_zone *)(rep + 1);
+    while (n < nrz) {
+        memset(rep, 0, rep_size);
+        rep->sector = offset;
+        rep->nr_zones = nrz;
+
+        ret = ioctl(fd, BLKREPORTZONE, rep);
+        if (ret != 0) {
+            ret = -errno;
+            error_report("%d: ioctl BLKREPORTZONE at %ld failed %d",
+                         fd, offset, errno);
+            return ret;
+        }
+
+        if (!rep->nr_zones) {
+            break;
+        }
+
+        for (i = 0; i < rep->nr_zones; i++, n++) {
+            parse_zone(&zones[n], &blkz[i]);
+            /* The next report should start after the last zone reported */
+            offset = blkz[i].start + blkz[i].len;
+        }
+    }
+
+    *nr_zones = n;
+    return 0;
+}
+
+static int handle_aiocb_zone_mgmt(void *opaque) {
+    RawPosixAIOData *aiocb = opaque;
+    int fd = aiocb->aio_fildes;
+    int64_t offset = aiocb->aio_offset;
+    int64_t len = aiocb->aio_nbytes;
+    zone_op op = aiocb->op;
+
+    struct blk_zone_range range;
+    const char *ioctl_name;
+    unsigned long ioctl_op;
+    int64_t zone_size;
+    int64_t zone_size_mask;
+    int ret;
+
+    ret = ioctl(fd, BLKGETZONESZ, &zone_size);
+    if (ret) {
+        return -1;
+    }
+
+    zone_size_mask = zone_size - 1;
+    if (offset & zone_size_mask) {
+        error_report("offset is not the start of a zone");
+        return -1;
+    }
+
+    if (len & zone_size_mask) {
+        error_report("len is not aligned to zones");
+        return -1;
+    }
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
+    range.sector = offset;
+    range.nr_sectors = len;
+    ret = ioctl(fd, ioctl_op, &range);
+    if (ret != 0) {
+        error_report("ioctl %s failed %d",
+                     ioctl_name, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
 static int handle_aiocb_copy_range(void *opaque)
 {
     RawPosixAIOData *aiocb = opaque;
@@ -2973,6 +3108,58 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
     }
 }
 
+/*
+ * zone report - Get a zone block device's information in the form
+ * of an array of zone descriptors.
+ *
+ * @param bs: passing zone block device file descriptor
+ * @param zones: an array of zone descriptors to hold zone
+ * information on reply
+ * @param offset: offset can be any byte within the zone size.
+ * @param len: (not sure yet.
+ * @return 0 on success, -1 on failure
+ */
+static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+        int64_t len, int64_t *nr_zones,
+        BlockZoneDescriptor *zones) {
+    BDRVRawState *s = bs->opaque;
+    RawPosixAIOData acb;
+
+    acb = (RawPosixAIOData) {
+        .bs         = bs,
+        .aio_fildes = s->fd,
+        .aio_type   = QEMU_AIO_IOCTL,
+        .aio_offset = offset,
+        .aio_nbytes = len,
+        .zone_report    = {
+                .nr_zones       = nr_zones,
+                .zones          = zones,
+                },
+    };
+
+    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
+}
+
+/*
+ * zone management operations - Execute an operation on a zone
+ */
+static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, zone_op op,
+        int64_t offset, int64_t len) {
+    BDRVRawState *s = bs->opaque;
+    RawPosixAIOData acb;
+
+    acb = (RawPosixAIOData) {
+        .bs             = bs,
+        .aio_fildes     = s->fd,
+        .aio_type       = QEMU_AIO_IOCTL,
+        .aio_offset     = offset,
+        .aio_nbytes     = len,
+        .op             = op,
+    };
+
+    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
+}
+
 static coroutine_fn int
 raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 bool blkdev)
@@ -3324,6 +3511,9 @@ BlockDriver bdrv_file = {
     .bdrv_abort_perm_update = raw_abort_perm_update,
     .create_opts = &raw_create_opts,
     .mutable_opts = mutable_opts,
+
+    .bdrv_co_zone_report = raw_co_zone_report,
+    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
 };
 
 /***********************************************/
@@ -3703,6 +3893,53 @@ static BlockDriver bdrv_host_device = {
 #endif
 };
 
+static BlockDriver bdrv_zoned_host_device = {
+        .format_name = "zoned_host_device",
+        .protocol_name = "zoned_host_device",
+        .instance_size = sizeof(BDRVRawState),
+        .bdrv_needs_filename = true,
+        .bdrv_probe_device  = hdev_probe_device,
+        .bdrv_parse_filename = hdev_parse_filename,
+        .bdrv_file_open     = hdev_open,
+        .bdrv_close         = raw_close,
+        .bdrv_reopen_prepare = raw_reopen_prepare,
+        .bdrv_reopen_commit  = raw_reopen_commit,
+        .bdrv_reopen_abort   = raw_reopen_abort,
+        .bdrv_co_create_opts = bdrv_co_create_opts_simple,
+        .create_opts         = &bdrv_create_opts_simple,
+        .mutable_opts        = mutable_opts,
+        .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
+        .bdrv_co_pwrite_zeroes = hdev_co_pwrite_zeroes,
+
+        .bdrv_co_preadv         = raw_co_preadv,
+        .bdrv_co_pwritev        = raw_co_pwritev,
+        .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
+        .bdrv_co_pdiscard       = hdev_co_pdiscard,
+        .bdrv_co_copy_range_from = raw_co_copy_range_from,
+        .bdrv_co_copy_range_to  = raw_co_copy_range_to,
+        .bdrv_refresh_limits = raw_refresh_limits,
+        .bdrv_io_plug = raw_aio_plug,
+        .bdrv_io_unplug = raw_aio_unplug,
+        .bdrv_attach_aio_context = raw_aio_attach_aio_context,
+
+        .bdrv_co_truncate       = raw_co_truncate,
+        .bdrv_getlength = raw_getlength,
+        .bdrv_get_info = raw_get_info,
+        .bdrv_get_allocated_file_size
+                            = raw_get_allocated_file_size,
+        .bdrv_get_specific_stats = hdev_get_specific_stats,
+        .bdrv_check_perm = raw_check_perm,
+        .bdrv_set_perm   = raw_set_perm,
+        .bdrv_abort_perm_update = raw_abort_perm_update,
+        .bdrv_probe_blocksizes = hdev_probe_blocksizes,
+        .bdrv_probe_geometry = hdev_probe_geometry,
+        .bdrv_co_ioctl = hdev_co_ioctl,
+
+        /* zone management operations */
+        .bdrv_co_zone_report = raw_co_zone_report,
+        .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+};
+
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 static void cdrom_parse_filename(const char *filename, QDict *options,
                                  Error **errp)
@@ -3964,6 +4201,7 @@ static void bdrv_file_init(void)
 #if defined(HAVE_HOST_BLOCK_DEVICE)
     bdrv_register(&bdrv_host_device);
 #ifdef __linux__
+    bdrv_register(&bdrv_zoned_host_device);
     bdrv_register(&bdrv_host_cdrom);
 #endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..78cddeeda5 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -23,7 +23,6 @@
  */
 #ifndef BLOCK_COMMON_H
 #define BLOCK_COMMON_H
-
 #include "block/aio.h"
 #include "block/aio-wait.h"
 #include "qemu/iov.h"
@@ -49,6 +48,48 @@ typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
 typedef struct BdrvChildClass BdrvChildClass;
 
+typedef enum zone_op {
+    zone_open,
+    zone_close,
+    zone_finish,
+    zone_reset,
+} zone_op;
+
+typedef enum zone_model {
+    BLK_Z_HM,
+    BLK_Z_HA,
+} zone_model;
+
+typedef enum BlkZoneCondition {
+    BLK_ZS_NOT_WP = 0x0,
+    BLK_ZS_EMPTY = 0x1,
+    BLK_ZS_IOPEN = 0x2,
+    BLK_ZS_EOPEN = 0x3,
+    BLK_ZS_CLOSED = 0x4,
+    BLK_ZS_RDONLY = 0xD,
+    BLK_ZS_FULL = 0xE,
+    BLK_ZS_OFFLINE = 0xF,
+} BlkZoneCondition;
+
+typedef enum BlkZoneType {
+    BLK_ZT_CONV = 0x1,
+    BLK_ZT_SWR = 0x2,
+    BLK_ZT_SWP = 0x3,
+} BlkZoneType;
+
+/*
+ * Zone descriptor data structure.
+ * Provide information on a zone with all position and size values in bytes.
+ */
+typedef struct BlockZoneDescriptor {
+    uint64_t start;
+    uint64_t length;
+    uint64_t cap;
+    uint64_t wp;
+    BlkZoneType type;
+    BlkZoneCondition cond;
+} BlockZoneDescriptor;
+
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
     int cluster_size;
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..b9ea9db6dc 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -94,6 +94,20 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;
 
+/**
+ * Zone device information data structure.
+ * Provide information on a device.
+ */
+typedef struct zbd_dev {
+    uint32_t zone_size;
+    zone_model model;
+    uint32_t block_size;
+    uint32_t write_granularity;
+    uint32_t nr_zones;
+    struct BlockZoneDescriptor *zones; /* array of zones */
+    uint32_t max_nr_open_zones; /* maximum number of explicitly open zones */
+    uint32_t max_nr_active_zones;
+} zbd_dev;
 
 struct BlockDriver {
     /*
@@ -691,6 +705,12 @@ struct BlockDriver {
                                           QEMUIOVector *qiov,
                                           int64_t pos);
 
+    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
+            int64_t offset, int64_t len, int64_t *nr_zones,
+            BlockZoneDescriptor *zones);
+    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, enum zone_op op,
+            int64_t offset, int64_t len);
+
     /* removable device specific */
     bool (*bdrv_is_inserted)(BlockDriverState *bs);
     void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
-- 
2.35.3


