Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5A57664D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:46:28 +0200 (CEST)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCPOW-0004hi-0l
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOyc-00062S-Sm
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOyb-00061h-D3
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657905580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjJRmUJkLnrcMXEuZxhOFeU55tveeZ6VarDizyp9kEA=;
 b=Dq19nKIqCMBHSfpglZ0AVUbcbRW5bhXbDkOwxKSTkYaxH5fQH4HMP7YTLcjtLtQX7Y8kA5
 iT7OiAk56P0WcnX+OY1ira922uVrnxu8GOt+qLnLZrJXdqZ32SWivKpyUsiI3foX72IAAu
 6uZGOIjE5QeMEDDjpwurwDiyCeGTj8E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-CX5JhLhWPAqk52icjpKM0w-1; Fri, 15 Jul 2022 13:19:25 -0400
X-MC-Unique: CX5JhLhWPAqk52icjpKM0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE0F802D1C;
 Fri, 15 Jul 2022 17:19:24 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA96C40E8B04;
 Fri, 15 Jul 2022 17:19:21 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eric Blake <eblake@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 14/19] vdpa: Export vhost_vdpa_dma_map and unmap calls
Date: Fri, 15 Jul 2022 19:18:29 +0200
Message-Id: <20220715171834.2666455-15-eperezma@redhat.com>
In-Reply-To: <20220715171834.2666455-1-eperezma@redhat.com>
References: <20220715171834.2666455-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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


