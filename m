Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940C621E78
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW16-0005Kp-MC; Tue, 08 Nov 2022 16:20:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0t-0005FR-9u
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0q-0008Vd-MZ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6geCx/2iv4zqgllNBXbXJWKrMBVs+D3OqKdx4CS+ko=;
 b=JGeRmJTKsnFWijP/8eyADqNWLI6f8vbtz2PMa0N/vOX7a4/q2KCucXdtrRJxsEFiTMdG0u
 LDB/Grqjw9IpbvRL6tnER5fWqdBvpbxjVYyOn5sH2cpX/6G9H2De8FCwYylbwy27PZQ2pY
 fwW/VmGzNgBCzeVdbWz/a+JDJ5CGK7Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-6i_XSGkCNb2i6OD3TNl4aQ-1; Tue, 08 Nov 2022 16:20:01 -0500
X-MC-Unique: 6i_XSGkCNb2i6OD3TNl4aQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD7F23817978;
 Tue,  8 Nov 2022 21:20:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21FFA40C2086;
 Tue,  8 Nov 2022 21:19:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 7/8] virtio-blk: don't acquire AioContext in
 virtio_blk_handle_vq()
Date: Tue,  8 Nov 2022 16:19:29 -0500
Message-Id: <20221108211930.876142-8-stefanha@redhat.com>
In-Reply-To: <20221108211930.876142-1-stefanha@redhat.com>
References: <20221108211930.876142-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

There is no need to acquire AioContext in virtio_blk_handle_vq() because
no APIs used in the function require it and nothing else in the
virtio-blk code requires mutual exclusion anymore.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/virtio-blk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index faea045178..771d87cfbe 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -784,7 +784,6 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
 
     IO_CODE();
 
-    aio_context_acquire(blk_get_aio_context(s->blk));
     blk_io_plug(s->blk);
 
     do {
@@ -810,7 +809,6 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
     }
 
     blk_io_unplug(s->blk);
-    aio_context_release(blk_get_aio_context(s->blk));
 }
 
 static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
-- 
2.38.1


