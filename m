Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB041F3EF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:54:13 +0200 (CEST)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMjc-0006Fx-4B
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUO-0000ax-MK
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:30 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUB-0000he-8x
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so584659wmg.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GfzrfQuCesRig+urnKnz4Z2aAE6Gevuk3T+hVeRIpxs=;
 b=xQ8Jn0vrk2k89rjJuHqRFACYxlijBivZZRJc8Yex/E0fS8B34rbVAyQuwY69WAZPY8
 yLJjlsJxwF3no34xYeFXJdup+O1DGoLPsUto6T90QurgEr8SxmGU65mYC+yw2EtH3Vae
 WJQbcM/+0e+mQlXQp534eVQUgZa5bI33+VL6/y2mmKZSCRIo9yoqielkI9aq8LolUFHm
 /o9VYXQzYdOq3o027KGZQIXCFqmgNtbxZ8CDI7Hg5ujnBwgAWOS4V0ciYKqwbfE8E+Dp
 LBAExP4QY3tnFuyBQ6+iBxEBRvt2TlzEelavoL+vxOdu4SopLWn1IorTe3odWh+g/WxA
 4+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GfzrfQuCesRig+urnKnz4Z2aAE6Gevuk3T+hVeRIpxs=;
 b=ZnuDUvJYEjsIlmE595QYXMMJwhkVS1+CqHU0PAqLzhImfiKLRHtFuX7dTY50M7qbFo
 EqnVKzySaqpAa/8h62LgyVGHR4B/WPOMRZGYB/r+jPmu5dO8nHqYJ2a5rzPMWdn+CPcq
 Dh2IlorMNgW2LF3d+r8B+SuKKvy5MouOdEs+ROQZzj8m/cwML7CCHPHKu6Qdq1kyKe3f
 LIcA4qZ7uDSUxl1KBwMkR/CID180dPSDGy4fYkVektL50/wc2lOdWhtzEqRTd8vee/OK
 4Q7urY5tJKHqZ9nFTHJEWnsDm1cIqHekkM3qsY7sQp9rTxXPk7VpbmsgsfXbuNJssFBk
 L4MQ==
X-Gm-Message-State: AOAM530wgc5I7pwKZhiCULVr3RcZZdNEO5aJs8E/YV1d6Y2cQzG3BMsB
 MUayaHkBKpRvckulHZfgq1G8pw==
X-Google-Smtp-Source: ABdhPJyczajxe7TkDQgXrynVJwuKpZpmEOhGOqtICFZVSZxVAKRB9dQED+6F2LKdVnJtsyLR2AdrXQ==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr6076321wmq.52.1633109893772; 
 Fri, 01 Oct 2021 10:38:13 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:13 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 03/11] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Fri,  1 Oct 2021 18:33:51 +0100
Message-Id: <20211001173358.863017-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
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
 ani@anisinha.ca, pbonzini@redhat.com
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
index 1d59f0e59f..56e8fc7059 100644
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


