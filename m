Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61844D70E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:16:10 +0100 (CET)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9w1-0005Ad-Gb
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:16:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pd-00071I-B0
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pb-00053E-8d
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636636170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9imExSYvajx6ALyBaWiPSgbDMKFrhk3TOdCOBljgaZU=;
 b=ZTVNoHTKx0vHTeghkm7sTjvBn8+Urk72hPbmU1QnnZOcrSikNVBB2xY3OT5/KDetHSWxFU
 fRE1A5EEHGLoQx9RpTnr1vpRDF9VQtquJ2QjDxtC58EtrzQ/2K9RIIZLWEBDz3WxM/flCn
 ngKW35f1OCMwH818xEnZeaaQED59i1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-uVXAjmqVMmy6fB9DysEpYg-1; Thu, 11 Nov 2021 08:09:26 -0500
X-MC-Unique: uVXAjmqVMmy6fB9DysEpYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3A6875120;
 Thu, 11 Nov 2021 13:09:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46BB283925;
 Thu, 11 Nov 2021 13:09:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0166C18009CD; Thu, 11 Nov 2021 14:09:00 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] pcie: factor out pcie_cap_slot_unplug()
Date: Thu, 11 Nov 2021 14:08:57 +0100
Message-Id: <20211111130859.1171890-5-kraxel@redhat.com>
In-Reply-To: <20211111130859.1171890-1-kraxel@redhat.com>
References: <20211111130859.1171890-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/pci/pcie.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index b92dbff11804..959bf074b205 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -497,6 +497,25 @@ static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)
     object_unparent(OBJECT(dev));
 }
 
+static void pcie_cap_slot_do_unplug(PCIDevice *dev)
+{
+    PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
+    uint8_t *exp_cap = dev->config + dev->exp.exp_cap;
+    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
+
+    pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
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
@@ -676,7 +695,6 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
     uint32_t pos = dev->exp.exp_cap;
     uint8_t *exp_cap = dev->config + pos;
     uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
-    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
 
     if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
         /*
@@ -726,17 +744,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
-        PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-        pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
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
2.33.1


