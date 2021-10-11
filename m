Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F69428CD7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:14:55 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZuCk-0002OG-Gx
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu4G-0006Ch-I1
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu4E-0004Uh-Px
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633953966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDLA+4+iKASCGil0eq2ZETz5bWhYhZ31WJt/CwWJNWw=;
 b=JWNmnPUSE3Z2BHtFllHIrNIh15P9vNtL+u8CyPfGzP8L3Nhn3NBH33q/MCJ9Al/7I4CZJU
 Aw0tuCL717o6Ur+FCAWBEWZB1VBpViFePCgwvo6mHy29Pt5eG3byqCJyEqo/yjfuVY0gG5
 LzSj8vbtGvhpMFQ+6WAetlNMuwO6NyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-lFwOsxH4OdCVwIrJJQd94w-1; Mon, 11 Oct 2021 08:06:03 -0400
X-MC-Unique: lFwOsxH4OdCVwIrJJQd94w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5391810A8E08;
 Mon, 11 Oct 2021 12:06:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CED91017CF2;
 Mon, 11 Oct 2021 12:05:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A3C7118009E8; Mon, 11 Oct 2021 14:05:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] pcie: factor out pcie_cap_slot_unplug()
Date: Mon, 11 Oct 2021 14:05:02 +0200
Message-Id: <20211011120504.254053-5-kraxel@redhat.com>
In-Reply-To: <20211011120504.254053-1-kraxel@redhat.com>
References: <20211011120504.254053-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/pci/pcie.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index c455f92e16bf..70fc11ba4c7d 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -497,6 +497,26 @@ static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)
     object_unparent(OBJECT(dev));
 }
 
+static void pcie_cap_slot_do_unplug(PCIDevice *dev)
+{
+    PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
+    uint8_t *exp_cap = dev->config + dev->exp.exp_cap;
+    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
+
+    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
+                        pcie_unplug_device, NULL);
+
+    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
+                                 PCI_EXP_SLTSTA_PDS);
+    if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
+        (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
+        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_LNKSTA,
+                                     PCI_EXP_LNKSTA_DLLLA);
+    }
+    pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
+                               PCI_EXP_SLTSTA_PDC);
+}
+
 void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp)
 {
@@ -676,7 +696,6 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
     uint32_t pos = dev->exp.exp_cap;
     uint8_t *exp_cap = dev->config + pos;
     uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
-    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
 
     if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
         /*
@@ -726,19 +745,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
-        PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                            pcie_unplug_device, NULL);
-
-        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
-                                     PCI_EXP_SLTSTA_PDS);
-        if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
-            (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
-            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_LNKSTA,
-                                         PCI_EXP_LNKSTA_DLLLA);
-        }
-        pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
-                                       PCI_EXP_SLTSTA_PDC);
+        pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);
 
-- 
2.31.1


