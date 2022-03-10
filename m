Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5DC4D3F53
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 03:44:32 +0100 (CET)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS8n1-0003Xw-IJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 21:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8if-0004QI-2J
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:40:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8id-000443-9p
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646879998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/e5N70ZN5K6f4bSi6jahEn2IlKBk3kfPFNDZca8Cj8E=;
 b=BgdoEqLLBjwhBXj8jHzZa/DH5bnSHvGnCBTWqaWPZ6A0YJat65SNWQzXMt6C9HGywJr4wy
 I+94ArXr2hV7Fh1yj3NPGxjR9v4smdPDtPr4zXn9QFquhMtUX6NcSJEEOyejLv729FTVy/
 kxLR4BUyJt8tyGI8K5wnE/5MMVerJ+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-5un3SpnqNWiAabFiS20yHQ-1; Wed, 09 Mar 2022 21:39:55 -0500
X-MC-Unique: 5un3SpnqNWiAabFiS20yHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89FED1091DA3;
 Thu, 10 Mar 2022 02:39:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-194.pek2.redhat.com
 [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFC161078672;
 Thu, 10 Mar 2022 02:39:52 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 07/15] vdpa: adapt vhost_ops callbacks to svq
Date: Thu, 10 Mar 2022 10:38:59 +0800
Message-Id: <20220310023907.2443-8-jasowang@redhat.com>
In-Reply-To: <20220310023907.2443-1-jasowang@redhat.com>
References: <20220310023907.2443-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c94a2be..80d06ff 100644
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
@@ -857,11 +876,17 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
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
@@ -874,8 +899,17 @@ static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
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


