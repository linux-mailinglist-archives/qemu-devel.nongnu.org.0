Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B7831F614
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:53:11 +0100 (CET)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1XC-0006El-NG
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD1W4-0005o3-KO; Fri, 19 Feb 2021 03:52:00 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD1W2-0000hE-Ph; Fri, 19 Feb 2021 03:52:00 -0500
Received: by mail-pg1-x531.google.com with SMTP id o7so3430908pgl.1;
 Fri, 19 Feb 2021 00:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qISdsR2agt2ckOs+qECckzqtZsO13ZrncQ+6FovCW7U=;
 b=GHDU1d+sIPom6oeuOFp3jQPVjtErfefygq4KXCFrL5glgDTRbtgWZ7Xfvwi3ffnFek
 9BYrkHgfWYulLo14FJDB4WDG5AO+/5cg5BHmCPAwW6B/wT4o/6YexYnmMsz+pjZqqbdp
 3G9vbA7WYYP7DMpG+3oZ9E+o3oajWKTKrejjZ+AlxF9HbgkAOLdqIlqcS4tKMchhhGAZ
 FGtrsl3OLsYWAU1VEhA8VtCyQBNwji0Tij/PBCuJXnJH/PVDF2ZZFz7bfzkTey55tKCA
 nb+tNkUj0c683SE0NlNdc4azJFsiNgLyTzfTFdF//faNvD/FJYv2F4/sSe3Uo3o1zich
 lp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qISdsR2agt2ckOs+qECckzqtZsO13ZrncQ+6FovCW7U=;
 b=DjcE0NVyPgzpBSSa97AvHqQ11Se2hxdmy6DgpLrdux7JWmWb0z6G1G3AJeQBfAXLZC
 I6Wn9CeeoPXNomuzzfeTvtd+LsaNBdoAT/4Oll2/bXAoSOTwv5qumAiuED4UofGzl+AD
 89iA2e9lVUHf6gbqJXZWdZONpcIyEC90rF8en0ifM36pFXnQ9p2+nwVg75qX6W+VUQiK
 Yrg0hseeiPoKq0PuxQwGOAauZmbbP+CGkBdCgAzbdxXVHJq/TZG6+i62B79rCiOKxihA
 r3V62+K7ZkNatAuUTamJVCvIFn3uKiMhxjMa3X1r0bx9VFmDQirTYqm+XfanRSpVqNty
 /KcQ==
X-Gm-Message-State: AOAM530wK+zbPwAVErxA38n0SA7Btxq3g+fi8bx1TNnHP0pp6Bo0Qmje
 ujx4Qa/8sXOM5E/6aSsI+HF2wB3RCTCIQg==
X-Google-Smtp-Source: ABdhPJw87RZbHrvLMsDeo9mUcfzPD1RaSdXdWtPubQ9OWZKjJr29GP32ynh5Y9JleUrbvt3F8EfkuA==
X-Received: by 2002:a62:8096:0:b029:1ec:e33e:f8e6 with SMTP id
 j144-20020a6280960000b02901ece33ef8e6mr8359136pfd.47.1613724716683; 
 Fri, 19 Feb 2021 00:51:56 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id nl12sm11672656pjb.2.2021.02.19.00.51.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 00:51:56 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] block/file-posix: Optimize for macOS
Date: Fri, 19 Feb 2021 17:51:48 +0900
Message-Id: <20210219085148.90545-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x531.google.com
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
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit introduces "punch hole" operation and optimizes transfer
block size for macOS.

This commit introduces two additional members,
discard_granularity and opt_io to BlockSizes type in
include/block/block.h. Also, the members of the type are now
optional. Set -1 to discard_granularity and 0 to other members
for the default values.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 block/file-posix.c    | 40 ++++++++++++++++++++++++++++++++++++++--
 block/nvme.c          |  2 ++
 hw/block/block.c      | 12 ++++++++++--
 include/block/block.h |  2 ++
 4 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 00cdaaa2d41..defbc04c8e7 100644
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
@@ -1274,6 +1275,8 @@ static int hdev_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
     if (check_for_dasd(s->fd) < 0) {
         return -ENOTSUP;
     }
+    bsz->opt_io = 0;
+    bsz->discard_granularity = -1;
     ret = probe_logical_blocksize(s->fd, &bsz->log);
     if (ret < 0) {
         return ret;
@@ -1568,6 +1571,7 @@ out:
     }
 }
 
+G_GNUC_UNUSED
 static int translate_err(int err)
 {
     if (err == -ENODEV || err == -ENOSYS || err == -EOPNOTSUPP ||
@@ -1777,16 +1781,27 @@ static int handle_aiocb_discard(void *opaque)
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
@@ -2095,6 +2110,26 @@ static int raw_co_flush_to_disk(BlockDriverState *bs)
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
@@ -3229,6 +3264,7 @@ BlockDriver bdrv_file = {
     .bdrv_refresh_limits = raw_refresh_limits,
     .bdrv_io_plug = raw_aio_plug,
     .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_probe_blocksizes = raw_probe_blocksizes,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate = raw_co_truncate,
diff --git a/block/nvme.c b/block/nvme.c
index 5a6fbacf4a5..6d84bbdb632 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -983,6 +983,8 @@ static int nvme_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
     uint32_t blocksize = nvme_get_blocksize(bs);
     bsz->phys = blocksize;
     bsz->log = blocksize;
+    bsz->opt_io = 0;
+    bsz->discard_granularity = -1;
     return 0;
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
index a193545b6ab..31bf3acacad 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -91,6 +91,8 @@ typedef enum {
 typedef struct BlockSizes {
     uint32_t phys;
     uint32_t log;
+    uint32_t discard_granularity;
+    uint32_t opt_io;
 } BlockSizes;
 
 typedef struct HDGeometry {
-- 
2.24.3 (Apple Git-128)


