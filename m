Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A891132E7C4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:19:28 +0100 (CET)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI9QV-0000rA-Of
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lI9P6-0000Bk-DU; Fri, 05 Mar 2021 07:18:00 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:38692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lI9P4-0004Jf-Br; Fri, 05 Mar 2021 07:18:00 -0500
Received: by mail-pl1-x635.google.com with SMTP id s7so1333452plg.5;
 Fri, 05 Mar 2021 04:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wg+mhNkNB4lUrMjlZW3lEf2FPRUUmtAYl68S49LJAb0=;
 b=fbMeq6BdHQWssd0sYWp7JnuREDaFsRlmil1dWIYcsxq4rU4oo1w5NjB7nRKl1aQilA
 PZiC5lmw3EukI6iawaHvD5hK4N9juDWmiWu750euE6WiPBfYY+BRLliPT1q8yRmJsEyH
 qN89p6vD1Qk5f0Qbdu/0xESSZYImFTWhvyaGedKySap98lZ2cpCipYiGERzbW1EFIXLH
 nmUBC2mIUD+BO0xjxKeAAOODoeLLsYDburVgMQsawSn+hgWcZzgyaNITjrR7eHx7qWMo
 TOSQ7a7cC0IpzPi5qjr3cO8+EKnCNMjeF7evJalfYNfepy1QWNXAxBrwVPo6Qij1c7BN
 UauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wg+mhNkNB4lUrMjlZW3lEf2FPRUUmtAYl68S49LJAb0=;
 b=dQoqMnTo131TpxboAyE1aF36ZaZ3f1nvmmrumN3YtgAXQ76cDR5rcKuDmJ+/tV6934
 m07hHhf18K8fEaUvMVXYEeSjgXzFNTrzZzuQr4GxRZZekXl8hg/ma0IHk9Do0yiZ9Lb/
 B8tFzW0gtzgZHXhGKMvvDKLeQIN/KGENNBClbGITKepVYP1Rw38j3AqkiB5PYp9EyrJM
 eVblpkM2XNknIh/Ean2fzonGsXzjVxP+qZ++WM5iQm9KkxU/5VthmJsPwcqPpOQ8usuc
 X0eKbAxxlng9Id0J+F/1ogn1RFMtMCchae9HeXJjLUJ4MI18SpbSM9Wy6bSFC3OQE2i1
 20ZA==
X-Gm-Message-State: AOAM533cO74iwbi/0dPSgN/eapxVlPA2IlplxTJ+ek2kNr0VC2CC/mc2
 IFU9wEfjZ4w7xt9nlLWaG/YU5fW4xDFTzA==
X-Google-Smtp-Source: ABdhPJyNPTPP2cQdtnVqwE0nw01F/zu9oFWVKri/QlAZz+aOJjL5M5RtSOW/vJylrxmHxqKlXW4b6g==
X-Received: by 2002:a17:90a:1a59:: with SMTP id
 25mr10188789pjl.54.1614946676192; 
 Fri, 05 Mar 2021 04:17:56 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:6076:fea8:b0ba:4fdb])
 by smtp.gmail.com with ESMTPSA id j26sm2426697pfa.35.2021.03.05.04.17.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 04:17:55 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] block/file-posix: Optimize for macOS
Date: Fri,  5 Mar 2021 21:17:48 +0900
Message-Id: <20210305121748.65173-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x635.google.com
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


