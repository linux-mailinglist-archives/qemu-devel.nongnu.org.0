Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4943667835
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBO-0002It-FQ; Thu, 12 Jan 2023 09:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBB-00027v-2R
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB4-0005tl-Ib
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQz3l+BCIz60arNhkUQxkFwAmcifUfyBnIaQlBYi4Nk=;
 b=RG+wURwjiUCBGsPMHq9Xj5PYdKBe5g5cT0SuutfvsweLF4bLq4qwbs98PgugoJuOM/bZTc
 X1/hlBgc/Myb2BJwLTVwC1/VvadycYBlC3j4/ZXwpuJ6s0PxnMDFYXQ6ym+oy4+IXru+iQ
 YFGuRB8F+Eu8n5M/CBZ/p19RCvmUooo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-rhSTtPeXOIyC5nE2iBZXqg-1; Thu, 12 Jan 2023 09:03:30 -0500
X-MC-Unique: rhSTtPeXOIyC5nE2iBZXqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F019F3802B8E;
 Thu, 12 Jan 2023 14:03:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A1EA4085720;
 Thu, 12 Jan 2023 14:03:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 18/40] pcihp: drop pcihp_bridge_en dependency when composing
 PCNT method
Date: Thu, 12 Jan 2023 15:02:50 +0100
Message-Id: <20230112140312.3096331-19-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 .. and use only BSEL presence to decide on how PCNT should be composed.
That simplifies possible combinations to consider, but mainly it makes
PCIHP AML be governed only by BSEL, which is property of PCIBus
(aka part of bridge) and as result it opens possibility to convert
build_append_pci_bus_devices() into AcpiDevAmlIf::build_dev_aml
callback to make bridges self describing.

PS:
used approach leaves unused PCNT, when ACPI hotplug is completely
disabled but that's harmless and followup commits will get rid of
it later.

     Scope (PCI0)
           ...
           Method (PCNT, 0, NotSerialized)
            {
            }
           ...
     }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 47 ++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 71899de37a..146f48e4ac 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -496,39 +496,34 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         aml_append(parent_scope, notify_method);
     }
 
-    /* Append PCNT method to notify about events on local and child buses.
-     * Add this method for root bus only when hotplug is enabled since DSDT
-     * expects it.
+    /*
+     * Append PCNT method to notify about events on local and child buses.
      */
-    if (bsel || pcihp_bridge_en) {
-        method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
-
-        /* If bus supports hotplug select it and notify about local events */
-        if (bsel) {
-            uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
+    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
 
-            aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
-            aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
-                                         aml_int(1))); /* Device Check */
-            aml_append(method, aml_call2("DVNT", aml_name("PCID"),
-                                         aml_int(3))); /* Eject Request */
-        }
+    /* If bus supports hotplug select it and notify about local events */
+    if (bsel) {
+        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
-        /* Notify about child bus events in any case */
-        if (pcihp_bridge_en) {
-            QLIST_FOREACH(sec, &bus->child, sibling) {
-                if (pci_bus_is_root(sec) ||
-                    !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
-                    continue;
-                }
+        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
+        aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
+                                     aml_int(1))); /* Device Check */
+        aml_append(method, aml_call2("DVNT", aml_name("PCID"),
+                                     aml_int(3))); /* Eject Request */
+    }
 
-                aml_append(method, aml_name("^S%.02X.PCNT",
-                                            sec->parent_dev->devfn));
-            }
+    /* Notify about child bus events in any case */
+    QLIST_FOREACH(sec, &bus->child, sibling) {
+        if (pci_bus_is_root(sec) ||
+            !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
+            continue;
         }
 
-        aml_append(parent_scope, method);
+        aml_append(method, aml_name("^S%.02X.PCNT", sec->parent_dev->devfn));
     }
+
+    aml_append(parent_scope, method);
+
     qobject_unref(bsel);
 }
 
-- 
2.31.1


