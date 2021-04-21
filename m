Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025263666C4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:10:19 +0200 (CEST)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ7w9-0006WN-Rp
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7ra-000197-Am; Wed, 21 Apr 2021 04:05:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rX-00028E-Pi; Wed, 21 Apr 2021 04:05:34 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FQCj65sBlztVWy;
 Wed, 21 Apr 2021 16:03:06 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:18 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 8/8] hw/i386/acpi-build: Add bypass_iommu check when
 building IVRS table
Date: Wed, 21 Apr 2021 08:05:03 +0000
Message-ID: <1618992303-19556-9-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
References: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

When building IVRS table, only devices which go through iommu
will be scanned, and the corresponding ivhd will be inserted.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fdb26682cb..71fb95737c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2229,7 +2229,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
-        if (bus) {
+        if (bus && !pci_bus_bypass_iommu(bus)) {
             pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
         }
     }
-- 
2.19.1


