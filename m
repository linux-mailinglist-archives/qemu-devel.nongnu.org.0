Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A804334FA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:46:34 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnZh-0002OU-Vc
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAs-0000O5-JN
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAp-0002Qk-AO
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2oaB/YSoqgr6XdYYhUq9BpuWK0l58b7kZ1rtp8COlWY=;
 b=FwoT1wHJARrOgGjArxNawAC+FP9QdrH28QYq9TTfeRjykxsSo0VicDw43iaP0ucHOVQVhJ
 Fxuh/ryTiuUfqt4Tw4p6iMXA4WLnrQe59kZtPaEPDHbZwpLa4FeG6bLxze3qtHh6QcHmEq
 6uSGH7rUkiMExuux+ti1nsia2Eekblk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-kALCX2xFP5WRlkzgeVGIrA-1; Tue, 19 Oct 2021 07:20:40 -0400
X-MC-Unique: kALCX2xFP5WRlkzgeVGIrA-1
Received: by mail-ed1-f72.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so17265684edl.18
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2oaB/YSoqgr6XdYYhUq9BpuWK0l58b7kZ1rtp8COlWY=;
 b=d6GhKYS0uKxW2JnCdgw7GImQH16gGKNHQxQc3lD9Fhktz023kkfdxU8X8f1B26uGjz
 MBPT1mZUAxUE9hpgQIjXiob1ro2aoJqN5mbe0y/+nGllZjK3KfKuSMgztjRFd08jxSY1
 jZhJSSsz9qHfTZhlOD/68SK1Zey/iko60p47+PEoE1VfvAlrNAoTIlJ0YeggK/Exn3Ua
 S13rwAJWu3i5+rARDYvhCnp8cqcrwoNI1lyGd/7ddMXlGQhA59+CrexmCyvHOZaSeb6b
 0uvkZdVhL8ZMgXzez0hj2etSwDEUqcXh0wGcOk/BTNmjm+QFgUc2g0zcYJI9Lg2TT8/M
 rW7g==
X-Gm-Message-State: AOAM532VFpOg0X6B/gKzG71fwkW771+8f9X+yYC3tIGQ+9SbRzFO5DWQ
 74KxWZdsNAGwW3NAwjKACsvJVTUrGKWeam+4ASbrmWlwgq20KKU2xoyQ1s2ie88TVvd1KSZ78XQ
 t7F0wt5dYP8A2oZAhy+aiCtEAOmC0BX0bN3t9fjLQ7/gyxOREVFm4JQkbKPtD
X-Received: by 2002:a17:906:c1da:: with SMTP id
 bw26mr39353241ejb.253.1634642438848; 
 Tue, 19 Oct 2021 04:20:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxK5RRse9GEUGEW0QyVeHsnPoKEY//WMzCQjGfd+SKSga9B2DZ8xYaXblgVu78GFD0uzQgtA==
X-Received: by 2002:a17:906:c1da:: with SMTP id
 bw26mr39353218ejb.253.1634642438639; 
 Tue, 19 Oct 2021 04:20:38 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id q14sm8587369edj.42.2021.10.19.04.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:38 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/29] virtio-iommu: Drop base_name and change generic_name
Message-ID: <20211019111923.679826-21-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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


