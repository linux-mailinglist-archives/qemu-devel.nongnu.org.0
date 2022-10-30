Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CB461297C
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 10:34:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op4h7-0003xF-S9; Sun, 30 Oct 2022 05:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1op4h0-0003wo-Dr; Sun, 30 Oct 2022 05:33:22 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1op4gy-0000mD-0s; Sun, 30 Oct 2022 05:33:22 -0400
Received: by mail-pl1-x631.google.com with SMTP id l2so8377551pld.13;
 Sun, 30 Oct 2022 02:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDw3cznZc0f+eBouF5z7mgqI44gifZLBNWO26L9o9pI=;
 b=g3v+wUyghytDZKDVUEOOTaxSE+89WMKAHiiNTsc7ckMXAQBiMSv1TiBgCin/Yp4Nik
 U9aQQq0Ns1sZWJ6cRbd0TsHxDb5Tth6aslrPjhkrfyWZQtuRD9AUh+pYDsNxCIVKHB5T
 Q8ZwJqAA5TD7rtswg34b3ID9Mq0wpoDGJa9nrLORIZkhgLqPo65wbyuAMwYcrdeJu72i
 S7Cds6SVuBafjFcNdR+C0i1vQu+50ebdRqxISiuqp5ZXjcwJJ+uoOItdevfoTX+n1cQ7
 KUlyzZ4mvYLCBjhq3OHdgIFQY9AIcNvfy68RQr2cHuuToZsiRP2p05plx3dI+ubJmsil
 mx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eDw3cznZc0f+eBouF5z7mgqI44gifZLBNWO26L9o9pI=;
 b=OFA7mRIZ4nQGy3RqPIY7+mJtglBr6Z0ehbGSV/BzYh5Mta8D/dtCV8bUbfBse0xZIv
 WzJd/9EeogGLOOcD0hNmUSkgF7CXXOfanRM4OFVeV6MRJdkavweb7bkqeQ4xjGm6rhUL
 p5HZcB3HmNfZhytrIzjAttmEFTQHjJAyaqJUoTB6SxOy/TUZGFFtmZVwqW7k2dS9pm7K
 LVoRegLs0q35FswganT277Qyxz/goj1QCI64oERE07Q/f4XldwDSyIv3irjp5G+I0kwN
 5DU0rG4ISJ+likjb/knfVV5fdJknVipxQ5f5SImPa+nsqyHbbI22HTF2z7uaazhAlFBh
 SO3Q==
X-Gm-Message-State: ACrzQf2ZGkcMM4XELP3Dg+ajUrVVwVbQfAYu0iSR+Eo5rJNdi+/1hKqg
 unC+oly/htnFZBLAQ30/0+hyR9QuzKsbnhL6
X-Google-Smtp-Source: AMsMyM7hOWAH8hlTH2bfshqUxpp1DVnbNppAUksyF8asxns9+QPbIyG+uGQQ5H/Gof0SyjJBiPr8dQ==
X-Received: by 2002:a17:902:aa94:b0:183:f6ff:f5ba with SMTP id
 d20-20020a170902aa9400b00183f6fff5bamr8418109plr.81.1667122397796; 
 Sun, 30 Oct 2022 02:33:17 -0700 (PDT)
Received: from fedora.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0d4100b00205db4ff6dfsm2113445pju.46.2022.10.30.02.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 02:33:17 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 damien.lemoal@opensource.wdc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 2/3] virtio-blk: add zoned storage emulation for zoned devices
Date: Sun, 30 Oct 2022 05:32:41 -0400
Message-Id: <20221030093242.208839-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221030093242.208839-1-faithilikerun@gmail.com>
References: <20221030093242.208839-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This patch extends virtio-blk emulation to handle zoned device commands
by calling the new block layer APIs to perform zoned device I/O on
behalf of the guest. It supports Report Zone, four zone oparations (open,
close, finish, reset), and Append Zone.

The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
support zoned block devices. Regular block devices(conventional zones)
will not be set.

The guest os can use blktests, fio to test those commands on zoned devices.
Furthermore, using zonefs to test zone append write is also supported.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 hw/block/virtio-blk-common.c |   2 +
 hw/block/virtio-blk.c        | 387 +++++++++++++++++++++++++++++++++++
 2 files changed, 389 insertions(+)

diff --git a/hw/block/virtio-blk-common.c b/hw/block/virtio-blk-common.c
index ac52d7c176..e2f8e2f6da 100644
--- a/hw/block/virtio-blk-common.c
+++ b/hw/block/virtio-blk-common.c
@@ -29,6 +29,8 @@ static const VirtIOFeature feature_sizes[] = {
      .end = endof(struct virtio_blk_config, discard_sector_alignment)},
     {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
      .end = endof(struct virtio_blk_config, write_zeroes_may_unmap)},
+    {.flags = 1ULL << VIRTIO_BLK_F_ZONED,
+     .end = endof(struct virtio_blk_config, zoned)},
     {}
 };
 
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 8131ec2dbc..4f3625840a 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -26,6 +26,9 @@
 #include "hw/virtio/virtio-blk.h"
 #include "dataplane/virtio-blk.h"
 #include "scsi/constants.h"
+#if defined(CONFIG_BLKZONED)
+#include <linux/blkzoned.h>
+#endif
 #ifdef __linux__
 # include <scsi/sg.h>
 #endif
@@ -592,6 +595,332 @@ err:
     return err_status;
 }
 
+typedef struct ZoneCmdData {
+    VirtIOBlockReq *req;
+    union {
+        struct {
+            unsigned int nr_zones;
+            BlockZoneDescriptor *zones;
+        } zone_report_data;
+        struct {
+            int64_t offset;
+        } zone_append_data;
+    };
+} ZoneCmdData;
+
+/*
+ * check zoned_request: error checking before issuing requests. If all checks
+ * passed, return true.
+ * append: true if only zone append requests issued.
+ */
+static bool check_zoned_request(VirtIOBlock *s, int64_t offset, int64_t len,
+                             bool append, uint8_t *status) {
+    BlockDriverState *bs = blk_bs(s->blk);
+    int index = offset / bs->bl.zone_size;
+
+    if (offset < 0 || len < 0 || offset > (bs->total_sectors << BDRV_SECTOR_BITS) - len) {
+        *status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        return false;
+    }
+
+    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
+        *status = VIRTIO_BLK_S_UNSUPP;
+        return false;
+    }
+
+    if (append) {
+        if ((offset % bs->bl.write_granularity) != 0) {
+            *status = VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
+            return false;
+        }
+
+        if (BDRV_ZT_IS_CONV(bs->bl.wps->wp[index])) {
+            *status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+            return false;
+        }
+
+        if (len / 512 > bs->bl.max_append_sectors) {
+            if (bs->bl.max_append_sectors == 0) {
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
+    int64_t zrp_size, n, j = 0;
+    int64_t nz = data->zone_report_data.nr_zones;
+    int8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (ret) {
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    struct virtio_blk_zone_report zrp_hdr = (struct virtio_blk_zone_report) {
+            .nr_zones = cpu_to_le64(nz),
+    };
+    zrp_size = sizeof(struct virtio_blk_zone_report)
+               + sizeof(struct virtio_blk_zone_descriptor) * nz;
+    n = iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr));
+    if (n != sizeof(zrp_hdr)) {
+        virtio_error(vdev, "Driver provided intput buffer that is too small!");
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    for (size_t i = sizeof(zrp_hdr); i < zrp_size;
+        i += sizeof(struct virtio_blk_zone_descriptor), ++j) {
+        struct virtio_blk_zone_descriptor desc =
+            (struct virtio_blk_zone_descriptor) {
+                .z_start = cpu_to_le64(data->zone_report_data.zones[j].start
+                    >> BDRV_SECTOR_BITS),
+                .z_cap = cpu_to_le64(data->zone_report_data.zones[j].cap
+                    >> BDRV_SECTOR_BITS),
+                .z_wp = cpu_to_le64(data->zone_report_data.zones[j].wp
+                    >> BDRV_SECTOR_BITS),
+        };
+
+        switch (data->zone_report_data.zones[j].type) {
+        case BLK_ZT_CONV:
+            desc.z_type = VIRTIO_BLK_ZT_CONV;
+            break;
+        case BLK_ZT_SWR:
+            desc.z_type = VIRTIO_BLK_ZT_SWR;
+            break;
+        case BLK_ZT_SWP:
+            desc.z_type = VIRTIO_BLK_ZT_SWP;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        switch (data->zone_report_data.zones[j].state) {
+        case BLK_ZS_RDONLY:
+            desc.z_state = VIRTIO_BLK_ZS_RDONLY;
+            break;
+        case BLK_ZS_OFFLINE:
+            desc.z_state = VIRTIO_BLK_ZS_OFFLINE;
+            break;
+        case BLK_ZS_EMPTY:
+            desc.z_state = VIRTIO_BLK_ZS_EMPTY;
+            break;
+        case BLK_ZS_CLOSED:
+            desc.z_state = VIRTIO_BLK_ZS_CLOSED;
+            break;
+        case BLK_ZS_FULL:
+            desc.z_state = VIRTIO_BLK_ZS_FULL;
+            break;
+        case BLK_ZS_EOPEN:
+            desc.z_state = VIRTIO_BLK_ZS_EOPEN;
+            break;
+        case BLK_ZS_IOPEN:
+            desc.z_state = VIRTIO_BLK_ZS_IOPEN;
+            break;
+        case BLK_ZS_NOT_WP:
+            desc.z_state = VIRTIO_BLK_ZS_NOT_WP;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        /* TODO: it takes O(n^2) time complexity. Optimizations required. */
+        n = iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
+        if (n != sizeof(desc)) {
+            virtio_error(vdev, "Driver provided input buffer "
+                               "for descriptors that is too small!");
+            err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        }
+    }
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data->zone_report_data.zones);
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_report(VirtIOBlockReq *req)
+{
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    unsigned int nr_zones;
+    ZoneCmdData *data;
+    int64_t zone_size, offset;
+    uint8_t err_status;
+
+    if (req->in_len < sizeof(struct virtio_blk_inhdr) +
+            sizeof(struct virtio_blk_zone_report) +
+            sizeof(struct virtio_blk_zone_descriptor)) {
+        virtio_error(vdev, "in buffer too small for zone report");
+        return -1;
+    }
+
+    /* start byte offset of the zone report */
+    offset = virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECTOR_BITS;
+    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
+        goto out;
+    }
+    nr_zones = (req->in_len - sizeof(struct virtio_blk_inhdr) -
+                sizeof(struct virtio_blk_zone_report)) /
+               sizeof(struct virtio_blk_zone_descriptor);
+
+    zone_size = sizeof(BlockZoneDescriptor) * nr_zones;
+    data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
+    data->zone_report_data.nr_zones = nr_zones;
+    data->zone_report_data.zones = g_malloc(zone_size),
+
+    blk_aio_zone_report(s->blk, offset, &data->zone_report_data.nr_zones,
+                        data->zone_report_data.zones,
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
+static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
+{
+    ZoneCmdData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+    int8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (ret) {
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+    }
+
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
+{
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    BlockDriverState *bs = blk_bs(s->blk);
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECTOR_BITS;
+    uint64_t len;
+    uint64_t capacity = bs->total_sectors << BDRV_SECTOR_BITS;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    uint32_t type = virtio_ldl_p(vdev, &req->out.type);
+    if (type == VIRTIO_BLK_T_ZONE_RESET_ALL) {
+        /* Entire drive capacity */
+        offset = 0;
+        len = capacity;
+    } else {
+        if (bs->bl.zone_size > capacity - offset) {
+            /* The zoned device allows the last smaller zone. */
+            len = capacity - bs->bl.zone_size * (bs->bl.nr_zones - 1);
+        } else {
+            len = bs->bl.zone_size;
+        }
+    }
+
+    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
+        goto out;
+    }
+
+    ZoneCmdData *data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
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
+static void virtio_blk_zone_append_complete(void *opaque, int ret)
+{
+    ZoneCmdData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
+    int64_t append_sector, n;
+    struct iovec *out_iov = req->elem.out_sg;
+    unsigned out_num = req->elem.out_num;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (ret) {
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    virtio_stl_p(vdev, &append_sector,
+                 data->zone_append_data.offset >> BDRV_SECTOR_BITS);
+    n = iov_to_buf(out_iov, out_num, 0, &append_sector, sizeof(append_sector));
+    if (n != sizeof(append_sector)) {
+        virtio_error(vdev, "Driver provided input buffer less than size of "
+                           "append_sector");
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
+                                         struct iovec *out_iov,
+                                         uint64_t niov) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECTOR_BITS;
+    int64_t len = iov_size(out_iov, niov);
+
+    if (!check_zoned_request(s, offset, len, true, &err_status)) {
+        goto out;
+    }
+
+    ZoneCmdData *data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
+    data->zone_append_data.offset = offset;
+    qemu_iovec_init_external(&req->qiov, out_iov, niov);
+    blk_aio_zone_append(s->blk, &data->zone_append_data.offset, &req->qiov, 0,
+                        virtio_blk_zone_append_complete, data);
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
@@ -678,6 +1007,24 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
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
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
+        break;
     case VIRTIO_BLK_T_SCSI_CMD:
         virtio_blk_handle_scsi(req);
         break;
@@ -696,6 +1043,13 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         virtio_blk_free_request(req);
         break;
     }
+    case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
+        /*
+         * It is not safe to access req->elem.out_sg directly because it
+         * may be modified by virtio_blk_handle_request().
+         */
+        virtio_blk_handle_zone_append(req, out_iov, out_num);
+        break;
     /*
      * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defined with
      * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch statement,
@@ -895,6 +1249,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
     BlockConf *conf = &s->conf.conf;
+    BlockDriverState *bs = blk_bs(s->blk);
     struct virtio_blk_config blkcfg;
     uint64_t capacity;
     int64_t length;
@@ -954,6 +1309,30 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
         blkcfg.write_zeroes_may_unmap = 1;
         virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
     }
+    if (bs->bl.zoned != BLK_Z_NONE) {
+        switch (bs->bl.zoned) {
+        case BLK_Z_HM:
+            blkcfg.zoned.model = VIRTIO_BLK_Z_HM;
+            break;
+        case BLK_Z_HA:
+            blkcfg.zoned.model = VIRTIO_BLK_Z_HA;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
+                     bs->bl.zone_size / 512);
+        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
+                     bs->bl.max_active_zones);
+        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
+                     bs->bl.max_open_zones);
+        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
+        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
+                     bs->bl.max_append_sectors);
+    } else {
+        blkcfg.zoned.model = VIRTIO_BLK_Z_NONE;
+    }
     memcpy(config, &blkcfg, s->config_size);
 }
 
@@ -1118,6 +1497,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOBlock *s = VIRTIO_BLK(dev);
     VirtIOBlkConf *conf = &s->conf;
+    BlockDriverState *bs = blk_bs(conf->conf.blk);
     Error *err = NULL;
     unsigned i;
 
@@ -1163,6 +1543,13 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (bs->bl.zoned != BLK_Z_NONE) {
+        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
+        if (bs->bl.zoned == BLK_Z_HM) {
+            virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_DISCARD);
+        }
+    }
+
     if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD) &&
         (!conf->max_discard_sectors ||
          conf->max_discard_sectors > BDRV_REQUEST_MAX_SECTORS)) {
-- 
2.38.1


