Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52280650877
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:18:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7BKv-0001uX-N2; Mon, 19 Dec 2022 03:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BKq-0001sC-Kh; Mon, 19 Dec 2022 03:17:21 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BKo-0002ty-Tg; Mon, 19 Dec 2022 03:17:20 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so8149595pjm.2; 
 Mon, 19 Dec 2022 00:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8H1c2Ure1/8pJ9W78K1OzkelttIaBl9DqqeNszHkhU=;
 b=SUh6M3r7gT4VehtEIdIzWkXZRc+lpmShiC5RCTrMMUKPmTYBse6Az3jS6I2Qyus4Sy
 Idq38rCi/RuYJoPJviqvuRVoBYPDgHyCdqouG2TEZRSG4/fjTKeD6YrgTeq+xusvdm2E
 IrfqFPbgIRFVYSMB3MJKlAY8BgwP8fxRWjqjjCWWZwcAQGpT7KlT+o9dukX8uIIy6fws
 HNvYTz9lLF+2KQIjQDH4zUFjAm1VudVdUbP5ISZg0v0BhJJiLM06o6UleS0S3CNbl5jS
 ixi9nlsT7kgrcthY50wHaeRZNnOFwwBhzHS+G3OtZI7gIyGIDr6ejqo63graovZI6VYM
 yBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8H1c2Ure1/8pJ9W78K1OzkelttIaBl9DqqeNszHkhU=;
 b=DhSzK6YX0zZeXCso9j34i4ZLnVGCV1Ck4FOmifR9qmFPmlEx2P+DzIrNDciuAsD/QG
 9lHxw06hNE/32KsoLHe/shGNIj1uXGQ37Vh+OCMeRzHHkFDR4Kt4RCUXHCBdLOzig6Na
 lROjxH24KgvT491CtPcAvW20aOk311hFefU3LYIAL7FvXPhBC+N7b6TZwvphyCdkyH4/
 LgPSxaRfi5O+Ya4FiXlwlviYn0I66oYZJhnLINPAEvIzUcViWLOqve0Y47pPqimeYhlF
 cL0xkHXmnWDIeOLR94uRS2zUr0J2PVlWIUQgVZFARS6bNQZxDccbcp1IjFGVukRrE4/e
 YhLw==
X-Gm-Message-State: ANoB5pkV3Ea+a/Ksit7yC70EKWmuaUcAx4QR+r8NoOY3+sDjGcE7BfK2
 UCg/fgea2TgjmpTOCw8KfityMNV7zScPC4j3
X-Google-Smtp-Source: AA0mqf4ysXMRJs6jKnNN6JYdljKgwqjSIOJcLni4I3DvlsFeTVFoLVsdoTdnrg1d1u5Hj1+kzmg26w==
X-Received: by 2002:a17:902:8349:b0:189:bc50:b93b with SMTP id
 z9-20020a170902834900b00189bc50b93bmr40103607pln.3.1671437836376; 
 Mon, 19 Dec 2022 00:17:16 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170903234a00b00177fb862a87sm6434337plh.20.2022.12.19.00.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 00:17:16 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 hare@suse.de, qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, dmitry.fomichev@wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 3/3] virtio-blk: add some trace events for zoned emulation
Date: Mon, 19 Dec 2022 16:16:44 +0800
Message-Id: <20221219081644.11790-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219081644.11790-1-faithilikerun@gmail.com>
References: <20221219081644.11790-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1036.google.com
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
index 2157157e7d..f79b5cbb59 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -672,6 +672,7 @@ static void virtio_blk_zone_report_complete(void *opaque, int ret)
     int64_t nz = data->zone_report_data.nr_zones;
     int8_t err_status = VIRTIO_BLK_S_OK;
 
+    trace_virtio_blk_zone_report_complete(vdev, req, nz, ret);
     if (ret) {
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
         goto out;
@@ -786,6 +787,8 @@ static int virtio_blk_handle_zone_report(VirtIOBlockReq *req)
     nr_zones = (req->in_len - sizeof(struct virtio_blk_inhdr) -
                 sizeof(struct virtio_blk_zone_report)) /
                sizeof(struct virtio_blk_zone_descriptor);
+    trace_virtio_blk_handle_zone_report(vdev, req,
+                                        offset >> BDRV_SECTOR_BITS, nr_zones);
 
     zone_size = sizeof(BlockZoneDescriptor) * nr_zones;
     data = g_malloc(sizeof(ZoneCmdData));
@@ -810,7 +813,9 @@ static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
 {
     VirtIOBlockReq *req = opaque;
     VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
     int8_t err_status = VIRTIO_BLK_S_OK;
+    trace_virtio_blk_zone_mgmt_complete(vdev, req,ret);
 
     if (ret) {
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
@@ -837,6 +842,8 @@ static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
         /* Entire drive capacity */
         offset = 0;
         len = capacity;
+        trace_virtio_blk_handle_zone_reset_all(vdev, req, 0,
+                                               bs->total_sectors);
     } else {
         if (bs->bl.zone_size > capacity - offset) {
             /* The zoned device allows the last smaller zone. */
@@ -844,6 +851,9 @@ static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
         } else {
             len = bs->bl.zone_size;
         }
+        trace_virtio_blk_handle_zone_mgmt(vdev, req, op,
+                                          offset >> BDRV_SECTOR_BITS,
+                                          len >> BDRV_SECTOR_BITS);
     }
 
     if (!check_zoned_request(s, offset, len, false, &err_status)) {
@@ -887,6 +897,7 @@ static void virtio_blk_zone_append_complete(void *opaque, int ret)
         err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
         goto out;
     }
+    trace_virtio_blk_zone_append_complete(vdev, req, append_sector, ret);
 
 out:
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
@@ -906,6 +917,7 @@ static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
     int64_t offset = virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECTOR_BITS;
     int64_t len = iov_size(out_iov, niov);
 
+    trace_virtio_blk_handle_zone_append(vdev, req, offset >> BDRV_SECTOR_BITS);
     if (!check_zoned_request(s, offset, len, true, &err_status)) {
         goto out;
     }
-- 
2.38.1


