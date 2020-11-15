Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C42B3FBF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 10:29:28 +0100 (CET)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keapD-0006v4-A7
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 04:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keaiq-0006of-NL; Mon, 16 Nov 2020 04:22:54 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keail-0004Ce-Cz; Mon, 16 Nov 2020 04:22:52 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZNrk53Ptz6xcC;
 Mon, 16 Nov 2020 17:22:30 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 17:22:36 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 08/13] AMDVI-PCI: put it into the 'misc' category
Date: Mon, 16 Nov 2020 02:48:58 +0800
Message-ID: <20201115184903.1292715-9-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201115184903.1292715-1-ganqixin@huawei.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ganqixin@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:22:43
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Gan Qixin <ganqixin@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The category of the AMDVI-PCI device is not set, put it into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/amd_iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 74a93a5d93..1d4e488f7f 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1621,6 +1621,13 @@ static const TypeInfo amdvi = {
     .class_init = amdvi_class_init
 };
 
+static void amdvi_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
 static const TypeInfo amdviPCI = {
     .name = TYPE_AMD_IOMMU_PCI,
     .parent = TYPE_PCI_DEVICE,
@@ -1629,6 +1636,7 @@ static const TypeInfo amdviPCI = {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
     },
+    .class_init = amdvi_pci_class_init
 };
 
 static void amdvi_iommu_memory_region_class_init(ObjectClass *klass, void *data)
-- 
2.23.0


