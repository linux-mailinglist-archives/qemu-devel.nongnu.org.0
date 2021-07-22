Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA313D2263
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 13:02:58 +0200 (CEST)
Received: from localhost ([::1]:59680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6WTh-0002Ki-CS
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 07:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6WQy-0008SS-KD
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6WQu-0003Q8-G5
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626951599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVxJO6xrJnT2t1X7BTsGK3BBuWW92V+w4SIeePr8Abg=;
 b=C/AmJh5kXAjWxEVt/nrtbzx7IT3IEDOCOZOt3ThgHl1VE1jzNastgnpqah7vTQK4z8b6EP
 OD70YF/4ARFCqh/d5iYTiimSStdwpry68y5mGzextCAhHrlQDzcBtWCp7MgvMInC4/ykY1
 0aJ3i3mw8ykr0N4/hA9XOxnPfcbDzas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-w7spedzBNjugfGn7R56zpQ-1; Thu, 22 Jul 2021 06:59:58 -0400
X-MC-Unique: w7spedzBNjugfGn7R56zpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6317F801B0A;
 Thu, 22 Jul 2021 10:59:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45AFC5C1A1;
 Thu, 22 Jul 2021 10:59:56 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] acpi: x86: pcihp: cleanup devfn usage in
 build_append_pci_bus_devices()
Date: Thu, 22 Jul 2021 06:59:44 -0400
Message-Id: <20210722105945.2080428-2-imammedo@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: peter.maydell@linaro.org, jusual@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 17836149fe..b40e284b72 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -374,7 +374,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
     PCIBus *sec;
-    int i;
+    int devfn;
 
     bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
     if (bsel) {
@@ -384,11 +384,11 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
     }
 
-    for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         DeviceClass *dc;
         PCIDeviceClass *pc;
-        PCIDevice *pdev = bus->devices[i];
-        int slot = PCI_SLOT(i);
+        PCIDevice *pdev = bus->devices[devfn];
+        int slot = PCI_SLOT(devfn);
         bool hotplug_enabled_dev;
         bool bridge_in_acpi;
         bool cold_plugged_bridge;
@@ -525,13 +525,12 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         /* Notify about child bus events in any case */
         if (pcihp_bridge_en) {
             QLIST_FOREACH(sec, &bus->child, sibling) {
-                int32_t devfn = sec->parent_dev->devfn;
-
                 if (pci_bus_is_root(sec)) {
                     continue;
                 }
 
-                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
+                aml_append(method, aml_name("^S%.02X.PCNT",
+                                            sec->parent_dev->devfn));
             }
         }
 
-- 
2.27.0


