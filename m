Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514D428CBF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:11:48 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZu9j-0007U2-Dw
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu3m-0005us-5w
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:05:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu3k-00042T-0K
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633953935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXNJsRs9OAo7+t16v3btX9bQqGR6vhdgYrCExlNfs60=;
 b=NpBvNEdn9joPjNEAhKPxlFPRsEocbloI8sqowQeaS3a8Cwx4Qg4OXzig//wSKOkWOoxAd7
 wQoQswD0ZmkYIFg0alRAAdRgH02E/+tBCr/nlsks9ets80XafyS+c+htW9QVB6pex7kMmu
 IlAnU7zwGiBJgRGyqYbCUwD6dnY3zKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-PbSzQc03N2--dmG5xKj9iw-1; Mon, 11 Oct 2021 08:05:33 -0400
X-MC-Unique: PbSzQc03N2--dmG5xKj9iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 039E0801AB0;
 Mon, 11 Oct 2021 12:05:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2230357CA6;
 Mon, 11 Oct 2021 12:05:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 813AA18007B1; Mon, 11 Oct 2021 14:05:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] pci: implement power state
Date: Mon, 11 Oct 2021 14:04:59 +0200
Message-Id: <20211011120504.254053-2-kraxel@redhat.com>
In-Reply-To: <20211011120504.254053-1-kraxel@redhat.com>
References: <20211011120504.254053-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 7fc90132cf1d..7cb6d92e17f7 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -268,6 +268,7 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 struct PCIDevice {
     DeviceState qdev;
     bool partially_hotplugged;
+    bool has_power;
 
     /* PCI config space */
     uint8_t *config;
@@ -904,5 +905,6 @@ extern const VMStateDescription vmstate_pci_device;
 }
 
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
+void pci_set_power(PCIDevice *pci_dev, bool state);
 
 #endif
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 186758ee11fe..94f53944c7cc 100644
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
@@ -2190,6 +2193,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         pci_qdev_unrealize(DEVICE(pci_dev));
         return;
     }
+
+    pci_set_power(pci_dev, true);
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
@@ -2861,6 +2866,22 @@ MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
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
2.31.1


