Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628732B39F6
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:45:00 +0100 (CET)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQlX-0008J1-ES
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQV0-0000bN-GQ
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUy-0001aO-2l
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sj68cdCA9LyFZYlFjD9WVlfQAIJDumEclBu2gkC8660=;
 b=AAF5jKdK6I5l5ZYKWGW0xBn9BDq+n6Cy0WXjC9dcM2sa4/z/ueqRyAdUUEDxmCruVPMJpl
 fVes4o0u7waORvxtyGnCov9N5/ycZkntGXq6v0MZX+MQWx9IBi2ndC3fXY8emGDEf6utux
 YNcR2Iq6ljZr853UjyKQxu6z5rt2FUM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-6x-Xy6o5O32hhgL6BcrgHA-1; Sun, 15 Nov 2020 17:27:49 -0500
X-MC-Unique: 6x-Xy6o5O32hhgL6BcrgHA-1
Received: by mail-wr1-f72.google.com with SMTP id z7so8646532wrl.14
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sj68cdCA9LyFZYlFjD9WVlfQAIJDumEclBu2gkC8660=;
 b=ANC7ezmUR8wG0NnX8PTHu+32IR+BBtDj/2ZbETmGHCR+IWDncmin+3K9CLcTgLdHx+
 DZVI89VKVZbhOnKG53VqQNkUBg1gswrhqQjB/Y6biT8xvsmmKzgPPzucjlWPK7yfh/1S
 XdZYU+G1vHkNeQ3zh90hrIJDhWRB5tDA6vo9OdCkxz1W0Lx3VFFk+sSBLef/3zppGxUO
 3G/CdV4dBwvUCY1Jo5gKJRGjXiGqKT9Ma6PZ+szi70c4ylDFdroSz41K+2eUhzJIatE/
 S0NeYc52LwewosIblTMqG8ke0DeFxC5POn6fy0W0mHeYP0nf5k9CPVo5qbgkzOMY5Q0o
 DWLQ==
X-Gm-Message-State: AOAM530D4Uk8DMb/c3ijC1MR7n4SLwP/aAf46BEQ+6P/2DDCc6TozqkU
 329NGhuVYVnxh1CPOTnchRUei45DuUAcsJVyIqIohQlowygcadW6TBq9zzOZ4pDumZKQSDYWU6Y
 LHs+z6nVleClQTbqJHDMkAWFMFNEJngUzlLOQYAt95v0PLRT7jWV3KcQJ0bzU
X-Received: by 2002:adf:f00f:: with SMTP id j15mr16318561wro.102.1605479267624; 
 Sun, 15 Nov 2020 14:27:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJFkyqk6CGEvE7AFiICdAlqODMsjeeNCqRzN3uytBRK/aH3+s782aVIvmhFVnXwozAp1r8Dw==
X-Received: by 2002:adf:f00f:: with SMTP id j15mr16318539wro.102.1605479267400; 
 Sun, 15 Nov 2020 14:27:47 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id v67sm18150973wma.17.2020.11.15.14.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:46 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] block/export: port virtio-blk discard/write zeroes
 input validation
Message-ID: <20201115220740.488850-14-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 17:27:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Validate discard/write zeroes the same way we do for virtio-blk. Some of
these checks are mandated by the VIRTIO specification, others are
internal to QEMU.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201111124331.1393747-9-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 block/export/vhost-user-blk-server.c | 115 +++++++++++++++++++++------
 1 file changed, 92 insertions(+), 23 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 62672d1cb9..3295d3c951 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -22,6 +22,8 @@
 
 enum {
     VHOST_USER_BLK_NUM_QUEUES_DEFAULT = 1,
+    VHOST_USER_BLK_MAX_DISCARD_SECTORS = 32768,
+    VHOST_USER_BLK_MAX_WRITE_ZEROES_SECTORS = 32768,
 };
 struct virtio_blk_inhdr {
     unsigned char status;
@@ -58,30 +60,101 @@ static void vu_blk_req_complete(VuBlkReq *req)
     free(req);
 }
 
+static bool vu_blk_sect_range_ok(VuBlkExport *vexp, uint64_t sector,
+                                 size_t size)
+{
+    uint64_t nb_sectors = size >> BDRV_SECTOR_BITS;
+    uint64_t total_sectors;
+
+    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
+        return false;
+    }
+    if ((sector << BDRV_SECTOR_BITS) % vexp->blk_size) {
+        return false;
+    }
+    blk_get_geometry(vexp->export.blk, &total_sectors);
+    if (sector > total_sectors || nb_sectors > total_sectors - sector) {
+        return false;
+    }
+    return true;
+}
+
 static int coroutine_fn
-vu_blk_discard_write_zeroes(BlockBackend *blk, struct iovec *iov,
+vu_blk_discard_write_zeroes(VuBlkExport *vexp, struct iovec *iov,
                             uint32_t iovcnt, uint32_t type)
 {
+    BlockBackend *blk = vexp->export.blk;
     struct virtio_blk_discard_write_zeroes desc;
-    ssize_t size = iov_to_buf(iov, iovcnt, 0, &desc, sizeof(desc));
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
     if (unlikely(size != sizeof(desc))) {
-        error_report("Invalid size %zd, expect %zu", size, sizeof(desc));
-        return -EINVAL;
+        error_report("Invalid size %zd, expected %zu", size, sizeof(desc));
+        return VIRTIO_BLK_S_IOERR;
     }
 
-    uint64_t range[2] = { le64_to_cpu(desc.sector) << 9,
-                          le32_to_cpu(desc.num_sectors) << 9 };
-    if (type == VIRTIO_BLK_T_DISCARD) {
-        if (blk_co_pdiscard(blk, range[0], range[1]) == 0) {
-            return 0;
+    sector = le64_to_cpu(desc.sector);
+    num_sectors = le32_to_cpu(desc.num_sectors);
+    flags = le32_to_cpu(desc.flags);
+    max_sectors = (type == VIRTIO_BLK_T_WRITE_ZEROES) ?
+                  VHOST_USER_BLK_MAX_WRITE_ZEROES_SECTORS :
+                  VHOST_USER_BLK_MAX_DISCARD_SECTORS;
+
+    /* This check ensures "num_sectors << BDRV_SECTOR_BITS" fits in an int */
+    if (unlikely(num_sectors > max_sectors)) {
+        return VIRTIO_BLK_S_IOERR;
+    }
+
+    bytes = num_sectors << BDRV_SECTOR_BITS;
+
+    if (unlikely(!vu_blk_sect_range_ok(vexp, sector, bytes))) {
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
         }
-    } else if (type == VIRTIO_BLK_T_WRITE_ZEROES) {
-        if (blk_co_pwrite_zeroes(blk, range[0], range[1], 0) == 0) {
-            return 0;
+
+        if (blk_co_pwrite_zeroes(blk, sector << BDRV_SECTOR_BITS,
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
+        if (blk_co_pdiscard(blk, sector << BDRV_SECTOR_BITS, bytes) == 0) {
+            return VIRTIO_BLK_S_OK;
         }
     }
 
-    return -EINVAL;
+    return VIRTIO_BLK_S_IOERR;
 }
 
 static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
@@ -170,19 +243,13 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
     }
     case VIRTIO_BLK_T_DISCARD:
     case VIRTIO_BLK_T_WRITE_ZEROES: {
-        int rc;
-
         if (!vexp->writable) {
             req->in->status = VIRTIO_BLK_S_IOERR;
             break;
         }
 
-        rc = vu_blk_discard_write_zeroes(blk, &elem->out_sg[1], out_num, type);
-        if (rc == 0) {
-            req->in->status = VIRTIO_BLK_S_OK;
-        } else {
-            req->in->status = VIRTIO_BLK_S_IOERR;
-        }
+        req->in->status = vu_blk_discard_write_zeroes(vexp, elem->out_sg,
+                                                      out_num, type);
         break;
     }
     default:
@@ -352,10 +419,12 @@ vu_blk_initialize_config(BlockDriverState *bs,
     config->min_io_size = cpu_to_le16(1);
     config->opt_io_size = cpu_to_le32(1);
     config->num_queues = cpu_to_le16(num_queues);
-    config->max_discard_sectors = cpu_to_le32(32768);
+    config->max_discard_sectors =
+        cpu_to_le32(VHOST_USER_BLK_MAX_DISCARD_SECTORS);
     config->max_discard_seg = cpu_to_le32(1);
     config->discard_sector_alignment = cpu_to_le32(config->blk_size >> 9);
-    config->max_write_zeroes_sectors = cpu_to_le32(32768);
+    config->max_write_zeroes_sectors
+        = cpu_to_le32(VHOST_USER_BLK_MAX_WRITE_ZEROES_SECTORS);
     config->max_write_zeroes_seg = cpu_to_le32(1);
 }
 
-- 
MST


