Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ACB397F94
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:32:57 +0200 (CEST)
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHcm-0000Cd-Fj
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loHbd-00079D-Qt
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loHbZ-0000xf-5K
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622604699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6/7VUpN7wZdR9Wfrx6Ax+v3wJPzGxz9v6+0TZ1YwX48=;
 b=Ce/YFHI6xTJh36rZ2ySvBQQPcQXPICre+D8SxZ722yPjaf3Mfe6txkz+xPs68kF8eXzKp0
 0b030DCUjZiMFLk7hQBbxUAWIn55IYEokbfPM8R3T0J84TsFsET0wsyRvwQi8XJkNLgGjJ
 ZSxFLj3NkWU7fZNnlYoWUCKF8MgOpRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-GhdCxCPdO-yU9CNvOeOJYA-1; Tue, 01 Jun 2021 23:31:36 -0400
X-MC-Unique: GhdCxCPdO-yU9CNvOeOJYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C1291009464;
 Wed,  2 Jun 2021 03:31:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-99.pek2.redhat.com [10.72.12.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29EEB60CCC;
 Wed,  2 Jun 2021 03:31:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
Date: Wed,  2 Jun 2021 11:31:26 +0800
Message-Id: <20210602033127.40149-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, lulu@redhat.com, gdawar@xilinx.com,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to initialize backend_features during vhost_vdpa_init()
regardless whether or not it was supported by vhost. This will lead
the unsupported features like VIRTIO_F_IN_ORDER to be included and set
to the vhost-vdpa during vhost_dev_start. Because the
VIRTIO_F_IN_ORDER is not supported by vhost-vdpa so it won't be
advertised to guest which will break the datapath.

Fix this by not initializing the backend_features, so the
acked_features could be built only from guest features via
vhost_net_ack_features().

Fixes: 108a64818e69b ("vhost-vdpa: introduce vhost-vdpa backend")
Cc: qemu-stable@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..5fe43a4eb5 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -275,15 +275,12 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
 {
     struct vhost_vdpa *v;
-    uint64_t features;
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     trace_vhost_vdpa_init(dev, opaque);
 
     v = opaque;
     v->dev = dev;
     dev->opaque =  opaque ;
-    vhost_vdpa_call(dev, VHOST_GET_FEATURES, &features);
-    dev->backend_features = features;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
 
-- 
2.25.1


