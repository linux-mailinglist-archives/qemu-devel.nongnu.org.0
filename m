Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088956E970A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:28:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVGq-0001iT-T2; Thu, 20 Apr 2023 10:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppVGo-0001bU-Ix
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:28:22 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppVGn-0007zm-2S
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:28:22 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2Kgs2C6Mz6J776;
 Thu, 20 Apr 2023 22:25:29 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 15:28:17 +0100
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 <linuxarm@huawei.com>
Subject: [PATCH 1/2] hw/pci-bridge: pci_expander_bridge fix type in
 pxb_cxl_dev_reset()
Date: Thu, 20 Apr 2023 15:27:49 +0100
Message-ID: <20230420142750.6950-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reproduce issue with

configure --enable-qom-cast-debug ...

qemu-system-x86_64 -display none -machine q35,cxl=on -device pxb-cxl,bus=pcie.0

  hw/pci-bridge/pci_expander_bridge.c:54:PXB_DEV: Object 0x5570e0b1ada0 is not an instance of type pxb
  Aborted

The type conversion results in the right state structure, but PXB_DEV is
not a parent of PXB_CXL_DEV hence the error. Rather than directly
cleaning up the inheritance, this is the minimal fix which will be
followed by the cleanup.

Fixes: 154070eaf6 ("hw/pxb-cxl: Support passthrough HDM Decoders unless overridden")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index ead33f0c05..a78327b5f2 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -311,7 +311,7 @@ static void pxb_cxl_dev_reset(DeviceState *dev)
      * The CXL specification allows for host bridges with no HDM decoders
      * if they only have a single root port.
      */
-    if (!PXB_DEV(dev)->hdm_for_passthrough) {
+    if (!PXB_CXL_DEV(dev)->hdm_for_passthrough) {
         dsp_count = pcie_count_ds_ports(hb->bus);
     }
     /* Initial reset will have 0 dsp so wait until > 0 */
-- 
2.37.2


