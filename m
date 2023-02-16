Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D09699BC8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:04:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicB-000078-Li; Thu, 16 Feb 2023 13:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic9-0008PU-AD
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:13 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic7-0005mG-AQ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:12 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 993F962326;
 Thu, 16 Feb 2023 21:04:06 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-D9Cc0vYM; Thu, 16 Feb 2023 21:04:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570645; bh=KDKIxgv6fSaskaR4WEq6WOq+Fsii94FuBg3bG4LBd+I=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=Jp+OnereqPtEA8XpW8GgTamxZRKOjcyvyR2dqifb7SWND9/pNZURLpoekFEgp7TnW
 N3fwHs9hsmAbUDnzPxkrg25EmEyGkg6RvuFLG+r73Gbssy/ElbTqEHJFAv3FbKXkiD
 FOz7tfRuFypvJeKL7Acig4N0dc2xDNiUR6Nhc2uU=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 06/18] pci/shpc: refactor shpc_device_plug_common()
Date: Thu, 16 Feb 2023 21:03:44 +0300
Message-Id: <20230216180356.156832-7-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

Rename it to shpc_device_get_slot(), to mention what it does rather
than how it is used. It also helps to reuse it in further commit.

Also, add a return value and get rid of local_err.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
---
 hw/pci/shpc.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 9f964b1d70..e7bc7192f1 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -496,8 +496,9 @@ static const MemoryRegionOps shpc_mmio_ops = {
         .max_access_size = 4,
     },
 };
-static void shpc_device_plug_common(PCIDevice *affected_dev, int *slot,
-                                    SHPCDevice *shpc, Error **errp)
+
+static bool shpc_device_get_slot(PCIDevice *affected_dev, int *slot,
+                                 SHPCDevice *shpc, Error **errp)
 {
     int pci_slot = PCI_SLOT(affected_dev->devfn);
     *slot = SHPC_PCI_TO_IDX(pci_slot);
@@ -507,21 +508,20 @@ static void shpc_device_plug_common(PCIDevice *affected_dev, int *slot,
                    "controller. Valid slots are between %d and %d.",
                    pci_slot, SHPC_IDX_TO_PCI(0),
                    SHPC_IDX_TO_PCI(shpc->nslots) - 1);
-        return;
+        return false;
     }
+
+    return true;
 }
 
 void shpc_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                             Error **errp)
 {
-    Error *local_err = NULL;
     PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
     SHPCDevice *shpc = pci_hotplug_dev->shpc;
     int slot;
 
-    shpc_device_plug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
         return;
     }
 
@@ -563,16 +563,13 @@ void shpc_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp)
 {
-    Error *local_err = NULL;
     PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
     SHPCDevice *shpc = pci_hotplug_dev->shpc;
     uint8_t state;
     uint8_t led;
     int slot;
 
-    shpc_device_plug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
         return;
     }
 
-- 
2.34.1


