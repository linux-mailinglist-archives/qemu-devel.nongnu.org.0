Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D006167A6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:12:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJo-0006m0-HF; Wed, 02 Nov 2022 12:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJf-0006YG-Go
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJS-0002Zp-BT
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/T3Dt9wIyzlRr9uFngTKw2OSvTs4mJnNOFX6ReE5Y4=;
 b=Fnncx+mLUz8FdqvB6tYYMLl8v6UUJkIAkkrQjD6v9UZJH5jtU0icpgypvNqoNmCDUnZV5f
 gunIwzKcyZmy2NByi0bv5cTD0D4lQY1GdKTW5rJERL02pSKJuLSAp7vpmXgkza7i9fSqav
 Q4T+jR5pobwnXpvuPJOKc6+AMczYUf4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-4xAq5Wd0PqWB0k1q5MSedQ-1; Wed, 02 Nov 2022 12:09:56 -0400
X-MC-Unique: 4xAq5Wd0PqWB0k1q5MSedQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so5041171wrb.20
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/T3Dt9wIyzlRr9uFngTKw2OSvTs4mJnNOFX6ReE5Y4=;
 b=z2WC1zvGsmGu55257/hDpI+KmsFydwiDS9tMfYV63rkDR89TS/PMlt8sLDlEicBvBD
 fCes1B1Zht6OR6IDk4WqU64a5Um544f7tA/jdorEK6G+Jl1DSg0B9t6Ncc8qXsmFI3OS
 b3nw2Jo/Zxoa0L4fxl4l6ZwrQzaIUSmIRbbdz3sBIPotrYEQA+Ssje1WyaY09FIuW1Bh
 jYLYFCMzpLtdro7f140dyIizWO1FuCy02GCS5/RC8NAIcykLX2lM2rErtwotZKQBX37h
 bYYbViXaCAy31Kd6p5QsxiHhQfoKBJLGDfw4I0ibR+BEZTynJxzdq8/90aDIHFyu9Anh
 WYTw==
X-Gm-Message-State: ACrzQf1//NpjvC1lTbX9hVSXu0lQnXBeQKWy0QrlSFBLxGv7fGNV1h0j
 Xd3pIBvhmMp24lVxbSHJAg4VcbcxniIpronAHLZ/IQqo+2HPEghvdlDd+u7n7cHMFWSvhvOrhiL
 sDoh4ShwogrtKq7ZxOQrAURxkHmQVqKkwh8vo5ZRXgIhy1FEFn2Xuln+kl3nQ
X-Received: by 2002:a1c:2543:0:b0:3c6:b7bd:a474 with SMTP id
 l64-20020a1c2543000000b003c6b7bda474mr25252666wml.95.1667405395243; 
 Wed, 02 Nov 2022 09:09:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5eHLnKXcIwsfg1c2HJIslJiYiFm3ogg0etZ/0EpetzmnzFpj2yI05nrKKQjO48bibEMrMv3w==
X-Received: by 2002:a1c:2543:0:b0:3c6:b7bd:a474 with SMTP id
 l64-20020a1c2543000000b003c6b7bda474mr25252635wml.95.1667405394929; 
 Wed, 02 Nov 2022 09:09:54 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k5-20020a5d6285000000b0022e57e66824sm15605205wru.99.2022.11.02.09.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:54 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PULL v2 33/82] hw/virtio/virtio-iommu-pci: Enforce the device is
 plugged on the root bus
Message-ID: <20221102160336.616599-34-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eric Auger <eric.auger@redhat.com>

In theory the virtio-iommu-pci could be plugged anywhere in the PCIe
topology and as long as the dt/acpi info are properly built this should
work. However at the moment we fail to do that because the
virtio-iommu-pci BDF is not computed at plug time and in that case
vms->virtio_iommu_bdf gets an incorrect value.

For instance if the virtio-iommu-pci is plugged onto a pcie root port
and the virtio-iommu protects a virtio-block-pci device the guest does
not boot.

So let's do not pretend we do support this case and fail the initialize()
if we detect the virtio-iommu-pci is plugged anywhere else than on the
root bus. Anyway this ability is not needed.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20221012163448.121368-1-eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-iommu-pci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 79ea8334f0..7ef2f9dcdb 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -17,6 +17,7 @@
 #include "hw/qdev-properties-system.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/pci/pci_bus.h"
 #include "qom/object.h"
 
 typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
@@ -44,6 +45,7 @@ static Property virtio_iommu_pci_properties[] = {
 static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
+    PCIBus *pbus = pci_get_bus(&vpci_dev->pci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
 
@@ -57,11 +59,17 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
             s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_MSI) {
             error_setg(errp, "reserved region %d has an invalid type", i);
             error_append_hint(errp, "Valid values are 0 and 1\n");
+            return;
         }
     }
+    if (!pci_bus_is_root(pbus)) {
+        error_setg(errp, "virtio-iommu-pci must be plugged on the root bus");
+        return;
+    }
+
     object_property_set_link(OBJECT(dev), "primary-bus",
-                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
-                             &error_abort);
+                             OBJECT(pbus), &error_abort);
+
     virtio_pci_force_virtio_1(vpci_dev);
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
-- 
MST


