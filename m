Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DBC61DC95
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:39:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMp5-0007iB-7F; Sat, 05 Nov 2022 13:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMn4-0006kt-V0
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMn3-0007QF-8P
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/T3Dt9wIyzlRr9uFngTKw2OSvTs4mJnNOFX6ReE5Y4=;
 b=iVHtLkltBZouca6MOkVpVOAWE0baIDWhpav8Erv8jWdep5dPOvrXpg0PPwBRZXdZVyp9Dg
 DTQkCl+YSzd9dUg+rRN0OFCPebQM8oo6J8VPhjTHBGwQkMqPbxOcRlZO33H371f8n6r1H+
 bk/r8NhOkwJGQhvAp2C1xjT51Hvapmk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-uj0hMr2pPa-b6Ic5Rail_g-1; Sat, 05 Nov 2022 13:17:03 -0400
X-MC-Unique: uj0hMr2pPa-b6Ic5Rail_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso2468020wms.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/T3Dt9wIyzlRr9uFngTKw2OSvTs4mJnNOFX6ReE5Y4=;
 b=Q1pAfBWf5kYlZzHVqjt7UoTSkwXpImivj4zOnEqsVhZydWDO3YF79vQKm1K5X5TmQO
 U9ey+p1Ars9pHPGAn1T1f/Ib/a1Gh9V+qstPLDhx0TMou+HMGvWO3Rpe2wsvxXCznULA
 23mb0SpujHQkXCCvEKeZ74pEe9vBorv4C/OUHMidVQmXO72fEKBF2yqqc4102hnUXnCS
 3Z94wv0HIx1J7l8WnOP1KJS5/EHpMkIPlXniEYUXBT00rCQY/Pg8lTcqbC8mmD7vpI89
 KviaB/oixLEB0dMa9Cd+FpHnWqgZ4mmlAIvI8/9TRiIy3imfjhtlBWnOZJ13Evbmb0UZ
 S4Qg==
X-Gm-Message-State: ACrzQf0zbBxNPTp2e/3HuC+aDqbhmqv0D2LyYvnZGHHFyPwSpk11xBU7
 WmxkVxM6DPbR3k8mPZMfBG9H/3Zh9mdw/DxsV3mJn+++Z+GoC6JdzIDm6YtSGfM0CbYcXWXShhw
 zvKXD+8tPU+VlUxLtimLCuss63amwrJz9Kpl4ruwoDVRiFot6G6dBrp7s7G6Z
X-Received: by 2002:a1c:2942:0:b0:3cf:a30c:bb78 with SMTP id
 p63-20020a1c2942000000b003cfa30cbb78mr1776299wmp.20.1667668621723; 
 Sat, 05 Nov 2022 10:17:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FTvFT2FcRqROn+Mty42q2Guqm5/277siBG2U0fYhB/w1zsb7DuICAGg9qS9ZSHTbnzFGT7w==
X-Received: by 2002:a1c:2942:0:b0:3cf:a30c:bb78 with SMTP id
 p63-20020a1c2942000000b003cfa30cbb78mr1776287wmp.20.1667668621428; 
 Sat, 05 Nov 2022 10:17:01 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b003b4a68645e9sm7272979wmq.34.2022.11.05.10.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:00 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PULL v3 31/81] hw/virtio/virtio-iommu-pci: Enforce the device is
 plugged on the root bus
Message-ID: <20221105171116.432921-32-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


