Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73644E5191
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:46:32 +0100 (CET)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzRf-00086a-8A
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:46:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWz05-0001BE-5B
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWz03-0002gL-C6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648034278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3waz1XxSna8I1NMy3FXUIuiSf9xvwgpbuZPM3PrpW0=;
 b=eKwSq7usU7pdYOn0MXB7C5xFAnOZNBYE7TGhqlDSYaRVQf6eHUk+eURPEjh/4VneWcuxVp
 R43ZRyuPB9CX+fhsf2UDj+jcKmaHtv5zyR2BzpjcrxDzhWmQiPKf9IBs0B8PniNv9iOSr1
 Li7Tb0MUMLSWMwGMoVqwVxI9B84ib8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-DQ08-1u7OCqYWxm6y_PIPQ-1; Wed, 23 Mar 2022 07:17:55 -0400
X-MC-Unique: DQ08-1u7OCqYWxm6y_PIPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D267801585;
 Wed, 23 Mar 2022 11:17:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E285C202C9;
 Wed, 23 Mar 2022 11:17:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 8/8] virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint
Date: Wed, 23 Mar 2022 11:17:27 +0000
Message-Id: <20220323111727.1100209-9-stefanha@redhat.com>
In-Reply-To: <20220323111727.1100209-1-stefanha@redhat.com>
References: <20220323111727.1100209-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alberto Faria <afaria@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, sgarzare@redhat.com
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
index 540c38f829..a18cf05f14 100644
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
 
@@ -1228,6 +1231,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     }
 
     s->change = qemu_add_vm_change_state_handler(virtio_blk_dma_restart_cb, s);
+    blk_ram_registrar_init(&s->blk_ram_registrar, s->blk);
     blk_set_dev_ops(s->blk, &virtio_block_ops, s);
     blk_set_guest_block_size(s->blk, s->conf.conf.logical_block_size);
 
@@ -1255,6 +1259,7 @@ static void virtio_blk_device_unrealize(DeviceState *dev)
     }
     qemu_coroutine_decrease_pool_batch_size(conf->num_queues * conf->queue_size
                                             / 2);
+    blk_ram_registrar_destroy(&s->blk_ram_registrar);
     qemu_del_vm_change_state_handler(s->change);
     blockdev_mark_auto_del(s->blk);
     virtio_cleanup(vdev);
-- 
2.35.1


