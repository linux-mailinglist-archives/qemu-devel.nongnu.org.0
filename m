Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6725EF2A0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:49:52 +0200 (CEST)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odqAx-0002Sd-2H
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odptc-0007Bn-G1; Thu, 29 Sep 2022 05:31:59 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odpta-0001ez-6D; Thu, 29 Sep 2022 05:31:56 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso4911177pjq.1; 
 Thu, 29 Sep 2022 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8wLsUBWj3cXyIPNL/MTfRY4z3OxfsK5SyQJFUv1yLBk=;
 b=kkf3pEt8RwkR33b4R16x0+gC8JUqkNV9/vY1GCawqF8sRKJb7bxpvHPTAdoDo3PZxh
 FAInbtJZdEYzYmQ91JounnKv8eDM8Vc7SX8ummY2jIz227YLL4WQoPqpmzDhEOI5b4Bx
 lEpyY01WlJd7+B9TX/4VWtzoqzLuUn6k5CpEOgCh0YQxYPiS46LNdUWlHuft8eq0OmCf
 SRob4wC5apyBTpdj8gd1jKrecIPmwREDLRj0llnWLIx+ug2AQvWSEa8nin4Pf/M43myb
 ySHPCQzCgbGcybLHYkcyNtq/VREnxMatW2oVGM64kMQs6zDoe1HAcyt39i3eS3iCYshx
 M7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8wLsUBWj3cXyIPNL/MTfRY4z3OxfsK5SyQJFUv1yLBk=;
 b=uPtEI7q2Oi+17A+WLpwReqvj/gkI+N+GogQZvvSXOp9o6u6ga6zaCR0XVYgewyyjqR
 2Cc0My73mKQHHHl98qOyr5dU/H/pt9Km1SJtSkg3u7y9FlMp9bszqkObTOIupPRQnouE
 CAooUr0hIN98eiTrpkRec4wzkD2fVmOiQWK3YPfztlr5YMgUyYdUP8zzHyHrsWNke4QB
 GYSXcoajgOi0xFIaE9xD3R/j+zkNFg8aVO3blkZAiPbRlXUSUScjUtOj91zLlJtjDVsk
 Z/mQariLj//Cu6EPZPb1qwljZud3M9NSBnFdQTteitMhWEc6KLe+y+OSlzeLr48GMLNi
 /9hQ==
X-Gm-Message-State: ACrzQf1YOKzWFixGU3w8dVsosGbGUHjaXx27ADbM7Ay5OOCRuVb78uvZ
 8MkUUtR+YIYkmt3xrm6ipqAvuKXGpHhdGw==
X-Google-Smtp-Source: AMsMyM71ViMuY/UPmZ4nk4z8D/xtj7DoEgglBhbZ/yFgiFgVLNC/87nZmDjZLxVs8tLQrIT81wsNKA==
X-Received: by 2002:a17:902:6542:b0:172:95d8:a777 with SMTP id
 d2-20020a170902654200b0017295d8a777mr2507573pln.61.1664443911835; 
 Thu, 29 Sep 2022 02:31:51 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 f4-20020a623804000000b0053e669cc845sm5570537pfa.190.2022.09.29.02.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 02:31:51 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, stefanha@redhat.com, dmitry.fomichev@wdc.com,
 hare@suse.de, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v2 1/2] file-posix: add the tracking of the zones wp
Date: Thu, 29 Sep 2022 17:31:33 +0800
Message-Id: <20220929093134.73974-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929093134.73974-1-faithilikerun@gmail.com>
References: <20220929093134.73974-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1034.google.com
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
if the zone type is sequential write required.

The zones wp can be changed due to the following operations issued:
- zone reset: change the wp to the start offset of that zone
- zone finish: change to the end location of that zone
- write to a zone
- zone append

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/file-posix.c               | 138 ++++++++++++++++++++++++++++++-
 include/block/block-common.h     |  16 ++++
 include/block/block_int-common.h |   5 ++
 include/block/raw-aio.h          |   4 +-
 4 files changed, 159 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 73656d87f2..33e81ac112 100755
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -206,6 +206,8 @@ typedef struct RawPosixAIOData {
         struct {
             struct iovec *iov;
             int niov;
+            int64_t *append_sector;
+            BlockZoneWps *wps;
         } io;
         struct {
             uint64_t cmd;
@@ -1332,6 +1334,59 @@ static int hdev_get_max_segments(int fd, struct stat *st) {
 #endif
 }
 
+#if defined(CONFIG_BLKZONED)
+static int report_zone_wp(int64_t offset, int fd, BlockZoneWps *wps,
+                          unsigned int nrz) {
+    struct blk_zone *blkz;
+    int64_t rep_size;
+    int64_t sector = offset >> BDRV_SECTOR_BITS;
+    int ret, n = 0, i = 0;
+
+    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
+    g_autofree struct blk_zone_report *rep = NULL;
+    rep = g_malloc(rep_size);
+
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
+            wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
+            sector = blkz[i].start + blkz[i].len;
+
+            /*
+             * In the wp tracking, it only cares if the zone type is sequential
+             * writes required so that the wp can advance to the right location.
+             * Instead of the type of zone_type which is an 8-bit unsigned
+             * integer, use the first most significant bits of the wp location
+             * to indicate the zone type: 0 for SWR zones and 1 for the
+             * others.
+             */
+            if (!(blkz[i].type & BLK_ZONE_TYPE_SEQWRITE_REQ)) {
+                wps->wp[i] += (uint64_t)1 << 63;
+            }
+        }
+    }
+
+    return 0;
+}
+#endif
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -1415,6 +1470,20 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
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
+        qemu_mutex_init(&bs->bl.wps->lock);
+        if (report_zone_wp(0, s->fd, bs->bl.wps, ret) < 0 ) {
+            error_report("report wps failed");
+            qemu_mutex_destroy(&bs->bl.wps->lock);
+            g_free(bs->bl.wps);
+            return;
+        }
     }
 }
 
@@ -1582,7 +1651,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
     ssize_t len;
 
     do {
-        if (aiocb->aio_type & QEMU_AIO_WRITE)
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
             len = qemu_pwritev(aiocb->aio_fildes,
                                aiocb->io.iov,
                                aiocb->io.niov,
@@ -1612,7 +1681,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
     ssize_t len;
 
     while (offset < aiocb->aio_nbytes) {
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             len = pwrite(aiocb->aio_fildes,
                          (const char *)buf + offset,
                          aiocb->aio_nbytes - offset,
@@ -1705,7 +1774,7 @@ static int handle_aiocb_rw(void *opaque)
     }
 
     nbytes = handle_aiocb_rw_linear(aiocb, buf);
-    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
+    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
         char *p = buf;
         size_t count = aiocb->aio_nbytes, copy;
         int i;
@@ -1726,6 +1795,23 @@ static int handle_aiocb_rw(void *opaque)
 
 out:
     if (nbytes == aiocb->aio_nbytes) {
+#if defined(CONFIG_BLKZONED)
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
+            BlockZoneWps *wps = aiocb->io.wps;
+            int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
+            if (wps) {
+               if (BDRV_ZT_IS_SWR(wps->wp[index])) {
+                    qemu_mutex_lock(&wps->lock);
+                    wps->wp[index] += aiocb->aio_nbytes;
+                    qemu_mutex_unlock(&wps->lock);
+                }
+
+                if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
+                    *aiocb->io.append_sector = wps->wp[index] >> BDRV_SECTOR_BITS;
+                }
+            }
+        }
+#endif
         return 0;
     } else if (nbytes >= 0 && nbytes < aiocb->aio_nbytes) {
         if (aiocb->aio_type & QEMU_AIO_WRITE) {
@@ -1737,6 +1823,19 @@ out:
         }
     } else {
         assert(nbytes < 0);
+#if defined(CONFIG_BLKZONED)
+        if (aiocb->aio_type == QEMU_AIO_ZONE_APPEND) {
+            qemu_mutex_lock(&aiocb->bs->bl.wps->lock);
+            if (report_zone_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
+                           aiocb->bs->bl.nr_zones) < 0) {
+                error_report("report zone wp failed");
+                qemu_mutex_destroy(&aiocb->bs->bl.wps->lock);
+                g_free(aiocb->bs->bl.wps);
+                return -EINVAL;
+            }
+            qemu_mutex_unlock(&aiocb->bs->bl.wps->lock);
+        }
+#endif
         return nbytes;
     }
 }
@@ -2027,12 +2126,16 @@ static int handle_aiocb_zone_report(void *opaque) {
 static int handle_aiocb_zone_mgmt(void *opaque) {
 #if defined(CONFIG_BLKZONED)
     RawPosixAIOData *aiocb = opaque;
+    BlockDriverState *bs = aiocb->bs;
     int fd = aiocb->aio_fildes;
     int64_t sector = aiocb->aio_offset / 512;
     int64_t nr_sectors = aiocb->aio_nbytes / 512;
     struct blk_zone_range range;
     int ret;
 
+    BlockZoneWps *wps = bs->bl.wps;
+    int index = aiocb->aio_offset / bs->bl.zone_size;
+
     /* Execute the operation */
     range.sector = sector;
     range.nr_sectors = nr_sectors;
@@ -2045,6 +2148,22 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
                      errno);
         return -errno;
     }
+    
+    if (aiocb->zone_mgmt.all) {
+        for (int i = 0; i < bs->bl.nr_zones; ++i) {
+            qemu_mutex_lock(&wps->lock);
+            wps->wp[i] = i * bs->bl.zone_size;
+            qemu_mutex_unlock(&wps->lock);
+        }
+    } else if (aiocb->zone_mgmt.zone_op == BLKRESETZONE) {
+        qemu_mutex_lock(&wps->lock);
+        wps->wp[index] = aiocb->aio_offset;
+        qemu_mutex_unlock(&wps->lock);
+    } else if (aiocb->zone_mgmt.zone_op == BLKFINISHZONE) {
+        qemu_mutex_lock(&wps->lock);
+        wps->wp[index] = aiocb->aio_offset + bs->bl.zone_size;
+        qemu_mutex_unlock(&wps->lock);
+    }
     return ret;
 #else
     return -ENOTSUP;
@@ -2355,6 +2474,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
         },
     };
 
+    BlockZoneWps *wps = bs->bl.wps;
+    acb.io.wps = wps;
     assert(qiov->size == bytes);
     return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
 }
@@ -2465,6 +2586,12 @@ static void raw_close(BlockDriverState *bs)
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
@@ -3299,6 +3426,11 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
         zone_op_name = "BLKRESETZONE";
         zone_op = BLKRESETZONE;
         break;
+    case BLK_ZO_RESET_ALL:
+        zone_op_name = "BLKRESETZONE";
+        zone_op = BLKRESETZONE;
+        is_all = true;
+        break;
     default:
         g_assert_not_reached();
     }
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 8efb6b0c43..43bfc484eb 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -58,6 +58,7 @@ typedef enum BlockZoneOp {
     BLK_ZO_CLOSE,
     BLK_ZO_FINISH,
     BLK_ZO_RESET,
+    BLK_ZO_RESET_ALL,
 } BlockZoneOp;
 
 typedef enum BlockZoneModel {
@@ -96,6 +97,14 @@ typedef struct BlockZoneDescriptor {
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
@@ -209,6 +218,13 @@ typedef enum {
 #define BDRV_SECTOR_BITS   9
 #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
 
+/*
+ * Get the first most significant bit of WP. If it is zero, then
+ * the zone type is SWR.
+ */
+#define BDRV_ZT_IS_SWR(WP)    ((WP & 0x8000000000000000) == 0) ? (true) : \
+                              (false)
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
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 3d26929cdd..f13cc1887b 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -31,6 +31,7 @@
 #define QEMU_AIO_TRUNCATE     0x0080
 #define QEMU_AIO_ZONE_REPORT  0x0100
 #define QEMU_AIO_ZONE_MGMT    0x0200
+#define QEMU_AIO_ZONE_APPEND  0x0400
 #define QEMU_AIO_TYPE_MASK \
         (QEMU_AIO_READ | \
          QEMU_AIO_WRITE | \
@@ -41,7 +42,8 @@
          QEMU_AIO_COPY_RANGE | \
          QEMU_AIO_TRUNCATE  | \
          QEMU_AIO_ZONE_REPORT | \
-         QEMU_AIO_ZONE_MGMT)
+         QEMU_AIO_ZONE_MGMT | \
+         QEMU_AIO_ZONE_APPEND)
 
 /* AIO flags */
 #define QEMU_AIO_MISALIGNED   0x1000
-- 
2.37.3


