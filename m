Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E859EAF3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:27:46 +0200 (CEST)
Received: from localhost ([::1]:48988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYcr-0005VC-Gd
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYW3-0005Ju-VV
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVv-00034H-7P
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661278831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGbjYz2nsNd1UgiSarbiowrT7nNfvzmFvntMEpAN2KI=;
 b=AQSkcA8i+mtmws4kQVn/zfc+ZuEMDeyyHrtfIsIATNBQPAlfpz3ZwSui8Wzjb50TtOe4YS
 TzO96YkXDiECEOAUDPvap21GFOqckVseV9QMwWGQp3BHlavmwjcD3whN1KfTYbff3/fUOx
 XVWLG1/8+hv6iZK1f0GvDpfD4hA92cg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-o4wTzj4jPFW5XqyRu0sYBQ-1; Tue, 23 Aug 2022 14:20:27 -0400
X-MC-Unique: o4wTzj4jPFW5XqyRu0sYBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02345101AA45;
 Tue, 23 Aug 2022 18:20:27 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA6040D2830;
 Tue, 23 Aug 2022 18:20:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 7/7] vdpa: Use ring hwaddr at vhost_vdpa_svq_unmap_ring
Date: Tue, 23 Aug 2022 20:20:08 +0200
Message-Id: <20220823182008.97141-8-eperezma@redhat.com>
In-Reply-To: <20220823182008.97141-1-eperezma@redhat.com>
References: <20220823182008.97141-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reduce code duplication.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e208dd000e..23ae5ef48b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -884,10 +884,12 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *dev,
 /**
  * Unmap a SVQ area in the device
  */
-static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
-                                      const DMAMap *needle)
+static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v, hwaddr addr)
 {
-    const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, needle);
+    const DMAMap needle = {
+        .translated_addr = addr,
+    };
+    const DMAMap *result = vhost_iova_tree_find_iova(v->iova_tree, &needle);
     hwaddr size;
     int r;
 
@@ -909,17 +911,14 @@ static void vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
 static void vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,
                                        const VhostShadowVirtqueue *svq)
 {
-    DMAMap needle = {};
     struct vhost_vdpa *v = dev->opaque;
     struct vhost_vring_addr svq_addr;
 
     vhost_svq_get_vring_addr(svq, &svq_addr);
 
-    needle.translated_addr = svq_addr.desc_user_addr;
-    vhost_vdpa_svq_unmap_ring(v, &needle);
+    vhost_vdpa_svq_unmap_ring(v, svq_addr.desc_user_addr);
 
-    needle.translated_addr = svq_addr.used_user_addr;
-    vhost_vdpa_svq_unmap_ring(v, &needle);
+    vhost_vdpa_svq_unmap_ring(v, svq_addr.used_user_addr);
 }
 
 /**
@@ -997,7 +996,7 @@ static bool vhost_vdpa_svq_map_rings(struct vhost_dev *dev,
     ok = vhost_vdpa_svq_map_ring(v, &device_region, errp);
     if (unlikely(!ok)) {
         error_prepend(errp, "Cannot create vq device region: ");
-        vhost_vdpa_svq_unmap_ring(v, &driver_region);
+        vhost_vdpa_svq_unmap_ring(v, driver_region.translated_addr);
     }
     addr->used_user_addr = device_region.iova;
 
-- 
2.31.1


