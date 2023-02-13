Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611826947AD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZP3-0006iQ-2K; Mon, 13 Feb 2023 09:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOl-0006d3-C6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:40 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOa-0005t6-9Y
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:30 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 2A5C25ED7D;
 Mon, 13 Feb 2023 17:01:18 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-Ayo7CwWJ; Mon, 13 Feb 2023 17:01:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296877; bh=RgEs658D23/SZfEQrmRss/oFP2frhSVbYX7RUY+UhHQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=k3RPeim3JIe6CSLhRiYO6xEgHK+htbqCKNRgp8aKcg1ey5dJVGshroOyV152nCVOy
 JYFZdFiUdGDA7XBJyLpUsfKeMTaPzibe2E8CXDJBJMvlFNI6RUDPJ9dOsXXniCqRJ7
 rrpAty5P8ZF/JrkNQO3V3JlK5wbRsP4WcunS5q6o=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 06/16] pci/shpc: refactor shpc_device_plug_common()
Date: Mon, 13 Feb 2023 17:00:53 +0300
Message-Id: <20230213140103.1518173-7-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
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

Rename it to shpc_device_get_slot(), to mention what it does rather
than how it is used. It also helps to reuse it in further commit.

Also, add a return value and get rid of local_err.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
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


