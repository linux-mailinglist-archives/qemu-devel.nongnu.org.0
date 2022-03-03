Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302664CC584
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 19:59:11 +0100 (CET)
Received: from localhost ([::1]:44820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqfO-0006b0-9g
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 13:59:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPqbJ-0007Sm-E7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPqbH-0001tF-97
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646333694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djlP9pPLPZ8kMQlvcPZQGD31LS1nUuJLA3SNKCn+jVc=;
 b=G1U0QCACOUrvyOJMlaQfFG2E45+fsbwpXFfC+1RUMUPvXJulFzsthiojJEVkRXoHfxD/14
 9s3q/xsoykIH8XKNPPIzO7srl5pB66i/GK9o2lrNGX73zDpWuaX8ZRuwJCIYg6nEyHZ5oN
 zgDvwekq9YjM23W91wWen5Hw/7ZBaGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-iT5cvtYBOcCeIencsUcgYg-1; Thu, 03 Mar 2022 13:54:51 -0500
X-MC-Unique: iT5cvtYBOcCeIencsUcgYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C8961808320;
 Thu,  3 Mar 2022 18:54:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EF8280FC8;
 Thu,  3 Mar 2022 18:54:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/14] vdpa: adapt vhost_ops callbacks to svq
Date: Thu,  3 Mar 2022 19:51:39 +0100
Message-Id: <20220303185147.3605350-7-eperezma@redhat.com>
In-Reply-To: <20220303185147.3605350-1-eperezma@redhat.com>
References: <20220303185147.3605350-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
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


