Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF232F0FE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:19:38 +0100 (CET)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIE6z-00028m-DH
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkP-00070w-At
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk5-0007D7-HK
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNzsHHIx58+QMBheKHkUuCRnL0/BzmGRxjdvJTaEdQU=;
 b=Ro8yQuyonebU6Q2IXkEMdHzQvMvirglvQ2XA251pWrDN+XOBxqhoO2Yqxp+S+u1j37F9nU
 qnJvCDuvF8FWESqaLi0H7L5/kUNQi/1kMab+OuEApJ7WpJzfAijhhsFh+4JftVV7hEdvzj
 6gSNQUmOKo7Jk9CoCeVcNshf26imn3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-q9fAAlETNOat5CHMZaPVKA-1; Fri, 05 Mar 2021 11:55:54 -0500
X-MC-Unique: q9fAAlETNOat5CHMZaPVKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FCF4E4961;
 Fri,  5 Mar 2021 16:55:36 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 740EF60C43;
 Fri,  5 Mar 2021 16:55:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/31] block/export: port virtio-blk discard/write zeroes input
 validation
Date: Fri,  5 Mar 2021 17:54:44 +0100
Message-Id: <20210305165454.356840-22-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Validate discard/write zeroes the same way we do for virtio-blk. Some of
these checks are mandated by the VIRTIO specification, others are
internal to QEMU.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210223144653.811468-11-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vhost-user-blk-server.c | 116 +++++++++++++++++++++------
 1 file changed, 93 insertions(+), 23 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index f74796241c..04044228d4 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -29,6 +29,8 @@
 
 enum {
     VHOST_USER_BLK_NUM_QUEUES_DEFAULT = 1,
+    VHOST_USER_BLK_MAX_DISCARD_SECTORS = 32768,
+    VHOST_USER_BLK_MAX_WRITE_ZEROES_SECTORS = 32768,
 };
 struct virtio_blk_inhdr {
     unsigned char status;
@@ -65,30 +67,102 @@ static void vu_blk_req_complete(VuBlkReq *req)
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
+    if ((sector << VIRTIO_BLK_SECTOR_BITS) % vexp->blk_size) {
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
+    /* This check ensures that 'bytes' fits in an int */
+    if (unlikely(num_sectors > max_sectors)) {
+        return VIRTIO_BLK_S_IOERR;
+    }
+
+    bytes = num_sectors << VIRTIO_BLK_SECTOR_BITS;
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
+        }
+
+        if (blk_co_pwrite_zeroes(blk, sector << VIRTIO_BLK_SECTOR_BITS,
+                                 bytes, blk_flags) == 0) {
+            return VIRTIO_BLK_S_OK;
         }
-    } else if (type == VIRTIO_BLK_T_WRITE_ZEROES) {
-        if (blk_co_pwrite_zeroes(blk, range[0], range[1], 0) == 0) {
-            return 0;
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
         }
     }
 
-    return -EINVAL;
+    return VIRTIO_BLK_S_IOERR;
 }
 
 static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
@@ -177,19 +251,13 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
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
+        req->in->status = vu_blk_discard_write_zeroes(vexp, out_iov, out_num,
+                                                      type);
         break;
     }
     default:
@@ -362,11 +430,13 @@ vu_blk_initialize_config(BlockDriverState *bs,
     config->min_io_size = cpu_to_le16(1);
     config->opt_io_size = cpu_to_le32(1);
     config->num_queues = cpu_to_le16(num_queues);
-    config->max_discard_sectors = cpu_to_le32(32768);
+    config->max_discard_sectors =
+        cpu_to_le32(VHOST_USER_BLK_MAX_DISCARD_SECTORS);
     config->max_discard_seg = cpu_to_le32(1);
     config->discard_sector_alignment =
         cpu_to_le32(blk_size >> VIRTIO_BLK_SECTOR_BITS);
-    config->max_write_zeroes_sectors = cpu_to_le32(32768);
+    config->max_write_zeroes_sectors
+        = cpu_to_le32(VHOST_USER_BLK_MAX_WRITE_ZEROES_SECTORS);
     config->max_write_zeroes_seg = cpu_to_le32(1);
 }
 
-- 
2.29.2


