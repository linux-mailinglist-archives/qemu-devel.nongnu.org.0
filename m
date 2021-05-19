Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E474538940A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:45:22 +0200 (CEST)
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPJw-0008FM-Mj
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6V-0005FB-OP
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP6U-0005qf-0C
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wr2UYo9RlDyRTsteJfGPVne0NzOjWnR9hLHKjUWdu9c=;
 b=Koe4E6A2IsuUgQtZarcJbJe9U00xcZsO9szr35lSKcpFsv+NRSgUME1i377KOn1b7bmUXm
 U06hmjTJfpspZWCMxhoGancdXf7O3oOIBQkpuKn1pF+gc/ER4tOxGlKHlsuaU0knkJdDHc
 AspTtbv8UiF2CdYujm709xoC/MV/K2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-x8UrcRI7N8Su0WF6wc_DjQ-1; Wed, 19 May 2021 12:31:23 -0400
X-MC-Unique: x8UrcRI7N8Su0WF6wc_DjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86BE8107ACCD;
 Wed, 19 May 2021 16:31:21 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9A765D6AC;
 Wed, 19 May 2021 16:31:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 15/29] vhost: Add enable_custom_iommu to VhostOps
Date: Wed, 19 May 2021 18:28:49 +0200
Message-Id: <20210519162903.1172366-16-eperezma@redhat.com>
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This operation enable the backend-specific IOTLB entries.

If a backend support this, it start managing its own entries, and vhost
can disable it through this operation and recover control.

Every enable/disable operation must also clear all IOTLB device entries.

At the moment, the only backend that does so is vhost-vdpa. To fully
support these, vdpa needs also to expose a way for vhost subsystem to
map and unmap entries. This will be done in future commits.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index bcb112c166..f8eed2ace5 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -128,6 +128,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
 typedef int (*vhost_vring_pause_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_enable_custom_iommu_op)(struct vhost_dev *dev,
+                                            bool enable);
+
 typedef int (*vhost_get_iova_range)(struct vhost_dev *dev,
                                     hwaddr *first, hwaddr *last);
 
@@ -177,6 +180,7 @@ typedef struct VhostOps {
     vhost_get_device_id_op vhost_get_device_id;
     vhost_vring_pause_op vhost_vring_pause;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_enable_custom_iommu_op vhost_enable_custom_iommu;
     vhost_get_iova_range vhost_get_iova_range;
 } VhostOps;
 
-- 
2.27.0


