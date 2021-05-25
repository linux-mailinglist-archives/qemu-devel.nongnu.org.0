Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D838F909
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:54:20 +0200 (CEST)
Received: from localhost ([::1]:53446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llO95-0007oh-Hk
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5M-0006QF-HL; Mon, 24 May 2021 23:50:28 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5I-0001s1-An; Mon, 24 May 2021 23:50:28 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fq0QT6H27zwTKP;
 Tue, 25 May 2021 11:47:29 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 11:50:11 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 11:50:11 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v4 0/8] IOMMU: Add support for IOMMU Bypass Feature
Date: Tue, 25 May 2021 03:49:57 +0000
Message-ID: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

These patches add support for configure bypass_iommu on/off for
pci root bus, including primary bus and pxb root bus. At present,
all root bus will go through iommu when iommu is configured,
which is not flexible, because in many situations the need for using
iommu and bypass iommu aften exists at the same time.

So this add option to enable/disable bypass_iommu for primary bus
and pxb root bus. The bypass_iommu property is set to false default,
meaning that devcies will go through iommu if no explicit configuration
is added. When bypass_iommu is enabled for the root bus, devices
attached to it will bypass iommu, otherwise devices will go through
iommu.

This feature can be used in this manner:
arm: -machine virt,iommu=smmuv3,bypass_iommu=true
x86: -machine q35,bypass_iommu=true
pxb: -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,bypass_iommu=true 

History:

v3 -> v4:
- simplify the logic in building the IORT idmap

v2 -> v3:
- rebase on top of v6.0.0-rc4
- Took into account Eric's comments, replace with a bypass_iommu
  proerty 
- When building the IORT idmap, cover the whole RID space

v1 -> v2:
- rebase on top of v6.0.0-rc0
- Fix some issues
- Took into account Eric's comments, and remove the PCI_BUS_IOMMU flag,
  replace it with a property in PCIHostState.
- Add support for x86 iommu option

Xingang Wang (8):
  hw/pci/pci_host: Allow bypass iommu for pci host
  hw/pxb: Add a bypass iommu property
  hw/arm/virt: Add a machine option to bypass iommu for primary bus
  hw/i386: Add a pc machine option to bypass iommu for primary bus
  hw/pci: Add pci_bus_range to get bus number range
  hw/arm/virt-acpi-build: Add explicit IORT idmap for smmuv3 node
  hw/i386/acpi-build: Add explicit scope in DMAR table
  hw/i386/acpi-build: Add bypass_iommu check when building IVRS table

 hw/arm/virt-acpi-build.c            | 135 ++++++++++++++++++++++++----
 hw/arm/virt.c                       |  26 ++++++
 hw/i386/acpi-build.c                |  70 ++++++++++++++-
 hw/i386/pc.c                        |  18 ++++
 hw/pci-bridge/pci_expander_bridge.c |   3 +
 hw/pci-host/q35.c                   |   1 +
 hw/pci/pci.c                        |  33 ++++++-
 hw/pci/pci_host.c                   |   2 +
 include/hw/arm/virt.h               |   1 +
 include/hw/i386/pc.h                |   1 +
 include/hw/pci/pci.h                |   2 +
 include/hw/pci/pci_host.h           |   1 +
 12 files changed, 270 insertions(+), 23 deletions(-)

-- 
2.19.1


