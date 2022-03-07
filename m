Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F74D0314
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:40:47 +0100 (CET)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFTa-0001jU-NL
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:40:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRFPT-0001tT-AP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRFPR-0003pC-0P
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646667388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djlP9pPLPZ8kMQlvcPZQGD31LS1nUuJLA3SNKCn+jVc=;
 b=Q9DQdFYxVna1DLb+jqiAGxopIV9JfRxpOJwdzXaRWvnEgeMNy49pg2qfvz8Ac3ixPFVuOb
 58DSwASb1/nvfrRUQsgnDEI8/TBim74ubsZ4YzxvNEwMhCOpvskLjxO5G7l3VBuElADMvH
 RNq065XN9kQuGW8cRSfWILNS8xHXCY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-spEiGCfrMk6s3jxupmpJlA-1; Mon, 07 Mar 2022 10:36:25 -0500
X-MC-Unique: spEiGCfrMk6s3jxupmpJlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A0CD1856A63;
 Mon,  7 Mar 2022 15:36:23 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3A487D3D2;
 Mon,  7 Mar 2022 15:36:17 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/15] vdpa: adapt vhost_ops callbacks to svq
Date: Mon,  7 Mar 2022 16:33:25 +0100
Message-Id: <20220307153334.3854134-7-eperezma@redhat.com>
In-Reply-To: <20220307153334.3854134-1-eperezma@redhat.com>
References: <20220307153334.3854134-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First half of the buffers forwarding part, preparing vhost-vdpa
callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
this is effectively dead code at the moment, but it helps to reduce
patch size.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 77ad56e06c..6a7575f13e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -732,6 +732,13 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
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
@@ -746,6 +753,18 @@ static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
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
2.27.0


