Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26508326C46
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 09:38:58 +0100 (CET)
Received: from localhost ([::1]:55340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFv7p-0008Of-6K
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 03:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3O-0004VP-Gi; Sat, 27 Feb 2021 03:34:22 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3J-0007vv-DR; Sat, 27 Feb 2021 03:34:22 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DnfsT48FRzjSGJ;
 Sat, 27 Feb 2021 16:32:29 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Feb 2021
 16:33:57 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC RESEND PATCH 0/4] hw/arm/virt-acpi-build: Introduce iommu option
 for pci root bus
Date: Sat, 27 Feb 2021 08:33:47 +0000
Message-ID: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 wangxingang5@huawei.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

These patches add support for configure iommu on/off for pci root bus,
including primary bus and pxb root bus. At present, All root bus will go
through iommu when iommu is configured, which is not flexible.

So this add option to enable/disable iommu for primary bus and pxb root bus.
When iommu is enabled for the root bus, devices attached to it will go
through iommu. When iommu is disabled for the root bus, devices will not
go through iommu accordingly.

Xingang Wang (4):
  pci: Add PCI_BUS_IOMMU property
  hw/pci: Add iommu option for pci root bus
  hw/pci: Add pci_root_bus_max_bus
  hw/arm/virt-acpi-build: Add explicit idmap info in IORT table

 hw/arm/virt-acpi-build.c            | 92 +++++++++++++++++++++--------
 hw/arm/virt.c                       | 29 +++++++++
 hw/pci-bridge/pci_expander_bridge.c |  6 ++
 hw/pci/pci.c                        | 35 ++++++++++-
 include/hw/arm/virt.h               |  1 +
 include/hw/pci/pci.h                |  1 +
 include/hw/pci/pci_bus.h            | 13 ++++
 7 files changed, 153 insertions(+), 24 deletions(-)

-- 
2.19.1


