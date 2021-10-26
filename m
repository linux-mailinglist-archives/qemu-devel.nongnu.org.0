Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB03643B9E5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:45:38 +0200 (CEST)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRS5-0001V4-VU
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8V-0005tJ-DQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8I-0006kI-59
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id o14so3616976wra.12
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqIyMvIPvA/nhtPgAQiuKI2im/vy4yOf0VdzA8CiiMk=;
 b=oOfXajWtIbNwkJkuAyjtpIJkjFLrET2X3YqQz5kMSOtEsz/uSpnAmwc/WHu3cCQj52
 mlTw6qb/64SR99mLqtMQjp5VZOcL+tLabkf9iOrkHh08PjdQfvo5sB+iRdbceO7Fz993
 zGnN7ZhXqiFc8CFxNp3aV073xo72/xeE36Yw0stMmLrE739J5Rn2851n8mRCRVJajkUg
 RkKxJq2sw3ogBv9sxh3bOfvuPN9J7y/e+rutmzsObUDHx1WIrba1OkzFSBmvc797n2Ld
 liNHSRHNr2vxYMJIK189W3Fqre7NRjujArOzTklQQznFdhCL+9Fw2mOCXeNUYrTwPvUv
 2fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqIyMvIPvA/nhtPgAQiuKI2im/vy4yOf0VdzA8CiiMk=;
 b=ty/YHUjNADmAt3+nMMeoI3ZE9aNQpDtOmNKool26mfYbx3sxprmSFW3+UUtkA4BHF9
 L8f8mRVB9zXeytiIaoU5jSpKHVQTAm0YaNjRicAYtN2XjqZYhVgOYl/1U+vSQSZscPtt
 M34Tun3NtSXr0yCvTddVzbLvqoDH1WThEyLmTi2RR7yM1TDxN+eDsabAWczuuS1AQC0S
 dWebs4PcrUBBHO3qHHLiauJE2aptWFKKbne0gGdsooNldmYpV6fOpaBo8D15ARxVzF3Z
 bewx731lsiP+5jQzTe7/xE8XCTaVjAF4QGClanrVf5KJ2yIuTuqPxdQQKXtNrCbCesbG
 aN9Q==
X-Gm-Message-State: AOAM532pq1X2ukiNDmJaNu3ymzfQYW3b+FY1y/iftxQ2nK9hcecG+Tpw
 /f9wSQF3r9Y9hHyUDfSSXdhCPg==
X-Google-Smtp-Source: ABdhPJxQVj9fy8cdz2caEAlHZ/F59afv9zmZT52zsZQAcHA0iTu435AsQ0/SuOfaQU6IOREMyB00Gw==
X-Received: by 2002:adf:82b0:: with SMTP id 45mr5452012wrc.120.1635272708269; 
 Tue, 26 Oct 2021 11:25:08 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b19sm1275283wmj.9.2021.10.26.11.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:25:07 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v6 3/7] hw/i386/pc: Move IOMMU singleton into PCMachineState
Date: Tue, 26 Oct 2021 19:20:22 +0100
Message-Id: <20211026182024.2642038-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026182024.2642038-1-jean-philippe@linaro.org>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x432.google.com
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
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, eric.auger@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to support a third vIOMMU for x86, virtio-iommu which
doesn't inherit X86IOMMUState. Move the IOMMU singleton into
PCMachineState, so it can be shared between all three vIOMMUs.

The x86_iommu_get_default() helper is still needed by KVM and IOAPIC to
fetch the default IRQ-remapping IOMMU. Since virtio-iommu doesn't
support IRQ remapping, this interface doesn't need to change for the
moment. We could later replace X86IOMMUState with an "IRQ remapping
IOMMU" interface if necessary.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/i386/pc.h |  1 +
 hw/i386/pc.c         | 12 +++++++++++-
 hw/i386/x86-iommu.c  | 26 ++++++++------------------
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 11426e26dc..b72e5bf9d1 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -35,6 +35,7 @@ typedef struct PCMachineState {
     I2CBus *smbus;
     PFlashCFI01 *flash[2];
     ISADevice *pcspk;
+    DeviceState *iommu;
 
     /* Configuration options: */
     uint64_t max_ram_below_4g;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 54e4c00dce..fcbf328e8d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1330,6 +1330,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
+        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+
+        if (pcms->iommu) {
+            error_setg(errp, "QEMU does not support multiple vIOMMUs "
+                       "for x86 yet.");
+            return;
+        }
+        pcms->iommu = dev;
     }
 }
 
@@ -1384,7 +1393,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
         return HOTPLUG_HANDLER(machine);
     }
 
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index dc968c7a53..01d11325a6 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -77,25 +77,17 @@ void x86_iommu_irq_to_msi_message(X86IOMMUIrq *irq, MSIMessage *msg_out)
     msg_out->data = msg.msi_data;
 }
 
-/* Default X86 IOMMU device */
-static X86IOMMUState *x86_iommu_default = NULL;
-
-static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
+X86IOMMUState *x86_iommu_get_default(void)
 {
-    assert(x86_iommu);
+    MachineState *ms = MACHINE(qdev_get_machine());
+    PCMachineState *pcms =
+        PC_MACHINE(object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE));
 
-    if (x86_iommu_default) {
-        error_report("QEMU does not support multiple vIOMMUs "
-                     "for x86 yet.");
-        exit(1);
+    if (pcms &&
+        object_dynamic_cast(OBJECT(pcms->iommu), TYPE_X86_IOMMU_DEVICE)) {
+        return X86_IOMMU_DEVICE(pcms->iommu);
     }
-
-    x86_iommu_default = x86_iommu;
-}
-
-X86IOMMUState *x86_iommu_get_default(void)
-{
-    return x86_iommu_default;
+    return NULL;
 }
 
 static void x86_iommu_realize(DeviceState *dev, Error **errp)
@@ -131,8 +123,6 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
     if (x86_class->realize) {
         x86_class->realize(dev, errp);
     }
-
-    x86_iommu_set_default(X86_IOMMU_DEVICE(dev));
 }
 
 static Property x86_iommu_properties[] = {
-- 
2.33.0


