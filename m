Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73C3C683D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 03:50:10 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m37Yn-0001pT-DF
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 21:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caihuoqing@baidu.com>)
 id 1m37XY-0000rf-Jg
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 21:48:52 -0400
Received: from usmx01.baidu.com ([12.0.243.41]:54852 helo=baidu.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <caihuoqing@baidu.com>) id 1m37XT-0006Ez-GH
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 21:48:50 -0400
Received: from BC-Mail-Ex21.internal.baidu.com (unknown [172.31.51.15])
 by Forcepoint Email with ESMTPS id F10CC9B8F380A0779BE7;
 Mon, 12 Jul 2021 18:48:41 -0700 (PDT)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex21.internal.baidu.com (172.31.51.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.4; Tue, 13 Jul 2021 09:48:39 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.4; Tue, 13 Jul 2021 09:48:39 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>
Subject: [PATCH] vfio/pci: Change to use "vfio_pci_is"
Date: Tue, 13 Jul 2021 09:48:31 +0800
Message-ID: <20210713014831.742-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex22.internal.baidu.com (172.31.51.16) To
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

Since we don't have an encoding like the previous quirk,
we can use vfio_pci_is().

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 hw/vfio/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ab4077aad2..971273fd45 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3058,14 +3058,14 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
-    if (vdev->vendor_id == PCI_VENDOR_ID_NVIDIA) {
+    if (vfio_pci_is(vdev, PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID)) {
         ret = vfio_pci_nvidia_v100_ram_init(vdev, errp);
         if (ret && ret != -ENODEV) {
             error_report("Failed to setup NVIDIA V100 GPU RAM");
         }
     }
 
-    if (vdev->vendor_id == PCI_VENDOR_ID_IBM) {
+    if (vfio_pci_is(vdev, PCI_VENDOR_ID_IBM, PCI_ANY_ID)) {
         ret = vfio_pci_nvlink2_init(vdev, errp);
         if (ret && ret != -ENODEV) {
             error_report("Failed to setup NVlink2 bridge");
-- 
2.25.1


