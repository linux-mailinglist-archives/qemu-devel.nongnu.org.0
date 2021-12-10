Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A64706B5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:08:36 +0100 (CET)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjNq-0000SV-TV
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:08:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLN-0005od-FP
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:06 -0500
Received: from [2a00:1450:4864:20::536] (port=41946
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLK-0006Rc-JL
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:00 -0500
Received: by mail-ed1-x536.google.com with SMTP id g14so31184218edb.8
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4yO/WGhytnP1jShdpXsBzF1bUEx6zhOAnxporW8D5r4=;
 b=MLq0gTYbuEPiTJ2+4bFOTuCcc+RMqjNDaYHC+KLB4Olf0wCd72IWW8zJyk7QRdhURm
 AofkYcaW6YVhRHHJwCmE+NGnmnStnRAow0iMkr+uxKlQ0Qd/9g+NIztp2yJv5DMMLESn
 030l/VZkW1nHEzAJuW3ciON76FRABxhjSx1Jj15V+k6M21PJrglG8sM3b5V5Nm9qp0AW
 DmlbWW3zsoeBSqpVtGQfnxOLLIAkKabhML+S5YOw+rymRMpxeZZirGpPL7LOBY3lG11A
 FOvo/prJbTl5LEOxk1sQYPbnkv8SWVWWFLYou1WXNzUrcUQjMMzWyR9qUC1LwixeUKjZ
 zWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4yO/WGhytnP1jShdpXsBzF1bUEx6zhOAnxporW8D5r4=;
 b=3gRcef6zM6g0WkohHFgdnOe8ekSs9WeFv0dA/whASwuyZCGhCLq5WGA5cpAq9Bx2Yv
 vRdOG4+8HJFxQKCy522ZXow7AXJ4lrEnuBji50vLJYxHkXs9RXGovp3ovjaQcL1TJKQe
 5bI2r7kxlf7oBt2fycKvzceKhtvBbFW4bwhhSVd9ayiHKycyOi+zYkYY4diM50mJFpId
 DF5XyFGtGDeunSt2kX1bb/FehN07tB7LH2wPO55Wvw4r5+1EmCi64UJVqUo0LX5DDz38
 89dUtRkpawzSmylDt9HSfUlAAYO+Qb7RxfOnRtkhF9dmbSicnL/6ZLHYH1O7Zp2b+XOd
 el1g==
X-Gm-Message-State: AOAM532EYyT32rN9wUquUDQosLOnNqIrR7upS3krVsRqQv5I08A+JUAj
 KsmHkLPJ+xZmXse3yAkx5fW59A==
X-Google-Smtp-Source: ABdhPJxinpMU7LlIwehx+jdOGZHWmnfyBJZkLqCL0FwJRzDTE66boezMh4oNMY3mzp/myZW4dxTyhA==
X-Received: by 2002:a05:6402:2547:: with SMTP id
 l7mr40358309edb.301.1639155957105; 
 Fri, 10 Dec 2021 09:05:57 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:56 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 2/8] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Fri, 10 Dec 2021 17:04:10 +0000
Message-Id: <20211210170415.583179-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-iommu is now supported with ACPI VIOT as well as device tree.
Remove the restriction that prevents from instantiating a virtio-iommu
device under ACPI.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c                | 10 ++--------
 hw/virtio/virtio-iommu-pci.c | 12 ++----------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 30da05dfe0..53941e4aac 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2614,16 +2614,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (device_is_dynamic_sysbus(mc, dev) ||
-       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
+        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
-    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
-        VirtMachineState *vms = VIRT_MACHINE(machine);
-
-        if (!vms->bootinfo.firmware_loaded || !virt_is_acpi_enabled(vms)) {
-            return HOTPLUG_HANDLER(machine);
-        }
-    }
     return NULL;
 }
 
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index a160ae6b41..6a1df7fe50 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -48,16 +48,8 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
 
     if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
-        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
-
-        error_setg(errp,
-                   "%s machine fails to create iommu-map device tree bindings",
-                   mc->name);
-        error_append_hint(errp,
-                          "Check your machine implements a hotplug handler "
-                          "for the virtio-iommu-pci device\n");
-        error_append_hint(errp, "Check the guest is booted without FW or with "
-                          "-no-acpi\n");
+        error_setg(errp, "Check your machine implements a hotplug handler "
+                         "for the virtio-iommu-pci device");
         return;
     }
     for (int i = 0; i < s->nb_reserved_regions; i++) {
-- 
2.34.1


