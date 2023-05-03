Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DB6F5459
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:16:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8aF-0004sF-Q6; Wed, 03 May 2023 05:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8a9-0003z8-Dh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8a6-0007QI-Fi
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iebPCkg5eFFs1qB8vOt/Pycrcm/HX0yYXVK1rX33ArI=;
 b=dJBhlp7V2xcFrq1TNxpdsUrL0o7DFxmM4tBQuqyPHuMb9fhIcZrOa5yrjCzzfLRQX4uRGz
 97NT1PEn7AS/GWgbHJTdSby8z/wQ0oFjQR09kOnib1gj1sS7EyVSW3+nR+Rz9tIXKnGKT9
 IR21o9Rl7CmDt2+/Dlh1NtAzQzqqdm4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-6Wc4FjAOMcOhlBcl6x9lCQ-1; Wed, 03 May 2023 05:14:19 -0400
X-MC-Unique: 6Wc4FjAOMcOhlBcl6x9lCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39B8385A5B1
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:14:19 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-29.pek2.redhat.com [10.72.12.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4872B1121331;
 Wed,  3 May 2023 09:14:16 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [RFC 6/7] vhost-vdpa: init iommufd function in vhost_vdpa start
Date: Wed,  3 May 2023 17:13:36 +0800
Message-Id: <20230503091337.2130631-7-lulu@redhat.com>
In-Reply-To: <20230503091337.2130631-1-lulu@redhat.com>
References: <20230503091337.2130631-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add support for iommufd, init the vdpa_iommufd in vdpa_start
in this step, driver will bind to the iommufd device
and attach the default ASID(asid 0) to iommufd

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 85240926b2..6c01e3b44f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1158,6 +1158,24 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     trace_vhost_vdpa_dev_start(dev, started);
 
     if (started) {
+        if ((v->enable_iommufd) && (vhost_vdpa_first_dev(dev))) {
+            struct vdpa_iommufd *vdpa_iommufd;
+
+            vdpa_backend_iommufd_ops_class_init(v);
+
+            if (dev->vdev->iommufd_ptr == NULL) {
+                vdpa_iommufd = g_malloc(sizeof(VDPAIOMMUFDState));
+
+                vdpa_iommufd->iommufd = g_malloc(sizeof(IOMMUFDBackend));
+                dev->vdev->iommufd_ptr = vdpa_iommufd;
+
+                qemu_mutex_init(&vdpa_iommufd->iommufd->lock);
+                iommufd_backend_connect(vdpa_iommufd->iommufd, NULL);
+
+                v->ops->attach_device(v, dev->vdev->dma_as, NULL);
+            }
+        }
+
         vhost_vdpa_host_notifiers_init(dev);
         ok = vhost_vdpa_svqs_start(dev);
         if (unlikely(!ok)) {
-- 
2.34.3


