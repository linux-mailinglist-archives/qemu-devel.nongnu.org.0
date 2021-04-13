Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519935E464
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:54:26 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMIz-00034j-5x
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lWMHc-0002JM-Kj
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lWMHZ-0002ej-Dv
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618332775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2huPDmq2fOZRirn/YhTM8lwg9ZrRg86H3cFEEvam3Jk=;
 b=cXav/XIN0hl1FjlM4Dx/GjeXTJk0SjNvTLP1Yolmillq87ghbeV0BUrh/IsLaXrZghpuWI
 iWcEwL1hpsSuzOuUkbXONS/ysw8yB8jnsk/2D4pzLsciXlmGlOcImCPIZ/4TNTGhecfulv
 jos0i67t1t+snpIqSCZLpdaPuGMdQZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-9ku_Z4EwPr6LOPJhAQcUug-1; Tue, 13 Apr 2021 12:52:53 -0400
X-MC-Unique: 9ku_Z4EwPr6LOPJhAQcUug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8831783DD23;
 Tue, 13 Apr 2021 16:52:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-130.phx2.redhat.com [10.3.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEDE360DA0;
 Tue, 13 Apr 2021 16:52:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] vhost-user-blk: Fail gracefully on too large queue size
Date: Tue, 13 Apr 2021 18:52:40 +0200
Message-Id: <20210413165240.43386-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio_add_queue() aborts when queue_size > VIRTQUEUE_MAX_SIZE, so
vhost_user_blk_device_realize() should check this before calling it.

Simple reproducer:

qemu-system-x86_64 \
    -chardev null,id=foo \
    -device vhost-user-blk-pci,queue-size=4096,chardev=foo

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1935014
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 0b5b9d44cd..531e4ea063 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -467,6 +467,11 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "vhost-user-blk: queue size must be non-zero");
         return;
     }
+    if (s->queue_size) {
+        error_setg(errp, "vhost-user-blk: queue size must not exceed %d",
+                   VIRTQUEUE_MAX_SIZE);
+        return;
+    }
 
     if (!vhost_user_init(&s->vhost_user, &s->chardev, errp)) {
         return;
-- 
2.30.2


