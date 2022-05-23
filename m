Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DDE530C46
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:08:34 +0200 (CEST)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt43F-0005Dj-OF
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mw-000295-Qo
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:45 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mt-0000cG-8G
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:41 -0400
Received: by mail-pg1-x535.google.com with SMTP id a9so11074140pgv.12
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 01:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PaIOxkLwjZNkboc5VdvhVflkFE+nJVqmqztmLhz5Ecs=;
 b=HshTDXedG5dWkV22c5uGBHn/V7xI6VwDRoAtOcZQXtepgvVptDY8OWyzZhL7XQt97c
 r9njXiWZQeBvCH9NniPPe9ukStRc1ImpETjf1e+Jw/B79Sprvms7ktcslorQL6hinQ09
 Fa2n6iCv4a6cpbCV76142MMeAAH7zL6pW/h3N99os9lg1bwIrTghk9+UNFVPTRUt4OSC
 ET7sNAqHVL/wBbzmiZmIvcuXHXpowKsroF2VMDHiUNsMJD7LofQthEzPMy0LMt3Hp1zu
 1QsWZQa5FW1U7vrYz3IqV3enzM1wvsiYrE8dQANnt7mEkswXYS4rIv+kz1n2s9j1TOZo
 afAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PaIOxkLwjZNkboc5VdvhVflkFE+nJVqmqztmLhz5Ecs=;
 b=jYeo+OogaSCuYrZeDcfkTmgUxf8lughnkEnTB9hSEu9wPQbFe7O/+tPuSI+tx6L8Ti
 DjmavmUVU0LH+lujURaoBNFfFdyffzgEEtN490PHPVbGcNo4vQG07HElGOfy7PdifO8h
 KFJi1xcuOxNPqOQ2O1SJCxWh8VZPhLInyS4rtYhfapAT6jsl37MmI3CxpavhBDPeCMMB
 EmztMMliXHPmdyv6VyAfPXpsItmrYZGjQF5O+9W9K1n1VGZjU3009LLCS4lM22YPAbze
 usfLFhxztnX8GE2YPzIbqIvl+GeGPRmDSxL8h3VjWtbOxqQTkLcplfa96a1d4vRAXqLr
 dTPw==
X-Gm-Message-State: AOAM531jgW5/3i+ugjFNubFiXrthlX+Tm70REqQGGDkbqYA819VSHdJB
 fl0vP3kmkbS7a5iUdLiAa+ZE
X-Google-Smtp-Source: ABdhPJw3TFNoxCdPQysRD630etaISrhYgd0zCZGHhmrFuoiI4ArQPgqaw+RkMZTwY+YgXuxeZhj26Q==
X-Received: by 2002:a63:91c3:0:b0:3f9:caa5:fa56 with SMTP id
 l186-20020a6391c3000000b003f9caa5fa56mr11489816pge.418.1653295887075; 
 Mon, 23 May 2022 01:51:27 -0700 (PDT)
Received: from localhost ([139.177.225.248]) by smtp.gmail.com with ESMTPSA id
 ms16-20020a17090b235000b001d5943e826asm6854892pjb.20.2022.05.23.01.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:51:26 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 6/8] vduse-blk: Implement vduse-blk export
Date: Mon, 23 May 2022 16:46:09 +0800
Message-Id: <20220523084611.91-7-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523084611.91-1-xieyongji@bytedance.com>
References: <20220523084611.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=xieyongji@bytedance.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This implements a VDUSE block backends based on
the libvduse library. We can use it to export the BDSs
for both VM and container (host) usage.

The new command-line syntax is:

$ qemu-storage-daemon \
    --blockdev file,node-name=drive0,filename=test.img \
    --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on

After the qemu-storage-daemon started, we need to use
the "vdpa" command to attach the device to vDPA bus:

$ vdpa dev add name vduse-export0 mgmtdev vduse

Also the device must be removed via the "vdpa" command
before we stop the qemu-storage-daemon.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS                   |   4 +-
 block/export/export.c         |   6 +
 block/export/meson.build      |   5 +
 block/export/vduse-blk.c      | 307 ++++++++++++++++++++++++++++++++++
 block/export/vduse-blk.h      |  20 +++
 meson.build                   |  13 ++
 meson_options.txt             |   2 +
 qapi/block-export.json        |  28 +++-
 scripts/meson-buildoptions.sh |   4 +
 9 files changed, 385 insertions(+), 4 deletions(-)
 create mode 100644 block/export/vduse-blk.c
 create mode 100644 block/export/vduse-blk.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 966e07b7a0..d6fc0285a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3554,10 +3554,12 @@ L: qemu-block@nongnu.org
 S: Supported
 F: block/export/fuse.c
 
-VDUSE library
+VDUSE library and block device exports
 M: Xie Yongji <xieyongji@bytedance.com>
 S: Maintained
 F: subprojects/libvduse/
+F: block/export/vduse-blk.c
+F: block/export/vduse-blk.h
 
 Replication
 M: Wen Congyang <wencongyang2@huawei.com>
diff --git a/block/export/export.c b/block/export/export.c
index 7253af3bc3..4744862915 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -26,6 +26,9 @@
 #ifdef CONFIG_VHOST_USER_BLK_SERVER
 #include "vhost-user-blk-server.h"
 #endif
+#ifdef CONFIG_VDUSE_BLK_EXPORT
+#include "vduse-blk.h"
+#endif
 
 static const BlockExportDriver *blk_exp_drivers[] = {
     &blk_exp_nbd,
@@ -35,6 +38,9 @@ static const BlockExportDriver *blk_exp_drivers[] = {
 #ifdef CONFIG_FUSE
     &blk_exp_fuse,
 #endif
+#ifdef CONFIG_VDUSE_BLK_EXPORT
+    &blk_exp_vduse_blk,
+#endif
 };
 
 /* Only accessed from the main thread */
diff --git a/block/export/meson.build b/block/export/meson.build
index 431e47ca51..c60116f455 100644
--- a/block/export/meson.build
+++ b/block/export/meson.build
@@ -5,3 +5,8 @@ if have_vhost_user_blk_server
 endif
 
 blockdev_ss.add(when: fuse, if_true: files('fuse.c'))
+
+if have_vduse_blk_export
+    blockdev_ss.add(files('vduse-blk.c', 'virtio-blk-handler.c'))
+    blockdev_ss.add(libvduse)
+endif
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
new file mode 100644
index 0000000000..143d58a3f2
--- /dev/null
+++ b/block/export/vduse-blk.c
@@ -0,0 +1,307 @@
+/*
+ * Export QEMU block device via VDUSE
+ *
+ * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author:
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include <sys/eventfd.h>
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "block/export.h"
+#include "qemu/error-report.h"
+#include "util/block-helpers.h"
+#include "subprojects/libvduse/libvduse.h"
+#include "virtio-blk-handler.h"
+
+#include "standard-headers/linux/virtio_blk.h"
+
+#define VDUSE_DEFAULT_NUM_QUEUE 1
+#define VDUSE_DEFAULT_QUEUE_SIZE 256
+
+typedef struct VduseBlkExport {
+    BlockExport export;
+    VirtioBlkHandler handler;
+    VduseDev *dev;
+    uint16_t num_queues;
+} VduseBlkExport;
+
+typedef struct VduseBlkReq {
+    VduseVirtqElement elem;
+    VduseVirtq *vq;
+} VduseBlkReq;
+
+static void vduse_blk_req_complete(VduseBlkReq *req, size_t in_len)
+{
+    vduse_queue_push(req->vq, &req->elem, in_len);
+    vduse_queue_notify(req->vq);
+
+    free(req);
+}
+
+static void coroutine_fn vduse_blk_virtio_process_req(void *opaque)
+{
+    VduseBlkReq *req = opaque;
+    VduseVirtq *vq = req->vq;
+    VduseDev *dev = vduse_queue_get_dev(vq);
+    VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
+    VirtioBlkHandler *handler = &vblk_exp->handler;
+    VduseVirtqElement *elem = &req->elem;
+    struct iovec *in_iov = elem->in_sg;
+    struct iovec *out_iov = elem->out_sg;
+    unsigned in_num = elem->in_num;
+    unsigned out_num = elem->out_num;
+    int in_len;
+
+    in_len = virtio_blk_process_req(handler, in_iov,
+                                    out_iov, in_num, out_num);
+    if (in_len < 0) {
+        free(req);
+        return;
+    }
+
+    vduse_blk_req_complete(req, in_len);
+}
+
+static void vduse_blk_vq_handler(VduseDev *dev, VduseVirtq *vq)
+{
+    while (1) {
+        VduseBlkReq *req;
+
+        req = vduse_queue_pop(vq, sizeof(VduseBlkReq));
+        if (!req) {
+            break;
+        }
+        req->vq = vq;
+
+        Coroutine *co =
+            qemu_coroutine_create(vduse_blk_virtio_process_req, req);
+        qemu_coroutine_enter(co);
+    }
+}
+
+static void on_vduse_vq_kick(void *opaque)
+{
+    VduseVirtq *vq = opaque;
+    VduseDev *dev = vduse_queue_get_dev(vq);
+    int fd = vduse_queue_get_fd(vq);
+    eventfd_t kick_data;
+
+    if (eventfd_read(fd, &kick_data) == -1) {
+        error_report("failed to read data from eventfd");
+        return;
+    }
+
+    vduse_blk_vq_handler(dev, vq);
+}
+
+static void vduse_blk_enable_queue(VduseDev *dev, VduseVirtq *vq)
+{
+    VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
+
+    aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
+                       true, on_vduse_vq_kick, NULL, NULL, NULL, vq);
+}
+
+static void vduse_blk_disable_queue(VduseDev *dev, VduseVirtq *vq)
+{
+    VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
+
+    aio_set_fd_handler(vblk_exp->export.ctx, vduse_queue_get_fd(vq),
+                       true, NULL, NULL, NULL, NULL, NULL);
+}
+
+static const VduseOps vduse_blk_ops = {
+    .enable_queue = vduse_blk_enable_queue,
+    .disable_queue = vduse_blk_disable_queue,
+};
+
+static void on_vduse_dev_kick(void *opaque)
+{
+    VduseDev *dev = opaque;
+
+    vduse_dev_handler(dev);
+}
+
+static void vduse_blk_attach_ctx(VduseBlkExport *vblk_exp, AioContext *ctx)
+{
+    int i;
+
+    aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
+                       true, on_vduse_dev_kick, NULL, NULL, NULL,
+                       vblk_exp->dev);
+
+    for (i = 0; i < vblk_exp->num_queues; i++) {
+        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
+        int fd = vduse_queue_get_fd(vq);
+
+        if (fd < 0) {
+            continue;
+        }
+        aio_set_fd_handler(vblk_exp->export.ctx, fd, true,
+                           on_vduse_vq_kick, NULL, NULL, NULL, vq);
+    }
+}
+
+static void vduse_blk_detach_ctx(VduseBlkExport *vblk_exp)
+{
+    int i;
+
+    for (i = 0; i < vblk_exp->num_queues; i++) {
+        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
+        int fd = vduse_queue_get_fd(vq);
+
+        if (fd < 0) {
+            continue;
+        }
+        aio_set_fd_handler(vblk_exp->export.ctx, fd,
+                           true, NULL, NULL, NULL, NULL, NULL);
+    }
+    aio_set_fd_handler(vblk_exp->export.ctx, vduse_dev_get_fd(vblk_exp->dev),
+                       true, NULL, NULL, NULL, NULL, NULL);
+}
+
+
+static void blk_aio_attached(AioContext *ctx, void *opaque)
+{
+    VduseBlkExport *vblk_exp = opaque;
+
+    vblk_exp->export.ctx = ctx;
+    vduse_blk_attach_ctx(vblk_exp, ctx);
+}
+
+static void blk_aio_detach(void *opaque)
+{
+    VduseBlkExport *vblk_exp = opaque;
+
+    vduse_blk_detach_ctx(vblk_exp);
+    vblk_exp->export.ctx = NULL;
+}
+
+static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
+                                Error **errp)
+{
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+    BlockExportOptionsVduseBlk *vblk_opts = &opts->u.vduse_blk;
+    uint64_t logical_block_size = VIRTIO_BLK_SECTOR_SIZE;
+    uint16_t num_queues = VDUSE_DEFAULT_NUM_QUEUE;
+    uint16_t queue_size = VDUSE_DEFAULT_QUEUE_SIZE;
+    Error *local_err = NULL;
+    struct virtio_blk_config config = { 0 };
+    uint64_t features;
+    int i;
+
+    if (vblk_opts->has_num_queues) {
+        num_queues = vblk_opts->num_queues;
+        if (num_queues == 0) {
+            error_setg(errp, "num-queues must be greater than 0");
+            return -EINVAL;
+        }
+    }
+
+    if (vblk_opts->has_queue_size) {
+        queue_size = vblk_opts->queue_size;
+        if (queue_size <= 2 || !is_power_of_2(queue_size) ||
+            queue_size > VIRTQUEUE_MAX_SIZE) {
+            error_setg(errp, "queue-size is invalid");
+            return -EINVAL;
+        }
+    }
+
+    if (vblk_opts->has_logical_block_size) {
+        logical_block_size = vblk_opts->logical_block_size;
+        check_block_size(exp->id, "logical-block-size", logical_block_size,
+                         &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return -EINVAL;
+        }
+    }
+    vblk_exp->num_queues = num_queues;
+    vblk_exp->handler.blk = exp->blk;
+    vblk_exp->handler.serial = exp->id;
+    vblk_exp->handler.logical_block_size = logical_block_size;
+    vblk_exp->handler.writable = opts->writable;
+
+    config.capacity =
+            cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BITS);
+    config.seg_max = cpu_to_le32(queue_size - 2);
+    config.min_io_size = cpu_to_le16(1);
+    config.opt_io_size = cpu_to_le32(1);
+    config.num_queues = cpu_to_le16(num_queues);
+    config.blk_size = cpu_to_le32(logical_block_size);
+    config.max_discard_sectors = cpu_to_le32(VIRTIO_BLK_MAX_DISCARD_SECTORS);
+    config.max_discard_seg = cpu_to_le32(1);
+    config.discard_sector_alignment =
+        cpu_to_le32(logical_block_size >> VIRTIO_BLK_SECTOR_BITS);
+    config.max_write_zeroes_sectors =
+        cpu_to_le32(VIRTIO_BLK_MAX_WRITE_ZEROES_SECTORS);
+    config.max_write_zeroes_seg = cpu_to_le32(1);
+
+    features = vduse_get_virtio_features() |
+               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
+               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
+               (1ULL << VIRTIO_BLK_F_BLK_SIZE) |
+               (1ULL << VIRTIO_BLK_F_FLUSH) |
+               (1ULL << VIRTIO_BLK_F_DISCARD) |
+               (1ULL << VIRTIO_BLK_F_WRITE_ZEROES);
+
+    if (num_queues > 1) {
+        features |= 1ULL << VIRTIO_BLK_F_MQ;
+    }
+    if (!opts->writable) {
+        features |= 1ULL << VIRTIO_BLK_F_RO;
+    }
+
+    vblk_exp->dev = vduse_dev_create(exp->id, VIRTIO_ID_BLOCK, 0,
+                                     features, num_queues,
+                                     sizeof(struct virtio_blk_config),
+                                     (char *)&config, &vduse_blk_ops,
+                                     vblk_exp);
+    if (!vblk_exp->dev) {
+        error_setg(errp, "failed to create vduse device");
+        return -ENOMEM;
+    }
+
+    for (i = 0; i < num_queues; i++) {
+        vduse_dev_setup_queue(vblk_exp->dev, i, queue_size);
+    }
+
+    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev), true,
+                       on_vduse_dev_kick, NULL, NULL, NULL, vblk_exp->dev);
+
+    blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
+                                 vblk_exp);
+
+    return 0;
+}
+
+static void vduse_blk_exp_delete(BlockExport *exp)
+{
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+
+    blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
+                                    vblk_exp);
+    vduse_dev_destroy(vblk_exp->dev);
+}
+
+static void vduse_blk_exp_request_shutdown(BlockExport *exp)
+{
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+
+    vduse_blk_detach_ctx(vblk_exp);
+}
+
+const BlockExportDriver blk_exp_vduse_blk = {
+    .type               = BLOCK_EXPORT_TYPE_VDUSE_BLK,
+    .instance_size      = sizeof(VduseBlkExport),
+    .create             = vduse_blk_exp_create,
+    .delete             = vduse_blk_exp_delete,
+    .request_shutdown   = vduse_blk_exp_request_shutdown,
+};
diff --git a/block/export/vduse-blk.h b/block/export/vduse-blk.h
new file mode 100644
index 0000000000..c4eeb1b70e
--- /dev/null
+++ b/block/export/vduse-blk.h
@@ -0,0 +1,20 @@
+/*
+ * Export QEMU block device via VDUSE
+ *
+ * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author:
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef VDUSE_BLK_H
+#define VDUSE_BLK_H
+
+#include "block/export.h"
+
+extern const BlockExportDriver blk_exp_vduse_blk;
+
+#endif /* VDUSE_BLK_H */
diff --git a/meson.build b/meson.build
index 3f70ccec60..49176a3d24 100644
--- a/meson.build
+++ b/meson.build
@@ -1529,6 +1529,17 @@ if have_libvduse
   libvduse = libvduse_proj.get_variable('libvduse_dep')
 endif
 
+have_vduse_blk_export = (have_libvduse and targetos == 'linux')
+if get_option('vduse_blk_export').enabled()
+    if targetos != 'linux'
+        error('vduse_blk_export requires linux')
+    elif not have_libvduse
+        error('vduse_blk_export requires libvduse support')
+    endif
+elif get_option('vduse_blk_export').disabled()
+    have_vduse_blk_export = false
+endif
+
 # libbpf
 libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
 if libbpf.found() and not cc.links('''
@@ -1770,6 +1781,7 @@ config_host_data.set('CONFIG_VHOST_CRYPTO', have_vhost_user_crypto)
 config_host_data.set('CONFIG_VHOST_VDPA', have_vhost_vdpa)
 config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
+config_host_data.set('CONFIG_VDUSE_BLK_EXPORT', have_vduse_blk_export)
 config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3799,6 +3811,7 @@ if have_block
   summary_info += {'qed support':       get_option('qed').allowed()}
   summary_info += {'parallels support': get_option('parallels').allowed()}
   summary_info += {'FUSE exports':      fuse}
+  summary_info += {'VDUSE block exports': have_vduse_blk_export}
 endif
 summary(summary_info, bool_yn: true, section: 'Block layer support')
 
diff --git a/meson_options.txt b/meson_options.txt
index 50da8dea94..dee5671386 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -255,6 +255,8 @@ option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
 option('libvduse', type: 'feature', value: 'auto',
        description: 'build VDUSE Library')
+option('vduse_blk_export', type: 'feature', value: 'auto',
+       description: 'VDUSE block export support')
 
 option('capstone', type: 'feature', value: 'auto',
        description: 'Whether and how to find the capstone library')
diff --git a/qapi/block-export.json b/qapi/block-export.json
index 0685cb8b9a..e4bd4de363 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -177,6 +177,23 @@
             '*allow-other': 'FuseExportAllowOther' },
   'if': 'CONFIG_FUSE' }
 
+##
+# @BlockExportOptionsVduseBlk:
+#
+# A vduse-blk block export.
+#
+# @num-queues: the number of virtqueues. Defaults to 1.
+# @queue-size: the size of virtqueue. Defaults to 256.
+# @logical-block-size: Logical block size in bytes. Range [512, PAGE_SIZE]
+#                      and must be power of 2. Defaults to 512 bytes.
+#
+# Since: 7.1
+##
+{ 'struct': 'BlockExportOptionsVduseBlk',
+  'data': { '*num-queues': 'uint16',
+            '*queue-size': 'uint16',
+            '*logical-block-size': 'size'} }
+
 ##
 # @NbdServerAddOptions:
 #
@@ -280,6 +297,7 @@
 # @nbd: NBD export
 # @vhost-user-blk: vhost-user-blk export (since 5.2)
 # @fuse: FUSE export (since: 6.0)
+# @vduse-blk: vduse-blk export (since 7.1)
 #
 # Since: 4.2
 ##
@@ -287,7 +305,8 @@
   'data': [ 'nbd',
             { 'name': 'vhost-user-blk',
               'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
-            { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
+            { 'name': 'fuse', 'if': 'CONFIG_FUSE' },
+            { 'name': 'vduse-blk', 'if': 'CONFIG_VDUSE_BLK_EXPORT' } ] }
 
 ##
 # @BlockExportOptions:
@@ -295,7 +314,8 @@
 # Describes a block export, i.e. how single node should be exported on an
 # external interface.
 #
-# @id: A unique identifier for the block export (across all export types)
+# @id: A unique identifier for the block export (across the host for vduse-blk
+#      export type or across all export types for other types)
 #
 # @node-name: The node name of the block node to be exported (since: 5.2)
 #
@@ -331,7 +351,9 @@
       'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
                           'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
       'fuse': { 'type': 'BlockExportOptionsFuse',
-                'if': 'CONFIG_FUSE' }
+                'if': 'CONFIG_FUSE' },
+      'vduse-blk': { 'type': 'BlockExportOptionsVduseBlk',
+                     'if': 'CONFIG_VDUSE_BLK_EXPORT' }
    } }
 
 ##
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 957a46ec89..21b7f4f620 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -160,6 +160,8 @@ meson_options_help() {
   printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
+  printf "%s\n" '  vduse-blk-export'
+  printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
@@ -425,6 +427,8 @@ _meson_option_parse() {
     --disable-vhost-user) printf "%s" -Dvhost_user=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
+    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
+    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vhost-vdpa) printf "%s" -Dvhost_vdpa=enabled ;;
     --disable-vhost-vdpa) printf "%s" -Dvhost_vdpa=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
-- 
2.20.1


