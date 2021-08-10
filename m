Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC33E55E2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:49:33 +0200 (CEST)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNS0-0005jd-QS
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPK-0006WM-SK
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:46 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPI-00084j-Oo
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:46 -0400
Received: by mail-ej1-x62d.google.com with SMTP id b15so9914635ejg.10
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w0WrmTsj2crsjvUQBpyETk8wh1igNNKeXtR7nnjXX9k=;
 b=GSU4LoJJbL9VyHHM3L22tON6TYOqHzdu9c4dpHA5Bi+yX/i1Ju/HZC22lZPEObqV9C
 vOVpk+BaFTRms839Of775KYjhOKZKhMEqwCij70r4B2Mlgpjid+xRAcHZ5BznolZuP9W
 Rb0yExz/vjGwRvprqgCJIu0w80Kn83UHjjnyc3+FHW+Kq+iq8E0dYZz5A4B8kMqoR0Wj
 BSSo1aN2yt+9dU3Q4sBuskHLozwxpd5SmXiQobkE0/wBW2oH0UjPBcZ7zrWJmpkn+YvQ
 NYWZmZ0MTb7cxQfS/Shb9fdLU0rjlwKjRY4vp7OkoCGpyJsGCElhu6HrWwmbEohHiU7A
 nHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w0WrmTsj2crsjvUQBpyETk8wh1igNNKeXtR7nnjXX9k=;
 b=Wkmu3TkSNhOLf+FGxXOb2Ha9kn2PA7wDtCzqGtq7iMuFzLiGA/IXOyH3PbsP+QjsHD
 z0yvgyqbrq0syvq7q9U1f07IyuTst1Ayw5/Md/lJm7wviInA2QvZLlIu1kc8jkKWlZo5
 FX5Np1JaNAbu8NrDh2I8m+QohpYAet9ApxQs6oporcxdetZwGkFYD9/DQGuq5TJ5IUPG
 Vg4vb/DYcQ1fyaF79YGEuohKI6lJ2CCrO8A1Lv9liadTj0veA+ERkqvJLL2Czqa4Gaq/
 XSAPUdRTcR8o+Vy5Qo84XNXyg1+086PqFoPoAXpLZtTGWyXjeNh83ZTozRQsNFWVvIQP
 ONnw==
X-Gm-Message-State: AOAM533qmnhI4VQ7gEJS2yIfGM6005OhvK4eECWpmC0LW6VF85b+zoXS
 qilJmdVR3MT8/kDD5T6V7pqhbg==
X-Google-Smtp-Source: ABdhPJy80Nj9NM828DCXOKRe4hszP4d3sAkCbA0BnrTQ4kGQTAOJMsznmEj3Uqyq2IAhzEhwU8s4jw==
X-Received: by 2002:a17:906:e0ce:: with SMTP id
 gl14mr26936247ejb.168.1628585203430; 
 Tue, 10 Aug 2021 01:46:43 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:43 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 4/6] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Date: Tue, 10 Aug 2021 10:45:04 +0200
Message-Id: <20210810084505.2257983-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62d.google.com
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
2.32.0


