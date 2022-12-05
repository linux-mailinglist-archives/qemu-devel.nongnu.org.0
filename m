Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4DC642EDE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:33:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKI-0007oU-Fs; Mon, 05 Dec 2022 12:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKE-0007np-BX
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:18 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PL-O4
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dkgWtkrCyp+krWUq6Rj8RpURc6ytzinH5ICMZ7jvkmY=; b=inz0HIUMuiVZd0SDZxE0N4NWzl
 Rlr3vpueZ9011t+eOqwmyTFcSz+C7ygJl16dO1/RI1TabktBIncpVVC818F2w4WalQbifwWfFRscp
 SLvLlzuUKFU51iVV0SvHuK2I6r4Oy25VLLkule6nR9fPPuNnci3o6RV4msKqZyjx+oJsWewfJWboc
 kamuEa6LMi1PP5ujzNH7sUzFEpTVRVoN+zIv3cR5Fx9Y8r7UUutWG1B/Eoa34BRkOtLue9gMNFiTU
 BEaPvvlxtSJ/e8q4YjLCxhTAH9AVPPkpSgaRXk3AAC9DoOuATBD3TqVYRMeh3WrqeZGRfCq5tkav8
 GFxUKCpQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJo-007fzJ-Rj; Mon, 05 Dec 2022 17:31:52 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YK4-Ih; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 08/21] xen_platform: exclude vfio-pci from the PCI
 platform unplug
Date: Mon,  5 Dec 2022 17:31:24 +0000
Message-Id: <20221205173137.607044-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Joao Martins <joao.m.martins@oracle.com>

Such that PCI passthrough devices work for Xen emulated guests.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/xen/xen_platform.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 710039851a..ae0a21f5bf 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -109,12 +109,25 @@ static void log_writeb(PCIXenPlatformState *s, char val)
 #define _UNPLUG_NVME_DISKS 3
 #define UNPLUG_NVME_DISKS (1u << _UNPLUG_NVME_DISKS)
 
+static bool pci_device_is_passthrough(PCIDevice *d)
+{
+    if (!strcmp(d->name, "xen-pci-passthrough")) {
+        return true;
+    }
+
+    if (xen_mode == XEN_EMULATE && !strcmp(d->name, "vfio-pci")) {
+        return true;
+    }
+
+    return false;
+}
+
 static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
 {
     /* We have to ignore passthrough devices */
     if (pci_get_word(d->config + PCI_CLASS_DEVICE) ==
             PCI_CLASS_NETWORK_ETHERNET
-            && strcmp(d->name, "xen-pci-passthrough") != 0) {
+            && !pci_device_is_passthrough(d)) {
         object_unparent(OBJECT(d));
     }
 }
@@ -187,9 +200,8 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
         !(flags & UNPLUG_IDE_SCSI_DISKS);
 
     /* We have to ignore passthrough devices */
-    if (!strcmp(d->name, "xen-pci-passthrough")) {
+    if (pci_device_is_passthrough(d))
         return;
-    }
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
-- 
2.35.3


