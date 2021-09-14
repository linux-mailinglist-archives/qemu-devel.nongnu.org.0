Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F540B10E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:38:07 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9ZW-0007tF-LB
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MQ-00069t-FU
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:35 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MI-0005MW-6s
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so2703857wms.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3EssKNnZXrh2nHfsbAL/+KnNzJUGLWYCayXBQqtwQg=;
 b=GQ8uMDlmNJBTj6EJqRMyXEgopIkmn/ONEFRtC5GMlb/Lzj0gauo6TLnjhq/xa9R+8a
 6rQSIqcQn3gX2LiosSJHoM33Uz8nlpM/zR8jNXdzQKbieuxYpfrt6oSX939cCLWq44vP
 LQx5e5Rie00rpbKGyoJlRUPA5MnI/x2jRqpwZfzkRIrtc9qt1rFhTmR0d6Dxfh3IDhPA
 pKKzc2s6J+vVNF1H8PSO0uRqAW/8peFROziZbDb9n8vZoFxLmGkjVrZESSvCw/tWlmxq
 z6BJSKAC4nKE6X8xxLZiHB7NRKhGnD8/a4DtMaU6aw8HY8XSweC7CVZ/3qzh3vcXrjU3
 DLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3EssKNnZXrh2nHfsbAL/+KnNzJUGLWYCayXBQqtwQg=;
 b=EQJGb+mQvtVtfibvELvpIrQ0EsPn/LV7duIOtYRhIQXQFgl+mudKCJUH1dEe7pXfD3
 6Q83GpnJdBMW3NqRR3XPZf/iQq+S+1oROOWkX9Pju4S0yr2DebpXrrCsj7a5SlLRiwOO
 MpqByZ4U5Hs6ZEibm7z+y5R1nepf45UsDWBUz5i8zsXoOboSfAukdIWL5saB6Ybv4GZT
 z4nq2iUrYe17FwSuCcmQB8bZJFt/t27k2TDeObXB8LdhP0pNPgyKD/PXLO6ws9v0Cn4v
 N+kxJA9aMN6D9DiNvWilrUkISlQqXc532qdcJDf24uZx4iW7QfPTvFwbIkBy6JbAy88h
 5f3Q==
X-Gm-Message-State: AOAM5328kqbGgQWrISNWcSaRATFht7R+olsINUgBYALcQu4Q1Mylpw7m
 trLI4jppRu6XFtpVuK9mUX1Z8A==
X-Google-Smtp-Source: ABdhPJw8JENMZqwHOoa0sn07aFPUoPNbuZGE3xQlitAlgdWy1dVtK44QBhvv7tWqbhDkR6Yu2FvTXQ==
X-Received: by 2002:a1c:7f89:: with SMTP id a131mr2466926wmd.31.1631629464193; 
 Tue, 14 Sep 2021 07:24:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:23 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 03/10] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Tue, 14 Sep 2021 15:19:58 +0100
Message-Id: <20210914142004.2433568-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-iommu is now supported with ACPI VIOT as well as device tree.
Remove the restriction that prevents from instantiating a virtio-iommu
device under ACPI.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c                | 10 ++--------
 hw/virtio/virtio-iommu-pci.c |  7 -------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73e9c6bb7c..f238766aa1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2547,16 +2547,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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
index 770c286be7..f30eb16cbf 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -48,16 +48,9 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
 
     if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
-        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
-
-        error_setg(errp,
-                   "%s machine fails to create iommu-map device tree bindings",
-                   mc->name);
         error_append_hint(errp,
                           "Check your machine implements a hotplug handler "
                           "for the virtio-iommu-pci device\n");
-        error_append_hint(errp, "Check the guest is booted without FW or with "
-                          "-no-acpi\n");
         return;
     }
     for (int i = 0; i < s->nb_reserved_regions; i++) {
-- 
2.33.0


