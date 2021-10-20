Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B97F4349D5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:10:55 +0200 (CEST)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9Uk-0006Rl-A5
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hk-0004Q1-KO
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hj-0003LQ-0K
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2oaB/YSoqgr6XdYYhUq9BpuWK0l58b7kZ1rtp8COlWY=;
 b=CtIkSWXzB887vCTPaa1rLQVI7ljIPIpZ0EngYIHEhAgy9Nr7sRp2o70rEqwSaHvXa4mCCm
 aRoDbW+xihwef82Q/nvbtknJaL+WfayiN95ej1pYjoIddtaG/DJPcz49q55G5dR9TtDD+6
 XDow+ieYEH0eTXqXLQYO7VJ2ugJ41sw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-Ic5BVvxCPryaNCe5EF-rJQ-1; Wed, 20 Oct 2021 06:20:13 -0400
X-MC-Unique: Ic5BVvxCPryaNCe5EF-rJQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so20505290eda.23
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2oaB/YSoqgr6XdYYhUq9BpuWK0l58b7kZ1rtp8COlWY=;
 b=xLRWSP/YyoeD0I71wZr6zdqhQieumBw4L6HbRlhBEDcaoUuy6tCXyGHbkwgJgUHXgn
 Pfc35qEdiBV6/2GXQOubWnra0QYQPdot6UZ4cZmEL/DSRfuDIYML2Uwvd8OmxkGNi2wu
 gNzPlEoJgZM+xsRQa1JKHYo+J0PQMiAphh1jdkVyMHlRYo0Xg4f53MgYiJXRM5K/jeeT
 UFjmZwnhLZFJZ98+N3YU6IIzbpdmDfy1rzDJisTeLcGXgu1YBnUhvk/szVaxBhkA2muQ
 IHI1feh2mMPLgKsGkCul/ovxYTM4xz3FQxby2UahFBoIQh1xrESMpDkCAGhiCNtM0L3J
 yLNQ==
X-Gm-Message-State: AOAM532J6C7AHbgua7Rm7V/SiRnYPJLeJfN3Ft9gj/uvcfwQbyIvz1mY
 Nbi0Kpn99wLUvLtOTJv6Qyy93WBzRWziQfjfdptG6aXWz9qm0VheIPW5sj2mln22RhQky3mD5qe
 TDe2fvGdsZnbF89UUSpiBwCeo6KpVfnfKDcnxhPzLPOw7qDjj4xe8z6vy1RX5
X-Received: by 2002:a17:906:4e4a:: with SMTP id
 g10mr43717894ejw.524.1634725211504; 
 Wed, 20 Oct 2021 03:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVihFRFyLGt/T+IJCK/gCpPjwxd9b3VLjMHsGiemR8cXoIjExv7u8fChzYEy5o/nwX9d/1JA==
X-Received: by 2002:a17:906:4e4a:: with SMTP id
 g10mr43717876ejw.524.1634725211336; 
 Wed, 20 Oct 2021 03:20:11 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id m6sm836459ejl.42.2021.10.20.03.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:10 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 20/44] virtio-iommu: Drop base_name and change generic_name
Message-ID: <20211020101844.988480-21-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Drop base_name and turn generic_name into
"virtio-iommu-pci". This is more in line with
other modern-only devices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20211013191755.767468-3-eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-iommu.h | 2 +-
 hw/virtio/virtio-iommu-pci.c     | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

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
-- 
MST


