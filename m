Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189E63D02A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 09:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0IBo-0004y3-9v; Wed, 30 Nov 2022 03:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p0IBm-0004xr-Sj
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:11:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p0IBl-0004bk-5Z
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 03:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669795887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wm5ThFEv8p4p4RwtX+8ahyvVRANW+UOBJK1PjnD4eeY=;
 b=Bea4sb6AKD+X5ZNFtrlBj7tmp9ZCU7rp0bBS9+mMx/rmOPWTa6CnTxYxI07/ZEWpkH01Mn
 1cby6gMJOnqWgwWxszSCUW3Hp0skdwklA94qkltpozlU+pUmY97OqBONM7Za+4IhhIM3Xr
 ghGI9xEPZbys/7S6Tuj9Bj57bbLjO8g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-CsfY0nUzMvuclipHCOqODg-1; Wed, 30 Nov 2022 03:11:26 -0500
X-MC-Unique: CsfY0nUzMvuclipHCOqODg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 019F9381A723
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:11:26 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-154.pek2.redhat.com [10.72.12.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDDD12024CBE;
 Wed, 30 Nov 2022 08:11:23 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH] vhost: Not return fail while the device does not support
 send_iotlb_msg
Date: Wed, 30 Nov 2022 16:11:20 +0800
Message-Id: <20221130081120.2620722-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

Some device does not support vhost_send_device_iotlb_msg()
such as vDPA device, which is as expected. So we should not
return fail here.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 8e581575c9..9321ed9031 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -360,7 +360,7 @@ int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
     if (dev->vhost_ops && dev->vhost_ops->vhost_send_device_iotlb_msg)
         return dev->vhost_ops->vhost_send_device_iotlb_msg(dev, &imsg);
 
-    return -ENODEV;
+    return 0;
 }
 
 int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
@@ -375,7 +375,7 @@ int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
     if (dev->vhost_ops && dev->vhost_ops->vhost_send_device_iotlb_msg)
         return dev->vhost_ops->vhost_send_device_iotlb_msg(dev, &imsg);
 
-    return -ENODEV;
+    return 0;
 }
 
 int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
-- 
2.34.3


