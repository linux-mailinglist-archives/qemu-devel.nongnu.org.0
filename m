Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788744247D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:07:26 +0100 (CET)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhKn-0002nq-2b
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyp-00021J-AQ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyl-0004Fo-8Z
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jd+7SCo+cPq4PXfrJicKIgmeVY5J4cyEzVidCztEKUY=;
 b=aJMNHYOHogwzQ0ZqzG7Fr4zS3ftLrw5JBzEBE+3ZaLOOMsHgVc4USH8AdAkRvBfwsaOz8b
 /EXZJw6tvlt2q/M35iMLU+qKFl7INIfBwdILLR7zQVW7O+rVkCaLVfGW/Sie7WtBuSY06W
 K/eT8/pEi2FvbpHWtyAvrabDaTiTq2U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-h1XGWQQ1MfC0TXJutb-TUw-1; Mon, 01 Nov 2021 19:44:37 -0400
X-MC-Unique: h1XGWQQ1MfC0TXJutb-TUw-1
Received: by mail-ed1-f71.google.com with SMTP id
 o22-20020a056402439600b003dd4f228451so17040017edc.16
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jd+7SCo+cPq4PXfrJicKIgmeVY5J4cyEzVidCztEKUY=;
 b=LQw08ADcgDTB82zTBrkqmT0fSqlnpNmuO8NqWeDwY57gew+6jbGXR/I7L0PGxlidPz
 R8uWLjXf8HIMxNFaQKaAu6QPggGQBULhZOXx7fCnB+1u45CqiaLTi30HVHX6a584GLx7
 gRymlu9ieho/n5l5Uojih4Yk9cJC5Jl+MkfuTv+2XvZQZjN/r+pMIhnfIwmjv0AT2BAP
 SeCAQPWgSI7unQeEMCrtd/iJ5c3zBO5Rw9hpw/9T4M0qZbdyCJTTe07SASzyTaBJ51hy
 QC0CHxOdtBs2JTnztCwJaHrpoReWAXYmQuaGsoQeaLkOvbk9p/XgatjM4Lc0IGjnFwPx
 7tqg==
X-Gm-Message-State: AOAM533+88gmQfU2lcHHxmeVXQGcMaCp2KMjjngyb2WmO/AQYqqnv3+g
 y5g1vWiAr08ZGIj9Ce8npBTbI6jYzwHVcyza1sidNbKhT+lk3CfK8/8jG5mrLY5WR6CZH7n7zzp
 OQFx3+MYapgTanF40S6qvjnvGLYbNtdpWqirW6JKiNK3xv1bfPzVp3DI0qMR9
X-Received: by 2002:a17:906:1683:: with SMTP id
 s3mr27246301ejd.331.1635810275954; 
 Mon, 01 Nov 2021 16:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwaPF4na+Y8jCWNtma8gH5bwC5KSi1PoF7JExA82Hi2H1mXvDEVDD9VEhKPBBhZD7tsK3Z4Q==
X-Received: by 2002:a17:906:1683:: with SMTP id
 s3mr27246253ejd.331.1635810275628; 
 Mon, 01 Nov 2021 16:44:35 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id hv9sm7512045ejc.51.2021.11.01.16.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:35 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] hw/i386/pc: Remove x86_iommu_get_type()
Message-ID: <20211101234358.582487-5-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

To generate the IOMMU ACPI table, acpi-build.c can use base QEMU types
instead of a special IommuType value.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20211026182024.2642038-3-jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


