Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49931A029
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:58:55 +0100 (CET)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAYyE-0001gV-8J
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAYtA-0004rg-72
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:53:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAYt8-0006lP-67
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613138014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBROj3NlDS/OwP564bZDRllLKX2xmnrpv22DcY6ZE2Q=;
 b=B6H+bx6GIcH8ASAS4oY6aTK14aW5USFUIir+No2YfVzsyXGvTt7MCsX3L2bMOXxoYu/nzE
 WNbJ5/qMQDGXXRVTL0aaRAQ8At60GFs6HvKMdgM44k0PExHiXrqntCZzfq116w/cPEq39/
 Af04+Se5yv1K/cb4VRiwg0pg/yTRAfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-ZfxMCGWMMWmqeT9OMqmt6A-1; Fri, 12 Feb 2021 08:53:30 -0500
X-MC-Unique: ZfxMCGWMMWmqeT9OMqmt6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E5CF6EE2A;
 Fri, 12 Feb 2021 13:53:29 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 438352C154;
 Fri, 12 Feb 2021 13:53:26 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] pcie: don't set link state active if the slot is empty
Date: Fri, 12 Feb 2021 14:52:50 +0100
Message-Id: <20210212135250.2738750-5-lvivier@redhat.com>
In-Reply-To: <20210212135250.2738750-1-lvivier@redhat.com>
References: <20210212135250.2738750-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: alex.williamson@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>, quintela@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 zhengxiang9@huawei.com, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the pcie slot is initialized, by default PCI_EXP_LNKSTA_DLLLA
(Data Link Layer Link Active) is set in PCI_EXP_LNKSTA
(Link Status) without checking if the slot is empty or not.

This is confusing for the kernel because as it sees the link is up
it tries to read the vendor ID and fails:

(From https://bugzilla.kernel.org/show_bug.cgi?id=211691)

[    1.661105] pcieport 0000:00:02.2: pciehp: Slot Capabilities      : 0x0002007b
[    1.661115] pcieport 0000:00:02.2: pciehp: Slot Status            : 0x0010
[    1.661123] pcieport 0000:00:02.2: pciehp: Slot Control           : 0x07c0
[    1.661138] pcieport 0000:00:02.2: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
[    1.662581] pcieport 0000:00:02.2: pciehp: pciehp_get_power_status: SLOTCTRL 6c value read 7c0
[    1.662597] pcieport 0000:00:02.2: pciehp: pciehp_check_link_active: lnk_status = 2204
[    1.662703] pcieport 0000:00:02.2: pciehp: pending interrupts 0x0010 from Slot Status
[    1.662706] pcieport 0000:00:02.2: pciehp: pcie_enable_notification: SLOTCTRL 6c write cmd 1031
[    1.662730] pcieport 0000:00:02.2: pciehp: pciehp_check_link_active: lnk_status = 2204
[    1.662748] pcieport 0000:00:02.2: pciehp: pciehp_check_link_active: lnk_status = 2204
[    1.662750] pcieport 0000:00:02.2: pciehp: Slot(0-2): Link Up
[    2.896132] pcieport 0000:00:02.2: pciehp: pciehp_check_link_status: lnk_status = 2204
[    2.896135] pcieport 0000:00:02.2: pciehp: Slot(0-2): No device found
[    2.896900] pcieport 0000:00:02.2: pciehp: pending interrupts 0x0010 from Slot Status
[    2.896903] pcieport 0000:00:02.2: pciehp: pciehp_power_off_slot: SLOTCTRL 6c write cmd 400
[    3.656901] pcieport 0000:00:02.2: pciehp: pending interrupts 0x0009 from Slot Status

This is really a problem with virtio-net failover that hotplugs a VFIO
card during the boot process. The kernel can shutdown the slot while
QEMU is hotplugging it, and this likely ends by an automatic unplug of
the card. At the end of the boot sequence the card has disappeared.

To fix that, don't set the "Link Active" state in the init function, but
rely on the plug function to do it, as the mechanism has already been
introduced by 2f2b18f60bf1.

Fixes: 2f2b18f60bf1 ("pcie: set link state inactive/active after hot unplug/plug")
Cc: zhengxiang9@huawei.com
Fixes: 3d67447fe7c2 ("pcie: Fill PCIESlot link fields to support higher speeds and widths")
Cc: alex.williamson@redhat.com
Fixes: b2101eae63ea ("pcie: Set the "link active" in the link status register")
Cc: benh@kernel.crashing.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/pci/pcie.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index d4010cf8f361..a733e2fb879a 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -75,11 +75,6 @@ pcie_cap_v1_fill(PCIDevice *dev, uint8_t port, uint8_t type, uint8_t version)
                  QEMU_PCI_EXP_LNKSTA_NLW(QEMU_PCI_EXP_LNK_X1) |
                  QEMU_PCI_EXP_LNKSTA_CLS(QEMU_PCI_EXP_LNK_2_5GT));
 
-    if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA) {
-        pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
-                                   PCI_EXP_LNKSTA_DLLLA);
-    }
-
     /* We changed link status bits over time, and changing them across
      * migrations is generally fine as hardware changes them too.
      * Let's not bother checking.
@@ -125,8 +120,7 @@ static void pcie_cap_fill_slot_lnk(PCIDevice *dev)
          */
         pci_long_test_and_set_mask(exp_cap + PCI_EXP_LNKCAP,
                                    PCI_EXP_LNKCAP_DLLLARC);
-        pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
-                                   PCI_EXP_LNKSTA_DLLLA);
+        /* the PCI_EXP_LNKSTA_DLLLA will be set in the hotplug function */
 
         /*
          * Target Link Speed defaults to the highest link speed supported by
@@ -427,6 +421,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
     uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
     PCIDevice *pci_dev = PCI_DEVICE(dev);
+    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
 
     /* Don't send event when device is enabled during qemu machine creation:
      * it is present on boot, no hotplug event is necessary. We do send an
@@ -434,7 +429,8 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     if (!dev->hotplugged) {
         pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
                                    PCI_EXP_SLTSTA_PDS);
-        if (pci_dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA) {
+        if (pci_dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
+            (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
             pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
                                        PCI_EXP_LNKSTA_DLLLA);
         }
@@ -448,7 +444,8 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     if (pci_get_function_0(pci_dev)) {
         pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
                                    PCI_EXP_SLTSTA_PDS);
-        if (pci_dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA) {
+        if (pci_dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
+            (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
             pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
                                        PCI_EXP_LNKSTA_DLLLA);
         }
@@ -640,6 +637,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
     uint32_t pos = dev->exp.exp_cap;
     uint8_t *exp_cap = dev->config + pos;
     uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
+    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
 
     if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
         /*
@@ -695,7 +693,8 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
 
         pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
                                      PCI_EXP_SLTSTA_PDS);
-        if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA) {
+        if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
+            (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
             pci_word_test_and_clear_mask(exp_cap + PCI_EXP_LNKSTA,
                                          PCI_EXP_LNKSTA_DLLLA);
         }
-- 
2.29.2


