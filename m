Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DE6F5462
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Zr-000369-Jw; Wed, 03 May 2023 05:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8Zl-00030G-C1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8Zi-00073o-GY
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryitY9tRg7IelP3yy4lFrjMVzUomwKT1eJ9sxT8lPmU=;
 b=VkTjXaLZvJdzz42za6NBOlRgY0zPRqxM7nbjXZ1F2AvVqRGlJKkuqEsZ93J8TI4otGxViE
 anOF9Z0iSHXGoUWnfqmFDWYG/SBe7aLLqMLWYjHhv8jZ7gRvt3tpjhAqi2ao6LAZz4P5+U
 pMoQ7YtDk6o1MgxXO02I47ghG1UcUYs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-CeYoq9pQNRGh6EaGJYaxeQ-1; Wed, 03 May 2023 05:13:45 -0400
X-MC-Unique: CeYoq9pQNRGh6EaGJYaxeQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8069884EC3
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:13:44 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-29.pek2.redhat.com [10.72.12.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6205492C13;
 Wed,  3 May 2023 09:13:42 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [RFC 1/7] vhost: introduce new UAPI to support IOMMUFD
Date: Wed,  3 May 2023 17:13:31 +0800
Message-Id: <20230503091337.2130631-2-lulu@redhat.com>
In-Reply-To: <20230503091337.2130631-1-lulu@redhat.com>
References: <20230503091337.2130631-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

Add 3 new UAPI
VHOST_VDPA_SET_IOMMU_FD: this to bind the vdpa device to iommufd
VDPA_DEVICE_ATTACH_IOMMUFD_AS: attach new ioas to iommufd
VDPA_DEVICE_DTTACH_IOMMUFD_AS: detach all the ioas from iommufd

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 linux-headers/linux/vhost.h | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index f9f115a7c7..bf426177f3 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -180,4 +180,76 @@
  */
 #define VHOST_VDPA_SUSPEND		_IO(VHOST_VIRTIO, 0x7D)
 
+/* vhost vdpa set iommufd
+ * Input parameters:
+ * @iommufd: file descriptor from /dev/iommu; pass -1 to unset
+ * @group_id: identifier of the group that a virtqueue belongs to
+ * @ioas_id: IOAS identifier returned from ioctl(IOMMU_IOAS_ALLOC)
+ * Output parameters:
+ * @out_dev_id: device identifier
+ * @out_hwpt_id: hardware IO pagetable identifier
+ */
+struct vhost_vdpa_set_iommufd {
+    __s32 iommufd;
+    __u32 group_id;
+    __u32 ioas_id;
+    __u32 out_devid;
+    __u32 out_hwptid;
+};
+
+#define VHOST_VDPA_SET_IOMMU_FD \
+    _IOW(VHOST_VIRTIO, 0x7e, struct vhost_vdpa_set_iommufd)
+
+/*
+ * VDPA_DEVICE_ATTACH_IOMMUFD_AS -
+ * _IOW(VHOST_VIRTIO, 0x7f, struct vdpa_device_attach_iommufd_as)
+ *
+ * Attach a vdpa device to an iommufd address space specified by IOAS
+ * id.
+ *
+ * Available only after a device has been bound to iommufd via
+ * VHOST_VDPA_SET_IOMMU_FD
+ *
+ * Undo by VDPA_DEVICE_DETACH_IOMMUFD_AS or device fd close.
+ *
+ * @argsz:	user filled size of this data.
+ * @flags:	must be 0.
+ * @ioas_id:	Input the target id which can represent an ioas
+ *		allocated via iommufd subsystem.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+struct vdpa_device_attach_iommufd_as {
+    __u32 argsz;
+    __u32 flags;
+    __u32 ioas_id;
+};
+
+#define VDPA_DEVICE_ATTACH_IOMMUFD_AS \
+    _IOW(VHOST_VIRTIO, 0x7f, struct vdpa_device_attach_iommufd_as)
+
+
+/*
+ * VDPA_DEVICE_DETACH_IOMMUFD_AS
+ *
+ * Detach a vdpa device from the iommufd address space it has been
+ * attached to. After it, device should be in a blocking DMA state.
+ *
+ * Available only after a device has been bound to iommufd via
+ * VHOST_VDPA_SET_IOMMU_FD
+ *
+ * @argsz:	user filled size of this data.
+ * @flags:	must be 0.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+struct vdpa_device_detach_iommufd_as {
+    __u32 argsz;
+    __u32 flags;
+};
+
+#define VDPA_DEVICE_DETACH_IOMMUFD_AS \
+    _IOW(VHOST_VIRTIO, 0x83, struct vdpa_device_detach_iommufd_as)
+
+
 #endif
-- 
2.34.3


