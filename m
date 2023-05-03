Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C756F545F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Zq-00034r-MO; Wed, 03 May 2023 05:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8Zk-0002yV-HV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8Zi-00073X-4r
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmYRbCYzitazcterE+EAaoFJhU5tvGMhxgkBemRn5q0=;
 b=gj2xsK7/g1JaInTYPhqQm/cN00MTTzx/Ngom+w4APvgMg3HZWMB4L1c1m5J2kxiEF+q4tA
 mP10Qz28QBmAkhot9lg+Q/l9bxyTuS2hu987k1Dt17pedfpeI5VYbuYPUic+WX7Y+6Vrxx
 RrUTU8B2BbtKUIJ8Zlmn1CVRB/ODuew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-ymbJDr8bPV2kQ58NdhHP1g-1; Wed, 03 May 2023 05:13:50 -0400
X-MC-Unique: ymbJDr8bPV2kQ58NdhHP1g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8B4E857FB7
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:13:49 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-29.pek2.redhat.com [10.72.12.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 039F5492C13;
 Wed,  3 May 2023 09:13:47 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [RFC 3/7] virtio : add a ptr for vdpa_iommufd in VirtIODevice
Date: Wed,  3 May 2023 17:13:33 +0800
Message-Id: <20230503091337.2130631-4-lulu@redhat.com>
In-Reply-To: <20230503091337.2130631-1-lulu@redhat.com>
References: <20230503091337.2130631-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

To support iommufd, vdpa needs to save the ioas_id and the ASID,
which need to be shared between all vhost_vdpa devices.
So Add a pointer in VirtIODevice.

vdpa device need to init it when the dev start, Add all the vdpa device
will read/write this same ptr. TODO: need to add a lock for
read and write

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 23 +++++++++++++++++++++++
 include/hw/virtio/virtio.h     |  5 +++++
 2 files changed, 28 insertions(+)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 7997f09a8d..309d4ffc70 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -18,6 +18,10 @@
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/virtio.h"
 #include "standard-headers/linux/vhost_types.h"
+//#include "sysemu/iommufd.h"
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+
 
 /*
  * ASID dedicated to map guest's addresses.  If SVQ is disabled it maps GPA to
@@ -30,6 +34,8 @@ typedef struct VhostVDPAHostNotifier {
     void *addr;
 } VhostVDPAHostNotifier;
 
+typedef struct IOMMUFDBackend IOMMUFDBackend;
+
 typedef struct vhost_vdpa {
     int device_fd;
     int index;
@@ -51,6 +57,23 @@ typedef struct vhost_vdpa {
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
 } VhostVDPA;
 
+
+typedef struct vdpa_iommufd {
+    IOMMUFDBackend *iommufd;
+    struct vhost_dev *dev;
+    /*ioas_id get from IOMMUFD, iommufd need to use this id to map,unmap*/
+    uint32_t ioas_id;
+    /*ASID used for vq*/
+    uint32_t asid;
+    __u32 devid; /*not use */
+    __u32 hwptid; /*not use*/
+    AddressSpace *as;
+    struct vdpa_iommufd *next;
+    // QLIST_ENTRY(vdpa_iommufd) iommufd_next;
+
+} VDPAIOMMUFDState;
+
+
 int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
 
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 77c6c55929..36b4783466 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -152,6 +152,11 @@ struct VirtIODevice
     uint8_t device_endian;
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
+    /*this is an ptr point to struct vdpa_iommufd, will change to QLIST if
+     * needed*/
+    /*in this struct saved the ioas_id/ASID that we need to use in iommufd
+    map/unmap, this ioas_id/ASID will share between vqs,so we add the ptr here*/
+    void *iommufd_ptr;
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
     EventNotifier config_notifier;
-- 
2.34.3


