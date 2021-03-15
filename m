Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E933C560
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:18:06 +0100 (CET)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrn3-0003JE-M1
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrX4-0001MB-GB
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrX2-0008TG-FX
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSujXLTODn5r9rn7t65nMSl2p8WacSXGNR2GupPDUDs=;
 b=arDLFCEMtRanp1mDClIE6tKL964+dMYdA5mXT+A18cb+Vyluvx9krZGHLzhhkz/bkVjcvB
 wwrB1OeBtiw3nMoEPG6wmxVoreQqqFBQNaBsHG6NFa03TX1eNYPPRW77J8xQp05bqmRadu
 sdWEktBgkhWP/r6iamW7JQrKndKG94I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-fSA_HAjcPOyiz4ehUr_S1w-1; Mon, 15 Mar 2021 14:01:27 -0400
X-MC-Unique: fSA_HAjcPOyiz4ehUr_S1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23DE5192D796
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 18:01:14 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25AD8620DE;
 Mon, 15 Mar 2021 18:01:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] pci: acpi: ensure that acpi-index is unique
Date: Mon, 15 Mar 2021 14:00:59 -0400
Message-Id: <20210315180102.3008391-4-imammedo@redhat.com>
In-Reply-To: <20210315180102.3008391-1-imammedo@redhat.com>
References: <20210315180102.3008391-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: jusual@redhat.com, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it helps to avoid device naming conflicts when guest OS is
configured to use acpi-index for naming.
Spec ialso says so:

PCI Firmware Specification Revision 3.2
4.6.7.  _DSM for Naming a PCI or PCI Express Device Under Operating Systems
"
Instance number must be unique under \_SB scope. This instance number does not have to
be sequential in a given system configuration.
"

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/pcihp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index ceab287bd3..f4cb3c979d 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -52,6 +52,21 @@ typedef struct AcpiPciHpFind {
     PCIBus *bus;
 } AcpiPciHpFind;
 
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
 static int acpi_pcihp_get_bsel(PCIBus *bus)
 {
     Error *local_err = NULL;
@@ -277,6 +292,23 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                    ONBOARD_INDEX_MAX);
         return;
     }
+
+    /*
+     * make sure that acpi-index is unique across all present PCI devices
+     */
+    if (pdev->acpi_index) {
+        GSequence *used_indexes = pci_acpi_index_list();
+
+        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->acpi_index),
+                              g_cmp_uint32, NULL)) {
+            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
+                       " already exist", pdev->acpi_index);
+            return;
+        }
+        g_sequence_insert_sorted(used_indexes,
+                                 GINT_TO_POINTER(pdev->acpi_index),
+                                 g_cmp_uint32, NULL);
+    }
 }
 
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
@@ -315,8 +347,22 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
 void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
                                  DeviceState *dev, Error **errp)
 {
+    PCIDevice *pdev = PCI_DEVICE(dev);
+
     trace_acpi_pci_unplug(PCI_SLOT(PCI_DEVICE(dev)->devfn),
                           acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))));
+
+    /*
+     * clean up acpi-index so it could reused by another device
+     */
+    if (pdev->acpi_index) {
+        GSequence *used_indexes = pci_acpi_index_list();
+
+        g_sequence_remove(g_sequence_lookup(used_indexes,
+                          GINT_TO_POINTER(pdev->acpi_index),
+                          g_cmp_uint32, NULL));
+    }
+
     qdev_unrealize(dev);
 }
 
-- 
2.27.0


