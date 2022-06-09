Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB40545047
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:10:33 +0200 (CEST)
Received: from localhost ([::1]:50188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJns-00039i-Og
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI4-0002MU-Jp
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI1-00071C-0w
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+odWRPv6aI0/Te11N77cSgsLRfMke9pMgyM7AzZdxE=;
 b=M6uklU2EGobVaLS9rlnPqcssVDan4eckgeiQlpga0PxudnOzLCSDwitYn9M+NLYv5mQyEg
 eUuqNU+PlT0xE1RS27EqFhunEj83WhPCNxnKcOwK+mKWiBuSAllXIpCnRe/OVcpNSx69MT
 Hel+51JywmUX4jMOrKJMXzH+JTS38kU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-hOZbtKL4MLKBQj3gMSW-WQ-1; Thu, 09 Jun 2022 10:37:33 -0400
X-MC-Unique: hOZbtKL4MLKBQj3gMSW-WQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C302F801E67;
 Thu,  9 Jun 2022 14:37:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 838D5492C3B;
 Thu,  9 Jun 2022 14:37:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 2/8] block-backend: enable_write_cache should be atomic
Date: Thu,  9 Jun 2022 10:37:21 -0400
Message-Id: <20220609143727.1151816-3-eesposit@redhat.com>
In-Reply-To: <20220609143727.1151816-1-eesposit@redhat.com>
References: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is read from IO_CODE and written with BQL held,
so setting it as atomic should be enough.

Also remove the aiocontext lock that was sporadically
taken around the set.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c | 6 +++---
 hw/block/virtio-blk.c | 4 ----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index f425b00793..384e52d564 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -60,7 +60,7 @@ struct BlockBackend {
      * can be used to restore those options in the new BDS on insert) */
     BlockBackendRootState root_state;
 
-    bool enable_write_cache;
+    bool enable_write_cache; /* Atomic */
 
     /* I/O stats (display with "info blockstats"). */
     BlockAcctStats stats;
@@ -1972,13 +1972,13 @@ bool blk_is_sg(BlockBackend *blk)
 bool blk_enable_write_cache(BlockBackend *blk)
 {
     IO_CODE();
-    return blk->enable_write_cache;
+    return qatomic_read(&blk->enable_write_cache);
 }
 
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
 {
     GLOBAL_STATE_CODE();
-    blk->enable_write_cache = wce;
+    qatomic_set(&blk->enable_write_cache, wce);
 }
 
 void blk_activate(BlockBackend *blk, Error **errp)
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 8d0590cc76..191f75ce25 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -988,9 +988,7 @@ static void virtio_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
 
     memcpy(&blkcfg, config, s->config_size);
 
-    aio_context_acquire(blk_get_aio_context(s->blk));
     blk_set_enable_write_cache(s->blk, blkcfg.wce != 0);
-    aio_context_release(blk_get_aio_context(s->blk));
 }
 
 static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
@@ -1058,11 +1056,9 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
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
2.31.1


