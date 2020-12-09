Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3527C2D48E9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:27:36 +0100 (CET)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Bb-0001uW-7b
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sL-0001tK-N5
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sI-0007sC-9x
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eNcV8yenr5e4/gQuOd0WGDeItExL2HtrnjnsPaPv3a0=;
 b=CKedmBXugKdjUAcOGwpg8pW5qEAFOTL7s9vRvif/TqTQH+9UUHlmz1EgNNGxzTksFKbz5N
 feHkm5I0crIytm5EGE2Dr1dq0XS0Q7iQtoyXMC9IZsc9VHxEgOdyTbwhC+9MU2DtyLsGgE
 a+lAEkxWgReY6Bj9iBb4x6Bq07rv9FA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-R68z7d5nP9eHlY4dKAFxIA-1; Wed, 09 Dec 2020 13:07:35 -0500
X-MC-Unique: R68z7d5nP9eHlY4dKAFxIA-1
Received: by mail-wm1-f72.google.com with SMTP id a134so638450wmd.8
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eNcV8yenr5e4/gQuOd0WGDeItExL2HtrnjnsPaPv3a0=;
 b=l8zpDSTlSXFGsEP35YdVOoFtCdM4Grx6rzbK5SBVW0GDzJelPo98x9TS991klltqNF
 +ua5VBwiO77XgOMUL0mOYlXhQq1+oHBHgmDEXtRd15k8fFj1kDc+foBMb0eJrBQZ7Y4g
 prkr3Al1ARBNi6VEEpYncns02zg/cfOPPrTa1v2GuAwQiWlEaso0dyAQXltNdQjbyy8H
 EaE6YHRuGnXsw9Xov4fxnAnxfbAnPk4Wz+9u1rAEHfrI4ZMTIlijZrp5vKcYJSo5Y8M3
 fpFiqVLY5l70GfiAWTKPeNH/dpEKTWe5D9GM6vTskm6Dhob/XTCaAD8dEdjpA58/QWcs
 YTTQ==
X-Gm-Message-State: AOAM532Sm0Bf99XWfvujRb8x/gqYLCRm89leMd+OJzzvh/YgxBvbuStG
 OfMBQSSLiF7elTWwRoTuAT8dbDl5tmkrXxIIUpdH0HtrkhRQJDL+Spl8dvRKAQc84FNt325DMvb
 ARXZuMyQRRXyZKgglvjgl+CwsPhSc+25qdhFc0Rb47t00hPpBVwEmRpKRlw1O
X-Received: by 2002:a7b:c182:: with SMTP id y2mr4041427wmi.57.1607537253550;
 Wed, 09 Dec 2020 10:07:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBlOjzcVqu/OJDiGqmE0d3OdChXQINZdHe2dPqxbDChR+TbY5Cdtw47IM96VBQNblEx+cnbQ==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr4041407wmi.57.1607537253397;
 Wed, 09 Dec 2020 10:07:33 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z17sm4488154wrh.88.2020.12.09.10.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:32 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/65] hw/arm/virt: Write extra pci roots into fw_cfg
Message-ID: <20201209180546.721296-11-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 qemu-arm@nongnu.org, Yubo Miao <miaoyubo@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

Add bus property to virt machine for primary PCI root bus and use it to add
extra pci roots behind it.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Message-Id: <20201119014841.7298-4-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/arm/virt.h | 1 +
 hw/arm/virt.c         | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aad6d69841..abf54fab49 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -163,6 +163,7 @@ struct VirtMachineState {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    PCIBus *bus;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..847257aa5c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1289,7 +1289,8 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
-    if (pci->bus) {
+    vms->bus = pci->bus;
+    if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
             NICInfo *nd = &nd_table[i];
 
@@ -1346,7 +1347,7 @@ static void create_pcie(VirtMachineState *vms)
 
         switch (vms->iommu) {
         case VIRT_IOMMU_SMMUV3:
-            create_smmu(vms, pci->bus);
+            create_smmu(vms, vms->bus);
             qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
                                    0x0, vms->iommu_phandle, 0x0, 0x10000);
             break;
@@ -1481,6 +1482,8 @@ void virt_machine_done(Notifier *notifier, void *data)
         exit(1);
     }
 
+    fw_cfg_add_extra_pci_roots(vms->bus, vms->fw_cfg);
+
     virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
-- 
MST


