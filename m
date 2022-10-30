Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D52E61297B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 10:34:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op4hc-00041V-Kj; Sun, 30 Oct 2022 05:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1op4h9-0003yE-Lm; Sun, 30 Oct 2022 05:33:36 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1op4h6-0000mQ-2V; Sun, 30 Oct 2022 05:33:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso13480306pjg.5; 
 Sun, 30 Oct 2022 02:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMwC0K4PsRrQP3rpYiwpRQ7xJrrJ0aJem8BSMOC/Wnk=;
 b=KbDYFN6ugjEuOxr5YELTByUG08kni8Vs4oDHtpmnvbCW/cUq/2E+2Ks1uUA4U7/Tr5
 FqCDbn2JABmw0fRNmHBbRjAh+S/+F7xI7hOey7WcKxi5OmDwLxDqyK4OojQQ41k8rJxO
 VL/1UZ2eDa5BnpG9DEakbLMKEsoWOiyux5E/LegKjZ0ul5X9I1auT8Ed9Q7dcPQtEZ2t
 rgkiKmUcg0SK+Q89pIDj8DPpIJUEnhDeyaEyMMelcMLh0JAUGik0SafRcmMXCMxEdGRD
 cCsyZ+ePS1xMrQox1Z3Hjqby4C8lxiDE1Vc8L05N4EoHwAKPblYU7gVuUUaEvp6KoCVE
 yISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMwC0K4PsRrQP3rpYiwpRQ7xJrrJ0aJem8BSMOC/Wnk=;
 b=NzihBqZHVblY2n5L7lGWm9ixOFywJsTw+zDR/RnpbZ7oSTHl5S3prT8hlrefVgPEd1
 Nu49tbWZcQH/Sy4CW9+Ak/Zwu6HkqTRqz5Jmu2J6vJa+LoYgUE/WYv2xmPqrX/Cw7/xc
 oAV5oDw5PEtM9LInqiKC+bpbjhbo7NQxZnAkssnAlzsxhrUOPONQ5pPTG1mrxuxPtZNK
 zoqi7ln2WuEXN7LW7jCqIlOiTvZfoPb9vfsJQukLcj7gxr1pus2SOyqpZKd1MAmOnr4i
 Hzq66/cC7qRlcEPX7ZDQEYPBtgvs0nDoBb1liYJUXBPJt0GZMXQkUs5YsS/grHQxmGkP
 9DGQ==
X-Gm-Message-State: ACrzQf3h6f251/9KtsIEeFv2pbiLMgqcjrBv14ofza7dl0v5qFU2JDFq
 8JgdNhJ8/sD/3eoARLOCUPzyV4DRBPJXmtf3
X-Google-Smtp-Source: AMsMyM797oAnLQPBbxVhWGeRkULwN+ct+TxRK4zsg3+OUsDvxhjwinxC1QK6wlPWRzDyBivANZy88w==
X-Received: by 2002:a17:902:e1ca:b0:186:878e:3b03 with SMTP id
 t10-20020a170902e1ca00b00186878e3b03mr8593573pla.95.1667122405057; 
 Sun, 30 Oct 2022 02:33:25 -0700 (PDT)
Received: from fedora.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0d4100b00205db4ff6dfsm2113445pju.46.2022.10.30.02.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 02:33:24 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 damien.lemoal@opensource.wdc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 3/3] virtio-blk: add some trace events for zoned emulation
Date: Sun, 30 Oct 2022 05:32:42 -0400
Message-Id: <20221030093242.208839-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221030093242.208839-1-faithilikerun@gmail.com>
References: <20221030093242.208839-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1034.google.com
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

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 hw/block/trace-events |  7 +++++++
 hw/block/virtio-blk.c | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/hw/block/trace-events b/hw/block/trace-events
index 2c45a62bd5..f47da6fcd4 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -44,9 +44,16 @@ pflash_write_unknown(const char *name, uint8_t cmd) "%s: unknown command 0x%02x"
 # virtio-blk.c
 virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
 virtio_blk_rw_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
+virtio_blk_zone_report_complete(void *vdev, void *req, unsigned int nr_zones, int ret) "vdev %p req %p nr_zones %d ret %d"
+virtio_blk_zone_mgmt_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
+virtio_blk_zone_append_complete(void *vdev, void *req, int64_t sector, int ret) "vdev %p req %p, append sector 0x%" PRIx64 " ret %d"
 virtio_blk_handle_write(void *vdev, void *req, uint64_t sector, size_t nsectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
 virtio_blk_handle_read(void *vdev, void *req, uint64_t sector, size_t nsectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
 virtio_blk_submit_multireq(void *vdev, void *mrb, int start, int num_reqs, uint64_t offset, size_t size, bool is_write) "vdev %p mrb %p start %d num_reqs %d offset %"PRIu64" size %zu is_write %d"
+virtio_blk_handle_zone_report(void *vdev, void *req, int64_t sector, unsigned int nr_zones) "vdev %p req %p sector 0x%" PRIx64 " nr_zones %d"
+virtio_blk_handle_zone_mgmt(void *vdev, void *req, uint8_t op, int64_t sector, int64_t len) "vdev %p req %p op 0x%x sector 0x%" PRIx64 " len 0x%" PRIx64 ""
+virtio_blk_handle_zone_reset_all(void *vdev, void *req, int64_t sector, int64_t len) "vdev %p req %p sector 0x%" PRIx64 " cap 0x%" PRIx64 ""
+virtio_blk_handle_zone_append(void *vdev, void *req, int64_t sector) "vdev %p req %p, append sector 0x%" PRIx64 ""
 
 # hd-geometry.c
 hd_geometry_lchs_guess(void *blk, int cyls, int heads, int secs) "blk %p LCHS %d %d %d"
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 4f3625840a..e7d85dc049 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -663,6 +663,7 @@ static void virtio_blk_zone_report_complete(void *opaque, int ret)
     int64_t nz = data->zone_report_data.nr_zones;
     int8_t err_status = VIRTIO_BLK_S_OK;
 
+    trace_virtio_blk_zone_report_complete(vdev, req, nz, ret);
     if (ret) {
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
         goto out;
@@ -777,6 +778,8 @@ static int virtio_blk_handle_zone_report(VirtIOBlockReq *req)
     nr_zones = (req->in_len - sizeof(struct virtio_blk_inhdr) -
                 sizeof(struct virtio_blk_zone_report)) /
                sizeof(struct virtio_blk_zone_descriptor);
+    trace_virtio_blk_handle_zone_report(vdev, req,
+                                        offset >> BDRV_SECTOR_BITS, nr_zones);
 
     zone_size = sizeof(BlockZoneDescriptor) * nr_zones;
     data = g_malloc(sizeof(ZoneCmdData));
@@ -802,7 +805,9 @@ static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
     ZoneCmdData *data = opaque;
     VirtIOBlockReq *req = data->req;
     VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
     int8_t err_status = VIRTIO_BLK_S_OK;
+    trace_virtio_blk_zone_mgmt_complete(vdev, req,ret);
 
     if (ret) {
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
@@ -830,6 +835,8 @@ static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
         /* Entire drive capacity */
         offset = 0;
         len = capacity;
+        trace_virtio_blk_handle_zone_reset_all(vdev, req, 0,
+                                               bs->total_sectors);
     } else {
         if (bs->bl.zone_size > capacity - offset) {
             /* The zoned device allows the last smaller zone. */
@@ -837,6 +844,9 @@ static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
         } else {
             len = bs->bl.zone_size;
         }
+        trace_virtio_blk_handle_zone_mgmt(vdev, req, op,
+                                          offset >> BDRV_SECTOR_BITS,
+                                          len >> BDRV_SECTOR_BITS);
     }
 
     if (!check_zoned_request(s, offset, 0, false, &err_status)) {
@@ -882,6 +892,7 @@ static void virtio_blk_zone_append_complete(void *opaque, int ret)
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
         goto out;
     }
+    trace_virtio_blk_zone_append_complete(vdev, req, append_sector, ret);
 
 out:
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
@@ -901,6 +912,7 @@ static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
     int64_t offset = virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECTOR_BITS;
     int64_t len = iov_size(out_iov, niov);
 
+    trace_virtio_blk_handle_zone_append(vdev, req, offset >> BDRV_SECTOR_BITS);
     if (!check_zoned_request(s, offset, len, true, &err_status)) {
         goto out;
     }
-- 
2.38.1


