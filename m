Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64D600071
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 17:11:59 +0200 (CEST)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok5J0-00043U-Ex
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 11:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok54K-0006H0-Le; Sun, 16 Oct 2022 10:56:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok54I-0005nm-IZ; Sun, 16 Oct 2022 10:56:48 -0400
Received: by mail-pl1-x634.google.com with SMTP id c24so8738953plo.3;
 Sun, 16 Oct 2022 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jna2xw3cLTCAsI1QIvckJ+CFIt0+veQ1wD9LBvGFL3w=;
 b=Xs7MiA35dfPjnxSU+xRMGFzTt+j3pOsNrkl5BStG375Lu6fT6avA1FVgIADMmta17C
 m77Kq7v060svvxPg7OzRrGLJ+E4SplYt8CMnZV2boklEsoCYV9axuYykgpEaQqKSq4wl
 4Kdqi+N6NxUGHwKcVg9E6qN5jV1WSAtK10v42/eNuFGY+L2MCiQtHnUpDh8rf6w9P0xx
 FhSmryZMSYXk8qwMDDxgPFLlWIO57mY78Il1To7Czs99KQiWWqhJINFrQLzv2x22H70/
 fsctByv5GcMu0F65VzbW5l0luA8TiU9iyODa091DG+XeLj8bylcQ0jwyrlDMnk34CbtO
 znUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jna2xw3cLTCAsI1QIvckJ+CFIt0+veQ1wD9LBvGFL3w=;
 b=IBnPj3DU+exSvJym+XBvVJTt2ThE5i+MIjShQVXhjwH8qWc7DYTHcgoLuwwrOJOQcg
 OCJAV2mRUnUVLrwUSC874otXEsDVIr6X+RkrcnjtOsxhZZ5cCG0zTRKg+O3146k0Xe9A
 C6kRlUlGBiF/D+s7MvC/U/xWPYohYs6FAyIxk1oRJ2ZUh2PEgHzR9HBplOAfzItIeXai
 1fFX0XzWz+qFGuPQitzZt+zB9SaDz1teruEaZISpPb5mX8EuY/dASUr/hfKz/XEV+IEQ
 j58gkKFCyGWoxS5pzeMBRL11qvuc28f/5hSAbjdPlHHMHDyE+clHvKFQQk7aYs90E9Zx
 svOA==
X-Gm-Message-State: ACrzQf1YdSbLc8T5LDmLoDE8keW2jFXQzDwNwRf+avyAgBCEZXlKTrJt
 2AX2GAUBHrkll/EAx76fogXAVr0wxhXUnQ==
X-Google-Smtp-Source: AMsMyM54Nq9UJ7p0CBwJhBo9jmDFr8QVf6o2ly/aAm3KrR0IJw3V2pzx8HdnUxwvRLz3MoS5kRtlAg==
X-Received: by 2002:a17:902:e545:b0:182:6c84:7fc0 with SMTP id
 n5-20020a170902e54500b001826c847fc0mr7567743plf.144.1665932204394; 
 Sun, 16 Oct 2022 07:56:44 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 75-20020a62154e000000b00562a8150c08sm5070380pfv.168.2022.10.16.07.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 07:56:43 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v4 1/3] file-posix: add the tracking of the zones write
 pointers
Date: Sun, 16 Oct 2022 22:56:24 +0800
Message-Id: <20221016145626.171838-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016145626.171838-1-faithilikerun@gmail.com>
References: <20221016145626.171838-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x634.google.com
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
 block/file-posix.c               | 144 +++++++++++++++++++++++++++++++
 include/block/block-common.h     |  14 +++
 include/block/block_int-common.h |   3 +
 3 files changed, 161 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 7c5a330fc1..5ff5500301 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1324,6 +1324,66 @@ static int hdev_get_max_segments(int fd, struct stat *st)
 #endif
 }
 
+#if defined(CONFIG_BLKZONED)
+static int get_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
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
+            if (blkz[i].type == BLK_ZONE_TYPE_CONVENTIONAL) {
+                wps->wp[i] = 1ULL << 63;
+            } else {
+                wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
+            }
+        }
+        sector = blkz[i - 1].start + blkz[i - 1].len;
+    }
+
+    return 0;
+}
+
+static void update_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
+                            unsigned int nrz) {
+    qemu_mutex_lock(&wps->lock);
+    if (get_zones_wp(fd, wps, offset, nrz) < 0) {
+        error_report("update zone wp failed");
+    }
+    qemu_mutex_unlock(&wps->lock);
+}
+#endif
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -1414,6 +1474,14 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
         if (ret >= 0) {
             bs->bl.max_active_zones = ret;
         }
+
+        bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
+        if (get_zones_wp(s->fd, bs->bl.wps, 0, ret) < 0) {
+            error_report("report wps failed");
+            g_free(bs->bl.wps);
+            return;
+        }
+        qemu_mutex_init(&bs->bl.wps->lock);
     }
 }
 
@@ -1725,6 +1793,25 @@ static int handle_aiocb_rw(void *opaque)
 
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
+
+                    /* Advance the wp if needed */
+                    if (wend_offset > wps->wp[index]) {
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
@@ -1736,6 +1823,11 @@ out:
         }
     } else {
         assert(nbytes < 0);
+#if defined(CONFIG_BLKZONED)
+        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+            update_zones_wp(aiocb->aio_fildes, aiocb->bs->bl.wps, 0, 1);
+        }
+#endif
         return nbytes;
     }
 }
@@ -2022,14 +2114,29 @@ static int handle_aiocb_zone_report(void *opaque)
 #endif
 
 #if defined(CONFIG_BLKZONED)
+static bool zone_is_empty(BlockDriverState *bs, int64_t index)
+{
+    return bs->bl.wps->wp[index] == index * bs->bl.zone_size;
+}
+
 static int handle_aiocb_zone_mgmt(void *opaque)
 {
     RawPosixAIOData *aiocb = opaque;
+    BlockDriverState *bs = aiocb->bs;
     int fd = aiocb->aio_fildes;
     int64_t sector = aiocb->aio_offset / 512;
     int64_t nr_sectors = aiocb->aio_nbytes / 512;
     struct blk_zone_range range;
     int ret;
+    uint64_t wend_offset;
+    BlockZoneWps *wps = bs->bl.wps;
+    int index = aiocb->aio_offset / bs->bl.zone_size;
+
+    if (BDRV_ZT_IS_CONV(wps->wp[index]) &&
+        aiocb->aio_nbytes != bs->bl.capacity) {
+        error_report("zone mgmt operations not allowed for conventional zones");
+        return -EIO;
+    }
 
     /* Execute the operation */
     range.sector = sector;
@@ -2038,11 +2145,42 @@ static int handle_aiocb_zone_mgmt(void *opaque)
         ret = ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
     } while (ret != 0 && errno == EINTR);
     if (ret != 0) {
+        update_zones_wp(aiocb->aio_fildes, aiocb->bs->bl.wps,
+                        aiocb->aio_offset,
+                        aiocb->aio_nbytes / bs->bl.zone_size);
         ret = -errno;
         error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_name,
                      ret);
         return ret;
     }
+    qemu_mutex_lock(&wps->lock);
+    if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
+        /*
+         * The zoned device allows the last zone smaller that the zone size.
+         */
+        if (aiocb->aio_nbytes < bs->bl.zone_size) {
+            wend_offset = aiocb->aio_offset + aiocb->aio_nbytes;
+        } else {
+            wend_offset = aiocb->aio_offset + bs->bl.zone_size;
+        }
+
+        if (!zone_is_empty(bs, index) &&
+            aiocb->zone_mgmt.zone_op == BLKRESETZONE) {
+            if (aiocb->aio_nbytes == bs->bl.capacity) {
+                for (int i = 0; i < bs->bl.nr_zones; ++i) {
+                    if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
+                        wps->wp[i] = i * bs->bl.zone_size;
+                    }
+                }
+            } else {
+                wps->wp[index] = aiocb->aio_offset;
+            }
+        } else if (aiocb->zone_mgmt.zone_op == BLKFINISHZONE) {
+            wps->wp[index] = wend_offset;
+        }
+    }
+    qemu_mutex_unlock(&wps->lock);
+
     return 0;
 }
 #endif
@@ -2483,6 +2621,12 @@ static void raw_close(BlockDriverState *bs)
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
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 36bd0e480e..52372f8252 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -92,6 +92,14 @@ typedef struct BlockZoneDescriptor {
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
@@ -205,6 +213,12 @@ typedef enum {
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
index 37dddc603c..e3136146aa 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -857,6 +857,9 @@ typedef struct BlockLimits {
 
     /* device capacity expressed in bytes */
     int64_t capacity;
+
+    /* array of write pointers' location of each zone in the zoned device. */
+    BlockZoneWps *wps;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.37.3


