Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B166773F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:41:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBU-0002R4-Na; Thu, 12 Jan 2023 09:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBH-0002Fi-F6
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBB-0005yI-Qg
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0LoJubiwngY0cGmDQ2qAFVnXQZj4+qFljL/53gTU1E=;
 b=dU0NH9i0lFsAK7QYcxJW67nv7Y/ayQu1uO6E6Wh9wK7ZozeD6f5x511pu0X4cs11D5qqOg
 gKkjrRFqLjTFDDNFw0Hly5Pgy3j5fJ1/wIOLRm2RqrU2qWZm3EqyKLcD76hp2FkIi9gj1p
 +P/pLErDPmp9+Ub1rpCHyhMqj3MmlNc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-dfwfM-EqMfC1Mrl0NnmzUg-1; Thu, 12 Jan 2023 09:03:40 -0500
X-MC-Unique: dfwfM-EqMfC1Mrl0NnmzUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D8A2807D77;
 Thu, 12 Jan 2023 14:03:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3230B4085720;
 Thu, 12 Jan 2023 14:03:38 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 31/40] pcihp: isolate rule whether slot should be described in
 DSDT
Date: Thu, 12 Jan 2023 15:03:03 +0100
Message-Id: <20230112140312.3096331-32-imammedo@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 83 +++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 40 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 5b4f453395..56a4d0549c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -385,6 +385,42 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
     aml_append(method, if_ctx);
 }
 
+static bool is_devfn_ignored(const int devfn, const PCIBus *bus,
+                             bool bus_has_hotplug)
+{
+    const PCIDevice *pdev = bus->devices[devfn];
+
+    if (pdev) {
+        if (PCI_FUNC(devfn)) {
+            if (IS_PCI_BRIDGE(pdev)) {
+                /*
+                 * Ignore only hotplugged PCI bridges on !0 functions, but
+                 * allow describing cold plugged bridges on all functions
+                 */
+                if (DEVICE(pdev)->hotplugged) {
+                    return true;
+                }
+            } else if (!get_dev_aml_func(DEVICE(pdev))) {
+                /*
+                 * Ignore all other devices on !0 functions unless they
+                 * have AML description (i.e have get_dev_aml_func() != 0)
+                 */
+                return true;
+            }
+        }
+    } else { /* non populated slots */
+        /*
+         * hotplug is supported only for non-multifunction device
+         * so generate device description only for function 0
+         */
+        if (!bus_has_hotplug || PCI_FUNC(devfn) ||
+            (pci_bus_is_express(bus) && PCI_SLOT(devfn) > 0)) {
+            return true;
+        }
+    }
+    return false;
+}
+
 void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
 {
     Aml *dev, *notify_method = NULL, *method;
@@ -400,59 +436,26 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
     }
 
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
-        DeviceClass *dc;
         PCIDevice *pdev = bus->devices[devfn];
         int slot = PCI_SLOT(devfn);
         int func = PCI_FUNC(devfn);
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = slot << 16 | func;
-        bool hotpluggbale_slot = false;
-        bool cold_plugged_bridge = false;
+        bool hotpluggbale_slot = true;
 
-        if (pdev) {
-            dc = DEVICE_GET_CLASS(pdev);
+        if (is_devfn_ignored(devfn, bus, !!bsel)) {
+            continue;
+        }
 
+        if (pdev) {
             /*
              * Cold plugged bridges aren't themselves hot-pluggable.
              * Hotplugged bridges *are* hot-pluggable.
              */
-            cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
+            bool cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
                                   !DEVICE(pdev)->hotplugged;
-
-            hotpluggbale_slot = bsel && dc->hotpluggable &&
+            hotpluggbale_slot = bsel && DEVICE_GET_CLASS(pdev)->hotpluggable &&
                                 !cold_plugged_bridge;
-
-            if (func) {
-                if (IS_PCI_BRIDGE(pdev)) {
-                    /*
-                     * Ignore only hotplugged PCI bridges on !0 functions, but
-                     * allow describing cold plugged bridges on all functions
-                     */
-                    if (DEVICE(pdev)->hotplugged) {
-                        continue;
-                    }
-                } else if (!get_dev_aml_func(DEVICE(pdev))) {
-                    /*
-                     * Ignore all other devices on !0 functions unless they
-                     * have AML description (i.e have get_dev_aml_func() != 0)
-                     */
-                    continue;
-                }
-            }
-        } else {
-            /*
-             * hotplug is supported only for non-multifunction device
-             * so generate device description only for function 0
-             */
-            if (bsel && !func) {
-                if (pci_bus_is_express(bus) && slot > 0) {
-                    break;
-                }
-                /* mark it as empty hotpluggable slot */
-                hotpluggbale_slot = true;
-            } else {
-                continue;
-            }
         }
 
         /* start to compose PCI device descriptor */
-- 
2.31.1


