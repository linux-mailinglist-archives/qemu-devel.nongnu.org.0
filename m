Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B349B61F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:25:18 +0100 (CET)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMl3-0005TP-BO
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:25:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLie-0007SX-8q
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:44 -0500
Received: from [2607:f8b0:4864:20::1035] (port=51096
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLia-0004yD-0r
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:42 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o11so2752208pjf.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BmtGQA5DpO0+f6kPv+xipJRYB/H3tEHgZCOeDu1ZZok=;
 b=pAC5zWnwDMXv+wLQiLiuO5vR71AaVjhhtIEQZUCm85mQEV//V414U7MMnxHaNlnDS7
 9elObsqjtBy3zZobkzwXv8Oi4MwI2uMei6TzjZ3nPyx0oQDK9NIv4beo/bv/Py2BrUQu
 /08pDNDb/AC8nEsXqGivGgqACiYricNAN39CejFlPQtBXeGJ3hITyqY00JAMtNRqOxzn
 NNDxoujhE2HWHXueJQqOjfIpKMjoB97EteWEQ+K4XhxuMzc20uYXklNb3vDM4yBQ1YdN
 Vynp3egLY4HF0sJN+vBVDcj1bCIzen77Qldp5pfEW2FoltNli1jSMTahPeLPR+a6so5Q
 LDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BmtGQA5DpO0+f6kPv+xipJRYB/H3tEHgZCOeDu1ZZok=;
 b=SNE8JF6uqZVIh6fYsyXujd8A7Q8YGnEtOVyGZuoFXqo7Q3yPHMt1zvGKib0k8huBm/
 9W4rI+foIIBS/GWr+LMshlhKjNSBpHEL0YNq5TFQDQ6mpPbjaPmptSURdqQOtMBe9KUg
 xBPSvmFdPsiDCglVffOd1nUzXPYTALMLj+GSBfoXrZdbA5IL9zGSDDBqP2EFryF8OVPr
 YIA2vh5ehqqlfBTkrpPEMZ83cxHJsTMA/0yRz8JgtgADePrfUxrVVSoz3kZ3IRjGPkvO
 8s6Bf7kVWzrxwL55r//kJBQQOO2+5UBiAQCbnogq9/dcYfGFO19vGdSKh08jnJoId5A4
 lPKQ==
X-Gm-Message-State: AOAM5308AUEA//t+9wu7iY5MXsemjUnTqL+Ef3aATrMn1Z2b+q6QuDkh
 ujMeUCmOWPKcD/mgvNzEqABV
X-Google-Smtp-Source: ABdhPJxTvzKUVhGH4oidubWWySWvI4f0jtLAuesidDCBIdDigN7cRkmpkbgTeTcJbifvxi1kCvF/jA==
X-Received: by 2002:a17:902:720b:b0:14b:81e8:e9ce with SMTP id
 ba11-20020a170902720b00b0014b81e8e9cemr787966plb.155.1643116717127; 
 Tue, 25 Jan 2022 05:18:37 -0800 (PST)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id x7sm14701622pgr.87.2022.01.25.05.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 05:18:36 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com
Subject: [PATCH 3/5] vduse-blk: implements vduse-blk export
Date: Tue, 25 Jan 2022 21:17:58 +0800
Message-Id: <20220125131800.91-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125131800.91-1-xieyongji@bytedance.com>
References: <20220125131800.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
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
---
 block/export/export.c         |   6 +
 block/export/meson.build      |   5 +
 block/export/vduse-blk.c      | 427 ++++++++++++++++++++++++++++++++++
 block/export/vduse-blk.h      |  20 ++
 meson.build                   |  13 ++
 meson_options.txt             |   2 +
 qapi/block-export.json        |  24 +-
 scripts/meson-buildoptions.sh |   4 +
 8 files changed, 499 insertions(+), 2 deletions(-)
 create mode 100644 block/export/vduse-blk.c
 create mode 100644 block/export/vduse-blk.h

diff --git a/block/export/export.c b/block/export/export.c
index 6d3b9964c8..00dd505540 100644
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
index 0a08e384c7..cf311d2b1b 100644
--- a/block/export/meson.build
+++ b/block/export/meson.build
@@ -5,3 +5,8 @@ if have_vhost_user_blk_server
 endif
 
 blockdev_ss.add(when: fuse, if_true: files('fuse.c'))
+
+if have_vduse_blk_export
+    blockdev_ss.add(files('vduse-blk.c'))
+    blockdev_ss.add(libvduse)
+endif
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
new file mode 100644
index 0000000000..5a8d289685
--- /dev/null
+++ b/block/export/vduse-blk.c
@@ -0,0 +1,427 @@
+/*
+ * Export QEMU block device via VDUSE
+ *
+ * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *   Portions of codes and concepts borrowed from vhost-user-blk-server.c, so:
+ *     Copyright (c) 2020 Red Hat, Inc.
+ *
+ * Author:
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *   Coiby Xu <coiby.xu@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include <sys/eventfd.h>
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "sysemu/block-backend.h"
+#include "block/export.h"
+#include "qemu/error-report.h"
+#include "util/block-helpers.h"
+#include "subprojects/libvduse/libvduse.h"
+
+#include "standard-headers/linux/virtio_ring.h"
+#include "standard-headers/linux/virtio_blk.h"
+
+#define VIRTIO_BLK_SECTOR_BITS 9
+#define VIRTIO_BLK_SECTOR_SIZE (1ULL << VIRTIO_BLK_SECTOR_BITS)
+
+#define VDUSE_DEFAULT_NUM_QUEUE 1
+#define VDUSE_DEFAULT_QUEUE_SIZE 128
+
+typedef struct VduseBlkExport {
+    BlockExport export;
+    VduseDev *dev;
+    uint16_t num_queues;
+    uint32_t blk_size;
+    bool writable;
+} VduseBlkExport;
+
+struct virtio_blk_inhdr {
+    unsigned char status;
+};
+
+typedef struct VduseBlkReq {
+    VduseVirtqElement elem;
+    int64_t sector_num;
+    size_t in_len;
+    struct virtio_blk_inhdr *in;
+    struct virtio_blk_outhdr out;
+    VduseVirtq *vq;
+} VduseBlkReq;
+
+static void vduse_blk_req_complete(VduseBlkReq *req)
+{
+    vduse_queue_push(req->vq, &req->elem, req->in_len);
+    vduse_queue_notify(req->vq);
+
+    free(req);
+}
+
+static bool vduse_blk_sect_range_ok(VduseBlkExport *vblk_exp,
+                                    uint64_t sector, size_t size)
+{
+    uint64_t nb_sectors;
+    uint64_t total_sectors;
+
+    if (size % VIRTIO_BLK_SECTOR_SIZE) {
+        return false;
+    }
+
+    nb_sectors = size >> VIRTIO_BLK_SECTOR_BITS;
+
+    QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != VIRTIO_BLK_SECTOR_SIZE);
+    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
+        return false;
+    }
+    if ((sector << VIRTIO_BLK_SECTOR_BITS) % vblk_exp->blk_size) {
+        return false;
+    }
+    blk_get_geometry(vblk_exp->export.blk, &total_sectors);
+    if (sector > total_sectors || nb_sectors > total_sectors - sector) {
+        return false;
+    }
+    return true;
+}
+
+static void coroutine_fn vduse_blk_virtio_process_req(void *opaque)
+{
+    VduseBlkReq *req = opaque;
+    VduseVirtq *vq = req->vq;
+    VduseDev *dev = vduse_queue_get_dev(vq);
+    VduseBlkExport *vblk_exp = vduse_dev_get_priv(dev);
+    BlockBackend *blk = vblk_exp->export.blk;
+    VduseVirtqElement *elem = &req->elem;
+    struct iovec *in_iov = elem->in_sg;
+    struct iovec *out_iov = elem->out_sg;
+    unsigned in_num = elem->in_num;
+    unsigned out_num = elem->out_num;
+    uint32_t type;
+
+    if (elem->out_num < 1 || elem->in_num < 1) {
+        error_report("virtio-blk request missing headers");
+        goto err;
+    }
+
+    if (unlikely(iov_to_buf(out_iov, out_num, 0, &req->out,
+                            sizeof(req->out)) != sizeof(req->out))) {
+        error_report("virtio-blk request outhdr too short");
+        goto err;
+    }
+
+    iov_discard_front(&out_iov, &out_num, sizeof(req->out));
+
+    if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
+        error_report("virtio-blk request inhdr too short");
+        goto err;
+    }
+
+    /* We always touch the last byte, so just see how big in_iov is. */
+    req->in_len = iov_size(in_iov, in_num);
+    req->in = (void *)in_iov[in_num - 1].iov_base
+              + in_iov[in_num - 1].iov_len
+              - sizeof(struct virtio_blk_inhdr);
+    iov_discard_back(in_iov, &in_num, sizeof(struct virtio_blk_inhdr));
+
+    type = le32_to_cpu(req->out.type);
+    switch (type & ~VIRTIO_BLK_T_BARRIER) {
+    case VIRTIO_BLK_T_IN:
+    case VIRTIO_BLK_T_OUT: {
+        QEMUIOVector qiov;
+        int64_t offset;
+        ssize_t ret = 0;
+        bool is_write = type & VIRTIO_BLK_T_OUT;
+        req->sector_num = le64_to_cpu(req->out.sector);
+
+        if (is_write && !vblk_exp->writable) {
+            req->in->status = VIRTIO_BLK_S_IOERR;
+            break;
+        }
+
+        if (is_write) {
+            qemu_iovec_init_external(&qiov, out_iov, out_num);
+        } else {
+            qemu_iovec_init_external(&qiov, in_iov, in_num);
+        }
+
+        if (unlikely(!vduse_blk_sect_range_ok(vblk_exp,
+                                              req->sector_num,
+                                              qiov.size))) {
+            req->in->status = VIRTIO_BLK_S_IOERR;
+            break;
+        }
+
+        offset = req->sector_num << VIRTIO_BLK_SECTOR_BITS;
+
+        if (is_write) {
+            ret = blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
+        } else {
+            ret = blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
+        }
+        if (ret >= 0) {
+            req->in->status = VIRTIO_BLK_S_OK;
+        } else {
+            req->in->status = VIRTIO_BLK_S_IOERR;
+        }
+        break;
+    }
+    case VIRTIO_BLK_T_FLUSH:
+        if (blk_co_flush(blk) == 0) {
+            req->in->status = VIRTIO_BLK_S_OK;
+        } else {
+            req->in->status = VIRTIO_BLK_S_IOERR;
+        }
+        break;
+    case VIRTIO_BLK_T_GET_ID: {
+        size_t size = MIN(iov_size(&elem->in_sg[0], in_num),
+                          VIRTIO_BLK_ID_BYTES);
+        snprintf(elem->in_sg[0].iov_base, size, "%s", vblk_exp->export.id);
+        req->in->status = VIRTIO_BLK_S_OK;
+        break;
+    }
+    default:
+        req->in->status = VIRTIO_BLK_S_UNSUPP;
+        break;
+    }
+
+    vduse_blk_req_complete(req);
+    return;
+
+err:
+    free(req);
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
+static void blk_aio_attached(AioContext *ctx, void *opaque)
+{
+    VduseBlkExport *vblk_exp = opaque;
+    int i;
+
+    vblk_exp->export.ctx = ctx;
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
+static void blk_aio_detach(void *opaque)
+{
+    VduseBlkExport *vblk_exp = opaque;
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
+    struct virtio_blk_config config;
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
+        if (queue_size == 0) {
+            error_setg(errp, "queue-size must be greater than 0");
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
+    blk_set_guest_block_size(exp->blk, logical_block_size);
+
+    vblk_exp->blk_size = logical_block_size;
+    vblk_exp->writable = opts->writable;
+    vblk_exp->num_queues = num_queues;
+
+    config.capacity =
+            cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BITS);
+    config.seg_max = cpu_to_le32(queue_size - 2);
+    config.size_max = cpu_to_le32(0);
+    config.min_io_size = cpu_to_le16(1);
+    config.opt_io_size = cpu_to_le32(1);
+    config.num_queues = cpu_to_le16(num_queues);
+    config.blk_size = cpu_to_le32(logical_block_size);
+
+    features = (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
+               (1ULL << VIRTIO_F_VERSION_1) |
+               (1ULL << VIRTIO_RING_F_EVENT_IDX) |
+               (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
+               (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
+               (1ULL << VIRTIO_BLK_F_SIZE_MAX) |
+               (1ULL << VIRTIO_BLK_F_SEG_MAX) |
+               (1ULL << VIRTIO_BLK_F_TOPOLOGY) |
+               (1ULL << VIRTIO_BLK_F_BLK_SIZE);
+
+    if (num_queues > 1) {
+        features |= 1ULL << VIRTIO_BLK_F_MQ;
+    }
+    if (!vblk_exp->writable) {
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
+    vduse_dev_destroy(vblk_exp->dev);
+}
+
+static void vduse_blk_exp_request_shutdown(BlockExport *exp)
+{
+    VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+    int i;
+
+    blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
+                                    vblk_exp);
+
+    for (i = 0; i < vblk_exp->num_queues; i++) {
+        VduseVirtq *vq = vduse_dev_get_queue(vblk_exp->dev, i);
+        int fd = vduse_queue_get_fd(vq);
+
+        if (fd < 0) {
+            continue;
+        }
+        aio_set_fd_handler(exp->ctx, fd, true, NULL, NULL, NULL, NULL, NULL);
+    }
+    aio_set_fd_handler(exp->ctx, vduse_dev_get_fd(vblk_exp->dev),
+                       true, NULL, NULL, NULL, NULL, NULL);
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
index 864fb50ade..472e3947c6 100644
--- a/meson.build
+++ b/meson.build
@@ -1320,6 +1320,17 @@ if have_libvduse
   libvduse = libvduse_proj.get_variable('libvduse_dep')
 endif
 
+have_vduse_blk_export = (have_libvduse and targetos == 'linux')
+if get_option('vduse_blk_export').enabled()
+    if targetos != 'linux'
+        error('vduse_blk_export requires linux')
+    elif have_libvduse
+        error('vduse_blk_export requires libvduse support')
+    endif
+elif get_option('vduse_blk_export').disabled()
+    have_vduse_blk_export = false
+endif
+
 # libbpf
 libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
 if libbpf.found() and not cc.links('''
@@ -1514,6 +1525,7 @@ config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
+config_host_data.set('CONFIG_VDUSE_BLK_EXPORT', have_vduse_blk_export)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
 config_host_data.set('CONFIG_VNC_PNG', png.found())
@@ -3407,6 +3419,7 @@ if have_block
   summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
   summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
   summary_info += {'FUSE exports':      fuse}
+  summary_info += {'VDUSE block exports': have_vduse_blk_export}
 endif
 summary(summary_info, bool_yn: true, section: 'Block layer support')
 
diff --git a/meson_options.txt b/meson_options.txt
index 16790d1814..be1682c4d2 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -197,6 +197,8 @@ option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
 option('libvduse', type: 'feature', value: 'auto',
        description: 'build VDUSE Library')
+option('vduse_blk_export', type: 'feature', value: 'auto',
+       description: 'VDUSE block export support')
 
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
diff --git a/qapi/block-export.json b/qapi/block-export.json
index f9ce79a974..f88e90baab 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -170,6 +170,22 @@
             '*allow-other': 'FuseExportAllowOther' },
   'if': 'CONFIG_FUSE' }
 
+##
+# @BlockExportOptionsVduseBlk:
+#
+# A vduse-blk block export.
+#
+# @num-queues: the number of virtqueues. Defaults to 1.
+# @queue-size: the size of virtqueue. Defaults to 128.
+# @logical-block-size: Logical block size in bytes. Defaults to 512 bytes.
+#
+# Since: 7.0
+##
+{ 'struct': 'BlockExportOptionsVduseBlk',
+  'data': { '*num-queues': 'uint16',
+            '*queue-size': 'uint16',
+            '*logical-block-size': 'size'} }
+
 ##
 # @NbdServerAddOptions:
 #
@@ -273,13 +289,15 @@
 # @nbd: NBD export
 # @vhost-user-blk: vhost-user-blk export (since 5.2)
 # @fuse: FUSE export (since: 6.0)
+# @vduse-blk: vduse-blk export (since 7.0)
 #
 # Since: 4.2
 ##
 { 'enum': 'BlockExportType',
   'data': [ 'nbd',
             { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
-            { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
+            { 'name': 'fuse', 'if': 'CONFIG_FUSE' },
+            { 'name': 'vduse-blk', 'if': 'CONFIG_VDUSE_BLK_EXPORT' } ] }
 
 ##
 # @BlockExportOptions:
@@ -323,7 +341,9 @@
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
index af5c75d758..615fc17ec3 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -86,6 +86,8 @@ meson_options_help() {
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
+  printf "%s\n" '  vduse-blk-export'
+  printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  virglrenderer   virgl rendering support'
@@ -254,6 +256,8 @@ _meson_option_parse() {
     --disable-usb-redir) printf "%s" -Dusb_redir=disabled ;;
     --enable-vde) printf "%s" -Dvde=enabled ;;
     --disable-vde) printf "%s" -Dvde=disabled ;;
+    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
+    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
-- 
2.20.1


