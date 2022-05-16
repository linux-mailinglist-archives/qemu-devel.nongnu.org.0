Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C56529363
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:10:23 +0200 (CEST)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiuy-0000UN-Up
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkg-0003Z3-BF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhke-00075o-DX
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/KdIel3Gt9awCesT/aqxRhV//hSfoXR69Sa6vBF2E2A=;
 b=JJJ5HhnW70WEL0n5ob9cZRgdpHz044C8kM15Zf2n1e3ZSFnPHBpEmqeTa6azDRsNzp3cmk
 Mw8QPUfMCAETLPnSNNkAkR39rHkbjoi7oiFDJltOxhwZcu2ek7dJBB9uiGrx5l0fVkI3yq
 BPJ3CHuiz9sHc+ON1Jfmng36EJJHXc0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-z3jIDzfXPJ6C1dYt2jQQtA-1; Mon, 16 May 2022 16:55:34 -0400
X-MC-Unique: z3jIDzfXPJ6C1dYt2jQQtA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s9-20020aa7d789000000b0042ab9d77febso1713724edq.16
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/KdIel3Gt9awCesT/aqxRhV//hSfoXR69Sa6vBF2E2A=;
 b=5ym12nGb4AOnxDzIVutyAXUJgZMdIEmhOiO6ykLZiA8KWpi7Z10yy5enO7HVbwKWfI
 qwBamLKBv78nnse5c3V754AsyOD5/pKP/JbW21eUf0DrZznZS2HvE5z0TdBt45mkU+Fz
 LjvbmpwFvwtq8h9+vWvEJWSsv6w4/tlJS8KxC5nIasK1hBfpOKTr/eIsj3B8f8oXp2mv
 fixvbwRvqGwjvUFivY9M8PUGDXuG1gQ8uTFqzzFskU8VOiMBvD4k/9V/SQCjTm3M/BG5
 mNU0pKqMUj7/FYPf7W37NuyCRXuSjASRArVbVqlC7nem/Od3X4fMsq8NUx1IfHNgPOIR
 2C1g==
X-Gm-Message-State: AOAM530axxd5cyvsXAoAfESAZLlkHb7+wYDidDnDA2N2WmqrZVqnqhUw
 0Ccy0cN1r0NGTDBERjO6Tj62WSDs/UcioFwHpNLiyI2yAZWIqvfsYQU4iIZQzdK2K4Fjnj15PjI
 ZovvEGwavg7CVJ8MZzc2SO3nMs4Rpq35i47Xism8H63ZsHdXUGviqZG8wZJiA
X-Received: by 2002:a05:6402:2993:b0:42a:b25c:c9ce with SMTP id
 eq19-20020a056402299300b0042ab25cc9cemr6801265edb.0.1652734533140; 
 Mon, 16 May 2022 13:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6Og+T1IJGpNPhMefxds9AMdaKlbcbp+ovmynoOVJ5uaXgrXq0SACOIn+7dKRF0YPthrsf8Q==
X-Received: by 2002:a05:6402:2993:b0:42a:b25c:c9ce with SMTP id
 eq19-20020a056402299300b0042ab25cc9cemr6801233edb.0.1652734532851; 
 Mon, 16 May 2022 13:55:32 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 v7-20020a17090606c700b006f3ef214db3sm185559ejb.25.2022.05.16.13.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:32 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 77/86] hw/i386: Make pic a property of common x86 base
 machine type
Message-ID: <20220516204913.542894-78-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaoyao Li <xiaoyao.li@intel.com>

Legacy PIC (8259) cannot be supported for TDX guests since TDX module
doesn't allow directly interrupt injection.  Using posted interrupts
for the PIC is not a viable option as the guest BIOS/kernel will not
do EOI for PIC IRQs, i.e. will leave the vIRR bit set.

Make PIC the property of common x86 machine type. Hence all x86
machines, including microvm, can disable it.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20220310122811.807794-3-xiaoyao.li@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/microvm.h |  2 --
 include/hw/i386/x86.h     |  2 ++
 hw/i386/microvm.c         | 27 +--------------------------
 hw/i386/pc_piix.c         |  4 +++-
 hw/i386/pc_q35.c          |  4 +++-
 hw/i386/x86.c             | 25 +++++++++++++++++++++++++
 6 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 83f9ac0b2a..fad97a891d 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -67,7 +67,6 @@
 #define PCIE_ECAM_SIZE        0x10000000
 
 /* Machine type options */
-#define MICROVM_MACHINE_PIC                 "pic"
 #define MICROVM_MACHINE_RTC                 "rtc"
 #define MICROVM_MACHINE_PCIE                "pcie"
 #define MICROVM_MACHINE_IOAPIC2             "ioapic2"
@@ -85,7 +84,6 @@ struct MicrovmMachineState {
     X86MachineState parent;
 
     /* Machine type options */
-    OnOffAuto pic;
     OnOffAuto rtc;
     OnOffAuto pcie;
     OnOffAuto ioapic2;
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index b81fce54a0..9089bdd99c 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -66,6 +66,7 @@ struct X86MachineState {
     OnOffAuto smm;
     OnOffAuto acpi;
     OnOffAuto pit;
+    OnOffAuto pic;
 
     char *oem_id;
     char *oem_table_id;
@@ -86,6 +87,7 @@ struct X86MachineState {
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
 #define X86_MACHINE_PIT              "pit"
+#define X86_MACHINE_PIC              "pic"
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 89b555a2f5..754f1d0593 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -247,7 +247,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         x86ms->pci_irq_mask = 0;
     }
 
-    if (mms->pic == ON_OFF_AUTO_ON || mms->pic == ON_OFF_AUTO_AUTO) {
+    if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         qemu_irq *i8259;
 
         i8259 = i8259_init(isa_bus, x86_allocate_cpu_irq());
@@ -491,23 +491,6 @@ static void microvm_machine_reset(MachineState *machine)
     }
 }
 
-static void microvm_machine_get_pic(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
-    OnOffAuto pic = mms->pic;
-
-    visit_type_OnOffAuto(v, name, &pic, errp);
-}
-
-static void microvm_machine_set_pic(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
-
-    visit_type_OnOffAuto(v, name, &mms->pic, errp);
-}
-
 static void microvm_machine_get_rtc(Object *obj, Visitor *v, const char *name,
                                     void *opaque, Error **errp)
 {
@@ -632,7 +615,6 @@ static void microvm_machine_initfn(Object *obj)
     MicrovmMachineState *mms = MICROVM_MACHINE(obj);
 
     /* Configuration */
-    mms->pic = ON_OFF_AUTO_AUTO;
     mms->rtc = ON_OFF_AUTO_AUTO;
     mms->pcie = ON_OFF_AUTO_AUTO;
     mms->ioapic2 = ON_OFF_AUTO_AUTO;
@@ -684,13 +666,6 @@ static void microvm_class_init(ObjectClass *oc, void *data)
 
     x86mc->fwcfg_dma_enabled = true;
 
-    object_class_property_add(oc, MICROVM_MACHINE_PIC, "OnOffAuto",
-                              microvm_machine_get_pic,
-                              microvm_machine_set_pic,
-                              NULL, NULL);
-    object_class_property_set_description(oc, MICROVM_MACHINE_PIC,
-        "Enable i8259 PIC");
-
     object_class_property_add(oc, MICROVM_MACHINE_RTC, "OnOffAuto",
                               microvm_machine_get_rtc,
                               microvm_machine_set_rtc,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f843dd906f..578e537b35 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -218,7 +218,9 @@ static void pc_init1(MachineState *machine,
     }
     isa_bus_irqs(isa_bus, x86ms->gsi);
 
-    pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
+        pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    }
 
     if (pcmc->pci_enabled) {
         ioapic_init_gsi(gsi_state, "i440fx");
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 302288342a..42eb8b9707 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -265,7 +265,9 @@ static void pc_q35_init(MachineState *machine)
     pci_bus_set_route_irq_fn(host_bus, ich9_route_intx_pin_to_irq);
     isa_bus = ich9_lpc->isa_bus;
 
-    pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
+        pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+    }
 
     if (pcmc->pci_enabled) {
         ioapic_init_gsi(gsi_state, "q35");
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 784d54efa9..78b05ab7a2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1261,6 +1261,23 @@ static void x86_machine_set_pit(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->pit, errp);
 }
 
+static void x86_machine_get_pic(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    OnOffAuto pic = x86ms->pic;
+
+    visit_type_OnOffAuto(v, name, &pic, errp);
+}
+
+static void x86_machine_set_pic(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &x86ms->pic, errp);
+}
+
 static char *x86_machine_get_oem_id(Object *obj, Error **errp)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1351,6 +1368,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->pit = ON_OFF_AUTO_AUTO;
+    x86ms->pic = ON_OFF_AUTO_AUTO;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
@@ -1389,6 +1407,13 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, X86_MACHINE_PIT,
         "Enable i8254 PIT");
 
+    object_class_property_add(oc, X86_MACHINE_PIC, "OnOffAuto",
+                              x86_machine_get_pic,
+                              x86_machine_set_pic,
+                              NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_PIC,
+        "Enable i8259 PIC");
+
     object_class_property_add_str(oc, X86_MACHINE_OEM_ID,
                                   x86_machine_get_oem_id,
                                   x86_machine_set_oem_id);
-- 
MST


