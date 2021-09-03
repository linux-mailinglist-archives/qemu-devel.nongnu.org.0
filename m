Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88ED40015B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:39:43 +0200 (CEST)
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAM2-0000QK-Rz
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFI-0004IA-5t
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:44 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFF-0005dr-PE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:43 -0400
Received: by mail-wr1-x433.google.com with SMTP id x6so8497059wrv.13
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eo54h4KkqnKKCP3+eSELsEpD4Rb9+IjUu6cLRetgdhQ=;
 b=ScgXm3RESccpMpDfCMkTfu/IHJwp9dlW070uJ8iLHVbRvSdXp4cryVAFll4jU8a6R3
 DLOIW0gJQKjE4TShxEQUPHPX9ZBto9wW8XZZdWZb8HIZmnPasOoqaPZ7ZwrxpNY1F1r8
 rQSW9HKjic7Y41mSRv5Pm+o6nN6dy/4t1dsRHe5JKQo5zDt/eyCTRscOVRYhTKJE59/2
 Ep31GDVp6nczQnA8R5UFPCqFqR/clb92b5+bL3Bffr+KjJp4SAX83JyClJVh3dHCkLe1
 gZIJl2I7ICUAbNtyTcN40Linjxy91fOjOi5g+MJ5oCym4KckefZ7PYznusguQlOoSL8x
 hYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eo54h4KkqnKKCP3+eSELsEpD4Rb9+IjUu6cLRetgdhQ=;
 b=J7s/MUozXU7bNYL18gymZo0wU1EDdnzkA011UKeM683OjccfmqVypPmkZ6T5/qOApN
 8ZGNGt3Cy8BxgVaoS7fnDHhQbgsZffxcvHtGCZJQAiXvC/vYYUdYHzYjJUBp7/4mmCBI
 /6re/nuKwfkJhrMsvmLMfhqy/R+SEZsm6OrXdl0rEBOyyW4P+q08SfI1jpVVRnRyJlnA
 gLTZ/G0K8R01sZdLU442aUH1U5h8a40JW2+9ynfmmDY4gz/SuXLuCMsaBMf/ySC2BLGZ
 WbHu+xv7dGg0u+cYmdvWT+jwYigl4jigBp/jxIsVGuUuz4KfNj9z0n+h9XQMwOX8Dqnh
 sQPQ==
X-Gm-Message-State: AOAM532ovdPhz7mjH70M5qTwU8OlhdjyNBm+n9LX+y10Fqf6ZQ0wOCgd
 9wHZHaCsSRDDMWwNMYxUPhvpmA==
X-Google-Smtp-Source: ABdhPJyxWfzZUwE32KOV2las1zh1PJ4EnjnqgzgCodE6d3dbOu+SyjlW9v2+G32G8Tf1Pmr6CTE2FA==
X-Received: by 2002:adf:e449:: with SMTP id t9mr4429438wrm.135.1630679560389; 
 Fri, 03 Sep 2021 07:32:40 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:39 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 4/8] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Fri,  3 Sep 2021 16:32:05 +0200
Message-Id: <20210903143208.2434284-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-iommu is now supported with ACPI VIOT as well as device tree.
Remove the restriction that prevents from instantiating a virtio-iommu
device under ACPI.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c                | 10 ++--------
 hw/virtio/virtio-iommu-pci.c |  7 -------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0b..b4598d3fe6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2551,16 +2551,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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


