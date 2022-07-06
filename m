Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8C569269
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:10:54 +0200 (CEST)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9AQH-0003Ry-8R
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xn-0005bh-C6
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o99xX-0000tN-MZ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657132869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QD+UF4oXCfphsAmpAc8aXI/PNUipIiY45PMK1Y5dq8=;
 b=F+s/rwdtRw0Uu3Zg7VV+d/0EU5OLlm+3laWwwhstAlLYSvoZ34hAXmB+NYGLBNp+RubZpM
 tK2VLlZ+0Y3l5TeGX2ETATgEK0bdEzXsKouWPAOIjSTc/VIvzsh3X05norQ8R3Kwfa5IZE
 OWQNxmtmqExmbx4d6DAQQY1frmU5iK8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-4Kfm1CBnOUu7TXI0JGjxVg-1; Wed, 06 Jul 2022 14:41:05 -0400
X-MC-Unique: 4Kfm1CBnOUu7TXI0JGjxVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30C9D3800C39;
 Wed,  6 Jul 2022 18:41:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1CF6141511D;
 Wed,  6 Jul 2022 18:41:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH v9 18/23] vdpa: Export vhost_vdpa_dma_map and unmap calls
Date: Wed,  6 Jul 2022 20:40:03 +0200
Message-Id: <20220706184008.1649478-19-eperezma@redhat.com>
In-Reply-To: <20220706184008.1649478-1-eperezma@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Shadow CVQ will copy buffers on qemu VA, so we avoid TOCTOU attacks that
can set a different state in qemu device model and vdpa device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 4 ++++
 hw/virtio/vhost-vdpa.c         | 7 +++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index a29dbb3f53..7214eb47dc 100644
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
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 69cfaf05d6..613c3483b0 100644
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
-- 
2.31.1


