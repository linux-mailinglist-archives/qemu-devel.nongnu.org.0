Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DCB332353
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:49:24 +0100 (CET)
Received: from localhost ([::1]:39810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZvV-0006W7-SU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lJZrt-0004Mv-R3; Tue, 09 Mar 2021 05:45:37 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:3602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lJZro-000630-Rc; Tue, 09 Mar 2021 05:45:37 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DvsJ50lpWz7kNc;
 Tue,  9 Mar 2021 18:43:33 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 18:45:12 +0800
To: <qemu-devel@nongnu.org>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
From: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [RFC RESEND PATCH 0/4] hw/arm/virt-acpi-build: Introduce iommu
 option for pci root bus
Message-ID: <3e354c2e-61cc-9d8f-886e-79f08a1f44f3@huawei.com>
Date: Tue, 9 Mar 2021 18:44:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=wangxingang5@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, everyone! Do you have any suggestions? Please help review these 
patches, thanks very much.

On 2021/2/27 16:33, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> These patches add support for configure iommu on/off for pci root bus,
> including primary bus and pxb root bus. At present, All root bus will go
> through iommu when iommu is configured, which is not flexible.
> 
> So this add option to enable/disable iommu for primary bus and pxb root bus.
> When iommu is enabled for the root bus, devices attached to it will go
> through iommu. When iommu is disabled for the root bus, devices will not
> go through iommu accordingly.
> 
> Xingang Wang (4):
>    pci: Add PCI_BUS_IOMMU property
>    hw/pci: Add iommu option for pci root bus
>    hw/pci: Add pci_root_bus_max_bus
>    hw/arm/virt-acpi-build: Add explicit idmap info in IORT table
> 
>   hw/arm/virt-acpi-build.c            | 92 +++++++++++++++++++++--------
>   hw/arm/virt.c                       | 29 +++++++++
>   hw/pci-bridge/pci_expander_bridge.c |  6 ++
>   hw/pci/pci.c                        | 35 ++++++++++-
>   include/hw/arm/virt.h               |  1 +
>   include/hw/pci/pci.h                |  1 +
>   include/hw/pci/pci_bus.h            | 13 ++++
>   7 files changed, 153 insertions(+), 24 deletions(-)
> 

