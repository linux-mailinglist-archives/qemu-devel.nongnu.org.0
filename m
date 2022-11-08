Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E986B621E72
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:20:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW0X-0004uV-PH; Tue, 08 Nov 2022 16:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0W-0004sO-0T
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0U-0008Jn-Ij
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8niXQ0M6oTwB9tXPfc7Cn0IZ933zxKEgw2jU2Axalj8=;
 b=JMZlZGB5ttN6+VPKeqsgIs4WLBqBR+KSaVJo+GAhXKJf5o3bvEAC2SEuZmVr2blFCNPpg2
 5rZRvYmIdjr3YewanBohzx71RYtYenDy05zN9dwMbn2HekTrjSPukvST5JORrm3k1ZY4DL
 4z7NdQ9ZjENwJaphWt+L5G8dJmC55vw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-xlxCvilGMl-ygSywgU2CMg-1; Tue, 08 Nov 2022 16:19:38 -0500
X-MC-Unique: xlxCvilGMl-ygSywgU2CMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 680FD858F17;
 Tue,  8 Nov 2022 21:19:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4A7A2166B2C;
 Tue,  8 Nov 2022 21:19:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 2/8] block-backend: enable_write_cache should be atomic
Date: Tue,  8 Nov 2022 16:19:24 -0500
Message-Id: <20221108211930.876142-3-stefanha@redhat.com>
In-Reply-To: <20221108211930.876142-1-stefanha@redhat.com>
References: <20221108211930.876142-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

It is read from IO_CODE and written with BQL held,
so setting it as atomic should be enough.

Also remove the aiocontext lock that was sporadically
taken around the set.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609143727.1151816-3-eesposit@redhat.com>
---
 block/block-backend.c | 6 +++---
 hw/block/virtio-blk.c | 4 ----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index c0c7d56c8d..949418cad4 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -60,7 +60,7 @@ struct BlockBackend {
      * can be used to restore those options in the new BDS on insert) */
     BlockBackendRootState root_state;
 
-    bool enable_write_cache;
+    bool enable_write_cache; /* Atomic */
 
     /* I/O stats (display with "info blockstats"). */
     BlockAcctStats stats;
@@ -1939,13 +1939,13 @@ bool blk_is_sg(BlockBackend *blk)
 bool blk_enable_write_cache(BlockBackend *blk)
 {
     IO_CODE();
-    return blk->enable_write_cache;
+    return qatomic_read(&blk->enable_write_cache);
 }
 
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
 {
     IO_CODE();
-    blk->enable_write_cache = wce;
+    qatomic_set(&blk->enable_write_cache, wce);
 }
 
 void blk_activate(BlockBackend *blk, Error **errp)
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index cdc6fd5979..96d00103a4 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -961,9 +961,7 @@ static void virtio_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
 
     memcpy(&blkcfg, config, s->config_size);
 
-    aio_context_acquire(blk_get_aio_context(s->blk));
     blk_set_enable_write_cache(s->blk, blkcfg.wce != 0);
-    aio_context_release(blk_get_aio_context(s->blk));
 }
 
 static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
@@ -1031,11 +1029,9 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
      * s->blk would erroneously be placed in writethrough mode.
      */
     if (!virtio_vdev_has_feature(vdev, VIRTIO_BLK_F_CONFIG_WCE)) {
-        aio_context_acquire(blk_get_aio_context(s->blk));
         blk_set_enable_write_cache(s->blk,
                                    virtio_vdev_has_feature(vdev,
                                                            VIRTIO_BLK_F_WCE));
-        aio_context_release(blk_get_aio_context(s->blk));
     }
 }
 
-- 
2.38.1


