Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482186C80A5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:02:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pff5P-0003Ft-H8; Fri, 24 Mar 2023 06:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pff53-0003EU-6o; Fri, 24 Mar 2023 06:55:33 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pff4H-0000qd-TT; Fri, 24 Mar 2023 06:55:32 -0400
Received: by mail-pf1-f178.google.com with SMTP id dw14so988569pfb.6;
 Fri, 24 Mar 2023 03:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679655269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ndBDr/zFeh0RMjD6v3yNcN9LNQI/fMto1wPl1SoEh2M=;
 b=oK9hRc16n3yDvRcRJWQZ3pivFHqojEe/h2UXB90sHL/dMIFeITngnnk/L/7z0Mi8Ho
 S76l/rmF4+USUmIMCaeFHoG2X5F9yN73DMkjMnxEvqdba3fzAger1mPG2fLhYQSVQ32E
 oVBK8U6//vqpWhL0fPqU376iBG8d4CXA28R0AMjYOC2sLXRH8jFqNpKk7+dMa6EMXKtn
 D51x51QfQNobciO0jZHKMg2pq6Bd1wHY0ekALsQkTdCvB9ypl9JcEHeOJdBj45NaWav/
 3QvcOLM0sMfyHk7EFOwlNS3UD1EwntHfm9U4WLO5tKWKFjoTwPZki6rRXcG6YZGXukrX
 lx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679655269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndBDr/zFeh0RMjD6v3yNcN9LNQI/fMto1wPl1SoEh2M=;
 b=oUjkHYE1wrdjIG45Khc9lDfwkvMi0tosoYsPDjC1/sPy0ErM7YilWh50RHturs2x0v
 d5qYnGeCbDWyJsorBTgJBt1qRvZehHgjHST8xSP+TL3BLTn7aOOeDK/kY6MOPXEHk3t5
 gTIJFNz3pTMANK2oa76e+dlJYIO4NFWtce0ESlpoBf1QTvP5+zadbP+x5tFYTxauaKkY
 i/88rVchOeU3X2o71Hfw+qzB0s9r16ZMg539oYyGQu/nbNpriOLhqzDaIyNzqnATWJpb
 rofgQnln556W3ribYvcYp/pQjEOtvTmpUi6VPAAMZuK9Xz3qNsq4ppgUJ/G64mEK7ooy
 qTTw==
X-Gm-Message-State: AAQBX9cBF7k4k2i+T3uiQLx08X7u5hSwaeoGzIqG7sA+sV39Bb/CvXXo
 diGv5w5DULg/j652CkrqbXd7qwRYXDCr9Z1M
X-Google-Smtp-Source: AKy350ZpK1RngwjRGtwzuDVfNxI1/KCkyk7NtpNQDqPuwul2y/CTaZmKO5r1OwkRcH0CZiEqvAPCGA==
X-Received: by 2002:aa7:950d:0:b0:625:e728:4c5f with SMTP id
 b13-20020aa7950d000000b00625e7284c5fmr2577761pfp.22.1679655267433; 
 Fri, 24 Mar 2023 03:54:27 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 bn10-20020a056a00324a00b005d72e54a7e1sm13617355pfb.215.2023.03.24.03.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 03:54:26 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, stefanha@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 damien.lemoal@opensource.wdc.com, hare@suse.de, kvm@vger.kernel.org,
 Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 4/5] virtio-blk: add some trace events for zoned emulation
Date: Fri, 24 Mar 2023 18:54:17 +0800
Message-Id: <20230324105418.3752-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.178;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-f178.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/trace-events |  7 +++++++
 hw/block/virtio-blk.c | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/hw/block/trace-events b/hw/block/trace-events
index 2c45a62bd5..34be8b9135 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -44,9 +44,16 @@ pflash_write_unknown(const char *name, uint8_t cmd) "%s: unknown command 0x%02x"
 # virtio-blk.c
 virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
 virtio_blk_rw_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
+virtio_blk_zone_report_complete(void *vdev, void *req, unsigned int nr_zones, int ret) "vdev %p req %p nr_zones %u ret %d"
+virtio_blk_zone_mgmt_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
+virtio_blk_zone_append_complete(void *vdev, void *req, int64_t sector, int ret) "vdev %p req %p, append sector 0x%" PRIx64 " ret %d"
 virtio_blk_handle_write(void *vdev, void *req, uint64_t sector, size_t nsectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
 virtio_blk_handle_read(void *vdev, void *req, uint64_t sector, size_t nsectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
 virtio_blk_submit_multireq(void *vdev, void *mrb, int start, int num_reqs, uint64_t offset, size_t size, bool is_write) "vdev %p mrb %p start %d num_reqs %d offset %"PRIu64" size %zu is_write %d"
+virtio_blk_handle_zone_report(void *vdev, void *req, int64_t sector, unsigned int nr_zones) "vdev %p req %p sector 0x%" PRIx64 " nr_zones %u"
+virtio_blk_handle_zone_mgmt(void *vdev, void *req, uint8_t op, int64_t sector, int64_t len) "vdev %p req %p op 0x%x sector 0x%" PRIx64 " len 0x%" PRIx64 ""
+virtio_blk_handle_zone_reset_all(void *vdev, void *req, int64_t sector, int64_t len) "vdev %p req %p sector 0x%" PRIx64 " cap 0x%" PRIx64 ""
+virtio_blk_handle_zone_append(void *vdev, void *req, int64_t sector) "vdev %p req %p, append sector 0x%" PRIx64 ""
 
 # hd-geometry.c
 hd_geometry_lchs_guess(void *blk, int cyls, int heads, int secs) "blk %p LCHS %d %d %d"
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 0d85c2c9b0..2afd5cf96c 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -676,6 +676,7 @@ static void virtio_blk_zone_report_complete(void *opaque, int ret)
     int64_t nz = data->zone_report_data.nr_zones;
     int8_t err_status = VIRTIO_BLK_S_OK;
 
+    trace_virtio_blk_zone_report_complete(vdev, req, nz, ret);
     if (ret) {
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
         goto out;
@@ -792,6 +793,8 @@ static void virtio_blk_handle_zone_report(VirtIOBlockReq *req,
     nr_zones = (req->in_len - sizeof(struct virtio_blk_inhdr) -
                 sizeof(struct virtio_blk_zone_report)) /
                sizeof(struct virtio_blk_zone_descriptor);
+    trace_virtio_blk_handle_zone_report(vdev, req,
+                                        offset >> BDRV_SECTOR_BITS, nr_zones);
 
     zone_size = sizeof(BlockZoneDescriptor) * nr_zones;
     data = g_malloc(sizeof(ZoneCmdData));
@@ -814,7 +817,9 @@ static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
 {
     VirtIOBlockReq *req = opaque;
     VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
     int8_t err_status = VIRTIO_BLK_S_OK;
+    trace_virtio_blk_zone_mgmt_complete(vdev, req,ret);
 
     if (ret) {
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
@@ -841,6 +846,8 @@ static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
         /* Entire drive capacity */
         offset = 0;
         len = capacity;
+        trace_virtio_blk_handle_zone_reset_all(vdev, req, 0,
+                                               bs->total_sectors);
     } else {
         if (bs->bl.zone_size > capacity - offset) {
             /* The zoned device allows the last smaller zone. */
@@ -848,6 +855,9 @@ static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
         } else {
             len = bs->bl.zone_size;
         }
+        trace_virtio_blk_handle_zone_mgmt(vdev, req, op,
+                                          offset >> BDRV_SECTOR_BITS,
+                                          len >> BDRV_SECTOR_BITS);
     }
 
     if (!check_zoned_request(s, offset, len, false, &err_status)) {
@@ -888,6 +898,7 @@ static void virtio_blk_zone_append_complete(void *opaque, int ret)
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
         goto out;
     }
+    trace_virtio_blk_zone_append_complete(vdev, req, append_sector, ret);
 
 out:
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
@@ -909,6 +920,7 @@ static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
     int64_t offset = virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECTOR_BITS;
     int64_t len = iov_size(out_iov, out_num);
 
+    trace_virtio_blk_handle_zone_append(vdev, req, offset >> BDRV_SECTOR_BITS);
     if (!check_zoned_request(s, offset, len, true, &err_status)) {
         goto out;
     }
-- 
2.39.2


