Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C306A861D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:18:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlbj-0006xy-CL; Thu, 02 Mar 2023 11:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbR-0006Ru-Kn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbJ-0000V6-1i
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07Pt5mT9YFOGvTuL5bsMPJ2ovkcNsX9zpcMUiB4F3kQ=;
 b=YcfXS+1zup1AnxE6ilkTfEqKYaDfW1vfXQHk8jywJAdX2CZc2Ng3a1xJKpC4ypd0bVWYDd
 0hZgQMjfTOfee0JFVb89q4+MJcqbDt7+ZzqhFs7KmC+7vbSOWqQAjlM17IjZUVpGETPPCv
 xa1s0gyH4pG922qo2B49kKR+eIVLrEg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-WYyP0QLmM2KQ4HD5-Dae4w-1; Thu, 02 Mar 2023 11:16:10 -0500
X-MC-Unique: WYyP0QLmM2KQ4HD5-Dae4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A71CF3C0E46B
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:16:09 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FA18140EBF6;
 Thu,  2 Mar 2023 16:16:09 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 31/34] acpi: pci: move BSEL into build_append_pcihp_slots()
Date: Thu,  2 Mar 2023 17:15:40 +0100
Message-Id: <20230302161543.286002-32-imammedo@redhat.com>
In-Reply-To: <20230302161543.286002-1-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

Generic PCI enumeration code doesn't really need access to
BSEL value, it is only used as means to decide if hotplug
enumerator should be called.

Use stateless object_property_find() to do that, and move
the rest of BSEL handling into build_append_pcihp_slots()
where it belongs.

This cleans up generic code a bit from hotplug stuff
and follow up patch will remove remaining call to
build_append_pcihp_slots() from generic code, making
it possible to use without ACPI PCI hotplug dependencies.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce14866eda..0459acfbb4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -520,12 +520,14 @@ static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
     return false;
 }
 
-static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
-                                     QObject *bsel)
+static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
 {
     int devfn;
     Aml *dev, *notify_method = NULL, *method;
+    QObject *bsel = object_property_get_qobject(OBJECT(bus),
+                        ACPI_PCIHP_PROP_BSEL, NULL);
     uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
+    qobject_unref(bsel);
 
     aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
     notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
@@ -570,12 +572,9 @@ static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
 
 void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
 {
-    QObject *bsel;
     int devfn;
     Aml *dev;
 
-    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
-
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
@@ -601,11 +600,9 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
         aml_append(parent_scope, dev);
     }
 
-    if (bsel) {
-        build_append_pcihp_slots(parent_scope, bus, bsel);
+    if (object_property_find(OBJECT(bus), ACPI_PCIHP_PROP_BSEL)) {
+        build_append_pcihp_slots(parent_scope, bus);
     }
-
-    qobject_unref(bsel);
 }
 
 static bool build_append_notfication_callback(Aml *parent_scope,
-- 
2.39.1


