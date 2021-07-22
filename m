Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A6A3D226A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 13:04:46 +0200 (CEST)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6WVR-0005Nl-8S
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 07:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6WQy-0008SV-Mq
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6WQu-0003RO-MV
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626951601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IoHHUMsfxYZ1f7a6aQYn/Py+mdcXlTzvdOSxq/GFKkw=;
 b=N4z9wBUmOdLy1udmXmd85fhpeR5vsHGtc8oG6onBhMvYn7WZW8mYk9fTEh34+QVmDr5bWV
 IA1lQVMY5SCLLJYNE5uBXQf4SBxFcx44neEfUXtSsMGf3fhMdNCsqNR3JS0rZSneXqeGF/
 erX7CrataW0Ineu9jVfiIUP4fHViHqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588--yV8800cOgel56v71VJdqw-1; Thu, 22 Jul 2021 06:59:59 -0400
X-MC-Unique: -yV8800cOgel56v71VJdqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE5AB800581;
 Thu, 22 Jul 2021 10:59:58 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABC425C1A1;
 Thu, 22 Jul 2021 10:59:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] acpi: x86: pcihp: add support hotplug on multifunction
 bridges
Date: Thu, 22 Jul 2021 06:59:45 -0400
Message-Id: <20210722105945.2080428-3-imammedo@redhat.com>
In-Reply-To: <20210722105945.2080428-1-imammedo@redhat.com>
References: <20210722105945.2080428-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 jusual@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 17858a1695 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
switched PCI hotplug from native to ACPI one by default.

That however breaks ihotplug on following CLI that used to work:
   -nodefaults -machine q35 \
   -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
   -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2

where PCI device is hotplugged to pcie-root-port-1 with error on guest side:

  ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
  ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
  ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
  ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)

cause is that QEMU's ACPI hotplug never supported functions other then 0
and due to bug it was generating notification entries for not described
functions.

Technically there is no reason not to describe cold-plugged bridges
(root ports) on functions other then 0, as they similaraly to bridge
on function 0 are unpluggable.

Fix consists of describing cold-plugged bridges[root ports] on functions
other than 0.

Fixes: 17858a169508609ca9063c544833e5a1adeb7b52
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reported-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/i386/acpi-build.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b40e284b72..77cb7a338a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -364,7 +364,7 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
     int32_t devfn = PCI_DEVFN(slot, 0);
 
     if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
-    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
+    aml_append(if_ctx, aml_notify(aml_name("^S%.03X", devfn), aml_arg(1)));
     aml_append(method, if_ctx);
 }
 
@@ -389,18 +389,26 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         PCIDeviceClass *pc;
         PCIDevice *pdev = bus->devices[devfn];
         int slot = PCI_SLOT(devfn);
+        int func = PCI_FUNC(devfn);
+        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
+        int adr = slot << 16 | func;
         bool hotplug_enabled_dev;
         bool bridge_in_acpi;
         bool cold_plugged_bridge;
 
         if (!pdev) {
-            if (bsel) { /* add hotplug slots for non present devices */
+            /*
+             * add hotplug slots for non present devices.
+             * hotplug is supported only for non-multifunction device
+             * so generate device description only for function 0
+             */
+            if (bsel && !PCI_FUNC(devfn)) {
                 if (pci_bus_is_express(bus) && slot > 0) {
                     break;
                 }
-                dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
+                dev = aml_device("S%.03X", devfn);
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-                aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
+                aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
@@ -436,9 +444,18 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             continue;
         }
 
+        /*
+         * allow describing coldplugged bridges in ACPI even if they are not
+         * on function 0, as they are not unpluggale, for all other devices
+         * generate description only for function 0 per slot
+         */
+        if (PCI_FUNC(devfn) && !bridge_in_acpi) {
+            continue;
+        }
+
         /* start to compose PCI slot descriptor */
-        dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
-        aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
+        dev = aml_device("S%.03X", devfn);
+        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
 
         if (bsel) {
             /*
@@ -529,7 +546,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                     continue;
                 }
 
-                aml_append(method, aml_name("^S%.02X.PCNT",
+                aml_append(method, aml_name("^S%.03X.PCNT",
                                             sec->parent_dev->devfn));
             }
         }
-- 
2.27.0


