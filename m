Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B576435174
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:37:57 +0200 (CEST)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFXI-0007w9-F0
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUW-00051i-Ee
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUS-0002X0-DY
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:04 -0400
Received: by mail-wr1-x429.google.com with SMTP id e12so58283wra.4
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i19WYEt+XB11rUrQQOBD1fOttTO4Ul1mLLVvAi2QvL0=;
 b=Oqel96G8KkMs+V7uijvFVKlNu1aAI7tWMVk4ngzBBJGugNrbTAFYNvr5K90O/XOa4g
 TfG/1REB07tikL1t5f1iUoFPIO4Zi6031P0NEogqtmtjqlEAePTXAhT4psk95NtfTUad
 S3KGk8YJgNgwjIcpIzKYnFrE52vQcaHRr/xoGUWYpeVopul2zKACocy/Zp8fm9TTyRw3
 kXNXW8oMJ8xoeRg+OlN+kudVXGl52ZsWuRX1y4d2JeSuHU9Ofy77NNrikMBiUM1KfyO9
 1Rhie/kGkTgnD+61LRujP+ZKkU6Wie7RXNWROBgyJ/1x7XKXssD85qTR0I/SegZyjhBt
 1iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i19WYEt+XB11rUrQQOBD1fOttTO4Ul1mLLVvAi2QvL0=;
 b=cfawQEqgGkhkR3u8icZSoZuEKZ+TGdKftm4igbz3xJoKDtSaOEIkHax5ryqLJ7VJ8X
 +icFwhJwSHO8JVXbdy4j1CWRRH3T4d0HGZzUr40wK89nufRswMuotZxYISjxRu96mGz+
 xUelt83PczSgx6YkfBS9TfTHP3jLhKNzBC4omCj904Di05YmP7Sw+JQLA4QlkJSdtS9r
 Ul/yTZnr311RR9Qk6QRUtQOq9mxwbmVSee6REFYZ7Gpr8jxj907Cj4Ip6Bx1aCRPmi4B
 H/qCTHQ3MyeM/NJc5wLC+xHTjK/ihZQHfHhpBgY+MEvjYG47dBIe2wAjTvwKNFtUopCg
 qr4g==
X-Gm-Message-State: AOAM531wmRVYE1K64/c1NdiJlmbiZQOOVSeFWlKGZBuMiFZCWVIJsTlX
 CNvq5rFd00MSXwhV4G88W9V88Q==
X-Google-Smtp-Source: ABdhPJy3b4NnZeTtmN6ks1IA2aJh3lvjJT5U66J6hhw83f0E0XRIalVqPY7922Mv7bCpz0ygpAry5g==
X-Received: by 2002:adf:bc12:: with SMTP id s18mr756123wrg.328.1634751298973; 
 Wed, 20 Oct 2021 10:34:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:34:58 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 02/12] hw/i386/pc: Remove x86_iommu_get_type()
Date: Wed, 20 Oct 2021 18:27:36 +0100
Message-Id: <20211020172745.620101-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
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
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To generate the IOMMU ACPI table, acpi-build.c can use base QEMU types
instead of a special IommuType value.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/i386/x86-iommu.h | 12 ------------
 hw/i386/acpi-build.c        | 20 +++++++++-----------
 hw/i386/amd_iommu.c         |  2 --
 hw/i386/intel_iommu.c       |  3 ---
 hw/i386/x86-iommu-stub.c    |  5 -----
 hw/i386/x86-iommu.c         |  5 -----
 6 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
index 9de92d33a1..5ba0c056d6 100644
--- a/include/hw/i386/x86-iommu.h
+++ b/include/hw/i386/x86-iommu.h
@@ -33,12 +33,6 @@ OBJECT_DECLARE_TYPE(X86IOMMUState, X86IOMMUClass, X86_IOMMU_DEVICE)
 typedef struct X86IOMMUIrq X86IOMMUIrq;
 typedef struct X86IOMMU_MSIMessage X86IOMMU_MSIMessage;
 
-typedef enum IommuType {
-    TYPE_INTEL,
-    TYPE_AMD,
-    TYPE_NONE
-} IommuType;
-
 struct X86IOMMUClass {
     SysBusDeviceClass parent;
     /* Intel/AMD specific realize() hook */
@@ -71,7 +65,6 @@ struct X86IOMMUState {
     OnOffAuto intr_supported;   /* Whether vIOMMU supports IR */
     bool dt_supported;          /* Whether vIOMMU supports DT */
     bool pt_supported;          /* Whether vIOMMU supports pass-through */
-    IommuType type;             /* IOMMU type - AMD/Intel     */
     QLIST_HEAD(, IEC_Notifier) iec_notifiers; /* IEC notify list */
 };
 
@@ -140,11 +133,6 @@ struct X86IOMMU_MSIMessage {
  */
 X86IOMMUState *x86_iommu_get_default(void);
 
-/*
- * x86_iommu_get_type - get IOMMU type
- */
-IommuType x86_iommu_get_type(void);
-
 /**
  * x86_iommu_iec_register_notifier - register IEC (Interrupt Entry
  *                                   Cache) notifiers
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 81418b7911..ab49e799ff 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2488,6 +2488,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
+    X86IOMMUState *iommu = x86_iommu_get_default();
     GArray *table_offsets;
     unsigned facs, dsdt, rsdt, fadt;
     AcpiPmInfo pm;
@@ -2604,17 +2605,14 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
                    x86ms->oem_table_id);
     }
-    if (x86_iommu_get_default()) {
-        IommuType IOMMUType = x86_iommu_get_type();
-        if (IOMMUType == TYPE_AMD) {
-            acpi_add_table(table_offsets, tables_blob);
-            build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
-                            x86ms->oem_table_id);
-        } else if (IOMMUType == TYPE_INTEL) {
-            acpi_add_table(table_offsets, tables_blob);
-            build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
-                           x86ms->oem_table_id);
-        }
+    if (object_dynamic_cast(OBJECT(iommu), TYPE_AMD_IOMMU_DEVICE)) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
+                        x86ms->oem_table_id);
+    } else if (object_dynamic_cast(OBJECT(iommu), TYPE_INTEL_IOMMU_DEVICE)) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
+                       x86ms->oem_table_id);
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 9242a0d3ed..91fe34ae58 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1538,7 +1538,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
 {
     int ret = 0;
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
-    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     PCMachineState *pcms = PC_MACHINE(ms);
     X86MachineState *x86ms = X86_MACHINE(ms);
@@ -1548,7 +1547,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
                                      amdvi_uint64_equal, g_free, g_free);
 
     /* This device should take care of IOMMU PCI properties */
-    x86_iommu->type = TYPE_AMD;
     if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
         return;
     }
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 75f075547f..c27b20090e 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3806,9 +3806,6 @@ static void vtd_realize(DeviceState *dev, Error **errp)
     X86MachineState *x86ms = X86_MACHINE(ms);
     PCIBus *bus = pcms->bus;
     IntelIOMMUState *s = INTEL_IOMMU_DEVICE(dev);
-    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
-
-    x86_iommu->type = TYPE_INTEL;
 
     if (!vtd_decide_config(s, errp)) {
         return;
diff --git a/hw/i386/x86-iommu-stub.c b/hw/i386/x86-iommu-stub.c
index c5ba077f9d..781b5ff922 100644
--- a/hw/i386/x86-iommu-stub.c
+++ b/hw/i386/x86-iommu-stub.c
@@ -36,8 +36,3 @@ bool x86_iommu_ir_supported(X86IOMMUState *s)
 {
     return false;
 }
-
-IommuType x86_iommu_get_type(void)
-{
-    abort();
-}
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index 86ad03972e..dc968c7a53 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -98,11 +98,6 @@ X86IOMMUState *x86_iommu_get_default(void)
     return x86_iommu_default;
 }
 
-IommuType x86_iommu_get_type(void)
-{
-    return x86_iommu_default->type;
-}
-
 static void x86_iommu_realize(DeviceState *dev, Error **errp)
 {
     X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
-- 
2.33.0


