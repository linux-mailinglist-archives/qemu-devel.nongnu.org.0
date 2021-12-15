Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE64757D2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:34:58 +0100 (CET)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSYg-0006H8-IX
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:34:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRii-0007Jw-80
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:12 -0500
Received: from [2a00:1450:4864:20::42f] (port=44793
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRid-0000Dn-5v
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t18so37329067wrg.11
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mp6wU/cd8wCbmBM90XIFSwoBMkk3KTjj8wwjMORUlrU=;
 b=pTPRXn1ghdjXpepNQKveg/3Ab6bXQIuYtC2oUu9GQEt3dO5YwbnhQA8TqKiOgKp2IC
 YqbUm7cAC5NN3bS0/ZNZX2gFzsiqfpq3XN4FSyyendXMAS4oCeyM+zmCBlLE6BOWZzP/
 5XX6oKbCbB8xD4q9ZuSpK1e0Ena88XHQM2+KnYzMnPNXbbHnCSKgrvZ5kd8mhkDErpuG
 IYxfV/CpMH9WIg4OxD9RRLdm4xrrKgtBev2515mowMLfHKiSad867eDcjPjgF9+6PTMV
 1yU/CkRMgG26r2e7qfuTqIVIad9USVesJCucKyk37njaYM55sOepUkikqAn3fzD/q/1G
 V7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mp6wU/cd8wCbmBM90XIFSwoBMkk3KTjj8wwjMORUlrU=;
 b=grv32eOt+J7YZtQFxXLAgvgsUrnuZqdg6ytNp5jq9DnGJVU4dmLtzzHVGJqVIRvzIL
 xoPlaRAtmONeeC2GOiS1njqKUg9PXBP6iRCrA05MBd+ifAGEnSs/9P9/xqA0OhHTJoW6
 w8SIoxPqLNH8ZBfwo70Diy/C2zaW1PKS3myaD0lBuCCsOm6lCDfX8U5BBI4t73+hwzW1
 KfRY4fV2HFB109NYCq4iv6Tw1B0teLWunAhoM3pqB6RgEGBKDt21xGio6I0u9f/IwvCe
 Y6nXc200H27R0I7Sd+q6OJ4mQJNuOheGB4Ogfg3IlTQQ0gLEJ4PDtES9u6a51KPO9/xf
 6+uw==
X-Gm-Message-State: AOAM5307H/gHN69zmOGit+2bkWwzWTEoJqr7VcjiIrZMVIKV58vkxDwi
 xHzWZURemoP7Nc1DPYDSOIfuzyk+EchBdA==
X-Google-Smtp-Source: ABdhPJz73zYaKSYqLSBORjw2dZgypFCuJNs7n6NpDYg9nj5rX6oZ5CQT5hKq35J+/PhPewhL7fyapg==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr3763484wru.363.1639564865924; 
 Wed, 15 Dec 2021 02:41:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Wed, 15 Dec 2021 10:40:43 +0000
Message-Id: <20211215104049.2030475-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

virtio-iommu is now supported with ACPI VIOT as well as device tree.
Remove the restriction that prevents from instantiating a virtio-iommu
device under ACPI.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20211210170415.583179-3-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c                | 10 ++--------
 hw/virtio/virtio-iommu-pci.c | 12 ++----------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3e2144e31af..e621cada990 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2613,16 +2613,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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
index a160ae6b413..6a1df7fe503 100644
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
2.25.1


