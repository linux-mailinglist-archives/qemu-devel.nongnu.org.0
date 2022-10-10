Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541085F96D8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:36:02 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohie9-0005VP-Dn
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohibf-0001Gi-Tj; Sun, 09 Oct 2022 22:33:29 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohibd-0007ox-Sm; Sun, 09 Oct 2022 22:33:27 -0400
Received: by mail-pf1-x431.google.com with SMTP id i3so82184pfc.11;
 Sun, 09 Oct 2022 19:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvfxl0IgBZCvmM66WK3Orr+3oPbgHzm5QrwL9hvAxyA=;
 b=UXq/9yozZNGYg3Tw1gElEcWvFQ2jKX3nzIrfUyLXD075PzONVsSxyJcpi7XNF5hnis
 DceBQ/7wBbkjueMc23YnZQhZybnJp8VfTKM/t0wPJE8+39XOzKghIWATuSsp9komY4BW
 dNnyuXxVAMbufdN6BBRee9V87rpYljvDhy5mNDjq9wfKfneuJrKyoOvCpyOE52QLjnOb
 tJZZbQ+4NBtK6Vjx1LdC+8F7sBDquGRp52lrrH13TAQUTMzh4gLOkfpI9SHc+vjoVEsE
 VXa73C0wzsIPuH8NdhGox3V43xWj9o1eIo0EigA8o2aHhIU4eyfPrnBUluWO6XTAh/ZD
 mrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvfxl0IgBZCvmM66WK3Orr+3oPbgHzm5QrwL9hvAxyA=;
 b=YRMu6BPuABQTVtrZ3NxIq3+6c90QcvNH7hWkEtTLHbn2+ocHmBSx74fpuTWBIgiB0e
 XTR7rcSXe/3oA7O0Zc+jY/dIITXD3tqnvVA8TjoltyQ7mWbAM5uh2nYj+91ifKU+8PLZ
 9L/kYNz9hgNrIVkpRuh0uQ02V9sicP3vpn9LkT/60x3YXdFBIi6x04sHJtTnU90Xn0YS
 EX1kSQPdDtHuUWy45f/pkD+YwWGHqzOvn5OW+VhAnws0a8V/wqNVXd1S6Na/sF2ix7kg
 hH5gkdF/igW/HUMlrmqjYp/RNNugqPaIU1FJSUdGuIHH7ho5aPiqvCDzWRBZ6DZHRMsM
 Hw2w==
X-Gm-Message-State: ACrzQf1DvSwow1WSuWcEktxKzyUYdL/LlYlQlG84aRsWrExj2TxWbjmd
 +GogP9uxXOPy4wpdNE4pnBgGdM4wxT3qh7xJeLI=
X-Google-Smtp-Source: AMsMyM6lWvqJYge9lvyCRqW4pw1VtvQ4JJAoKGQKMi+DHPgz9Fmhi3HT3aMQGyXvycak7NTQLjCdng==
X-Received: by 2002:a63:1b0e:0:b0:44b:97e8:1020 with SMTP id
 b14-20020a631b0e000000b0044b97e81020mr14597522pgb.519.1665369203272; 
 Sun, 09 Oct 2022 19:33:23 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 j64-20020a625543000000b00537b1aa9191sm5743995pfb.178.2022.10.09.19.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:33:23 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v3 1/3] file-posix:add the tracking of the zones write pointers
Date: Mon, 10 Oct 2022 10:33:04 +0800
Message-Id: <20221010023306.43610-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010023306.43610-1-faithilikerun@gmail.com>
References: <20221010023306.43610-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since Linux doesn't have a user API to issue zone append operations to
zoned devices from user space, the file-posix driver is modified to add
zone append emulation using regular writes. To do this, the file-posix
driver tracks the wp location of all zones of the device. It uses an
array of uint64_t. The most significant bit of each wp location indicates
if the zone type is conventional zones.

The zones wp can be changed due to the following operations issued:
- zone reset: change the wp to the start offset of that zone
- zone finish: change to the end location of that zone
- write to a zone
- zone append

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/file-posix.c               | 158 +++++++++++++++++++++++++++++++
 include/block/block-common.h     |  14 +++
 include/block/block_int-common.h |   5 +
 3 files changed, 177 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index a9d347292e..17c0b58158 100755
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -206,6 +206,7 @@ typedef struct RawPosixAIOData {
         struct {
             struct iovec *iov;
             int niov;
+            int64_t *append_sector;
         } io;
         struct {
             uint64_t cmd;
@@ -226,6 +227,7 @@ typedef struct RawPosixAIOData {
         struct {
             unsigned long zone_op;
             const char *zone_op_name;
+            bool all;
         } zone_mgmt;
     };
 } RawPosixAIOData;
@@ -1331,6 +1333,67 @@ static int hdev_get_max_segments(int fd, struct stat *st) {
 #endif
 }
 
+#if defined(CONFIG_BLKZONED)
+static int get_zones_wp(int64_t offset, int fd, BlockZoneWps *wps,
+                        unsigned int nrz) {
+    struct blk_zone *blkz;
+    int64_t rep_size;
+    int64_t sector = offset >> BDRV_SECTOR_BITS;
+    int ret, n = 0, i = 0;
+    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
+    g_autofree struct blk_zone_report *rep = NULL;
+
+    rep = g_malloc(rep_size);
+    blkz = (struct blk_zone *)(rep + 1);
+    while (n < nrz) {
+        memset(rep, 0, rep_size);
+        rep->sector = sector;
+        rep->nr_zones = nrz - n;
+
+        do {
+            ret = ioctl(fd, BLKREPORTZONE, rep);
+        } while (ret != 0 && errno == EINTR);
+        if (ret != 0) {
+            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed %d",
+                    fd, offset, errno);
+            return -errno;
+        }
+
+        if (!rep->nr_zones) {
+            break;
+        }
+
+        for (i = 0; i < rep->nr_zones; i++, n++) {
+            /*
+             * The wp tracking cares only about sequential writes required and
+             * sequential write preferred zones so that the wp can advance to
+             * the right location.
+             * Use the most significant bit of the wp location to indicate the
+             * zone type: 0 for SWR/SWP zones and 1 for conventional zones.
+             */
+            if (!(blkz[i].type != BLK_ZONE_TYPE_CONVENTIONAL)) {
+                wps->wp[i] += 1ULL << 63;
+            } else {
+                wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
+            }
+        }
+        sector = blkz[i-1].start + blkz[i-1].len;
+    }
+
+    return 0;
+}
+
+static void update_zones_wp(int64_t offset, int fd, BlockZoneWps *wps,
+                            unsigned int nrz) {
+    qemu_mutex_lock(&wps->lock);
+    if (get_zones_wp(offset, fd, wps, nrz) < 0) {
+        error_report("report zone wp failed");
+        return;
+    }
+    qemu_mutex_unlock(&wps->lock);
+}
+#endif
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -1414,6 +1477,19 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
             error_report("Invalid device capacity %" PRId64 " bytes ", bs->bl.capacity);
             return;
         }
+
+        ret = get_sysfs_long_val(&st, "physical_block_size");
+        if (ret >= 0) {
+            bs->bl.write_granularity = ret;
+        }
+
+        bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
+        if (get_zones_wp(0, s->fd, bs->bl.wps, ret) < 0){
+            error_report("report wps failed");
+            g_free(bs->bl.wps);
+            return;
+        }
+        qemu_mutex_init(&bs->bl.wps->lock);
     }
 }
 
@@ -1651,6 +1727,20 @@ static int handle_aiocb_rw(void *opaque)
     ssize_t nbytes;
     char *buf;
 
+    /*
+     * The offset of regular writes, append writes is the wp location
+     * of that zone.
+     */
+    if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->bs->bl.zone_size > 0) {
+            BlockZoneWps *wps = aiocb->bs->bl.wps;
+            qemu_mutex_lock(&wps->lock);
+            aiocb->aio_offset = wps->wp[aiocb->aio_offset /
+                                        aiocb->bs->bl.zone_size];
+            qemu_mutex_unlock(&wps->lock);
+        }
+    }
+
     if (!(aiocb->aio_type & QEMU_AIO_MISALIGNED)) {
         /*
          * If there is just a single buffer, and it is properly aligned
@@ -1725,6 +1815,24 @@ static int handle_aiocb_rw(void *opaque)
 
 out:
     if (nbytes == aiocb->aio_nbytes) {
+#if defined(CONFIG_BLKZONED)
+        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+            BlockZoneWps *wps = aiocb->bs->bl.wps;
+            int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
+            if (wps) {
+                qemu_mutex_lock(&wps->lock);
+                if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
+                    uint64_t wend_offset =
+                            aiocb->aio_offset + aiocb->aio_nbytes;
+                    /* Advance the wp if needed */
+                    if (wend_offset > wps->wp[index]){
+                        wps->wp[index] = wend_offset;
+                    }
+                }
+                qemu_mutex_unlock(&wps->lock);
+            }
+        }
+#endif
         return 0;
     } else if (nbytes >= 0 && nbytes < aiocb->aio_nbytes) {
         if (aiocb->aio_type & QEMU_AIO_WRITE) {
@@ -1736,6 +1844,12 @@ out:
         }
     } else {
         assert(nbytes < 0);
+#if defined(CONFIG_BLKZONED)
+        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+            update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
+                            aiocb->bs->bl.nr_zones);
+        }
+#endif
         return nbytes;
     }
 }
@@ -2022,12 +2136,17 @@ static int handle_aiocb_zone_report(void *opaque) {
 #if defined(CONFIG_BLKZONED)
 static int handle_aiocb_zone_mgmt(void *opaque) {
     RawPosixAIOData *aiocb = opaque;
+    BlockDriverState *bs = aiocb->bs;
     int fd = aiocb->aio_fildes;
     int64_t sector = aiocb->aio_offset / 512;
     int64_t nr_sectors = aiocb->aio_nbytes / 512;
+    uint64_t wend_offset;
     struct blk_zone_range range;
     int ret;
 
+    BlockZoneWps *wps = bs->bl.wps;
+    int index = aiocb->aio_offset / bs->bl.zone_size;
+
     /* Execute the operation */
     range.sector = sector;
     range.nr_sectors = nr_sectors;
@@ -2035,11 +2154,41 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
         ret = ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
     } while (ret != 0 && errno == EINTR);
     if (ret != 0) {
+        update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
+                        aiocb->bs->bl.nr_zones);
         ret = -errno;
         error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_name,
                      ret);
         return ret;
     }
+
+    qemu_mutex_lock(&wps->lock);
+    if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
+         /*
+         * The zoned device allows the last zone smaller that the zone size.
+         */
+        if (aiocb->aio_nbytes < bs->bl.zone_size) {
+            wend_offset = aiocb->aio_offset + aiocb->aio_nbytes;
+        } else {
+            wend_offset = aiocb->aio_offset + bs->bl.zone_size;
+        }
+
+        if (aiocb->aio_offset != wps->wp[index] &&
+            aiocb->zone_mgmt.zone_op == BLKRESETZONE) {
+            if (aiocb->zone_mgmt.all) {
+                for (int i = 0; i < bs->bl.nr_zones; ++i) {
+                    wps->wp[i] = i * bs->bl.zone_size;
+                }
+            } else {
+                wps->wp[index] = aiocb->aio_offset;
+            }
+        } else if (aiocb->aio_offset != wps->wp[index] &&
+            aiocb->zone_mgmt.zone_op == BLKFINISHZONE) {
+            wps->wp[index] = wend_offset;
+        }
+    }
+    qemu_mutex_unlock(&wps->lock);
+
     return ret;
 }
 #endif
@@ -2480,6 +2629,12 @@ static void raw_close(BlockDriverState *bs)
     BDRVRawState *s = bs->opaque;
 
     if (s->fd >= 0) {
+#if defined(CONFIG_BLKZONED)
+        if (bs->bl.wps) {
+            qemu_mutex_destroy(&bs->bl.wps->lock);
+            g_free(bs->bl.wps);
+        }
+#endif
         qemu_close(s->fd);
         s->fd = -1;
     }
@@ -3278,6 +3433,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     int64_t zone_size, zone_size_mask;
     const char *zone_op_name;
     unsigned long zone_op;
+    bool is_all = false;
 
     zone_size = bs->bl.zone_size;
     zone_size_mask = zone_size - 1;
@@ -3314,6 +3470,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     case BLK_ZO_RESET_ALL:
         zone_op_name = "BLKRESETZONE";
         zone_op = BLKRESETZONE;
+        is_all = true;
         break;
     default:
         g_assert_not_reached();
@@ -3328,6 +3485,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
         .zone_mgmt  = {
             .zone_op = zone_op,
             .zone_op_name = zone_op_name,
+            .all = is_all,
         },
     };
 
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 882de6825e..b8b2dba64a 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -93,6 +93,14 @@ typedef struct BlockZoneDescriptor {
     BlockZoneCondition cond;
 } BlockZoneDescriptor;
 
+/*
+ * Track write pointers of a zone in bytes.
+ */
+typedef struct BlockZoneWps {
+    QemuMutex lock;
+    uint64_t wp[];
+} BlockZoneWps;
+
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
     int cluster_size;
@@ -206,6 +214,12 @@ typedef enum {
 #define BDRV_SECTOR_BITS   9
 #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
 
+/*
+ * Get the first most significant bit of wp. If it is zero, then
+ * the zone type is SWR.
+ */
+#define BDRV_ZT_IS_CONV(wp)    (wp & (1ULL << 63))
+
 #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_BITS, \
                                            INT_MAX >> BDRV_SECTOR_BITS)
 #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_BITS)
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 37dddc603c..59c2d1316d 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -857,6 +857,11 @@ typedef struct BlockLimits {
 
     /* device capacity expressed in bytes */
     int64_t capacity;
+
+    /* array of write pointers' location of each zone in the zoned device. */
+    BlockZoneWps *wps;
+
+    int64_t write_granularity;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.37.3


