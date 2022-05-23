Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA1530C50
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:18:19 +0200 (CEST)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4Ce-0003qi-Ej
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mf-00023v-6j
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:32 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mZ-0000aa-JN
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so13042245pjf.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 01:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+n7UCk+0NaYrj/ZVdqCc6EnoBH7oWiyfG4sjNNhhO8=;
 b=fErrOSfeyf7nOsR7kwy2/jAPqpMdoFpcvHbNygoHWyOJx0IVDZ9TZMNpGSjAhY1puW
 iMLTj+F9+tgERLt8kxkpSV5p1wsLPUj5W3MVRz8AF6LOBxOV5D9EDB/CGJ5wiGihiqec
 TpmYtNTSsvftM49j/iWstxppxRXXQKRix3sFM1zIFnfkM5NyZAJi4ENHYvAs+AV/+yEj
 DTW7ttEuAM54eE22utYP/ZPqY8ag27lQEGrUsSBc5yxehQ1sel2ivnpdxQlF8yZE3syX
 iDYj3kdnUYkw5da23JV+zAIXjGQu/JTrqRh2xd193LLhUqJ7G9XH3yBwiN7oegx0zrN3
 OEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+n7UCk+0NaYrj/ZVdqCc6EnoBH7oWiyfG4sjNNhhO8=;
 b=O6vlRdVPzdCdkKXob9zTTF/kcxKPziaruK2sBUXr5qVLYDI0uvs2oYyLb0L5HgiSoZ
 HV9ltO6m+FtZIw96kD3YWsf4j/8awgsZ2Up3ZNcCSfnrZ/VmfGdNPgRUX4GlSRtP/EO6
 DTNYj5gktIBPUBJr9roz+E4BWrsFx3PnHrB7stM0T5defv5rBirgxUpX28X0XBIb+QJl
 7nM9iwC/OBlrJixDNo9kMVrsoG79CZ3cLPK3lwr0cwUxpIU+jh5epDnASDfVIegRNWcv
 UDEYEZXD5GUgRbTTgTXenj3UN4X7jBNTCiJzoCD3pFESp7w6Qf0rDCXUE41RjoYjZ07l
 alhg==
X-Gm-Message-State: AOAM533I5XBchqQZqGOTIbQjoleO7JO6MGcaLlLYDqbRu82F9Q9yBTJs
 hTF9uXSXSl0FAfgQUg6kyMzw8iVb7HoJzeo=
X-Google-Smtp-Source: ABdhPJzA4t3fBu7hTDaqBVHwz5tqcgmLOGkoV78g//1llEQeJ6TrSm8fluCURR9FdTEhoZw/73oXZQ==
X-Received: by 2002:a17:902:9a4c:b0:156:6735:b438 with SMTP id
 x12-20020a1709029a4c00b001566735b438mr21565105plv.46.1653295874116; 
 Mon, 23 May 2022 01:51:14 -0700 (PDT)
Received: from localhost ([139.177.225.248]) by smtp.gmail.com with ESMTPSA id
 16-20020a17090a0f1000b001e0484b2181sm1990072pjy.23.2022.05.23.01.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:51:13 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 3/8] block/export: Abstract out the logic of virtio-blk I/O
 process
Date: Mon, 23 May 2022 16:46:06 +0800
Message-Id: <20220523084611.91-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523084611.91-1-xieyongji@bytedance.com>
References: <20220523084611.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x102e.google.com
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

Abstract the common logic of virtio-blk I/O process to a function
named virtio_blk_process_req(). It's needed for the following commit.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 MAINTAINERS                          |   2 +
 block/export/meson.build             |   2 +-
 block/export/vhost-user-blk-server.c | 259 +++------------------------
 block/export/virtio-blk-handler.c    | 240 +++++++++++++++++++++++++
 block/export/virtio-blk-handler.h    |  37 ++++
 5 files changed, 301 insertions(+), 239 deletions(-)
 create mode 100644 block/export/virtio-blk-handler.c
 create mode 100644 block/export/virtio-blk-handler.h

diff --git a/MAINTAINERS b/MAINTAINERS
index dff0200f70..01fb25421b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3540,6 +3540,8 @@ M: Coiby Xu <Coiby.Xu@gmail.com>
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
index 19c6ee51d3..c9c290cc4c 100644
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
@@ -50,247 +34,44 @@ typedef struct VuBlkReq {
 typedef struct {
     BlockExport export;
     VuServer vu_server;
-    uint32_t blk_size;
+    VirtioBlkHandler handler;
     QIOChannelSocket *sioc;
     struct virtio_blk_config blkcfg;
-    bool writable;
 } VuBlkExport;
 
-static void vu_blk_req_complete(VuBlkReq *req)
+static void vu_blk_req_complete(VuBlkReq *req, size_t in_len)
 {
     VuDev *vu_dev = &req->server->vu_dev;
 
-    vu_queue_push(vu_dev, req->vq, &req->elem, req->size);
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
-    BlockBackend *blk = vexp->export.blk;
-
+    VirtioBlkHandler *handler = &vexp->handler;
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
-    }
-
-    iov_discard_front(&out_iov, &out_num, sizeof(req->out));
-
-    if (in_iov[in_num - 1].iov_len < sizeof(struct virtio_blk_inhdr)) {
-        error_report("virtio-blk request inhdr too short");
-        goto err;
-    }
-
-    req->size = iov_size(in_iov, in_num);
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
-        break;
+    int in_len;
+
+    in_len = virtio_blk_process_req(handler, in_iov, out_iov,
+                                    in_num, out_num);
+    if (in_len < 0) {
+        free(req);
+        vhost_user_server_unref(server);
+        return;
     }
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
 
-err:
-    free(req);
+    vu_blk_req_complete(req, in_len);
     vhost_user_server_unref(server);
 }
 
@@ -347,7 +128,7 @@ static uint64_t vu_blk_get_features(VuDev *dev)
                1ull << VIRTIO_RING_F_EVENT_IDX |
                1ull << VHOST_USER_F_PROTOCOL_FEATURES;
 
-    if (!vexp->writable) {
+    if (!vexp->handler.writable) {
         features |= 1ull << VIRTIO_BLK_F_RO;
     }
 
@@ -454,12 +235,12 @@ vu_blk_initialize_config(BlockDriverState *bs,
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
 
@@ -479,7 +260,6 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     uint64_t logical_block_size;
     uint16_t num_queues = VHOST_USER_BLK_NUM_QUEUES_DEFAULT;
 
-    vexp->writable = opts->writable;
     vexp->blkcfg.wce = 0;
 
     if (vu_opts->has_logical_block_size) {
@@ -493,7 +273,6 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         error_propagate(errp, local_err);
         return -EINVAL;
     }
-    vexp->blk_size = logical_block_size;
 
     if (vu_opts->has_num_queues) {
         num_queues = vu_opts->num_queues;
@@ -502,6 +281,10 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         error_setg(errp, "num-queues must be greater than 0");
         return -EINVAL;
     }
+    vexp->handler.blk = exp->blk;
+    vexp->handler.serial = "vhost_user_blk";
+    vexp->handler.logical_block_size = logical_block_size;
+    vexp->handler.writable = opts->writable;
 
     vu_blk_initialize_config(blk_bs(exp->blk), &vexp->blkcfg,
                              logical_block_size, num_queues);
diff --git a/block/export/virtio-blk-handler.c b/block/export/virtio-blk-handler.c
new file mode 100644
index 0000000000..313666e8ab
--- /dev/null
+++ b/block/export/virtio-blk-handler.c
@@ -0,0 +1,240 @@
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
+static bool virtio_blk_sect_range_ok(BlockBackend *blk, uint32_t block_size,
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
+    if ((sector << VIRTIO_BLK_SECTOR_BITS) % block_size) {
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
+virtio_blk_discard_write_zeroes(VirtioBlkHandler *handler, struct iovec *iov,
+                                uint32_t iovcnt, uint32_t type)
+{
+    BlockBackend *blk = handler->blk;
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
+    if (unlikely(!virtio_blk_sect_range_ok(blk, handler->logical_block_size,
+                                           sector, bytes))) {
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
+int coroutine_fn virtio_blk_process_req(VirtioBlkHandler *handler,
+                                        struct iovec *in_iov,
+                                        struct iovec *out_iov,
+                                        unsigned int in_num,
+                                        unsigned int out_num)
+{
+    BlockBackend *blk = handler->blk;
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
+        if (is_write && !handler->writable) {
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
+        if (unlikely(!virtio_blk_sect_range_ok(blk,
+                                               handler->logical_block_size,
+                                               sector_num, qiov.size))) {
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
+        size_t size = MIN(strlen(handler->serial) + 1,
+                          MIN(iov_size(in_iov, in_num),
+                              VIRTIO_BLK_ID_BYTES));
+        iov_from_buf(in_iov, in_num, 0, handler->serial, size);
+        in->status = VIRTIO_BLK_S_OK;
+        break;
+    }
+    case VIRTIO_BLK_T_DISCARD:
+    case VIRTIO_BLK_T_WRITE_ZEROES:
+        if (!handler->writable) {
+            in->status = VIRTIO_BLK_S_IOERR;
+            break;
+        }
+        in->status = virtio_blk_discard_write_zeroes(handler, out_iov,
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
index 0000000000..1c7a5e32ad
--- /dev/null
+++ b/block/export/virtio-blk-handler.h
@@ -0,0 +1,37 @@
+/*
+ * Handler for virtio-blk I/O
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
+typedef struct {
+    BlockBackend *blk;
+    const char *serial;
+    uint32_t logical_block_size;
+    bool writable;
+} VirtioBlkHandler;
+
+int coroutine_fn virtio_blk_process_req(VirtioBlkHandler *handler,
+                                        struct iovec *in_iov,
+                                        struct iovec *out_iov,
+                                        unsigned int in_num,
+                                        unsigned int out_num);
+
+#endif /* VIRTIO_BLK_HANDLER_H */
-- 
2.20.1


