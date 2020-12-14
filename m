Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D52DA217
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:55:24 +0100 (CET)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kousN-0003jX-6h
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kouo2-0006IV-Gz
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:50:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kouny-0001i4-Cg
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607979048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtdSpy+EuJ3LZzqelkFJA7fB+vcxup1ngl3sortIzSs=;
 b=AUsec5rREaSqMuGTKrJjGZv5ui6UNwwUjCaN18ou6dtDUeDg/uVlPV/8OM2ojvZqsVs2wa
 UzDdmNe2lipKgJhjdesqjpSCcuRdw3HozlsWQmhQRnlO7kMsGlQ6UDpqAQp7JlU7M8vEvD
 DCjZTY1XkBjx1C0j27U2LZCVk13KiYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-zjNiDgKcMfW_rJqo8TTuVg-1; Mon, 14 Dec 2020 15:50:46 -0500
X-MC-Unique: zjNiDgKcMfW_rJqo8TTuVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D9AF8735D0;
 Mon, 14 Dec 2020 20:50:45 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CEC11001901;
 Mon, 14 Dec 2020 20:50:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/i386: expose a "smbios-ep" PC machine property
Date: Mon, 14 Dec 2020 15:50:29 -0500
Message-Id: <20201214205029.2991222-4-ehabkost@redhat.com>
In-Reply-To: <20201214205029.2991222-1-ehabkost@redhat.com>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The i440fx and Q35 machine types are both hardcoded to use the legacy
SMBIOS 2.1 entry point. This is a sensible conservative choice because
SeaBIOS only supports SMBIOS 2.1

EDK2, however, can also support SMBIOS 3.0 and QEMU already uses this on
the ARM virt machine type.

This adds a property to allow the choice of SMBIOS entry point versions
For example to opt in to version 3.0

   $QEMU -machine q35,smbios-ep=3_0

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is patch was previously submitted at:
https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com

Changes from v1:
* Include qapi-visit-smbios.h instead of qapi-visit-machine.h
* Commit message fix: s/smbios_ep/smbios-ep/
---
 include/hw/i386/pc.h |  3 +++
 hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
 hw/i386/pc_piix.c    |  2 +-
 hw/i386/pc_q35.c     |  2 +-
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2aa8797c6e..2075093b32 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -11,6 +11,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/hotplug.h"
 #include "qom/object.h"
+#include "hw/firmware/smbios.h"
 
 #define HPET_INTCAP "hpet-intcap"
 
@@ -38,6 +39,7 @@ typedef struct PCMachineState {
     /* Configuration options: */
     uint64_t max_ram_below_4g;
     OnOffAuto vmport;
+    SmbiosEntryPointType smbios_ep;
 
     bool acpi_build_enabled;
     bool smbus_enabled;
@@ -62,6 +64,7 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
+#define PC_MACHINE_SMBIOS_EP        "smbios-ep"
 
 /**
  * PCMachineClass:
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 640fb5b0b7..3cc559e0d9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -81,6 +81,7 @@
 #include "hw/mem/nvdimm.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
+#include "qapi/qapi-visit-smbios.h"
 #include "qapi/visitor.h"
 #include "hw/core/cpu.h"
 #include "hw/usb.h"
@@ -1532,6 +1533,23 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static void pc_machine_get_smbios_ep(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    SmbiosEntryPointType smbios_ep = pcms->smbios_ep;
+
+    visit_type_SmbiosEntryPointType(v, name, &smbios_ep, errp);
+}
+
+static void pc_machine_set_smbios_ep(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    visit_type_SmbiosEntryPointType(v, name, &pcms->smbios_ep, errp);
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1621,6 +1639,8 @@ static void pc_machine_initfn(Object *obj)
     pcms->vmport = ON_OFF_AUTO_OFF;
 #endif /* CONFIG_VMPORT */
     pcms->max_ram_below_4g = 0; /* use default */
+    pcms->smbios_ep = SMBIOS_ENTRY_POINT_TYPE_2_1;
+
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
@@ -1759,6 +1779,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
         "Maximum combined firmware size");
+
+    object_class_property_add(oc, PC_MACHINE_SMBIOS_EP, "str",
+        pc_machine_get_smbios_ep, pc_machine_set_smbios_ep,
+        NULL, NULL);
+    object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
+        "SMBIOS Entry Point version [v2_1, v3_0]");
 }
 
 static const TypeInfo pc_machine_info = {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 08b82df4d1..30ae7f27af 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -179,7 +179,7 @@ static void pc_init1(MachineState *machine,
         smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_TYPE_2_1);
+                            pcms->smbios_ep);
     }
 
     /* allocate ram and load rom/bios */
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index f71b1e2dcf..9974426806 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -198,7 +198,7 @@ static void pc_q35_init(MachineState *machine)
         smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_TYPE_2_1);
+                            pcms->smbios_ep);
     }
 
     /* allocate ram and load rom/bios */
-- 
2.28.0


