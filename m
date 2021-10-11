Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD3C428CAB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:08:42 +0200 (CEST)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZu6i-0000mb-Vm
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu3w-0005xW-AA
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu3t-0004La-HB
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633953944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIGSeRHYDJ7JScR37o2qhRhNO6KNToSsU6m+phZkT58=;
 b=hE967uGU0cOyJJeg7DvFlVAB/D18ibQNa7kz9tJ0UrretUMFjz9xF/lnsoMpJa1V16voam
 aO9LpFi54CBQy2gqKJVqtZH+9rIhEgWisRz0h75shX96qGPxToQ7oJ3nHRex/oT24fy0gU
 vsHsLckCoSRRqqO2cyUaqrj88oXwN0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-3xoQJxA9NVWYtVFsyTYXrg-1; Mon, 11 Oct 2021 08:05:41 -0400
X-MC-Unique: 3xoQJxA9NVWYtVFsyTYXrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE8EC801A92;
 Mon, 11 Oct 2021 12:05:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF61926E4E;
 Mon, 11 Oct 2021 12:05:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8D30E18009D4; Mon, 11 Oct 2021 14:05:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] pcie: implement slow power control for pcie root ports
Date: Mon, 11 Oct 2021 14:05:00 +0200
Message-Id: <20211011120504.254053-3-kraxel@redhat.com>
In-Reply-To: <20211011120504.254053-1-kraxel@redhat.com>
References: <20211011120504.254053-1-kraxel@redhat.com>
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

With this patch hot-plugged pci devices will only be visible to the
guest if the guests hotplug driver has enabled slot power.

This should fix the hot-plug race which one can hit when hot-plugging
a pci device at boot, while the guest is in the middle of the pci bus
scan.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/pci/pcie.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 6e95d829037a..4a52c250615e 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -366,6 +366,29 @@ static void hotplug_event_clear(PCIDevice *dev)
     }
 }
 
+static void pcie_set_power_device(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    bool *power = opaque;
+
+    pci_set_power(dev, *power);
+}
+
+static void pcie_cap_update_power(PCIDevice *hotplug_dev)
+{
+    uint8_t *exp_cap = hotplug_dev->config + hotplug_dev->exp.exp_cap;
+    PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(hotplug_dev));
+    uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
+    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
+    bool power = true;
+
+    if (sltcap & PCI_EXP_SLTCAP_PCP) {
+        power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
+    }
+
+    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
+                        pcie_set_power_device, &power);
+}
+
 /*
  * A PCI Express Hot-Plug Event has occurred, so update slot status register
  * and notify OS of the event if necessary.
@@ -434,6 +457,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
             pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
                                        PCI_EXP_LNKSTA_DLLLA);
         }
+        pcie_cap_update_power(hotplug_pdev);
         return;
     }
 
@@ -451,6 +475,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
         }
         pcie_cap_slot_event(hotplug_pdev,
                             PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
+        pcie_cap_update_power(hotplug_pdev);
     }
 }
 
@@ -625,6 +650,7 @@ void pcie_cap_slot_reset(PCIDevice *dev)
                                  PCI_EXP_SLTSTA_PDC |
                                  PCI_EXP_SLTSTA_ABP);
 
+    pcie_cap_update_power(dev);
     hotplug_event_update_event_status(dev);
 }
 
@@ -707,6 +733,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
                                        PCI_EXP_SLTSTA_PDC);
     }
+    pcie_cap_update_power(dev);
 
     hotplug_event_notify(dev);
 
@@ -733,6 +760,7 @@ int pcie_cap_slot_post_load(void *opaque, int version_id)
 {
     PCIDevice *dev = opaque;
     hotplug_event_update_event_status(dev);
+    pcie_cap_update_power(dev);
     return 0;
 }
 
-- 
2.31.1


