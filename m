Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB032A105
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:35:14 +0100 (CET)
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5BB-0002RD-6f
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1lH59c-0000jC-JU; Tue, 02 Mar 2021 08:33:37 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1lH59X-0002Tx-ED; Tue, 02 Mar 2021 08:33:36 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DqdMc0VxszjTHF;
 Tue,  2 Mar 2021 21:31:56 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Mar 2021 21:33:12 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] lsilogic: Use PCIDevice::exit instead of
 DeviceState::unrealize
Date: Tue, 2 Mar 2021 21:30:16 +0800
Message-ID: <20210302133016.1221081-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=liangpeng10@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, qemu-stable@nongnu.org,
 xiexiangyou@huawei.com, liangpeng10@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCI_DEVICE has overwritten DeviceState::unrealize (pci_qdev_unrealize).
However, LSI53C895A, which is a subclass of PCI_DEVICE, overwrites it
again and doesn't save the parent's implementation so the PCI_DEVICE's
implementation of DeviceState::unrealize will never be called when
unrealize a LSI53C895A device.  And it will lead to memory leak and
unplug failure.

For a PCI device, it's better to implement PCIDevice::exit instead of
DeviceState::unrealize.  So let's change to use PCIDevice::exit.

Fixes: a8632434c7e9 ("lsi: implement I/O memory space for Memory Move instructions")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 hw/scsi/lsi53c895a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 7d13c7dc1c46..af46c62f0d78 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -2312,7 +2312,7 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
     scsi_bus_new(&s->bus, sizeof(s->bus), d, &lsi_scsi_info, NULL);
 }
 
-static void lsi_scsi_unrealize(DeviceState *dev)
+static void lsi_scsi_exit(PCIDevice *dev)
 {
     LSIState *s = LSI53C895A(dev);
 
@@ -2325,11 +2325,11 @@ static void lsi_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->realize = lsi_scsi_realize;
+    k->exit = lsi_scsi_exit;
     k->vendor_id = PCI_VENDOR_ID_LSI_LOGIC;
     k->device_id = PCI_DEVICE_ID_LSI_53C895A;
     k->class_id = PCI_CLASS_STORAGE_SCSI;
     k->subsystem_id = 0x1000;
-    dc->unrealize = lsi_scsi_unrealize;
     dc->reset = lsi_scsi_reset;
     dc->vmsd = &vmstate_lsi_scsi;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-- 
2.29.2


