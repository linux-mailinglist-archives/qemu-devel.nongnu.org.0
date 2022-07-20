Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9557B165
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:09:30 +0200 (CEST)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3pp-0000Ie-Kd
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3hT-0000Vf-6C
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3hQ-0006fJ-7U
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658300447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjJRmUJkLnrcMXEuZxhOFeU55tveeZ6VarDizyp9kEA=;
 b=estm5RrxonNZhgF0KIqtVYDgtq0x0g4mLqhYGJaBY+gdC6qblomgzz4ukQCp69cDJC5NMA
 aFIJDO1wR9aluZsT2KAOg6Rv7tRzWQpAlebwiZB3LiF5yAECDh7QuL0TQkKmBGuJWt3498
 u1yrKJYGmJ1VPXYYt7f8f2zdVCzX6I0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-BTotHR4AMJOCWWptQR7gRw-1; Wed, 20 Jul 2022 03:00:43 -0400
X-MC-Unique: BTotHR4AMJOCWWptQR7gRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 434C1185A794;
 Wed, 20 Jul 2022 07:00:43 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5289618EA8;
 Wed, 20 Jul 2022 07:00:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v6 15/21] vdpa: Export vhost_vdpa_dma_map and unmap calls
Date: Wed, 20 Jul 2022 08:59:40 +0200
Message-Id: <20220720065946.3122611-16-eperezma@redhat.com>
In-Reply-To: <20220720065946.3122611-1-eperezma@redhat.com>
References: <20220720065946.3122611-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

Shadow CVQ will copy buffers on qemu VA, so we avoid TOCTOU attacks from
the guest that could set a different state in qemu device model and vdpa
device.

To do so, it needs to be able to map these new buffers to the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
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
index 0b13e98471..96997210be 100644
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


