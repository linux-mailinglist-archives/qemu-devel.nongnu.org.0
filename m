Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E63C7987
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:17:46 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qin-0004pJ-CS
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcG-0007ll-At
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcD-00084j-8o
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x7ZuFpyOa5DAu/c2wYuyH48s1IkBMXPNPbP+hmJeKHY=;
 b=eaImL3ehT8nFsRWiKSDk76ShvgAZIeWBeqLLDo92LC8fKFvXw+9hBUvQ0KPu8gjKHVjBdC
 AYpCZR3Q4OGXWcyvqXO4dMZYsgNJHbt/b41enDqj3yx8KotZkRzfQCp0Nz0m2aWWnYcR3U
 RrNBo2K/yIgkTKMq3z2JkCOKPGpHfqE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-nnmIpw0GO7mFgVgd0XC7hw-1; Tue, 13 Jul 2021 18:10:53 -0400
X-MC-Unique: nnmIpw0GO7mFgVgd0XC7hw-1
Received: by mail-wm1-f72.google.com with SMTP id
 x6-20020a7bc2060000b0290218ad9a8d4aso968985wmi.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x7ZuFpyOa5DAu/c2wYuyH48s1IkBMXPNPbP+hmJeKHY=;
 b=mrxidnIeeUfsd5v6/sW3VSt2Ye2jfBudqF70e6mueZsOufsih1eBsOGivxVNK1IpQF
 /fYOs/ZA44K5TY3fRbt3b+Ht79zX4ofcQu4UFfmYsu+tStUh1Q/+E+mG2dPzbx9p8SyG
 05fgy7JrNUDiFsBnHw0Ia4H/vSE/QppJa0AN7/Q6I6ZAXe3q6TfQn9aPO5j6ex4LZH+7
 HcRON53XkQbO/c0XGGTVy7SggqvVFTpGIq0Dgfc8Bkt9fGrBYTZRBm6M9z1NY0oDAR3x
 p9eT1b9XxAzgqfEzRTRpRuHMrryL4LogCjfnQiUKbaijWMv1xYihk7Einsyb10iIeTRP
 9ngw==
X-Gm-Message-State: AOAM533CyFU0pzzhQ83OWTiuOI1YVK8aV4QXTuF7UtBV9pmbW/LJt8hh
 rZAPQmis4GS5AhXqmOCH5jnFj10DulfU9VlIwDT1KDbCbDrzuzSjMrH+NesdBxm+Z96gF8oxW0Z
 V80nLCqAwH7UEptBWmD940yEGj3zBSlLd3Xeiw/FgX1x6Dg3qtJnjnUnoZ8AM
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr8851104wri.66.1626214251766; 
 Tue, 13 Jul 2021 15:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh5cmZBmBnPWo4HnVAsmN5e8Wr45QbVi/pbGVArXNTGGrLuA2Tw3ftc7wV0v4SofyEzu2XWA==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr8851075wri.66.1626214251546; 
 Tue, 13 Jul 2021 15:10:51 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id y6sm244379wma.48.2021.07.13.15.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:51 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] hw/pci/pci_host: Allow PCI host to bypass iommu
Message-ID: <20210713220946.212562-15-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xingang Wang <wangxingang5@huawei.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a new bypass_iommu property for PCI host and use it to check
whether devices attached to the PCI root bus will bypass iommu.
In pci_device_iommu_address_space(), check the property and
avoid getting iommu address space for devices bypass iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <1625748919-52456-2-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h      |  1 +
 include/hw/pci/pci_host.h |  1 +
 hw/pci/pci.c              | 18 +++++++++++++++++-
 hw/pci/pci_host.c         |  1 +
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c460..f4d51b672b 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
 
 PCIBus *pci_device_root_bus(const PCIDevice *d);
 const char *pci_root_bus_path(PCIDevice *dev);
+bool pci_bus_bypass_iommu(PCIBus *bus);
 PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
 int pci_qdev_find_device(const char *id, PCIDevice **pdev);
 void pci_bus_get_w64_range(PCIBus *bus, Range *range);
diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index 52e038c019..c6f4eb4585 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -43,6 +43,7 @@ struct PCIHostState {
     uint32_t config_reg;
     bool mig_enabled;
     PCIBus *bus;
+    bool bypass_iommu;
 
     QLIST_ENTRY(PCIHostState) next;
 };
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 377084f1a8..27d588e268 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -416,6 +416,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
     return rootbus->qbus.name;
 }
 
+bool pci_bus_bypass_iommu(PCIBus *bus)
+{
+    PCIBus *rootbus = bus;
+    PCIHostState *host_bridge;
+
+    if (!pci_bus_is_root(bus)) {
+        rootbus = pci_device_root_bus(bus->parent_dev);
+    }
+
+    host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
+
+    assert(host_bridge->bus == rootbus);
+
+    return host_bridge->bypass_iommu;
+}
+
 static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
                               MemoryRegion *address_space_mem,
                               MemoryRegion *address_space_io,
@@ -2718,7 +2734,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 
         iommu_bus = parent_bus;
     }
-    if (iommu_bus && iommu_bus->iommu_fn) {
+    if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
         return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
     }
     return &address_space_memory;
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 8ca5fadcbd..cf02f0d6a5 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -222,6 +222,7 @@ const VMStateDescription vmstate_pcihost = {
 static Property pci_host_properties_common[] = {
     DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
                      mig_enabled, true),
+    DEFINE_PROP_BOOL("bypass-iommu", PCIHostState, bypass_iommu, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


