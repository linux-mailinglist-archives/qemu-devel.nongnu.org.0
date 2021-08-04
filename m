Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893A3DFA1C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 05:51:10 +0200 (CEST)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB7vx-0003i6-AH
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 23:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7tW-0007Nq-Vs
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7tV-0000Xl-Fz
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628048916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B53R/rsTTsnu/S11HHR43iScLS7sGCsbwUGyB2wxgHI=;
 b=CI8B+SgavcAB6g/zJDvHsFrzTde2MgTtlPGXcLZhfCW0PW8xMHkCme7SZeTSbkmHPHp46b
 No9mXppU20Vgxxdt2WrXmiimJ/Re4Z+NRJ06c+LG1/QfwplJo2IfzVuG3DUlZP2eUbacie
 90Y5jlCoI6k1Pj9xAzslZSZdgKryNAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-0qIvhXUPO3yqsA-lJhBBDQ-1; Tue, 03 Aug 2021 23:48:33 -0400
X-MC-Unique: 0qIvhXUPO3yqsA-lJhBBDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A1D31006C80;
 Wed,  4 Aug 2021 03:48:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-234.pek2.redhat.com
 [10.72.12.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CAA560854;
 Wed,  4 Aug 2021 03:48:25 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] vhost: correctly detect the enabling IOMMU
Date: Wed,  4 Aug 2021 11:48:03 +0800
Message-Id: <20210804034803.1644-4-jasowang@redhat.com>
In-Reply-To: <20210804034803.1644-1-jasowang@redhat.com>
References: <20210804034803.1644-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: mst@redhat.com, Jason Wang <jasowang@redhat.com>, Wei.Huang2@amd.com,
 dgilbert@redhat.com, peterx@redhat.com, Sriyash.Caculo@amd.com,
 pbonzini@redhat.com, chao.gao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vhost used to compare the dma_as against the address_space_memory to
detect whether the IOMMU is enabled or not. This might not work well
since the virito-bus may call get_dma_as if VIRTIO_F_IOMMU_PLATFORM is
set without an actual IOMMU enabled when device is plugged. In the
case of PCI where pci_get_address_space() is used, the bus master as
is returned. So vhost actually tries to enable device IOTLB even if
the IOMMU is not enabled. This will lead a lots of unnecessary
transactions between vhost and Qemu and will introduce a huge drop of
the performance.

For PCI, an ideal approach is to use pci_device_iommu_address_space()
just for get_dma_as. But Qemu may choose to initialize the IOMMU after
the virtio-pci which lead a wrong address space is returned during
device plugged. So this patch switch to use transport specific way via
iommu_enabled() to detect the IOMMU during vhost start. In this case,
we are fine since we know the IOMMU is initialized correctly.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7b7bde7657..d2097b7423 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -286,7 +286,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
      * does not have IOMMU, there's no need to enable this feature
      * which may cause unnecessary IOTLB miss/update trnasactions.
      */
-    return vdev->dma_as != &address_space_memory &&
+    return virtio_bus_device_iommu_enabled(vdev) &&
            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
 }
 
-- 
2.25.1


