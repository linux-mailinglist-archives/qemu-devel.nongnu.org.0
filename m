Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336883C6DA7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:40:47 +0200 (CEST)
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EuE-0008A9-5x
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caihuoqing@baidu.com>)
 id 1m3Ere-0005TE-SR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:38:08 -0400
Received: from usmx01.baidu.com ([12.0.243.41]:43206 helo=baidu.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <caihuoqing@baidu.com>) id 1m3ErZ-0005TS-2J
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:38:03 -0400
Received: from BC-Mail-Ex25.internal.baidu.com (unknown [172.31.51.19])
 by Forcepoint Email with ESMTPS id 9E1A374B26F6BECACFFF;
 Tue, 13 Jul 2021 02:37:53 -0700 (PDT)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex25.internal.baidu.com (172.31.51.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.4; Tue, 13 Jul 2021 17:37:51 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.4; Tue, 13 Jul 2021 17:37:50 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2] vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI
 processor
Date: Tue, 13 Jul 2021 17:37:43 +0800
Message-ID: <20210713093743.942-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex06.internal.baidu.com (10.127.64.16) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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
v1->v2:
        *add the incorrect value and BAR size to comment
        *use vfio_pci_is instead of using an "encoding"
        *remove unused device id PCI_DEVICE_ID_KUNLUN

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 hw/vfio/pci.c            | 9 +++++++++
 include/hw/pci/pci_ids.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ab4077aad2..ad29fb4dff 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1499,6 +1499,15 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
         if (vdev->vendor_id == PCI_VENDOR_ID_CHELSIO &&
             (vdev->device_id & 0xff00) == 0x5800) {
             msix->pba_offset = 0x1000;
+        /*
+         * BAIDU KUNLUN Virtual Function devices are encoded as 0x3685 for
+         * KUNLUN AI processor. The KUNLUN hardware returns an incorrect
+         * value of 0x460000 for the VF PBA offset while the BAR itself 0x10000.
+         * The correct value is 0xb400.
+         */
+        } else if (vfio_pci_is(vdev, PCI_VENDOR_ID_BAIDU,
+                   PCI_DEVICE_ID_KUNLUN_VF)) {
+            msix->pba_offset = 0xb400;
         } else if (vdev->msix_relo == OFF_AUTOPCIBAR_OFF) {
             error_setg(errp, "hardware reports invalid configuration, "
                        "MSIX PBA outside of specified BAR");
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 5c14681b82..11abe22d46 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -227,6 +227,9 @@
 #define PCI_VENDOR_ID_FREESCALE          0x1957
 #define PCI_DEVICE_ID_MPC8533E           0x0030
 
+#define PCI_VENDOR_ID_BAIDU              0x1d22
+#define PCI_DEVICE_ID_KUNLUN_VF          0x3685
+
 #define PCI_VENDOR_ID_INTEL              0x8086
 #define PCI_DEVICE_ID_INTEL_82378        0x0484
 #define PCI_DEVICE_ID_INTEL_82441        0x1237
-- 
2.25.1


