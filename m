Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B31A42C9DB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 21:19:50 +0200 (CEST)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1majn1-00060j-R1
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 15:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1majlO-000425-UV
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:18:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1majlM-0003fy-Km
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634152684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkmfYxQOKD2S4kv2S9+unEzecgmOdRpd4tl5EZyigCY=;
 b=SLl3rl1O2O26KOLcVpzdY3ZSM1S+t2DV/WFxg+aq6OvlgzRlOGR+QCROmQdPZDiaLEeCnz
 wDWN+OjGMjw61k1EjjSXRqNIWHybrPsiPitAbg47mshE/3oDR9zVsn+gg7hJQhb6lM4Dhr
 pAEvYwP7+2wPOIpKMRtpwa1fqEFjkLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-WWhKipwZPXCeoYuz5cYTVA-1; Wed, 13 Oct 2021 15:18:01 -0400
X-MC-Unique: WWhKipwZPXCeoYuz5cYTVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3042101B4A0;
 Wed, 13 Oct 2021 19:17:59 +0000 (UTC)
Received: from virtlab-arm04.virt.lab.eng.bos.redhat.com
 (virtlab-arm04.virt.lab.eng.bos.redhat.com [10.19.152.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E422E60CC3;
 Wed, 13 Oct 2021 19:17:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, cohuck@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH v3 2/2] virtio-iommu: Drop base_name and change generic_name
Date: Wed, 13 Oct 2021 15:17:55 -0400
Message-Id: <20211013191755.767468-3-eric.auger@redhat.com>
In-Reply-To: <20211013191755.767468-1-eric.auger@redhat.com>
References: <20211013191755.767468-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop base_name and turn generic_name into
"virtio-iommu-pci". This is more in line with
other modern-only devices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/virtio/virtio-iommu-pci.c     | 3 +--
 include/hw/virtio/virtio-iommu.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 86fa4e6c28..a160ae6b41 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -98,8 +98,7 @@ static void virtio_iommu_pci_instance_init(Object *obj)
 }
 
 static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
-    .base_name             = TYPE_VIRTIO_IOMMU_PCI,
-    .generic_name          = "virtio-iommu-pci",
+    .generic_name          = TYPE_VIRTIO_IOMMU_PCI,
     .instance_size = sizeof(VirtIOIOMMUPCI),
     .instance_init = virtio_iommu_pci_instance_init,
     .class_init    = virtio_iommu_pci_class_init,
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 273e35c04b..e2339e5b72 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -26,7 +26,7 @@
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
-#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
+#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-pci"
 OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
 
 #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
-- 
2.27.0


