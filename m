Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A406444D70D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:15:22 +0100 (CET)
Received: from localhost ([::1]:44128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9vF-0004nA-1n
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:15:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9q9-0007TA-0X
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:10:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9q6-00057R-GQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636636201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N378NKHLE0sFViD4w4Qqvm7YtfZzMFDEOVoblgkL30s=;
 b=PvDV9nwtf7vqvEzDj/6xcYHgE3OSvNi8Z2mqO1eRREn2KH+6wCIOzhkQNDuqs2TXB5qO00
 l60v8EL/9bKzX8NItS1rfiO+aj9fSqEM9AveyqBBhSUO1D2bBdt/SVpKHyaI1bCvv1DJsJ
 Xtq1Vdj3dr69Khkl6jYx/jpvxgtoytY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-ujXfTKqbM4mQpXwi69w_VA-1; Thu, 11 Nov 2021 08:09:58 -0500
X-MC-Unique: ujXfTKqbM4mQpXwi69w_VA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C75F80417B;
 Thu, 11 Nov 2021 13:09:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8924719D9F;
 Thu, 11 Nov 2021 13:09:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D24391800992; Thu, 11 Nov 2021 14:08:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] pci: implement power state
Date: Thu, 11 Nov 2021 14:08:54 +0100
Message-Id: <20211111130859.1171890-2-kraxel@redhat.com>
In-Reply-To: <20211111130859.1171890-1-kraxel@redhat.com>
References: <20211111130859.1171890-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to power off pci devices.  In "off" state the devices will
not be visible.  No pci config space access, no pci bar access, no dma.

Default state is "on", so this patch (alone) should not change behavior.

Use case:  Allows hotplug controllers implement slot power.  Hotplug
controllers doing so should set the inital power state for devices in
the ->plug callback.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/pci/pci.h |  2 ++
 hw/pci/pci.c         | 25 +++++++++++++++++++++++--
 hw/pci/pci_host.c    |  6 ++++--
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 5c4016b9954a..e7cdf2d5ec5d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -268,6 +268,7 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 struct PCIDevice {
     DeviceState qdev;
     bool partially_hotplugged;
+    bool has_power;
 
     /* PCI config space */
     uint8_t *config;
@@ -908,5 +909,6 @@ extern const VMStateDescription vmstate_pci_device;
 }
 
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
+void pci_set_power(PCIDevice *pci_dev, bool state);
 
 #endif
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 4a84e478cef5..e5993c1ef52b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1380,6 +1380,9 @@ static void pci_update_mappings(PCIDevice *d)
             continue;
 
         new_addr = pci_bar_address(d, i, r->type, r->size);
+        if (!d->has_power) {
+            new_addr = PCI_BAR_UNMAPPED;
+        }
 
         /* This bar isn't changed */
         if (new_addr == r->addr)
@@ -1464,8 +1467,8 @@ void pci_default_write_config(PCIDevice *d, uint32_t addr, uint32_t val_in, int
     if (range_covers_byte(addr, l, PCI_COMMAND)) {
         pci_update_irq_disabled(d, was_irq_disabled);
         memory_region_set_enabled(&d->bus_master_enable_region,
-                                  pci_get_word(d->config + PCI_COMMAND)
-                                    & PCI_COMMAND_MASTER);
+                                  (pci_get_word(d->config + PCI_COMMAND)
+                                   & PCI_COMMAND_MASTER) && d->has_power);
     }
 
     msi_write_config(d, addr, val_in, l);
@@ -2182,6 +2185,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         pci_qdev_unrealize(DEVICE(pci_dev));
         return;
     }
+
+    pci_set_power(pci_dev, true);
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
@@ -2853,6 +2858,22 @@ MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
     return msg;
 }
 
+void pci_set_power(PCIDevice *d, bool state)
+{
+    if (d->has_power == state) {
+        return;
+    }
+
+    d->has_power = state;
+    pci_update_mappings(d);
+    memory_region_set_enabled(&d->bus_master_enable_region,
+                              (pci_get_word(d->config + PCI_COMMAND)
+                               & PCI_COMMAND_MASTER) && d->has_power);
+    if (!d->has_power) {
+        pci_device_reset(d);
+    }
+}
+
 static const TypeInfo pci_device_type_info = {
     .name = TYPE_PCI_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index cf02f0d6a501..7beafd40a8e9 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -74,7 +74,8 @@ void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
     /* non-zero functions are only exposed when function 0 is present,
      * allowing direct removal of unexposed functions.
      */
-    if (pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) {
+    if ((pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) ||
+        !pci_dev->has_power) {
         return;
     }
 
@@ -97,7 +98,8 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
     /* non-zero functions are only exposed when function 0 is present,
      * allowing direct removal of unexposed functions.
      */
-    if (pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) {
+    if ((pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) ||
+        !pci_dev->has_power) {
         return ~0x0;
     }
 
-- 
2.33.1


