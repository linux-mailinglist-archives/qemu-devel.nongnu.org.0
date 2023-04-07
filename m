Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49576DAA0D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 10:27:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkhQ8-0006hE-Sy; Fri, 07 Apr 2023 04:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhQ0-0006bO-D0; Fri, 07 Apr 2023 04:26:00 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhPy-00027y-5e; Fri, 07 Apr 2023 04:25:59 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-62a4f92df49so67377b3a.2; 
 Fri, 07 Apr 2023 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680855956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFQYzCuQqjUCmNdy2otsNBUG58kSnk4Io7tjAVnpFxI=;
 b=R0pLbr45y8D1hS0yOcwU0hAmCr8Zl54N/Oe7UWe7rbpu4zKMIhvOPyu5LHJIxoeN40
 zix46J2Kp4c5/nbXsJW5JjH514QTjkS0G2POIMlo8aAl56KnCpjhy1XKLC9rl7BxbTW4
 DDih1x2PeIiFrojFwz3t3ZsveJXqGEqVwtuHO/TE0JHnIb1CEOaoACuERPX5f+O8Coxr
 dupgZqSG2e++B3QO0JS4Qwtz79FjpT48tbG86bmgmWeGHlR5MLH9TyrelDZAIRnuNI8P
 dETFe06RS1FlKF6mO0ymy1/nixt0bmECaXrTxFpdftXXysXTZKIPJGWTufi4h/Y6JmHI
 +N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680855956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YFQYzCuQqjUCmNdy2otsNBUG58kSnk4Io7tjAVnpFxI=;
 b=ezBMP5+Cx6a1FkZDeMkOsZC6dnuldZArzb/R7slOYP5H0O4ELyuknaztyLiOV4SkCk
 zbqvo/6tUjqIWPPNxc8EWDA41IJStz6qze/Su/OdK/5jLr+YnynqlfQzrtKP7k3Slub7
 zxAiL6E//TjdnYik49ndCXmZXRoLxqUmSzfq59H0m9BxEy0iQ/+5hBl8yJpZSRZHhGRH
 /Iws5wrl1NzUsDSUFCYtpGCMorn5SecqvIE6MCcD5RqzHRkTQp4rGbeu0ZSd+7tDxYE0
 aAM1eTTpneXI3/bKF8mQ3IBp423aewH9rM3DHP4qz0KwUjh/DRmJSCtqODrbIzjEUwkh
 j/kg==
X-Gm-Message-State: AAQBX9d6COsavOr0Q9csiBZVHhoB0Rg7+JDEUr4MAbahcfRMPVOE3knS
 UxnHl6gFOChSlpM1d6n032lx0mNg2Enoxkju
X-Google-Smtp-Source: AKy350awMh4TxBBAq2SdYykbeiIeU6Dl+Cm/1pp67wXyBFrkSZrAtuiTClgP0Ibm1U64HgO4vG3H6g==
X-Received: by 2002:aa7:9556:0:b0:62d:b4ae:b83d with SMTP id
 w22-20020aa79556000000b0062db4aeb83dmr1562736pfq.28.1680855955710; 
 Fri, 07 Apr 2023 01:25:55 -0700 (PDT)
Received: from fedlinux.. ([106.84.131.166]) by smtp.gmail.com with ESMTPSA id
 fe12-20020a056a002f0c00b0062dcaa50a9asm2521331pfb.58.2023.04.07.01.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 01:25:55 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 "Michael S. Tsirkin" <mst@redhat.com>, dmitry.fomichev@wdc.com,
 kvm@vger.kernel.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 4/5] virtio-blk: add some trace events for zoned emulation
Date: Fri,  7 Apr 2023 16:25:27 +0800
Message-Id: <20230407082528.18841-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407082528.18841-1-faithilikerun@gmail.com>
References: <20230407082528.18841-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42c.google.com
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
index a9d3168770..7a66056c71 100644
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


