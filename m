Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920834FC1C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:04:42 +0200 (CEST)
Received: from localhost ([::1]:47434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRWmH-0000T1-9t
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lRWiU-0006Y8-CC; Wed, 31 Mar 2021 05:00:46 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lRWiJ-0004Lw-Od; Wed, 31 Mar 2021 05:00:45 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9KwX0zlmz1BFsX;
 Wed, 31 Mar 2021 16:58:20 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:00:17 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
From: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [PATCH RFC RESEND v2 0/6] Introduce IOMMU Option For PCI Root Bus
Message-ID: <43d4c60f-f290-8b6e-08ec-9974265b9f62@huawei.com>
Date: Wed, 31 Mar 2021 17:00:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangxingang5@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, everyone!

Do you have any suggestions about this iommu configuration feature?
Please help review these patches, thanks very much.

On 2021/3/25 15:22, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> These patches add support for configure iommu on/off for pci root bus,
> including primary bus and pxb root bus. At present, All root bus
> will go through iommu when iommu is configured, which is not flexible.
> 
> So this add option to enable/disable iommu for primary bus and pxb
> root bus.  When iommu is enabled for the root bus, devices attached to it
> will go through iommu. When iommu is disabled for the root bus, devices
> will not go through iommu accordingly.
> 
> The option example for iommu configuration is like the following:
> 
> primary root bus option:
> arm: -machine virt iommu=smmuv3,primary_bus_iommu=false(or true)
> x86: -machine q35,primary_bus_iommu=false(or true)
> 
> pxb root bus:
>   -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3.0x1,iommu=false
> 
> History:
> 
> v1 -> v2:
> - rebase on top of v6.0.0-rc0
> - Fix some issues
> - Took into account Eric's comments, and remove the PCI_BUS_IOMMU flag,
>    replace it with a property in PCIHostState.
> - Add support for x86 iommu option
> 
> Xingang Wang (6):
>    hw/pci/pci_host: Add iommu property for pci host
>    hw/pci: Add iommu option for pci root bus
>    hw/pci: Add pci_root_bus_max_bus
>    hw/arm/virt-acpi-build: Add explicit idmap info in IORT table
>    hw/i386/acpi-build: Add explicit scope in DMAR table
>    hw/i386/acpi-build: Add iommu filter in IVRS table
> 
>   hw/arm/virt-acpi-build.c            | 103 ++++++++++++++++++++++------
>   hw/arm/virt.c                       |  25 +++++++
>   hw/i386/acpi-build.c                |  70 ++++++++++++++++++-
>   hw/i386/pc.c                        |  19 +++++
>   hw/pci-bridge/pci_expander_bridge.c |   3 +
>   hw/pci-host/q35.c                   |   1 +
>   hw/pci/pci.c                        |  52 +++++++++++++-
>   hw/pci/pci_host.c                   |   2 +
>   include/hw/arm/virt.h               |   1 +
>   include/hw/i386/pc.h                |   1 +
>   include/hw/pci/pci.h                |   2 +
>   include/hw/pci/pci_host.h           |   1 +
>   12 files changed, 254 insertions(+), 26 deletions(-)
> 

