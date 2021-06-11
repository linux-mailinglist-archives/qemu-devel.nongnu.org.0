Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D73A3BA0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:04:51 +0200 (CEST)
Received: from localhost ([::1]:35526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lraHi-0002uz-Cw
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDh-0003Ty-Vt
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDg-00022m-9u
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623391239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sC7BL+lj3imjP8uxrKr5+G7O3lojkazTai5JadCsnfE=;
 b=M1uB2uGYC/hzjt81E/6d5UhAakUjYv6zm73dIMbHdARnaVdAcFm5N3tde70F0nKUPWBu3k
 qC8I/GoUZprWzrNf4gfx2Xjcdjm9v+kf6D+zvw05sk8Q1Z9R8LNVDuDj2n65kNvwg3jeVf
 rfXnQH9QMuB9kF+TsTXo51pBofpOkOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-Oohqyt7HMz-Hb2qVKkmOIQ-1; Fri, 11 Jun 2021 02:00:37 -0400
X-MC-Unique: Oohqyt7HMz-Hb2qVKkmOIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA77F1084F46;
 Fri, 11 Jun 2021 06:00:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-78.pek2.redhat.com [10.72.13.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9755D60917;
 Fri, 11 Jun 2021 06:00:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 03/12] vhost-vdpa: don't initialize backend_features
Date: Fri, 11 Jun 2021 14:00:15 +0800
Message-Id: <20210611060024.46763-4-jasowang@redhat.com>
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
References: <20210611060024.46763-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 Gautam Dawar <gdawar@xilinx.com>
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
index 7bcccf1..61ba313 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -268,15 +268,12 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
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
2.7.4


