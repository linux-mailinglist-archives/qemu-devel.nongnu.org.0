Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E0343B594
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:28:50 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfONe-0003le-1m
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfO74-0002Cd-PE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfO72-0004UI-Uq
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WksQepENHSVs450wBWVB7cwqfPbkUBmDbyaSnQ9L77k=;
 b=c7s1HLKlIvlJGcq+FMzLXOqdLKKukSAtMgGsogNAWD4hTmnO/T/fqu9CiYWqaAktH/b4NC
 qqaFZdNE7QUqVdKHswSJmP+oANQdZ2cu58ruPR/os2esGHJeXwNQUZ4r6adRFo2ZNRGa3S
 lmXuodHJL9ktKn4xIBXPUBdb8xa+DlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-eNSfdWkdN_OEYleeoUuNVw-1; Tue, 26 Oct 2021 11:11:35 -0400
X-MC-Unique: eNSfdWkdN_OEYleeoUuNVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77958101B4A4;
 Tue, 26 Oct 2021 15:11:34 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69C055F4E0;
 Tue, 26 Oct 2021 15:11:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] hw/i386: expose a "smbios-entry-point-type" PC machine
 property
Date: Tue, 26 Oct 2021 11:11:00 -0400
Message-Id: <20211026151100.1691925-4-ehabkost@redhat.com>
In-Reply-To: <20211026151100.1691925-1-ehabkost@redhat.com>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The i440fx and Q35 machine types are both hardcoded to use the
legacy SMBIOS 2.1 (32-bit) entry point. This is a sensible
conservative choice because SeaBIOS only supports SMBIOS 2.1

EDK2, however, can also support SMBIOS 3.0 (64-bit) entry points,
and QEMU already uses this on the ARM virt machine type.

This adds a property to allow the choice of SMBIOS entry point
versions For example to opt in to 64-bit SMBIOS entry point:

   $QEMU -machine q35,smbios-entry-point-type=64

Based on a patch submitted by Daniel Berrangé.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is patch was previously submitted at:
https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com

Changes from v2:
* Rename "smbios-ep" to "smbios-entry-point-type"

Changes from v1:
* Include qapi-visit-smbios.h instead of qapi-visit-machine.h
* Commit message fix: s/smbios_ep/smbios-ep/
---
 include/hw/i386/pc.h |  4 ++++
 hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
 hw/i386/pc_piix.c    |  2 +-
 hw/i386/pc_q35.c     |  2 +-
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 11426e26dc3..95f7f55cdc6 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -13,6 +13,7 @@
 #include "hw/hotplug.h"
 #include "qom/object.h"
 #include "hw/i386/sgx-epc.h"
+#include "hw/firmware/smbios.h"
 
 #define HPET_INTCAP "hpet-intcap"
 
@@ -39,6 +40,7 @@ typedef struct PCMachineState {
     /* Configuration options: */
     uint64_t max_ram_below_4g;
     OnOffAuto vmport;
+    SmbiosEntryPointType smbios_entry_point_type;
 
     bool acpi_build_enabled;
     bool smbus_enabled;
@@ -62,6 +64,8 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
+#define PC_MACHINE_SMBIOS_EP        "smbios-entry-point-type"
+
 /**
  * PCMachineClass:
  *
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 86223acfd34..bbeae19fa2f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -77,6 +77,7 @@
 #include "hw/mem/nvdimm.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qapi/visitor.h"
 #include "hw/core/cpu.h"
 #include "hw/usb.h"
@@ -1494,6 +1495,23 @@ static void pc_machine_set_default_bus_bypass_iommu(Object *obj, bool value,
     pcms->default_bus_bypass_iommu = value;
 }
 
+static void pc_machine_get_smbios_ep(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    SmbiosEntryPointType smbios_entry_point_type = pcms->smbios_entry_point_type;
+
+    visit_type_SmbiosEntryPointType(v, name, &smbios_entry_point_type, errp);
+}
+
+static void pc_machine_set_smbios_ep(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    visit_type_SmbiosEntryPointType(v, name, &pcms->smbios_entry_point_type, errp);
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1584,6 +1602,8 @@ static void pc_machine_initfn(Object *obj)
     pcms->vmport = ON_OFF_AUTO_OFF;
 #endif /* CONFIG_VMPORT */
     pcms->max_ram_below_4g = 0; /* use default */
+    pcms->smbios_entry_point_type = SMBIOS_ENTRY_POINT_TYPE_32;
+
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
@@ -1727,6 +1747,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
         "Maximum combined firmware size");
+
+    object_class_property_add(oc, PC_MACHINE_SMBIOS_EP, "str",
+        pc_machine_get_smbios_ep, pc_machine_set_smbios_ep,
+        NULL, NULL);
+    object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
+        "SMBIOS Entry Point type [32, 64]");
 }
 
 static const TypeInfo pc_machine_info = {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 17c050694f5..45e3c760915 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -177,7 +177,7 @@ static void pc_init1(MachineState *machine,
         smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_TYPE_32);
+                            pcms->smbios_entry_point_type);
     }
 
     /* allocate ram and load rom/bios */
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 48419ebfd5f..a6477db880b 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -199,7 +199,7 @@ static void pc_q35_init(MachineState *machine)
         smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_TYPE_32);
+                            pcms->smbios_entry_point_type);
     }
 
     /* allocate ram and load rom/bios */
-- 
2.32.0


