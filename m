Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0B44246D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:58:49 +0100 (CET)
Received: from localhost ([::1]:40170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhCR-0004zP-J9
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyr-00022h-Mp
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyo-0004GJ-Ue
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dVILjbM3XJCaQkLgjAFWpZSW6dwsRFfaPUIs4btAH2g=;
 b=ckwqWhP703Z2VlSY6s9DvELMQLDF0NefhMYOtppkm8mNh5f3XugIN/OBFb1ZPTrkjLLqSS
 rwDYWqEwjKE2Rb/VDbmgte6pcVsVaokXFf3rcBaGUBbkbGf7v9C2jCDZw1wAjTRNmyKmVT
 BNQfEmdi6nLmT4OANUYEzQSkyrN/avM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-N_zosMOtNuC2h-_vqyykaQ-1; Mon, 01 Nov 2021 19:44:40 -0400
X-MC-Unique: N_zosMOtNuC2h-_vqyykaQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 w11-20020a05640234cb00b003e0cd525777so12368942edc.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dVILjbM3XJCaQkLgjAFWpZSW6dwsRFfaPUIs4btAH2g=;
 b=Dh/faa4yNxFwwtNO2Cim+dufDiGTRicT+LrMX3z2xNe3EWVjmAOHZHKqfJbdsBAigE
 FLuRwW4XsuA0SpLlQTr3McaIhpn9B6Gq879U/khNX3ELV2HuRBuqiYBQ1kOFaWagVAAr
 PHISAaHg3u05IKgAdpSE40oi5Bi0GJX5aNE9IOD5NBegwGIqcjBdrLJsEIgRg5FR1sqw
 cUJzfYmGhBUEu94znpryq2Y4cJwFGpGlWz2tQmbn2Xiu9hy8grVjCBbyM0p5C6uw1NtS
 1tQaBtjJ3YTIyDYHdd4WWPvaHzt2OvzwVd0gFis32i7ZAgraOk4hVPVx3I0QW0vUXuAx
 jqFQ==
X-Gm-Message-State: AOAM533ryTCZzDIWFx8cjPdAKDWK9j8KObsK0MPo9w29UP31V4zQYjUF
 8uH9LsIKIy7GHa0qa7MMI2hbH4sIvUFlbDB5eafSD4V8418bKz4qXrwW30xxC6F1lyKO/X1Dk3s
 vPOWh5Z86rFaSWEGc4gYDAWe2KGG6k6csp7IzXbrNoMKqWm2Ye71Ib+fi6l01
X-Received: by 2002:a17:907:1b1f:: with SMTP id
 mp31mr39966529ejc.319.1635810279008; 
 Mon, 01 Nov 2021 16:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz89k7tjClalT0XMcZIHxNVQkzsWOuJviFktKrirBVqK+CtxTnPtuXDWcj+Dw01yfXo2rvBkQ==
X-Received: by 2002:a17:907:1b1f:: with SMTP id
 mp31mr39966489ejc.319.1635810278791; 
 Mon, 01 Nov 2021 16:44:38 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id sd28sm1339174ejc.37.2021.11.01.16.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:38 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] hw/i386/pc: Move IOMMU singleton into PCMachineState
Message-ID: <20211101234358.582487-6-mst@redhat.com>
References: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
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
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.734, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

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
Message-Id: <20211026182024.2642038-4-jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h |  1 +
 hw/i386/pc.c         | 12 +++++++++++-
 hw/i386/x86-iommu.c  | 28 +++++++++-------------------
 3 files changed, 21 insertions(+), 20 deletions(-)

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
index 86223acfd3..7b1c4f41cd 100644
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
-{
-    assert(x86_iommu);
-
-    if (x86_iommu_default) {
-        error_report("QEMU does not support multiple vIOMMUs "
-                     "for x86 yet.");
-        exit(1);
-    }
-
-    x86_iommu_default = x86_iommu;
-}
-
 X86IOMMUState *x86_iommu_get_default(void)
 {
-    return x86_iommu_default;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    PCMachineState *pcms =
+        PC_MACHINE(object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE));
+
+    if (pcms &&
+        object_dynamic_cast(OBJECT(pcms->iommu), TYPE_X86_IOMMU_DEVICE)) {
+        return X86_IOMMU_DEVICE(pcms->iommu);
+    }
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
MST


