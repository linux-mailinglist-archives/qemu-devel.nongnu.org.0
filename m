Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15173341C0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:42:25 +0100 (CET)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0ye-00038Y-Hn
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK0vq-0001aS-Sq; Wed, 10 Mar 2021 10:39:30 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lK0vn-0000vH-JO; Wed, 10 Mar 2021 10:39:30 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 lr10-20020a17090b4b8ab02900dd61b95c5eso5178908pjb.4; 
 Wed, 10 Mar 2021 07:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wg+mhNkNB4lUrMjlZW3lEf2FPRUUmtAYl68S49LJAb0=;
 b=ht/nlzaiFBGh893w5PzQGpUSxpxJu3NT3QKxYOHpmdDkOi+MMIrHt17SZNHbP5nDTA
 yFZfEPFykAUDQEMAqeUyUSU+H+lSVR8zp63y8Im50izXTH637A+YYWzmkSAdVLZxWDDI
 LkBiIXRVKkI40TVL00VVNV3DCAZkvP97vy7Dx9BnwykeLxpN0HzYoLfcpcAMMW5s/Dcs
 6ChWF6iALvxs0H3MeEp6hy9irOrdCGe+cgE4oIpjRDAFMDDnmGqzxax9h611ECfphzV6
 q1UnD5V51prrJNscvhcwvQgckjPoNi4EQ9K21TkSa7yfXA6kf7c7crZLF5TNA0K5rIAa
 iP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wg+mhNkNB4lUrMjlZW3lEf2FPRUUmtAYl68S49LJAb0=;
 b=caRO8Dcr8gZsF8K8go09t+0S+lFOUmYDeDIv8GCg3g1CEKn5MbWBcCPLGqMJgbSM2l
 APe+qBxm5cF/MvRb0FFbxxM3Ew+0yOYaQLGJbwV9tR7JQRML3FtpypSQZIzfjhJLneK8
 06Orf9qAKrZAJKwUkLkqgdiymIN7AIqi9NmvVIXtsHuQJrj0YX05UJho8G0yiaJjDxR/
 8/wdAR4/CwTxTCyiK3Iecyj/pJZp6E8siXWt2Few+zUnrH1XbhxYtbcUcsCXrqqb0nv3
 fCbwjbNHQAhrmjykg6e7JK7eSQ2KPwahN0xiINdxDmtvu2ieTnznh17/dFlx7eb4MoTo
 FEnw==
X-Gm-Message-State: AOAM530amNWKCaaBfdlTyg3vrN4yTIzTt2GGrB/IuyQQnYPd0Csc6aLr
 +LmcXPxEKywNyCUOkRAI/PRyFgfVYvcexQ==
X-Google-Smtp-Source: ABdhPJz63CMQ/B9ofsGVWSWCvZIZHD6yp6qKCWqzii7BaEGlfC6BEin9+WDiXYLOGs8pYiViW1BJew==
X-Received: by 2002:a17:90a:d3d1:: with SMTP id
 d17mr4066243pjw.21.1615390765461; 
 Wed, 10 Mar 2021 07:39:25 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:681d:e6e5:d1b0:3153])
 by smtp.gmail.com with ESMTPSA id s12sm16324388pgj.70.2021.03.10.07.39.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 07:39:24 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 1/2] block/file-posix: Optimize for macOS
Date: Thu, 11 Mar 2021 00:39:15 +0900
Message-Id: <20210310153916.64256-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Konstantin Nazarov <mail@knazarov.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit introduces "punch hole" operation and optimizes transfer
block size for macOS.

This commit introduces two additional members,
discard_granularity and opt_io to BlockSizes type in
include/block/block.h. Also, the members of the type are now
optional. Set -1 to discard_granularity and 0 to other members
for the default values.

Thanks to Konstantin Nazarov for detailed analysis of a flaw in an
old version of this change:
https://gist.github.com/akihikodaki/87df4149e7ca87f18dc56807ec5a1bc5#gistcomment-3654667

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 block/file-posix.c    | 40 ++++++++++++++++++++++++++++++++++++++--
 block/nvme.c          |  2 ++
 block/raw-format.c    |  4 +++-
 hw/block/block.c      | 12 ++++++++++--
 include/block/block.h |  2 ++
 5 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 05079b40cae..21bdaf969c5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -44,6 +44,7 @@
 #if defined(__APPLE__) && (__MACH__)
 #include <paths.h>
 #include <sys/param.h>
+#include <sys/mount.h>
 #include <IOKit/IOKitLib.h>
 #include <IOKit/IOBSD.h>
 #include <IOKit/storage/IOMediaBSDClient.h>
@@ -1292,6 +1293,8 @@ static int hdev_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
     if (check_for_dasd(s->fd) < 0) {
         return -ENOTSUP;
     }
+    bsz->opt_io = 0;
+    bsz->discard_granularity = -1;
     ret = probe_logical_blocksize(s->fd, &bsz->log);
     if (ret < 0) {
         return ret;
@@ -1586,6 +1589,7 @@ out:
     }
 }
 
+G_GNUC_UNUSED
 static int translate_err(int err)
 {
     if (err == -ENODEV || err == -ENOSYS || err == -EOPNOTSUPP ||
@@ -1795,16 +1799,27 @@ static int handle_aiocb_discard(void *opaque)
             }
         } while (errno == EINTR);
 
-        ret = -errno;
+        ret = translate_err(-errno);
 #endif
     } else {
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
         ret = do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
                            aiocb->aio_offset, aiocb->aio_nbytes);
+        ret = translate_err(-errno);
+#elif defined(__APPLE__) && (__MACH__)
+        fpunchhole_t fpunchhole;
+        fpunchhole.fp_flags = 0;
+        fpunchhole.reserved = 0;
+        fpunchhole.fp_offset = aiocb->aio_offset;
+        fpunchhole.fp_length = aiocb->aio_nbytes;
+        if (fcntl(s->fd, F_PUNCHHOLE, &fpunchhole) == -1) {
+            ret = errno == ENODEV ? -ENOTSUP : -errno;
+        } else {
+            ret = 0;
+        }
 #endif
     }
 
-    ret = translate_err(ret);
     if (ret == -ENOTSUP) {
         s->has_discard = false;
     }
@@ -2113,6 +2128,26 @@ static int raw_co_flush_to_disk(BlockDriverState *bs)
     return raw_thread_pool_submit(bs, handle_aiocb_flush, &acb);
 }
 
+static int raw_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
+{
+#if defined(__APPLE__) && (__MACH__)
+    BDRVRawState *s = bs->opaque;
+    struct statfs buf;
+
+    if (!fstatfs(s->fd, &buf)) {
+        bsz->phys = 0;
+        bsz->log = 0;
+        bsz->opt_io = buf.f_iosize;
+        bsz->discard_granularity = buf.f_bsize;
+        return 0;
+    }
+
+    return -errno;
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static void raw_aio_attach_aio_context(BlockDriverState *bs,
                                        AioContext *new_context)
 {
@@ -3247,6 +3282,7 @@ BlockDriver bdrv_file = {
     .bdrv_refresh_limits = raw_refresh_limits,
     .bdrv_io_plug = raw_aio_plug,
     .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_probe_blocksizes = raw_probe_blocksizes,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate = raw_co_truncate,
diff --git a/block/nvme.c b/block/nvme.c
index 2b5421e7aa6..1845d07577b 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -989,6 +989,8 @@ static int nvme_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
     uint32_t blocksize = nvme_get_blocksize(bs);
     bsz->phys = blocksize;
     bsz->log = blocksize;
+    bsz->opt_io = 0;
+    bsz->discard_granularity = -1;
     return 0;
 }
 
diff --git a/block/raw-format.c b/block/raw-format.c
index 7717578ed6a..847df11f2ae 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -507,6 +507,7 @@ static int raw_probe(const uint8_t *buf, int buf_size, const char *filename)
 static int raw_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
 {
     BDRVRawState *s = bs->opaque;
+    uint32_t size;
     int ret;
 
     ret = bdrv_probe_blocksizes(bs->file->bs, bsz);
@@ -514,7 +515,8 @@ static int raw_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
         return ret;
     }
 
-    if (!QEMU_IS_ALIGNED(s->offset, MAX(bsz->log, bsz->phys))) {
+    size = MAX(bsz->log, bsz->phys);
+    if (size && !QEMU_IS_ALIGNED(s->offset, size)) {
         return -ENOTSUP;
     }
 
diff --git a/hw/block/block.c b/hw/block/block.c
index 1e34573da71..c907e5a7722 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -70,19 +70,27 @@ bool blkconf_blocksizes(BlockConf *conf, Error **errp)
     backend_ret = blk_probe_blocksizes(blk, &blocksizes);
     /* fill in detected values if they are not defined via qemu command line */
     if (!conf->physical_block_size) {
-        if (!backend_ret) {
+        if (!backend_ret && blocksizes.phys) {
            conf->physical_block_size = blocksizes.phys;
         } else {
             conf->physical_block_size = BDRV_SECTOR_SIZE;
         }
     }
     if (!conf->logical_block_size) {
-        if (!backend_ret) {
+        if (!backend_ret && blocksizes.log) {
             conf->logical_block_size = blocksizes.log;
         } else {
             conf->logical_block_size = BDRV_SECTOR_SIZE;
         }
     }
+    if (!backend_ret) {
+        if (!conf->opt_io_size) {
+            conf->opt_io_size = blocksizes.opt_io;
+        }
+        if (conf->discard_granularity == -1) {
+            conf->discard_granularity = blocksizes.discard_granularity;
+        }
+    }
 
     if (conf->logical_block_size > conf->physical_block_size) {
         error_setg(errp,
diff --git a/include/block/block.h b/include/block/block.h
index b3f6e509d49..d12471a6cc4 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -93,6 +93,8 @@ typedef enum {
 typedef struct BlockSizes {
     uint32_t phys;
     uint32_t log;
+    uint32_t discard_granularity;
+    uint32_t opt_io;
 } BlockSizes;
 
 typedef struct HDGeometry {
-- 
2.24.3 (Apple Git-128)


