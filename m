Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D4D32F0B4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:07:56 +0100 (CET)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDve-0003po-VL
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkO-00070s-8o
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk7-0007DQ-92
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eet3n/021fv+L94DuLLb7j/q/JB9sGru4YNamDcBqHo=;
 b=F9XVHRWQpimKrG0MHK654NnznR8l7TDWEIvGBaGUchYKpF7l8ST0LZZxPjzWyKwOiJbAxi
 9wb/3Nw7H+Bdlqii7nxc8AFki27xF4dfBdu74qLkjiXruqkXu/7anp2aU1CecIU9qSgoqu
 5pM0o9B40t5ToQqjBe9sMrsxMPRGDZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-bZPzuGEjOmeHyG1viczPJA-1; Fri, 05 Mar 2021 11:55:55 -0500
X-MC-Unique: bZPzuGEjOmeHyG1viczPJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC0ADDF8DF;
 Fri,  5 Mar 2021 16:55:33 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A87F360C43;
 Fri,  5 Mar 2021 16:55:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/31] block/export: use VIRTIO_BLK_SECTOR_BITS
Date: Fri,  5 Mar 2021 17:54:42 +0100
Message-Id: <20210305165454.356840-20-kwolf@redhat.com>
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

Use VIRTIO_BLK_SECTOR_BITS and VIRTIO_BLK_SECTOR_SIZE when dealing with
virtio-blk sector numbers. Although the values happen to be the same as
BDRV_SECTOR_BITS and BDRV_SECTOR_SIZE, they are conceptually different.
This makes it clearer when we are dealing with virtio-blk sector units.

Use VIRTIO_BLK_SECTOR_BITS in vu_blk_initialize_config(). Later patches
will use it the new constants the virtqueue request processing code
path.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210223144653.811468-9-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vhost-user-blk-server.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 7aea132f69..2614a63791 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -20,6 +20,13 @@
 #include "sysemu/block-backend.h"
 #include "util/block-helpers.h"
 
+/*
+ * Sector units are 512 bytes regardless of the
+ * virtio_blk_config->blk_size value.
+ */
+#define VIRTIO_BLK_SECTOR_BITS 9
+#define VIRTIO_BLK_SECTOR_SIZE (1ull << VIRTIO_BLK_SECTOR_BITS)
+
 enum {
     VHOST_USER_BLK_NUM_QUEUES_DEFAULT = 1,
 };
@@ -347,7 +354,8 @@ vu_blk_initialize_config(BlockDriverState *bs,
                          uint32_t blk_size,
                          uint16_t num_queues)
 {
-    config->capacity = cpu_to_le64(bdrv_getlength(bs) >> BDRV_SECTOR_BITS);
+    config->capacity =
+        cpu_to_le64(bdrv_getlength(bs) >> VIRTIO_BLK_SECTOR_BITS);
     config->blk_size = cpu_to_le32(blk_size);
     config->size_max = cpu_to_le32(0);
     config->seg_max = cpu_to_le32(128 - 2);
@@ -356,7 +364,8 @@ vu_blk_initialize_config(BlockDriverState *bs,
     config->num_queues = cpu_to_le16(num_queues);
     config->max_discard_sectors = cpu_to_le32(32768);
     config->max_discard_seg = cpu_to_le32(1);
-    config->discard_sector_alignment = cpu_to_le32(blk_size >> 9);
+    config->discard_sector_alignment =
+        cpu_to_le32(blk_size >> VIRTIO_BLK_SECTOR_BITS);
     config->max_write_zeroes_sectors = cpu_to_le32(32768);
     config->max_write_zeroes_seg = cpu_to_le32(1);
 }
@@ -383,7 +392,7 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     if (vu_opts->has_logical_block_size) {
         logical_block_size = vu_opts->logical_block_size;
     } else {
-        logical_block_size = BDRV_SECTOR_SIZE;
+        logical_block_size = VIRTIO_BLK_SECTOR_SIZE;
     }
     check_block_size(exp->id, "logical-block-size", logical_block_size,
                      &local_err);
-- 
2.29.2


