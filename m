Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F81EE4EB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 15:01:41 +0200 (CEST)
Received: from localhost ([::1]:38388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgpV6-0008Eq-7f
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 09:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1jgpTb-0006x5-CB
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 09:00:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54752
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1jgpTZ-00065l-UE
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 09:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591275604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Azyc5qWwoLBMk2qnJcPqG5FhvSz3qLSbxu7YbN0wkvc=;
 b=KY3ApPkz9qmww676I2fj/iCabWNsGlFWIKR8/Cg4CbY/I7VStwUpmfCOOasv8MHnFHjMdQ
 DLoAvlVNtoV0/C7TERIpLWDn70N8Ool6jwI+y6uLxcw5LYhbyvBi4Y0SXo5QcJ/+m/+sBv
 7zsYyX6ljahR+z9b2KddC2iGmhjk954=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-810wTSLkPUuruZQjdWAUGA-1; Thu, 04 Jun 2020 08:59:59 -0400
X-MC-Unique: 810wTSLkPUuruZQjdWAUGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72CEE1883607;
 Thu,  4 Jun 2020 12:59:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.40.193.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C2D5C290;
 Thu,  4 Jun 2020 12:59:51 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/pci/pcie: Move hot plug capability check to pre_plug
 callback
Date: Thu,  4 Jun 2020 14:59:46 +0200
Message-Id: <20200604125947.881210-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check for hot plug capability earlier to avoid removing devices attached
during the initialization process.

Run qemu with an unattached drive:
  -drive file=$FILE,if=none,id=drive0 \
  -device pcie-root-port,id=rp0,slot=3,bus=pcie.0,hotplug=off
Hotplug a block device:
  device_add virtio-blk-pci,id=blk0,drive=drive0,bus=rp0
If hotplug fails on plug_cb, drive0 will be deleted.

Fixes: 0501e1aa1d32a6 ("hw/pci/pcie: Forbid hot-plug if it's disabled on the slot")

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
v2:
  add 'fixes' to commit message

 hw/pci/pcie.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index f50e10b8fb..5b9c022d91 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -407,6 +407,17 @@ static void pcie_cap_slot_plug_common(PCIDevice *hotplug_dev, DeviceState *dev,
 void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                                Error **errp)
 {
+    PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
+    uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
+    uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
+
+    /* Check if hot-plug is disabled on the slot */
+    if (dev->hotplugged && (sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
+        error_setg(errp, "Hot-plug failed: unsupported by the port device '%s'",
+                         DEVICE(hotplug_pdev)->id);
+        return;
+    }
+
     pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, errp);
 }
 
@@ -415,7 +426,6 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
     uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
-    uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
     PCIDevice *pci_dev = PCI_DEVICE(dev);
 
     /* Don't send event when device is enabled during qemu machine creation:
@@ -431,13 +441,6 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    /* Check if hot-plug is disabled on the slot */
-    if ((sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
-        error_setg(errp, "Hot-plug failed: unsupported by the port device '%s'",
-                         DEVICE(hotplug_pdev)->id);
-        return;
-    }
-
     /* To enable multifunction hot-plug, we just ensure the function
      * 0 added last. When function 0 is added, we set the sltsta and
      * inform OS via event notification.
-- 
2.25.4


