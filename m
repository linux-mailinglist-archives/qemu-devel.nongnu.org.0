Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42476621E82
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:23:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW17-0005OG-1X; Tue, 08 Nov 2022 16:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0w-0005FY-4Q
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0t-00009S-U1
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQ3ATQgKtUyo3XXFzYY5Hl43Lj2yTiPHOQSl+WRJnsw=;
 b=Oy8SLnjbxwDWcynUAkWOZGEJnJzuTNVs30Lng83TFokdn83Ur9BVYUCO/jcaB1SpaW8JjE
 KP/h4y8nzOw6PhDti2uzGKZi/Ut3kLbYQC/m8yAYUeJCYX0rVrgzZn7jNu1mhTLgM4dOPK
 F4ZtUW24BY6bI9UEdf0DVEqimDRkBZg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-SN4d4uxvM_-o4ZRA5swXig-1; Tue, 08 Nov 2022 16:20:03 -0500
X-MC-Unique: SN4d4uxvM_-o4ZRA5swXig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00B3E185A7AA;
 Tue,  8 Nov 2022 21:20:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A0F54C819;
 Tue,  8 Nov 2022 21:20:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 8/8] virtio-blk: minimize virtio_blk_reset() AioContext lock
 region
Date: Tue,  8 Nov 2022 16:19:30 -0500
Message-Id: <20221108211930.876142-9-stefanha@redhat.com>
In-Reply-To: <20221108211930.876142-1-stefanha@redhat.com>
References: <20221108211930.876142-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

blk_drain() needs the lock because it calls AIO_WAIT_WHILE().

The s->rq loop doesn't need the lock because dataplane has been stopped
when virtio_blk_reset() is called.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/virtio-blk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 771d87cfbe..0b411b3065 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -898,6 +898,7 @@ static void virtio_blk_reset(VirtIODevice *vdev)
     ctx = blk_get_aio_context(s->blk);
     aio_context_acquire(ctx);
     blk_drain(s->blk);
+    aio_context_release(ctx);
 
     /* We drop queued requests after blk_drain() because blk_drain() itself can
      * produce them. */
@@ -908,8 +909,6 @@ static void virtio_blk_reset(VirtIODevice *vdev)
         virtio_blk_free_request(req);
     }
 
-    aio_context_release(ctx);
-
     assert(!s->dataplane_started);
     blk_set_enable_write_cache(s->blk, s->original_wce);
 }
-- 
2.38.1


