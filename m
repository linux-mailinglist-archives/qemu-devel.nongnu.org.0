Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A157B3CE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:29:14 +0200 (CEST)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE612-00086w-8M
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cu-0000Vz-2s
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5cr-0001Tt-4e
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxlT59tu7qu7oO6FmxddDjsf6uhXLxR25JFobxvC9P8=;
 b=GNz3Mnq3CnKfoWdkFZpYibypFjuI/v0VIcZ7ZsIbVXLU1hqicCGVbPOt+mmc11cskpKjia
 GWAetiRL4QjaszRve11kuwD2MCtIwg1/3RroFZZ6cQFOjXvDArVdYV8lIj0jNfqsoQ7gGS
 ldDV0RwRpe9mO8mxrKW8rohxeuqZ2YU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-6GF5C8NxMDSgQvd_VuTT-Q-1; Wed, 20 Jul 2022 05:04:05 -0400
X-MC-Unique: 6GF5C8NxMDSgQvd_VuTT-Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D78D4922B20;
 Wed, 20 Jul 2022 09:04:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C022492C3B;
 Wed, 20 Jul 2022 09:04:02 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL V2 15/25] vdpa: Export vhost_vdpa_dma_map and unmap calls
Date: Wed, 20 Jul 2022 17:03:03 +0800
Message-Id: <20220720090313.55169-16-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Eugenio Pérez <eperezma@redhat.com>

Shadow CVQ will copy buffers on qemu VA, so we avoid TOCTOU attacks from
the guest that could set a different state in qemu device model and vdpa
device.

To do so, it needs to be able to map these new buffers to the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 7 +++----
 include/hw/virtio/vhost-vdpa.h | 4 ++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 0b13e98..9699721 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -71,8 +71,8 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
     return false;
 }
 
-static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
-                              void *vaddr, bool readonly)
+int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
+                       void *vaddr, bool readonly)
 {
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
@@ -97,8 +97,7 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
     return ret;
 }
 
-static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
-                                hwaddr size)
+int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size)
 {
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index a29dbb3..7214eb4 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -39,4 +39,8 @@ typedef struct vhost_vdpa {
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
+int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
+                       void *vaddr, bool readonly);
+int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
+
 #endif
-- 
2.7.4


