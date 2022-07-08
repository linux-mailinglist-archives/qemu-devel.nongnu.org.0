Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7C056B186
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 06:26:59 +0200 (CEST)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9fZy-0006YQ-Ms
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 00:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSy-0003vO-NY
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9fSw-0000OY-LR
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 00:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657253982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fX055+lti1fPP0GUE+G7NEy7xdox3yfVVq795BYrgvA=;
 b=Jg8QJkW5sWRy5kKaDOQ2SbxhjRWkhBMBVoSRTy5jCBAKfqP4zRwcnlHprvnADcpR3FCA3b
 Kd1zKqRCIP+MJJ1f7TUtYPTtVNF9LZ+SJlLXT564uLjhtrHINGspqx0TX1mP7NCYjZC4ZO
 p0bNpL5GW/ObnmSS9pf4RHdBup8Pf3M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-tFV1qfa3NrSPLSKdKTV1Ag-1; Fri, 08 Jul 2022 00:19:37 -0400
X-MC-Unique: tFV1qfa3NrSPLSKdKTV1Ag-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F450801231;
 Fri,  8 Jul 2022 04:19:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D76D7492C3B;
 Fri,  8 Jul 2022 04:19:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [RFC v3 8/8] virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint
Date: Fri,  8 Jul 2022 05:17:37 +0100
Message-Id: <20220708041737.1768521-9-stefanha@redhat.com>
In-Reply-To: <20220708041737.1768521-1-stefanha@redhat.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Register guest RAM using BlockRAMRegistrar and set the
BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
accesses in I/O requests.

This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
on DMA mapping/unmapping.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-blk.h |  2 ++
 hw/block/virtio-blk.c          | 13 +++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index d311c57cca..7f589b4146 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -19,6 +19,7 @@
 #include "hw/block/block.h"
 #include "sysemu/iothread.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/block-ram-registrar.h"
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_BLK "virtio-blk-device"
@@ -64,6 +65,7 @@ struct VirtIOBlock {
     struct VirtIOBlockDataPlane *dataplane;
     uint64_t host_features;
     size_t config_size;
+    BlockRAMRegistrar blk_ram_registrar;
 };
 
 typedef struct VirtIOBlockReq {
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..41f8c73453 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -21,6 +21,7 @@
 #include "hw/block/block.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/blockdev.h"
+#include "sysemu/block-ram-registrar.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "hw/virtio/virtio-blk.h"
@@ -421,11 +422,13 @@ static inline void submit_requests(BlockBackend *blk, MultiReqBuffer *mrb,
     }
 
     if (is_write) {
-        blk_aio_pwritev(blk, sector_num << BDRV_SECTOR_BITS, qiov, 0,
-                        virtio_blk_rw_complete, mrb->reqs[start]);
+        blk_aio_pwritev(blk, sector_num << BDRV_SECTOR_BITS, qiov,
+                        BDRV_REQ_REGISTERED_BUF, virtio_blk_rw_complete,
+                        mrb->reqs[start]);
     } else {
-        blk_aio_preadv(blk, sector_num << BDRV_SECTOR_BITS, qiov, 0,
-                       virtio_blk_rw_complete, mrb->reqs[start]);
+        blk_aio_preadv(blk, sector_num << BDRV_SECTOR_BITS, qiov,
+                       BDRV_REQ_REGISTERED_BUF, virtio_blk_rw_complete,
+                       mrb->reqs[start]);
     }
 }
 
@@ -1227,6 +1230,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     }
 
     s->change = qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s);
+    blk_ram_registrar_init(&s->blk_ram_registrar, s->blk);
     blk_set_dev_ops(s->blk, &virtio_block_ops, s);
 
     blk_iostatus_enable(s->blk);
@@ -1252,6 +1256,7 @@ static void virtio_blk_device_unrealize(DeviceState *dev)
         virtio_del_queue(vdev, i);
     }
     qemu_coroutine_dec_pool_size(conf->num_queues * conf->queue_size / 2);
+    blk_ram_registrar_destroy(&s->blk_ram_registrar);
     qemu_del_vm_change_state_handler(s->change);
     blockdev_mark_auto_del(s->blk);
     virtio_cleanup(vdev);
-- 
2.36.1


