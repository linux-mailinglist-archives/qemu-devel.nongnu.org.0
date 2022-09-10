Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07FC5B44D7
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 08:58:29 +0200 (CEST)
Received: from localhost ([::1]:49928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWuRh-00053u-08
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 02:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWuLt-0007NN-Tk; Sat, 10 Sep 2022 02:52:29 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWuLr-0000TX-Gt; Sat, 10 Sep 2022 02:52:29 -0400
Received: by mail-pg1-x531.google.com with SMTP id t65so3533400pgt.2;
 Fri, 09 Sep 2022 23:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=l+Wv0PEoPDYhfP1+4cEC0e+SVrAljhWHmfN7jwX/ym0=;
 b=LIXtkruwnNZ+VEYss6FAlrbJhXBCz/9Vv4vgBsF73dLz1KbEGylXhB5NAJ7jNNcZmW
 wDybX17GaBrSXrJ19wqRjFNGW5FoDu+dkemqHYNPsHHQ3BUHi4FAdz3wRTMtHGhUUNGe
 NbJZO7kOut1yeDPBLVaAMA96dDpqF6xksYMdGMNL8aknKm6N93q68FB7kqEXSYkCLk5k
 t/vlYnPnRjqyI4KOkhxJGyA5n3cOJgcqqCKZfui4wLZecZosUFX3RLaBI7gmsX79hCFh
 HFlIgfV/KDaXFRSQ5iWE31yvOePKEagh/+0x/oiwr44lUgXo2+8KChdCIyp29+AFy2iB
 sqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=l+Wv0PEoPDYhfP1+4cEC0e+SVrAljhWHmfN7jwX/ym0=;
 b=VpLYFE6iWJYbfji5BoGQ6murWovin5HqsmjszX9tbq0myphgekKp1OD5bThPAxRq+5
 lqpYXMiT7oBKecSJX/5hqENfz2KPGiNUoUTOXWH4Bw4VddgQdUrQnyAnv8JF4Z68XfGx
 Cy3avWvbGYlSQ/MTNsvA9VUtxEq/CrT7Zo/seyozQg6aDlNcqzGvwm4lSUWkW3Di+UlR
 MJtRYKPU8AVTmzOIqEqDClWnRAoN0gzEAlZoXTzmkeR2SJUbaMgFZP305t0H73G3G1y3
 qgfpypnTqakHASrgM+8AIfNWyPOVTTaXHP74uuGio84c7D/JXQ3SZSUDhhuvPdPwzURN
 JgdQ==
X-Gm-Message-State: ACgBeo0RoFKCnQZzmNKLR3/0Ivu5Zs0iwawkRK6tGqFmT8qZdMAAR88C
 JOlIt5GsxsI5Y2J7Z/4NDcZ/Ro2+TXt4tg==
X-Google-Smtp-Source: AA6agR6+uvcfBpWEZO6aTn84+dnlMVN8LVWkvsmV7g1Q/jxTvrYMLpP9itW54X59lkic7bkDxIN8eA==
X-Received: by 2002:a63:dd51:0:b0:430:18d9:edf8 with SMTP id
 g17-20020a63dd51000000b0043018d9edf8mr14904840pgj.163.1662792745429; 
 Fri, 09 Sep 2022 23:52:25 -0700 (PDT)
Received: from roots.. ([183.221.93.83]) by smtp.gmail.com with ESMTPSA id
 l62-20020a622541000000b0053e6b092294sm890908pfl.212.2022.09.09.23.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 23:52:25 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH 2/2] virtio-blk: add zoned storage emulation for zoned devices
Date: Sat, 10 Sep 2022 14:50:57 +0800
Message-Id: <20220910065057.35017-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220910065057.35017-1-faithilikerun@gmail.com>
References: <20220910065057.35017-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch extends virtio-blk emulation to handle zoned device commands
by calling the new block layer APIs to perform zoned device I/O on
behalf of the guest. It supports Report Zone, four zone oparations (open,
close, finish, reset), and Append Zone.

The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
support zoned block devices. Regular block devices(conventional zones)
will not be set.

The guest os having zoned device support can use blkzone(8) to test those
commands. Furthermore, using zonefs to test zone append write is also
supported.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 hw/block/virtio-blk.c | 326 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 326 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..3ef74c01db 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -46,6 +46,8 @@ static const VirtIOFeature feature_sizes[] = {
      .end = endof(struct virtio_blk_config, discard_sector_alignment)},
     {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
      .end = endof(struct virtio_blk_config, write_zeroes_may_unmap)},
+    {.flags = 1ULL << VIRTIO_BLK_F_ZONED,
+     .end = endof(struct virtio_blk_config, zoned)},
     {}
 };
 
@@ -614,6 +616,273 @@ err:
     return err_status;
 }
 
+typedef struct ZoneCmdData {
+    VirtIOBlockReq *req;
+    union {
+        struct {
+            unsigned int nr_zones;
+            BlockZoneDescriptor *zones;
+        } ZoneReportData;
+        struct {
+            int64_t append_sector;
+        } ZoneAppendData;
+    };
+} ZoneCmdData;
+
+/*
+ * check zone_model: error checking before issuing requests. If all checks
+ * passed, return true.
+ * append: true if only zone append request issued.
+ */
+static bool check_zone_model(VirtIOBlock *s, int64_t sector, int64_t nr_sector,
+                             bool append, uint8_t *status) {
+    BlockDriverState *bs = blk_bs(s->blk);
+    BlockZoneDescriptor *zone = &bs->bl.zones[sector / bs->bl.zone_sectors];
+    int64_t max_append_sector = bs->bl.max_append_sectors;
+
+    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
+        *status = VIRTIO_BLK_S_UNSUPP;
+        return false;
+    }
+
+    if (zone->cond == BLK_ZS_OFFLINE) {
+        *status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        return false;
+    }
+
+    if (append) {
+        if ((zone->type != BLK_ZT_SWR) || (zone->cond == BLK_ZS_RDONLY) ||
+            (sector + nr_sector > (*(zone + 1)).start)) {
+            /* the end sector of the request exceeds to next zone */
+            *status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+            return false;
+        }
+
+        if (nr_sector > max_append_sector) {
+            if (max_append_sector == 0) {
+                *status = VIRTIO_BLK_S_UNSUPP;
+            } else {
+                *status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+            }
+            return false;
+        }
+    }
+    return true;
+}
+
+static void virtio_blk_zone_report_complete(void *opaque, int ret)
+{
+    ZoneCmdData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
+    struct iovec *in_iov = req->elem.in_sg;
+    unsigned in_num = req->elem.in_num;
+    int64_t zrp_size, nz, n, j = 0;
+    int8_t err_status = VIRTIO_BLK_S_OK;
+
+    nz = data->ZoneReportData.nr_zones;
+    struct virtio_blk_zone_report zrp_hdr = (struct virtio_blk_zone_report) {
+            .nr_zones = cpu_to_le64(nz),
+    };
+
+    zrp_size = sizeof(struct virtio_blk_zone_report)
+               + sizeof(struct virtio_blk_zone_descriptor) * nz;
+    n = iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr));
+    if (n != sizeof(zrp_hdr)) {
+        virtio_error(vdev, "Driver provided intput buffer that is too small!");
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    for (size_t i = sizeof(zrp_hdr); i < zrp_size; i += sizeof(struct virtio_blk_zone_descriptor), ++j) {
+        struct virtio_blk_zone_descriptor desc =
+                (struct virtio_blk_zone_descriptor) {
+                        .z_start = cpu_to_le64(data->ZoneReportData.zones[j].start),
+                        .z_cap = cpu_to_le64(data->ZoneReportData.zones[j].cap),
+                        .z_wp = cpu_to_le64(data->ZoneReportData.zones[j].wp),
+                        .z_type = data->ZoneReportData.zones[j].type,
+                        .z_state = data->ZoneReportData.zones[j].cond,
+                };
+        n = iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
+        if (n != sizeof(desc)) {
+            virtio_error(vdev, "Driver provided input buffer "
+                               "for descriptors that is too small!");
+            err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+            goto out;
+        }
+    }
+    goto out;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data->ZoneReportData.zones);
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_report(VirtIOBlockReq *req) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    unsigned int nr_zones;
+    ZoneCmdData *data;
+    int64_t zone_size, offset;
+    uint8_t err_status;
+
+    if (req->in_len <= sizeof(struct virtio_blk_inhdr) +
+                       sizeof(struct virtio_blk_zone_report)) {
+        virtio_error(vdev, "in buffer too small for zone report");
+        return -1;
+    }
+
+    /* start byte offset of the zone report */
+    offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
+    if (!check_zone_model(s, offset / 512, 0, false, &err_status)) {
+        goto out;
+    }
+
+    nr_zones = (req->in_len - sizeof(struct virtio_blk_inhdr) -
+                sizeof(struct virtio_blk_zone_report)) /
+               sizeof(struct virtio_blk_zone_descriptor);
+
+    zone_size = sizeof(BlockZoneDescriptor) * nr_zones;
+    data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
+    data->ZoneReportData.nr_zones = nr_zones;
+    data->ZoneReportData.zones = g_malloc(zone_size),
+
+    blk_aio_zone_report(s->blk, offset, &data->ZoneReportData.nr_zones,
+                        data->ZoneReportData.zones,
+                        virtio_blk_zone_report_complete, data);
+    return 0;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    return err_status;
+}
+
+static void virtio_blk_zone_mgmt_complete(void *opaque, int ret) {
+    ZoneCmdData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    BlockDriverState *bs = blk_bs(s->blk);
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
+    uint64_t len;
+    uint32_t type;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (!check_zone_model(s, offset / 512, 0, false, &err_status)) {
+        goto out;
+    }
+
+    ZoneCmdData *data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
+
+    type = virtio_ldl_p(vdev, &req->out.type);
+    if (type == VIRTIO_BLK_T_ZONE_RESET_ALL) {
+        /* Entire drive capacity */
+        offset = 0;
+        blk_get_geometry(s->blk, &len);
+        len *= 512;
+    } else {
+        len = bs->bl.zone_sectors * 512;
+    }
+
+    blk_aio_zone_mgmt(s->blk, op, offset, len,
+                      virtio_blk_zone_mgmt_complete, data);
+
+    return 0;
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    return err_status;
+}
+
+static void virtio_blk_zone_append_complete(void *opaque, int ret) {
+    ZoneCmdData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
+    int64_t append_sector, n;
+    struct iovec *out_iov = req->elem.out_sg;
+    unsigned out_num = req->elem.out_num;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    append_sector = data->ZoneAppendData.append_sector;
+    int write_granularity = s->conf.conf.logical_block_size;
+    if ((append_sector * 512 % write_granularity) != 0) {
+        err_status = VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
+        goto out;
+    }
+    n = iov_to_buf(out_iov, out_num, 0, &append_sector, sizeof(append_sector));
+    if (n != sizeof(append_sector)) {
+        virtio_error(vdev, "Driver provided input buffer less than size of "
+                     "append_sector");
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+    goto out;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_append(VirtIOBlockReq *req) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    uint64_t niov = req->elem.out_num;
+    struct iovec *out_iov = req->elem.out_sg;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
+    int64_t len = 0;
+    for (int i = 1; i < niov; ++i) {
+        len += out_iov[i].iov_len;
+    }
+
+    if (!check_zone_model(s, offset / 512, len / 512, true, &err_status)) {
+        goto out;
+    }
+
+    ZoneCmdData *data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
+    data->ZoneAppendData.append_sector = offset;
+    qemu_iovec_init_external(&req->qiov, &out_iov[1], niov-1);
+    blk_aio_zone_append(s->blk, &data->ZoneAppendData.append_sector, &req->qiov, 0,
+                        virtio_blk_zone_append_complete, data);
+
+    return 0;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    return err_status;
+}
+
 static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
 {
     uint32_t type;
@@ -700,6 +969,24 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     case VIRTIO_BLK_T_FLUSH:
         virtio_blk_handle_flush(req, mrb);
         break;
+    case VIRTIO_BLK_T_ZONE_REPORT:
+        virtio_blk_handle_zone_report(req);
+        break;
+    case VIRTIO_BLK_T_ZONE_OPEN:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_OPEN);
+        break;
+    case VIRTIO_BLK_T_ZONE_CLOSE:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_CLOSE);
+        break;
+    case VIRTIO_BLK_T_ZONE_FINISH:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
+        break;
+    case VIRTIO_BLK_T_ZONE_RESET:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
+        break;
+    case VIRTIO_BLK_T_ZONE_RESET_ALL:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET_ALL);
+        break;
     case VIRTIO_BLK_T_SCSI_CMD:
         virtio_blk_handle_scsi(req);
         break;
@@ -718,6 +1005,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         virtio_blk_free_request(req);
         break;
     }
+   case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
+       virtio_blk_handle_zone_append(req);
+       break;
     /*
      * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defined with
      * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch statement,
@@ -917,6 +1207,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
     BlockConf *conf = &s->conf.conf;
+    BlockDriverState *state = blk_bs(s->blk);
     struct virtio_blk_config blkcfg;
     uint64_t capacity;
     int64_t length;
@@ -976,6 +1267,31 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
         blkcfg.write_zeroes_may_unmap = 1;
         virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
     }
+#ifdef CONFIG_BLKZONED
+    if (state->bl.zoned != BLK_Z_NONE) {
+        switch (state->bl.zoned) {
+        case BLK_Z_HM:
+            blkcfg.zoned.model = VIRTIO_BLK_Z_HM;
+            virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
+                         state->bl.zone_sectors);
+            virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
+                         state->bl.max_active_zones);
+            virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
+                         state->bl.max_open_zones);
+            virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
+            virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
+                         state->bl.max_append_sectors);
+            break;
+        case BLK_Z_HA:
+            blkcfg.zoned.model = VIRTIO_BLK_Z_HA;
+            break;
+        default:
+            blkcfg.zoned.model = VIRTIO_BLK_Z_NONE;
+            virtio_error(vdev, "Invalid zoned model %x \n", (int)state->bl.zoned);
+            break;
+        }
+    }
+#endif
     memcpy(config, &blkcfg, s->config_size);
 }
 
@@ -995,6 +1311,7 @@ static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
                                         Error **errp)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
+    BlockDriverState *state = blk_bs(s->blk);
 
     /* Firstly sync all virtio-blk possible supported features */
     features |= s->host_features;
@@ -1003,6 +1320,12 @@ static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
     virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
     virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
     virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
+    if (state->bl.zoned != BLK_Z_NONE) {
+        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
+        if (state->bl.zoned == BLK_Z_HM) {
+            virtio_clear_feature(&features, VIRTIO_BLK_F_DISCARD);
+        }
+    }
     if (virtio_has_feature(features, VIRTIO_F_VERSION_1)) {
         if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_SCSI)) {
             error_setg(errp, "Please set scsi=off for virtio-blk devices in order to use virtio 1.0");
@@ -1286,6 +1609,9 @@ static Property virtio_blk_properties[] = {
 #ifdef __linux__
     DEFINE_PROP_BIT64("scsi", VirtIOBlock, host_features,
                       VIRTIO_BLK_F_SCSI, false),
+#endif
+#ifdef CONFIG_BLKZONED
+    DEFINE_PROP_BIT64("zoned", VirtIOBlock, host_features, VIRTIO_BLK_F_ZONED, true),
 #endif
     DEFINE_PROP_BIT("request-merging", VirtIOBlock, conf.request_merging, 0,
                     true),
-- 
2.37.3


