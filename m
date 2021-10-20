Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D2435175
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:38:09 +0200 (CEST)
Received: from localhost ([::1]:38736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFXU-00087d-GK
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUZ-00058s-BN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:07 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUX-0002cG-8j
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e12so58606wra.4
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JOvNgK26X/wymWFWaeD3t7rim5VIlCPCs1/Ursd+4V0=;
 b=qwjl8s3o1f2q3K1oOpPZc9k7QGqhi+1+0Tmuprq6lDL1XG1trhS/0CXtnqSWlV0T80
 yOqbQges4GBGe06ADqsGNdqgN5LHeQF8gVLUidp1H9GpPdfGyV2o5gtOfrq6ii9tBlZq
 p5fBkMneaSALGkqaqn0Bu42Chnewa7vasqGBDNJt9C8uhkhdlj3vFlTrdnkPCI9Ps9Zt
 IqiDq3hTiSgUBVpRMyQq4DlLFHXbrRzH3xn8fUO51ISheXQRoJ4fwv425nawazbGpFn9
 KrRWOOXFcKHE2y0WrLMS7KNDdBIwsNotZDe8OdqBHQLM3+GXRjyN4ervkPLjB9J4UK92
 5YRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JOvNgK26X/wymWFWaeD3t7rim5VIlCPCs1/Ursd+4V0=;
 b=MOyEsyaBnB+XeQ06bGRaCLKu2NUH/bSvNYJujBQxPMg8oyvhrYJZg10Atetf0eJEL4
 B/IhizP6CVCOfuE+VIvy0+sNnVeYgMzGhYFkHX9ABwrfXMtG326e4JwOlqJ5AR/aBLUZ
 LvkX5cVdAoAjzrxScNFmAOTShkfIsXA+/TR7WnnFBXJ29GpMgXXlAJC4yC4vFx65dMxx
 N16YIOwAMB+U3hUVz0eIn3Q3iUTYLkZMI+ZAjbn/cDuANLZ1+KZ9jkhO1X0/IDwoslRa
 f3uhxWTpm8wfuB2mfMfvCh6CQp3RnGHBB369FDqV+BjthLJoIHp7NvNY1X2aTYblCs1n
 2Xmw==
X-Gm-Message-State: AOAM533Fuiw8fyl4ZD6ujgXSxILHbgKwmlWra68l6vuphTKyHMSmCFve
 HKwEshrj75jlkOIShnQgi8U6UQ==
X-Google-Smtp-Source: ABdhPJwwD3ayQcXvCifzKFt1qK5oyw0duVn0gj5W3n4z18Z0twIwrX6dyjafbSKdCeaDCUeknp1xlQ==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr725748wrd.73.1634751303921;
 Wed, 20 Oct 2021 10:35:03 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:35:03 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 06/12] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Wed, 20 Oct 2021 18:27:40 +0100
Message-Id: <20211020172745.620101-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-iommu is now supported with ACPI VIOT as well as device tree.
Remove the restriction that prevents from instantiating a virtio-iommu
device under ACPI.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c                | 10 ++--------
 hw/virtio/virtio-iommu-pci.c | 12 ++----------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f7f456bf58..3da7a86e37 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2561,16 +2561,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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
index 770c286be7..5c0b87316a 100644
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
2.33.0


