Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC973E55D8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:48:42 +0200 (CEST)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNRB-0002CZ-5r
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPM-0006aa-DY
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:48 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPK-00086u-SU
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:48 -0400
Received: by mail-ej1-x62d.google.com with SMTP id e19so33991148ejs.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xB7FpPG1QBi8Fyann/5OmrdvhqhF3tJF6qRyCpwuZjo=;
 b=wo5V/IbMUuxMOuQOyy1gdEqRgFC/HZcZtPt9RnKGom8BsuPsFVvpq0ZwJa5rrJyq0y
 cOni6T346vHfbam6siIL+lORtLuUahArN8B6oE7yrDgFg1lBLb5Y3T0Cxj8Kn2Spxi7B
 5iTeM/ANVNh9UWV1w9UjvC72mJ+k0PNJGnPguz65E0biVDrj9fcAX7qu/F5gT98ohXMY
 KscK2Gt/ghAJ7XNzCcjpWUEUvlGssoDGr+FamzmiQmeG50Ei2tSAYjV7EQdqXVKEfE6l
 XKHmgfNOshVP6q3KippUcHNUqWGx8HtXFBA8wA3kw0w0fsdNSOon6Q33foVgLu6EWbJP
 hBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xB7FpPG1QBi8Fyann/5OmrdvhqhF3tJF6qRyCpwuZjo=;
 b=W95Z0w+cXZeZQgdEPnp7RRueNpVbolzeSHhkp2ouadIPvY1cVcibwDRIWSqKDZO3l3
 BUo8bsNsnnn1+qcSGfBeEhqqdt1emPeK1H6AicP6z7A/ag34365UBSrsg+AlsYb6oLmM
 9o5WwDa+MeefWgSO9G4GgfW2C9rtpetIfwzPUT5kvDu1CMrWgBcdeJ09kwqTGqc6urRn
 6SBP2WELlowxElyopUkcmwZXL3G8q/dMK4QrSKVHUWCKsTS0/iQQMfNI4dxujQvGAKyB
 Aq+K2sQjfzoUM0V8InvZUhJ0nsTlB36UwneNeIaPkFqO0oChuJpNW/dj/ybB8QHMVYio
 P9Iw==
X-Gm-Message-State: AOAM5322IJVwFroLM9/cs0vKVYncgw9t2NOWlB7bKfQsIbAb8giv/3eF
 pPifS23p2v8M4f27lTUTLFfhrg==
X-Google-Smtp-Source: ABdhPJzo+G7TlUr10RweXz+ZbK26erpsmLHV/vTJXpJhGfmFYXQdG3FmHz9Rp3vAUdf+oUGNYid4jA==
X-Received: by 2002:a17:907:7291:: with SMTP id
 dt17mr11359697ejc.162.1628585205361; 
 Tue, 10 Aug 2021 01:46:45 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:44 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 6/6] pc: Allow instantiating a virtio-iommu device
Date: Tue, 10 Aug 2021 10:45:06 +0200
Message-Id: <20210810084505.2257983-7-jean-philippe@linaro.org>
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
 hw/i386/pc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 694fc9ce07..fb24f000e7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1376,6 +1376,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
 
@@ -1436,7 +1444,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
 
-- 
2.32.0


