Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D414D5198F6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:53:44 +0200 (CEST)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9pP-0003rL-O3
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9cy-0002cK-24
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:40:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9cv-0006x6-F3
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:40:51 -0400
Received: by mail-pl1-x635.google.com with SMTP id n8so731429plh.1
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 00:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DlwjnB3ppQFMGTkb5V9gcNR44nngB39VoWLTeVe3H48=;
 b=4uaLcu5Z2LAcv9AEBys8qzjQgMg88QzWotMggkxrOF/Ki9u9/bhVMvRvtt3R2cJ4XN
 0s2z74hIRzbAuRoLKhF7Q+t+ZaCjlXmi1ZNAL7JLLTKIChvCZjdF9JchxYDefgWWspKV
 AY02XHxpFTKrtvAHumzoUnDCi/BSHGSpEGbOjvHPjx035btV7JY+wg+GFDwTBDGYa9je
 BPeegZipB8sP0v96ydkDn6OfZSqZzDIELnlHv3QyuA3blruabtSJv3RcjsJl6THDhbOm
 V7hVRhGBglsYeiff0Y5wD7vQbr+26Yrh4owoedckZbp1jy5yKi7g//nwu0qCMxJQCuDH
 KG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DlwjnB3ppQFMGTkb5V9gcNR44nngB39VoWLTeVe3H48=;
 b=2DVV68OJmXQF8vlBKYBLQ3ap0T8HcvuxxVaiqIVbMaN1e3G3BWxgVyfBP9m7hogY56
 SRrFLjwgWsaK/TImQjU8xJXLVWJnoXAGl8afF0bEvyb/Xoz0G0NGBYxK2sD9erQ9gbXa
 EraND5dnKpLVbTxjmbtcRf4JE9iwezOMzmjHI7FtO4tkewrjcCJrE+kutHNq75gJtn+q
 2qBkSDx1iJoo28YOxXyBlW8upkg2T3eTDgGAZgWr3DB/sFyvaybpxQ2MQ6qC65VsQ2Gi
 bjK3P958LGSurR549cYEnxXFBUTr2AxOPD7aI+6C6w2jdqrzflToSId4vtDQWCaOzRva
 FWkA==
X-Gm-Message-State: AOAM531KCyjkzDtnRiTkS1P63rkLzIcc9i04WICPH1+yu0W9a6/OijYq
 zP1fM2ZH59lRldQEZmoEXwuP
X-Google-Smtp-Source: ABdhPJz8ImvuReRRSxwXyp+3X0vgaIOK6kcIqbVLSOuWGlaUV54aI2yexoy7bYZ6dmx1QTj13z8UKA==
X-Received: by 2002:a17:902:ea11:b0:15e:ae19:f36a with SMTP id
 s17-20020a170902ea1100b0015eae19f36amr10417811plg.52.1651650048663; 
 Wed, 04 May 2022 00:40:48 -0700 (PDT)
Received: from localhost ([139.177.225.233]) by smtp.gmail.com with ESMTPSA id
 6-20020aa79146000000b0050dc76281aasm1646036pfi.132.2022.05.04.00.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:40:48 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 3/8] block/export: Abstract out the logic of virtio-blk I/O
 process
Date: Wed,  4 May 2022 15:40:46 +0800
Message-Id: <20220504074051.90-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074051.90-1-xieyongji@bytedance.com>
References: <20220504074051.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Abstract the common logic of virtio-blk I/O process to a function
named virtio_blk_process_req(). It's needed for the following commit.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 MAINTAINERS                          |   2 +
 block/export/meson.build             |   2 +-
 block/export/vhost-user-blk-server.c | 249 ++-------------------------
 block/export/virtio-blk-handler.c    | 237 +++++++++++++++++++++++++
 block/export/virtio-blk-handler.h    |  33 ++++
 5 files changed, 287 insertions(+), 236 deletions(-)
 create mode 100644 block/export/virtio-blk-handler.c
 create mode 100644 block/export/virtio-blk-handler.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 294c88ace9..4113b6fc5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3536,6 +3536,8 @@ M: Coiby Xu <Coiby.Xu@gmail.com>
 S: Maintained
 F: block/export/vhost-user-blk-server.c
 F: block/export/vhost-user-blk-server.h
+F: block/export/virtio-blk-handler.c
+F: block/export/virtio-blk-handler.h
 F: include/qemu/vhost-user-server.h
 F: tests/qtest/libqos/vhost-user-blk.c
 F: tests/qtest/libqos/vhost-user-blk.h
diff --git a/block/export/meson.build b/block/export/meson.build
index 0a08e384c7..431e47ca51 100644
--- a/block/export/meson.build
+++ b/block/export/meson.build
@@ -1,7 +1,7 @@
 blockdev_ss.add(files('export.c'))
 
 if have_vhost_user_blk_server
-    blockdev_ss.add(files('vhost-user-blk-server.c'))
+    blockdev_ss.add(files('vhost-user-blk-server.c', 'virtio-blk-handler.c'))
 endif
 
 blockdev_ss.add(when: fuse, if_true: files('fuse.c'))
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index a129204c44..8705f7c27c 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -17,31 +17,15 @@
 #include "vhost-user-blk-server.h"
 #include "qapi/error.h"
 #include "qom/object_interfaces.h"
-#include "sysemu/block-backend.h"
 #include "util/block-helpers.h"
-
-/*
- * Sector units are 512 bytes regardless of the
- * virtio_blk_config->blk_size value.
- */
-#define VIRTIO_BLK_SECTOR_BITS 9
-#define VIRTIO_BLK_SECTOR_SIZE (1ull << VIRTIO_BLK_SECTOR_BITS)
+#include "virtio-blk-handler.h"
 
 enum {
     VHOST_USER_BLK_NUM_QUEUES_DEFAULT = 1,
-    VHOST_USER_BLK_MAX_DISCARD_SECTORS = 32768,
-    VHOST_USER_BLK_MAX_WRITE_ZEROES_SECTORS = 32768,
-};
-struct virtio_blk_inhdr {
-    unsigned char status;
 };
 
 typedef struct VuBlkReq {
     VuVirtqElement elem;
-    int64_t sector_num;
-    size_t size;
-    struct virtio_blk_inhdr *in;
-    struct virtio_blk_outhdr out;
     VuServer *server;
     struct VuVirtq *vq;
 } VuBlkReq;
@@ -50,248 +34,44 @@ typedef struct VuBlkReq {
 typedef struct {
     BlockExport export;
     VuServer vu_server;
-    uint32_t blk_size;
     QIOChannelSocket *sioc;
     struct virtio_blk_config blkcfg;
     bool writable;
 } VuBlkExport;
 
-static void vu_blk_req_complete(VuBlkReq *req)
+static void vu_blk_req_complete(VuBlkReq *req, size_t in_len)
 {
     VuDev *vu_dev = &req->server->vu_dev;
 
-    /* IO size with 1 extra status byte */
-    vu_queue_push(vu_dev, req->vq, &req->elem, req->size + 1);
+    vu_queue_push(vu_dev, req->vq, &req->elem, in_len);
     vu_queue_notify(vu_dev, req->vq);
 
     free(req);
 }
 
-static bool vu_blk_sect_range_ok(VuBlkExport *vexp, uint64_t sector,
-                                 size_t size)
-{
-    uint64_t nb_sectors;
-    uint64_t total_sectors;
-
-    if (size % VIRTIO_BLK_SECTOR_SIZE) {
-        return false;
-    }
-
-    nb_sectors = size >> VIRTIO_BLK_SECTOR_BITS;
-
-    QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != VIRTIO_BLK_SECTOR_SIZE);
-    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
-        return false;
-    }
-    if ((sector << VIRTIO_BLK_SECTOR_BITS) % vexp->blk_size) {
-        return false;
-    }
-    blk_get_geometry(vexp->export.blk, &total_sectors);
-    if (sector > total_sectors || nb_sectors > total_sectors - sector) {
-        return false;
-    }
-    return true;
-}
-
-static int coroutine_fn
-vu_blk_discard_write_zeroes(VuBlkExport *vexp, struct iovec *iov,
-                            uint32_t iovcnt, uint32_t type)
-{
-    BlockBackend *blk = vexp->export.blk;
-    struct virtio_blk_discard_write_zeroes desc;
-    ssize_t size;
-    uint64_t sector;
-    uint32_t num_sectors;
-    uint32_t max_sectors;
-    uint32_t flags;
-    int bytes;
-
-    /* Only one desc is currently supported */
-    if (unlikely(iov_size(iov, iovcnt) > sizeof(desc))) {
-        return VIRTIO_BLK_S_UNSUPP;
-    }
-
-    size = iov_to_buf(iov, iovcnt, 0, &desc, sizeof(desc));
-    if (unlikely(size != sizeof(desc))) {
-        error_report("Invalid size %zd, expected %zu", size, sizeof(desc));
-        return VIRTIO_BLK_S_IOERR;
-    }
-
-    sector = le64_to_cpu(desc.sector);
-    num_sectors = le32_to_cpu(desc.num_sectors);
-    flags = le32_to_cpu(desc.flags);
-    max_sectors = (type == VIRTIO_BLK_T_WRITE_ZEROES) ?
-                  VHOST_USER_BLK_MAX_WRITE_ZEROES_SECTORS :
-                  VHOST_USER_BLK_MAX_DISCARD_SECTORS;
-
-    /* This check ensures that 'bytes' fits in an int */
-    if (unlikely(num_sectors > max_sectors)) {
-        return VIRTIO_BLK_S_IOERR;
-    }
-
-    bytes = num_sectors << VIRTIO_BLK_SECTOR_BITS;
-
-    if (unlikely(!vu_blk_sect_range_ok(vexp, sector, bytes))) {
-        return VIRTIO_BLK_S_IOERR;
-    }
-
-    /*
-     * The device MUST set the status byte to VIRTIO_BLK_S_UNSUPP for discard
-     * and write zeroes commands if any unknown flag is set.
-     */
-    if (unlikely(flags & ~VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP)) {
-        return VIRTIO_BLK_S_UNSUPP;
-    }
-
-    if (type == VIRTIO_BLK_T_WRITE_ZEROES) {
-        int blk_flags = 0;
-
-        if (flags & VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP) {
-            blk_flags |= BDRV_REQ_MAY_UNMAP;
-        }
-
-        if (blk_co_pwrite_zeroes(blk, sector << VIRTIO_BLK_SECTOR_BITS,
-                                 bytes, blk_flags) == 0) {
-            return VIRTIO_BLK_S_OK;
-        }
-    } else if (type == VIRTIO_BLK_T_DISCARD) {
-        /*
-         * The device MUST set the status byte to VIRTIO_BLK_S_UNSUPP for
-         * discard commands if the unmap flag is set.
-         */
-        if (unlikely(flags & VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP)) {
-            return VIRTIO_BLK_S_UNSUPP;
-        }
-
-        if (blk_co_pdiscard(blk, sector << VIRTIO_BLK_SECTOR_BITS,
-                            bytes) == 0) {
-            return VIRTIO_BLK_S_OK;
-        }
-    }
-
-    return VIRTIO_BLK_S_IOERR;
-}
-
 /* Called with server refcount increased, must decrease before returning */
 static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
 {
     VuBlkReq *req = opaque;
     VuServer *server = req->server;
     VuVirtqElement *elem = &req->elem;
-    uint32_t type;
-
     VuBlkExport *vexp = container_of(server, VuBlkExport, vu_server);
     BlockBackend *blk = vexp->export.blk;
-
     struct iovec *in_iov = elem->in_sg;
     struct iovec *out_iov = elem->out_sg;
     unsigned in_num = elem->in_num;
     unsigned out_num = elem->out_num;
-
-    /* refer to hw/block/virtio_blk.c */
-    if (elem->out_num < 1 || elem->in_num < 1) {
-        error_report("virtio-blk request missing headers");
-        goto err;
-    }
-
-    if (unlikely(iov_to_buf(out_iov, out_num, 0, &req->out,
-                            sizeof(req->out)) != sizeof(req->out))) {
-        error_report("virtio-blk request outhdr too short");
-        goto err;
+    int in_len;
+
+    in_len = virtio_blk_process_req(blk, vexp->writable, "vhost_user_blk",
+                                    in_iov, out_iov, in_num, out_num);
+    if (in_len < 0) {
+        free(req);
+        vhost_user_server_unref(server);
+        return;
     }
 
-    iov_discard_front(&out_iov, &out_num, sizeof(req->out));
-
-    if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
-        error_report("virtio-blk request inhdr too short");
-        goto err;
-    }
-
-    /* We always touch the last byte, so just see how big in_iov is.  */
-    req->in = (void *)in_iov[in_num - 1].iov_base
-              + in_iov[in_num - 1].iov_len
-              - sizeof(struct virtio_blk_inhdr);
-    iov_discard_back(in_iov, &in_num, sizeof(struct virtio_blk_inhdr));
-
-    type = le32_to_cpu(req->out.type);
-    switch (type & ~VIRTIO_BLK_T_BARRIER) {
-    case VIRTIO_BLK_T_IN:
-    case VIRTIO_BLK_T_OUT: {
-        QEMUIOVector qiov;
-        int64_t offset;
-        ssize_t ret = 0;
-        bool is_write = type & VIRTIO_BLK_T_OUT;
-        req->sector_num = le64_to_cpu(req->out.sector);
-
-        if (is_write && !vexp->writable) {
-            req->in->status = VIRTIO_BLK_S_IOERR;
-            break;
-        }
-
-        if (is_write) {
-            qemu_iovec_init_external(&qiov, out_iov, out_num);
-        } else {
-            qemu_iovec_init_external(&qiov, in_iov, in_num);
-        }
-
-        if (unlikely(!vu_blk_sect_range_ok(vexp,
-                                           req->sector_num,
-                                           qiov.size))) {
-            req->in->status = VIRTIO_BLK_S_IOERR;
-            break;
-        }
-
-        offset = req->sector_num << VIRTIO_BLK_SECTOR_BITS;
-
-        if (is_write) {
-            ret = blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
-        } else {
-            ret = blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
-        }
-        if (ret >= 0) {
-            req->in->status = VIRTIO_BLK_S_OK;
-        } else {
-            req->in->status = VIRTIO_BLK_S_IOERR;
-        }
-        break;
-    }
-    case VIRTIO_BLK_T_FLUSH:
-        if (blk_co_flush(blk) == 0) {
-            req->in->status = VIRTIO_BLK_S_OK;
-        } else {
-            req->in->status = VIRTIO_BLK_S_IOERR;
-        }
-        break;
-    case VIRTIO_BLK_T_GET_ID: {
-        size_t size = MIN(iov_size(&elem->in_sg[0], in_num),
-                          VIRTIO_BLK_ID_BYTES);
-        snprintf(elem->in_sg[0].iov_base, size, "%s", "vhost_user_blk");
-        req->in->status = VIRTIO_BLK_S_OK;
-        req->size = elem->in_sg[0].iov_len;
-        break;
-    }
-    case VIRTIO_BLK_T_DISCARD:
-    case VIRTIO_BLK_T_WRITE_ZEROES: {
-        if (!vexp->writable) {
-            req->in->status = VIRTIO_BLK_S_IOERR;
-            break;
-        }
-
-        req->in->status = vu_blk_discard_write_zeroes(vexp, out_iov, out_num,
-                                                      type);
-        break;
-    }
-    default:
-        req->in->status = VIRTIO_BLK_S_UNSUPP;
-        break;
-    }
-
-    vu_blk_req_complete(req);
-    vhost_user_server_unref(server);
-    return;
-
-err:
-    free(req);
+    vu_blk_req_complete(req, in_len);
     vhost_user_server_unref(server);
 }
 
@@ -455,12 +235,12 @@ vu_blk_initialize_config(BlockDriverState *bs,
     config->opt_io_size = cpu_to_le32(1);
     config->num_queues = cpu_to_le16(num_queues);
     config->max_discard_sectors =
-        cpu_to_le32(VHOST_USER_BLK_MAX_DISCARD_SECTORS);
+        cpu_to_le32(VIRTIO_BLK_MAX_DISCARD_SECTORS);
     config->max_discard_seg = cpu_to_le32(1);
     config->discard_sector_alignment =
         cpu_to_le32(blk_size >> VIRTIO_BLK_SECTOR_BITS);
     config->max_write_zeroes_sectors
-        = cpu_to_le32(VHOST_USER_BLK_MAX_WRITE_ZEROES_SECTORS);
+        = cpu_to_le32(VIRTIO_BLK_MAX_WRITE_ZEROES_SECTORS);
     config->max_write_zeroes_seg = cpu_to_le32(1);
 }
 
@@ -494,7 +274,6 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         error_propagate(errp, local_err);
         return -EINVAL;
     }
-    vexp->blk_size = logical_block_size;
     blk_set_guest_block_size(exp->blk, logical_block_size);
 
     if (vu_opts->has_num_queues) {
diff --git a/block/export/virtio-blk-handler.c b/block/export/virtio-blk-handler.c
new file mode 100644
index 0000000000..3fe83154ef
--- /dev/null
+++ b/block/export/virtio-blk-handler.c
@@ -0,0 +1,237 @@
+/*
+ * Handler for virtio-blk I/O
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author:
+ *   Coiby Xu <coiby.xu@gmail.com>
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "virtio-blk-handler.h"
+
+#include "standard-headers/linux/virtio_blk.h"
+
+struct virtio_blk_inhdr {
+    unsigned char status;
+};
+
+static bool virtio_blk_sect_range_ok(BlockBackend *blk,
+                                     uint64_t sector, size_t size)
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
+    if ((sector << VIRTIO_BLK_SECTOR_BITS) % blk_get_guest_block_size(blk)) {
+        return false;
+    }
+    blk_get_geometry(blk, &total_sectors);
+    if (sector > total_sectors || nb_sectors > total_sectors - sector) {
+        return false;
+    }
+    return true;
+}
+
+static int coroutine_fn
+virtio_blk_discard_write_zeroes(BlockBackend *blk, struct iovec *iov,
+                                uint32_t iovcnt, uint32_t type)
+{
+    struct virtio_blk_discard_write_zeroes desc;
+    ssize_t size;
+    uint64_t sector;
+    uint32_t num_sectors;
+    uint32_t max_sectors;
+    uint32_t flags;
+    int bytes;
+
+    /* Only one desc is currently supported */
+    if (unlikely(iov_size(iov, iovcnt) > sizeof(desc))) {
+        return VIRTIO_BLK_S_UNSUPP;
+    }
+
+    size = iov_to_buf(iov, iovcnt, 0, &desc, sizeof(desc));
+    if (unlikely(size != sizeof(desc))) {
+        error_report("Invalid size %zd, expected %zu", size, sizeof(desc));
+        return VIRTIO_BLK_S_IOERR;
+    }
+
+    sector = le64_to_cpu(desc.sector);
+    num_sectors = le32_to_cpu(desc.num_sectors);
+    flags = le32_to_cpu(desc.flags);
+    max_sectors = (type == VIRTIO_BLK_T_WRITE_ZEROES) ?
+                  VIRTIO_BLK_MAX_WRITE_ZEROES_SECTORS :
+                  VIRTIO_BLK_MAX_DISCARD_SECTORS;
+
+    /* This check ensures that 'bytes' fits in an int */
+    if (unlikely(num_sectors > max_sectors)) {
+        return VIRTIO_BLK_S_IOERR;
+    }
+
+    bytes = num_sectors << VIRTIO_BLK_SECTOR_BITS;
+
+    if (unlikely(!virtio_blk_sect_range_ok(blk, sector, bytes))) {
+        return VIRTIO_BLK_S_IOERR;
+    }
+
+    /*
+     * The device MUST set the status byte to VIRTIO_BLK_S_UNSUPP for discard
+     * and write zeroes commands if any unknown flag is set.
+     */
+    if (unlikely(flags & ~VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP)) {
+        return VIRTIO_BLK_S_UNSUPP;
+    }
+
+    if (type == VIRTIO_BLK_T_WRITE_ZEROES) {
+        int blk_flags = 0;
+
+        if (flags & VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP) {
+            blk_flags |= BDRV_REQ_MAY_UNMAP;
+        }
+
+        if (blk_co_pwrite_zeroes(blk, sector << VIRTIO_BLK_SECTOR_BITS,
+                                 bytes, blk_flags) == 0) {
+            return VIRTIO_BLK_S_OK;
+        }
+    } else if (type == VIRTIO_BLK_T_DISCARD) {
+        /*
+         * The device MUST set the status byte to VIRTIO_BLK_S_UNSUPP for
+         * discard commands if the unmap flag is set.
+         */
+        if (unlikely(flags & VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP)) {
+            return VIRTIO_BLK_S_UNSUPP;
+        }
+
+        if (blk_co_pdiscard(blk, sector << VIRTIO_BLK_SECTOR_BITS,
+                            bytes) == 0) {
+            return VIRTIO_BLK_S_OK;
+        }
+    }
+
+    return VIRTIO_BLK_S_IOERR;
+}
+
+int coroutine_fn virtio_blk_process_req(BlockBackend *blk, bool writable,
+                                        const char *serial,
+                                        struct iovec *in_iov,
+                                        struct iovec *out_iov,
+                                        unsigned int in_num,
+                                        unsigned int out_num)
+{
+    struct virtio_blk_inhdr *in;
+    struct virtio_blk_outhdr out;
+    uint32_t type;
+    int in_len;
+
+    if (out_num < 1 || in_num < 1) {
+        error_report("virtio-blk request missing headers");
+        return -EINVAL;
+    }
+
+    if (unlikely(iov_to_buf(out_iov, out_num, 0, &out,
+                            sizeof(out)) != sizeof(out))) {
+        error_report("virtio-blk request outhdr too short");
+        return -EINVAL;
+    }
+
+    iov_discard_front(&out_iov, &out_num, sizeof(out));
+
+    if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
+        error_report("virtio-blk request inhdr too short");
+        return -EINVAL;
+    }
+
+    /* We always touch the last byte, so just see how big in_iov is. */
+    in_len = iov_size(in_iov, in_num);
+    in = (void *)in_iov[in_num - 1].iov_base
+                 + in_iov[in_num - 1].iov_len
+                 - sizeof(struct virtio_blk_inhdr);
+    iov_discard_back(in_iov, &in_num, sizeof(struct virtio_blk_inhdr));
+
+    type = le32_to_cpu(out.type);
+    switch (type & ~VIRTIO_BLK_T_BARRIER) {
+    case VIRTIO_BLK_T_IN:
+    case VIRTIO_BLK_T_OUT: {
+        QEMUIOVector qiov;
+        int64_t offset;
+        ssize_t ret = 0;
+        bool is_write = type & VIRTIO_BLK_T_OUT;
+        int64_t sector_num = le64_to_cpu(out.sector);
+
+        if (is_write && !writable) {
+            in->status = VIRTIO_BLK_S_IOERR;
+            break;
+        }
+
+        if (is_write) {
+            qemu_iovec_init_external(&qiov, out_iov, out_num);
+        } else {
+            qemu_iovec_init_external(&qiov, in_iov, in_num);
+        }
+
+        if (unlikely(!virtio_blk_sect_range_ok(blk, sector_num,
+                                               qiov.size))) {
+            in->status = VIRTIO_BLK_S_IOERR;
+            break;
+        }
+
+        offset = sector_num << VIRTIO_BLK_SECTOR_BITS;
+
+        if (is_write) {
+            ret = blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
+        } else {
+            ret = blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
+        }
+        if (ret >= 0) {
+            in->status = VIRTIO_BLK_S_OK;
+        } else {
+            in->status = VIRTIO_BLK_S_IOERR;
+        }
+        break;
+    }
+    case VIRTIO_BLK_T_FLUSH:
+        if (blk_co_flush(blk) == 0) {
+            in->status = VIRTIO_BLK_S_OK;
+        } else {
+            in->status = VIRTIO_BLK_S_IOERR;
+        }
+        break;
+    case VIRTIO_BLK_T_GET_ID: {
+        size_t size = MIN(strlen(serial) + 1,
+                          MIN(iov_size(in_iov, in_num),
+                              VIRTIO_BLK_ID_BYTES));
+        iov_from_buf(in_iov, in_num, 0, serial, size);
+        in->status = VIRTIO_BLK_S_OK;
+        break;
+    }
+    case VIRTIO_BLK_T_DISCARD:
+    case VIRTIO_BLK_T_WRITE_ZEROES:
+        if (!writable) {
+            in->status = VIRTIO_BLK_S_IOERR;
+            break;
+        }
+        in->status = virtio_blk_discard_write_zeroes(blk, out_iov,
+                                                     out_num, type);
+        break;
+    default:
+        in->status = VIRTIO_BLK_S_UNSUPP;
+        break;
+    }
+
+    return in_len;
+}
diff --git a/block/export/virtio-blk-handler.h b/block/export/virtio-blk-handler.h
new file mode 100644
index 0000000000..19f907b3f8
--- /dev/null
+++ b/block/export/virtio-blk-handler.h
@@ -0,0 +1,33 @@
+/*
+ * Handler for virtio-blk I/O
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author:
+ *   Coiby Xu <coiby.xu@gmail.com>
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef VIRTIO_BLK_HANDLER_H
+#define VIRTIO_BLK_HANDLER_H
+
+#include "sysemu/block-backend.h"
+
+#define VIRTIO_BLK_SECTOR_BITS 9
+#define VIRTIO_BLK_SECTOR_SIZE (1ULL << VIRTIO_BLK_SECTOR_BITS)
+
+#define VIRTIO_BLK_MAX_DISCARD_SECTORS 32768
+#define VIRTIO_BLK_MAX_WRITE_ZEROES_SECTORS 32768
+
+int coroutine_fn virtio_blk_process_req(BlockBackend *blk, bool writable,
+                                        const char *serial,
+                                        struct iovec *in_iov,
+                                        struct iovec *out_iov,
+                                        unsigned int in_num,
+                                        unsigned int out_num);
+
+#endif /* VHOST_USER_BLK_SERVER_H */
-- 
2.20.1


