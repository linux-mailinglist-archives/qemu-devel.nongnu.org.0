Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F8600086
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 17:16:45 +0200 (CEST)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok5Nc-0001Jc-5C
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 11:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok5Cp-0005wf-G1; Sun, 16 Oct 2022 11:05:37 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok5Cj-0006vV-PP; Sun, 16 Oct 2022 11:05:32 -0400
Received: by mail-pg1-x532.google.com with SMTP id b5so8423946pgb.6;
 Sun, 16 Oct 2022 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9e2F8Y8kHv7zoD07yM+MZ+BZj9d3vnrbKTBXfgAgnOY=;
 b=X7OdBxcFQh1tP/R3MRSc+cRcPM262PQoverCL34DNuDCi1tXozP+WkOS63QA8E/jLp
 6I6ufauX9CJvXqZN1X0VUirfYJKEPKoEtneC4PjeSsbaJT1z1McuGc2YXbzzVLP3qZ+K
 +4mk0OHuH23BX/fan1ifHdqUx70yW+HXv38bFQMQDu2AXWbIZAcifietRvgJmMDQvtwz
 S14g71KmEGzNICpdlg1e6i2hTSfFscixJNTcprXFU7SHj/DvimPTvR9RDF5BPrK4AWTH
 j7jciAz0Dr9evIv5k5sNtZ/9MaeaHLb+kFBsp46y1PMPhOsg9dAID3cYcUpR8utBrHeN
 kjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9e2F8Y8kHv7zoD07yM+MZ+BZj9d3vnrbKTBXfgAgnOY=;
 b=bJ7GQjGT7B7UzKukUXO0XP6qqGRL9hezN+SXB6umLMZtWQ5V5rrIxs3+ssKo+NA/pA
 rRC1pW11w5XVS0nnxFMQpr/u9aseJi3FWtOAX6Z82m3HaGY0X53mYPibUTh9Y3xvIojj
 X57Ue6aZDt0tEwDgV2HSZAnTLk0wIrd3zpT+chTqtuqK+5Nli+k6lXv95lqutYPCnc8F
 z+oxzXwgsfe7CX+5IIQdjfWg9O9/qIwPnklUreUdmj/AfoNI4eDyPSdyOxC5CkC8+ZPD
 0nf/hcC+BSSZ0NsOyvpZR/ty6D9sIKGvYKDLXZsSeonzD1IE2Va89FykKgcsLcNB1xwN
 dKMw==
X-Gm-Message-State: ACrzQf33jHAaJ+95EehGOC28hNa37x6QUDQiWsmDy1QT+cdlLwVz5CkQ
 wMzVvmRktnSIh3VSL6eOtskawPCEhkbOEA==
X-Google-Smtp-Source: AMsMyM7KFAi0a4K4/G6Bwp5+5MWV1XJsyMly6cjIMPhHPKEupoeT6+JUARUnD54qQQ15bPvGGKYFwQ==
X-Received: by 2002:a05:6a00:234d:b0:561:f0c3:cde1 with SMTP id
 j13-20020a056a00234d00b00561f0c3cde1mr7784286pfj.34.1665932727787; 
 Sun, 16 Oct 2022 08:05:27 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 184-20020a6217c1000000b005623a138583sm5166707pfx.124.2022.10.16.08.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 08:05:27 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 hare@suse.de, qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 2/2] virtio-blk: add zoned storage emulation for zoned devices
Date: Sun, 16 Oct 2022 23:05:06 +0800
Message-Id: <20221016150506.172675-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016150506.172675-1-faithilikerun@gmail.com>
References: <20221016150506.172675-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x532.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch extends virtio-blk emulation to handle zoned device commands
by calling the new block layer APIs to perform zoned device I/O on
behalf of the guest. It supports Report Zone, four zone oparations (open,
close, finish, reset), and Append Zone.

The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
support zoned block devices. Regular block devices(conventional zones)
will not be set.

Then the guest os can use blkzone(8) to test those commands on zoned devices.
Furthermore, using zonefs to test zone append write is also supported.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 hw/block/virtio-blk-common.c   |   2 +
 hw/block/virtio-blk.c          | 412 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-blk.h |  11 +-
 3 files changed, 422 insertions(+), 3 deletions(-)

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
index 8131ec2dbc..58891aea31 100644
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
@@ -55,10 +58,29 @@ static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
 {
     VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    int64_t inhdr_len, n;
+    void *buf;
 
     trace_virtio_blk_req_complete(vdev, req, status);
 
-    stb_p(&req->in->status, status);
+    iov_discard_undo(&req->inhdr_undo);
+    if (virtio_ldl_p(vdev, &req->out.type) == VIRTIO_BLK_T_ZONE_APPEND) {
+        inhdr_len = sizeof(struct virtio_blk_zone_append_inhdr);
+        req->in.in_hdr->status = status;
+        buf = req->in.in_hdr;
+    } else {
+        inhdr_len = sizeof(struct virtio_blk_inhdr);
+        req->in.zone_append_inhdr->status = status;
+        buf = req->in.zone_append_inhdr;
+    }
+
+    n = iov_from_buf(req->elem.in_sg, req->elem.in_num,
+                     req->in_len - inhdr_len, buf, inhdr_len);
+    if (n != inhdr_len) {
+        virtio_error(vdev, "Driver provided input buffer less than size of "
+                     "in header");
+    }
+
     iov_discard_undo(&req->inhdr_undo);
     iov_discard_undo(&req->outhdr_undo);
     virtqueue_push(req->vq, &req->elem, req->in_len);
@@ -592,6 +614,334 @@ err:
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
+    if (offset < 0 || len < 0 || offset > bs->bl.capacity - len) {
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
+    int64_t zrp_size, nz, n, j = 0;
+    int8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (ret) {
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    nz = data->zone_report_data.nr_zones;
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
+    for (size_t i = sizeof(zrp_hdr); i < zrp_size;
+        i += sizeof(struct virtio_blk_zone_descriptor), ++j) {
+        struct virtio_blk_zone_descriptor desc =
+            (struct virtio_blk_zone_descriptor) {
+                .z_start = cpu_to_le64(data->zone_report_data.zones[j].start)
+                    >> BDRV_SECTOR_BITS,
+                .z_cap = cpu_to_le64(data->zone_report_data.zones[j].cap)
+                    >> BDRV_SECTOR_BITS,
+                .z_wp = cpu_to_le64(data->zone_report_data.zones[j].wp)
+                    >> BDRV_SECTOR_BITS,
+        };
+
+        switch (data->zone_report_data.zones[j].type) {
+        case BLK_ZT_CONV:
+            desc.z_type = BLK_ZONE_TYPE_CONVENTIONAL;
+            break;
+        case BLK_ZT_SWR:
+            desc.z_type = BLK_ZONE_TYPE_SEQWRITE_REQ;
+            break;
+        case BLK_ZT_SWP:
+            desc.z_type = BLK_ZONE_TYPE_SEQWRITE_PREF;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        switch (data->zone_report_data.zones[j].cond) {
+        case BLK_ZS_RDONLY:
+            desc.z_state = BLK_ZONE_COND_READONLY;
+            break;
+        case BLK_ZS_OFFLINE:
+            desc.z_state = BLK_ZONE_COND_OFFLINE;
+            break;
+        case BLK_ZS_EMPTY:
+            desc.z_state = BLK_ZONE_COND_EMPTY;
+            break;
+        case BLK_ZS_CLOSED:
+            desc.z_state = BLK_ZONE_COND_CLOSED;
+            break;
+        case BLK_ZS_FULL:
+            desc.z_state = BLK_ZONE_COND_FULL;
+            break;
+        case BLK_ZS_EOPEN:
+            desc.z_state = BLK_ZONE_COND_EXP_OPEN;
+            break;
+        case BLK_ZS_IOPEN:
+            desc.z_state = BLK_ZONE_COND_IMP_OPEN;
+            break;
+        case BLK_ZS_NOT_WP:
+            desc.z_state = BLK_ZONE_COND_NOT_WP;
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
+    offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
+    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
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
+static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
+{
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    BlockDriverState *bs = blk_bs(s->blk);
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
+    uint64_t len;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    uint32_t type = virtio_ldl_p(vdev, &req->out.type);
+    if (type == VIRTIO_BLK_T_ZONE_RESET_ALL) {
+        /* Entire drive capacity */
+        offset = 0;
+        len = bs->bl.capacity;
+    } else {
+        if (bs->bl.zone_size > bs->bl.capacity - offset) {
+            /* The zoned device allows the last smaller zone. */
+            len = bs->bl.capacity - bs->bl.zone_size * (bs->bl.nr_zones - 1);
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
+    struct iovec *in_iov = req->elem.in_sg;
+    unsigned in_num = req->elem.in_num;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (ret) {
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    struct virtio_blk_zone_append_inhdr zap_hdr =
+        (struct virtio_blk_zone_append_inhdr) {
+        .append_sector = cpu_to_le64(data->zone_append_data.offset
+            >> BDRV_SECTOR_BITS),
+    };
+    iov_from_buf(in_iov, in_num, 0, &zap_hdr, sizeof(zap_hdr));
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
+static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
+                                         struct iovec *out_iov,
+                                         uint64_t niov) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
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
@@ -624,7 +974,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
 
     /* We always touch the last byte, so just see how big in_iov is.  */
     req->in_len = iov_size(in_iov, in_num);
-    req->in = (void *)in_iov[in_num - 1].iov_base
+    req->in.in_hdr = (void *)in_iov[in_num - 1].iov_base
               + in_iov[in_num - 1].iov_len
               - sizeof(struct virtio_blk_inhdr);
     iov_discard_back_undoable(in_iov, &in_num, sizeof(struct virtio_blk_inhdr),
@@ -678,6 +1028,24 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
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
@@ -696,6 +1064,13 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
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
@@ -895,6 +1270,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
     BlockConf *conf = &s->conf.conf;
+    BlockDriverState *bs = blk_bs(s->blk);
     struct virtio_blk_config blkcfg;
     uint64_t capacity;
     int64_t length;
@@ -954,6 +1330,30 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
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
 
@@ -1118,6 +1518,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOBlock *s = VIRTIO_BLK(dev);
     VirtIOBlkConf *conf = &s->conf;
+    BlockDriverState *bs = blk_bs(conf->conf.blk);
     Error *err = NULL;
     unsigned i;
 
@@ -1163,6 +1564,13 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
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
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index d311c57cca..88901a9f55 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -30,6 +30,12 @@ struct virtio_blk_inhdr
     unsigned char status;
 };
 
+struct virtio_blk_zone_append_inhdr {
+    unsigned char status;
+    uint8_t reserved[7];
+    int64_t append_sector;
+};
+
 #define VIRTIO_BLK_AUTO_NUM_QUEUES UINT16_MAX
 
 struct VirtIOBlkConf
@@ -73,7 +79,10 @@ typedef struct VirtIOBlockReq {
     VirtQueue *vq;
     IOVDiscardUndo inhdr_undo;
     IOVDiscardUndo outhdr_undo;
-    struct virtio_blk_inhdr *in;
+    union {
+        struct virtio_blk_inhdr *in_hdr;
+        struct virtio_blk_zone_append_inhdr *zone_append_inhdr;
+    } in;
     struct virtio_blk_outhdr out;
     QEMUIOVector qiov;
     size_t in_len;
-- 
2.37.3


