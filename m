Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126DA3A82D5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:28:25 +0200 (CEST)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltA3E-0004cW-3F
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9wh-0004WT-1P
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:21:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9we-00026C-TY
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623766894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/ujT/H+jsCDhMHDnxsFjIbcqBjOv5SGrl9Ow17b7os=;
 b=RE9OU+6wp9rn680lhib3hIQXNZV6HXlqS2i/rZHigP/f5Gb61TIPNvDgmFKkeO2R6pkDd+
 vwGw9/wkAwtK+gQrp6uUIh65rOMh99mp9xWecLNSdUpTcI5a9fpM7gDFI09mp3TBEedi+V
 pYNHE5eCp+TrMZsqAgGS6T/102P6BLk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-vNJGclThOPusy6tm7c0OzQ-1; Tue, 15 Jun 2021 10:21:33 -0400
X-MC-Unique: vNJGclThOPusy6tm7c0OzQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so8663709wri.20
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/ujT/H+jsCDhMHDnxsFjIbcqBjOv5SGrl9Ow17b7os=;
 b=Ti95Z+ePAnhBrT15V7saeYrim0KLWeFHdlxya71OC/K97ipDGVELFHefceNlBp3Ekh
 dJaQagl/haDsS07O3lBHMOjuaW7rkmh/gzW5OvqCy3y0rNzTjFEUct9jJ8uz/NEG6wY/
 Rb26G+4OxGEvc9ZhGX4e8wVgsYRnEoAMBa6aaJy3FhtvfCXTCWY/zqId/SDscDBT0Rso
 NedoYNXgtZmkhWKDPMdEUyWKXKWE9bPbRPlMjRc0V2GScCl0RShtdvL8q7QRTQnSHWlL
 /AK/inxrOmlPGuMKfnMFECpOaEtFQsxTsSxOoCUy6nsHH7WrXE/KDnNziAnWz5eWqeiw
 Ev1g==
X-Gm-Message-State: AOAM531HUBzMqivmYHXcc6vdZHrXeDIHR/MYYffhSWXF53ri98mXIRBt
 oc3rywKCHU/xITJ6zSkzi25IM8ptk5E4RPCvyJLAFnEcW9+eq0JYuv6O+DfHFdXYkScCFJxT/W0
 UKKW9MporNl4/oGqeB4g11W2L7VV9HeLiZiJhMLnl+MRT51i1L0yjioen0D7am/Pq
X-Received: by 2002:adf:8b91:: with SMTP id o17mr25268030wra.385.1623766892015; 
 Tue, 15 Jun 2021 07:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Nr+byIDbGXXdj+92CbAwO/GPEkHWzAmI5vYjPCXokzFTyVAP92qU2pwXx8DN3AmlwcGs7A==
X-Received: by 2002:adf:8b91:: with SMTP id o17mr25267997wra.385.1623766891807; 
 Tue, 15 Jun 2021 07:21:31 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r3sm15286035wmq.8.2021.06.15.07.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 07:21:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] arm: Eliminate all TPM related code if CONFIG_TPM is
 not set
Date: Tue, 15 Jun 2021 16:21:18 +0200
Message-Id: <20210615142121.2127692-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615142121.2127692-1-philmd@redhat.com>
References: <20210615142121.2127692-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Peter Maydell <peter.maydell@linaro.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614191335.1968807-3-stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/sysbus-fdt.c      | 4 ++++
 hw/arm/virt-acpi-build.c | 6 ++++++
 hw/arm/virt.c            | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 6b6906f4cfc..48c5fe9bf18 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -437,6 +437,7 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
 
 #endif /* CONFIG_LINUX */
 
+#ifdef CONFIG_TPM
 /*
  * add_tpm_tis_fdt_node: Create a DT node for TPM TIS
  *
@@ -467,6 +468,7 @@ static int add_tpm_tis_fdt_node(SysBusDevice *sbdev, void *opaque)
     g_free(nodename);
     return 0;
 }
+#endif
 
 static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
 {
@@ -488,7 +490,9 @@ static const BindingEntry bindings[] = {
     TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
+#ifdef CONFIG_TPM
     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
+#endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
 };
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 60fe2e65a76..f1024843ddb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -205,6 +205,7 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(scope, dev);
 }
 
+#ifdef CONFIG_TPM
 static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 {
     PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
@@ -236,6 +237,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
     aml_append(dev, aml_name_decl("_CRS", crs));
     aml_append(scope, dev);
 }
+#endif
 
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -642,7 +644,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+#ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
+#endif
 
     aml_append(dsdt, scope);
 
@@ -745,11 +749,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_iort(tables_blob, tables->linker, vms);
     }
 
+#ifdef CONFIG_TPM
     if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
         acpi_add_table(table_offsets, tables_blob);
         build_tpm2(tables_blob, tables->linker, tables->tcpalog, vms->oem_id,
                    vms->oem_table_id);
     }
+#endif
 
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d4..9122e22ee0c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2599,7 +2599,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+#ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.31.1


