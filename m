Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B994D94AF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:37:29 +0100 (CET)
Received: from localhost ([::1]:57910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0oC-0001C2-Ek
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:37:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0SR-0000pO-EE
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0SP-0004NV-OL
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647324897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwIwoawer/JWzh1h4nupuKpGouqlqohNTGlLF1ji2sE=;
 b=b7FXE7ABZ/2bgy3U00AZ8JxMrOqZra4cpb0/IRiVqeho+Epihiz6sgdfp4V5z/bJJy+sCw
 QSnT2IJyrRIHSTNrNPm5gKjXCphacRCJ4DFQiVxWxDm07GbkIsYCp9CM1yPaHqgW6Nv/xG
 BhZ8JcEnESv+gCVhKzgZpE2ZNAOXDic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-2TuK2t2DN_eXwm3jLspusQ-1; Tue, 15 Mar 2022 02:14:53 -0400
X-MC-Unique: 2TuK2t2DN_eXwm3jLspusQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A77AA101AA48;
 Tue, 15 Mar 2022 06:14:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-38.pek2.redhat.com [10.72.14.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F4FE400E40C;
 Tue, 15 Mar 2022 06:14:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V3 07/15] vdpa: adapt vhost_ops callbacks to svq
Date: Tue, 15 Mar 2022 14:14:12 +0800
Message-Id: <20220315061420.31910-8-jasowang@redhat.com>
In-Reply-To: <20220315061420.31910-1-jasowang@redhat.com>
References: <20220315061420.31910-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

First half of the buffers forwarding part, preparing vhost-vdpa
callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
this is effectively dead code at the moment, but it helps to reduce
patch size.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 4e1deb3..3e2c181 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -733,6 +733,13 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
     return ret;
  }
 
+static int vhost_vdpa_set_dev_vring_base(struct vhost_dev *dev,
+                                         struct vhost_vring_state *ring)
+{
+    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
+    return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
+}
+
 static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
                                          struct vhost_vring_file *file)
 {
@@ -747,6 +754,18 @@ static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
 
+static int vhost_vdpa_set_vring_dev_addr(struct vhost_dev *dev,
+                                         struct vhost_vring_addr *addr)
+{
+    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
+                                addr->desc_user_addr, addr->used_user_addr,
+                                addr->avail_user_addr,
+                                addr->log_guest_addr);
+
+    return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
+
+}
+
 /**
  * Set the shadow virtqueue descriptors to the device
  *
@@ -856,11 +875,17 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
 static int vhost_vdpa_set_vring_addr(struct vhost_dev *dev,
                                        struct vhost_vring_addr *addr)
 {
-    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
-                                    addr->desc_user_addr, addr->used_user_addr,
-                                    addr->avail_user_addr,
-                                    addr->log_guest_addr);
-    return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
+    struct vhost_vdpa *v = dev->opaque;
+
+    if (v->shadow_vqs_enabled) {
+        /*
+         * Device vring addr was set at device start. SVQ base is handled by
+         * VirtQueue code.
+         */
+        return 0;
+    }
+
+    return vhost_vdpa_set_vring_dev_addr(dev, addr);
 }
 
 static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
@@ -873,8 +898,17 @@ static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
 static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
-    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
-    return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
+    struct vhost_vdpa *v = dev->opaque;
+
+    if (v->shadow_vqs_enabled) {
+        /*
+         * Device vring base was set at device start. SVQ base is handled by
+         * VirtQueue code.
+         */
+        return 0;
+    }
+
+    return vhost_vdpa_set_dev_vring_base(dev, ring);
 }
 
 static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
-- 
2.7.4


