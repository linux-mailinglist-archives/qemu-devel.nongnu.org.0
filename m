Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244C66911E9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 21:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQDDw-0001eD-DV; Thu, 09 Feb 2023 15:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDn-0001bE-GF
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:43 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDk-0002i4-IA
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:43 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 36084606F2;
 Thu,  9 Feb 2023 23:08:32 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6518::1:1])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 A8lCI60OTGk1-Y5AExD34; Thu, 09 Feb 2023 23:08:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675973311; bh=m7OdM0Jpngd25o5DV8X3PGHHUSoJZJ2L+p23rGOTXgI=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=XB3X2llAwvxvASo0JrXHwfyxmUxxmMXZ4wQizCqRI6cB2bSnTOTq0flMRlNTwBsu0
 NMeR6nrEQ4MUDhzIwveLE5gQ8q46ZwsssHqxCwlUQVCas+BxfArYF+PVIPMgn0vHvS
 a5j0k7SgDGWwqAWZx1DLuKzbOfIBTn9RtbHqZ3VE=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v3 10/15] pcie: introduce pcie_sltctl_powered_off() helper
Date: Thu,  9 Feb 2023 23:08:03 +0300
Message-Id: <20230209200808.869275-11-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209200808.869275-1-vsementsov@yandex-team.ru>
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

In pcie_cap_slot_write_config() we check for PCI_EXP_SLTCTL_PWR_OFF in
a bad form. We should distinguish PCI_EXP_SLTCTL_PWR which is a "mask"
and PCI_EXP_SLTCTL_PWR_OFF which is value for that mask.

Better code is in pcie_cap_slot_unplug_request_cb() and in
pcie_cap_update_power(). Let's use same pattern everywhere. To simplify
things add also a helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/pcie.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index db8360226f..e2da00742c 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -39,6 +39,11 @@
 #define PCIE_DEV_PRINTF(dev, fmt, ...)                                  \
     PCIE_DPRINTF("%s:%x "fmt, (dev)->name, (dev)->devfn, ## __VA_ARGS__)
 
+static bool pcie_sltctl_powered_off(uint16_t sltctl)
+{
+    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF &&
+        (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
+}
 
 /***************************************************************************
  * pci express capability helper functions
@@ -395,6 +400,7 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
 
     if (sltcap & PCI_EXP_SLTCAP_PCP) {
         power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
+        /* Don't we need to check also (sltctl & PCI_EXP_SLTCTL_PIC) ? */
     }
 
     pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
@@ -579,8 +585,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
-    if (((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF) &&
-        ((sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF)) {
+    if (pcie_sltctl_powered_off(sltctl)) {
         /* slot is powered off -> unplug without round-trip to the guest */
         pcie_cap_slot_do_unplug(hotplug_pdev);
         hotplug_event_notify(hotplug_pdev);
@@ -770,10 +775,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
      * this is a work around for guests that overwrite
      * control of powered off slots before powering them on.
      */
-    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
-        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF &&
-        (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
-        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PWR_IND_OFF)) {
+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_off(val) &&
+        !pcie_sltctl_powered_off(old_slt_ctl))
+    {
         pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);
-- 
2.34.1


