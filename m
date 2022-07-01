Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E556349C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:47:08 +0200 (CEST)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GzE-0007ct-0a
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go2-00012u-12
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Gnw-0004b3-7i
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656682526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Enc3S8w5w008IShpBclpYnAnsbB7twYPVMKrSbtWnm0=;
 b=bhEafpJIMkYPQJjs/gnmnHodlJwRe1XaqxygO9OU2BXozn9PeqhYfpi60YtdK8KHhI02hh
 jSFyhuMhLCpFzUQrPBvCGOVxUnE4vhOGSOjawpKioZHRBV0hdCAxafqSDTOdWZ1rjTDdAk
 2E9Oaf6q9l5SsaLQLzhaNO3q3rUdVOo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-I83xgJ_EN0m2vs5utYcP2Q-1; Fri, 01 Jul 2022 09:35:25 -0400
X-MC-Unique: I83xgJ_EN0m2vs5utYcP2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3969D1C0CE6E;
 Fri,  1 Jul 2022 13:35:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0B5A40E7F28;
 Fri,  1 Jul 2022 13:35:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 09/17] x86: acpi: cleanup PCI device _DSM duplication
Date: Fri,  1 Jul 2022 09:35:07 -0400
Message-Id: <20220701133515.137890-10-imammedo@redhat.com>
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

add ASUN variable to hotpluggable slots and use it
instead of _SUN which has the same value to reuse
_DMS code on both branches (hot- and non-hotpluggable).
No functional change.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 56 +++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8700446f50..36fe43c52f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -374,6 +374,25 @@ build_facs(GArray *table_data)
     g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
+Aml *aml_pci_device_dsm(void)
+{
+    Aml *method;
+
+    method = aml_method("_DSM", 4, AML_SERIALIZED);
+    {
+        Aml *params = aml_local(0);
+        Aml *pkg = aml_package(2);
+        aml_append(pkg, aml_name("BSEL"));
+        aml_append(pkg, aml_name("ASUN"));
+        aml_append(method, aml_store(pkg, params));
+        aml_append(method,
+            aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
+                                 aml_arg(2), aml_arg(3), params))
+        );
+    }
+    return method;
+}
+
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
 {
     Aml *if_ctx;
@@ -423,26 +442,17 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                     break;
                 }
                 dev = aml_device("S%.02X", devfn);
-                aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+                aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
+                aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
                 );
                 aml_append(dev, method);
-                method = aml_method("_DSM", 4, AML_SERIALIZED);
-                {
-                    Aml *params = aml_local(0);
-                    Aml *pkg = aml_package(2);
-                    aml_append(pkg, aml_name("BSEL"));
-                    aml_append(pkg, aml_name("_SUN"));
-                    aml_append(method, aml_store(pkg, params));
-                    aml_append(method,
-                        aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
-                                             aml_arg(2), aml_arg(3), params))
-                    );
-                }
-                aml_append(dev, method);
+
+                aml_append(dev, aml_pci_device_dsm());
+
                 aml_append(parent_scope, dev);
 
                 build_append_pcihp_notify_entry(notify_method, slot);
@@ -485,19 +495,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
              * enumeration order in linux kernel, so use another variable for it
              */
             aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
-            method = aml_method("_DSM", 4, AML_SERIALIZED);
-            {
-                Aml *params = aml_local(0);
-                Aml *pkg = aml_package(2);
-                aml_append(pkg, aml_name("BSEL"));
-                aml_append(pkg, aml_name("ASUN"));
-                aml_append(method, aml_store(pkg, params));
-                aml_append(method, aml_return(
-                    aml_call5("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
-                              aml_arg(3), params)
-                ));
-            }
-            aml_append(dev, method);
+            aml_append(dev, aml_pci_device_dsm());
         }
 
         if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
@@ -585,7 +583,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     qobject_unref(bsel);
 }
 
-Aml *aml_pci_device_dsm(void)
+static Aml *aml_pci_pdsm(void)
 {
     Aml *method, *UUID, *ifctx, *ifctx1;
     Aml *ret = aml_local(0);
@@ -1368,7 +1366,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     aml_append(method, aml_return(aml_local(0)));
     aml_append(scope, method);
 
-    aml_append(scope, aml_pci_device_dsm());
+    aml_append(scope, aml_pci_pdsm());
 
     aml_append(table, scope);
 }
-- 
2.31.1


