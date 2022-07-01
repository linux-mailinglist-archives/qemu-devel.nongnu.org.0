Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC5756349B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:47:06 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GzB-0007Ks-9i
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go5-00014Q-0x
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go2-000557-0F
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656682533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1HY2YviDG+7fdNOZcTrS79MXvYdAdOhm0F+WvLxLsg=;
 b=Bfef9NnLZZXAwS9cLZ3jPAUJLuG1/BuDt11QHS1kpi0U4EKPNqmPfKVN9DyUZVPOR1FqEl
 ot60LDMy01M+aD3v7wIBGg+aeX5mSl5fp2MONwxz+ACeADsdrsZZ4zgWENeMzi7j55KRuL
 jcig2nsRnd9ZA9PBYtMMPTxGOdy+FmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-NsKBLZzZOTK5CcZcmn3ARg-1; Fri, 01 Jul 2022 09:35:32 -0400
X-MC-Unique: NsKBLZzZOTK5CcZcmn3ARg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7A5F801E80;
 Fri,  1 Jul 2022 13:35:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B47A40E7F28;
 Fri,  1 Jul 2022 13:35:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 17/17] x86: pci: acpi: deduplate PCI slots creation
Date: Fri,  1 Jul 2022 09:35:15 -0400
Message-Id: <20220701133515.137890-18-imammedo@redhat.com>
In-Reply-To: <20220701133515.137890-1-imammedo@redhat.com>
References: <20220701133515.137890-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

No functional change nor AML bytcode change.
Consolidate code that generates empty and populated slots
descriptors. Beside of eliminating duplication,
it helps to consolidate conditions for generating
parts of Device{} desriptor in one place, which makes
code more compact and easier to read.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 111 +++++++++++++++++++++----------------------
 1 file changed, 54 insertions(+), 57 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 406bbac1c7..9d0512666d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -427,13 +427,41 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         int func = PCI_FUNC(devfn);
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = slot << 16 | func;
-        bool hotplug_enabled_dev;
-        bool bridge_in_acpi;
-        bool cold_plugged_bridge;
+        bool hotpluggbale_slot = false;
+        bool bridge_in_acpi = false;
+        bool cold_plugged_bridge = false;
+        bool is_vga = false;
+
+        if (pdev) {
+            pc = PCI_DEVICE_GET_CLASS(pdev);
+            dc = DEVICE_GET_CLASS(pdev);
+
+            if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
+                continue;
+            }
+
+            is_vga = pc->class_id == PCI_CLASS_DISPLAY_VGA;
 
-        if (!pdev) {
             /*
-             * add hotplug slots for non present devices.
+             * Cold plugged bridges aren't themselves hot-pluggable.
+             * Hotplugged bridges *are* hot-pluggable.
+             */
+            cold_plugged_bridge = pc->is_bridge && !DEVICE(pdev)->hotplugged;
+            bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
+
+            hotpluggbale_slot = bsel && dc->hotpluggable &&
+                                !cold_plugged_bridge;
+
+            /*
+             * allow describing coldplugged bridges in ACPI even if they are not
+             * on function 0, as they are not unpluggable, for all other devices
+             * generate description only for function 0 per slot
+             */
+            if (func && !bridge_in_acpi) {
+                continue;
+            }
+        } else {
+            /*
              * hotplug is supported only for non-multifunction device
              * so generate device description only for function 0
              */
@@ -441,46 +469,11 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 if (pci_bus_is_express(bus) && slot > 0) {
                     break;
                 }
-                dev = aml_device("S%.02X", devfn);
-                aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
-                aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
-                aml_append(dev, aml_pci_device_dsm());
-                aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-                aml_append(method,
-                    aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-                );
-                aml_append(dev, method);
-                aml_append(parent_scope, dev);
-
-                build_append_pcihp_notify_entry(notify_method, slot);
+                /* mark it as empty hotpluggable slot */
+                hotpluggbale_slot = true;
+            } else {
+                continue;
             }
-            continue;
-        }
-
-        pc = PCI_DEVICE_GET_CLASS(pdev);
-        dc = DEVICE_GET_CLASS(pdev);
-
-        /*
-         * Cold plugged bridges aren't themselves hot-pluggable.
-         * Hotplugged bridges *are* hot-pluggable.
-         */
-        cold_plugged_bridge = pc->is_bridge && !DEVICE(pdev)->hotplugged;
-        bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
-
-        hotplug_enabled_dev = bsel && dc->hotpluggable && !cold_plugged_bridge;
-
-        if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
-            continue;
-        }
-
-        /*
-         * allow describing coldplugged bridges in ACPI even if they are not
-         * on function 0, as they are not unpluggable, for all other devices
-         * generate description only for function 0 per slot
-         */
-        if (func && !bridge_in_acpi) {
-            continue;
         }
 
         /* start to compose PCI device descriptor */
@@ -496,7 +489,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(dev, aml_pci_device_dsm());
         }
 
-        if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
+        if (is_vga) {
             /* add VGA specific AML methods */
             int s3d;
 
@@ -517,19 +510,10 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
-        } else if (hotplug_enabled_dev) {
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-            /* add _EJ0 to make slot hotpluggable  */
-            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-            );
-            aml_append(dev, method);
+        }
 
-            if (bsel) {
-                build_append_pcihp_notify_entry(notify_method, slot);
-            }
-        } else if (bridge_in_acpi) {
+        bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
+        if (bridge_in_acpi) {
             /*
              * device is coldplugged bridge,
              * add child device descriptions into its scope
@@ -538,6 +522,19 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
             build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
         }
+
+        if (hotpluggbale_slot) {
+            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+            /* add _EJ0 to make slot hotpluggable  */
+            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
+            aml_append(method,
+                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
+            );
+            aml_append(dev, method);
+
+            build_append_pcihp_notify_entry(notify_method, slot);
+        }
+
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
-- 
2.31.1


