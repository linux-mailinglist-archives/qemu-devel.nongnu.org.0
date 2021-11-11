Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E431944D710
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:17:21 +0100 (CET)
Received: from localhost ([::1]:48052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9xA-0007VU-OU
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:17:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pX-0006eN-GZ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pR-00051G-Cr
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636636160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVU3SLnx83fbwkMLb2s0t9u0TkPp2ed7hRIzqu6DFWs=;
 b=LPBSUvxTUjo7Tj7GIeRBDSnYD6+zjr+kxZvnRKf519tSYdT46INsAvbLXaaQeFIX5ARdJo
 53kdpa3fr6tgdFF8sZ1PY+jT7sv8gy6f0vqlT7xyaLB53TNmUgDZetaX6ue9GZhuEF3Evh
 yFZ9VwJapZpANEywfl1lFvYlcNln2PE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-WOn70ssXNaW5ibyakly5yQ-1; Thu, 11 Nov 2021 08:09:17 -0500
X-MC-Unique: WOn70ssXNaW5ibyakly5yQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E256100E349;
 Thu, 11 Nov 2021 13:09:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1B586786F;
 Thu, 11 Nov 2021 13:09:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DE00C1800995; Thu, 11 Nov 2021 14:08:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] pcie: implement slot power control for pcie root ports
Date: Thu, 11 Nov 2021 14:08:55 +0100
Message-Id: <20211111130859.1171890-3-kraxel@redhat.com>
In-Reply-To: <20211111130859.1171890-1-kraxel@redhat.com>
References: <20211111130859.1171890-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 914a9bf3d1f7..13d11a57c76f 100644
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
 
@@ -705,6 +731,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
                                        PCI_EXP_SLTSTA_PDC);
     }
+    pcie_cap_update_power(dev);
 
     hotplug_event_notify(dev);
 
@@ -731,6 +758,7 @@ int pcie_cap_slot_post_load(void *opaque, int version_id)
 {
     PCIDevice *dev = opaque;
     hotplug_event_update_event_status(dev);
+    pcie_cap_update_power(dev);
     return 0;
 }
 
-- 
2.33.1


