Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B2E667C7C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:26:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1KI-0006t6-5H; Thu, 12 Jan 2023 12:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1KG-0006s4-C6
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pG1KE-0008SU-Kh
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673544313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEQcdFPrEC4oVjvdoYYSoSNd7lJaDG6LYVIDvCsNd+4=;
 b=CbWyltW0SOwA+LdgE7NtjSLtSkHwdzumCV9ufqXId/3gnPdyB8ctm4h3lmz1bCcl1O/N8u
 2bdgUNFDycHaA01NifTG/EPd3CmUY2jz7ZNvFK0OQu/fMDgLJOyRV9hU1bJ7JWzR5GXGZT
 2EBRVIetS7hTPcG1zIWC1269oaMwQ4A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-g8IqAqb5NRq_qvFUr3I9bg-1; Thu, 12 Jan 2023 12:25:08 -0500
X-MC-Unique: g8IqAqb5NRq_qvFUr3I9bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA7F7857A85;
 Thu, 12 Jan 2023 17:25:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAF844078904;
 Thu, 12 Jan 2023 17:25:04 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [RFC v2 08/13] vdpa: Negotiate _F_SUSPEND feature
Date: Thu, 12 Jan 2023 18:24:29 +0100
Message-Id: <20230112172434.760850-9-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-1-eperezma@redhat.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

This is needed for qemu to know it can suspend the device to retrieve
its status and enable SVQ with it, so all the process is transparent to
the guest.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 4296427a69..a61a6b2a74 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -659,7 +659,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
     uint64_t features;
     uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
         0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
-        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
+        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
+        0x1ULL << VHOST_BACKEND_F_SUSPEND;
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
-- 
2.31.1


