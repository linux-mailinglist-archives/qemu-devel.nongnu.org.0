Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309193C4209
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 05:38:48 +0200 (CEST)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2mmM-0005wl-OQ
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 23:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caihuoqing@baidu.com>)
 id 1m2mkx-0005FV-S0
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 23:37:19 -0400
Received: from usmx01.baidu.com ([12.0.243.41]:59124 helo=baidu.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <caihuoqing@baidu.com>) id 1m2mku-0003kO-4U
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 23:37:17 -0400
Received: from BJHW-Mail-Ex13.internal.baidu.com (unknown [10.127.64.36])
 by Forcepoint Email with ESMTPS id 265A3C3625D63C30EC62;
 Sun, 11 Jul 2021 20:37:04 -0700 (PDT)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.10; Mon, 12 Jul 2021 11:37:03 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.4; Mon, 12 Jul 2021 11:37:02 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>
Subject: [PATCH] vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI
 processor
Date: Mon, 12 Jul 2021 11:36:55 +0800
Message-ID: <20210712033655.390-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-EX02.internal.baidu.com (172.31.51.42) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex13_2021-07-12 11:37:03:355
Received-SPF: pass client-ip=12.0.243.41; envelope-from=caihuoqing@baidu.com;
 helo=baidu.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cai Huoqing <caihuoqing@baidu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix pba_offset initialization value for BAIDU KUNLUN Virtual
Function device. The KUNLUN hardware returns an incorrect
value for the VF PBA offset, and add a quirk to instead
return a hardcoded value of 0xb400.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 hw/vfio/pci.c            | 8 ++++++++
 include/hw/pci/pci_ids.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ab4077aad2..72b7abf623 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1499,6 +1499,14 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
         if (vdev->vendor_id == PCI_VENDOR_ID_CHELSIO &&
             (vdev->device_id & 0xff00) == 0x5800) {
             msix->pba_offset = 0x1000;
+        /*
+         * BAIDU KUNLUN Virtual Function devices are encoded as 0x3685 for
+         * KUNLUN AI processor. The KUNLUN hardware returns an incorrect
+         * value for the VF PBA offset. The correct value is 0xb400.
+         */
+        } else if (vdev->vendor_id == PCI_VENDOR_ID_BAIDU &&
+                   vdev->device_id == PCI_DEVICE_ID_KUNLUN_VF) {
+            msix->pba_offset = 0xb400;
         } else if (vdev->msix_relo == OFF_AUTOPCIBAR_OFF) {
             error_setg(errp, "hardware reports invalid configuration, "
                        "MSIX PBA outside of specified BAR");
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 5c14681b82..bc73c50277 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -227,6 +227,10 @@
 #define PCI_VENDOR_ID_FREESCALE          0x1957
 #define PCI_DEVICE_ID_MPC8533E           0x0030
 
+#define PCI_VENDOR_ID_BAIDU              0x1d22
+#define PCI_DEVICE_ID_KUNLUN             0x3684
+#define PCI_DEVICE_ID_KUNLUN_VF          0x3685
+
 #define PCI_VENDOR_ID_INTEL              0x8086
 #define PCI_DEVICE_ID_INTEL_82378        0x0484
 #define PCI_DEVICE_ID_INTEL_82441        0x1237
-- 
2.25.1


