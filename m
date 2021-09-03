Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFEF400159
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:37:43 +0200 (CEST)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAK6-0005ZU-AW
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFL-0004NL-KW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:51 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFJ-0005ib-8M
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id x6so8497293wrv.13
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94WuptPyOzTpjzAbl+X3deh0A1E8Zn+KEwD/QXX5ut0=;
 b=SVHqGfUk5gdz5MMZMSjEadUWc884a4J/GEq9zsK0zpWsom3HsrJcgE1mtZU8a99TKY
 k635YlVzRYlFA0f46bZuTcNzZ3wGa5P6qEsjMB6oezyfqGiMa2y8y+A4OZ6aNymWzf1O
 XbFluwslPdUziTWubYgNfqk3t4m6svcylF8FXMKjlM4I4TAkuNRaKbEvQlprsZm6hyQR
 iyiGXguOXYiGbV188r6hdxh8sTI+1dVvnX4XfQk2onGoTlr7dWkjQeyOT+iIWGl3gOoJ
 J1ZgqQm0yB4lA0PyWwiZUPBtehORaU3FKxzpj0Jbswm3CsD/UjTZ+AGvqayCfgKiX4UA
 sryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=94WuptPyOzTpjzAbl+X3deh0A1E8Zn+KEwD/QXX5ut0=;
 b=clOLq1r2paoj0YeRatO8CZYanRuxJ6szro+ekRs+r27LwYWohtgkd+lYKLk5WQGbM3
 pyruy3DUuFkbE1b9rm3npiMrCGYQgyJIgxDgT3VW5n5Ff9loIwLZ5pIXX1Ywp22holws
 8odfEX6xZHWrYFe185JHIgMt2Iu3Nx3GbKJfWDcTGWGMVvgJ1Idkpg6YbRfgqVAEZqrg
 PICthSaQKe+iOZFtA+mSLdAsF1Wu9Bk/i7gjdO9vOuDey/gmMjALRGVChp/eAWrsUz/t
 HAqAGZuIAJjfoVYc6J/Ule+ez6JpWEKnrnBD6eL1iUQoLPs7xyhr5JdUbwY92uHY43Re
 T7RQ==
X-Gm-Message-State: AOAM531FEoXMAUuDGbDeXuy7mqkPgiMcmvPs2wx58EcLRjmYBwv92ZFa
 SN+7ejChbhXhHgsNiJtkW0vrpA==
X-Google-Smtp-Source: ABdhPJz8dum08TIONGKRb4vTevvMP6kIF3BfvWfN0TnDw6B4cHOjJaufSeUVqY0brMB1pTZ93dMqoA==
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr4553910wri.99.1630679563819; 
 Fri, 03 Sep 2021 07:32:43 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:43 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 7/8] pc: Allow instantiating a virtio-iommu device
Date: Fri,  3 Sep 2021 16:32:08 +0200
Message-Id: <20210903143208.2434284-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x431.google.com
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

From: Eric Auger <eric.auger@redhat.com>

Add a hotplug handler for virtio-iommu on x86 and set the necessary
reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
region is reserved for MSIs. DMA transactions to this range either
trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.

Although virtio-iommu does not support IRQ remapping it must be informed
of the reserved region so that it can forward DMA transactions targeting
this region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/i386/pc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 694fc9ce07..c1e1cffe16 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -797,6 +797,11 @@ void pc_machine_done(Notifier *notifier, void *data)
                      "irqchip support.");
         exit(EXIT_FAILURE);
     }
+
+    if (pcms->virtio_iommu && x86_iommu_get_default()) {
+        error_report("QEMU does not support multiple vIOMMUs for x86 yet.");
+        exit(EXIT_FAILURE);
+    }
 }
 
 void pc_guest_info_init(PCMachineState *pcms)
@@ -1376,6 +1381,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        /* Declare the reserved MSI region */
+        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
+                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
+
+        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
+        g_free(resv_prop_str);
     }
 }
 
@@ -1393,6 +1406,11 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         PCMachineState *pcms = PC_MACHINE(hotplug_dev);
         PCIDevice *pdev = PCI_DEVICE(dev);
 
+        if (pcms->virtio_iommu) {
+            error_setg(errp,
+                       "QEMU does not support multiple vIOMMUs for x86 yet.");
+            return;
+        }
         pcms->virtio_iommu = true;
         pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
     }
@@ -1436,7 +1454,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
 
-- 
2.33.0


