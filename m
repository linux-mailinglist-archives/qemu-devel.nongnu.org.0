Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A16BEBF0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:57:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBUz-0000Pz-AJ; Fri, 17 Mar 2023 10:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pdBUr-0000OY-3V
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pdBUo-0007Jx-Rf
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679064954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3nK4ZpQgMUN43K3mekqrzfFLQ5w2ZvOSOOq3BPDe50=;
 b=SjpnqiQ88bJaNCc8XkOwFg+YglFdrhA7JtE8cs7TBeCwysjQ7UtjyaaU6A/Kk5ghWIDMDn
 tvjlRB/cwiItQUQqN6jcMwQvRzvgDHWFab9vqtXVB4bSD55PtKC7/ovLUlpGDMSSqRBMmE
 lqvyuydR8OaLZd0il0LznB+JHVI6I9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-P7c4QFVNN46tjVd6pyNBQw-1; Fri, 17 Mar 2023 10:55:50 -0400
X-MC-Unique: P7c4QFVNN46tjVd6pyNBQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68684884EC0;
 Fri, 17 Mar 2023 14:55:49 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA13543FBE;
 Fri, 17 Mar 2023 14:55:46 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: alvaro.karsz@solid-run.com, Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, Stefano Garzarella <sgarzare@redhat.com>,
 longpeng2@huawei.com, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: [RFC PATCH for 8.1 1/6] vdpa: Remove status in reset tracing
Date: Fri, 17 Mar 2023 15:55:37 +0100
Message-Id: <20230317145542.347368-2-eperezma@redhat.com>
In-Reply-To: <20230317145542.347368-1-eperezma@redhat.com>
References: <20230317145542.347368-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is always 0 and it is not useful to route call through file
descriptor.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 hw/virtio/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bc6bad23d5..bbabea18f3 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -716,7 +716,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
     uint8_t status = 0;
 
     ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
-    trace_vhost_vdpa_reset_device(dev, status);
+    trace_vhost_vdpa_reset_device(dev);
     v->suspended = false;
     return ret;
 }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8f8d05cf9b..6265231683 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -44,7 +44,7 @@ vhost_vdpa_set_mem_table(void *dev, uint32_t nregions, uint32_t padding) "dev: %
 vhost_vdpa_dump_regions(void *dev, int i, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, uint64_t flags_padding) "dev: %p %d: guest_phys_addr: 0x%"PRIx64" memory_size: 0x%"PRIx64" userspace_addr: 0x%"PRIx64" flags_padding: 0x%"PRIx64
 vhost_vdpa_set_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
 vhost_vdpa_get_device_id(void *dev, uint32_t device_id) "dev: %p device_id %"PRIu32
-vhost_vdpa_reset_device(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
+vhost_vdpa_reset_device(void *dev) "dev: %p"
 vhost_vdpa_get_vq_index(void *dev, int idx, int vq_idx) "dev: %p idx: %d vq idx: %d"
 vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
 vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
-- 
2.31.1


