Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA96DA9F5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 10:19:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkhI7-0002WZ-UM; Fri, 07 Apr 2023 04:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhI5-0002Vj-J2; Fri, 07 Apr 2023 04:17:49 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhI2-0006sc-UJ; Fri, 07 Apr 2023 04:17:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so42809727pjb.0; 
 Fri, 07 Apr 2023 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680855465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HV2Eqwi+R7TAdcp5Rm1QcxWWXOO181BtetYciBwD1X4=;
 b=jATH0w0M1qLutqanhVN7vYNEQPJVfWxt4TZkP/Xe+dyG9DmXrfyfO7O493cSLMW0yN
 NzAnhYUsgYm3aKxWTBXsssBacxX7r842N5rt8l4UG7hk0PtRvAf7PVa/WNgNDxxQm/OH
 5c+ocNAqzCjNzaLwNM2sPqpTe0siTWdV1Qt0LH+30YwKM4sLqXhaL1iDIYEGQo6gCV2i
 9KZBMaUynjRMDd1bpJoGR9pCSnZBjp8pHClGjzmd++2wykKHS5CcgGD8pmIUjDYwI5x+
 dJlzgd6QpTwOIgehXuzveSEj8+/8jAyO9jkF2FiPIMvRre2quHe7+ZPtfygzFSkcpd2o
 Oe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680855465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HV2Eqwi+R7TAdcp5Rm1QcxWWXOO181BtetYciBwD1X4=;
 b=XOX6BZmMU88z8QX6BYFadwVw62HE/pivfBSmfGxxEJ2FACKA+V0rQ+gh05hrNdFQRk
 c4qFmUoKPwWZNkOCyEN0G1G5ynQccWJk9TqcKM2ivOD7qVPqKG0uf4rqE1py+W8YB4zr
 xzBmRa9Nu5LT/cOsSd89RzgfNCu4FWbiHciG82DldlzJ41EdXpSwDSNCvDyKSVmCEVnj
 Fl7iWQblX4ZHWbz/57JGCCpKgrV/fsd8IeCewCuFmmlh/6/D6VOe3Q+bJ0JT2LxWfRX9
 p49rvIGu4t1fIl+J1lsiHErzeDNb9PES20QuryIXKAV0GdU3OmmR6ENlTqJCDXMnHOSo
 u/Rw==
X-Gm-Message-State: AAQBX9eE2ji4e3c4HzBD4mhMsYcpOx+b1xc9PUmvZ5xnxGFQAzR49z5c
 WQ72+QnQOS5KPx1kZFwVa7cTg/0RbFc9ls9G
X-Google-Smtp-Source: AKy350apESgSUZ88wi8Jz/vTBdVXQsN5fKSBNLXVAsIbE2J+Rz1uVMUaV5WUhmfiit2Y/8t4Jv6wqQ==
X-Received: by 2002:a17:903:1250:b0:1a5:a1b:bbd8 with SMTP id
 u16-20020a170903125000b001a50a1bbbd8mr1770196plh.45.1680855464542; 
 Fri, 07 Apr 2023 01:17:44 -0700 (PDT)
Received: from fedlinux.. ([106.84.131.166]) by smtp.gmail.com with ESMTPSA id
 jh19-20020a170903329300b00199193e5ea1sm2484890plb.61.2023.04.07.01.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 01:17:43 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 1/4] file-posix: add tracking of the zone write pointers
Date: Fri,  7 Apr 2023 16:16:54 +0800
Message-Id: <20230407081657.17947-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407081657.17947-1-faithilikerun@gmail.com>
References: <20230407081657.17947-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
 block/file-posix.c               | 173 ++++++++++++++++++++++++++++++-
 include/block/block-common.h     |  14 +++
 include/block/block_int-common.h |   5 +
 3 files changed, 189 insertions(+), 3 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 65efe5147e..e7957f5559 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1324,6 +1324,90 @@ static int hdev_get_max_segments(int fd, struct stat *st)
 #endif
 }
 
+#if defined(CONFIG_BLKZONED)
+/*
+ * If the reset_all flag is true, then the wps of zone whose state is
+ * not readonly or offline should be all reset to the start sector.
+ * Else, take the real wp of the device.
+ */
+static int get_zones_wp(BlockDriverState *bs, int fd, int64_t offset,
+                        unsigned int nrz, bool reset_all)
+{
+    struct blk_zone *blkz;
+    size_t rep_size;
+    uint64_t sector = offset >> BDRV_SECTOR_BITS;
+    BlockZoneWps *wps = bs->wps;
+    int j = offset / bs->bl.zone_size;
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
+        for (i = 0; i < rep->nr_zones; ++i, ++n, ++j) {
+            /*
+             * The wp tracking cares only about sequential writes required and
+             * sequential write preferred zones so that the wp can advance to
+             * the right location.
+             * Use the most significant bit of the wp location to indicate the
+             * zone type: 0 for SWR/SWP zones and 1 for conventional zones.
+             */
+            if (blkz[i].type == BLK_ZONE_TYPE_CONVENTIONAL) {
+                wps->wp[j] |= 1ULL << 63;
+            } else {
+                switch(blkz[i].cond) {
+                case BLK_ZONE_COND_FULL:
+                case BLK_ZONE_COND_READONLY:
+                    /* Zone not writable */
+                    wps->wp[j] = (blkz[i].start + blkz[i].len) << BDRV_SECTOR_BITS;
+                    break;
+                case BLK_ZONE_COND_OFFLINE:
+                    /* Zone not writable nor readable */
+                    wps->wp[j] = (blkz[i].start) << BDRV_SECTOR_BITS;
+                    break;
+                default:
+                    if (reset_all) {
+                        wps->wp[j] = blkz[i].start << BDRV_SECTOR_BITS;
+                    } else {
+                        wps->wp[j] = blkz[i].wp << BDRV_SECTOR_BITS;
+                    }
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
+static void update_zones_wp(BlockDriverState *bs, int fd, int64_t offset,
+                            unsigned int nrz)
+{
+    if (get_zones_wp(bs, fd, offset, nrz, 0) < 0) {
+        error_report("update zone wp failed");
+    }
+}
+#endif
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -1413,6 +1497,23 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
         if (ret >= 0) {
             bs->bl.max_active_zones = ret;
         }
+
+        ret = get_sysfs_long_val(&st, "physical_block_size");
+        if (ret >= 0) {
+            bs->bl.write_granularity = ret;
+        }
+
+        /* The refresh_limits() function can be called multiple times. */
+        g_free(bs->wps);
+        bs->wps = g_malloc(sizeof(BlockZoneWps) +
+                sizeof(int64_t) * bs->bl.nr_zones);
+        ret = get_zones_wp(bs, s->fd, 0, bs->bl.nr_zones, 0);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "report wps failed");
+            bs->wps = NULL;
+            return;
+        }
+        qemu_co_mutex_init(&bs->wps->colock);
         return;
     }
 out:
@@ -2338,9 +2439,15 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
+    int ret;
 
     if (fd_open(bs) < 0)
         return -EIO;
+#if defined(CONFIG_BLKZONED)
+    if (type & QEMU_AIO_WRITE && bs->wps) {
+        qemu_co_mutex_lock(&bs->wps->colock);
+    }
+#endif
 
     /*
      * When using O_DIRECT, the request must be aligned to be able to use
@@ -2354,14 +2461,16 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
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
 
@@ -2378,7 +2487,32 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     };
 
     assert(qiov->size == bytes);
-    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
+    ret = raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
+
+out:
+#if defined(CONFIG_BLKZONED)
+    BlockZoneWps *wps = bs->wps;
+    if (ret == 0) {
+        if (type & QEMU_AIO_WRITE && wps && bs->bl.zone_size) {
+            uint64_t *wp = &wps->wp[offset / bs->bl.zone_size];
+            if (!BDRV_ZT_IS_CONV(*wp)) {
+                /* Advance the wp if needed */
+                if (offset + bytes > *wp) {
+                    *wp = offset + bytes;
+                }
+            }
+        }
+    } else {
+        if (type & QEMU_AIO_WRITE) {
+            update_zones_wp(bs, s->fd, 0, 1);
+        }
+    }
+
+    if (type & QEMU_AIO_WRITE && wps) {
+        qemu_co_mutex_unlock(&wps->colock);
+    }
+#endif
+    return ret;
 }
 
 static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
@@ -2486,6 +2620,9 @@ static void raw_close(BlockDriverState *bs)
     BDRVRawState *s = bs->opaque;
 
     if (s->fd >= 0) {
+#if defined(CONFIG_BLKZONED)
+        g_free(bs->wps);
+#endif
         qemu_close(s->fd);
         s->fd = -1;
     }
@@ -3283,6 +3420,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     const char *op_name;
     unsigned long zo;
     int ret;
+    BlockZoneWps *wps = bs->wps;
     int64_t capacity = bs->total_sectors << BDRV_SECTOR_BITS;
 
     zone_size = bs->bl.zone_size;
@@ -3300,6 +3438,15 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
         return -EINVAL;
     }
 
+    QEMU_LOCK_GUARD(&wps->colock);
+    uint32_t i = offset / bs->bl.zone_size;
+    uint32_t nrz = len / bs->bl.zone_size;
+    uint64_t *wp = &wps->wp[i];
+    if (BDRV_ZT_IS_CONV(*wp) && len != capacity) {
+        error_report("zone mgmt operations are not allowed for conventional zones");
+        return -EIO;
+    }
+
     switch (op) {
     case BLK_ZO_OPEN:
         op_name = "BLKOPENZONE";
@@ -3337,8 +3484,28 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
                         len >> BDRV_SECTOR_BITS);
     ret = raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
     if (ret != 0) {
+        update_zones_wp(bs, s->fd, offset, i);
         ret = -errno;
         error_report("ioctl %s failed %d", op_name, ret);
+        return ret;
+    }
+
+    if (zo == BLKRESETZONE && len == capacity) {
+        ret = get_zones_wp(bs, s->fd, 0, bs->bl.nr_zones, 1);
+        if (ret < 0) {
+            error_report("reporting single wp failed");
+            return ret;
+        }
+    } else if (zo == BLKRESETZONE) {
+        for (int j = 0; j < nrz; ++j) {
+            wp[j] = offset + j * zone_size;
+        }
+    } else if (zo == BLKFINISHZONE) {
+        for (int j = 0; j < nrz; ++j) {
+            /* The zoned device allows the last zone smaller that the
+             * zone size. */
+            wp[j] = MIN(offset + (j + 1) * zone_size, offset + len);
+        }
     }
 
     return ret;
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 1576fcf2ed..93196229ac 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -118,6 +118,14 @@ typedef struct BlockZoneDescriptor {
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
@@ -240,6 +248,12 @@ typedef enum {
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
index 1bd2aef4d5..b34a7f175d 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -884,6 +884,8 @@ typedef struct BlockLimits {
 
     /* maximum number of active zones */
     int64_t max_active_zones;
+
+    int64_t write_granularity;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
@@ -1245,6 +1247,9 @@ struct BlockDriverState {
     CoMutex bsc_modify_lock;
     /* Always non-NULL, but must only be dereferenced under an RCU read guard */
     BdrvBlockStatusCache *block_status_cache;
+
+    /* array of write pointers' location of each zone in the zoned device. */
+    BlockZoneWps *wps;
 };
 
 struct BlockBackendRootState {
-- 
2.39.2


