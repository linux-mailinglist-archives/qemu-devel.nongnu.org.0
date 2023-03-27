Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0AC6CB08E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguFW-0005YB-Op; Mon, 27 Mar 2023 17:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pguFV-0005SB-8l
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pguFT-0006Qf-EW
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679951966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EUNEg0AHOdn9sZbXKspq0J3uKT4fneMMtplIqYVEtzk=;
 b=Q9wV+KIn2Uqb/QfRZtpjIJTxxTx6Sq4X8hUs08Eu264YJ7Mk1aEB5BXCjvUfV791B1KjCr
 IkwJe26m7i1UVmDHDifq7UBGJ39bNo0LzRaGOEkRLoSBg8Vu8XBNuZM8fjkOdG8g/9XQvI
 qkKZcq3kbLIDab2+ag4Ag3MoakPWW9k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-Zt3mJXj_PSG-bT0T1m9O8A-1; Mon, 27 Mar 2023 17:19:24 -0400
X-MC-Unique: Zt3mJXj_PSG-bT0T1m9O8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 314E5887409;
 Mon, 27 Mar 2023 21:19:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BDFA140E949;
 Mon, 27 Mar 2023 21:19:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Coiby Xu <Coiby.Xu@gmail.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH for-8.0] block/export: fix assume_graph_lock() assertion
 failure
Date: Mon, 27 Mar 2023 17:19:21 -0400
Message-Id: <20230327211921.1612727-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When I/O request parameters are validated for virtio-blk exports like
vhost-user-blk and vduse-blk, we call blk_get_geometry() from a
coroutine. This hits an assume_graph_lock() assertion failure.

Use blk_co_nb_sectors() instead and mark virtio_blk_sect_range_ok() with
coroutine_fn.

This assertion failure is triggered by any I/O to a vhost-user-blk
export.

Fixes: 8ab8140a04cf ("block: Mark bdrv_co_refresh_total_sectors() and callers GRAPH_RDLOCK")
Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/virtio-blk-handler.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/export/virtio-blk-handler.c b/block/export/virtio-blk-handler.c
index 313666e8ab..2f729a9ce2 100644
--- a/block/export/virtio-blk-handler.c
+++ b/block/export/virtio-blk-handler.c
@@ -22,8 +22,9 @@ struct virtio_blk_inhdr {
     unsigned char status;
 };
 
-static bool virtio_blk_sect_range_ok(BlockBackend *blk, uint32_t block_size,
-                                     uint64_t sector, size_t size)
+static bool coroutine_fn
+virtio_blk_sect_range_ok(BlockBackend *blk, uint32_t block_size,
+                         uint64_t sector, size_t size)
 {
     uint64_t nb_sectors;
     uint64_t total_sectors;
@@ -41,7 +42,7 @@ static bool virtio_blk_sect_range_ok(BlockBackend *blk, uint32_t block_size,
     if ((sector << VIRTIO_BLK_SECTOR_BITS) % block_size) {
         return false;
     }
-    blk_get_geometry(blk, &total_sectors);
+    total_sectors = blk_co_nb_sectors(blk);
     if (sector > total_sectors || nb_sectors > total_sectors - sector) {
         return false;
     }
-- 
2.39.2


