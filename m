Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168ED43B9FD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:52:30 +0200 (CEST)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRYj-00028g-5C
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8M-0005q7-C2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8G-0006kC-Fn
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id s19so20769866wra.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBXmdRUbEUPFBogj5pnpdToBPy/z1nkr8P184D9uY9k=;
 b=U63d9DcKqxCkJA6nt0kaqJOTEjnZn+CbkJCfgIAPz5Rg2nszhtGP10SxAzswRZkZ2D
 BXrgnWo8unAJw+Q3CFTK4NxTTytwbUp/fAyI6LaOn92deneJ2SWBNPfmxUVWyqUPPYfn
 1LqlLVH7Ici1KlfKSyTwkSXipparXZHIMvgvjqhQ7aDnr4PKAhh8r1UQMz4K9WLAXTyM
 mOBoaHZwR45UEbQaco/gkZjthqEe5YAva1hwg7Hybf3vwH/kd4IfOmdyRKxSriH0v1Be
 7BVEyjloG87qDLWpu5ixHtO4T9jcvygqtSORhIWHwssNhDWsaEOdFic1Xn40CFYWjeYH
 umFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SBXmdRUbEUPFBogj5pnpdToBPy/z1nkr8P184D9uY9k=;
 b=IcLLhI4SGqJNfIbSrg2JWT22zVA5e14rRMm2J3gwU2Bjae0fy4+AEdenB8TnvSMpFc
 HxTdUOsWvfXl+A9VMFkZBv4NB2kzvzK4LKm9k8YFtRLeTvI4NHP79kVXczL5OH1gCeO5
 HtQn+xoCBWBqZ1vjN6tWZqKdYoBvebVGDIoxl+xvQP6PVOJ5yajlmQUvM6j9hu917IJX
 pGzy/ZTrAYIimZr2oa0UJZbAgVZjQT8niRd1ZpjNbJfoU3Fum/fqA2Tf8oG9WIgL59i7
 1FJP+K/GuYZEcvn4XNpHtnKlVdrO0OsRvvTQdKQXOMAaNSDEFISz/9SoPxERrHW1QH1o
 +twQ==
X-Gm-Message-State: AOAM5338nUGIdpa5XapEDc7L2ZYwNP5J6iEVuM96cUBOGtkLbjUnipxD
 mC+dmW0rwlEOGkA1sVOuVKK36A==
X-Google-Smtp-Source: ABdhPJy63eJU4hABjpI1gu89+OzoBS1b/cR0ewEv02gxiS8CKMQilRjGCp5Ja3vBDmCSPG21AHAZnQ==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr34348136wrv.206.1635272707045; 
 Tue, 26 Oct 2021 11:25:07 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b19sm1275283wmj.9.2021.10.26.11.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:25:06 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v6 2/7] hw/i386/pc: Remove x86_iommu_get_type()
Date: Tue, 26 Oct 2021 19:20:21 +0100
Message-Id: <20211026182024.2642038-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026182024.2642038-1-jean-philippe@linaro.org>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, eric.auger@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To generate the IOMMU ACPI table, acpi-build.c can use base QEMU types
instead of a special IommuType value.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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


