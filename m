Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B076A6E970C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:28:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVGX-0001Ks-Rj; Thu, 20 Apr 2023 10:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppVGV-0001Jc-Ds
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:28:03 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppVGS-0007s7-F4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:28:03 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2KjB1NDxz67Nln;
 Thu, 20 Apr 2023 22:26:38 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 15:27:47 +0100
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 <linuxarm@huawei.com>
Subject: [PATCH 0/2] hw/pci-bridge: pci_expander_bridge: Fix wrong type and
 rework inheritance.
Date: Thu, 20 Apr 2023 15:27:48 +0100
Message-ID: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
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

Peter Maydell highlighted an incorrect conversion to TYPE_PXB_DEVICE from
a device that didn't have that a an ancestor type. PXB_DEV() used instead of
PXB_CXL_DEV()/

https://lore.kernel.org/qemu-devel/CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com/

During the discussion it became clear that the inheritance of the various
TYPE_PXB*_DEVICE was unusual. This patchset first provides the minimal
fix then cleans up the inheritance of types based on functionality.

There is also a rename to TYPE_PXB*_DEV to allow removal of some boilerplate.

Before this series
TYPE_PXB_DEVICE, TYPE_PXB_PCIE_DEVICE and TYPE_PXB_CXL_DEVICE all
had TYPE_PCI_DEVICE as their direct parent though they shared a common
struct PXBDev for their state.  As a result this state contained
some data that was irrelevant for some the types.

This series changes to
TYPE_PXB_CXL_DEV has a parent of TYPE_PXB_PCIE_DEV
TYPE_PXB_PCIE_DEV has a parent of TYPE_PXB_DEV
TYPE_PXB_DEV continues to have a parent of TYPE_PCI_DEVICE.

Each of the TYPE_PXB*_DEV has a state structure adding those elements
to their parent that they need. This also allowed dropping a wrapping
structure for the CXL state as the PXBCXLDev structure already provides
the equivalent grouping.

Patches are similar to those posted in the thread but rebased on v8.0.0.

Jonathan Cameron (2):
  hw/pci-bridge: pci_expander_bridge fix type in pxb_cxl_dev_reset()
  hw/pci-bridge: Make PCIe and CXL PXB Devices inherit from TYPE_PXB_DEV

 hw/acpi/cxl.c                       | 11 +++---
 hw/cxl/cxl-host.c                   |  4 +-
 hw/pci-bridge/pci_expander_bridge.c | 61 ++++++++++-------------------
 include/hw/cxl/cxl.h                |  4 +-
 include/hw/pci/pci_bridge.h         | 28 +++++++++----
 5 files changed, 50 insertions(+), 58 deletions(-)

-- 
2.37.2


