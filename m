Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC260FC6B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:53:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5BS-00083H-2N; Thu, 27 Oct 2022 11:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5BQ-0007nK-4u; Thu, 27 Oct 2022 11:52:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5BN-0002Iz-Se; Thu, 27 Oct 2022 11:52:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ez6so1962224pjb.1;
 Thu, 27 Oct 2022 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kijn3u/8+VZyPJ8m0dg566lEKL9c/ISZTbMARLxwhF4=;
 b=Lhwofxespsfb896TvxwDDFp30gkzFZPY6E5EOgkUwL4kPbw86A6b6wmAqsmtfnwui5
 NTFUZM8Evei0TWg5wx4G/VSn1IW7t2NcuaBHLI0WC1H0753/DisWaa3pPY9eHAgeaRsA
 uplS6luI0Jx+I0P7Tl0GAPRKRPIuJf08Ax2H9sSW9pmblkTe5SteaVQMj06ZT2i2tUu5
 Dd98+CrFkvX6Afv+OpBVv3U9NgVhwmBzlP+KzYxt8FgYOLSuDZvXfAG3YgGk42a5nlZa
 1iCVx1Zv0CKSIcOvvlxKqegag9CVR4we5ZVMhs+wyfwONVJYQJPLjhmcZhkPxdtajKCN
 WX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kijn3u/8+VZyPJ8m0dg566lEKL9c/ISZTbMARLxwhF4=;
 b=vkf7uhchD4ChAZomS+lJZ4X0+9L9rhL6rGNKvuC9ieevOkGSKpyXSgAR6OoezdtUYm
 FGbNgQrv58eFnCymL6tX4ZNelPDX6oRHAVf8j119oE5hBNF9uzRBuT7lVNRk40jellIu
 EiH4jJhBktu9JXPRVhfnKWwOE5v9P+KRYxNNUMlBxqRYHKl4HN/f152hGrBcN7EtpagD
 nDyjizpgeYcaR+SF/QdXrm7oR5BJh39LwkT/89K36N2dLIlO+oxB9JHxgeM+GC3zxohE
 TW2lpW+Ul2pzwTwyW2dJ9kw4HZfIgzZtcLqWEWVXxqwMiSKeRlVrGwhTwgZ8Hw1O/Fi4
 XRiA==
X-Gm-Message-State: ACrzQf2yaoqSv0KcF/tYm3B0HMmCXfGBbY9HS63rOTVjqsONMD+XxAgB
 zmsmiCWs/zlVlU57R5stKE3jXOIq7eQ3AAmq
X-Google-Smtp-Source: AMsMyM4XsUNFJHXWuL8i7WKBPRXyxstIC+W4h0f1Ren0RuLRprPSVzaD+YYGTyKlh0VZ7CuNv0gqVQ==
X-Received: by 2002:a17:90b:38c:b0:212:fe14:4ba0 with SMTP id
 ga12-20020a17090b038c00b00212fe144ba0mr11035627pjb.138.1666885955339; 
 Thu, 27 Oct 2022 08:52:35 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 f21-20020a623815000000b0056c058ab000sm1327744pfa.155.2022.10.27.08.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:52:35 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Julia Suvorova <jusual@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v5 1/4] file-posix: add tracking of the zone write pointers
Date: Thu, 27 Oct 2022 23:52:12 +0800
Message-Id: <20221027155215.21374-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027155215.21374-1-faithilikerun@gmail.com>
References: <20221027155215.21374-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
 block/file-posix.c               | 153 ++++++++++++++++++++++++++++++-
 include/block/block-common.h     |  14 +++
 include/block/block_int-common.h |   3 +
 3 files changed, 166 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index fe52e91da4..fbab23f450 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1323,6 +1323,77 @@ static int hdev_get_max_segments(int fd, struct stat *st)
 #endif
 }
 
+#if defined(CONFIG_BLKZONED)
+static int get_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
+                        unsigned int nrz) {
+    struct blk_zone *blkz;
+    size_t rep_size;
+    uint64_t sector = offset >> BDRV_SECTOR_BITS;
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
+                switch(blkz[i].cond) {
+                case BLK_ZONE_COND_FULL:
+                case BLK_ZONE_COND_READONLY:
+                    /* Zone not writable */
+                    wps->wp[i] = (blkz[i].start + blkz[i].len) << BDRV_SECTOR_BITS;
+                    break;
+                case BLK_ZONE_COND_OFFLINE:
+                    /* Zone not writable nor readable */
+                    wps->wp[i] = (blkz[i].start) << BDRV_SECTOR_BITS;
+                    break;
+                default:
+                    wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
+                    break;
+                }
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
+    if (get_zones_wp(fd, wps, offset, nrz) < 0) {
+        error_report("update zone wp failed");
+    }
+}
+#endif
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -1412,6 +1483,15 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
         if (ret >= 0) {
             bs->bl.max_active_zones = ret;
         }
+
+        bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
+        ret = get_zones_wp(s->fd, bs->bl.wps, 0, bs->bl.nr_zones);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "report wps failed");
+            g_free(bs->bl.wps);
+            return;
+        }
+        qemu_co_mutex_init(&bs->bl.wps->colock);
         return;
     }
 out:
@@ -2339,9 +2419,15 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
+    int ret;
 
     if (fd_open(bs) < 0)
         return -EIO;
+#if defined(CONFIG_BLKZONED)
+    if (bs->bl.wps) {
+        qemu_co_mutex_lock(&bs->bl.wps->colock);
+    }
+#endif
 
     /*
      * When using O_DIRECT, the request must be aligned to be able to use
@@ -2355,14 +2441,16 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     } else if (s->use_linux_io_uring) {
         LuringState *aio = aio_get_linux_io_uring(bdrv_get_aio_context(bs));
         assert(qiov->size == bytes);
-        return luring_co_submit(bs, aio, s->fd, offset, qiov, type);
+        ret = luring_co_submit(bs, aio, s->fd, offset, qiov, type);
+        goto out;
 #endif
 #ifdef CONFIG_LINUX_AIO
     } else if (s->use_linux_aio) {
         LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
         assert(qiov->size == bytes);
-        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
+        ret = laio_co_submit(bs, aio, s->fd, offset, qiov, type,
                               s->aio_max_batch);
+        goto out;
 #endif
     }
 
@@ -2379,7 +2467,32 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     };
 
     assert(qiov->size == bytes);
-    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
+    ret = raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
+
+out:
+#if defined(CONFIG_BLKZONED)
+    BlockZoneWps *wps = bs->bl.wps;
+    if (ret == 0) {
+        if (type & QEMU_AIO_WRITE && wps && bs->bl.zone_size) {
+            int index = offset / bs->bl.zone_size;
+            if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
+                /* Advance the wp if needed */
+                if (offset + bytes > wps->wp[index]) {
+                    wps->wp[index] = offset + bytes;
+                }
+            }
+        }
+    } else {
+        if (type & QEMU_AIO_WRITE) {
+            update_zones_wp(s->fd, bs->bl.wps, 0, 1);
+        }
+    }
+
+    if (wps) {
+        qemu_co_mutex_unlock(&wps->colock);
+    }
+#endif
+    return ret;
 }
 
 static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
@@ -2488,6 +2601,11 @@ static void raw_close(BlockDriverState *bs)
     BDRVRawState *s = bs->opaque;
 
     if (s->fd >= 0) {
+#if defined(CONFIG_BLKZONED)
+        if (bs->bl.wps) {
+            g_free(bs->bl.wps);
+        }
+#endif
         qemu_close(s->fd);
         s->fd = -1;
     }
@@ -3288,6 +3406,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     const char *op_name;
     unsigned long zo;
     int ret;
+    BlockZoneWps *wps = bs->bl.wps;
     int64_t capacity = bs->total_sectors << BDRV_SECTOR_BITS;
 
     zone_size = bs->bl.zone_size;
@@ -3305,6 +3424,14 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
         return -EINVAL;
     }
 
+    qemu_co_mutex_lock(&wps->colock);
+    uint32_t index = offset / bs->bl.zone_size;
+    if (BDRV_ZT_IS_CONV(wps->wp[index]) && len != capacity) {
+        error_report("zone mgmt operations are not allowed for conventional zones");
+        ret = -EIO;
+        goto out;
+    }
+
     switch (op) {
     case BLK_ZO_OPEN:
         op_name = "BLKOPENZONE";
@@ -3324,7 +3451,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
         break;
     default:
         error_report("Unsupported zone op: 0x%x", op);
-        return -ENOTSUP;
+        ret = -ENOTSUP;
+        goto out;
     }
 
     acb = (RawPosixAIOData) {
@@ -3342,10 +3470,27 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
                         len >> BDRV_SECTOR_BITS);
     ret = raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
     if (ret != 0) {
+        update_zones_wp(s->fd, wps, offset, index);
         ret = -errno;
         error_report("ioctl %s failed %d", op_name, ret);
+        goto out;
     }
 
+    if (zo == BLKRESETZONE && len == capacity) {
+        for (int i = 0; i < bs->bl.nr_zones; ++i) {
+            if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
+                wps->wp[i] = i * bs->bl.zone_size;
+            }
+        }
+    } else if (zo == BLKRESETZONE) {
+        wps->wp[index] = offset;
+    } else if (zo == BLKFINISHZONE) {
+        /* The zoned device allows the last zone smaller that the zone size. */
+        wps->wp[index] = offset + len;
+    }
+
+out:
+    qemu_co_mutex_unlock(&wps->colock);
     return ret;
 }
 #endif
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 4025df380e..1abd0d5b65 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -92,6 +92,14 @@ typedef struct BlockZoneDescriptor {
     BlockZoneState state;
 } BlockZoneDescriptor;
 
+/*
+ * Track write pointers of a zone in bytes.
+ */
+typedef struct BlockZoneWps {
+    CoMutex colock;
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
index 2c057a9980..4effff3aa1 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -854,6 +854,9 @@ typedef struct BlockLimits {
 
     /* maximum number of active zones */
     int64_t max_active_zones;
+
+    /* array of write pointers' location of each zone in the zoned device. */
+    BlockZoneWps *wps;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
-- 
2.38.1


