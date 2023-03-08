Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629BC6AFBF8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNJ-0001l4-QE; Tue, 07 Mar 2023 20:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiND-00010k-0j
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNA-0001vx-Kg
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MO4qORxRLOBc3/4AUP8HBqjXu+QcEdhXTFIaUTOEzYU=;
 b=FcxYQVGr3NHrMsWxU6aRZZxdq/YyTJ5cAwviG4m2vN5Dd8YcMsThNl2IQGkd1V3LVthWLL
 tGl58ccRVX3VnrRMYSYTUhpQG7792uAhJxiMHYtJjnak5vyg4vbNIT9pNENpITiYWFv/LP
 vjUmTqT79ql3ZjX2SHpj2c0oOaBoTjU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-4KPyGVjrN_m9dwebh3bb0g-1; Tue, 07 Mar 2023 20:13:38 -0500
X-MC-Unique: 4KPyGVjrN_m9dwebh3bb0g-1
Received: by mail-ed1-f70.google.com with SMTP id
 g2-20020a056402320200b004e98d45ee7dso9600750eda.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MO4qORxRLOBc3/4AUP8HBqjXu+QcEdhXTFIaUTOEzYU=;
 b=vmeBQxZojkswcne7ICh6Sc468FYMmfDcdbD0h2o7rmDWo8LcFy7X673L2pW7a9NBDQ
 OFQKyJAOqnPpBcDWa/O4mL+x64HstC4jhhuYGEcH+bDB85r/uTohNrMCFysgjK9hQxFy
 Mx1uxtvu99WoRFuQ1x20ezrHr1ruozBK2priCx3tQhGjQZEzCBv45c1KEJ884U85OV4c
 GVnafM6dfW/F0o6+Uk55kVjeIBuZgKSnC4L5wYoDoMqjnLlcgNw1/tdvZjewaU9Jc1Kk
 nrQFOn5mIaRw3l7gKGdWI7gbKSWOhM/tj9tqSKkPUJ97RYbS1h3M7LbVG01as+M43nhl
 M5gA==
X-Gm-Message-State: AO0yUKUbeKsyHk1ER7CumPUirzka823FXteLOu3bTzXT5q2IVZjFiyaU
 aea4V8ZVnaMVbDWaukkY+TfdO9MZLv6FhZV5Tc9ivxCQBDSn01YCg1oeoiAiSn+LJgQPLvKpjV6
 Zt3rNF71dXdeJodmU+wkpRrskBrefUeMCP94qu5JStlHq9emjBcPJqdLIgptgx+2bpL7j
X-Received: by 2002:a17:906:9451:b0:8e1:d996:dca2 with SMTP id
 z17-20020a170906945100b008e1d996dca2mr15205278ejx.64.1678238017129; 
 Tue, 07 Mar 2023 17:13:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/qIsltI/lkzudNkjW9SrYpjPElR4/h1XRhBVwL6ijL07Zkvbo888nz7v+/LTLS2o7O83MKnA==
X-Received: by 2002:a17:906:9451:b0:8e1:d996:dca2 with SMTP id
 z17-20020a170906945100b008e1d996dca2mr15205255ejx.64.1678238016776; 
 Tue, 07 Mar 2023 17:13:36 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 20-20020a170906301400b008cf1b61a73esm6776563ejz.41.2023.03.07.17.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:36 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 55/73] pci: move acpi-index uniqueness check to generic PCI
 device code
Message-ID: <041b1c40f38a63baff7c375d1e3df6f365aa5882.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

acpi-index is now working with non-hotpluggable buses
(pci/q35 machine hostbridge), it can be used even if
ACPI PCI hotplug is disabled and as result acpi-index
uniqueness check will be omitted (since the check is
done by ACPI PCI hotplug handler, which isn't wired
when ACPI PCI hotplug is disabled).
Move check and related code to generic PCIDevice so it
would be independent of ACPI PCI hotplug.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-30-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 56 ------------------------------------------------
 hw/pci/pci.c    | 57 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 5dc7377411..adf45e8443 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -54,21 +54,6 @@ typedef struct AcpiPciHpFind {
     PCIBus *bus;
 } AcpiPciHpFind;
 
-static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
-{
-    return a - b;
-}
-
-static GSequence *pci_acpi_index_list(void)
-{
-    static GSequence *used_acpi_index_list;
-
-    if (!used_acpi_index_list) {
-        used_acpi_index_list = g_sequence_new(NULL);
-    }
-    return used_acpi_index_list;
-}
-
 static int acpi_pcihp_get_bsel(PCIBus *bus)
 {
     Error *local_err = NULL;
@@ -300,8 +285,6 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
     acpi_pcihp_update(s);
 }
 
-#define ONBOARD_INDEX_MAX (16 * 1024 - 1)
-
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp)
 {
@@ -314,34 +297,6 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                    ACPI_PCIHP_PROP_BSEL "' set");
         return;
     }
-
-    /*
-     * capped by systemd (see: udev-builtin-net_id.c)
-     * as it's the only known user honor it to avoid users
-     * misconfigure QEMU and then wonder why acpi-index doesn't work
-     */
-    if (pdev->acpi_index > ONBOARD_INDEX_MAX) {
-        error_setg(errp, "acpi-index should be less or equal to %u",
-                   ONBOARD_INDEX_MAX);
-        return;
-    }
-
-    /*
-     * make sure that acpi-index is unique across all present PCI devices
-     */
-    if (pdev->acpi_index) {
-        GSequence *used_indexes = pci_acpi_index_list();
-
-        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->acpi_index),
-                              g_cmp_uint32, NULL)) {
-            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
-                       " already exist", pdev->acpi_index);
-            return;
-        }
-        g_sequence_insert_sorted(used_indexes,
-                                 GINT_TO_POINTER(pdev->acpi_index),
-                                 g_cmp_uint32, NULL);
-    }
 }
 
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
@@ -401,17 +356,6 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
     trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
                           acpi_pcihp_get_bsel(pci_get_bus(pdev)));
 
-    /*
-     * clean up acpi-index so it could reused by another device
-     */
-    if (pdev->acpi_index) {
-        GSequence *used_indexes = pci_acpi_index_list();
-
-        g_sequence_remove(g_sequence_lookup(used_indexes,
-                          GINT_TO_POINTER(pdev->acpi_index),
-                          g_cmp_uint32, NULL));
-    }
-
     qdev_unrealize(dev);
 }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 034fe49e9a..def5000e7b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -95,6 +95,21 @@ static const VMStateDescription vmstate_pcibus = {
     }
 };
 
+static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
+{
+    return a - b;
+}
+
+static GSequence *pci_acpi_index_list(void)
+{
+    static GSequence *used_acpi_index_list;
+
+    if (!used_acpi_index_list) {
+        used_acpi_index_list = g_sequence_new(NULL);
+    }
+    return used_acpi_index_list;
+}
+
 static void pci_init_bus_master(PCIDevice *pci_dev)
 {
     AddressSpace *dma_as = pci_device_iommu_address_space(pci_dev);
@@ -1246,6 +1261,17 @@ static void pci_qdev_unrealize(DeviceState *dev)
     do_pci_unregister_device(pci_dev);
 
     pci_dev->msi_trigger = NULL;
+
+    /*
+     * clean up acpi-index so it could reused by another device
+     */
+    if (pci_dev->acpi_index) {
+        GSequence *used_indexes = pci_acpi_index_list();
+
+        g_sequence_remove(g_sequence_lookup(used_indexes,
+                          GINT_TO_POINTER(pci_dev->acpi_index),
+                          g_cmp_uint32, NULL));
+    }
 }
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -2005,6 +2031,8 @@ PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
     return bus->devices[devfn];
 }
 
+#define ONBOARD_INDEX_MAX (16 * 1024 - 1)
+
 static void pci_qdev_realize(DeviceState *qdev, Error **errp)
 {
     PCIDevice *pci_dev = (PCIDevice *)qdev;
@@ -2014,6 +2042,35 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     bool is_default_rom;
     uint16_t class_id;
 
+    /*
+     * capped by systemd (see: udev-builtin-net_id.c)
+     * as it's the only known user honor it to avoid users
+     * misconfigure QEMU and then wonder why acpi-index doesn't work
+     */
+    if (pci_dev->acpi_index > ONBOARD_INDEX_MAX) {
+        error_setg(errp, "acpi-index should be less or equal to %u",
+                   ONBOARD_INDEX_MAX);
+        return;
+    }
+
+    /*
+     * make sure that acpi-index is unique across all present PCI devices
+     */
+    if (pci_dev->acpi_index) {
+        GSequence *used_indexes = pci_acpi_index_list();
+
+        if (g_sequence_lookup(used_indexes,
+                              GINT_TO_POINTER(pci_dev->acpi_index),
+                              g_cmp_uint32, NULL)) {
+            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
+                       " already exist", pci_dev->acpi_index);
+            return;
+        }
+        g_sequence_insert_sorted(used_indexes,
+                                 GINT_TO_POINTER(pci_dev->acpi_index),
+                                 g_cmp_uint32, NULL);
+    }
+
     if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
         error_setg(errp, "ROM size %u is not a power of two", pci_dev->romsize);
         return;
-- 
MST


