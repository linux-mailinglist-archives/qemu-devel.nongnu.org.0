Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C504CFA7B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:23:00 +0100 (CET)
Received: from localhost ([::1]:45292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAW3-0002HU-UF
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACv-0002FO-Mi
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACt-0002q7-VJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C+16yrqZp55TwfaBLxhPraAA/6nWa+yRsPNvd15Z0zY=;
 b=LcmpF/quPU/DxYNctmh57Pg0Ur99WhG/11bH5zQNRs4NNnme8jsRRHBw9l5omv2geoKX66
 P1Jh83v0TXT2q1qxLC4mRo/oJPQ9Nbq1EovG5GCCCNTzm6UP1aAgmJ81WPfjd5MWZ+cv7K
 iYguHcgMp+iUvOCJwLjo3ZUi7PtirUc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-maKqiCQzOW-fEHXc9k_-bA-1; Mon, 07 Mar 2022 05:03:08 -0500
X-MC-Unique: maKqiCQzOW-fEHXc9k_-bA-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a50ba85000000b004161d68ace6so3204083ede.15
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C+16yrqZp55TwfaBLxhPraAA/6nWa+yRsPNvd15Z0zY=;
 b=eArBV4MA4XUCjq5zZrHZttxAYTQKZ69aD94KDUAXRaWezmEfjU7tXeGOEQKBCBvKPY
 gPjtOIkuMHM8MN9xqDu/7pHEyG+nsoVfxSpttY4cRj+rBLxNLHiBbB5q2Podhx+3DSnY
 YW8Zz7inEqr4CT5u7jex5pDgX3AuR2ElqBPvwchwVALqmjWbU+Qn9Wicoa14Ih3itCP7
 B3kPjFTc/kN6NpU7DUVzKZoownb7/d7kmnFznuhRMI+6MByt5tBVOLA2JASHXcTMXhQH
 SAw98u+3+Hlk/YFlvcmpuw0eNNmSmEcTUVkr+PbYr4MiSj9B4GX1wKl1mdvct2PnuGO7
 sIDw==
X-Gm-Message-State: AOAM532ZJ6iSL9e3mzW0z6VbFqss9tZs8qbQKtr/Jw372Pp/PqdD+3lG
 qXsk6ZfAcYJp1XjTYKBOd89BszUbRS4gbi7EL05Gg6ztnVG01VzSjQ203gzovbAZgrXsmo+iVlg
 TXgA1pEoC89zZrHria13Ijh2nIzFycsHngAv8eDnKvZDwBiAORnJTzwHabA/B
X-Received: by 2002:a05:6402:278f:b0:410:d242:465e with SMTP id
 b15-20020a056402278f00b00410d242465emr10292879ede.292.1646647387098; 
 Mon, 07 Mar 2022 02:03:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1xyFXDiil++4dcYXMc2v3iNQBg9eQ5369l6BmaivwcH9L07B+cr10GSg1kL0a27vseMnp0A==
X-Received: by 2002:a05:6402:278f:b0:410:d242:465e with SMTP id
 b15-20020a056402278f00b00410d242465emr10292856ede.292.1646647386795; 
 Mon, 07 Mar 2022 02:03:06 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 gb25-20020a170907961900b006ce423d43e1sm4620041ejc.13.2022.03.07.02.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:06 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 35/47] pc: add option to disable PS/2 mouse/keyboard
Message-ID: <20220307100058.449628-36-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

On some older software like Windows 7 installer, having both a PS/2
mouse and USB mouse results in only one device working property (which
might be a different device each boot). While the workaround to not use
a USB mouse with such software is valid, it creates an inconsistent
experience if the user wishes to always use a USB mouse.

This introduces a new machine property to inhibit the creation of the
i8042 PS/2 controller.

Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20220227210655.45592-1-j@getutm.app>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h |  2 ++
 hw/i386/pc.c         | 28 ++++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9c9f4ac748..1a27de9c8b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -48,6 +48,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool i8042_enabled;
     bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
 
@@ -64,6 +65,7 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
+#define PC_MACHINE_I8042            "i8042"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
 #define PC_MACHINE_SMBIOS_EP        "smbios-entry-point-type"
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c8696ac01e..32bf12421e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1014,7 +1014,8 @@ static const MemoryRegionOps ioportF0_io_ops = {
     },
 };
 
-static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
+static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
+                            bool create_i8042, bool no_vmport)
 {
     int i;
     DriveInfo *fd[MAX_FD];
@@ -1036,6 +1037,10 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
         }
     }
 
+    if (!create_i8042) {
+        return;
+    }
+
     i8042 = isa_create_simple(isa_bus, "i8042");
     if (!no_vmport) {
         isa_create_simple(isa_bus, TYPE_VMPORT);
@@ -1131,7 +1136,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     i8257_dma_init(isa_bus, 0);
 
     /* Super I/O */
-    pc_superio_init(isa_bus, create_fdctrl, pcms->vmport != ON_OFF_AUTO_ON);
+    pc_superio_init(isa_bus, create_fdctrl, pcms->i8042_enabled,
+                    pcms->vmport != ON_OFF_AUTO_ON);
 }
 
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
@@ -1512,6 +1518,20 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_i8042(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->i8042_enabled;
+}
+
+static void pc_machine_set_i8042(Object *obj, bool value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->i8042_enabled = value;
+}
+
 static bool pc_machine_get_default_bus_bypass_iommu(Object *obj, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1641,6 +1661,7 @@ static void pc_machine_initfn(Object *obj)
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->pit_enabled = true;
+    pcms->i8042_enabled = true;
     pcms->max_fw_size = 8 * MiB;
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
@@ -1777,6 +1798,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "hpet",
         "Enable/disable high precision event timer emulation");
 
+    object_class_property_add_bool(oc, PC_MACHINE_I8042,
+        pc_machine_get_i8042, pc_machine_set_i8042);
+
     object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
         pc_machine_set_default_bus_bypass_iommu);
-- 
MST


